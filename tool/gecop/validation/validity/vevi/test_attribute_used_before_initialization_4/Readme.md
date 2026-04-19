# Validity VEVI

This [test](.) is exercising the validity rule [VEVI](../../vevi/Readme.md).

### Description

In this test, the attribute `b` of attached type is used in `f (b)`
before being initialized in the creation procedure of class `AA`.
Note that despite being of the extended form (with the `attribute`
keyword), the attribute `b` is not self-initializing.
This violates `VEVI`.

### Notes

* ISE Eiffel (as of 25.12.9.8922 and after) reports that `Result` is
  used before being initialized in the postcondition of `b` instead of
  complaining that `b` is used before being initialized in the creation
  procedure of class `AA`.
