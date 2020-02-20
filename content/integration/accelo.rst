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

Yout API key is formatted as shown 

api_username:api_secret

Click update and the Integration Test button. 

Anti-Virus and AntiMalware
-----------------------------
It is not always necessary, but we recommend whitelisting the helpdeskbuttons installation folder (C:\\Program Files(x86)\\Helpdesk Button). We regularly submit our code through VirusTotal to make sure we are not getting flagged, but almost all AV/M interactions cause some sort of failure. `Webroot <https://docs.tier2tickets.com/content/general/firewall/#webroot>`_ in particular can cause issues with screenshots.

Advanced Integration Options
------------------------------

Custom Rules
^^^^^^^^^^^^^

This is the list of variables that can be accessed when using the :ref:`Custom Rules <content/integration/advanced:Custom Rules>`. 

+-------------------+---------------+
| Read/Write        | Read Only     |
+===================+===============+
| priority          | selections    |
+-------------------+---------------+
| type              | hostname      |
+-------------------+---------------+
| standing          | name          |
+-------------------+---------------+
| priv_append       | email         |
+-------------------+---------------+
| message           | ip            |
+-------------------+---------------+
| subject           | mac           | 
+-------------------+---------------+
| append            |*input_cell*   | 
+-------------------+---------------+
| assignee          |*input_phone*  | 
+-------------------+---------------+
| class             |*input_company*| 
+-------------------+---------------+
|                   |*input_email*  | 
+-------------------+---------------+
|                   |*input_name*   | 
+-------------------+---------------+

Field Definitions
^^^^^^^^^^^^^^^^^

- *priority* refers to the ticket priority
- *standing* refers to the ticket status (New, In Progress, etc)
- *type* refers to the issue type (Service Request, Incident, Problem, Alert)
- *message* refers to the message the client typed when making the ticket
- *assignee* refers to the agent that will be assigned this ticket
- *class* refers to the tickets class (Accounts/Renewals, E-commerce)
- *subject* refers to the ticket title
- *append* refers to the information appended to the HDB report
- *priv_append* allows you to append information to the internal ticket note
- *selections* refers to the checkboxes/radio buttons the client chose when creating the ticket
- *name* refers to the client's name (according to the PSA)
- *email* refers to the client's email
- *ip* refers to the client's external ip address
- *mac* refers to the client's MAC address
- *hostname* refers to the client's hostname

The fields labeled input_* contain information typed by the user only in the event that they are not found in the PSA