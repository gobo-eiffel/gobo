# Semantics MAOE

These [tests](.) are exercising the semantics rule below.  
Click on the `[tests]` label following the condition numbers below to see tests specific to these conditions.

## MAOE: Old Expression Semantics, associated variable, associated exception marker

### ECMA 367-2, 8.9.9 page 59

The effect of including an *Old* expression `oe` in a *Postcondition* of an effective feature `f` is equivalent to replacing the semantics of its *Feature_body* by the effect of a call to a fictitious routine possessing a local variable `av`, called the associated variable of `oe`, and semantics defined by the following succession of steps:

1. Evaluate `oe`.
2. [\[tests\]](../maoe2) If this evaluation triggers an exception, record this event in an associated exception marker for `oe`.
3. Otherwise, assign the value of `oe` to `av`.
4. Proceed with the original semantics.

### ECMA 367-3 (working version 3-107), 8.10.12 page 113

Same as above.
