# Definition DLCF-2

This [test](.) is exercising the case [2](../Readme.md) of the definition [DLCF](../../dlcf/Readme.md).

### Description

In this test, feature `f` is declared in class `BB` with the client set `{YY}` and is inherited in class `CC` with a *New\_export* clause `export {ZZ} f`. So the client set of `f` in class `CC` is `{YY, ZZ}`, and therefore includes `YY` as checked in this test.
