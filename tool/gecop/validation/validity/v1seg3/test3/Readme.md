# Validity V1SE-G3

This [test](.) is exercising the condition [G3](../Readme.md) of the validity rule [V1SE](../../v1se/Readme.md).

### Description

In this test, there is a separate instruction with an argument whose type `INTEGER_32` is not separate. This violates `V1SE-G3`.

### Notes

* Even though `f` is declared of type `separate INTEGER_32`, its type is actually considered to be `INTEGER_32`. Indeed, expanded types cannot be separate.
