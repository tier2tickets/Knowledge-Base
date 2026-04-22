## Identity Provider

As of version [1.1.12](https://docs.tier2tickets.com/content/general/changelog/#1.1.12) the fields in the GUI are automatically populated by pulling the information from the computer root LDAP provider (in the case of Microsoft Active Directory, Microsoft Exchange, or Novell Directory Services) or from Azure Active Directory. But this functionality can be extended or modified to make use of any data source by overriding the default identity provider with your own custom provider. To accomplish this, copy or download identity_provider.ps1 provided below,  (you can also find this file in your installation folder Typically “C:\Program Files (x86)\Tier2Tickets”) and modify it to use your custom identity provider, and then upload it to the [tier2scripts](https://docs.tier2tickets.com/content/automations/tier2scripts/) portion of our account portal. (make sure to maintain the filename: identity_provider.ps1). A typical use-case for overriding the default identity-provider is for integrating with Enterprise Single Sign On applications or 3rd-party LDAP solutions such as OpenLDAP.



This is the default script

```powershell
$ErrorActionPreference= 'silentlycontinue'

$output = @{
	name = '';
	email = '';
	businessName = '';
	phoneBusiness = '';
	PhoneCell = '';
}

# first try to get all of the info from LDAP
if ((Get-WmiObject -Class Win32_ComputerSystem).PartOfDomain){
	try {
		$UserPrincipalName = ([ADSI]"LDAP://<SID=$([System.Security.Principal.WindowsIdentity]::GetCurrent().User.Value)>").UserPrincipalName
		$query_result = Get-WmiObject -namespace "root/directory/ldap" -query "select DS_company,DS_telephoneNumber,DS_mobile,DS_name,DS_mail from ds_user where DS_userPrincipalName='$UserPrincipalName'" 

		if (-Not $output['PhoneCell']){$output['PhoneCell'] = $query_result.DS_mobile}
		if (-Not $output['name']){$output['name'] = $query_result.DS_name}
		if (-Not $output['email']){$output['email'] = $query_result.DS_mail}
		if (-Not $output['businessName']){$output['businessName'] = $query_result.DS_company}
		if (-Not $output['phoneBusiness']){$output['phoneBusiness'] = $query_result.DS_telephoneNumber}
	} catch {}
}

# on failure, try and get it from Azure Active Directory Authentication Library
if (-Not $output['name'] -Or -Not $output['businessName'] -Or -Not $output['email']){
 	try {
 		$ADAL = Get-ItemProperty -Path "HKCU:\Software\Microsoft\Office\*\Common\ServicesManagerCache\Identities\*_ADAL\*" -ErrorAction SilentlyContinue | Select -First 1
		if (-Not $output['name']){try {$output['name'] = $ADAL.ConnectionUserDisplayName} catch {}}
		if (-Not $output['businessName']){try {$output['businessName'] = $ADAL.TenantDisplayName} catch {}}
		if (-Not $output['email']){try {$output['email'] = $ADAL.ConnectionUserUpn} catch {}}
	} catch {}
}

# on failure, try to get the name and email from outlook
if (-Not $output['name'] -Or -Not $output['email']){
	try {
		$outlook = Get-ItemProperty -Path  "hkcu:\Software\Microsoft\Office\*\Outlook\Profiles\Outlook\9375CFF0413111d3B88A00104B2A6676\*" -ErrorAction SilentlyContinue
		if (-Not $output['name']) {$output['name'] = ($outlook | Where "Display Name" | Where "Display Name" -notlike -Value "*@*.*" | select -first 1)."Display Name"}
		if (-Not $output['email']) {$output['email'] = ($outlook | Where "Email" | select -first 1)."Email"}
		if (-Not $output['email']) {$output['email'] = ($outlook | Where "Account Name" | Where "Account Name" -like -Value "*@*.*" | select -first 1)."Account Name"}
	} catch {}
}

# if we don't have the name yet, it might be on local user account
if (-Not $output['name']) {
	try {
		$output['name'] = (Get-WMIObject win32_useraccount | where {$_.caption -match $env:USERNAME} | select fullname).fullname
	} catch {}
}

# As a last resort we can try and get the business name from the PC Registered Owner fields in the registry
if (-Not $output['businessName']){try {$output['businessName'] = (Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion" -Name "RegisteredOrganization" -ErrorAction SilentlyContinue).RegisteredOrganization} catch {}}

$output | ConvertTo-JSON
```

Each portion has a comment describing what it does. As it is written, the code that runs first has a higher priority. So you could, for instance, move the Azure AD portion below the Outlook check if you have more confidence that Outlook will provide the correct email than Azure AD.


### Test script

Here is another script that will help you find what email addresses are on a particular machine and where it was found. 

```powershell
$results = @()

# 1. LDAP
try {
    # Simulate pulling from LDAP
    $ldap_email = ([ADSI]"LDAP://<SID=$([System.Security.Principal.WindowsIdentity]::GetCurrent().User.Value)>").mail
    if ($ldap_email) {
        $results += [PSCustomObject]@{Source='LDAP'; Email=$ldap_email}
    }
} catch {}

# 2. ADAL
try {
    $ADAL = Get-ItemProperty -Path "HKCU:\Software\Microsoft\Office\*\Common\ServicesManagerCache\Identities\*_ADAL\*" -ErrorAction SilentlyContinue | Select -First 1
    $adal_email = $ADAL.ConnectionUserUpn
    if ($adal_email) {
        $results += [PSCustomObject]@{Source='ADAL'; Email=$adal_email}
    }
} catch {}

# 3. Outlook
try {
    $outlook = Get-ItemProperty -Path  "hkcu:\Software\Microsoft\Office\*\Outlook\Profiles\Outlook\9375CFF0413111d3B88A00104B2A6676\*" -ErrorAction SilentlyContinue
    $outlook_email = ($outlook | Where-Object { $_."Email" }) | Select-Object -ExpandProperty "Email" -First 1
    if ($outlook_email) {
        $results += [PSCustomObject]@{Source='Outlook'; Email=$outlook_email}
    } else {
        $alt_email = ($outlook | Where-Object { $_."Account Name" -like "*@*.*" }) | Select-Object -ExpandProperty "Account Name" -First 1
        if ($alt_email) {
            $results += [PSCustomObject]@{Source='Outlook'; Email=$alt_email}
        }
    }
} catch {}

# Output all found sources with emails
$results | Format-Table -AutoSize
```

## Identity JSON

We save the information from the last ticket submission per user in a file located at ```%Appdata%\Tier2tickets\tier2tickets.json```. 

It is in a similar format to the information in the script. If you need to clear or set the prepopulated data or when loading the software, this is where you do it. If you remove the file, the Identity Provider will run to gather information until the next time a successful ticket is submitted.

