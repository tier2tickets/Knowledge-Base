*BETA* Tier2AI
=========================

Tier2AI uses artificial intelligence to determine how closely a phrase, sentence, or paragraph matches a set of categories. You can use this within our :ref:`Tier2Assist <content/automations/tier2assist:*BETA* tier2assist>` to determine what a user is talking about in a ticket and do things based on that knowledge. 

The way it works is you send the function "ai_categorize" some text to test (most likely the ticket message) and a set of categories to test it against.

.. code-block:: python

    categories = ["employee termination", "new hire", "password reset request", "broken computer", "broken printer"]
    result = ai_categorize(msg, categories)
    

The result of the test can be looked using three metrics:
   
* Best match: This will return the best match of the set.

.. code-block:: python

    if result['best_match'] == 'broken computer':
        tier2assist.append({'msg':'It looks like you are having a computer problem...', 'action':'http://google.com/search?q=how+to+fix+computer'})
        

* Matches: This will return a list of all categories that match reasonably well

.. code-block:: python

    if 'broken_computer' in result['matches']:
        tier2assist.append({'msg':'It looks like you are having a computer problem...', 'action':'http://google.com/search?q=how+to+fix+computer'})
        

* Individual scores: This will allow you to determine what to do based on how likely the AI thinks the message and each category matches (confidence out of 100%).

.. code-block:: python

    if result['scores']['broken_computer'] >94:
        tier2assist.append({'msg':'It looks like you are having a computer problem...', 'action':'http://google.com/search?q=how+to+fix+computer'})