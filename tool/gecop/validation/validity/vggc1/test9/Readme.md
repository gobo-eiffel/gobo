# Validity VGGC-1

This [test](.) is exercising the condition [1](../Readme.md) of the validity rule [VGGC](../../vggc/Readme.md).

### Description

In this test, the constraint of the first formal generic parameter `G` of class `CC` is `DD [H]`, which depends on the second formal generic parameter `H`. But since the constraint does not contain an anchored type, it does not violate `VGGC-1`.
