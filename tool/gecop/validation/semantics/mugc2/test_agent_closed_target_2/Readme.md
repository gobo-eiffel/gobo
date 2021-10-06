# Semantics MUGC-2

This [test](.) is exercising the step [`2`](../Readme.md) of the semantics rule [`MUGC`](../../mugc/Readme.md).

### Description

This test is exercising the fact that there is no *Reattachment Semantics* rule involved for the target of a call. So even when the type of the target is expanded (object with copy semantics), this object is not cloned and the feature is called on this object.

In this test, the type of the closed target `b` of the agent `agent b.f` is a reference type, but `b` is attached to an object with copy semantics. It is cloned when creating the agent because it is attached to the item of the tuple `ROUTINE.closed_operands`. But then each time we call `f` when executing `call` on the agent, the target of the call is the object attached to the first item of the tuple `ROUTINE.closed_operands`. It is not cloned again. This test satisfies `MUGC-2`.

### Notes

* ISE Eiffel (as of 20.11.10.5058 and after) does not call `copy` when creating the agent. So the object with copy semantics is either not cloned or not properly cloned.
