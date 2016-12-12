This example demonstrates the usage of export stati for targets.

Usage:
======

Invoke

  geant -b b.eant hello
  
and the output should look like this:

  hello
  fc
  fb
  fa
  target: `C.secret' is not exported to project 'B'
  

Description:
============

Project 'B' is invoking several targets of project 'C' using <geant...>.
If you look at 'c.eant' you can see that target 'hello' does not specify
an attribute 'export' and thus is exported to any project. The same is
true for target 'goodbye'.

Invoking target 'fb' is working as well since 'fb' is exported to project
'B', the project which invokes 'fb'.

Invoking target 'fa', exported to project 'A' is working as well since
'fb' is exported to project 'B' which inherits from project 'A'.



