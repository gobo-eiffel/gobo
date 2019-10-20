# Definition DLCF-1

This [test](.) is exercising the case [1](../Readme.md) of the definition [DLCF](../../dlcf/Readme.md).

### Description

In this test, feature `f` is declared in class `BB` with the client set `{YY}` and is redeclared in class `CC` in a *Feature\_clause* whose client clause is `{ZZ}`. So the client set of `f` in class `CC` is `{YY, ZZ}`, and therefore includes `ZZ` as checked in this test.
