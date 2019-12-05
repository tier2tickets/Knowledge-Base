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
| short_description | email         |
+-------------------+---------------+
| description       | ip            |
+-------------------+---------------+
| subject           | mac           | 
+-------------------+---------------+
| append            | callerID      | 
+-------------------+---------------+
| work_notes        |               | 
+-------------------+---------------+