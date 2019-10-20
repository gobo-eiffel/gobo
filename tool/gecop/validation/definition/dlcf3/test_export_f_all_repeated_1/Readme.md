# Definition DLCF-3

This [test](.) is exercising the case [3](../Readme.md) of the definition [DLCF](../../dlcf/Readme.md).

### Description

In this test, feature `f` is declared in class `BB` with the client set `{XX}` and is repeatedly inherited in class `CC` with two *New\_export* clauses `export {ZZ} f` and `export {YY} all`. So the client set of `f` in class `CC` is `{XX, YY, ZZ}`, and therefore includes `ZZ` as checked in this test.
