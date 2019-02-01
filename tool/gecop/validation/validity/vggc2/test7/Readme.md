# Validity VGGC-2

This [test](.) is exercising the condition [2](../Readme.md) of the validity rule [VGGC](../../vggc/Readme.md).

### Description

In this test, the constraint of the first formal generic parameter of class `BB` is a formal generic parameter itself. This constraint has a `rename` clause. This is not explicitly rejected by `VGGC-2`. But ISE Eiffel (as of 18.11.10.2592 and after) and Gobo Eiffel do not accept a `rename` clause if the type `T` of the *Single\_constraint* is a formal generic parameter.

### Notes

* ISE Eiffel (as of 18.11.10.2592 and after) reports a validity rule violation using the code `VTMC-3`. But we can see in this example that it is not always tied to multiple constraints. So it would have been more logic for it to be a condition of `VGGC`. Furthermore, the error message indicates that the problem is in the inheritance or invariant clause, which is not true.
