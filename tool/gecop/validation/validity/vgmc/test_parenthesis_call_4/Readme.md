# Validity VGMC

This [test](.) is exercising the validity rule [VGMC](../Readme.md).

### Description

In this test, the formal generic parameter `G` of class `BB` has two constraints `CC` and `DD`. There is a call `Precursor (5)` where `Precursor` is of type `G`. But `alias "()"` is the alias name of a feature both in `CC` and `DD`. This violates `VGMC`.

### Notes

* ISE Eiffel (as of 18.11.10.2592 and after) fails to report this validity rule violation and calls none of the features.
