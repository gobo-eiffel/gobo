# Validity VGGC-1

This [test](.) is exercising the condition [1](../Readme.md) of the validity rule [VGGC](../../vggc/Readme.md).

### Description

In this test, the constraint of the formal generic parameter `G` of class `BB` is `CC [G]`, which depends on `G` itself. But since the constraint does not contain an anchored type, it does not violate `VGGC-1`.
