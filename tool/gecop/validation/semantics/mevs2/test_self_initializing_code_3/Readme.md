# Semantics MEVS-2

This [test](.) is exercising the case [2](../Readme.md) of the semantics rule [MEVS](../../mevs/Readme.md).

### Description

In this test, the value of the attribute `f` is `2` (which is the value set in the self-initializing code of this attribute). This violates `MEVS-2` because the type of the attribute is self-initializing: it is attached with `default_create` as creation procedure.

### Notes

* ISE Eiffel (as of 20.03.10.3992 and after) and Gobo Eiffel (as of 20.05.31.5) do not consider as self-initializing reference attached types with `default_create` as creation procedure. With this assumption, this test satisfies `MEVS-2`.
