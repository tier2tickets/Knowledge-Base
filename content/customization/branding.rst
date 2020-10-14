Branding
========

The branding page has been overhauled and is simpler to use. 

.. image:: images/branding.png

You can customize the appearance of the software by uploading a logo (400 x 125 pixel PNG) and/or an icon (256 x 256 pixel PNG).

If you don’t have your images in the right format or size, they will be automatically converted, but may be distorted. We recommend using transparent backgrounds for best appearance.

Make sure to `rebuild <https://account.helpdeskbuttons.com/builds.php>`_ your MSI after uploading.

If you are looking for a way to change the name of the helpdesk button shortcut we reccomend the method in our documentation on 
`installations <https://docs.tier2tickets.com/content/general/installation/>`_ this method is used in our 
`deployment scripts <https://docs.tier2tickets.com/content/deployment/scripts/>`_.

The layout and colors in the GUI can be modified by customizing the CSS. The CSS which controls most of the look and feel of the GUI is located at "C:\\Program Files (x86)\\Tier2Tickets\\resources\\style.css" in most cases.
The classes and variables in that file can be overridden by your own settings by putting them in a file named "custom.css" and `uploading it the same way as a custom script <https://docs.tier2tickets.com/content/customization/tier2scripts/>`_. As an example, here is a custom.css file which would make the GUI lime-green and pink and terrible:

.. code-block:: css

	@const color_01: #de69ac; 
	@const color_02: #e591c1; 
	@const color_03: #d8d8d8;
	@const color_04: #14a8a8; 
	@const color_05: #f2804d; 
	@const color_06: #ffb38e;
	@const color_07: #0dfd0d;
	@const color_08: #848484;
	@const color_09: #00f000;