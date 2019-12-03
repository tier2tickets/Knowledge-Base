Freshdesk / Freshservice Integration
=====================================
This guide will show you how to set up FreshDesk / FreshService to work with your new Helpdesk Buttons.

To start you will need to set up a contact that uses the email address of “unregistered@helpdeskbuttons.com”  for the purposes of catching any unregistered users.  You can name the account whatever you want. In our system it’s “Mystery Human”.

On the left of your screen, click the admin button.

.. image:: images/fd-image-1.png

Scroll down and select Agents

.. image:: images/fd-image-2.png

Click ‘New Agent

.. image:: images/fd-image-4.png

And then fill out the information needed. This account just needs the ‘Agent’ role for it to work.

After you have created that account, sign into it and go to the profile.  You can get there by clicking your account picture and then selecting profile.

In the upper right, you will see ‘Your API Key’

.. image:: images/fd-image-5.png

Please take note of this API Key, you will need it in a little bit.

The next step is to sign into your Helpdeskbuttons.com account and enter this information under Settings->Backend Information

.. image:: images/fd-image-3.png

Enter your Ticket System API endpoint and the Ticket System API Key. Your Ticket System API endpoint is the main URL that you use to log into FreshDesk / FreshService. In this instance

.. image:: images/fd-image-6.png

Click update once you are done. At this point, your Freshdesk / FreshService instance will be ready to go with your Helpdesk Buttons.

Access Restrictions
--------------------

As of 0.5.x: The agent needs to have Administrator and Agent Roles.

Advanced Integration Options
------------------------------

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
| message         | append        |
+-----------------+---------------+
| subject         | hostname      | 
+-----------------+---------------+
| source          | mac           | 
+-----------------+---------------+
| impact          |               | 
+-----------------+---------------+
| urgency         |               |
+-----------------+---------------+
| agent           |               | 
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
| message         | append        |
+-----------------+---------------+
| subject         | hostname      | 
+-----------------+---------------+
| source          | mac           | 
+-----------------+---------------+
| impact          |               | 
+-----------------+---------------+
| urgency         |               |
+-----------------+---------------+