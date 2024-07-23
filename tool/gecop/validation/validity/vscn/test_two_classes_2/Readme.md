# Validity VSCN

This [test](.) is exercising the validity rule [VSCN](../../vscn/Readme.md).

### Description

In this test, there is a class with the name `BB` and another one with the name `bb` in the universe. This violates `VSCN` because these classes have the same upper name `BB`.

### Notes

*  ISE Eiffel (as of 24.05.10.7822 and after) reports this validity rule violation using the code `VD71`.
