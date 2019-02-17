# Validity VGMC

This [test](.) is exercising the validity rule [VGMC](../Readme.md).

### Description

In this test, the formal generic parameter `G` of class `BB` has two constraints `CC [ANY]` and `CC [ANY]` again. There is a call `a.f` where `a` is of type `G` and `f` is the final name of a feature in `CC`. In this test `VGMC` is not violated because it's as if `CC [ANY]` was a single generic constraint.
