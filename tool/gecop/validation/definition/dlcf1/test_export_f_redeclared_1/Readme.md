# Definition DLCF-1

This [test](.) is exercising the case [1](../Readme.md) of the definition [DLCF](../../dlcf/Readme.md).

### Description

In this test, feature `f` is declared in class `BB` with the client set `{XX}`. It is inherited in class `CC` with the *New\_export* clause `export {YY} f` and redeclared in a *Feature\_clause* whose client clause is `{ZZ}`. So the client set of `f` in class `CC` is `{XX, YY, ZZ}`, and therefore includes `ZZ` as checked in this test.
