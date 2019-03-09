# Validity VGMC

This [test](.) is exercising the validity rule [VGMC](../Readme.md).

### Description

In this test, the formal generic parameter `G` of class `XX` has two constraints `CC` and `DD`. It inherits `g` from class `BB` with the qualified anchored type `like z.f`, where `z` is of type `G` when viewed in the context of `XX`. But features `f` in the constraint `CC` and `f` in the constraint `DD` are two different versions in `XX` (with different types) of the feature `f` appearing in class text of `BB`. This violates `VGMC` because we don't know what is the type of the deanchored form.

### Notes

* ISE Eiffel (as of 18.11.10.2592 and after) fails to report this validity rule violation. Instead of that it reports a `VJAR` error claiming that the deanchored form of `like z.f` is `G`.
