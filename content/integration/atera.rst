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

Some additional setup may be necessary in the :ref:`Advanced Integration Options <content/integration/advanced:Defaults>`.

Anti-Virus and AntiMalware
-----------------------------
It is not always necessary, but we recommend whitelisting the helpdeskbuttons installation folder (C:\\Program Files(x86)\\Helpdesk Button). We regularly submit our code through VirusTotal to make sure we are not getting flagged, but almost all AV/M interactions cause some sort of failure. `Webroot <https://docs.tier2tickets.com/content/general/firewall/#webroot>`_ in particular can cause issues with screenshots.

Advanced Integration Options
------------------------------

Defaults
^^^^^^^^

Please note that defaults for priority, type, and standing must be set for this integration to work properly.

Custom Rules
^^^^^^^^^^^^^

This is the list of variables that can be accessed when using the :ref:`Custom Rules <content/integration/advanced:Custom Rules>`. 

+-------------------+---------------+
| Read/Write        | Read Only     |
+===================+===============+
| priority_         | selections_   |
+-------------------+---------------+
| type_             | hostname_     |
+-------------------+---------------+
| impact_           | name_         |
+-------------------+---------------+
| append_           | email_        |
+-------------------+---------------+
| message_          | ip_           |
+-------------------+---------------+
| subject_          | mac_          | 
+-------------------+---------------+

.. _priority:  https://docs.tier2tickets.com/content/integration/atera/#priority
.. _type:  https://docs.tier2tickets.com/content/integration/atera/#type
.. _impact:  https://docs.tier2tickets.com/content/integration/atera/#impact
.. _message:  https://docs.tier2tickets.com/content/integration/advanced/#message
.. _subject:  https://docs.tier2tickets.com/content/integration/advanced/#subject
.. _append:  https://docs.tier2tickets.com/content/integration/advanced/#append
.. _selections:  https://docs.tier2tickets.com/content/integration/advanced/#selections
.. _hostname:  https://docs.tier2tickets.com/content/integration/advanced/#hostname
.. _name:  https://docs.tier2tickets.com/content/integration/advanced/#name
.. _email:  https://docs.tier2tickets.com/content/integration/advanced/#email
.. _ip:  https://docs.tier2tickets.com/content/integration/advanced/#ip
.. _mac:  https://docs.tier2tickets.com/content/integration/advanced/#mac

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

There are additional variables which are common to all integrations. Those are documented :ref:`here <content/integration/advanced:Universally Available Variables>`

The fields labeled input_* contain information typed by the user only in the event that they are not found in the PSA