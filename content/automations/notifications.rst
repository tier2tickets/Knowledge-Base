*BETA* Notifications
========================

This will eventually be a hub for controlling various types of communications between you, us and your end-users. Keep an eye out for future updates here.

.. raw:: html

    <!--<div style="position: relative; padding-bottom: 5%; height: 0; overflow: hidden; max-width: 100%; height: auto;">
        <iframe width="560" height="315" src="https://www.youtube.com/embed/PYqzBX2YuzQ" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
    </div>-->


Webhook Notifications
----------------------------------

If your PSA supports webhooks for ticket events, we can use those webhooks to let your end-users know about ticket updates as they happen. There are a few steps to get this working.


Customize your Notifications
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Before you get the webhooks up and running you may want to customize your notification templates and select which events you think are important to inform your users about. There are some keywords you can use that we will replace with data from the ticket/event itself:

+--------------------+------------------------------------------------------------------------------------------------------+
| __ticket_number__  | The ticket number based on the numbering system of your PSA                                          |
+--------------------+------------------------------------------------------------------------------------------------------+
| __ticket_subject__ | The ticket subject                                                                                   | 
+--------------------+------------------------------------------------------------------------------------------------------+
| __ticket_name__    | The name of the contact associated with the ticket                                                   |
+--------------------+------------------------------------------------------------------------------------------------------+
| __ticket_fname__   | The first name of the contact associated with the ticket                                             |
+--------------------+------------------------------------------------------------------------------------------------------+
| __ticket_lname__   | The last name of the contact assocaited with the ticket                                              |
+--------------------+------------------------------------------------------------------------------------------------------+
| __ticket_email__   | The email address of the contact who submitted the ticket                                            |
+--------------------+------------------------------------------------------------------------------------------------------+
| __actor__          | The name of the person who triggered the current event on the ticket                                 |
+--------------------+------------------------------------------------------------------------------------------------------+
	

Note: *Some of these fields are not specified in the event by the ticket system (particularly the actor), double check the integration documentation for your PSA/ticket system to see if any of these are unavailable to the one you are using*

Set up a Webhook or Callback in your ticket system
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Each ticket system will be a bit different for how this is done, so check the individual integration documentation pages for instructions specific to your PSA. 
 
`Accelo Webhook <https://docs.tier2tickets.com/content/integration/accelo/#webhook-walkthrough-notifications>`_

`Autotask Webhook <https://docs.tier2tickets.com/content/integration/autotask/#setting-up-webhooks>`_

`Connectwise Manage Webhook <https://docs.tier2tickets.com/content/integration/connectwise/#setting-up-a-callback-webhook>`_

`ERPNext Webhooks <https://docs.tier2tickets.com/content/integration/erpnext/#webhook-walkthrough>`_

`FreshDesk Webhook <https://docs.tier2tickets.com/content/integration/freshdesk/#webhook-walkthrough>`_
  
`Repairshopr / Syncro Webhook <https://docs.tier2tickets.com/content/integration/repairshopr/#set-up-a-webhook>`_

`Zendesk Webhook <https://docs.tier2tickets.com/content/integration/zendesk/#webhook-walkthrough>`_

4me, Autotask, Freshservice, and ServiceNow notifications will be added to the development schedule based on community interest. If you are interested in assistance, please contact our team at sales@tier2.tech and we'll get you sorted!

Unfortunately, this feature is unavailable for systems that do not support webhooks, including Kaseya BMS, OSTicket, and the Email Connector. 














