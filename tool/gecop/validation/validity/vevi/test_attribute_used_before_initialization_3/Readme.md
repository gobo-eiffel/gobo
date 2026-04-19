# Validity VEVI

This [test](.) is exercising the validity rule [VEVI](../../vevi/Readme.md).

### Description

In this test, the attribute `b` of attached type is used in `f (b)`
before being initialized in the creation procedure of class `AA`.
Note that despite being of the extended form (with the `attribute`
keyword), the attribute `b` is not self-initializing.
This violates `VEVI`.
