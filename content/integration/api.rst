.. _api:

-BETA- API Documentation
===========================

The Tier2Tickets API lets you connect your own applications, scripts, and integrations to your account. You can use it to find endpoints, read diagnostic reports, retrieve Instant Replay images, and request supported endpoint actions.

This page introduces the API, explains how to get an API key, and covers the basics of making requests. The API is currently in beta.

Swagger API Reference
^^^^^^^^^^^^^^^^^^^^^

.. important::

    **Building an integration? Use the** `Swagger API Reference <https://cyl.helpdeskbuttons.com/static/docs/swagger/index.html>`_ **for the detailed documentation for each request.**

    It describes the available endpoints, required permissions, request parameters and JSON bodies, response formats, and possible errors. Start with this introduction to get connected, then use the Swagger reference while implementing your requests.

API Address
^^^^^^^^^^^

The API is accessible over HTTPS at:

.. code-block:: text

    https://cyl.helpdeskbuttons.com/api/v1

Add an endpoint path to this address to make a request. For example, the endpoint list is available at ``https://cyl.helpdeskbuttons.com/api/v1/endpoints``.

Creating and Managing API Keys
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

You can create, view, and revoke API keys on the production website at `account.helpdeskbuttons.com/api-credentials <https://account.helpdeskbuttons.com/api-credentials>`_. Your website account must have permission to manage API credentials.

When creating a key:

* Give it a name that identifies the application or integration that will use it.
* Select the permissions that integration needs.
* Select the groups it should be able to access.
* Copy the generated key before leaving the page. The complete key is shown when it is created.

Use a separate key for each integration, and give each key only the permissions and group access it needs. If you need to replace a key, create its replacement, update your integration, and revoke the old key after testing.

.. important::

    An API key is a secret. Store it in your application's secret storage, and keep it out of public repositories, browser-side code, URLs, and logs. Revoke a key if it is exposed or is no longer needed.

Permissions and Group Access
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Each key is limited to its account, assigned permissions, and group scope. For example, a key that can list endpoints cannot automatically read report diagnostics or request an endpoint action. Report history, diagnostics, and Instant Replay each have their own permission.

Group restrictions apply to endpoint access, action targets, and report visibility. A restricted key cannot access an endpoint simply by knowing its ID. Report visibility follows the endpoint's current group, so moving an endpoint can change which restricted keys can read its historical reports.

Use the group names returned by ``GET /groups`` when selecting group targets. An ``ALL`` group scope gives account-wide group access; it does not grant permissions that were not assigned to the key.

Authenticating Requests
^^^^^^^^^^^^^^^^^^^^^^^

Send the key in the ``Authorization`` header with every request:

.. code-block:: text

    Authorization: Bearer YOUR_API_KEY

For requests with a JSON body, also send ``Content-Type: application/json``. Do not put your key in a query parameter.

The examples below use a shell environment variable named ``T2T_API_KEY``. Set it from your application's secret storage before running them. Replace example endpoint IDs and report IDs with values returned by your account's API requests.

Your First Request
^^^^^^^^^^^^^^^^^^

To request a small page of endpoints:

.. code-block:: bash

    curl --get 'https://cyl.helpdeskbuttons.com/api/v1/endpoints' \
      --header "Authorization: Bearer ${T2T_API_KEY}" \
      --header 'Accept: application/json' \
      --data-urlencode 'limit=2'

A successful request returns ``200 OK`` with a ``data`` array and pagination information. Endpoint records include a public ``endpoint_id`` that you can use in later requests.

To retrieve one endpoint:

.. code-block:: bash

    curl 'https://cyl.helpdeskbuttons.com/api/v1/endpoints/ep_YOUR_ENDPOINT_ID' \
      --header "Authorization: Bearer ${T2T_API_KEY}" \
      --header 'Accept: application/json'

Available API Operations
^^^^^^^^^^^^^^^^^^^^^^^^

All paths in the following tables are relative to the API address above. An operation is available only when the key has its required permission and access to the requested group or record.

These tables provide a quick overview. Open the `Swagger API Reference <https://cyl.helpdeskbuttons.com/static/docs/swagger/index.html>`_ for the complete request and response documentation for each operation.

Endpoints and Groups
++++++++++++++++++++

.. list-table::
    :header-rows: 1
    :widths: 47 33 20

    * - Request
      - Purpose
      - Permission
    * - ``GET /endpoints``
      - List visible endpoints; filter by group, online status, or version.
      - ``view-endpoints``
    * - ``GET /endpoints/{endpoint_id}``
      - Read an endpoint's details.
      - ``view-endpoints``
    * - ``GET /groups``
      - List visible endpoint groups.
      - ``view-endpoints``
    * - ``GET /groups/{group_id}/endpoints``
      - List endpoints in the selected group. Use the group name as ``group_id`` and URL-encode it.
      - ``view-endpoints``

Reports and Instant Replay
++++++++++++++++++++++++++

.. list-table::
    :header-rows: 1
    :widths: 47 33 20

    * - Request
      - Purpose
      - Permission
    * - ``GET /reports``
      - List visible report summaries; filter by endpoint, group, date range, or report-request lookup ID.
      - ``report-history``
    * - ``GET /reports/{report_id}``
      - Read report details and available diagnostic data, with verification and breach-exposure metadata when available.
      - ``report-diagnostics``
    * - ``GET /reports/{report_id}/instant-replay/sprite``
      - Retrieve the report's Instant Replay sprite as a PNG image.
      - ``view-instant-replay``

Diagnostics and screenshots remain subject to report redaction, availability, and your account's retention settings. Access to report metadata does not override redaction. Diagnostic data and screenshots may contain sensitive information; store and handle them accordingly.

Endpoint Actions
++++++++++++++++

.. list-table::
    :header-rows: 1
    :widths: 47 33 20

    * - Request
      - Purpose
      - Permission
    * - ``POST /endpoints/generate-report``
      - Request a diagnostic report from one endpoint.
      - ``generate-report``
    * - ``POST /endpoints/toast``
      - Display a toast notification.
      - ``run-command``
    * - ``POST /endpoints/popup``
      - Display a popup message.
      - ``run-command``
    * - ``POST /endpoints/desktopIcon``
      - Create or update the desktop icon and its configured function key.
      - ``run-command``
    * - ``POST /endpoints/pttb``
      - Request that the Helpdesk Buttons icon be pinned to the taskbar.
      - ``run-command``
    * - ``POST /endpoints/group``
      - Change an endpoint's group, subject to the key's group restrictions.
      - ``change-group``
    * - ``POST /endpoints/upgrade``
      - Request an endpoint software upgrade.
      - ``upgrade-endpoints``

Supported actions depend on the endpoint's software version and platform. Most action requests accept an ``endpoints`` list of public endpoint IDs, a ``groups`` list, or both. Report generation uses a single ``endpoint`` field instead. Check the API reference for the exact body required by each operation; paths and field names are case-sensitive.

Only online endpoints can be targeted. If a batch includes an offline endpoint, it is rejected before dispatch. An endpoint can still go offline after that check, so acceptance does not guarantee execution.

Following Pagination
^^^^^^^^^^^^^^^^^^^^

Endpoint and report lists return pagination information alongside the data:

.. code-block:: json

    {
      "data": [],
      "pagination": {
        "next_cursor": "OPAQUE_CURSOR_VALUE"
      }
    }

To request the next page, send the returned value as the ``cursor`` parameter. Keep the same filters and ``limit``:

.. code-block:: bash

    curl --get 'https://cyl.helpdeskbuttons.com/api/v1/endpoints' \
      --header "Authorization: Bearer ${T2T_API_KEY}" \
      --data-urlencode 'limit=2' \
      --data-urlencode 'cursor=OPAQUE_CURSOR_VALUE'

Treat cursors as opaque values; do not edit or construct them yourself. Continue until ``next_cursor`` is ``null``. A page can contain fewer records than requested, or even no records, while still having a next cursor. This can happen when the API is working through filtered results.

Report lists use the same pattern, including lists filtered by ``endpoint_id`` or ``lookup_id``. The ``endpoints`` report filter accepts up to 20 distinct endpoint IDs per request. ``GET /groups`` returns a group list without this pagination wrapper. Listings are not snapshots; changes to records while you paginate can affect the results.

Requesting and Reading a Diagnostic Report
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Generating a report is separate from reading it:

#. Submit ``POST /endpoints/generate-report`` with the required body from the API reference.
#. A successful request returns ``303 See Other``, a ``lookup_id``, and a ``Location`` header such as ``/api/v1/reports?lookup_id=YOUR_LOOKUP_ID``.
#. Make an authenticated GET request to that location on the API host. The key needs ``report-history`` permission to list the results.
#. When a report is available, use its ``report_id`` with ``GET /reports/{report_id}``. Reading its diagnostics requires ``report-diagnostics`` permission. Instant Replay requires ``view-instant-replay``.

Read the ``303`` response body and headers before following the location. The response acknowledges the report request; it does not confirm that the upload or ticket submission has completed. One request can produce multiple reports, so follow any returned pagination cursors.

A lookup can initially return an empty list while the endpoint is processing the request. Wait a few seconds between checks, respect rate limits, and poll the same lookup rather than submitting another generation request. A null pagination cursor ends that particular listing; it does not prove that a pending report request will never produce a report.

The ``target`` field selects ``console`` or ``all`` user helpers. ``all`` can be useful when the relevant signed-in user is not the console user, but it does not guarantee report generation on a logged-out machine. An online endpoint must also have a running helper that can be signaled.

Use the contact and ticket fields appropriate to your PSA integration. A request being accepted does not guarantee that the PSA will accept the supplied contact or create a ticket. Report retention follows the account's settings.

Action Results and Retries
^^^^^^^^^^^^^^^^^^^^^^^^^^

Most endpoint actions return ``202 Accepted``. Upgrade requests return ``201 Created``. These responses mean the submission was accepted, not that the endpoint finished the action.

Action responses include ``targets.outcomes`` with public endpoint IDs and one of two states:

* ``submitted``: the broadcast service returned success. Endpoint receipt and execution are not confirmed.
* ``failed``: submission failed or acceptance could not be confirmed. The result includes a reason and ``may_have_been_queued``.

If ``may_have_been_queued`` is ``true``, the command may already be queued even though the request failed. An error response can also include earlier successful submissions under ``error.details.submission``. Check those outcomes before deciding whether to retry; blindly resending a batch can duplicate an action.

Endpoint actions share a per-endpoint reservation. Other commands normally have a 10-second cooldown after dispatch. Report generation remains reserved until successful processing completes or the account's processing timeout expires. A busy endpoint returns ``409 Conflict``; when provided, follow the ``Retry-After`` header. A cooldown expiring does not establish that an earlier action finished.

Errors and Rate Limits
^^^^^^^^^^^^^^^^^^^^^^

API errors normally include a code and message:

.. code-block:: json

    {
      "error": {
        "code": "authentication_required",
        "message": "A bearer API key is required.",
        "details": {}
      }
    }

.. list-table::
    :header-rows: 1
    :widths: 20 80

    * - HTTP status
      - What to check
    * - ``400`` / ``422``
      - Check request fields, filters, cursor, and supported values.
    * - ``401``
      - Supply a valid API key. A revoked, expired, or invalid key cannot authenticate.
    * - ``403``
      - Check permissions, group scope, account restrictions, or report redaction.
    * - ``404``
      - The record was not found or is not visible to the key. An out-of-scope record can intentionally return 404.
    * - ``409``
      - The endpoint may be offline, busy, unsupported, or unable to signal a report helper. Read the error code before retrying.
    * - ``413``
      - Reduce the request body size.
    * - ``429``
      - A rate limit was reached. Stop requests for the interval in ``Retry-After`` when supplied, then reduce the request rate.
    * - ``500`` / ``503``
      - The service could not finish the request. For actions, check submission outcomes before retrying.

Limits can apply to the API key and request source. Avoid tight polling loops, paginate large reads, and do not automatically retry failed action submissions. Upstream or network error responses may differ from the API's normal JSON format.

When contacting support about a request, include its ``X-Request-ID`` response header, the operation, HTTP status, and error code. Do not send your API key or sensitive report data.
