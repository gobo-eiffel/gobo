# Semantics M9AS

This [test](.) is exercising the semantics rule [M9AS](../Readme.md).

### Description

In this test, feature `f` of class `AA` contains separate call to the feature `g` of class `BB`. The actual argument of `g` is `Current`, which is in the current SCOOP region, and therefore is locked. So the separate call is executed synchronously. The execution of `f` waits for the separate call to complete. In feature `g` in class `BB` there is another separate call to feature `h` whose target is the object of type `AA` which triggered the call to `g`. Lock passing occurred during the first separate call, and we are in the case of a separate callback. So this second separate call is also executed synchronously.
