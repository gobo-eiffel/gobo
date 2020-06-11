# Semantics MUON-3

This [test](.) is exercising the case [3](../Readme.md) of the semantics rule [MUON](../../muon/Readme.md).

### Description

In this test, the second call to the once-per-object procedure `f` is executed from another thread while the first call to `f` was not completed yet. The call on the second thread is blocked until the first call to `f` is completed. This is to avoid having two different threads triggering the same once-per-object procedure on the same object at the same time, violating the fact that the body of a once-per-object procedure should not be executed more than once on the same object. After being unblocked, the second call to `f` has no effect. This test satisfies `MUON-3`.

### Notes

* ISE Eiffel (as of 20.05.10.4440 and after) does not protect the call to once-per-object routines on the same object from being executed by two threads at the same time. This may result in having the  body of these once-per-object routines being executed more than once on the same object.
