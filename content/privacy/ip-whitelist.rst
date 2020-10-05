IP Login Whitelists
==========================

The IP Login Whitelists page is a simple yet powerful security tool.

.. raw:: html

    <div style="position: relative; padding-bottom: 5%; height: 0; overflow: hidden; max-width: 100%; height: auto;">
        <iframe width="560" height="315" src="https://www.youtube.com/embed/7jQ1Od_BBCI?start=171" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
    </div>


Geo IP Whitelisting
--------------------

On this page, you will find that you can restrict access to log in by country, Internet Service Provider, and IP address. By default, we are blocking every country except the 7 countries we offer service in. This alone is a huge leap in security because most cyber-attacks originate from IP addresses located in `Russia and Ukraine <https://www.wordfence.com/blog/2017/06/may-2017-wordpress-attack-report/>`_.

ISP Whitelisting
-----------------

The center option allows you to whitelist by Internet Service Provider (ISP.) Your ISP is listed above and you can find the ISP for an IP address by using the link.

.. image:: images/whitelists.png

Anonymizer Detection
---------------------

At the bottom of that page, notice the “Block Anonymous IPs” option. This will block logins from IPs that are known to be Anonymous proxy servers, Anonymous VPNs, the `TOR network <https://www.torproject.org/>`_, Cloud hosting providers, or any other IP that might be hiding the actual location of the visitor. This helps the Country Code Whitelist mean something. Without it, a person in a non-whitelist country could still access the site if they were crafty.

How do we know if an IP is Anonymous? We use the `MaxMind <https://www.maxmind.com/en/geoip2-precision-services>`_ real-time insights service to check each and every login request. It costs us money each and every time someone logs in to get the insight data, and it’s among the more expensive APIs we use here, but it’s the industry-leading service for this type of information.

And only the best will do when it comes to protecting our users.


