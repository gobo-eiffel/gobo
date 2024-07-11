# Semantics S7SC

This [test](.) is exercising the semantics rule [S7SC](../Readme.md).

### Description

In this test, feature `make` has two local variable declarations not separated by a semicolon, despite the specification of the construct `Entity_declaration_list` (see syntax rule `SRFE`). This is valid according to the Semicolon Optionality rule `S7SC`.
