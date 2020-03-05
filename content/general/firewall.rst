Security Software & Firewall Settings
======================================

There are two different scenarios where you might need to adjust settings on your firewall. One is for the inbound traffic to your ticket system, if your ticket system is hosted onsite. And the other is for outbound traffic coming from the button software on your client's PC


Inbound Ticket System Settings
------------------------------

In order to put tickets into your ticket system, our servers must communicate to your ticket system API. If you are using a Cloud-Hosted ticket ticket system, then there is probably nothing you need to do outside of what is listed your specific integration guide, but if you have a self-hosted ticket system, then you will need to set up port forwarding and firewall rules to expose your API to the internet. It's always a good security practice to apply the "Principle Of Least Privilege" and only allow those IPs which need to communicate with your API to have access to it through your firewall. For that reason, we send out all of our API requests through one of two two specific static IP addresses. They are as follows:

- 34.202.14.153
- 3.209.57.193

If you whitelist those two IPs in your firewall, then you should be good to go for our inbound API requests to your ticket system.



Outbound Client Software Settings
---------------------------------

In order for the client software to function, it makes outbound TCP connections to various servers. Many of these are servers which are edge optimized and therefore have multiple IP addresses per region, so make sure not to just whitelist the IP for the server because this changes based on region and server load. You must whitelist the hostname.


+------------------------------------+------------------------------------------------+-----------+
| Role                               | Hostname                                       | Port(s)   |
+====================================+================================================+===========+
| getconf, submit basic ticket data  | flu1pjyrr2.execute-api.us-east-1.amazonaws.com | 443       |
+------------------------------------+------------------------------------------------+-----------+
| If not self-hosting; our gatekeeper| kdwq222yo3.execute-api.us-east-1.amazonaws.com | 443       |
+------------------------------------+------------------------------------------------+-----------+
| Plugins (Auto update, T2terminal)  | e4rz8vlrg0.execute-api.us-east-1.amazonaws.com | 443       |
+------------------------------------+------------------------------------------------+-----------+
| upload diagnostic data/Images      | hdb-stuff.s3.amazonaws.com                     | 443       |
+------------------------------------+------------------------------------------------+-----------+
| request slot for TechConnect       | connect.helpdeskbuttons.com                    | 443       |
+------------------------------------+------------------------------------------------+-----------+
| establish TechConnect session      | connect.helpdeskbuttons.com                    | 2001-2500 |
+------------------------------------+------------------------------------------------+-----------+


Anti-Virus and AntiMalware Compatibility
-----------------------------------------
It is not always necessary, but we recommend whitelisting the helpdeskbuttons installation folder (C:\\Program Files(x86)\\Helpdesk Button). We regularly submit our code through VirusTotal to make sure we are not getting flagged, but almost all AV/M interactions cause some sort of failure. `Webroot <https://docs.tier2tickets.com/content/general/firewall/#webroot>`_ in particular can cause issues with screenshots.


AdGuard
^^^^^^^^

AdGuard seems to block the JavaScript that populates the Press View Reports. 


Webroot
^^^^^^^

Webroot will blank most programs from taking screenshots. Here is thier `documentation on how to allow a program to take screenshots.
<https://docs.webroot.com/us/en/home/wsa_pc_userguide/wsa_pc_userguide.htm#UsingIdentityProtection/ManagingProtectedApplications.htm%3FTocPath%3DUsing%2520Identity%2520Protection%7C_____2/>`_.


It may be necessary to allow applications to take screenshots without confirmation if you recieve popups about allowing screenshots.

.. image:: images/1-webroot.png

.. image:: images/2-webroot.png

.. image:: images/3-webroot.png