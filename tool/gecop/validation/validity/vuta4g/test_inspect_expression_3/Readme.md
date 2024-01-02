# Validity VUTA-4G

This [test](.) is exercising the condition [4G](../Readme.md) of the validity rule [VUTA](../../vuta/Readme.md).

### Description

In this test, there is a call `(inspect x when 1 then b when 2 then c end).f` where the branch `b` of the inspect expression is a separate formal argument of the enclosing feature `g` (hence controlled), and the branch `c` is not separate. Therefore the inspect expression is controlled. In this test `VUTA-4G` is not violated.
