# Validity VGMC

This [test](.) is exercising the validity rule [VGMC](../Readme.md).

### Description

In this test, the formal generic parameter `G` of class `XX` has two constraints `CC` and `DD`. It inherits `f` from class `BB` with the call `z.f`, where `z` is of type `G` when viewed in the context of `XX`. But features `f` in the constraint `CC` and `f` in the constraint `DD` are two different versions in `XX` (with different types) of the feature `f` appearing in class text of `BB`. This violates `VGMC` because we don't know what is the type of the resulting expression, in particular when it is used as the target of another call.

### Notes

* ISE Eiffel (as of 18.11.10.2592 and after) reports this validity rule violation using the old code `VTMC-4`. Also, even though the line number is correct, the error message shows the text of different class than `BB` (perhaps `CC` or `DD`).
