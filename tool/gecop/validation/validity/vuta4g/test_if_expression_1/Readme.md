# Validity VUTA-4G

This [test](.) is exercising the condition [4G](../Readme.md) of the validity rule [VUTA](../../vuta/Readme.md).

### Description

In this test, there is a call `(if x then b else c end).f` where all branches (`b` and `c`) of the if expression are formal arguments of the enclosing feature `g`. Therefore the if expression is controlled. In this test `VUTA-4G` is not violated.
