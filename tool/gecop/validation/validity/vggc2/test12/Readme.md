# Validity VGGC-2

This [test](.) is exercising the condition [2](../Readme.md) of the validity rule [VGGC](../../vggc/Readme.md).

### Description

In this test, the constraint of the second formal generic parameter `H` of class `BB` is the first formal generic parameter `G`. And the constraint of `G` has a `rename` clause, renaming feature `f` as `g`. Therefore `f` is also known as `g` when the target of the call is of type `H`. In this test `VGGC-2` is not violated.
