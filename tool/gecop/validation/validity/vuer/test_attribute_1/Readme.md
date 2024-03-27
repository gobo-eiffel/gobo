# Validity VUER

This [test](.) is exercising the validity rule [VUER](../../vuer/Readme.md).

### Description

In this test, there is a separate call to the attribute `c` from class `BB`. The type `CC` of result of `c` is expanded, but it contains an attribute `name` whose type is reference but not separate. This violates `VUER`.

### Note

* Gobo Eiffel reports a validity error `V1EA-1G` instead. This is because the issue of having non-separate reference attributes in expanded classes is more general than just this particular case.
