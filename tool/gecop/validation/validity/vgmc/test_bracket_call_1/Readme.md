# Validity VGMC

This [test](.) is exercising the validity rule [VGMC](../Readme.md).

### Description

In this test, the formal generic parameter `G` of class `BB` has two constraints `CC` and `DD`. There is a call `a [5]` where `a` is of type `G`. But no feature in the constraints `CC` or `DD` has the alias name `alias "[]"`. This violates `VGMC`.

### Notes

* ISE Eiffel (as of 18.11.10.2592 and after) reports this validity rule violation using the code `VWBR-1`.
