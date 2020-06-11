# Semantics MUON-4

This [test](.) is exercising the case [4](../Readme.md) of the semantics rule [MUON](../../muon/Readme.md).

### Description

In this test, the second call to the once-per-thread function `f` has no effect, even though it is recursive (it occurs before the first call is completed). It will just return the value of `Result` as it was in the first call at the time the second call was triggered. This test satisfies `MUON-4`.
