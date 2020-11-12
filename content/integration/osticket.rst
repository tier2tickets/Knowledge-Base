osTicket Integration
=====================
This guide will show you how to set up osTicket to work with your new Helpdesk Buttons.

osTicket integration requires two main parts:

`1) set up the API integration. <https://docs.tier2tickets.com/content/integration/osticket/#create-your-api-keys>`_

`2) configure helpdeskbuttons account. <https://docs.tier2tickets.com/content/integration/osticket/#helpdeskbutton-com-settings>`_

Video Walkthrough
-----------------------------

.. raw:: html

	<div>
		<iframe width="560" height="315" src="https://www.youtube.com/embed/ZmFLvQ4fcjI" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
	</div>

Create Your API Keys
-----------------------

Once you are logged in as an Admin. Click on Admin Panel in the top-right. 

.. image:: images/os-image-1.png

Now click API Keys under the Manage tab.

.. image:: images/os-image-2.png

We will need to create two API Keys. For each key, click Add New API Key and fill out the form

.. image:: images/os-image-3.png

.. image:: images/os-image-4.png

osTicket requires API Keys be paired with IP addresses. Helpdesk Buttons servers are located at:

- 34.202.14.153
- 3.209.57.193

Let's Label these as Key1 (34.202.14.153) and Key2 (3.209.57.193)

Helpdeskbutton.com Settings
------------------------------

.. image:: images/os-image-5.png


Once you have your API Keys and you put in the url for osTicket put the keys into the appropriate space on Settings page in this format:

Key1:Key2

That should be it. Hit update and test the integration with the Integration Test button.

Anti-Virus and AntiMalware
-----------------------------
It is not always necessary, but we recommend whitelisting the helpdeskbuttons installation folder (C:\\Program Files(x86)\\Helpdesk Button). We regularly submit our code through VirusTotal to make sure we are not getting flagged, but almost all AV/M interactions cause some sort of failure. `Webroot <https://docs.tier2tickets.com/content/general/firewall/#webroot>`_ in particular can cause issues with screenshots.


Dispatcher Rules
-----------------------------------------------

This is the list of variables that can be accessed when using the :ref:`Dispatcher Rules <content/automations/dispatcher:*BETA* Dispatcher Rules>`. 

+--------------------------------------------------------------------------+----------------------------------------------------+
| Read/Write                                                               | Read Only                                          |
+==========================================================================+====================================================+
| :ref:`content/integration/osticket:*priority*`                           | :ref:`content/automations/dispatcher:*selections*` |
+--------------------------------------------------------------------------+----------------------------------------------------+
| :ref:`alert<content/integration/osticket:*alert & auto_respond*>`        | :ref:`content/automations/dispatcher:*name*`       |
+--------------------------------------------------------------------------+----------------------------------------------------+
| :ref:`auto_respond<content/integration/osticket:*alert & auto_respond*>` | :ref:`content/automations/dispatcher:*email*`      |
+--------------------------------------------------------------------------+----------------------------------------------------+
| :ref:`content/automations/dispatcher:*message*`                          | :ref:`content/automations/dispatcher:*hostname*`   |
+--------------------------------------------------------------------------+----------------------------------------------------+
| :ref:`content/automations/dispatcher:*subject*`                          | :ref:`content/automations/dispatcher:*mac*`        | 
+--------------------------------------------------------------------------+----------------------------------------------------+
| :ref:`content/automations/dispatcher:*append*`                           | :ref:`content/automations/dispatcher:*ip*`         | 
+--------------------------------------------------------------------------+----------------------------------------------------+



Field Definitions
^^^^^^^^^^^^^^^^^

*priority*
""""""""""

	**The ticket priority level (Urgent, Low, ect):**

.. image:: images/os-priority.png
   :target: https://docs.tier2tickets.com/_images/os-priority.png

|
|

*alert & auto_respond*
""""""""""""""""""""""

.. image:: images/os-alert+auto.png
   :target: https://docs.tier2tickets.com/_images/os-alert+auto.png

|
|

*other*
"""""""

There are additional variables which are common to all integrations. Those are documented :ref:`here <content/automations/dispatcher:Universally Available Variables>`


