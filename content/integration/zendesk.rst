Zendesk Integration
========================
This guide will show you how to set up your new Helpdesk Buttons with Zendesk.

Video Walkthrough
-----------------------------

.. raw:: html

    <div style="position: relative; padding-bottom: 5%; height: 0; overflow: hidden; max-width: 100%; height: auto;">
        <iframe width="560" height="315" src="https://www.youtube.com/embed/rRK2_tzN4y8" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
    </div>



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

Dispatcher Rules
-----------------------------------------------

This is the list of variables that can be accessed when using the :ref:`Dispatcher Rules <content/automations/dispatcher:*BETA* Dispatcher Rules>`. 

+--------------------------------------------------+-------------------------------------------------------------+
| Read/Write                                       | Read Only                                                   |
+==================================================+=============================================================+
| :ref:`content/integration/zendesk:*priority*`    | :ref:`content/automations/dispatcher:*selections*`          |
+--------------------------------------------------+-------------------------------------------------------------+
| :ref:`content/integration/zendesk:*type*`        | :ref:`content/automations/dispatcher:*hostname*`            |
+--------------------------------------------------+-------------------------------------------------------------+
| :ref:`content/integration/zendesk:*status*`      | :ref:`content/automations/dispatcher:*name*`                |
+--------------------------------------------------+-------------------------------------------------------------+
| :ref:`content/integration/zendesk:*priv_append*` | :ref:`content/automations/dispatcher:*email*`               |
+--------------------------------------------------+-------------------------------------------------------------+
| :ref:`content/automations/dispatcher:*message*`  | :ref:`content/automations/dispatcher:*ip*`                  |
+--------------------------------------------------+-------------------------------------------------------------+
| :ref:`content/automations/dispatcher:*subject*`  | :ref:`content/automations/dispatcher:*mac*`                 | 
+--------------------------------------------------+-------------------------------------------------------------+
|                                                  | .. raw:: html                                               |
|                                                  |                                                             |
|                                                  |    <i>                                                      |
|                                                  |                                                             |
| :ref:`content/automations/dispatcher:*append*`   | :ref:`input_cell<content/integration/zendesk:*input_**>`    | 
+--------------------------------------------------+-------------------------------------------------------------+
|                                                  | .. raw:: html                                               |
|                                                  |                                                             |
|                                                  |    <i>                                                      |
|                                                  |                                                             |
|                                                  | :ref:`input_phone<content/integration/zendesk:*input_**>`   | 
+--------------------------------------------------+-------------------------------------------------------------+
|                                                  | .. raw:: html                                               |
|                                                  |                                                             |
|                                                  |    <i>                                                      |
|                                                  |                                                             |
|                                                  | :ref:`input_company<content/integration/zendesk:*input_**>` | 
+--------------------------------------------------+-------------------------------------------------------------+
|                                                  | .. raw:: html                                               |
|                                                  |                                                             |
|                                                  |    <i>                                                      |
|                                                  |                                                             |
|                                                  | :ref:`input_email<content/integration/zendesk:*input_**>`   | 
+--------------------------------------------------+-------------------------------------------------------------+
|                                                  | .. raw:: html                                               |
|                                                  |                                                             |
|                                                  |    <i>                                                      |
|                                                  |                                                             |
|                                                  | :ref:`input_name<content/integration/zendesk:*input_**>`    | 
+--------------------------------------------------+-------------------------------------------------------------+


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

There are additional variables which are common to all integrations. Those are documented :ref:`here <content/automations/dispatcher:Universally Available Variables>`

The fields labeled input_* contain information typed by the user only in the event that they are not found in the PSA











