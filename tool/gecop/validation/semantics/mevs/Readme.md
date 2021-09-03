# Semantics MEVS

These [tests](.) are exercising the semantics rule below.  
Click on the `[tests]` label following the case numbers below to see tests specific to these cases.

## MEVS: Variable Semantics

### ECMA 367-2, 8.19.20 page 106

The value produced by the run-time evaluation of a variable `x` is:

1. [\[tests\]](../mevs1) If the execution context has previously executed at least one setting for `x`: the value of the latest such setting.
2. [\[tests\]](../mevs2) Otherwise, if the type `T` of `x` is self-initializing: assignment to `x` of `T`'s default initialization value, causing a setting of `x`.
3. [\[tests\]](../mevs3) Otherwise, if `x` is a variable attribute with an *Attribute* part: evaluation of that part, implying execution of its *Compound* and hence a setting for `x`.
4. Otherwise, if `x` is `Result` in the *Postcondition* of a constant attribute: the value of the attribute.

### ECMA 367-3 (working version 3-36), 8.19.20 page 109

Same as above.

## Notes

* It would be less confusing to have case 3 before case 2. If the user provides self-initializing code for an attribute, it's because he expects it to be executed if case 1 does not hold. Furthermore, it would allow to have the same behavior if the code is compiled in void-safe mode or not.
