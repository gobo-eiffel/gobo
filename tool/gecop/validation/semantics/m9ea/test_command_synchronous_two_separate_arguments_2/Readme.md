# Semantics M9EA

This [test](.) is exercising the semantics rule [M9EA](../Readme.md).

### Description

In this test, there is feature `DD.f` with two separate arguments. The feature already has the lock on the SCOOP region of the first separate argument `b`. So the call is synchronous, but the feature has to make sure that it also has the lock on the region of the second separate argument, `c`, to avoid deadlock. This means that no separate call to the region of `c` triggered from a different SCOOP region may occur while in the middle of the execution of `DD.f`.
