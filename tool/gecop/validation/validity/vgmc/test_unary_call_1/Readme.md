# Validity VGMC

This [test](.) is exercising the validity rule [VGMC](../Readme.md).

### Description

In this test, the formal generic parameter `G` of class `BB` has two constraints `CC` and `DD`. There is a call `+ a` where `a` is of type `G`. But no feature in the constraints `CC` or `DD` has the unary operator `+` as alias name. This violates `VGMC`.

### Notes

* ISE Eiffel (as of 18.11.10.2592 and after) crashes with an exception trace.
