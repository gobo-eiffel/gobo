# Validity VAPE-2

This [test](.) is exercising the condition [2](../Readme.md) of the validity rule [VAPE](../../vape/Readme.md).

### Description

In this test, feature `f` in class `BB` is exported to `ANY`. It has a creation expression, appearing in its precondition, whose creation type is `G`, the formal generic parameter. Even though the associated creation procedure `make` is exported to `ANY` is class `CC`, when in class `BB` the only thing that we know about the creation procedure `make` of `G` is that it is available to `BB` (see `DGCR-1`, ECMA 367-2, section 8.12.12, page 81, *Generic-creation-ready type*). Therefore `VAPE-2` is violated.

### Notes

* ISE Eiffel (as of 18.11.10.2592 and above) fails to report this validity rule violation.
