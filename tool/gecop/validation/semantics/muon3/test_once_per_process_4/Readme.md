# Semantics MUON-3

This [test](.) is exercising the case [3](../Readme.md) of the semantics rule [MUON](../../muon/Readme.md).

### Description

In this test, the second call to the once-per-process procedure `f` is executed from another thread while the first call to `f` was not completed yet. The call on the second thread is blocked until the first call to `f` is completed. This is to avoid having two different threads triggering the same once-per-process procedure at the same time, violating the fact that the body of a once-per-process procedure should not be executed more than once. After being unblocked, the second call to `f` has no effect. This test satisfies `MUON-3`.
