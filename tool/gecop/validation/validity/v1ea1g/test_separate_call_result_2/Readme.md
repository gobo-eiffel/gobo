# Validity V1EA-1G

This [test](.) is exercising the condition [1G](../Readme.md) of the validity rule [V1EA](../../v1ea/Readme.md).

### Description

In this test, in class `BB` there is a separate call to the function `f` from class `CC`. The type `DD [G]` of the result of `f` is expanded, but it contains an attribute `name` whose type `detachable G`. The actual generic type may be a non-separate reference type (`STRING` in this test). This violates `V1EA-1G`.

### Notes

* ISE Eiffel (as of 23.09.10.7341 and after) fails to report this validity error, resulting in a type issue where a `STRING` from another SCOOP region is not flagged as separate.
