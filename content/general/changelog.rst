Change Log
==========
Here is a running change-log of the website and the software.



Website
-------



2020-02-07
~~~~~~~~~~
* Implemented new 99.99% uptime guarantee `SLA <https://www.helpdeskbuttons.com/sla/>`_
* Added Geo IP Whitelisting
* Added Anonymous IP login Blocking
* Added Breached Password Protection
* Device list is now sortable and searchable
* Added an Account Settings widget to Settings and Home pages
* Added Copy MSI URL to Builds page.
* Improvements to 2fa new user registration process
* Added "Remember This Computer" on the 2fa login
* Added Get started documentation
* Building a new installer has been sped up by a factor of 20
* Append to Private Note through our update to Advanced Options / :ref:`Custom Rules <content/integration/advanced:custom rules>`.



2019-12-09
~~~~~~~~~~
* Added better documentation throughout the site
* Added helpful links to the ticket report page

2019-11-25
~~~~~~~~~~
* Added support for custom rules in the advanced integration configuration
* Added the ability to test integration against each of dev/beta/stable branch

2019-10-02
~~~~~~~~~~
* Added support for arbitrary file uploads by custom scripts.

2019-09-18
~~~~~~~~~~
* Added an anti-virus scanner for payload uploads

2019-09-17
~~~~~~~~~~
* Added support for :ref:`auto update <content/deployment/auto-update:Auto Update>`.




Software
--------




.. raw:: html

   <a name="0.6.10">&nbsp;</a>

0.6.x.10
~~~~~~~

* Added support for new Tier2Assist and Tier2Forms features







.. raw:: html

   <a name="0.6.7">&nbsp;</a>

0.6.x.7
~~~~~~~

* Fixed bug in which getting the last logged in user caused high CPU load on domain controllers
* Fixed bug in which duplicate macs were created when the software is installed on hyper-v
* Fixed bug in which the software would launch twice on a single button press on terminal servers in which there are two open sessions of the same username
* Added GUI support for client-side custom rules





.. raw:: html

   <a name="0.6.3">&nbsp;</a>

0.6.x.3
~~~~~~~

* Fixed more issues with windows scaling Thanks `@chavousc <https://github.com/tier2tickets/Feedback/issues/56>`_
* Fixed bug where business name validation error message would trigger before the user even entered business name
* Fixed issue where webroot would cause animation not to upload
* Improved debug logging on failed diag data collection.
* increased performance of the remote access tool.





.. raw:: html

   <a name="0.6.2">&nbsp;</a>

0.6.x.2
~~~~~~~

* Added support accepting push commands
* Fixed UI issues with windows scaling





.. raw:: html

   <a name="0.6.1">&nbsp;</a>

0.6.x.1
~~~~~~~

* Added support for remote command prompt






.. raw:: html

   <a name="0.5.7">&nbsp;</a>

0.5.x.7
~~~~~~~

* Added more customizable text on main gui page

* Added the ability to remove button and text from the left side of the gui page







.. raw:: html

   <a name="0.5.6">&nbsp;</a>

0.5.x.6
~~~~~~~

* Added button to do stuff on the the left side of the GUI main page.








.. raw:: html

   <a name="0.5.5">&nbsp;</a>

0.5.x.5
~~~~~~~

* Added the ability to put in a ticket using a QR code on internet outage.

* Optimized the GUI to launch a little faster on button press.

* Bug fixes










.. raw:: html

   <a name="0.5.4">&nbsp;</a>

0.5.x.4
~~~~~~~

* Added support for the following new information in the report: device errors, windows update list, disk smart errors, recent BSOD info, OS build number









.. raw:: html

   <a name="0.5.3">&nbsp;</a>

0.5.x.3
~~~~~~~

* Fixed phone number validation for the UK
* Made phone number validation less bad for the rest of the world










.. raw:: html

   <a name="0.5.2">&nbsp;</a>

0.5.x.2
~~~~~~~

* Added support for very large monitor configs (up to 5 4k monitors)
* CPU and memory improvements for screen captures
* Auto-Skipping of company info screen if name/email is the same as last time
* The error page gives detailed error information





.. raw:: html

   <a name="0.4.9">&nbsp;</a>

0.4.x.9
~~~~~~~

* Fixed issue where scrolling up and down quickly would cause very high CPU spike in buttonhelper.exe




.. raw:: html

   <a name="0.4.8">&nbsp;</a>

0.4.x.8
~~~~~~~

* Made uploads more robust by handling situations where the files to be uploaded are in use by an AV scan.
* Made the software clear the upload folder on program exit. This should help address permissions issues




.. raw:: html

   <a name="0.4.7">&nbsp;</a>

0.4.x.7
~~~~~~~

* Changed "Problem Description" page to say "Problem/Request Description"






.. raw:: html

   <a name="0.4.6">&nbsp;</a>

0.4.x.6
~~~~~~~

* Fixed a bug where Unicode-only string would crash the GUI. Thanks `@litigationjackson <https://github.com/tier2tickets/Feedback/issues/48>`_





.. raw:: html

   <a name="0.4.5">&nbsp;</a>

0.4.x.5
~~~~~~~

* Fixed a bug where non-admins would get buttonhelper error at log on.
* Fixed a possible race condition when writing to log file




.. raw:: html

   <a name="0.4.4">&nbsp;</a>

0.4.x.4
~~~~~~~

* Added support for :ref:`auto update <content/deployment/auto-update:Auto Update>`.




.. raw:: html

   <a name="0.4.3">&nbsp;</a>

0.4.x.3
~~~~~~~

* Added support international phone number validation
* Added support for :ref:`content/privacy/customer-owned:Customer-Owned AWS Buckets`.




.. raw:: html

   <a name="0.3.28">&nbsp;</a>

0.3.x.28
~~~~~~~~

* bug fixes




