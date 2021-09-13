Is a Helpdesk Button Connected?
=============

Thanks to Mendy Green for sharing this script with the v-helpdeskbuttons-com channel on the `mspGeek slack community <https://join.slack.com/t/mspgeek/shared_invite/zt-lrsy70xt-ICcLYnavbDevoDzrqlMWKQ>`_!

This PowerShell that will return SUCCESS, FAIL, or WARNING based on specific Tier 2 Tickets conditions.

In the event the software is detected but the button is MISSING the result will return a "FAIL", in all other conditions (the software is not installed, or no button and no software is installed) it will return a SUCCESS

```%SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe -noprofile -command "& { $buttonStatus=if((gwmi win32_keyboard -ErrorAction SilentlyContinue)|?{$_.PNPDeviceID -like 'USB\VID_05AC&PID_020B*'}){\"Help Desk Button Detected\"}else{\"No Help Desk Button Detected\"};$applicationStatus=if(${env:ProgramFiles(x86)}){Get-Item \"${env:ProgramFiles(x86)}\Helpdesk Button\" -ErrorAction SilentlyContinue}else{Get-Item \"$env:ProgramFiles\Helpdesk Button\" -ErrorAction SilentlyContinue};if ($buttonStatus -eq 'No Help Desk Button Detected' -and $null -ne $applicationStatus){\"FAIL\"} else {\"SUCCESS\"} }"```

In the event the software is NOT found but the button is DETECTED the result will return a "WARNING ". We used this to trigger an automatic install of the T2T software when a button is connected.

```%SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe -noprofile -command "& { $buttonStatus=if((gwmi win32_keyboard -ErrorAction SilentlyContinue)|?{$_.PNPDeviceID -like 'USB\VID_05AC&PID_020B*'}){\"Help Desk Button Detected\"}else{\"No Help Desk Button Detected\"};$applicationStatus=if(${env:ProgramFiles(x86)}){Get-Item \"${env:ProgramFiles(x86)}\Helpdesk Button\" -ErrorAction SilentlyContinue}else{Get-Item \"$env:ProgramFiles\Helpdesk Button\" -ErrorAction SilentlyContinue};if ($buttonStatus -eq 'Help Desk Button Detected' -and $null -eq $applicationStatus){\"WARNING\"} else {\"SUCCESS\"} }"```

Yes this could probably be made prettier and condensed into a single monitor/powershell run but due to Labtech intricacies with how remote monitors work we wanted it two independent monitors

The specific part that's checking for the Help Desk USB Device being attached is 

`gwmi win32_keyboard -ErrorAction SilentlyContinue)|?{$_.PNPDeviceID -like 'USB\VID_05AC&PID_020B*'}``

You may have to change the PNPDeviceID which can be checked by querying a computer that has the model button you use primarily.
