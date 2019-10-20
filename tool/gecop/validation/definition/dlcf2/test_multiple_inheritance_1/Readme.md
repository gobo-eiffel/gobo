# Definition DLCF-2

This [test](.) is exercising the case [2](../Readme.md) of the definition [DLCF](../../dlcf/Readme.md).

### Description

In this test, feature `f` is declared in class `BB` with the client set `{YY}` and in class `CC` with the client set `{YY}`. It is then inherited in class `DD` through both parents `BB` and `CC`. So the client set of `f` in class `DD` is `{YY, ZZ}`, and therefore includes `YY` and `ZZ` as checked in this test.
