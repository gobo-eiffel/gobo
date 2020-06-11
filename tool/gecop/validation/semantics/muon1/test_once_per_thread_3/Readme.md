# Semantics MUON-1

This [test](.) is exercising the case [1](../Readme.md) of the semantics rule [MUON](../../muon/Readme.md).

### Description

In this test, the call to the once function with no once key (meaning once-per-thread) `f` is fresh in thread `b1`. It has the same behavior as the execution of a non-once function in this thread. The call to `f` is also fresh in thread `b2`. So it also has the same behavior as the execution of a non-once function in this other thread. This test satisfies `MUON-1`.
