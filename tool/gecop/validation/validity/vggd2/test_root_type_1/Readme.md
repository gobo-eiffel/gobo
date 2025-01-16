# Validity VGGD-2

This [test](.) is exercising the condition [2](../Readme.md) of the validity rule [VGGD](../../vggd/Readme.md).

### Description

In this test, in the root type `AA [INTEGER]`, the actual generic parameter `INTEGER` does not conform to the constraint `STRING` of the formal generic parameter of class `AA`. This violates `VGGD-2`.

### Notes

* Gobo Eiffel reports this validity rule violation using the code `VTCG-3`.

* ISE Eiffel (as of 24.05.10.7822 and after) reports this validity rule violation using the code `VSRT-4`.
