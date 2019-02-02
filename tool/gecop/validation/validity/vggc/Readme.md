# Validity VGGC

These [tests](.) are exercising the validity rule below.</br>
Click on the `[tests]` label following the condition numbers below to see tests specific to these conditions.

## VGGC: Generic Constraint rule

### ECMA 367-2, 8.12.9 page 80

A *Constraint* part appearing in the *Formal\_generics* part of a class `C` is valid if and only if it satisfies the following conditions for every *Single\_constraint* listing a type `T` in its *Constraining\_types*:

1. [\[tests\]](../vggc1) `T` involves no anchored type.
2. [\[tests\]](../vggc2) If a *Renaming* clause `rename rename_list end` is present, a class definition of the form `class NEW inherit BT rename rename_list end` (preceded by `deferred` if the base class of `T` is deferred), where `BT` is the base class of `T`, would be valid.
3. \[tests\] Every name listed in the *Constraint\_creators* is the generically constrained name of a procedure `p` of one of the corresponding constraining types.

### ECMA 367-3 (working version 3-36), 8.12.12 page 71

A *Constraint* part appearing in the *Formal\_generics* part of a class `C` is valid if and only if it satisfies
the following conditions for every *Single\_constraint* listing a type `T` in its *Constraining\_types*:

1. [\[tests\]](../vggc1) `T` involves no anchored type.
2. [\[tests\]](../vggc2) If a *Renaming* clause `rename rename_list end` is present, a class definition of the form `class NEW inherit BT rename rename_list end` (preceded by `deferred` if the base class of `T` is deferred), where `BT` is the base class of `T`, would be valid.

## Notes

* The code of this validity rule was `VTGC` in ECMA 367-2 and before.
* There was a condition `VCFG-3` in ETR (between ETL2 and ECMA 367-1). It is now covered by `VGGC-1`.
* Note that in condition 2, `BT` has to be the base type of `T`, not its base class.
* Note that in an `inherit` clause it is valid to have `rename f as g` where `f` is deferred and `g` is effective, as a way to merge these two features. It is not valid here in the `rename` clause of a generic constraint (even if not explicitly rejected by the condition 2) because in the actual generic parameters these two features are not necessarily merged.
* Note that even if not explicitly rejected by the condition 2, ISE Eiffel (as of 18.11.10.2592 and after) and Gobo Eiffel do not accept a `rename` clause if the type `T` of the *Single\_constraint* is a formal generic parameter. ISE Eiffel (as of 18.11.10.2592 and after) reports it using the code `VTMC-3`, whereas it would have been more logic to have it as a condition of the current validity rule.
* Note that condition 2 seems to reject the case where `BT` is frozen (we cannot inherit from frozen class), but it is accepted by ISE Eiffel (as of 18.11.10.2592 and after) and Gobo Eiffel.
* Note that condition 2 seems to reject the case where `BT` is a *Tuple\_type* (we can only inherit from *Class\_type*s, not from *Tuple\_type*s), but it is accepted by ISE Eiffel (as of 18.11.10.2592 and after) and Gobo Eiffel.
* Note that we cannot have a `rename` clause if the base type of `BT` is `NONE`. This is a consequence of condition 2 because inheriting from `NONE` would introduce an inheritance graph cycle, which is not valid.
