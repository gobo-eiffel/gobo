# Validity VUAR-4G

This [test](.) is exercising the condition [4G](../Readme.md) of the validity rule [VUAR](../../vuar/Readme.md).

### Description

In this test, there is a separate *Assigner\_call* to set the value of an attribute `name` in an object of separate type `separate BB`. The type of the formal argument of the assigner procedure `set_name` is reference, but it is not separate. This violates `VUAR-4G`.

### Notes

* ISE Eiffel (as of 23.09.10.7341 and after) reports this validity rule violation using the code `VUAR-3`.
