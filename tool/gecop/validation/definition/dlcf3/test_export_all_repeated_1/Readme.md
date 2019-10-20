# Definition DLCF-3

This [test](.) is exercising the case [3](../Readme.md) of the definition [DLCF](../../dlcf/Readme.md).

### Description

In this test, feature `f` is declared in class `BB` with the client set `{XX}` and is repeatedly inherited in class `CC` with two *New\_export* clauses `export {YY} all` and `export {ZZ} all`. So the client set of `f` in class `CC` is `{XX, YY, ZZ}`, and therefore includes `YY` and `ZZ` as checked in this test.

### Notes

* ISE Eiffel (as of 19.05.10.3187 and after) erroneously claims that `ZZ` is not part of the client set of feature `f`.
