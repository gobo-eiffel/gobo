# Definition DIFO-1

This [test](.) is exercising the case [1](../Readme.md) of the definition [DIFO](../../difo/Readme.md).

### Description

In this test, feature `f` introduces an alias with the *free operator* `~`. But `~` is a *special symbol*. This violates `DIFO-1`.

### Notes

* ISE Eiffel (as of 19.12.10.3842) erroneously accepts this code.
* ISE Eiffel (as of 20.11.10.5048 and after) reports a validity error `VFAV-1` instead. The error message is misleading.
* ISE Eiffel (as of 21.11.10.6046) erroneously accepts this code.
