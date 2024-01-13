# Validity VUTA-4G

This [test](.) is exercising the condition [4G](../Readme.md) of the validity rule [VUTA](../../vuta/Readme.md).

### Description

In this test, there is a call `(if x then b else c end).f` where the branch `b` of the if expression is a separate formal argument of the enclosing feature `g` (hence controlled), and the branch `c` is not separate. Therefore the if expression is controlled. In this test `VUTA-4G` is not violated.

### Note

* ISE Eiffel (as of 23.09.10.7341 and after) wrongly reports the violation of validity rule `VUTA-4G` (known as `VUTA-3` in ISE Eiffel).
