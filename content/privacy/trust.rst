User Trust Factor
==================

This feature helps to deal with validation of tickets. Submission of a ticket is very simple in our system. So simple that it is pontentially easy for a person to impersonate another when submitting a ticket. 

For example: Malory is a bad egg. She wants to look at some classified financial documents and decides submitting a ticket to her companies IT department is the way to get that access.
She starts the software, puts in her manager's name and email along with a request to give Malory access to a departments financial documents folder.

In this example, a ticket would be generated in your PSA that apppeared to be from the office manager requesting to give Malory access to financial documents.

To help combat this we developed the User Trust Factor system.

This system correlates the email address, MAC address, IP address, and username/domain for your customers ticket report submissions. Once you have verified through whatever process you think is necessary (call, viewing screenshots, etc) you or a tech that has access to tickets can toggle this to true. From then on every submission that comes matching that exact signature will also come in as trusted.

This is what the User Trust Factor looks like in the report.

.. image:: images/not-trusted.png
.. image:: images/trusted.png

All users will start out as untrusted until they are toggled. Once they are toggled, all ticket reports with that signature will reflect the setting. Once the setting has been changed, a line giveing details about who and when the setting was changed will be shown, regardless of the current state of the User Trust Factor. The entire history of the changes to this setting is available at request.
 

 
