TextExpander Sequence
=============

A Snippet and supporting Ruby Scripts for generating sequences via [TextExpander](http://www.smileonmymac.com/TextExpander/).

This might be a particularly esoteric problem, but bear with me.  I have a particular hatred of typing numbers for lists, for example bullet points, SKU codes, etc.  It's horrible having to 
type 

1 _~blah, blah~_  
2 _~blah, blah~_  
3 _~blah, blah~_  
....  
99 _~blah, blah~_  

Ick.  

It gets even worse if you're typing Roman numerals, or formatted SKU codes, or whatnot.  This Snippet gets rounds this by giving
access to a persistent sequence that can be called from a triplet of keyboard triggers.


Installation
=============
You'll need the uuid gem installed...

	$ sudo gem install uuid

Import Sequence.textexpander into TextExpander.  Move the rest of the files into ~/Tools/TextExpanderScripts/textexpander-sequence/
or update the Snippets to point to wherever you've put them.

Usage
=============
In any application type:

*   "seqq" to start a new sequence and insert its first element.
*   "sdd" to insert the next item in the sequence.
*   "saa" to insert the previous item in the sequence.

Reuse
============
By default, the Snippets set up a single sequence.  To set up more copy the group in TextExpander and 
change the first argument to sequence_runner.rb, for example...

	#!/bin/bash
	ruby ~/Tools/TextExpanderScripts/textexpander-sequence/sequence_runner.rb OTHER_SEQUENCE restart 

Sequence Formatting
============
The Sequence class use a Formatter object to transform the sequence before output.  The default is just to print out the 
number with no transformation.  There are currently two sample Formatters:

*   RomanNumberalFormatter - does what it says on the tin
*   SprintfFormatter - takes a printf formatted string and passes the sequence element through it for output.

To change the formatter you'll have to change the constructor to Sequence in sequence_runner.rb.  For example...
   
	sequence = Sequence.new(ARGV[0], RomanNumeralFormatter.new)

Future Features
===============
A neater runner script that can take a Formatter as an argument.


Copyright (c) 2009 Gavin Montague, released under the MIT license