# Validity VUTA-4G

This [test](.) is exercising the condition [4G](../Readme.md) of the validity rule [VUTA](../../vuta/Readme.md).

### Description

In this test, there is a call `(if x then b else c end).f` where the branch `c` of the if expression is not controlled. Therefore the if expresion is not controlled. This violates `VUTA-4G`.
