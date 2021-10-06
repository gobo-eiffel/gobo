# Semantics MUGC-5

This [test](.) is exercising the step [`5`](../Readme.md) of the semantics rule [`MUGC`](../../mugc/Readme.md).

### Description

This test shows that for each actual argument in the order listed, first it is evaluated, then converted, and finally the resulting object with copy semantics is cloned. This is different from what is specified in [`MUGC`](../../mugc/Readme.md) where the actual arguments are first evaluated and converted (first traversal in step `4`) and then cloned (second traversal in step `5`). So the two traversals in steps `4` and `5` need to be merged into a single traversal.

The routine in this test has two formal arguments to show this order of processing.
