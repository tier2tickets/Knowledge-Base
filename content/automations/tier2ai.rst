*BETA* Tier2AI
=========================

Tier2AI uses artificial intelligence to determine how closely a phrase, sentence, or paragraph matches a set of categories. You can use this within our :ref:`Tier2Assist <content/automations/tier2assist:*BETA* tier2assist>` to determine what a user is talking about in a ticket and do things based on that knowledge. 

For a live demo of the Tier2AI, you can play with it here: :ref:`ai.tier2.tech <https://ai.tier2.tech>`.

The way it works is you send the function "ai_categorize" some text to test (most likely the ticket message) and a set of categories to test it against.

A larger practical example can found in the :ref:`Big Example <content/automations/tier2assist:Big example>` section of the Tier2Assist Documentation.

.. code-block:: python

    categories = ["employee termination", "new hire", "password reset request", "broken computer", "broken printer"]
    result = ai_categorize(msg, categories)
    

The result of the test can be looked using three metrics based on the confidence score from 0 - 100 that the msg is related to each category:
   
* Best match: This will return the best match of the set. (Best match will only return a value if a category scores above 80)

.. code-block:: python

    if result['best_match'] == 'broken computer':
        tier2assist.append({'msg':'It looks like you are having a computer problem...', 'action':'http://google.com/search?q=how+to+fix+computer'})
        

* Matches: This will return a list of all categories that match well (score greater than 94)

.. code-block:: python

    if 'broken computer' in result['matches']:
        tier2assist.append({'msg':'It looks like you are having a computer problem...', 'action':'http://google.com/search?q=how+to+fix+computer'})
        

* Individual scores: This will allow you to determine what to do based on how likely the AI thinks the message and each category matches.

.. code-block:: python

    if result['scores']['broken computer'] >94:
        tier2assist.append({'msg':'It looks like you are having a computer problem...', 'action':'http://google.com/search?q=how+to+fix+computer'})