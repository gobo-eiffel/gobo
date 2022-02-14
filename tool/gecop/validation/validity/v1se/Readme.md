# Validity V1SE

These [tests](.) are exercising the validity rule below.  
Click on the `[tests]` label following the condition numbers below to see tests specific to these conditions.

## V1SE: Separate Instruction rule

This rule is part of SCOOP, the Eiffel concurrency mechanism. SCOOP is not described in the ECMA Eiffel standard, therefore this rule is not part of the standard.

### ISE Eiffel (as of 21.11.10.6046 and after)

* Error: An expression used in a separate instruction should be of a separate type.
* What to do: do not pass this expression as an argument to the separate instruction, use it directly or assign its value to a local variable and use this variable instead.

### Gobo Eiffel

The argument `expression as a` appearing in a *Separate\_instruction* is valid if and only if it satisfies the following conditions:

* `G1` [\[tests\]](../v1seg1) There is no other argument in the same *Separate\_instruction* with the same name `a`.
* `G2` [\[tests\]](../v1seg2) The name `a` is a fresh identifier.
* `G3` [\[tests\]](../v1seg3) The type of `expression` is separate.

## Notes

* In condition `G2`, a fresh identifier means that `a` does not have the same lower name as any feature of the enclosing class, or any formal argument or local variable of any enclosing feature or *Inline\_agent*, or, if the separate instruction appears in the scope of an *Object\_test*, its Object-Test Local, or, if the separate instruction appears in the scope of an *Iteration*, its item identifier, or, if the separate instruction appears in the compound of another separate instruction, the name of any of its arguments.
