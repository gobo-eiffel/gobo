# Semantics MVOL

These [tests](.) are exercising the semantics rule below.

## MVOL: Object-Test Local semantics

### ECMA 367-2, 8.24.7 page 128

For an *Object_test* `{x: T} exp`, the value of `x`, defined only over its scope, is the value of `exp` at the time of the *Object_test*'s evaluation.

### ECMA 367-3 (working version 3-42), 8.26.8 page 229

For an *Object_test* `attached {T} exp as x` (with the `{T}` part possibly absent), the value of `x`, defined only over its scope, is the value of `exp` at the time of the *Object_test*'s evaluation.

### Notes

* The *informative text* of [`MBAS`](../mbas/Readme.md) (*Assignment semantics*) mentions:

  > The other cases where *Reattachment Semantics* applies is actual-formal association, per step `5` of the *General Call* rule.  
  On the other hand, the semantics of *Object_test*, a construct which also allows a *Read_only* entity to denote the same value as an expression, is simple enough that it does not need to refer to reattachment.

  This is not quite true. Even though there is no need for conversion in that case, there is still a need to create a clone of the value of the expression when the corresponding object has a copy semantics. Otherwise we may end up with two entities attached to the same object with copy semantics, which defeats one of the goals of copy semantics. See an example [here](./test_expanded_1).
