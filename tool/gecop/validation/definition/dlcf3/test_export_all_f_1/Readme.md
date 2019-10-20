# Definition DLCF-3

This [test](.) is exercising the case [3](../Readme.md) of the definition [DLCF](../../dlcf/Readme.md).

### Description

In this test, feature `f` is declared in class `BB` with the client set `{XX}` and is inherited in class `CC` with two *New\_export* clauses `export {YY} f` and `export {ZZ} all`. So the client set of `f` in class `CC` is `{XX, YY}`, and therefore does not include `ZZ` as checked in this test.
