# Validity VUTA-4G

This [test](.) is exercising the condition [4G](../Readme.md) of the validity rule [VUTA](../../vuta/Readme.md).

### Description

In this test, there is a call `x.c.f` where `x` is a formal argument of the enclosing feature `g`, but the type of `c` in class `BB` is separate. This violates `VUTA-4G` because even though `x` is controlled, `x.c` is not.
