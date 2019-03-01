# Validity VGMC

This [test](.) is exercising the validity rule [VGMC](../Readme.md).

### Description

In this test, the formal generic parameter `G` of class `XX` has two constraints `CC` and `DD`. It inherits `g` from class `BB` with the call `z.f (e)`, where `z` is of type `G` when viewed in the context of `XX`. The procedures `f` in the constraint `CC` and `f` in the constraint `DD` are two different versions in `XX` of the procedure `f` appearing in class text of `BB`, but using either of these two versions keeps the call valid. In this test `VGMC` is not violated.
