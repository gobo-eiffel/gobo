# Validity VGMC

This [test](.) is exercising the validity rule [VGMC](../Readme.md).

### Description

In this test, the formal generic parameter `G` of class `BB` has two constraints `CC` and `DD`. There is a creation expression `create {G}.make`. But `make` is the name of a procedure both in `CC` and `DD`. This violates `VGMC`.

### Notes

* ISE Eiffel (as of 18.11.10.2592 and after) reports the violation of `VTGC-3` before having a chance to report the violation of this validity rule `VGMC`.
* Gobo Eiffel reports the violation of `VGGC-3` before having a chance to report the violation of this validity rule `VGMC`.
