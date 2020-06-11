# Semantics MUON-3

This [test](.) is exercising the case [3](../Readme.md) of the semantics rule [MUON](../../muon/Readme.md).

### Description

In this test, the second call to the once-per-object procedure `f` on object `b` has no effect, even though it is executed from another thread. This test satisfies `MUON-3`.
