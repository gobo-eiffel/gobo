# Validity VUAR-3G

This [test](.) is exercising the condition [3G](../Readme.md) of the validity rule [VUAR](../../vuar/Readme.md).

### Description

In this test, there is a separate call to the procedure `f` from class `BB`. The type of the actual argument i sreference, but the type of the formal argument of `f` is not separate. This violates `VUAR-3G`.

### Notes

* This test also violates `VUAR-2`. Indeed the actual argument of `f` is of type `separate STRING` which does not conform to the type of the formal argument `STRING`.

* Gobo Eiffel and ISE Eiffel (as of 23.09.10.7341 and after) only report the violation of `VUAR-2`.
