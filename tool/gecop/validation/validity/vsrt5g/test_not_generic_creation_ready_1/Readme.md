# Validity VSRT-5G

This [test](.) is exercising the condition [5G](../Readme.md) of the validity rule [VSRT](../../vsrt/Readme.md).

### Description

In this test, the root type `AA [CC]` is not generic-creation-ready. Procedure `make` inherited from `BB` is not a creation procedure in `CC`. This violates `VSRT-5G`.

### Notes

* Gobo Eiffel reports this validity rule violation using the code `VTCG-4`.

* ISE Eiffel (as of 24.05.10.7822 and after) erroneously reports a validity error `VSRT-2`.
