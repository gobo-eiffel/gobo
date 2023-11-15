# Validity VBAR

This [test](.) is exercising the validity rule [VBAR](../../vbar/Readme.md).

### Description

In this test, there is an assignment `y := x` where the type of the source `x` is `BB` which is not separate thanks to the object-test `attached {BB} b as x` despite `b` being of type `separate BB`. So the type of `x` conforms to the type of target of the assignment `y`. In this test `VBAR` is not violated.
