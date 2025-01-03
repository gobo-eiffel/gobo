# Validity VSRP-2

This [test](.) is exercising the condition [2](../Readme.md) of the validity rule [VSRP](../../vsrp/Readme.md).

### Description

In this test, the root creation procedure `make` has a formal argument of type `detachable ARRAY [detachable STRING]`. This violates `VSRP-2`.

### Notes

* Gobo Eiffel and ISE Eiffel (as of 24.05.10.7822 and after) accept this code (and more generally cases where `ARRAY [STRING]` conforms to the type of the formal argument) so that legacy code complying to the validity rule `VSRC` in ETL2 can still be compiled. `VSRC` was stating that the root creation procedure should have either no formal argument or a single argument of type `ARRAY [STRING]`.
