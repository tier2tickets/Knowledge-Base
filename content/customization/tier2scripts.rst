Tier2Scripts
==============

All your scripts can be packaged into a zip file as well as any exe's that your scripts need to run. When the 
software is launched, it looks for anything matching the name \_exec_*.ps1. Whatever matches that name will be run 
asynchronously.

Each script will start with a working directory of the extracted payload, so any helper exe's you have in your payload 
zip file will be sitting right there with it. There is an "upload" folder which is where the output of your scripts need 
to go. The location of this upload folder is stored in an environment variable named "_uploadDir". You can save any log 
files or script output into that upload folder and it will get sent in to be available inside the report.

Be advised: The upload folder is cleared as the software is started to make sure the data pertains to the current submission.

_append.txt
-----------

We have a special approach which allows your script 
output to be appended to the text of the report itself. It works like this: you need to save the output as a ascii or 
utf-8 text file named \*_append.txt in the upload folder. The text therein will be appended to the ticket body. You 
can make as many of these \*_append.txt files as you like and they will all be appended.

Putting all that together, give this a try. Add a file named _exec_test.ps1 to your payload.zip with this file content:

.. code-block:: powershell

   echo "Hello World" > $Env:_uploadDir\example_append.txt



You should find that this appends the "Hello World" text to your report.
Now replace the "Hello World" with whatever data you want to collect and you should be good to go.

Uploads
-------

General file uploads are supported as well. Any file that is put into the upload folder will be added to the report as an
attachment. For example, give this a try.

.. code-block:: powershell

   echo "Hello World!" > $Env:_uploadDir\example.txt

This attaches the file 'example.txt' to the report for download. In this case we created the file with the script,
but you could, of course, use the script to copy a file that was already on the computer into
the uploads folder for attachment.

install.ps1
-----------

Additionally, we have an option for triggering a script that runs during install. Just add a file named 'install.ps1' to
the root of your payload zip and `rebuild the MSI <https://account.helpdeskbuttons.com/builds.php>`_. This script will run
once as the very last step of the install process. It's useful for deploying your RMM using the button software.

Since holding down the physical buttons will always trigger a download of your latest built MSI, the install.ps1 option
is useful for deploying software to computers just by handing out the buttons and telling people to hold down to install.

NOTE: make sure that the script returns! If your script gets stuck, waiting on user input for example, then the installer
will never complete.


Example install.ps1 Script
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

We recommend using inline parameters for customizing the name of the tier2tickets desktop shortcut, but if you want to 
customize this shortcut for installs that come via helpdesk button extended press this would work.

Update Shortcut Icons on Install
""""""""""""""""""""""""""""""""""""""

.. code-block:: powershell

	#########################install.ps1############################################
	#
	# This is an install script that will allow you to change the default shortcut 
	# name
	# 
	#
	################################################################################

	############################ EDIT YOUR SETTINGS HERE ###########################

	$iconName = 'My Helpdesk.lnk'


	############################# DONT EDIT BEYONE HERE ############################

	[IO.FileInfo] $foo =  'C:\Users\Public\Desktop\Helpdesk Button.lnk'
	if($foo.Exists){
		Rename-Item 'C:\Users\Public\Desktop\Helpdesk Button.lnk' $iconName
	}

	exit 0
	
Make sure to change the iconName to something more fitting than *My Helpdesk.lnk*

identity_provider.ps1
---------------------

As of version 1.1.12_ the fields in the gui are automatically populated by pulling the information from the computer root LDAP provider
(in the case of Microsoft Active Directory, Microsoft Exchange, or Novell Directory Services) or from Azure Active Directory.
But this functionality can be extended or modified to make use of any data source by overriding the default identity provider with your own
custom provider. To accomplish this, copy identity_provider.ps1 from the program installation directory
(Typically "C:\Program Files (x86)\Tier2Tickets") and modify it to use your custom identity provider, and then upload it to the tier2scripts
portion of our account portal. (make sure to maintain the filename: identity_provider.ps1). A typical use-case for overriding the default 
identity-provider is for integrating with Enterprise Single Sign On applications or 3rd-party LDAP solutions such as OpenLDAP.

.. _1.1.12: https://docs.tier2tickets.com/content/general/changelog/#1.1.12