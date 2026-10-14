# Validity VKCC

These [tests](.) are exercising the validity rule below.  
Click on the `[tests]` label following the condition numbers below to see tests specific to these conditions.

## VKCC: Creation Clause rule

### ECMA 367-2, 8.20.6 page 109

A *Creation_clause* in the unfolded creators part of a class `C` is valid if and only if it
satisfies the following conditions, the last four for every *Feature_name* `cp_name` in the
clause's *Feature_list*:

1. `C` is effective.
2. `cp_name` appears only once in the *Feature_list*.
3. `cp_name` is the final name of some procedure `cp` of `C`.
4. [\[tests\]](../vkcc4) `cp` is not a once routine.
5. The precondition of `cp`, if any, is creation-valid.

### ECMA 367-3 (working version 115), 8.23.6 page 219

Same as above.

### Notes

* The code of this validity rule was [`VGCC`](../vgcc/Readme.md) in ECMA 367-2.

* The condition `4` should be extended in the context of once classes. When `C`
  if a once class, `cp` should be a once routine other than a once-per-object
  routine.

  Once classes are not described in the ECMA Eiffel standard, therefore
  this condition extension is not part of the standard.

* In the context of once classes, another condition is needed:

  6. G. [\[tests\]](../vkcc6g) If `C` is a once class, `cp` is not a class routine.
  
  A class routine is a routine with a postcondition of the form `class`.
  Without this condition, there is an ambiguity when calling `{C}.cp`.
  It can either we a non-object call to `cp`, or a creation expression
  with the unfolded form `create {C}.cp`.

  ISE Eiffel (as of 25.12.9.8922 and after) reports this validity rule violation using the code `VKCN-1`.

  Once classes are not described in the ECMA Eiffel standard, therefore
  this condition extension is not part of the standard.

* In the context of once classes, another condition is needed:

  7. G. [\[tests\]](../vkcc7g) If `C` is a once class, `cp` is declared or redeclared in `C`.
  
  The purpose of this condition is to avoid having the once procedure,
  declared as creation procedure in `C`, called from an instance of an
  ancestor of `C` before using it as creation procedure in `C`.

  But this condition is not enough by itself: it is still possible to
  call the once procedure from an instance of `C` before using it
  to create another instance of `C`.

  Once classes are not described in the ECMA Eiffel standard, therefore
  this condition extension is not part of the standard.
