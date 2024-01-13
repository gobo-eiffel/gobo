# Validity VGMC

These [tests](.) are exercising the validity rule below.</br>
Click on the `[tests]` label following the condition numbers below to see tests specific to these conditions.

## VGMC: Multiple Constraints rule

### ECMA 367-2, 8.12.22 page 83

A feature of name `fname` is applicable in a class `C` to a target `x` whose type is a *Formal\_generic\_name* `G` constrained by two or more types `CONST1`, `CONST2`, ..., if and only if it satisfies the following conditions:

1. [\[tests\]](.) At least one of the `CONSTi` has a feature available to `C` whose generically constrained name for `G` in `C` is `fname`.
2. [\[tests\]](.) If this is the case for two or more of the `CONSTi`, all the corresponding features are the same.

### ECMA 367-3 (working version 3-36), 8.12.25 page 74

A feature of name `fname` is applicable in a class `C` to a target `x` whose type is a *Formal\_generic\_name* `G` constrained by two or more types `CONST1`, `CONST2`, ..., if and only if exactly one of the `CONSTi` has a feature available to `C` whose generically constrained name for `G` in `C` is `fname`.

### Notes

* The code of this validity rule was `VTMC` in ECMA 367-2 and before.
* The wording is misleading: it makes us think that it's possible to have several `CONSTi` with this feature, but only one is available to `C`. But in fact, the availability status comes after we guaranteed that there was exactly one feature with this name.
* It's possible to have errors in full-class-checking mode which are not addressed by this validity rule. For example if we have the expression `a.f` in a non-generic class `B`, with a generic descendant `C` in which `a` is redefined to be of type `G`, one of the generic parameters of `C` with multiple constraints having each a different version of feature `f` with different types. When calling `a.f` in `C` we don't know which version of `f` to call. In the inheritance validity rules, we should use a `select` clause in that case, but we don't have that in the syntax of multiple generic constraints. Both ISE Eiffel (as of 18.11.10.2592 and after) and Gobo Eiffel will check the validity of using all versions of `f`, even if `B` was also a generic class with the same multiple constraints and one version of `f` was explicitly called (thanks to the constraint renaming clause) and not the others (see [this example](./test_flat_procedure_call_4)). But in case of a query where the versions `f` have different types, then an error (using the current validity code) will be reported in full-class-checking mode. Indeed, we don't know which type the expression `a.f` will have among the various possibilities, and as a consequence when we have `a.f.g` for example, we don't know in which type to look for `g`.
