Zendesk Documentation
=====================

This guide will show you how to set up your new Helpdesk Buttons with Zendesk in as few as 15 minutes.

Integration
-----------

The Zendesk integration requires three main parts:

#. Set up an unregistered user as a catchall contact.
#. Configure authentication using OAuth or an existing API token.
#. Configure your Helpdesk Buttons account.

.. important::

   New integrations should use OAuth. Existing API Token integrations must
   move to OAuth before **April 30, 2027**. See the OAuth setup section below.

Video Walkthrough
^^^^^^^^^^^^^^^^^

.. raw:: html

    <div style="position: relative; padding-bottom: 5%; height: 0; overflow: hidden; max-width: 100%; height: auto;">
        <iframe width="560" height="315" src="https://www.youtube.com/embed/rRK2_tzN4y8" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
    </div>

1) Unregistered User
^^^^^^^^^^^^^^^^^^^^

Create a catchall contact for users who are not already in your Zendesk account.

Hover over **Add** and click **User**.

.. image:: images/zd-image3.png

Set the email address to ``unregistered@helpdeskbuttons.com``. You can choose any name for this contact.

.. image:: images/zd-image4.png

.. _enable-api-access-and-create-a-new-key:

2) API Token Authentication (Existing Integrations)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

API Token authentication is available for existing integrations with an
active token. Zendesk has stopped issuing new API tokens. Use the OAuth
setup section below for new integrations.

The screenshots below show the older API settings interface.

.. image:: images/zd-image1.png

.. image:: images/zd-image2.png

.. image:: images/zd-image5.png

Keep your existing token available if you need to update your integration
before moving to OAuth.

3) Helpdeskbuttons.com Settings
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Open **Integration Settings** in your Helpdesk Buttons account.

#. Select **Zendesk** as the ticket system.

#. Enter your Zendesk hostname in **Ticket System API endpoint**, such as
   ``yourcompany.zendesk.com``. Omit ``https://`` and any path.

#. Select **API Token** or **OAuth** under **Zendesk Authentication**.

#. Enter the credentials for your selected authentication method.

   **API Token**

   .. code-block:: text

      username:apikey

   **OAuth**

   .. code-block:: text

      tier2tickets:YOUR_CLIENT_SECRET

   For OAuth, replace ``tier2tickets`` with the Identifier you chose when
   creating the OAuth client. See the OAuth setup section below.

#. Click **Update** to save your settings.

#. Review the Priority, Status, and Type choices loaded from Zendesk.
   Save any changes, then click **Integration Test**. Confirm that the
   ticket appears in Zendesk and includes the private report comment.

Contact us for feature requests and additional integration customizations.

Zendesk OAuth Setup and API Token Retirement
--------------------------------------------

The Tier2Tickets Zendesk integration now supports OAuth authentication.
Existing integrations using API Token authentication should move to OAuth
**before April 30, 2027**.

Zendesk will permanently deactivate all remaining API tokens on that date.
Existing tokens can also stop working earlier because of inactivity.
New integrations should use OAuth.

See `Zendesk's migration timeline
<https://developer.zendesk.com/documentation/authentication/oauth-migration/>`_
for details.

Create an OAuth client in Zendesk
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Sign in to Zendesk as an administrator and open
**Admin Center > Apps and integrations > APIs > OAuth clients**.

Add a new client and configure these settings.

.. list-table::
   :header-rows: 1
   :widths: 30 70

   * - Setting
     - Value
   * - Client name
     - Tier2Tickets
   * - Identifier
     - ``tier2tickets``, or another unique identifier
   * - Client kind
     - **Confidential**
   * - Redirect URIs
     - Leave empty
   * - Allowed scopes
     - Select **read** and **write**

Save the client and copy its **Identifier** and generated **Secret**.
Store the secret securely when Zendesk displays it.

This integration uses the client credentials flow. Zendesk associates its
access tokens with the user who created the OAuth client, so that user
must have permission to look up users, create tickets, and update ticket
comments.

See `Zendesk's OAuth setup documentation
<https://developer.zendesk.com/documentation/authentication/oauth-migration/#setting-up-an-oauth-client>`_
for details.

Integration Defaults
--------------------

*auto_reg*
^^^^^^^^^^

The ``auto_reg`` flag allows users to be automatically registered using
their email address. If a user mistypes their email address, a new user
record will be created for that address.

To set ``auto_reg`` as an integration default, add it as a custom field.

.. image:: images/freshdesk_auto1.png
   :target: https://docs.tier2tickets.com/_images/freshdesk_auto1.png

Click **Update** to save the changes. The result should look like this.

.. image:: images/freshdesk_auto2.png
   :target: https://docs.tier2tickets.com/_images/freshdesk_auto2.png

Antivirus and Antimalware
-------------------------

It is not always necessary, but we recommend whitelisting the tier2tickets installation folder (C:\\Program Files(x86)\\tier2tickets). We regularly submit our code through VirusTotal to make sure we are not getting flagged, but almost all AV/M interactions cause some sort of failure. `Webroot <https://docs.tier2tickets.com/content/general/firewall/#webroot>`_ in particular can cause issues with screenshots.

Dispatcher Rules
----------------

This is the list of variables that can be accessed when using the :ref:`Dispatcher Rules <content/automations/dispatcher:Dispatcher Rules>`.

.. list-table::
   :header-rows: 1
   :widths: 50 50

   * - Read/Write
     - Read Only
   * - :ref:`content/integration/zendesk:*priority*`
     - :ref:`content/automations/dispatcher:*selections*`
   * - :ref:`content/integration/zendesk:*type*`
     - :ref:`content/automations/dispatcher:*hostname*`
   * - :ref:`content/integration/zendesk:*status*`
     - :ref:`content/automations/dispatcher:*name*`
   * - :ref:`content/integration/zendesk:*priv_append*`
     - :ref:`content/automations/dispatcher:*email*`
   * - :ref:`content/automations/dispatcher:*msg*`
     - :ref:`content/automations/dispatcher:*ip*`
   * - :ref:`content/automations/dispatcher:*subject*`
     - :ref:`content/automations/dispatcher:*mac*`
   * - :ref:`content/automations/dispatcher:*append*`
     - :ref:`input_cell <zendesk-input-fields>`
   * -
     - :ref:`input_phone <zendesk-input-fields>`
   * -
     - :ref:`input_company <zendesk-input-fields>`
   * -
     - :ref:`input_email <zendesk-input-fields>`
   * -
     - :ref:`input_name <zendesk-input-fields>`

Field Definitions
^^^^^^^^^^^^^^^^^

*priority*
""""""""""

**The ticket priority level (Urgent, Low, etc.):**

.. image:: images/zd-priority.png
   :target: https://docs.tier2tickets.com/_images/zd-priority.png

*status*
""""""""

**The ticket status (New, In Progress, etc):**

.. image:: images/zd-status.png
   :target: https://docs.tier2tickets.com/_images/zd-status.png

*type*
""""""

**Refers to the issue type (Service Request, Incident, Problem, Alert):**

.. image:: images/zd-type.png
   :target: https://docs.tier2tickets.com/_images/zd-type.png

*priv_append*
"""""""""""""

**Allows you to append information to the internal ticket note:**

.. image:: images/zd-priv_append.png
   :target: https://docs.tier2tickets.com/_images/zd-priv_append.png

.. _zendesk-input-fields:

``input_*``
"""""""""""

.. image:: images/zd-inputs.png
   :target: https://docs.tier2tickets.com/_images/zd-inputs.png

*other*
"""""""

There are additional variables which are common to all integrations. Those are documented :ref:`here <content/automations/dispatcher:Universally Available Variables>`.

The fields labeled ``input_*`` contain information entered by the user
when the user is not found in Zendesk.

Webhook Walkthrough
-------------------

.. note::

   This section describes the legacy Zendesk target and trigger setup.
   See `Zendesk's removal notice
   <https://support.zendesk.com/hc/en-us/articles/360056379854-Removal-of-Zendesk-Connect>`_
   before using this workflow.

The legacy setup has two steps.

1) Create a Target for the Webhook
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Navigate to **Admin > Settings > Extensions**.

Click **Add target**, then **HTTP Target**.

- Name the Target
- URL should be listed on your `Integration Settings Page. <https://dev.helpdeskbuttons.com/backend.php>`_ under the Ticket Notification section.
- Select POST as the request type
- Set Content type to JSON

.. image:: images/zendesk-webhook3.png

2) Set Up a Trigger in Zendesk
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Navigate to **Admin > Triggers**.

Click **Add Trigger**.

- Name the Trigger
- Set Ticket is Updated as the condition

.. image:: images/zendesk-webhook1.png

- Select the Action Notify Target
- Select the webhook target created in the previous step
- Add this code into the JSON body of the action

.. code-block:: json

    {
        "actor":"{{current_user.name}}",
        "role":"{{current_user.role}}",
        "assigned_to":"{{ticket.assignee.name}}",
        "message":"{{ticket.verbatim_description}}",
        "ticket_id":"{{ticket.id}}",
        "name":"{{ticket.requester.name}}",
        "company":"{{ticket.organization.name}}",
        "status":"{{ticket.status}}",
        "subject":"{{ticket.title}}",
        "comment":"{{ticket.latest_public_comment_rich}}",
        "email":"{{ticket.requester.email}}",
        "phone":"{{ticket.requester.phone}}"
    }

.. image:: images/zendesk-webhook2.png
