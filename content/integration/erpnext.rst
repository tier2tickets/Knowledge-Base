ERPNext Documentation
======================================

This guide will show you how to set up your new Helpdesk Buttons with ERPNext in as few as 15 minutes.

Integration
--------------------------

ERPNext integration requires three main parts:

`1) set up an unregistered user as a catchall account as a contact in your PSA <https://docs.tier2tickets.com/content/integration/erpnext/#create-an-unregistered-user>`_

`2) set up the API integration. <https://docs.tier2tickets.com/content/integration/erpnext/#create-an-api-key-and-secret>`_

`3) configure helpdeskbuttons account. <https://docs.tier2tickets.com/content/integration/erpnext/#helpdeskbuttons-com-settings>`_

Video Walkthrough
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
	
.. raw:: html

    <div style="position: relative; padding-bottom: 5%; height: 0; overflow: hidden; max-width: 100%; height: auto;">
        <iframe width="560" height="315" src="https://www.youtube.com/embed/Q9R8TZD-3U8" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
    </div>


1) Create an Unregistered User
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Create a Customer to receive 'Catch All' tickets and add a Contact to that Customer with the email address 

*unregistered@helpdeskbuttons.com*

.. image:: images/ERPNext-contact.png

This is in case someone puts in an email that is not already in ERPNext, this will also prompt the GUI to ask for identifying information from the end user. 




2) Create an API KEY and SECRET
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

To create the API KEY for ERPNext:

Click Settings -> My Settings -> API Access

You can create a key by clicking the "Generate Keys" Button.

Copy down the API Secret as it cannot be viewed again. 

.. image:: images/ERPNext-secret.png

If the API Key does not show up try logging out, then back in.

You should see something like this when you have successfully created a key pair.

.. image:: images/ERPNext-key.png

Copy the API Key as you will need that to complete the integration. 


3) Helpdeskbuttons.com Settings
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Enter your Ticket System API endpoint as shown (do not add add https:// or the path after the url)

for cloudhosted instances: *business_name.erpnext.com*

Your API key is formatted as shown 

*api_key:api_secret*

Click Update and the Integration Test button to send a test ticket. 


Anti-Virus and AntiMalware
----------------------------------------------------
It is not always necessary, but we recommend whitelisting the tier2tickets installation folder (C:\\Program Files(x86)\\tier2tickets). We regularly submit our code through VirusTotal to make sure we are not getting flagged, but almost all AV/M interactions cause some sort of failure. `Webroot <https://docs.tier2tickets.com/content/general/firewall/#webroot>`_ in particular can cause issues with screenshots.


Dispatcher Rules
----------------------------------------------------

This is the list of variables that can be accessed when using the :ref:`Dispatcher Rules <content/automations/dispatcher:Dispatcher Rules>`. 

+---------------------------------------------------+-------------------------------------------------------------+
| Read/Write                                        | Read Only                                                   |
+===================================================+=============================================================+
| :ref:`content/integration/ERPNext:*priority*`     | :ref:`content/automations/dispatcher:*selections*`          |
+---------------------------------------------------+-------------------------------------------------------------+
| :ref:`content/integration/ERPNext:*issue_type*`   | :ref:`content/automations/dispatcher:*hostname*`            |
+---------------------------------------------------+-------------------------------------------------------------+
| :ref:`content/integration/ERPNext:*status*`       | :ref:`content/automations/dispatcher:*name*`                |
+---------------------------------------------------+-------------------------------------------------------------+
| :ref:`content/integration/ERPNext:*priv_append*`  | :ref:`content/automations/dispatcher:*email*`               |
+---------------------------------------------------+-------------------------------------------------------------+
| :ref:`content/automations/dispatcher:*msg*`       | :ref:`content/automations/dispatcher:*ip*`                  |
+---------------------------------------------------+-------------------------------------------------------------+
| :ref:`content/automations/dispatcher:*subject*`   | :ref:`content/automations/dispatcher:*mac*`                 | 
+---------------------------------------------------+-------------------------------------------------------------+
|                                                   | .. raw:: html                                               |
|                                                   |                                                             |
|                                                   |    <i>                                                      |
|                                                   |                                                             |
|  :ref:`content/integration/ERPNext:*owner*`       | :ref:`input_cell<content/integration/ERPNext:*input_**>`    | 
+---------------------------------------------------+-------------------------------------------------------------+
|                                                   | .. raw:: html                                               |
|                                                   |                                                             |
|                                                   |    <i>                                                      |
|                                                   |                                                             |
|                                                   | :ref:`input_phone<content/integration/ERPNext:*input_**>`   | 
|                                                   |                                                             |
+---------------------------------------------------+-------------------------------------------------------------+
|                                                   | .. raw:: html                                               |
|                                                   |                                                             |
|                                                   |    <i>                                                      |
|                                                   |                                                             |
|                                                   | :ref:`input_company<content/integration/ERPNext:*input_**>` | 
+---------------------------------------------------+-------------------------------------------------------------+
|                                                   | .. raw:: html                                               |
|                                                   |                                                             |
|                                                   |    <i>                                                      |
|                                                   |                                                             |
|                                                   | :ref:`input_email<content/integration/ERPNext:*input_**>`   | 
+---------------------------------------------------+-------------------------------------------------------------+
|                                                   | .. raw:: html                                               |
|                                                   |                                                             |
|                                                   |    <i>                                                      |
|                                                   |                                                             |
|                                                   | :ref:`input_name<content/integration/ERPNext:*input_**>`    | 
+---------------------------------------------------+-------------------------------------------------------------+


Field Definitions
^^^^^^^^^^^^^^^^^

*priority*
""""""""""

	**The ticket priority level (Urgent, Low, ect):**
   
.. image:: images/ERPNext-priority.png
   :target: https://docs.tier2tickets.com/_images/ERPNext-priority.png
   
|
|

*status*
"""""""""""

	**Refers to the ticket status (New, In Progress, etc):**

.. image:: images/ERPNext-status.png
   :target: https://docs.tier2tickets.com/_images/ERPNext-status.png

|
|

*issue_type*
"""""""""""""""""""""""

	**The issue type (this will depend on the types you create):**

.. image:: images/ERPNext-type.png
   :target: https://docs.tier2tickets.com/_images/ERPNext-type.png

|
|

*owner*
""""""""""

	**The agent that will be assigned this ticket:**

.. image:: images/ERPNext-owner.png
   :target: https://docs.tier2tickets.com/_images/ERPNext-owner.png

|
|


*priv_append*
"""""""""""""

	**Allows you to append information to the internal ticket note:**

.. image:: images/ERPNext-priv_append.png
   :target: https://docs.tier2tickets.com/_images/ERPNext-priv_append.png

|
|

*input_**
""""""""""""""

	**Additional information provided if the user is not found in ERPNext**
	
.. image:: images/ERPNext-input.png


*other*
"""""""

There are additional variables which are common to all integrations. Those are documented :ref:`here <content/automations/dispatcher:Universally Available Variables>`

Webhook Walkthrough
--------------------------

To setup a webhook in ERPNext, click Administration -> Integrations -> Settings -> Webhook

Click New to Create a new webhook. 

Fill out the webhook as follows:

- DocType to Issue (Support)
- Doc Event to on_update.
- Request URL should be listed on your `Integration Settings Page. <https://dev.helpdeskbuttons.com/backend.php>`_ under the Ticket Notification section.
- Request Structure to Form URL-Encoded

Click Save

Doing this will lock some of the choices in and provide more options for the rest of the webhook. 

.. image:: images/erpnext-webhook1.png


- Set the webhook header to application/json

- Add these fields to the webhook data area

 - Name
 - Customer
 - Raised By
 - Description
 - Subject
 - Contact
 - Status

Save Again and you should be all set

.. image:: images/erpnext-webhook2.png
