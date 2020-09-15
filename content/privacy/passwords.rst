Passwords
===========

What you see here is the message that would pop up if you entered an insecure password to login to the site. What is NIST Special Publication 800-63b § 5.1.1.2? Well, NIST is the National Institute of Standards and Technology, and Special Publication 800-63b are the latest guidelines on digital authentication. There is some interesting stuff in there. For example, did you know that it is considered a poor security practice to require users to change their passwords periodically? Anyway, section 5.1.1.2 says that passwords should be checked against a list of passwords “obtained from previous breach corpuses.” There are `a lot of these <https://haveibeenpwned.com/PwnedWebsites>`_, and we use the `haveibeenpwned <https://haveibeenpwned.com/>`_ API to check against all known breached passwords each and every time you log in.

We should be clear that your password is never transmitted to a 3rd party. Rather, we send the first 2.5 bytes of the SHA-1 hash of the password and search the results for the remaining part of the hash.

The result is that, if you are using a password that is secure one day, but becomes insecure the next because it was publicized in a breach, we will be able to notify you next time you log in.