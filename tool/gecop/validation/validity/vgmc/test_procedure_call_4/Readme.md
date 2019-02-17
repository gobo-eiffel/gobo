# Validity VGMC

This [test](.) is exercising the validity rule [VGMC](../Readme.md).

### Description

In this test, the formal generic parameter `G` of class `BB` has twice the same constraint `CC` and `CC`. There is a call `a.f` where `a` is of type `G` and `f` is the name of a feature in `CC`. In this test `VGMC` is not violated because it's as if `CC` was a single generic constraint.

