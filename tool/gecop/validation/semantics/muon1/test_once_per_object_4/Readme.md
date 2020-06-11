# Semantics MUON-1

This [test](.) is exercising the case [1](../Readme.md) of the semantics rule [MUON](../../muon/Readme.md).

### Description

In this test, the call to the once-per-object function `f` is fresh in object `b1`. It has the same behavior as the execution of a non-once function on this object. The object `b2` is a clone of `b1` but `f` has never been called on this other object. So the call to `f` is also fresh in object `b2`. Therefore it also has the same behavior as the execution of a non-once procedure on this other object. This test satisfies `MUON-1`.

### Notes

* ISE Eiffel (as of 20.05.10.4440 and after) erroneously considers that the call to `b2` is not fresh, even though `f` has never called on this object.
