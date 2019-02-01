# Validity VGGC-2

This [test](.) is exercising the condition [2](../Readme.md) of the validity rule [VGGC](../../vggc/Readme.md).

### Description

In this test, the constraint of the first formal generic parameter of class `BB` is `CC`, whose base class is frozen. This constraint has a `rename` clause. `VGGC-2` seems to reject this case because we cannot inherit from a type whose base class is frozen, but it is accepted by ISE Eiffel (as of 18.11.10.2592 and after) and Gobo Eiffel.
