# Semantics MUGC-5

This [test](.) is exercising the step [`5`](../Readme.md) of the semantics rule [`MUGC`](../../mugc/Readme.md).

### Description

In this test, we have `agent f (b)` where the type the formal argument of `f` is a reference type. The type of the closed argument `b` is also a reference type, but it is attached to an object with copy semantics. The object attached to `b` is cloned when creating the agent because it is reattached to the item of the tuple `ROUTINE.closed_operands`. It is cloned again each time we call `f` when executing `call` on the agent. This test satisfies `MUGC-5`.

### Notes

* ISE Eiffel (as of 20.11.10.5058 and after) does not call `copy` at all (apart from the assignment). So the object with copy semantics is either not cloned or not properly cloned. This violates `MUGC-5`.
