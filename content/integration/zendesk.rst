Zendesk Integration
========================

Unregistered User
------------------

To start you will need to set up a "Catch all" contact for users not aleady in your system.

Hover over Add and click User

.. image:: images/zd-image3.png

The only really important part is the email address. It needs to be “unregistered@helpdeskbuttons.com” Feel free to name it anything you feel comfortable with.

.. image:: images/zd-image4.png


Enable API Access and Create a new Key
---------------------------------------

You may need to enable API access into users by API token.

To do this click the Admin gear and click API under CHANNELS

.. image:: images/zd-image1.png

You will want to enable this line.

.. image:: images/zd-image2.png
.. image:: images/zd-image5.png

Click the plus sign to add a new key. 

You can label it anything you want, but make sure to put that key somewhere safe, it only appears once. 


Helpdeskbuttons.com Settings
-------------------------------

Enter your Ticket System API endpoint as shown (do not add add https:// or the path after the url)

Yout API key is formatted as shown 

username:apikey

Click update and the Integration Test button. 

Let us know how to get in touch with your development team for feature requests and additional customizations! We are happy to get you set up with customized software.

Anti-Virus and AntiMalware
-----------------------------
It is not always necessary, but we recommend whitelisting the helpdeskbuttons installation folder (C:\\Program Files(x86)\\Helpdesk Button). We regularly submit our code through VirusTotal to make sure we are not getting flagged, but almost all AV/M interactions cause some sort of failure. `Webroot <https://docs.tier2tickets.com/content/general/firewall/#webroot>`_ in particular can cause issues with screenshots.

Advanced Integration Options
------------------------------

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
| status_            | name_          |
+--------------------+----------------+
| priv_append_       | email_         |
+--------------------+----------------+
| message_           | ip_            |
+--------------------+----------------+
| subject_           | mac_           | 
+--------------------+----------------+
| append_            ||input_cell|_   | 
+--------------------+----------------+
|                    ||input_phone|_  | 
+--------------------+----------------+
|                    ||input_company|_| 
+--------------------+----------------+
|                    ||input_email|_  | 
+--------------------+----------------+
|                    ||input_name|_   | 
+--------------------+----------------+

.. _priority:  https://docs.tier2tickets.com/content/integration/zendesk/#priority
.. _type:  https://docs.tier2tickets.com/content/integration/zendesk/#type
.. _status:  https://docs.tier2tickets.com/content/integration/zendesk/#status
.. _priv_append:  https://docs.tier2tickets.com/content/integration/zendesk/#priv-append
.. _message:  https://docs.tier2tickets.com/content/integration/advanced/#message
.. _subject:  https://docs.tier2tickets.com/content/integration/advanced/#subject
.. _append:  https://docs.tier2tickets.com/content/integration/advanced/#append
.. _selections:  https://docs.tier2tickets.com/content/integration/advanced/#selections
.. _hostname:  https://docs.tier2tickets.com/content/integration/advanced/#hostname
.. _name:  https://docs.tier2tickets.com/content/integration/advanced/#name
.. _email:  https://docs.tier2tickets.com/content/integration/advanced/#email
.. _ip:  https://docs.tier2tickets.com/content/integration/advanced/#ip
.. _mac:  https://docs.tier2tickets.com/content/integration/advanced/#mac
.. _input_cell:  https://docs.tier2tickets.com/content/integration/zendesk/#input
.. _input_phone:  https://docs.tier2tickets.com/content/integration/zendesk/#input
.. _input_company:  https://docs.tier2tickets.com/content/integration/zendesk/#input
.. _input_email:  https://docs.tier2tickets.com/content/integration/zendesk/#input
.. _input_name:  https://docs.tier2tickets.com/content/integration/zendesk/#input

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

.. image:: images/zd-priority.png
   :target: https://docs.tier2tickets.com/_images/zd-priority.png

|
|

*status*
""""""""

	**The ticket status (New, In Progress, etc):**

.. image:: images/zd-status.png
   :target: https://docs.tier2tickets.com/_images/zd-status.png

|
|

*type*
""""""

	**Refers to the issue type (Service Request, Incident, Problem, Alert):**

.. image:: images/zd-type.png
   :target: https://docs.tier2tickets.com/_images/zd-type.png

|
|

*priv_append*
"""""""""""""

	**Allows you to append information to the internal ticket note:**

.. image:: images/zd-priv_append.png
   :target: https://docs.tier2tickets.com/_images/zd-priv_append.png

|
|

*input_**
"""""""""

.. image:: images/zd-inputs.png
   :target: https://docs.tier2tickets.com/_images/zd-inputs.png

|
|

*other*
"""""""

There are additional variables which are common to all integrations. Those are documented :ref:`here <content/integration/advanced:Universally Available Variables>`

The fields labeled input_* contain information typed by the user only in the event that they are not found in the PSA











