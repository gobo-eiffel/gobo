# Validity VGGC-1

This [test](.) is exercising the condition [1](../Readme.md) of the validity rule [VGGC](../../vggc/Readme.md).

### Description

In this test, the constraint of the second formal generic parameter `H` of class `CC` is the first formal generic parameter `G`. This means that the second actual generic parameter will have to conform to the first one. But since the constraint does not contain an anchored type, it does not violate `VGGC-1`.
