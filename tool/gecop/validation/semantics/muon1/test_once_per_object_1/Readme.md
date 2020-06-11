# Semantics MUON-1

This [test](.) is exercising the case [1](../Readme.md) of the semantics rule [MUON](../../muon/Readme.md).

### Description

In this test, the call to the once-per-object function `f` is fresh in object `b1`. It has the same behavior as the execution of a non-once function on this object. The call to `f` is also fresh in object `b2`. So it also has the same behavior as the execution of a non-once function on this other object. This test satisfies `MUON-1`.
