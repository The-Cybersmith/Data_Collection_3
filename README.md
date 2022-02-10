# README

This version of the program hews closer to Ruby On Rails conventions, with an emphasis on placing the majority of the logic in small functions within the models and controllers, with frontend elements being constructed from re-useable "partials" to minimise repeated code segments.

Environment Overview:
This code was made on an ubuntu environment with the following relevant version details:
->version 12.9 of psql
->version 2.7.5p203 of Ruby
->version 6.1.4.4 of rails

Models Overview:
Fundamentally, this program is only concerned with one type of persistent data: recorded threats.
The Threat model represents this, and contains all the validation processes.

Controllers Overview:
The only controller needed (aside from an extremely simple one which provides a homepage) is the one which allows the user to interact with threats. At present, no capacity for deletion or alteration of existing records is intended, but records must be creatable and viewable.
Display is relatively simple, all existing records must be displayed, preferably in order of creation.
Creation is more complex. Before a threat can be logged, four separate stages must be passed through, corresponding to the aspects of the model, and the validation of it. When all four are complete, the program automatically redirects to the display.
There also has to be a way to reset.

Views Overview:
Re-usable components are made using partial erbs (prefixed with a "_" in the components folder).
The forms for different steps are in a "step" folder.


PROBLEM:
Most logic should exist in the model. However, the model cannot be used until one is created... and a model cannot be created until data is gathered. Static functions are one solution, though perhaps not the most elegant.

A static method for validation allows each validation to occur.
