# Validity V1SE-3G

This [test](.) is exercising the condition [3G](../Readme.md) of the validity rule [V1SE](../../v1se/Readme.md).

### Description

In this test, there is a separate instruction with an argument whose type `INTEGER_32` is not separate. This violates `V1SE-3G`.

### Notes

* Even though `f` is declared of type `separate INTEGER_32`, its type is actually considered to be `INTEGER_32`. Indeed, expanded types cannot be separate.
