# Validity VGMC

This [test](.) is exercising the validity rule [VGMC](../Readme.md).

### Description

In this test, the formal generic parameter `G` of class `XX` has two constraints `CC` and `DD`. It inherits `g` from class `BB` with the qualified anchored type `like a.fc`, where `a` is of type `G` when viewed in the context of `XX`. But queries `f` in the constraint `CC` and `f` in the constraint `DD` are two different versions in `XX` (with different types) of the feature `fc` appearing in class text of `BB`. This violates `VGMC` because we don't know what is the type of the deanchored form.

### Notes

* ISE Eiffel (as of 18.11.10.2592 and after) fails to report this validity rule violation. It reports a `VEEN` error complaining that `fc` is not the final name of a feature.
