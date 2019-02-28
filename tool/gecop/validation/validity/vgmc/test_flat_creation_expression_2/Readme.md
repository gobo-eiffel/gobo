# Validity VGMC

This [test](.) is exercising the validity rule [VGMC](../Readme.md).

### Description

In this test, the formal generic parameter `G` of class `XX` has two constraints `CC` and `DD`. It inherits `f` from class `BB` with the creation expression `create {G}.f (c)`. The procedures `make` in the constraint `CC` and `make` in the constraint `DD` are two different versions in `XX` of the procedures `make` appearing in class text of `BB`, but when using the version from `DD` the argument of the creation call is not of the correct type. In this test `VGMC` is not violated, but `VUAR-2` is violated.

