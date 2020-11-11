# Validity VGMC

This [test](.) is exercising the validity rule [VGMC](../Readme.md).

### Description

In this test, the formal generic parameter `G` of class `BB` has two constraints `CC` and `DD`. There is a qualified anchored type `like a.f` where `a` is of type `G` and `f` is not the name of a feature in any of the constraints `CC` or `DD`. This violates `VGMC`.

### Notes

* ISE Eiffel (as of 18.11.10.2592 and after) reports this validity rule violation using the code `VEEN`. But it does not indicate a line number.
