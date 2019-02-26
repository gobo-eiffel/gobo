# Validity VGMC

This [test](.) is exercising the validity rule [VGMC](../Readme.md).

### Description

In this test, the formal generic parameter `G` of class `XX` has two constraints `CC` and `DD`. It inherits `g` from class `BB` with the call `z.f`, where `z` is of type `G` when viewed in the context of `XX`. But queries `f` in the constraint `CC` and `f` in the constraint `DD`, even though being the same version in `XX` of the feature `f` appearing in class text of `BB`, have different types (the base type of `like Current` is `CC` in `CC` and `DD` in `DD`). This violates `VGMC` because we don't know what is the type of the resulting expression, in particular when it is used as the target of another call.

### Notes

* ISE Eiffel (as of 18.11.10.2592 and after) fails to report this validity rule violation. This is strange because it correctly reports it when redefining the query `f` in `CC` using `CC` as result type instead of `like Current` as in its precursor.
