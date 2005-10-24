Read-me file for Schematron validator example program
=====================================================

This program validates XML files against a Schematron schema.

For a description of the Schematron language, see:

    http://www.schematron.com/ 

As input, you specify an XML file to be validated, and a schematron
rules file which specifies the validation rules. The latter might
profitably be named XXXX.sch, but the example schema is not so named.

To compile the program, type:

    geant compile

(or geant compile_ise or geant compile_ve or geant compile_debug_se
(SE 1.2r3 still has some optimization bugs (hopefully r4 will fix them)).

To run the program against a set of example rules, type:

    ./schematron data/evil_wai.xml data/wai.xml

(or the equivalent command on windows)

This will produce a very long report of what is wrong with
evil_wai.xml. If you are actually interested in reading this report,
then you would do better to type:

    ./schematron --output=report.txt data/evil_wai.xml data/wai.xml

and then browse report.txt. You can find sample output in data/report.txt

You will notice an error message on stderr:

    Markup Error:  no match attribute on &lt;key&gt; outside &lt;rule&gt;

This is because the reference implementation of Schematron 1.5 (I
shall upgrade the files to ISO Schematron when it becomes available) 
was tested on poorly conforming XSLT processors, and so is buggy.
Just ignore the message.

Actually there are other problems with these stylesheets, which throw
up recoverable errors. If you look at schematron.e, you will notice
that the XSLT library has been instructed to recover silently from
such errors.
Warnings are also suppressed, as the Schematron stylesheets are
designed to be run on an XSLT 1.0 processor. The Gobo XSLT library
implements XSLT 2.0, and as such has to issue a (suppressable) warning
when run against 1.0 stylesheets.

--
Copyright (c) 2005, Colin Adams and others
