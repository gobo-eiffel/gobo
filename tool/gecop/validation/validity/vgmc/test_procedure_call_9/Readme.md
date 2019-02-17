# Validity VGMC

This [test](.) is exercising the validity rule [VGMC](../Readme.md).

### Description

In this test, the formal generic parameter `G` of class `BB` has two constraints `CC` and `CC` again. There is a call `a.h` where `a` is of type `G` and `h` is the final name of feature `f` renamed from `CC` (first constraint) and also the final name of feature `f` renamed from `CC` again (second constraint). In this test `VGMC` is not violated because it's as if `CC` was a single generic constraint with respect to `h`, even though feature `g` in `CC` is renamed differently in these two constraints.
