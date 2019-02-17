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

## Notes

* The code of this validity rule was `VTMC` in ECMA 367-2 and before.
