# Validity VUAR-4G

This [test](.) is exercising the condition [4G](../Readme.md) of the validity rule [VUAR](../../vuar/Readme.md).

### Description

In this test, there is a separate *Assigner\_call* to set the value of a label of a tuple whose type is separate. The type `BB` of the source of the *Assigner\_call* is expanded, but it contains an attribute `name` whose type is reference but not separate. This violates `VUAR-4G`.

### Notes

* Gobo Eiffel reports a validity error `V1EA-1G` instead. This is because the issue of having non-separate reference attributes in expanded classes is more general than just this particular case.
