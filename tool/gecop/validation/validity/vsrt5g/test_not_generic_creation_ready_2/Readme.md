# Validity VSRT-5G

This [test](.) is exercising the condition [5G](../Readme.md) of the validity rule [VSRT](../../vsrt/Readme.md).

### Description

In this test, the root type `AA [STRING]` is not generic-creation-ready. Procedure `default_create` inherited from `ANY` is not a creation procedure in `STRING`. This violates `VSRT-5G`.

### Notes

* Gobo Eiffel reports this validity rule violation using the code `VTCG-4`.

* ISE Eiffel (as of 24.05.10.7822 and after) fails to report this validity rule violation.
