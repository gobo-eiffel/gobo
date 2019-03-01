# Validity VGMC

This [test](.) is exercising the validity rule [VGMC](../Readme.md).

### Description

In this test, the formal generic parameter `G` of class `XX` has two constraints `CC` and `DD`. It inherits `g` from class `BB` with the call `a.fc (c)`, where `a` is of type `G` when viewed in the context of `XX`. The procedures `f` in the constraint `CC` and `f` in the constraint `DD` are two different versions in `XX` of the procedure `fc` appearing in class text of `BB`, but when using the version from `DD` the argument of the call is not of the correct type. In this test `VGMC` is not violated, but `VUAR-2` is violated, even though it was the version of `f` in `CC` which was called in `BB`, not the version in `DD`.

