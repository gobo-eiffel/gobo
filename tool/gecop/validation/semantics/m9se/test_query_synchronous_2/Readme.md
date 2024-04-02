# Semantics M9SE

This [test](.) is exercising the semantics rule [M9SE](../Readme.md).

### Description

In this test, feature `f` of class `AA` contains separate call to the feature `g` of class `BB`. The separate call is synchronous because feature `g` is a query. Feature `g` will call feature `x` of class `BB` which also contains a separate call to the feature `h` of class `CC`. This second separate call is synchronous because feature `h` is also a query. An exception occurs (in feature `z` of class `DD`) during this second separate call, and it is propagated to the second client region and then to the first client region. The root creation routine `make` of class `AA` exits with an unhandled exception showing the exception trace from `make` in `AA` to `z` in `DD`.

### Notes

* ISE Eiffel (as of 23.09.10.7341 and after) fails to show the full exception trace. Only the part in the client region is shown.
