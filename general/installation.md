# Software Installation Guide

The software is packaged as an MSI which you build on the custom builds page. It supports all the typical command line options of an MSI for example:



The following command would install the software with minimal user interface visible to the user and no cancel button and then reboot the computer. 

```
msiexec /i buttonInst.msi /passive
```



The following would install the software with no user interface and would not reboot the computer.

```
msiexec /i buttonInst.msi /quiet /norestart
```



We have some command line options that would allow you to customize settings specific to our software. If you install the software the GUI way, but just running it with no options you will see that we offer the ability to bind the software to a F-Key so that pressing that key launches the app. We also have command line options to allow the same. If you wanted to bind the program to F4, for example, you would use use the following command line param.

```
WRAPPED_ARGUMENTS="/launchkey=4"
```



You can also customize the name of the desktop icon. By default, it is named "Helpdesk Button" but if you wanted to have the icon named "PC Solutions Support", this would get you there.

```
WRAPPED_ARGUMENTS="/iconname=""PC Solutions Support"""
```



Putting those things together, you would end up with a command like this:

```
msiexec /i "buttonInst.msi" WRAPPED_ARGUMENTS="/launchkey=4 /iconname=""PC Solutions Support"""
```



Make sure you are aware that this reboots the computer! Don't push out that command en mass during business hours. A better option during business hours is as follows.

```
msiexec /i "buttonInst.msi" /norestart WRAPPED_ARGUMENTS="/launchkey=4 /iconname=""PC Solutions Support"""
```



You would still need to reboot after hours though, the software does actually need a reboot most of the time.