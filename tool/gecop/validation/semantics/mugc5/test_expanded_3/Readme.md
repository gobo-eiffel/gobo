# Semantics MUGC-5

This [test](.) is exercising the step [`5`](../Readme.md) of the semantics rule [`MUGC`](../../mugc/Readme.md).

### Description

In this test, the type of the actual and formal arguments is a reference type but the actual argument is attached to an object with copy semantics. After the attachment the formal argument is attached to a clone of the object attached to the actual argument. This test satisfies `MUGC-5`.
