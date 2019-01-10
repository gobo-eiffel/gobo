# Validity VGGC-1

This [test](.) is exercising the condition [1](../Readme.md) of the validity rule [VGGC](../../vggc/Readme.md).

### Description

In this test, the constraint of the formal generic parameter `G` of class `BB` is `G` itself. This constraint is unless since it requires the actual generic parameter to conform to itself, but all types conform to themselves. But since the constraint is not an anchored type, it does not violate `VGGC-1`.
