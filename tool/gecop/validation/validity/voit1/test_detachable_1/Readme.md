# Validity VOIT-1

This [test](.) is exercising the condition [1](../Readme.md) of the validity rule [VOIT](../../voit/Readme.md).

### Description

In this test, the expression `s` of the iteration is detachable. So even though
`STRING` conforms to `ITERABLE [CHARACTER]`, the type `detachable STRING` of `s`
does not conforms to `ITERABLE [CHARACTER]`. This violates `VOIT-1`.
