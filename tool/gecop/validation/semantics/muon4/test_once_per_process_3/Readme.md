# Semantics MUON-4

This [test](.) is exercising the case [4](../Readme.md) of the semantics rule [MUON](../../muon/Readme.md).

### Description

In this test, the second call to the once-per-process function `f` has no effect except from returning the same result as in the first call, even though it is executed from another thread. This test satisfies `MUON-4`.
