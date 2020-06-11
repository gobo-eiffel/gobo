# Semantics MUON-3

This [test](.) is exercising the case [3](../Readme.md) of the semantics rule [MUON](../../muon/Readme.md).

### Description

In this test, the second call to the once procedure with no once key (meaning once-per-thread) `f` has no effect, despite passing a different argument. This test satisfies `MUON-3`.
