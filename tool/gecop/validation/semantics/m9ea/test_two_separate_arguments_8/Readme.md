# Semantics M9EA

This [test](.) is exercising the semantics rule [M9EA](../Readme.md).

### Description

In this test, there are two features `DD.f` and `EE.f` from two different SCOOP regions. Each feature has two separate arguments, and they are called with four different actual arguments but all from the same region. Each feature makes a synchronous call on each separate argument. Before executing the first separate call, each feature has to make sure that it has the lock on the region of both separate arguments (even if there is no risk of deadlock because all objects involved are in the same region). This means that both separate calls in `DD.f` will occur before the separate calls in `EE.f` or vice versa.
