# Version Numbers

As anyone who has used the platform extensively knows; we custom-build your MSI installers using your own custom settings, scripts, and branding. This has led to some interesting challenges with version numbers and Windows Installer.

When we started, we used version numbers in the following format: major.minor.patch.build. This is the standard way version numbers work and even has an official standard called “Semantic Versioning”. It is with great distress that we had to break from that standard. The problem lies in the fact that windows installer service acts funky with that last number. If you have version 1.2.3.4 of software-X installed and then try to install version 1.2.4.0, then windows installer will perform an upgrade and you will now have version 1.2.4.0 and not 1.2.3.4 installed as would be expected. BUT! If you have version 1.2.3.4 of software-X installed and then try to install version 1.2.3.9, then windows installer will install the new software alongside the other version and you will now have two versions of the software installed; 1.2.3.4 and 1.2.3.9.

Our software can’t be distributed like normal software; we can’t just put up the official versions on a download page somewhere. Each build is unique to you. It has your custom logos settings and scripts, so there is no “official version”. Our plan from the beginning was to use the first 3 numbers of the version to ourselves and increment the last one for each of your custom builds. So, for example, we would release version 1.2.3 and when you build against that version, you would get 1.2.3.1 and next time your build against that version you would get 1.2.3.2, then 1.2.3.3, etc.… It’s the logical way to handle things.

But since we can’t do that, we are instead taking that last number and swapping it for the second-last. Now we release versions like 1.2.x.3 and your builds end up like 1.2.1.3, and then 1.2.2.3, and then 1.2.3.3. It’s a weird way to implement version numbers, but it was the only option to prevent windows installer from misinterpreting our intentions and still give you the flexibility to build same-version upgradable packages that can be deployed without first having to uninstall the previous version.



You can use the endpoint https://account.helpdeskbuttons.com/version to get the versions available for building and  https://account.helpdeskbuttons.com/version?userid={USERID} to compare those versions to your own.

