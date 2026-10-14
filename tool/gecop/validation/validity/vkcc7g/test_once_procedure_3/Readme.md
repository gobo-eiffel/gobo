# Validity VKCC-7G

This [test](.) is exercising the condition [7G](../Readme.md) of the validity rule [VKCC](../../vkcc/Readme.md).

### Description

In this test, the once class `BB` has two once creation procedures `f` and `g`. We get the first
instance of `BB` using `create bf.f` and then the second instance using `create bg.g`.
The subsequent call `bf.g` has no effect since this once procedure has already been called.
In this test `VKCC-7G` is not violated because both `f` and `g` have been declared in class `BB`.
