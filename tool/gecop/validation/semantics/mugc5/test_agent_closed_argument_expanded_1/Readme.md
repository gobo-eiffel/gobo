# Semantics MUGC-5

This [test](.) is exercising the step [`5`](../Readme.md) of the semantics rule [`MUGC`](../../mugc/Readme.md).

### Description

In this test, the type of the closed argument `b` of the agent `agent f (b)` is expanded. It is cloned when creating the agent because it is attached to the item of the tuple `ROUTINE.closed_operands`. It is cloned again each time we call `f` when executing `call` on the agent. This test satisfies `MUGC-5`.

### Notes

* ISE Eiffel (as of 20.11.10.5058 and after) does not call `copy` at all. So the object with copy semantics is either not cloned or not properly cloned. This violates `MUGC-5`.
