Atera Integration
===================

Get API Key
--------------------------

Click the Admin Tab

.. image:: images/atera1.png

Next click on the API Tile in the Customer Facing Section

.. image:: images/atera2.png

You can view the key by clicking the eye symbol or copy the key to the clipboard using the copy symbol.

.. image:: images/atera3.png

Helpdeskbuttons.com Settings
-------------------------------

Select Atera as the ticket system. 

Enter your Ticket System API endpoint as shown (do not add add https:// or the path after the url)

*app.atera.com*

Paste your key into the API Key section

Click Update and the Integration Test button to send a test ticket. 

Integration Defaults
-----------------------------------

Please note that defaults for priority, type, and standing must be set for this integration to work properly.


Anti-Virus and AntiMalware
-----------------------------
It is not always necessary, but we recommend whitelisting the helpdeskbuttons installation folder (C:\\Program Files(x86)\\Helpdesk Button). We regularly submit our code through VirusTotal to make sure we are not getting flagged, but almost all AV/M interactions cause some sort of failure. `Webroot <https://docs.tier2tickets.com/content/general/firewall/#webroot>`_ in particular can cause issues with screenshots.

Dispatcher Rules
-----------------------------------------------

This is the list of variables that can be accessed when using the :ref:`Dispatcher Rules <content/automations/dispatcher:*BETA* Dispatcher Rules>`.

+-------------------------------------------------+----------------------------------------------------+
| Read/Write                                      | Read Only                                          |
+=================================================+====================================================+
| :ref:`content/integration/atera:*priority*`     | :ref:`content/automations/dispatcher:*selections*` |
+-------------------------------------------------+----------------------------------------------------+
| :ref:`content/integration/atera:*type*`         | :ref:`content/automations/dispatcher:*hostname*`   |
+-------------------------------------------------+----------------------------------------------------+
| :ref:`content/integration/atera:*impact*`       | :ref:`content/automations/dispatcher:*name*`       |
+-------------------------------------------------+----------------------------------------------------+
| :ref:`content/automations/dispatcher:*append*`  | :ref:`content/automations/dispatcher:*email*`      |
+-------------------------------------------------+----------------------------------------------------+
| :ref:`content/automations/dispatcher:*message*` | :ref:`content/automations/dispatcher:*ip*`         |
+-------------------------------------------------+----------------------------------------------------+
| :ref:`content/automations/dispatcher:*subject*` | :ref:`content/automations/dispatcher:*mac*`        | 
+-------------------------------------------------+----------------------------------------------------+




Field Definitions
^^^^^^^^^^^^^^^^^

*priority*
""""""""""

	**The ticket priority level (Urgent, Low, ect):**

.. image:: images/atera-priority.png
   :target: https://docs.tier2tickets.com/_images/atera-priority.png

|
|

*impact*
"""""""""

	**The ticket impact (No impact, Site Down, Crisis):**

.. image:: images/atera-impact.png
   :target: https://docs.tier2tickets.com/_images/atera-impact.png

|
|

*type*
"""""""

	**The issue type (Service Request, Incident, Problem, Alert):**

.. image:: images/atera-type.png
   :target: https://docs.tier2tickets.com/_images/atera-type.png

|
|

*other*
"""""""

There are additional variables which are common to all integrations. Those are documented :ref:`here <content/automations/dispatcher:Universally Available Variables>`

The fields labeled input_* contain information typed by the user only in the event that they are not found in the PSA