# Semantics S7SC

This [test](.) is exercising the syntax rule [S7SC](../Readme.md).

### Description

In this test, we have two instructions separated by two semicolons. This is not valid according to the specification of the construct `Compound` (see syntax rule `SRIN`) and to the Semicolon Optionality rule `S7SC`.

### Notes

* Gobo Eiffel and ISE Eiffel (as of 24.05.10.7822 and after) both accept this code because there was the notion of null instruction in ETL2 (page 234).
