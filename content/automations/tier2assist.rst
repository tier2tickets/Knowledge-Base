*BETA* Tier2Assist
=========================

The basic premise of the design is that after we submit the ticket to your PSA, we give you access to the information and 
allow you to suggest additional steps to the user.

These suggestions are made through series of if statements which use Python syntax. The commands you write are literally
interpreted by Python 3 on the users computer, so you have a full fledged programming language at your disposal to
make your rules.


Edit Tier2Assist
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

There are two views for these rules:

Visual Editor
""""""""""""""""""""""""""""""

.. image:: images/visual.png


The Visual Editor has several features to make dealing with code a bit more friendly. The most useful functions and variables are already populated 
and there is example code to play with by dragging and dropping  onto the sandbox area. Pieces snap together to make sure the code works properly, 
and most of the variables and functions can be right-clicked for help about what they are and how they work.


Code Editor
""""""""""""""""""""""""""""""

.. image:: images/code.png

The Code Editor assumes you know what you are doing so all you see is the code and the line numbers.


Test Rules
^^^^^^^^^^^^^^

You can also test these rules by imputting test data and running the rules against that data. All variables will be outputted so you can see how the rules change them.
If there is a syntax error in the rules we will let you know where, you can also click the link to see the error in the Code Editor.

The test shows everything in a raw format for people who want to know everything about what is happening.  You don't have to worry about things like repeating identical
actions appearing on the clients side. 

.. image:: images/test2.gif


Save Rules
^^^^^^^^^^^^^^

Make sure to save the changes to your rules! The code will be tested to make sure there are no syntax errors, and you will get a message letting you know if it was successful.

 .. image:: images/save.png


Variables
^^^^^^^^^^^^^^

The first thing you need to know when writing a rule is which variables you have available to you. These variables are fixed and should be available to any integration. 

You can see the variables available in the Visual Editor of the Tier2Assist but here they are for reference. There for more information take a look at the 
:ref:`A deeper dive into Variables <content/automations/tier2assist:A deeper dive into Variables>` section below

.. image:: images/variables2.png

What the user sees
^^^^^^^^^^^^^^^^^^^^^^

This is what the user will see after submitting a ticket, if the rules determine a Tier2Assist should be shown.

..image:: images/tier2assist.png

A Tier2assist consists of a message (the text that shows up beside the button) and an action (the command run on the users machine if they click the button).


Examples
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

To show how powerful this can be and give you an idea of how to use it, we came up with a few example rules here:

Chat
"""""""""""""

First off, "selections" is the text that makes up which radio buttons and checkboxes were selected by the user in the GUI.
So let's assume you have a checkbox that says "Chat with us" and you want that check box to cause an option to open a direct chat via tawk.to. This is what that rule
would look like:

.. code-block:: python

	if 'chat' in selections:
		tier2assist.append({'msg': 'You mentioned "chat". We can chat with you right now!', 'action': 'https://tawk.to/chat/5e9ef98435bcbb0c9ab343d5/default'})


Reboot
"""""""""""""""""""""""""""""""""""""

As another example, let's assume you want to always show an option for the user to reboot thier machine. Here is what that rule would look like:

.. code-block:: python

	tier2assist.append({'msg': 'Sometimes a reboot alone will resolve issues, would you like to reboot now?', 'action': 'cmd /c title Preparing to reboot...^&color 4f^&echo. ^&echo Preparing to reboot. To cancel, close this window.^&ping -n 9 127.0.0.1^>nul^&shutdown -r -f -t 0'})


Forms
"""""""""""""""""""""""""""""""""""""

Now lets say you have a form that needs to be filled out upon new employees being hired.  If you want to show an option to fill out this form based on the keywords hiring, hire, and new employee appearing in the message,
here is what that rule might look like:


.. code-block:: python

for phrase in ['hiring', 'hire', 'new employee']:
    if phrase in msg:
        tier2assist.append({'msg': 'If you are looking to add a new employee please fill out this form.', 'action': 'YOUR_FORM_URL_HERE'})

Additionally we have some special integrations with google forms :ref:`Tier2Forms <content/integration/tier2forms:link forms with helpdesk buttons>` to allow the information from a submission of such a form to the ticket that was just created. 


Password Reset
"""""""""""""""""""""""""""""""""""""
If you wanted to show a password reset link if both office and password were included in the ticket message, a rule like this may be appropriate:


.. code-block:: python

	if 'password' in msg and 'office' in msg:
		tier2assist.append({'msg': 'Click here to reset your office password.', 'action': 'https://account.live.com/password/reset'})

Shedule and appointment
"""""""""""""""""""""""""""""""""""""

Now lets say you want to allow a user to schedule and appointment. Here is a
rule that does this if they select a checkbox that contains the word schedule:


.. code-block:: python

	if 'schedule' in selections:
		tier2assist.append({'msg': 'You mentioned "schedule". Let\'s get that scheduled for you.', 'action': 'https://tier2tickets.syncromsp.com/bookings?calendar=101601'})
		
	
External API:  Example Activity
"""""""""""""""""""""""""""""""""""""

We also allow connecting to external APIs. This is a fun API that suggests activities if someone is bored. It is an open API that does not require an API KEY


.. code-block:: python

	activity = json_get('https://www.boredapi.com/api/activity')
	tier2assist.append({'msg': 'Activity of the day: ' + activity['activity'], 'action': 'https://google.com/search?q=' + activity['activity']})


External API:  Example Slack
"""""""""""""""""""""""""""""""""""""

Suppose you would like to get a message to #general in slack whenever you get a new ticket.
Here is what that rule looks like (Make sure to put in your Slack API Key in the spot provided):


.. code-block:: python

	post_result = json_post('https://slack.com/api/chat.postMessage', {'channel': '#general', 'text': 'New ticket created. Ticket number: ' + ticketNumber}, {'Authorization': 'Bearer YOUR_SLACK_API_KEY_HERE'})


Random
"""""""""""""""""""""""""""""""""""""

Sometimes it is best to have an option show up randomly (Customer Satisfaction surveys for instance). This rule will show up randomly (around 50% of the time) to give the user a random Wikipedia article:

.. code-block:: python

	if random.random() <= 0.5:
		tier2assist.append({'msg': 'this is something random', 'action': 'https://en.wikipedia.org/wiki/Wikipedia:Random'})

Each of these examples should be viewable in the Visual Editor.


A deeper dive into Variables
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

When designing the custom rules, there are certain variables which will always be available to you because they correspond with input from
our application and not from the ticket system integration being used. They are outlined as follows.

*selections*
""""""""""""

	**Refers to the checkboxes/radio buttons the end-user chose when creating the ticket:**

.. image:: images/advanced-selections.png
   :target: https://docs.tier2tickets.com/_images/advanced-selections.png

|
|

*hostname*
""""""""""""""""""""""

	**The hostname of the computer from which the end-user submitted the ticket:**

.. image:: images/advanced-hostname.png
   :target: https://docs.tier2tickets.com/_images/advanced-hostname.png

|
|

*email*
"""""""

	**The email address the end-user entered to submit the ticket:**

.. image:: images/advanced-email.png
   :target: https://docs.tier2tickets.com/_images/advanced-email.png

|
|

*name*
""""""

	**The end-user's name. This may be the name they entered into the input field or what the ticket system says is the name for that email address:**

.. image:: images/advanced-name.png
   :target: https://docs.tier2tickets.com/_images/advanced-name.png

|
|

*sourceIp*
""""""""""""""""""""""""""""""""""""

	**The WAN IP address from which the end-user submitted the ticket**

|
|

*mac*
""""""""""""""""""""

	**The MAC address of the computer from which the end-user submitted the ticket:**

.. image:: images/advanced-mac.png
   :target: https://docs.tier2tickets.com/_images/advanced-mac.png

|
|

*msg*
"""""""""

	**The message which the end-user typed to generate this ticket:**

.. image:: images/advanced-message.png
   :target: https://docs.tier2tickets.com/_images/advanced-message.png

|
|

*append*
""""""""""""""

	**Refers to some text that has been appended to the message. This typically will have been generated by a** :ref:`Tier2Script <content/customization/tier2scripts:_append.txt>` **:**

.. image:: images/advanced-append.png
   :target: https://docs.tier2tickets.com/_images/advanced-append.png

|
|

*ticketID*
""""""""""""""
	
	**The internal ticket ID the PSA uses to identify each ticket (often different from the ticket number)**
	
*ticketNumber*
""""""""""""""""""""""""""""
	
	**The ticket number the uiser will most likely see to identify a ticket (often different from the ticket id)**
	

*username*
""""""""""""""""""""""""""""

	**The username of the windows account that submitted the current ticket.**
	

*version*
""""""""""""""""""""""""""""

	**The version number of the HDB software**
