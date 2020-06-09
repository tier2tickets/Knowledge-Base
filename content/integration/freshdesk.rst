Freshdesk / Freshservice Integration
=====================================
This guide will show you how to set up FreshDesk / FreshService to work with your new Helpdesk Buttons.

Unregistered User
-------------------
By default, our software attempts to pair users with their contact information by checking with Freshdesk/Freshservice. If the user is not already found in the system
a catch all account submits the ticket instead. This can be disabled for PSA's that allow users to create accounts on ticket submission. Look at the  :ref:`Advanced Integration Options <content/integration/freshdesk:Advanced Integration Options>` below.

This guide assumes you want to use the catch all contact: 
To start you will need to set up a contact that uses the email address of “unregistered@helpdeskbuttons.com”  for the purposes of catching any unregistered users.  You can name the account whatever you want. In our system it’s “Mystery Human”.

Getting an API Key
--------------------
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

Helpdeskbuttons.com Setup 
---------------------------

The next step is to sign into your Helpdeskbuttons.com account and enter this information under Settings->Backend Information

.. image:: images/fd-image-3.png

Enter your Ticket System API endpoint and the Ticket System API Key. Your Ticket System API endpoint is the main URL that you use to log into FreshDesk / FreshService. In this instance

.. image:: images/fd-image-6.png

Click update once you are done. At this point, your Freshdesk / FreshService instance will be ready to go with your Helpdesk Buttons.

Access Restrictions
--------------------

As of 0.5.x: The agent needs to have Administrator and Agent Roles.

Anti-Virus and AntiMalware
-----------------------------
It is not always necessary, but we recommend whitelisting the helpdeskbuttons installation folder (C:\\Program Files(x86)\\Helpdesk Button). We regularly submit our code through VirusTotal to make sure we are not getting flagged, but almost all AV/M interactions cause some sort of failure. `Webroot <https://docs.tier2tickets.com/content/general/firewall/#webroot>`_ in particular can cause issues with screenshots.

Advanced Integration Options
------------------------------

Defaults
^^^^^^^^^
The "auto_reg" flag allows users to be auto_registered by thier email address instead of added to an unregistered/catch all user. Keep in mind that if a user mistypes their email they will create a user.

Rules
^^^^^^

This is the list of variables that can be accessed when using the :ref:`Custom Rules <content/integration/advanced:Custom Rules>`. 

FreshDesk

+-----------------+---------------+
| Read/Write      | Read Only     |
+=================+===============+
| priority        | selections    |
+-----------------+---------------+
| status          | name          |
+-----------------+---------------+
| group           | email         |
+-----------------+---------------+
| type            | ip            |
+-----------------+---------------+
| message         | mac           |
+-----------------+---------------+
| subject         | hostname      | 
+-----------------+---------------+
| source          |               | 
+-----------------+---------------+
| agent           |               | 
+-----------------+---------------+
| append          |               |
+-----------------+---------------+

Freshservice

+-----------------+---------------+
| Read/Write      | Read Only     |
+=================+===============+
| priority        | selections    |
+-----------------+---------------+
| status          | name          |
+-----------------+---------------+
| department      | email         |
+-----------------+---------------+
| agent           | ip            |
+-----------------+---------------+
| message         | mac           |
+-----------------+---------------+
| subject         | hostname      | 
+-----------------+---------------+
| source          |               | 
+-----------------+---------------+
| impact          |               | 
+-----------------+---------------+
| urgency         |               |
+-----------------+---------------+
| append          |               |
+-----------------+---------------+
| group           |               |
+-----------------+---------------+
| priv_append     |               |
+-----------------+---------------+

Field Definitions
^^^^^^^^^^^^^^^^^

* *priority* refers to the ticket priority (Urgent, Low, ect)
* *impact* and *urgency* can set priority via the SLA priority matrix
* *status* refers to the ticket status (New, In Progress, etc)
* *group* refers to the group the ticket will be put in
* *department* refers to the department the ticket will be put in
* *message* refers to the message the client typed when making the ticket
* *subject* refers to the ticket title
* *append* refers to the information appended to the HDB report
* *agent* refers to the agent that will be assigned this ticket
* *source* refers to the ticket source (Web Portal, P, )
* *priv_append* allows you to append information to the internal ticket note
* *selections* refers to the checkboxes/radio buttons the client chose when creating the ticket
* *name* refers to the client's name
* *email* refers to the client's email
* *ip* refers to the client's external ip address
* *mac* refers to the client's MAC address
* *hostname* refers to the client's hostname 