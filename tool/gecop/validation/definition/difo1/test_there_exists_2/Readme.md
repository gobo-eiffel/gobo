# Definition DIFO-1

This [test](.) is exercising the case [1](../Readme.md) of the definition [DIFO](../../difo/Readme.md).

### Description

In this test, feature `f` introduces an alias with the *free operator* `∃`. But `∃` is a *special symbol* (used in symbolic forms of *across loops*). This violates `DIFO-1`.

### Notes

* ISE Eiffel (as of 19.12.10.3842 and after) erroneously accepts this code.
