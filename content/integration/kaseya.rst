Kaseya Integration
================================

Navigate to the Employee window:

.. image:: images/ka-image1.png


.. image:: images/ka-image2.png

It is probably best to create a new user, but an existing user with the correct permissions can work. This guide will assume you create a new user.

Click New and create the user with whatever data you may like. The Security Role is the only important part of this process. To start out put it as Administrator. You will need the email address to be something that can recieve the password. Once that is complete an email will be sent to the address specified with the login credentials we need.

Once we have that email, plug the info into the Settings page after selecting Kaseya BMS as the Ticket System. The format is:

Company+username:password

Once you click update you should be good to go. 

Kaseya requires alot of information to submit a ticket. We have chosen some defaults that will allow tickets to go into the system for most users. If additional customization is needed try using our :ref:`Advanced Options <content/integration/advanced:Advanced Options>` feature.

API Access Settings
--------------------

For those of you who want to restrict the access the API user has, here is the security access we need: (a custom security role will need to be created and assigned to us with these permissions):

- Service Desk/My Tickets:		View and Modify - For Creating and editing tickets
- Service Desk/Tickets:			View and Modify	- For Creating and editing tickets
- Service Desk/Unknown Tickets:	View and Modify	- For Creating and editing tickets
- CRM/Accounts					View			- For gathering location data (addresses)
- CRM/Contacts					View			- For Matching tickets with contacts
- Admin/Special Features: Has API Access		- To access the API