# Validity VFAV-5

This [test](.) is exercising the condition [5](../Readme.md) of the validity rule [VFAV](../../vfav/Readme.md).

### Description

In this test, feature `f` in class `BB` has an alias name `alias "+"` with no `convert` mark. Class `BB` also has a conversion routine to `CC`. Class `CC` also has a feature with the alias name `alias "+"`. The code `b + c` is class `AA` will be unfolded to `b.to_c + c` despite the fact that the alias name has no explicit `convert` mark. This is a relaxation of the rule `VFAV-5`.

### Notes:

* Both ISE Eiffel (as of 18.11.10.2592 and after) and Gobo Eiffel support target conversion without the explicit `convert` mark.


