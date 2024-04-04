# Semantics M9AS

This [test](.) is exercising the semantics rule [M9AS](../Readme.md).

### Description

In this test, class `BB` is generic. Feature `g` in class `BB` contains a separate call `d.h (c)` where the type of `c` is the formal generic parameter. When the actual generic parameter is the separate type `separate CC`, the type of `c` is separate. And since `c` is the formal argument of `g`, the current processor has a lock on it. So the `h` is executed synchronously. The execution of `g` waits until the separate call completes before proceeding further.

### Notes

* ISE Eiffel (as of 23.09.10.7341 and after) erroneously executes the separate call `d.h (c)` asynchronously, even when the type of `c` is the actual generic parameter `separate CC`. This violates the semantics rule `M9AS`.
