# Validity VSCI

This [test](.) is exercising the validity rule [VSCI](../../vsci/Readme.md).

### Description

In this test, there are two classes with the same upper name `BB` in the universe. This violates `VSCI` even though these classes are not used in the system (i.e not reachable from the root class `AA`).

### Notes

*  ISE Eiffel (as of 24.05.10.7822 and after) reports this validity rule violation using the code `VD71`.
