ServiceNow Integration
========================

Unregistered User
------------------

To start you will need to set up a contact that uses the email address of “unregistered@helpdeskbuttons.com” for the purposes of catching any unregistered users.

Navigate to Callers and Click New

.. image:: images/sn-image-1.png

The only really important part is the email address. Feel free to name it anything you feel comfortable with.

.. image:: images/sn-image-2.png


Helpdeskbuttons.com Settings
-------------------------------

On the Settings page of helpdeskbuttons, put in the endpoint and a username:password combo as the API Key.

Click update and the Integration Test button. 

Let us know how to get in touch with your development team for feature requests and additional customizations! We are happy to get you set up with customized software.

Anti-Virus and AntiMalware
-----------------------------
It is not always necessary, but we recommend whitelisting the helpdeskbuttons installation folder (C:\\Program Files(x86)\\Helpdesk Button). We regularly submit our code through VirusTotal to make sure we are not getting flagged, but almost all AV/M interactions cause some sort of failure. `Webroot <https://docs.tier2tickets.com/content/general/firewall/#webroot>`_ in particular can cause issues with screenshots.

Advanced Integration Options
------------------------------

This is the list of variables that can be accessed when using the :ref:`Custom Rules <content/integration/advanced:Custom Rules>`. 


+-------------------+---------------+
| Read/Write        | Read Only     |
+===================+===============+
| impact            | selections    |
+-------------------+---------------+
| urgency           | hostname      |
+-------------------+---------------+
| incidentState     | name          |
+-------------------+---------------+
| priv_append       | email         |
+-------------------+---------------+
| message           | ip            |
+-------------------+---------------+
| subject           | mac           | 
+-------------------+---------------+
| append            | callerID      | 
+-------------------+---------------+

Field Definitions
^^^^^^^^^^^^^^^^^

- *impact* and *urgency* set priority via the SLA priority matrix
- *incidentState* refers to the ticket status (New, In Progress, etc)
- *type* refers to the issue type (Service Request, Incident, Problem, Alert)
- *message* refers to the message the client typed when making the ticket
- *short_description* refers to the ticket title
- *append* refers to the information appended to the HDB report
- *source* refers to the ticket source (Web Portal, P, )
- *priv_append* allows you to append information to the internal ticket note
- *selections* refers to the checkboxes/radio buttons the client chose when creating the ticket
- *contactName* refers to the client's name
- *email* refers to the client's email
- *ip* refers to the client's external ip address
- *mac* refers to the client's MAC address
- *hostname* refers to the client's hostname 
- *issue* refers to the primary ticket issue
- *subissue* refers ro the secondary ticket issue