# Semantics S7SC

This [test](.) is exercising the semantics rule [S7SC](../Readme.md).

### Description

In this test, feature `make` has two local variable declarations with a semicolon before the first local variable declaration. This is not valid according to the specification of the construct `Entity_declaration_list` (see syntax rule `SRFE`) and to the Semicolon Optionality rule `S7SC`.