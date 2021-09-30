# Semantics MVOL

This [test](.) is exercising the semantics rule [MVOL](../Readme.md).

### Description

In this test, we have an object-test `attached b as a` where the type of the local variable `b` is expanded. After the attachment `a` is attached to a clone of the object attached to `b`. Otherwise we would end up with two entities `a` and `b` attached to the same object with copy semantics, which defeats one of the goals of copy semantics. This test satisfies `MVOL`.
