# Validity VGGC-2

This [test](.) is exercising the condition [2](../Readme.md) of the validity rule [VGGC](../../vggc/Readme.md).

### Description

In this test, the constraint of the formal generic parameter of class `BB` has a `rename` clause, renaming feature `f` as `g`. Since `f` is the final name of a feature in `CC`, and `g` is not, this `rename` clause is valid. It does not violate `VGGC-2`.


### Notes

* `gec` and `gelint` do not support `rename` clauses on formal generic constraints.
