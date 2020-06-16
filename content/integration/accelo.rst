Accelo Integration
===================

Unregistered User
------------------

To start you will need to set up a "Catch all" contact for users not aleady in your system.

Click on the Contacts Tab

.. image:: images/accelo5.png

and Click Add user in the top left corner

.. image:: images/accelo6.png

Fill out the form. You can name the contact whatever you want, but the email address needs to be:

unregistered@helpdeskbuttons.com

.. image:: images/accelo7.png

Create an Application User
--------------------------

To do this click the Configuration Gear in the botton left corner: 

.. image:: images/accelo1.png

Next click on the API tab and Register Application

.. image:: images/accelo2.png

Fill out this next screen with whatever information you want, we only need to make sure that the Application Type is Service

.. image:: images/accelo3.png

The final screen will show you the API user and API secret for the integration. You will need these for the next step.

.. image:: images/accelo4.png

Helpdeskbuttons.com Settings
-------------------------------

Enter your Ticket System API endpoint as shown (do not add add https:// or the path after the url)

*business_name.api.accelo.com*

Your API key is formatted as shown 

*client_id:client_secret*

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

+--------------------+----------------+
| Read/Write         | Read Only      |
+====================+================+
| priority_          | selections_    |
+--------------------+----------------+
| type_              | hostname_      |
+--------------------+----------------+
| standing_          | name_          |
+--------------------+----------------+
| priv_append_       | email_         |
+--------------------+----------------+
| message_           | ip_            |
+--------------------+----------------+
| subject_           | mac_           | 
+--------------------+----------------+
| append_            ||input_cell|_   | 
+--------------------+----------------+
| assignee_          ||input_phone|_  | 
+--------------------+----------------+
| class_             ||input_company|_| 
+--------------------+----------------+
|                    ||input_email|_  | 
+--------------------+----------------+
|                    ||input_name|_   | 
+--------------------+----------------+

.. _priority:  https://docs.tier2tickets.com/content/integration/accelo/#priority
.. _type:  https://docs.tier2tickets.com/content/integration/accelo/#type
.. _standing:  https://docs.tier2tickets.com/content/integration/accelo/#standing
.. _priv_append:  https://docs.tier2tickets.com/content/integration/accelo/#priv-append
.. _message:  https://docs.tier2tickets.com/content/integration/advanced/#message
.. _subject:  https://docs.tier2tickets.com/content/integration/advanced/#subject
.. _append:  https://docs.tier2tickets.com/content/integration/advanced/#append
.. _assignee:  https://docs.tier2tickets.com/content/integration/accelo/#assignee
.. _class:  https://docs.tier2tickets.com/content/integration/accelo/#class
.. _selections:  https://docs.tier2tickets.com/content/integration/advanced/#selections
.. _hostname:  https://docs.tier2tickets.com/content/integration/advanced/#hostname
.. _name:  https://docs.tier2tickets.com/content/integration/advanced/#name
.. _email:  https://docs.tier2tickets.com/content/integration/advanced/#email
.. _ip:  https://docs.tier2tickets.com/content/integration/advanced/#ip
.. _mac:  https://docs.tier2tickets.com/content/integration/advanced/#mac
.. _input_cell:  https://docs.tier2tickets.com/content/integration/accelo/#input
.. _input_phone:  https://docs.tier2tickets.com/content/integration/accelo/#input
.. _input_company:  https://docs.tier2tickets.com/content/integration/accelo/#input
.. _input_email:  https://docs.tier2tickets.com/content/integration/accelo/#input
.. _input_name:  https://docs.tier2tickets.com/content/integration/accelo/#input

.. |input_cell| replace:: *input_cell*
.. |input_phone| replace:: *input_phone*
.. |input_company| replace:: *input_company*
.. |input_email| replace:: *input_email*
.. |input_name| replace:: *input_name*

Field Definitions
^^^^^^^^^^^^^^^^^

*priority*
""""""""""

	**The ticket priority level (Urgent, Low, ect):**
   
.. image:: images/accelo-priority.png
   :target: https://docs.tier2tickets.com/_images/accelo-priority.png
   
|
|

*standing*
"""""""""""

	**Refers to the ticket status (New, In Progress, etc):**

.. image:: images/accelo-standing.png
   :target: https://docs.tier2tickets.com/_images/accelo-standing.png

|
|

*type*
""""""""

	**The issue type (Service Request, Incident, Problem, Alert):**

.. image:: images/accelo-type.png
   :target: https://docs.tier2tickets.com/_images/accelo-type.png

|
|

*assignee*
""""""""""

	**The agent that will be assigned this ticket:**

.. image:: images/accelo-assignee.png
   :target: https://docs.tier2tickets.com/_images/accelo-assignee.png

|
|

*class*
"""""""""

	**The tickets class (Accounts/Renewals, E-commerce):**

.. image:: images/accelo-class.png
   :target: https://docs.tier2tickets.com/_images/accelo-class.png

|
|

*priv_append*
"""""""""""""

	**Allows you to append information to the internal ticket note:**

.. image:: images/accelo-priv_append.png
   :target: https://docs.tier2tickets.com/_images/accelo-priv_append.png

|
|

*input_**
"""""""""

.. image:: images/accelo-inputs.png
   :target: https://docs.tier2tickets.com/_images/accelo-inputs.png

|
|

*other*
"""""""

There are additional variables which are common to all integrations. Those are documented :ref:`here <content/integration/advanced:Universally Available Variables>`

The fields labeled input_* contain information typed by the user only in the event that they are not found in the PSA
