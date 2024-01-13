# Validity VUTA-4G

This [test](.) is exercising the condition [4G](../Readme.md) of the validity rule [VUTA](../../vuta/Readme.md).

### Description

In this test, there is a call `(inspect x when 1 then b when 2 then c end).f` where all branches (`b` and `c`) of the inspect expression are formal arguments of the enclosing feature `g`. Therefore the inspect expression is controlled. In this test `VUTA-4G` is not violated.
