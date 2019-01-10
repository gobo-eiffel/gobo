# Validity VGGC-1

This [test](.) is exercising the condition [1](../Readme.md) of the validity rule [VGGC](../../vggc/Readme.md).

### Description

In this test, the constraint of the second formal generic parameter `H` of class `CC` is `DD [G]`, which depends on the first formal generic parameter `G`. But since the constraint does not contain an anchored type, it does not violate `VGGC-1`.
