Change Log
==========
Here is a running change-log of the website and the software.


Website
-------

2021-11-02
~~~~~~~~~~
* Device management 
    * optimizations that make the page load faster
    * tools list added to accomidate Remote Access Options
    * last user field added
    * online/offline indicators changed and checkboxes allowing only these to be shown
* New :ref:`Remote Access Page. <content/customization/remote:Remote Access Options>`
    * Tier2Terminal
    * Remote Diagnostics
* Profile Settings 
    * updated with new icons 
    * reset password link fixed
    * name sometimes not showing properly fixed
* Subaccounts Page redesigned to be easier to understand
    * Permissions list for each user
    * Can be changed via CSV
* Branding Page
    * updated with reset to default buttons 
    * can adjust to fit more screen sizes
* Download and Deploy Page redesigned
    * allow deployment customization on the page instead of requiring script manipulation
    * only allow building of General Availability if Release Candidate is not ready for testing
    * additional information available about deployment status
    * can adjust to fit more screen sizes
* Diagnostic Report loading changed: visiting a report before it has completed loading works better



2021-08-16
~~~~~~~~~~
* Device Management, sort by Domain and Serial Number.
* :ref:`Email Disclaimer. <content/integration/email:*email_disclaimer*>`
* :ref:`Integration Field Validation. <content/integration/errors:Submission Error>`
* Changed the naming conventions for our builds (“Alpha” “Beta” “Stable” to “Release Candidate” and “General Availability”.)


2021-03-25
~~~~~~~~~~
* Added support for Tier2AI to the dispatcher rules automations

2021-02-17
~~~~~~~~~~
* Tier2AI support now available. :ref:`Check it out in our docs <content/automations/tier2ai:*BETA* Tier2AI>` or read up on some sample ideas in our `feature release notes. <https://www.tier2tickets.com/now-introducing-tier2ai-also-inside-pin-to-taskbar-and-autotask-toast-notifications/>`_
* :ref:`Set Tier2Assists to occur before OR after ticket submission. <content/automations/tier2assist:Running Tier2Assists before ticket submission>`
* :ref:`Autotask Toast Notifications available now. <content/integration/autotask:Setting up Webhooks>` 

2020-12-21
~~~~~~~~~~
* :ref:`Notifications <content/automations/notifications:*beta* notifications>`
* Tier2Forms now integrates with Cognito Forms
* Expanded the report to include new diagnositcs


2020-07-30
~~~~~~~~~~
* Added Automations Platform to site including
    * :ref:`Visual Code Editor <content/automations/dispatcher:visual editor>`
    * :ref:`Dispatcher Rules <content/automations/dispatcher:*BETA* Dispatcher Rules>`
    * :ref:`Tier2Assist <content/automations/tier2assist:*BETA* Tier2Assist>`
    * :ref:`Tier2Forms <content/automations/tier2forms:*BETA* Tier2Forms>`
    * :ref:`Tier2Scipts <content/automations/tier2scripts:tier2scripts>`
* Device Management improvements
    * Filter and sort endpoints
    * Send notifications to endpoints
    * Remove and remotely uninstall endpoints
* Updated the Navigation menu
* Separated User interface, Account Administration, and Integration Settings pages
* Updated Integration settings
    * Opt in remote access tool
    * Auto remove inactive endpoints checkbox
* Updated subaccount permissions for automations and new navigation menu


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
* Added support for :ref:`auto update <content/deployment/updating:Updating your endpoints>`.




Software
--------







.. raw:: html

   <a name="1.1.26">&nbsp;</a>

1.1.x.26
~~~~~~~~

(2022-01-26)

* Created a 5 second timeout on both the custom and built-in :ref:`Identity Provider <content/customization/identity-provider:Identity Provider>`. This will prevent anyone waiting more than 10 seconds for the first screen









.. raw:: html

   <a name="1.1.25">&nbsp;</a>

1.1.x.25 
~~~~~~~~

(2021-12-08)

* Fixed a bug in which the gui would hang when using the custom powershell script append feature
* Added support for configurable ticket TTL in the remote ticket creation API.













.. raw:: html

   <a name="1.1.24">&nbsp;</a>

1.1.x.24 
~~~~~~~~

(2021-10-21)

* Added support for generating a diagnostic report remotely
* Fixed a bug in which the Tier2Assists would fail to display always







.. raw:: html

   <a name="1.1.23">&nbsp;</a>

1.1.x.23
~~~~~~~~

(2021-09-28)

* Fixed a bug in which the buttonhelper process would use ~5% CPU constantly on terminal servers in which more than one user was logged in
* Fixed a bug in which the terminal server reports would show network data missing error unless "desktop experience" feature was installed
* Fixed a bug in which computers with no printer would fail in gathering data about other hardware as well
* Fixed a bug in which the Tier2Assists would fail to display if using the json_get or json_post functions anywhere




.. raw:: html

   <a name="1.1.22">&nbsp;</a>

1.1.x.22
~~~~~~~~

(2021-09-23)

* Fixed a bug in which the buttonhelper process would continue to use high resources after diagnostic submission.
* Fixed a bug in which several buttonhelper process may spawn where there should only be one
* Fixed an installer bug in which the install would fail if SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Run was not writable
* Fixed an installer bug in which silent install would fail on terminal servers and computers where more than one user was logged in
* Fixed a bug where buttonhelper could not start on terminal servers
* Fixed a bug where the GUI would continue running in the background after closing it



.. raw:: html

   <a name="1.1.21">&nbsp;</a>

1.1.x.21
~~~~~~~~

(2021-09-22)

* The diagnostic-gathering logic has been completely rewritten and is now an order of magnitude faster.
* The library responsible for handling TLS has been swapped-out with a more reliable one for systems with self-signed trusted root certificates
* Debug logging has been improved
* Added auto-close feature to prevent API errors from 60-minute timeout being surpassed.
* Fixed a display bug where the wrong email address would sometimes be displayed on the submission-confirmation page.
* Upgraded from python 3.6 to 3.8
* Added more logic to terminal server screenshot handling to keep memory usage lower



.. raw:: html

   <a name="1.1.20">&nbsp;</a>

1.1.x.20
~~~~~~~~

(2021-09-16)

* In cases where the software is being used on a terminal server, there was potential for CPU overload when several users were logged in. This version contains logic for the application to monitor all instances of itself and throttle itself by dropping screenshot frames or compressing those frames more slowly if needed in order to target <= 15% CPU usage.










.. raw:: html

   <a name="1.1.19">&nbsp;</a>

1.1.x.19
~~~~~~~~

(2021-08-31)

* Running the software by clicking the icon now uses named-pipe based RPC rather than an emulated-HID so there are no longer conflicts with other software that may be running and it should work with all keyboard layouts now.
* Fixed a bug in which hundreds of temp files get created over time and not cleaned up.





.. raw:: html

   <a name="1.1.18">&nbsp;</a>

1.1.x.18
~~~~~~~~

(2021-08-02)

* Automatic addition of Assets and Configurations for Syncro, ConnectWise, and Autotask `Check out our documentation <https://docs.tier2tickets.com/content/customization/assets/>`_ for more details
* Pinned to Taskbar Icon Update: Added improvements to our PTTB feature, including a smarter install with icon-cache-clearing 
* Warranty section of PressView Updated







.. raw:: html

   <a name="1.1.17">&nbsp;</a>

1.1.x.17
~~~~~~~~

(2021-03-24)

* Tier2AI now supports a result['best_match'] for categories that are not necessarily close enough to include in result['matches']
* Fixed a bug in which the loading spinner would not animate while processing "is_before_ticket_submit = True" tier2assist automation rules
* Implemented a workaround for a Windows bug that prevented uninstalling the software because of the Windows Event Log Service







.. raw:: html

   <a name="1.1.16">&nbsp;</a>

1.1.x.16
~~~~~~~~

(2021-02-11)

* Added support for Tier2AI





.. raw:: html

   <a name="1.1.15">&nbsp;</a>

1.1.x.15
~~~~~~~~

(2021-02-10)

* Added the ability to display tier2assist actions before ticket submission using is_before_ticket_submit variable
* Fixed bug in which tier2assist actions were not displayed in the order in which they were added
* Added support for json_post() and json_get() in tier2assist to gracefully handle non-json responses
* Allowed custom fields in the GUI to support Unicode characters.










.. raw:: html

   <a name="1.1.14">&nbsp;</a>

1.1.x.14
~~~~~~~~

(2021-02-05)

* Fixed a bug in which the software would not launch if appdata is redirected and the end-user already has the software running on another computer sharing the same appdata folder.
* Added support for automatically pinning the icon to the taskbar













.. raw:: html

   <a name="1.1.12">&nbsp;</a>

1.1.x.12
~~~~~~~~

(2020-10-14)

* Added integration with Microsoft Active Directory, Azure Active Directory, Novell Directory Services, Microsoft Exchange, and :ref:`Custom Identity Providers <content/automations/tier2scripts:identity_provider.ps1>`









.. raw:: html

   <a name="1.1.11">&nbsp;</a>

1.1.x.11
~~~~~~~~

(2020-10-09)

* Phone number validation now supports the international number format so that all countries can use the software.











.. raw:: html

   <a name="1.1.10">&nbsp;</a>

1.1.x.10
~~~~~~~~

(2020-09-30)

* Fixed the message on the last page "Thank you, {name}" where name would be incorrect in the case of unregistered user ticket submission
* Fixed some formatting on the main landing page so that it better handles longer text.
* Added support for GUI color customization by putting a "custom.css" file in the same place as the custom scripts
* Made it impossible to start the software incorrectly by clicking the incorrect exe in the program installation directory
* The software has been renamed to "Tier2Tickets" from "Helpdesk Buttons" (This applies retroactively to the entire 1.1 branch on new builds)
* Changed the NTP server used for internal time-synchronization of t2t service from pool.ntp.org to time.google.com













.. raw:: html

   <a name="1.1.9">&nbsp;</a>

1.1.x.9
~~~~~~~~

(2020-08-26)

* fixed an edge case where the submission would hang forever if the t2tservice has never in the past been able to contact the server.
















.. raw:: html

   <a name="1.1.8">&nbsp;</a>

1.1.x.8
~~~~~~~~

(2020-08-19)

* fixed an edge case where a well-timed mouse-scroll during software startup would cause memory corruption and the buttonhelper process would stop responding.

















.. raw:: html

   <a name="1.1.7">&nbsp;</a>

1.1.x.7
~~~~~~~~

(2020-08-08)

* improved the exponential backoff logic in the Tier2Service websocket connection
* added support for the windows certificate store to all TLS requests so that security software whitelisting is not as necessary
* switched API version to 1.0 branch.
* patched the websocket library to tolerate additional headers added by proxy servers to the authentication request.











.. raw:: html

   <a name="0.6.12">&nbsp;</a>

0.6.x.12
~~~~~~~~

* fixed: pid lock was broken and two copies of the software could be opened causing conflict and sometimes crashing
* added support for the 'random' and 're' modules for tier2assist









.. raw:: html

   <a name="0.6.10">&nbsp;</a>

0.6.x.10
~~~~~~~~

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

* Added support for :ref:`auto update <content/deployment/updating:Updating your endpoints>`.




.. raw:: html

   <a name="0.4.3">&nbsp;</a>

0.4.x.3
~~~~~~~

* Added support international phone number validation
* Added support for :ref:`content/privacy/customer-owned:Customer Controlled Amazon S3`.




.. raw:: html

   <a name="0.3.28">&nbsp;</a>

0.3.x.28
~~~~~~~~

* bug fixes




