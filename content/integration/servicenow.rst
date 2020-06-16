ServiceNow Integration
========================

Unregistered User
------------------

To start you will need to set up a contact that uses the email address of “unregistered@helpdeskbuttons.com” for the purposes of catching any unregistered users.

Navigate to Callers and Click New

.. image:: images/sn-image-1.png

The only really important part is the email address. Feel free to name it anything you feel comfortable with.

.. image:: images/sn-image-2.png


Helpdeskbuttons.com Settings
-------------------------------

On the Settings page of helpdeskbuttons, put in the endpoint and a username:password combo as the API Key.

Click update and the Integration Test button. 

Let us know how to get in touch with your development team for feature requests and additional customizations! We are happy to get you set up with customized software.

Anti-Virus and AntiMalware
-----------------------------
It is not always necessary, but we recommend whitelisting the helpdeskbuttons installation folder (C:\\Program Files(x86)\\Helpdesk Button). We regularly submit our code through VirusTotal to make sure we are not getting flagged, but almost all AV/M interactions cause some sort of failure. `Webroot <https://docs.tier2tickets.com/content/general/firewall/#webroot>`_ in particular can cause issues with screenshots.

Advanced Integration Options
------------------------------

This is the list of variables that can be accessed when using the :ref:`Custom Rules <content/integration/advanced:Custom Rules>`. 


+-------------------+---------------+
| Read/Write        | Read Only     |
+===================+===============+
| impact_           | selections_   |
+-------------------+---------------+
| urgency_          | hostname_     |
+-------------------+---------------+
| incidentState_    | name_         |
+-------------------+---------------+
| priv_append_      | email_        |
+-------------------+---------------+
| message_          | ip_           |
+-------------------+---------------+
| subject_          | mac_          | 
+-------------------+---------------+
| append_           | callerID_     | 
+-------------------+---------------+

.. _impact:  https://docs.tier2tickets.com/content/integration/servicenow/#impact-and-urgency
.. _urgency:  https://docs.tier2tickets.com/content/integration/servicenow/#impact-and-urgency
.. _incidentState:  https://docs.tier2tickets.com/content/integration/servicenow/#incidentstate
.. _priv_append:  https://docs.tier2tickets.com/content/integration/servicenow/#priv-append
.. _callerID:  https://docs.tier2tickets.com/content/integration/servicenow/#callerID
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

*impact* and *urgency*
""""""""""""""""""""""

	**Set priority via the SLA priority matrix:**

Impact:

.. image:: images/sn-impact.png
   :target: https://docs.tier2tickets.com/_images/sn-impact.png

|

Urgency:

.. image:: images/sn-urgency.png
   :target: https://docs.tier2tickets.com/_images/sn-urgency.png

|
|

*incidentState*
"""""""""""""""

	**Refers to the ticket status (New, In Progress, etc):**

.. image:: images/sn-incidentState.png
   :target: https://docs.tier2tickets.com/_images/sn-incidentState.png

|
|

*priv_append*
"""""""""""""

	**Allows you to append information to the internal ticket note:**

.. image:: images/sn-priv_append.png
   :target: https://docs.tier2tickets.com/_images/sn-priv_append.png

|
|

*callerID*
""""""""""

	**Refers to the client's name:**

.. image:: images/sn-callerID.png
   :target: https://docs.tier2tickets.com/_images/sn-callerID.png

|
|

*issue*
"""""""

	**The primary ticket issue:**

.. image:: images/sn-issue.png
   :target: https://docs.tier2tickets.com/_images/sn-issue.png

|
|

*subissue*
""""""""""

	**The secondary ticket issue:**

.. image:: images/sn-subissue.png
   :target: https://docs.tier2tickets.com/_images/sn-subissue.png

|
|

*other*
"""""""

There are additional variables which are common to all integrations. Those are documented :ref:`here <content/integration/advanced:Universally Available Variables>`