# Definition DLCF-3

This [test](.) is exercising the case [3](../Readme.md) of the definition [DLCF](../../dlcf/Readme.md).

### Description

In this test, feature `f` is declared in class `BB` with the client set `{XX}`. It is inherited in class `CC` with the *New\_export* clause `export {ZZ} f` and redeclared in a *Feature\_clause* whose client clause is `{YY}`. So the client set of `f` in class `CC` is `{XX, YY, ZZ}`, and therefore includes `ZZ` as checked in this test.

### Notes

* ISE Eiffel (as of 19.05.10.3187 and after) erroneously claims that `ZZ` is not part of the client set of feature `f`.
