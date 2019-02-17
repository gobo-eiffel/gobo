# Validity VGMC

This [test](.) is exercising the validity rule [VGMC](../Readme.md).

### Description

In this test, the formal generic parameter `G` of class `BB` has two constraints `CC` and `DD`. There is a call `a.f` where `a` is of type `G`. `f` is the final name of a feature in `CC`, and also the final name of a feature in `DD`. In this test `VGMC` is not violated because the feature `f` from `DD` is renamed as `f_dd` in the generic constraint.
