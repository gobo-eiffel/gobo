# Syntax S7SC

These [tests](.) are exercising the syntax rule below.

## S7SC: Semicolon Optionality rule

### ECMA 367-2, 8.2.21 page 29

In writing specimens of any construct defined by a Repetition production specifying the semicolon ";" as separator, it is permitted, without any effect on the syntax structure, validity and semantics of the software, to omit any of the semicolons, or to add a semicolon after the last element.

### ECMA 367-3 (working version 3-44), 8.4.5 page 68

Same as above.

### Notes

* ISE Eiffel (as of 24.05.10.7822 and after) erroneously reports a syntax error when there is a semicolon after the last field declaration of a labeled tupe (e.g. `TUPLE [a: INTEGER; b: INTEGER;]`).

* Gobo Eiffel and ISE Eiffel (as of 24.05.10.7822 and after) both accept two or more semicolons between instructions or a semicolon before the first instruction in a compound. This is because there was the notion of null instruction in ETL2 (page 234).
