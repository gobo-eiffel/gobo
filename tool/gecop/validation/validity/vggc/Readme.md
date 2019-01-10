# Validity VGGC

These [tests](.) are exercising the validity rule below.</br>
Click on the `[tests]` label following the condition numbers below to see tests specific to these conditions.

### VGGC: Generic Constraint rule

#####ECMA 367-2, 8.12.9 page 80.

A *Constraint* part appearing in the *Formal\_generics* part of a class `C` is valid if and only if it satisfies the following conditions for every *Single\_constraint* listing a type `T` in its *Constraining\_types*:

1. [\[tests\]](../vggc1) `T` involves no anchored type.
2. \[tests\] If a *Renaming* clause `rename rename_list end` is present, a class definition of the form `class NEW inherit BT rename rename_list end` (preceded by `deferred` if the base class of `T` is deferred), where `BT` is the base class of `T`, would be valid.
3. \[tests\] Every name listed in the *Constraint\_creators* is the generically constrained name of a procedure `p` of one of the corresponding constraining types.

#####ECMA 367-3 (working version 3-36), 8.12.12 page 71.

A *Constraint* part appearing in the *Formal\_generics* part of a class `C` is valid if and only if it satisfies
the following conditions for every *Single\_constraint* listing a type `T` in its *Constraining\_types*:

1. [\[tests\]](../vggc1) `T` involves no anchored type.
2. \[tests\] If a *Renaming* clause `rename rename_list end` is present, a class definition of the form `class NEW inherit BT rename rename_list end` (preceded by `deferred` if the base class of `T` is deferred), where `BT` is the base class of `T`, would be valid.

### Notes

* The code of this validity rule was `VTGC` in ECMA 367-2 and before.
* There was a condition `VCFG-3` in ETR (between ETL2 and ECMA 367-1). It is now covered by `VGGC-1`.

* Note that condition 2 is not taking into account the case where the class `BT` is frozen.
