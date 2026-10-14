# Validity VKCC-7G

This [test](.) is exercising the condition [7G](../Readme.md) of the validity rule [VKCC](../../vkcc/Readme.md).

### Description

In this test, the once class `BB` has two once creation procedures `f` and `g`. We get the first
instance of `BB` using `create b.f`. But then we call the once procedure `b.g` before creating
the second instance of `BB`. When getting the second instance of `BB` using `{BB}.g`, the
call to `g` has no effect since this once procedure has already been called. In this test
`VKCC-7G` is not violated because both `f` and `g` have been declared in class `BB`.

### Notes

* ISE Eiffel (as of 25.12.9.8922 and after) lets `{BB}.f` and `{BB}.g` point to the same object.
