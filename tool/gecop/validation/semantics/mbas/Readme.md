# Semantics MBAS

These [tests](.) are exercising the semantics rule below.

## MBAS: Assignment semantics

### ECMA 367-2, 8.22.7 page 119

The effect of a reassignment `x := y` is determined by the *Reattachment Semantics* rule, with source `y` and target `x`.

### ECMA 367-3 (working version 3-42), 8.23.7 page 215

Same as above.

### Notes

* The *informative text* mentions:

  > The other cases where *Reattachment Semantics* applies is actual-formal association, per step `5` of the *General Call* rule.  
  On the other hand, the semantics of *Object_test*, a construct which also allows a *Read_only* entity to denote the same value as an expression, is simple enough that it does not need to refer to reattachment.

  This is not quite true. Even though there is no need for conversion in that case, there is still a need to create a clone of the value of the expression when the corresponding object has a copy semantics. Otherwise we may end up with two entities attached to the same object with copy semantics, which defeats one of the goals of copy semantics. See [`MVOL`](../mvol) for some examples.

  The part about conversion (`MBRE-1`) should be removed from [`MBRE`](../mbre/Readme.md) (*Reattachment Semantics*). It is common to assignment and argument passing, whereas the parts about attachment proper (in particular when copy semantics is involved) are applicable to more cases like *Object_test* (see [`MVOL`](../mvol/Readme.md)). Conversion is already explictly mentioned in [`MUGC`](../mugc/Readme.md) (*General Call Semantics*) for argument passing. It should be explicitly mentioned here in `MBAS` as well.

* See [`MBRE`](../mbre/Readme.md) (*Reattachment Semantics*) for more tests on assignment semantics.
