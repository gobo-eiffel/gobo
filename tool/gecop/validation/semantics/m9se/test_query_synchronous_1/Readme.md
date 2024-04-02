# Semantics M9SE

This [test](.) is exercising the semantics rule [M9SE](../Readme.md).

### Description

In this test, feature `f` of class `AA` contains separate call to the feature `g` of class `BB`. The separate call is synchronous because feature `g` is a query. An exception occurs (in feature `z` of class `CC`) during this call, and it is propagated to the client region. The root creation routine `make` of class `AA` exits with an unhandled exception showing the exception trace from `make` in `AA` to `z` in `CC`.

### Notes

* ISE Eiffel (as of 23.09.10.7341 and after) fails to show the full exception trace. Only the part in the client region is shown.
