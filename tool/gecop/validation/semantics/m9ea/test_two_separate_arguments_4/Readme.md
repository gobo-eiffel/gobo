# Semantics M9EA

This [test](.) is exercising the semantics rule [M9EA](../Readme.md).

### Description

In this test, there are two features `DD.f` and `EE.f` from two different SCOOP regions. Feature `DD.f` has two separate arguments. And feature `EE.f` has one separate argument which is the same as one of the actual arguments of `DD.f`. Each feature makes a synchronously call on each separate argument, but in different order. Before executing the first separate call, the feature `DD.f` has to make sure that it has the lock on the region of both separate arguments to avoid deadlock. This means that both separate calls in `DD.f` will occur before or after the separate call in `EE.f`.

### Notes

* When compiled with ISE Eiffel (as of 23.09.10.7341 and after), the separate call in `EE.f` occurs between the two separate calls in `DD.f`. The problem is that the separate call in `EE.f` may need the lock on the region of the first separate call in `DD.f`, which would result in a deadlock. This violates the semantics rule `M9EA`.
