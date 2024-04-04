# Semantics M9EA

This [test](.) is exercising the semantics rule [M9EA](../Readme.md).

### Description

In this test, there are two features `DD.f` and `EE.f` from two different SCOOP regions. Each feature has two separate arguments, and they are called with the same actual arguments. Each feature makes a synchronous call on each separate argument, but in different order. Before executing the first separate call, each feature has to make sure that it has the lock on the region of both separate arguments to avoid deadlock. This means that both separate calls in `DD.f` will occur before the separate calls in `EE.f` or vice versa.
