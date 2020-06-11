# Semantics MUON-4

This [test](.) is exercising the case [4](../Readme.md) of the semantics rule [MUON](../../muon/Readme.md).

### Description

In this test, the second call to the once function with no once key (meaning once-per-thread) `f` has no effect except from returning the same result as in the first call, despite passing a different argument. This test satisfies `MUON-4`.
