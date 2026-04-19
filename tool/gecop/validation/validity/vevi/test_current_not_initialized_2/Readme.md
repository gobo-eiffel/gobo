# Validity VEVI

This [test](.) is exercising the validity rule [VEVI](../../vevi/Readme.md).

### Description

In this test, `Current` is used before the attribute `b` of attached type is
initialized in the creation procedure of class `AA`. Even though `b` is not
used before being initialized, this violates `VEVI` because all qualified
calls with at least one argument of reference type or a target of reference
type are considered to potentially access `b`.
