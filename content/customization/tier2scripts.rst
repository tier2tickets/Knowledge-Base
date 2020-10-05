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
attachment. For exmaple, give this a try.

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


custom.css (alpha)
------------------

While CSS is not technically a scripting language, since it is `Turing Complete <https://stackoverflow.com/a/5239256/3238695>`_ then perhaps it belongs here too.
The layout and colors in the GUI of the desktop application are dictated by CSS. The CSS which controls most of the look and feel of the GUI is located at "C:\\Program Files (x86)\\Tier2Tickets\\resources\\style.css" in most cases.
The classes and variables in that file can be overridden by your own settings by putting them in a file named "custom.css" and uploading it as a script. As an example, here is a custom.css file which would make the GUI lime-green and terrible:

Please note that the custom.css feature is considered to be an alpha release and the class names and variable names are subject to change without notice.
If you rely on this feature, make sure to check that no breaking changes have been implemented before deploying new future versions to production.

.. code-block:: css

   @const hdb_green: #de69ac; 
   @const hdb_greendark: #e591c1; 
   @const hdb_black: #d8d8d8;
   @const hdb_red: #14a8a8; 
   @const hdb_teal: #f2804d; 
   @const hdb_tealdark: #ffb38e;
   @const hdb_grey: #0dfd0d;
   @const hdb_greydark: #848484;
   @const hdb_white: #00f000;