Change Log
==========
Here is a running change-log of the website and the software.



Website
-------

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



deviceErrors
updateList
diskErrors
bsodList
OS_Version



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




