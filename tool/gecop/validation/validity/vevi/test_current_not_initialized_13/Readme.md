# Validity VEVI

This [test](.) is exercising the validity rule [VEVI](../../vevi/Readme.md).

### Description

In this test, `Current` is used before the attribute `b` of attached type is
initialized in the creation procedure of class `AA`. This violates `VEVI`.

### Notes

* ISE Eiffel (as of 25.12.9.8922 and after) fails to report this validity rule
  violation. Instead of that, a call-on-void-target exception is raised at runtime.
