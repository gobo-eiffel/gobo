# Semantics M9EA

This [test](.) is exercising the semantics rule [M9EA](../Readme.md).

### Description

In this test, feature `BB.h` has two separate arguments. The region of the second argument is already locked because it is a formal argument of its caller `BB.g`. The region of the first argument being available, it becomes locked as well and `BB.h` starts executing. But the region of the second argument of `BB.h` was busy executing some code which will eventually call some code on the region of the first argument. This results in a dealock.
