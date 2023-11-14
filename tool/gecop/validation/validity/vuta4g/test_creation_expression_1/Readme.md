# Validity VUTA-4G

This [test](.) is exercising the condition [4G](../Readme.md) of the validity rule [VUTA](../../vuta/Readme.md).

### Description

In this test, there is a call `(create {separate BB}.make).f` where the target `(create {separate BB}.make)` is separate but not controlled. This violates `VUTA-4G`.
