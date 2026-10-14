# Validity VKCC-7G

This [test](.) is exercising the condition [7G](../Readme.md) of the validity rule [VKCC](../../vkcc/Readme.md).

### Description

In this test, the once class `BB` has a once creation procedure `f`. We get the
instance of `BB` using `create bf.f`. We call another once procedure `{BB}.g`.
In this test `VKCC-7G` is not violated because `f` has been declared in class `BB`.

### Notes

* ISE Eiffel (as of 25.12.9.8922 and after) wrongly tries to find an instance
  corresponding to `BB.g`, resulting either in a C compilation error or a
  crash at runtime.
