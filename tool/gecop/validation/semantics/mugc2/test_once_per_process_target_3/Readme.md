# Semantics MUGC-2

This [test](.) is exercising the step [`2`](../Readme.md) of the semantics rule [`MUGC`](../../mugc/Readme.md).

### Description

This test is exercising the fact that there is no *Reattachment Semantics* rule involved for the target of a call. So even when the target is an attribute whose type is expanded (object with copy semantics), this object is not cloned and the feature is called on this object.

In this test, we have a call `b.copy (6)` where `b` is a once-per-process function whose type is of basic expanded type `INTEGER`. The call to `copy` sets the value of the object attached to the latest applicable result of the call to `b`, not in a clone ot this object. This test satisfies `MUGC-2`.

### Notes

* See also `MUVA` (*Value of a call expression*): The value of a *Call* `c` used as an expression is, at any run-time moment, the result of executing `c`.

* See also `MUON-4` (*Once Routine Execution semantics*): If the call is not fresh and `df` is a function: to attach the local variable `Result` to the latest applicable result of the call.

* ISE Eiffel (as of 20.11.10.5048 and after) crashes with an exception trace when calling `copy`.
