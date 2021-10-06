# Semantics MBRE

These [tests](.) are exercising the semantics rule below.  
Click on the `[tests]` label following the condition numbers below to see tests specific to these conditions.

## MBRE: Reattachment Semantics

### ECMA 367-2, 8.22.6 page 118

The effect of a reattachment of source expression `source` and target entity `target` is the effect of the first of the following steps whose condition applies:

1. If `source` converts to `target`: perform a conversion attachment from `source` to `target`.
2. If the value of `source` is a void reference: make `target`'s value void as well.
3. [\[tests\]](../mbre3) If the value of `source` is attached to an object with copy semantics: create a clone of that object, if possible, and attach `target` to it.
4. If the value of `source` is attached to an object with reference semantics: attach `target` to that object.

### ECMA 367-3 (working version 3-36), 8.22.6 page 122

Same as above.

### Notes

* The *informative text* of [`MBAS`](../mbas/Readme.md) (*Assignment semantics*) mentions:

  > The other cases where *Reattachment Semantics* applies is actual-formal association, per step `5` of the *General Call* rule.  
  On the other hand, the semantics of *Object_test*, a construct which also allows a *Read_only* entity to denote the same value as an expression, is simple enough that it does not need to refer to reattachment.

  This is not quite true. Even though there is no need for conversion in that case, there is still a need to create a clone of the value of the expression when the corresponding object has a copy semantics. Otherwise we may end up with two entities attached to the same object with copy semantics, which defeats one of the goals of copy semantics. See [`MVOL`](../mvol) for some examples.

  So condition `1` should be removed from `MBRE`. It is common to assignment and argument passing, whereas the other conditions about attachment proper (in particular when copy semantics is involved) are applicable to more cases like *Object_test* (see [`MVOL`](../mvol/Readme.md)). Conversion is already explictly mentioned in [`MUGC`](../mugc/Readme.md) (*General Call Semantics*) for argument passing. It should be explicitly mentioned in `MBAS` as well.

* Condition `1` about conversion and the other conditions about attachment proper (in particular when copy semantics is involved) should not be exclusive. There are cases where we need first to convert the source and then clone the resulting object when it has copy semantics. See the tests for [`MBRE-1`](../mbre1) for examples.

* Condition `3` mentions "if possible". This refers to the fact that the cloning might be impossible for lack of memory, in which case the semantics of the cloning operation specifies triggering an exception, of type `NO_MORE_MEMORY`.
