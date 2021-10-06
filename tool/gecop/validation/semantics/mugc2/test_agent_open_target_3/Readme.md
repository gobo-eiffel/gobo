# Semantics MUGC-2

This [test](.) is exercising the step [`2`](../Readme.md) of the semantics rule [`MUGC`](../../mugc/Readme.md).

### Description

This test is exercising the fact that there is no *Reattachment Semantics* rule involved for the target of a call. So even when the type of the target is expanded (object with copy semantics), this object is not cloned and the feature is called on this object.

In this test, the type of the open target `b` when calling the agent `agent {BB}.f` is a reference type, but `b` is attached to an object with copy semantics. It is cloned when creating the tuple containing the open operands. But then when we call `f` when executing `call` on the agent, the target of the call is the object attached to the first item of the tuple containing the open operands. It is not cloned again. This test satisfies `MUGC-2`.

### Notes

* ISE Eiffel in finalized mode (as of 20.11.10.5058 and after) does not call `copy` when creating a manifest tuple. So the object with copy semantics is either not cloned or not properly cloned.

* ISE Eiffel in workbench mode (as of 20.11.10.5058 and after) calls `copy` 3 times when executing `call` on the agent. So the object with copy semantics is cloned too many times. It should be cloned at most once if the item extracted from the tuple containing the open operands is stored in a temporary variable before being used as target to `f`. Furthermore, despite these 3 calls to `copy`, the object with copy semantics which was used when creating the tuple containing the open operands does not seem to be cloned. This violates `MUGC-2`.
