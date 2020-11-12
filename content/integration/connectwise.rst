Connectwise Manage Documentation
======================================

This guide will show you how to set up your new Helpdesk Buttons with ConnectWise Manage in as few as 15 minutes.

Integration
--------------------------

Video Walkthrough
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

    <div style="position: relative; padding-bottom: 5%; height: 0; overflow: hidden; max-width: 100%; height: auto;">
        <iframe width="560" height="315" src="https://www.youtube.com/embed/ip2IhU8EqPQ" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
    </div>

1) Unregistered User
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

You will start off by logging into your ConnectWise Manage instance. The first step is to create a dummy company to catch tickets from unregistered users (If you already have a catch all that can submit tickets feel free to use that company). Fill out the required fields with your companies information and remember to click save.  You might name the company “unregistered users” or something to that effect.

.. image:: images/cw-image-10.png
  :width: 400
  :alt: Alternative text

Once the company has been created, select Company Finance

.. image:: images/cw-image-4.png

Set the newly created company to ‘Active’ and click ‘Save’.

.. image:: images/cw-image-8.png

Create an ‘Unregistered’ contact This must have the email address unregistered@helpdeskbuttons.com

.. image:: images/cw-image-9.png

This is the user which any Button Press tickets appear to come from if the user is unregistered. Remember to click save.

You are now done setting up your company and contact.

2) Get an API Key
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Next step is to create an API key.

First you need your company name. This appears on the login screen.

.. image:: images/cw-image-5.png

Log into ConnectWise Manage and then select System and then Members

.. image:: images/cw-image-7.png

Select the ‘API Members’ tab.

.. image:: images/cw-image-6.png

Click on the ‘New’ button and set up the new API member

.. image:: images/cw-image-2.png

Enter a member ID and name which fits your organization. Select the appropriate System options according to how your ConnectWise Manage system is configured.

**Take note of the Service Defaults as they can effect the way tickets come into the system.**

Be sure to click ‘Save’ when everything looks correct.

Next, browse to the ‘API Keys’ tab.

Click ‘New’ and set an appropriate description.

Be sure to copy both the Public and Private Keys

.. image:: images/cw-image-3.png

Once this has been set up, you will have all the information required.

3) Helpdeskbuttons.com Settings
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Log into your Helpdeskbuttons.com account. Select settings and then Backend Information

.. image:: images/cw-image-1.png

Select ‘Connectwise manage’ for the ticket system

For the Ticket System API endpoint you would use

yourconnectwiseinstance.com/v4_6_release

Do not Substitute the /v4_6_release part for your ConnectWise version, this is the API version, and should always be se to v4_6_release.

The Ticket System API Key format is as follows

Companyid+publickey:privatekey

For example

Comp_a+123asd4asabcd:asdf38judj234

Comp_a is the company ID normally entered on the login screen

123asd4asabcd is the example public key for the API

Asdf38judj234 is the example private key for the API

Make sure that there is a + between the company ID and a : between the public and private key.

Once you have entered the correct information on the Helpdeskbutton page, make to click Update so it saves the changes.

Test by submitting a ticket using the button.

Manage Configurations (BETA)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Our Software will attempt to attach configurations from the users company whose device id's match the hostname of the computer submitting the ticket.



API Access Settings
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

For those of you who want to restrict the access the API user has, here is the security access we need: (a custom role will need to be created and assigned to us with these permissions):

- Companies/Company Maintenance/Inquire Level - All (For gathering company data like street addresses)
- Companies/Contacts/Inquire Level - All (For gathering contact data like email addresses)
- Service Desk/Service Ticket - Dependencies/ Add, Edit, Inquire Level - All (Adding/editing/reading notes and attachments on tickets)
- Service Desk/Service Ticket/ Add, Edit, Inquire Level - All (Adding/editing/reading tickets)

*New in version 6 (BETA)*

- Companies/Configurations/Inquire Level - All (For including configurations pertaining to the ticket)

*As of version v2020_4 of ConnectWise Manage*

- System/Table Setup/Inquire Level - All (For checking values like prority, board, etc)


The group is based on your company, but it can be tricky. We recommend leaving this as Admin as it the integration will require access to view contact information based on the clients input. To avoid errors, your staff would need to make sure that no one puts in an email address that corresponds to a contact that is not covered by the group to which this API user belongs. To be clear, the permissions don't need to be Admin, but the group does. This will allow us access to all of your customers, but only limited access to each.

Keep in mind that this list is based on the current feature set. With the expansion of the product, different security settings may need to be tweaked in the future.

Integration Defaults
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Many of the fields can be set to "__default__"

Note: State, Team and Type are all related to the Board. For any customizations to those fields 
do not use the "__default__" Board. Please provide the Board by name (This also applies to Dispatcher Rules).


Anti-Virus and AntiMalware
----------------------------------------------------
It is not always necessary, but we recommend whitelisting the helpdeskbuttons installation folder (C:\\Program Files(x86)\\Helpdesk Button). We regularly submit our code through VirusTotal to make sure we are not getting flagged, but almost all AV/M interactions cause some sort of failure. `Webroot <https://docs.tier2tickets.com/content/general/firewall/#webroot>`_ in particular can cause issues with screenshots.



Dispatcher Rules
--------------------------

This is the list of variables that can be accessed when using the :ref:`Dispatcher Rules <content/automations/dispatcher:*BETA* Dispatcher Rules>`. 

+----------------------------------------------------------------------+----------------------------------------------------+
| Read/Write                                                           |  Read Only                                         |
+======================================================================+====================================================+
| :ref:`content/integration/connectwise:*priority*`                    | :ref:`content/automations/dispatcher:*selections*` |
+----------------------------------------------------------------------+----------------------------------------------------+
| :ref:`content/integration/connectwise:*state*`                       | :ref:`content/automations/dispatcher:*name*`       |
+----------------------------------------------------------------------+----------------------------------------------------+
| :ref:`content/integration/connectwise:*team*`                        | :ref:`content/automations/dispatcher:*email*`      |
+----------------------------------------------------------------------+----------------------------------------------------+
| :ref:`content/integration/connectwise:*type*`                        | :ref:`content/automations/dispatcher:*ip*`         |
+----------------------------------------------------------------------+----------------------------------------------------+
| :ref:`content/integration/advanced:*message*`                        | :ref:`content/automations/dispatcher:*mac*`        |
+----------------------------------------------------------------------+----------------------------------------------------+
| :ref:`content/integration/advanced:*subject*`                        | :ref:`content/automations/dispatcher:*hostname*`   | 
+----------------------------------------------------------------------+----------------------------------------------------+
| :ref:`content/integration/connectwise:*source*`                      |                                                    | 
+----------------------------------------------------------------------+----------------------------------------------------+
| :ref:`impact<content/integration/connectwise:*impact & urgency*>`    |                                                    | 
+----------------------------------------------------------------------+----------------------------------------------------+
| :ref:`urgency<content/integration/connectwise:*impact & urgency*>`   |                                                    |
+----------------------------------------------------------------------+----------------------------------------------------+
| :ref:`content/integration/connectwise:*owner*`                       |                                                    | 
+----------------------------------------------------------------------+----------------------------------------------------+
| :ref:`content/integration/connectwise:*board*`                       |                                                    | 
+----------------------------------------------------------------------+----------------------------------------------------+
| :ref:`content/integration/advanced:*append*`                         |                                                    | 
+----------------------------------------------------------------------+----------------------------------------------------+




Field Definitions
^^^^^^^^^^^^^^^^^

*priority*
""""""""""

	**The ticket priority level (Urgent, Low, ect):**

.. image:: images/cw-priority.png
   :target: https://docs.tier2tickets.com/_images/cw-priority.png

|
|

*impact & urgency*
""""""""""""""""""""

	**Can set priority via the SLA priority matrix:**

.. image:: images/cw-impact+urgency.png
   :target: https://docs.tier2tickets.com/_images/cw-impact+urgency.png

|
|

*state*
"""""""

	**Refers to the ticket status (New, In Progress, etc):**

.. image:: images/cw-state.png
   :target: https://docs.tier2tickets.com/_images/cw-state.png

|
|

*team*
""""""

	**Refers to the queue the ticket will be put in:**

.. image:: images/cw-team.png
   :target: https://docs.tier2tickets.com/_images/cw-team.png

|
|

*type*
""""""

	**The issue type (Service Request, Incident, Problem, Alert):**

.. image:: images/cw-type.png
   :target: https://docs.tier2tickets.com/_images/cw-type.png

|
|

*owner*
"""""""

	**Refers to the agent that will be assigned this ticket:**

.. image:: images/cw-owner.png
   :target: https://docs.tier2tickets.com/_images/cw-owner.png

|
|

*source*
""""""""

	**The ticket source (Web Portal, Etc):**

.. image:: images/cw-source.png
   :target: https://docs.tier2tickets.com/_images/cw-source.png

|
|

*board*
""""""""

	**The board the ticket will be put under :**

.. image:: images/cw-board.png
   :target: https://docs.tier2tickets.com/_images/cw-board.png

|
|

*priv_append*
"""""""""""""

	**Allows you to append information to the internal ticket note:**

.. image:: images/cw-priv_append.png
   :target: https://docs.tier2tickets.com/_images/cw-priv_append.png

|
|

*other*
"""""""

There are additional variables which are common to all integrations. Those are documented :ref:`here <content/automations/dispatcher:Universally Available Variables>`


Setting up a Callback (Webhook)
----------------------------------------------------

To do this in Manage, go to System -> Setup Tables -> Integrator Login

You will want to create a new one. We don't actualy need the credentials.

On this screen make sure to fillout the fields as described: 

- Access Level: All Records

- API Name: Service Ticket

	- Callback URL: The URL on the Notification Page in the Helpdeskbutton portal.

	- Service Board: The board you want the Notifications to function on. 
	
Click Save and you are all done.

.. image:: images/connectwise_callbacks.gif




