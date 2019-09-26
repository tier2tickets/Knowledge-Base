Auto Update
=======================

If you look at your `builds page <https://account.helpdeskbuttons.com/builds.php>`_ you will find that there is a check box
that says "deploy via auto-update". The purpose of this is to allow you to update all of the clients with almost no effort.
It's not truly automatic. We will not push out updates without your knowledge (except maybe security updates). Instead 
you choose when to update.

The normal workflow would be like this: you have already deployed the software to thousands of computers using our
:ref:`deployment script <content/deployment/scripts:Deployment Scripts>` and there is now a new version that has a
feature or bug fix that you want. First, build that version and test it yourself. Once you feel happy with it,
then check the box that says "deploy via auto-update".

It's that easy. Next time the software checks in, (they check in every hour if the computer is online) then the software
will download that new version and update itself.
