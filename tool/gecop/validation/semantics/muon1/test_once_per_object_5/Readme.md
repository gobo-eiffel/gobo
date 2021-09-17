# Semantics MUON-1

This [test](.) is exercising the case [1](../Readme.md) of the semantics rule [MUON](../../muon/Readme.md).

### Description

In this test, the call to the once-per-object function `f` is fresh in object `b1`. It has the same behavior as the execution of a non-once function on this object. In particular, it does not change the fact that object `b1` is equal to object `b2`. This test satisfies `MUON-1`.

### Notes

* ISE Eiffel (as of 20.05.10.4440 and after) erroneously considers that objects `b1` and `b2` are not equal after the call to `f`, even though they were equal after the call to the non-once function `g`. This violates `MUON-1`.
