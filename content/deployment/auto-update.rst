Auto Update
=======================

If you look at your `builds page <https://account.helpdeskbuttons.com/builds.php>`_ you will find that there is a check box
that says "deploy via auto-update". The purpose of this is to allow you to update all of the clients with almost no effort.
It's not truly automatic. We will not push out updates without your knowledge (except maybe security updates). Instead 
you choose when to update.

The normal workflow would be like this: you have already deployed the software to thousands of computers using our
:ref:`deployment script <content/deployment/scripts:Deployment Scripts>` and there is now a new version that has a
feature or bug fix that you want. First, build that version and test it yourself. Once you feel happy with it,
then click the box that says "Push Updates". You should then see a window that confirms your command. Click yes.

It's that easy. The update command will be pushed to all your online endpoints and be queued for anything offline.
