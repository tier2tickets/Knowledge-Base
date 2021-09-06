HaloPSA/ITSM Documentation
======================================

This guide will show you how to set up your new Helpdesk Buttons with HaloPSA/ITSM in as few as 15 minutes.

Integration
--------------------------

Connectwise Manage integration requires three main parts:

`1) set up an unregistered user as a catchall account as a contact in your PSA <https://docs.tier2tickets.com/content/integration/halo/#unregistered-user>`_

`2) set up the API integration. <https://docs.tier2tickets.com/content/integration/halo/#get-an-api-key>`_

`3) configure helpdeskbuttons account. <https://docs.tier2tickets.com/content/integration/halo/#helpdeskbuttons-com-settings>`_

Video Walkthrough
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

    <!--<div style="position: relative; padding-bottom: 5%; height: 0; overflow: hidden; max-width: 100%; height: auto;">
        <iframe width="560" height="315" src="https://www.youtube.com/embed/ip2IhU8EqPQ" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
    </div>-->
    
.. image:: images/coming_soon.png

1) Unregistered User
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

You will start off by logging into your HaloPSA/ITSM instance. 

Create an ‘Unregistered’ contact This must have the email address unregistered@helpdeskbuttons.com. You can add this contact to the default Unknown Company/Site

.. image:: images/halo-user.png

This is the user which any Button Press tickets appear to come from if the user is unregistered. Remember to click save.

You are now done setting up your company and contact.

2) Get an API Key
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Next step is to create an API key. Navigate to Configuration > Integrations > Halo(PSA/ITSM) API

Here you can find most of the information you need as well as create a new applicaion key
You will need the tenant, resource server and authentication server from this first screen.

.. image:: images/halo-api1.png

Now click Applications, then New at the top right corner. You can name the key whatever you like, but make sure to collect Client ID and Secret as the Method.

Make sure the key is set to be active.

For permissions we will need at least:

read:tickets
edit:tickets
read:customers
read:crm
read:assets

The login Type should be Agent. and select an agent that the tickets will be put into the system as (if none is selected several lookups will fail preventing the integration from working properly)

When you save, you should be given a client id and a client secret. Keep them in a safe place as the secret cannot be viewed again (a new one can be generated)

Once this has been set up, you will have all the information required.

3) Helpdeskbuttons.com Settings
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Log into your Helpdeskbuttons.com account. Select Software Management> Integration settings. 

Select ‘HaloPSA/HaloITSM’ for the ticket system. Select if you are using an On prem or cloud hosted instance. 

Provide the authentication server and api server information. Don't add https:// or anything after the domain.

Finally put in the api key in the following form depending on your instance type:


Cloud Hosted
"""""""""""""""""""""""""""""""""""""""""""

*tenant+client_id:client_secret*

Here are the components and what they mean:

Comp_a+123asd4asabcd:asdf38judj234

Comp_a is the tenant shown in Halo

123asd4asabcd is the example client_id for the API

asdf38judj234 is the example client_secret for the API

Make sure that there is a + between the tenant and a : between the client id and client secret.

On Prem
"""""""""""""""""""""""""""""""""""""""""""

*client_id:client_secret*

Here are the components and what they mean:

123asd4asabcd:asdf38judj234

123asd4asabcd is the example client_id for the API

asdf38judj234 is the example client_secret for the API

Make sure that there is a : between the client id and client secret.


Once you have entered the correct information on the Helpdesk Buttons page, make to click Update so it saves the changes.


Anti-Virus and AntiMalware
----------------------------------------------------
It is not always necessary, but we recommend whitelisting the tier2tickets installation folder (C:\\Program Files(x86)\\tier2tickets). We regularly submit our code through VirusTotal to make sure we are not getting flagged, but almost all AV/M interactions cause some sort of failure. `Webroot <https://docs.tier2tickets.com/content/general/firewall/#webroot>`_ in particular can cause issues with screenshots.



Dispatcher Rules
--------------------------

This is the list of variables that can be accessed when using the :ref:`Dispatcher Rules <content/automations/dispatcher:*BETA* Dispatcher Rules>`. 

+----------------------------------------------------------------------+----------------------------------------------------+
| Read/Write                                                           |  Read Only                                         |
+======================================================================+====================================================+
| :ref:`content/integration/halo:*priority*`                           | :ref:`content/automations/dispatcher:*selections*` |
+----------------------------------------------------------------------+----------------------------------------------------+
| :ref:`content/integration/halo:*state*`                              | :ref:`content/automations/dispatcher:*name*`       |
+----------------------------------------------------------------------+----------------------------------------------------+
| :ref:`content/integration/halo:*team*`                               | :ref:`content/automations/dispatcher:*email*`      |
+----------------------------------------------------------------------+----------------------------------------------------+
| :ref:`content/integration/halo:*ticketType*`                         | :ref:`content/automations/dispatcher:*ip*`         |
+----------------------------------------------------------------------+----------------------------------------------------+
| :ref:`content/automations/dispatcher:*msg*`                          | :ref:`content/automations/dispatcher:*mac*`        |
+----------------------------------------------------------------------+----------------------------------------------------+
| :ref:`content/automations/dispatcher:*msg*`                          | :ref:`content/automations/dispatcher:*hostname*`   | 
+----------------------------------------------------------------------+----------------------------------------------------+
| :ref:`content/integration/halo:*agent*`                              |                                                    | 
+----------------------------------------------------------------------+----------------------------------------------------+
| :ref:`content/automations/dispatcher:*append*`                       |                                                    | 
+----------------------------------------------------------------------+----------------------------------------------------+


Field Definitions
^^^^^^^^^^^^^^^^^

*priority*
""""""""""

	**The ticket priority level (Urgent, Low, etc.):**

.. image:: images/halo-priority.png

|
|

*state*
"""""""

	**Refers to the ticket status (New, In Progress, etc):**

.. image:: images/halo-status.png

|
|

*team*
""""""

	**Refers to the queue the ticket will be put in:**

.. image:: images/halo-team.png

|
|

*ticketType*
""""""""""""""""""

	**The issue type (Service Request, Incident, Problem, Alert):**

.. image:: images/halo-type.png

|
|

*agent*
"""""""

	**Refers to the agent that will be assigned this ticket:**

.. image:: images/halo-agent.png

|
|


*priv_append*
"""""""""""""

	**Allows you to append information to the internal ticket note:**

.. image:: images/halo-privappend.png

|
|

*other*
"""""""

There are additional variables which are common to all integrations. Those are documented :ref:`here <content/automations/dispatcher:Universally Available Variables>`


Setting up a Webhook
----------------------------------------------------

.. image:: images/coming_soon.png


