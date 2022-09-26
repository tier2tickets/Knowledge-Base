Freshdesk Documentation
=============================================

This guide will show you how to set up FreshDesk / FreshService to work with your new Helpdesk Buttons in as few as 15 minutes.

Integration
-------------------

Freshdesk integration requires three main parts:

`1) set up an unregistered user as a catchall account as a contact in your PSA <https://docs.tier2tickets.com/content/integration/freshdesk/#unregistered-user>`_

`2) set up the API integration. <https://docs.tier2tickets.com/content/integration/freshdesk/#getting-an-api-key>`_

`3) configure helpdeskbuttons account. <https://docs.tier2tickets.com/content/integration/freshdesk/#helpdeskbuttons-com-setup>`_

Video Walkthrough
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

    <div style="position: relative; padding-bottom: 5%; height: 0; overflow: hidden; max-width: 100%; height: auto;">
       <iframe width="560" height="315" src="https://www.youtube.com/embed/bDhWhLQswGk" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
    </div>




1) Unregistered User
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
By default, our software attempts to pair users with their contact information by checking with Freshdesk. If the user is not already found in the system
a catch all account submits the ticket instead. This can be disabled for PSA's that allow users to create accounts on ticket submission. Look at the  :ref:`Integration Defaults <content/integration/freshdesk:Integration Defaults>` below.

This guide assumes you want to use the catch all contact: 
To start you will need to set up a contact that uses the email address of “unregistered@helpdeskbuttons.com”  for the purposes of catching any unregistered users.  You can name the account whatever you want. In our system it’s “Mystery Human”.

2) Getting an API Key
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
On the left of your screen, click the admin button.

.. image:: images/fd-image-1.png

Scroll down and select Agents

.. image:: images/fd-image-2.png

Click ‘New Agent

.. image:: images/fd-image-4.png

And then fill out the information needed. This account needs the Administrator and Agent Roles roles.

After you have created that account, sign into it and go to the profile.  You can get there by clicking your account picture and then selecting profile.

In the upper right, you will see ‘Your API Key’

.. image:: images/fd-image-5.png

Please take note of this API Key, you will need it in a little bit.

3) Helpdeskbuttons.com Setup 
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The next step is to sign into your Helpdeskbuttons.com account and enter this information under Settings->Backend Information

.. image:: images/fd-image-3.png

Enter your Ticket System API endpoint and the Ticket System API Key. Your Ticket System API endpoint is the main URL that you use to log into FreshDesk / FreshService. In this instance

.. image:: images/fd-image-6.png

Click update once you are done. At this point, your Freshdesk / FreshService instance will be ready to go with your Helpdesk Buttons.

Access Restrictions
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

As of 0.5.x: The agent needs to have Administrator and Agent Roles.

Anti-Virus and AntiMalware
--------------------------------------

It is not always necessary, but we recommend whitelisting the tier2tickets installation folder (C:\\Program Files(x86)\\tier2tickets). We regularly submit our code through VirusTotal to make sure we are not getting flagged, but almost all AV/M interactions cause some sort of failure. `Webroot <https://docs.tier2tickets.com/content/general/firewall/#webroot>`_ in particular can cause issues with screenshots.


Dispatcher Rules
----------------------------------------------------------------------

This is the list of variables that can be accessed when using the :ref:`Dispatcher Rules <content/automations/dispatcher:Dispatcher Rules>`. 

FreshDesk

+-------------------------------------------------+----------------------------------------------------+
| Read/Write                                      | Read Only                                          |
+=================================================+====================================================+
| :ref:`content/integration/freshdesk:*priority*` | :ref:`content/automations/dispatcher:*selections*` |
+-------------------------------------------------+----------------------------------------------------+
| :ref:`content/integration/freshdesk:*status*`   | :ref:`content/automations/dispatcher:*name*`       |
+-------------------------------------------------+----------------------------------------------------+
| :ref:`content/integration/freshdesk:*group*`    | :ref:`content/automations/dispatcher:*email*`      |
+-------------------------------------------------+----------------------------------------------------+
| :ref:`content/integration/freshdesk:*type*`     | :ref:`content/automations/dispatcher:*ip*`         |
+-------------------------------------------------+----------------------------------------------------+
| :ref:`content/automations/dispatcher:*msg*`     | :ref:`content/automations/dispatcher:*mac*`        |
+-------------------------------------------------+----------------------------------------------------+
| :ref:`content/automations/dispatcher:*subject*` | :ref:`content/automations/dispatcher:*hostname*`   | 
+-------------------------------------------------+----------------------------------------------------+
| :ref:`content/integration/freshdesk:*source*`   |                                                    | 
+-------------------------------------------------+----------------------------------------------------+
| :ref:`content/integration/freshdesk:*agent*`    |                                                    | 
+-------------------------------------------------+----------------------------------------------------+
| :ref:`content/automations/dispatcher:*append*`  |                                                    |
+-------------------------------------------------+----------------------------------------------------+


Field Definitions
^^^^^^^^^^^^^^^^^


*priority*
""""""""""

	**The ticket priority level (Urgent, Low, etc.):**

.. image:: images/fd-priority.png
   :target: https://docs.tier2tickets.com/_images/fd-priority.png

|

*status*
""""""""

	**The ticket status (New, In Progress, etc):**

.. image:: images/fd-status.png
   :target: https://docs.tier2tickets.com/_images/fd-status.png

|

*group*
"""""""

	**The group the ticket will be put in:**

.. image:: images/fd-group.png
   :target: https://docs.tier2tickets.com/_images/fd-group.png

|

*type*
""""""

	**Refers to the issue type (Service Request, Incident, Problem, Alert):**

.. image:: images/fd-type.png
   :target: https://docs.tier2tickets.com/_images/fd-type.png

|
|

*agent*
"""""""

	**The agent that will be assigned this ticket:**

.. image:: images/fd-agent.png
   :target: https://docs.tier2tickets.com/_images/fd-agent.png

|

*source*
""""""""

	**The ticket source (Web Portal, Etc):**
	
.. image:: images/fd-source.png
   :target: https://docs.tier2tickets.com/_images/fd-source.png

|

*priv_append*
"""""""""""""

	**Allows you to append information to the internal ticket note:**

.. image:: images/fd-priv_append.png
   :target: https://docs.tier2tickets.com/_images/fd-priv_append.png

|

*other*
"""""""

The "auto_reg" flag allows users to be auto_registered by their email address instead of added to an unregistered/catch all user. Keep in mind that if a user mistypes their email they will create a user.

There are additional variables which are common to all integrations. Those are documented :ref:`here <content/automations/dispatcher:Universally Available Variables>`

Webhook Walkthrough
----------------------------------------------------------------------

To add a webhook in FreshDesk navigate to: Admin -> Workflow(Automator). Create a new Workflow(Automator) and follow the instructions below for each automation. 

New Tickets:
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Set the conditions for when tickets should send the webhook:

.. image:: images/freshdesk_webhook1.png



- Select Trigger webhook as the action
- Select POST as the request type
- URL should be listed on your `Integration Settings Page. <https://dev.helpdeskbuttons.com/backend.php>`_ under the Ticket Notification section.
- Add the code below:

.. image:: images/freshdesk_webhook2.png

.. code-block:: python

	{
		"ticket_id": "{{ticket.id}}",
		"actor": "{{ticket.contact.name}}",
		"assigned_to": "{{ticket.agent.name}}",
		"action": "create"
	}

For Ticket Updates:
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. code-block:: python

	{
		"ticket_id": "{{ticket.id}}",
		"action": "update",
		"assigned_to": "{{ticket.agent.name}}",
		"last_comment": "{{ticket.latest_public_comment}}",
		"subject": "{{ticket.subject}}",
		"message": "{{ticket.description}}",
		"phone": "{{ticket.contact.phone}}",
		"address": "{{ticket.contact.address}}",
		"mobile": "{{ticket.contact.mobile}}",
		"email": "{{ticket.contact.email}}",
		"name": "{{ticket.contact.firstname}} {{ticket.contact.lastname}}",
		"status": "{{ticket.status}}"
	}
