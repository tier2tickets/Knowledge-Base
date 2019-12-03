osTicket Integration
=====================
This guide will show you how to set up osTicket to work with your new Helpdesk Buttons.


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

.. image:: images/os-image-5.png


Once you have your API Keys and you put in the url for osTicket put the keys into the appropriate space on Settings page in this format:

Key1:Key2

That should be it. Hit update and test the integration with the Integration Test button.


Advanced Integration Options
-----------------------------

+-----------------+---------------+
| Read/Write      | Read Only     |
+=================+===============+
| priority        | selections    |
+-----------------+---------------+
| alert           | name          |
+-----------------+---------------+
| auto_respond    | email         |
+-----------------+---------------+
| message         | append        |
+-----------------+---------------+
| subject         | mac           | 
+-----------------+---------------+
|                 | ip            | 
+-----------------+---------------+
|                 | hostname      | 
+-----------------+---------------+