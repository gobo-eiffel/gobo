# Semantics MKIN

These [tests](.) are exercising the semantics rule below.  

## MKIN: Creation Instruction semantics

### ECMA 367-2, 8.20.17 page 112

The effect of a creation instruction of target `x` and creation type `TC` is the effect
of the following sequence of steps, in order:

1. If there is not enough memory available for a new direct instance of `TC`, trigger
   an exception of type `NO_MORE_MEMORY` in the routine that attempted to execute the
   instruction. The remaining steps do not apply in this case.
2. Create a new direct instance of `TC`, with reference semantics if `CT` is a reference
   type and copy semantics if `CT` is an expanded type.
3. Call, on the resulting object, the feature of the *Unqualified_call* of the
   instruction's unfolded form.
4. Attach `x` to the object.

### ECMA 367-3 (working version 115), 8.23.18 page 223

The effect of a creation instruction of creation target `x` and creation type `TC` is
the effect of the following sequence of steps, in order:

1. If there is not enough memory available for a new direct instance of `TC`, trigger
   an exception of type `NO_MORE_MEMORY` in the routine that attempted to execute the
   instruction. The remaining steps do not apply in this case.
2. Create a new direct instance of `TC`, with reference semantics if `CT` is a reference
   type and copy semantics if `CT` is an expanded type.
3. Call, on the resulting object, the dynamic feature of the *Unqualified_call* of the
   instruction's unfolded form.
4. Attach `x` to the object.

### Notes

* The case where the base class of `TC` is a once class should be taken into account.

  Once classes are not described in the ECMA Eiffel standard, therefore
  this condition extension is not part of the standard.
