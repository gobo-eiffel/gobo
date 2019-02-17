# Validity VGMC

This [test](.) is exercising the validity rule [VGMC](../Readme.md).

### Description

In this test, the formal generic parameter `G` of class `BB` has two constraints `CC` and `DD`. There is an agent `agent {G}.f`. But `f` is not the name of a feature in any of the constraints `CC` or `DD`. This violates `VGMC`.

### Notes

* ISE Eiffel (as of 18.11.10.2592 and after) does not support agents whose target's type is a formal parameter.
