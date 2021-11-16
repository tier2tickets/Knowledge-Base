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


Example install.ps1 Scripts
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

We recommend using inline parameters for customizing the name of the tier2tickets desktop shortcut, but if you want to 
customize this shortcut for installs that come via Helpdesk Button extended press this would work.

Update Shortcut Icons on Install
""""""""""""""""""""""""""""""""""""""

.. code-block:: shell

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

Run Software on Install
""""""""""""""""""""""""""""""""""""""

This is an script that will allow you to add an executable into the install chain of HDB. It should work with any exe file, but Windows prevents multiple MSI files from running simultaneously. You can use this script for either a url or local file (including a file packaged with the scripts)

.. code-block:: shell

    #########################install.ps1############################################
    #
    # This is an script that will allow you to add an executable into the install 
    # chain of HDB. This script can either run a local executable file or download 
    # and run a file via URL.
    #
    #  - For a file hosted on the web: set $url_or_local = "url" and put the url in
    #    the file location variable
    #
    #  - For a local file: add the executable to the zip along with this ps1 file,
    #    set $url_or_local = "local" and set the $file_location as the path to the 
    #    executable
    #
    ################################################################################
    ############################ EDIT YOUR SETTINGS HERE ###########################

    $url_or_local = "url"
    $file_location = "PUT_URL_HERE"
    $args = @("/s")

    ########################### DO NOT EDIT BELOW THIS LINE ########################

    if($url_or_local -eq "local") {
       Start-Process -Filepath $file_location -ArgumentList $args
    }
    else {
      $outpath = "$PSScriptRoot/myexe.exe"
      $wc = New-Object System.Net.WebClient
      $wc.DownloadFile($file_location, $outpath)
      Start-Process -Filepath $PSScriptRoot/myexe.exe -ArgumentList $args
    }

    exit 0
    
For instance if you have a ninite installer executable "ninite.exe" you can edit the script by following these steps

   - set $url_or_local to "local"
   - set $file_location to "ninite.exe"
   - set $args @("/repair")
   - Now upload both files into our tier2scripts. Every install of the tier2tickets software should launch this ninite installer and   make sure the applications are installed and up-to-date. Make sure to rebuild your MSI to include the new files in the installer. 

identity_provider.ps1
---------------------

You can customize the command that populates the name and email fields for each user. We have further documentation 
explaining how this script works  :ref:`here <content/customization/identity-provider:Identity Provider>`

.. _1.1.12: https://docs.tier2tickets.com/content/general/changelog/#1.1.12