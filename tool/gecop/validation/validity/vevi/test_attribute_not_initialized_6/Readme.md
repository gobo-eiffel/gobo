# Validity VEVI

This [test](.) is exercising the validity rule [VEVI](../../vevi/Readme.md).

### Description

In this test, the once procedure `g` is called before being used as once
creation procedure of once class `BB`. Therefore the attribute `a` of
attached type is not initialized at the end of this creation procedure
of class `BB`. This violates `VEVI`.

### Notes

* ISE Eiffel (as of 25.12.9.8922 and after) fails to report this validity rule
  violation.

