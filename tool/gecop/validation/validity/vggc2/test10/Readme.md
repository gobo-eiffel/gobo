# Validity VGGC-2

This [test](.) is exercising the condition [2](../Readme.md) of the validity rule [VGGC](../../vggc/Readme.md).

### Description

In this test, the constraint of the first formal generic parameter of class `BB` is `TUPLE`. This constraint has a `rename` clause. `VGGC-2` seems to reject the case where `BT` is a *Tuple\_type* (we can only inherit from *Class\_type*s, not from *Tuple\_type*s), but it is accepted by ISE Eiffel (as of 18.11.10.2592 and after) and Gobo Eiffel.
