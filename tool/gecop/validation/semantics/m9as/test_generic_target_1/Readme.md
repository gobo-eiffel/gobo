# Semantics M9AS

This [test](.) is exercising the semantics rule [M9AS](../Readme.md).

### Description

In this test, class `BB` is generic. Feature `g` in class `BB` contains a call `c.h` where the type of the target `c` is the formal generic parameter. When the actual generic parameter is the separate type `separate CC`, the call `c.h` becomes a separate call because type of `c` is separate. The target `c` is not in the current SCOOP region, and `h` is a procedure with no argument. So the separate call is executed asynchronously. The execution of `g` continues without waiting for the separate call to complete.

### Notes

* ISE Eiffel (as of 23.09.10.7341 and after) erroneously considers that the call `c.h` is not a separate call, even when the type of `c` is the actual generic parameter `separate CC`. This violates the semantics rule `M9AS`.
