# Validity VGMC

This [test](.) is exercising the validity rule [VGMC](../Readme.md).

### Description

In this test, the formal generic parameter `G` of class `XX` has two constraints `CC` and `DD`. It inherits `f` from class `BB` with the creation instruction `create a.make`, where `a` is of type `G` when viewed in the context of `XX`. The procedures `make_c` in the constraint `CC` and `make_d` in the constraint `DD` are two different versions in `XX` of the procedures `make` appearing in class text of `BB`, but using either of these two versions keeps the call valid. In this test `VGMC` is not violated.

### Notes

* ISE Eiffel (as of 18.11.10.2592 and after) wrongly reports the violation of validity rule `VGCC-8` instead.
