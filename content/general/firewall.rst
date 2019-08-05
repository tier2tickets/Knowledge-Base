What Should My Firewall Settings Be?
====================================

There are two different scenarios where you might need to adjust settings on your firewall. One is for the inbound traffic to your ticket system, if your ticket system is hosted onsite. And the other is for outbound traffic coming from the button software on your client's PC



Inbound Ticket System Settings
------------------------------

In order to put tickets into your ticket system, our servers must communicate to your ticket system API. If you are using a Cloud-Hosted ticket ticket system, then there is probably nothing you need to do outside of what is listed your specific integration guide, but if you have a self-hosted ticket system, then you will need to set up port forwarding and firewall rules to expose your API to the internet. It's always a good security practice to apply the "Principle Of Least Privilege" and only allow those IPs which need to communicate with your API to have access to it through your firewall. For that reason, we send out all of our API requests through one of two two specific static IP addresses. They are as follows:

- 174.129.157.90
- 54.146.159.96

If you whitelist those two IPs in your firewall, then you should be good to go for our inbound API requests to your ticket system.



Outbound Client Software Settings
---------------------------------

In order for the client software to function, it makes outbound TCP connections to various servers. Many of these are servers which are edge optimized and therefore have multiple IP addresses per region, so make sure not to just whitelist the IP for the server because this changes based on region and server load. You must whitelist the hostname.


+-----------------------------------+------------------------------------------------+-----------+
| Role                              | Hostname                                       | Port(s)   |
+===================================+================================================+===========+
| getconf, submit basic ticket data | cfjex255ag.execute-api.us-east-1.amazonaws.com | 443       |
+-----------------------------------+------------------------------------------------+-----------+
| upload diagnostic data/Images     | apc-button.s3.amazonaws.com                    | 443       |
+-----------------------------------+------------------------------------------------+-----------+
| request slot for TechConnect      | connect.helpdeskbuttons.com                    | 443       |
+-----------------------------------+------------------------------------------------+-----------+
| establish TechConnect session     | connect.helpdeskbuttons.com                    | 2001-2500 |
+-----------------------------------+------------------------------------------------+-----------+

