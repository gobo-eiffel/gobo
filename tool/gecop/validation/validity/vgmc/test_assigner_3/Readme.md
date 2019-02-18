# Validity VGMC

This [test](.) is exercising the validity rule [VGMC](../Readme.md).

### Description

In this test, the formal generic parameter `G` of class `BB` has two constraints `CC` and `DD`. There is a call `a.z (5) := 4` where `a` is of type `ZZ [G]` and `z` is an attribute of type `G`. But `alias "()"` is the alias name of a feature both in `CC` and `DD`. This violates `VGMC`.

### Notes

* ISE Eiffel (as of 18.11.10.2592 and after) fails to report this validity rule violation. Instead of that, it reports a `VBAC` error, as if it does not support `alias "()"` in assigner instructions.