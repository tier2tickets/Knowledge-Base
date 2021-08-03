Connectwise Automate Instructions
==================================

This guide will show you how to set up deployment for a build of Helpdesk Button Software through Connectwise Automate. You will need an administrative login for Automate.

Create a Script
----------------

This script will be run on individual machines as that gives the most flexibility. Our custom generated Powershell script can be downloaded from the site directly on the Builds page.
This guide assumes it has beed downloaded and placed somewhere in the LTShare\Transfer directory.

Click New -> Script

.. image:: images/CW01-Script.png

Select the Location to add the script and click next.

.. image:: images/CW02-Location.png

Name the script, add a note if you like, make sure the target is Computer, set the first condition to true.

.. image:: images/CW03-NewScript.png

Add a new command and select File Download. Set the Local File line to the location of the script and the destination to wherever you like on the endpoint machine. 

we use:

.. code-block:: bash
 
	%tempdir%\HelpdeskButton-deploy.ps1

.. image:: images/CW04-Download.png

Add a Process Execute command.

We are using the PowerShell deployment script so we will execute it with PowerShell.

.. code-block:: bash

	C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe

we use the arguments:

.. code-block:: bash 

	-ExecutionPolicy bypass "%tempdir%\HelpdeskButton-deploy.ps1"

make sure to put the directory you specified in the destination above.

.. image:: images/CW05-Execute.png

We add like to check on these from time to time so we have the script log its actions.

.. code-block:: bash
 
	%shellresult%

.. image:: images/CW06-AddLog.png

To enable the log you need to add this Global Variable

.. code-block:: bash
 
	@ScriptEngineEnableLogger@   True

.. image:: images/CW07-EnableLog.png

Finally Save the Script and you are done! Here is what it looks like completed.

.. image:: images/CW08-Done.png


Deployment of the script
------------------------

Select Browse from the main bar on the left, then the Groups tab.

Select the group to which you want to Deploy the software, right click and highlight scripts. Navigate to the location the script is in and select it.

.. image:: images/CW09-Group.png

The group we chose for this example was Windows Desktops

We recommend having the script run at least daily, but make sure to click Advanced Settings and Stagger the script. Automate will attempt to run them all simultaneously if not.

Click OK.

.. image:: images/CW10-Deployment.png

You should now have automated deployment of our software through Connectwise Automate.