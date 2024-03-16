# Semantics M9AS

This [test](.) is exercising the semantics rule [M9AS](../Readme.md).

### Description

In this test, there are two features `DD.f` and `EE.f` from two different SCOOP regions. Each feature has two separate arguments, and they are called with four different actual arguments but all from the same region. Each feature makes a synchronously call on each separate argument. Before executing the first separate call, each feature has to make sure that it has the lock on the region of both separate arguments to avoid dead locks. This means that both separate calls in `DD.f` will occur before the separate calls in `EE.f` or vice versa.
