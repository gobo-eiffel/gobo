# Validity VUTA-4G

This [test](.) is exercising the condition [4G](../Readme.md) of the validity rule [VUTA](../../vuta/Readme.md).

### Description

In this test, there is a call `(inspect x when 1 then b when 2 then c end).f` where the branch `c` of the inspect expression is not controlled. Therefore the inspect expresion is not controlled. This violates `VUTA-4G`.
