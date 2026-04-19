# Validity VEVI

This [test](.) is exercising the validity rule [VEVI](../../vevi/Readme.md).

### Description

In this test, `Result` of attached type is not initialized at the end
of the body of the attribute `f`. This violates `VEVI`.

### Notes

* ISE Eiffel (as of 25.12.9.8922 and after) also reports that the
  attribute `b` is not initialized at the end of the creation
  procedure of class `AA`, despite the fact that `b` is
  self-initializing.
