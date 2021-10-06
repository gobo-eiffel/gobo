# Semantics MUGC-5

This [test](.) is exercising the step [`5`](../Readme.md) of the semantics rule [`MUGC`](../../mugc/Readme.md).

### Description

In this test, the type of the open argument `b` when calling the agent `agent f` is expanded. It is cloned when creating the tuple containing the open operands. It is cloned again when calling `f` when executing `call` on the agent. This test satisfies `MUGC-5`.

### Notes

* ISE Eiffel in finalized mode (as of 20.11.10.5058 and after) does not call `copy` when the argument of `call` is not a manifest tuple. So the object with copy semantics is either not cloned or not properly cloned. This violates `MUGC-5`.

* ISE Eiffel in workbench mode (as of 20.11.10.5058 and after) calls `copy` 3 times when executing `call` on the agent. So the object with copy semantics is cloned too many times. It should be cloned only once when calling `f`, or at most twice if the item extracted from the tuple containing the open operands is stored in a temporary variable before being passed as argument to `f`. This violates `MUGC-5`.
