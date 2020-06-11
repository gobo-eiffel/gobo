# Semantics MUON-2

This [test](.) is exercising the case [2](../Readme.md) of the semantics rule [MUON](../../muon/Readme.md).

### Description

In this test, the first call to the once procedure with no once key (meaning once-per-thread) `f` raises an exception. And the second call to `f` raised the same exception. This test satisfies `MUON-2`.
