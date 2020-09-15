Compliance
===========

At our MSP we mostly have to deal with HIPAA, but there are similar laws that cover other sectors other than healthcare and take similar approaches. The financial sector in the US, for example, has SOX (Sarbanes-Oxley Act.) The point is that we expected that our customers would have a need for regulatory compliance when using our software because of the screenshots that may contain very sensitive information. We, therefore, set out to design a system that can address these regulatory hurdles in an all-encompassing way.

HIPAA
------

We reached out to a HIPAA (Health Insurance Portability and Accountability Act) compliance attorney before we ever showed this software to anyone because our own MSP manages mostly medical practices. We knew that we needed to have certain, very specific features to comply with the strictest data security laws.

To meet this requirement we are required to provide additional layers of protection. That was the birthplace of the :ref:`Gatekeeper <content/privacy/customer-owned:S3 Gatekeeper>`,  :ref:`per-user access restrictions <content/privacy/subaccounts:Sub-accounts>` with audit logging, and :ref:`consent-based data transmission <content/privacy/general-components:ButtonHelper>`. A :ref:`Customer Controlled Amazon S3 <content/privacy/customer-owned:Customer Controlled Amazon S3>` account is required and we are prepared to sign a BAA (as well as have Amazon sign one.)

GDPR Compliance
-----------------

Working on it…Did you know that you have to have an employee representative in Europe to pass compliance? Pretty rough for a US-based company.