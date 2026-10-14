# Validity VOMB

These [tests](.) are exercising the validity rule below.  
Click on the `[tests]` label following the condition numbers below to see tests specific to these conditions.

## VOMB: Multi-branch rule

### ECMA 367-2, 8.17.13 page 98

A *Multi_branch* instruction is valid if and only if its unfolded form satisfies the following conditions.

1. [\[tests\]](../vomb1) Inspect values are all valid.
2. [\[tests\]](../vomb2) Inspect values are all constants.
3. [\[tests\]](../vomb3) The manifest values of any two inspect values are different.
4. [\[tests\]](../vomb4) If the inspect expression is of type `TYPE [T]` for some type `T`,
   all inspect values are types.
5. [\[tests\]](../vomb5) If case `4` does not apply, the inspect expression is one of the sized
   variants of `INTEGER`, `CHARACTER` or `STRING`.

### ECMA 367-3 (working version 115), 8.22.13 page 214

Same as above.

### Notes

* ISE Eiffel (as of 25.12.9.8922 and after) does not support inspect expressions
  whose type if a sized variant of `STRING`.

* ISE Eiffel (as of 25.12.9.8922 and after) does not support inspect expressions
  of type `TYPE [T]` for some type `T`.

* When the inspect expression is of type `TYPE [T]` for some type `T`,
  the types of inspect values should be standalone types. This is
  probably implied from condition `2`, but this is not clear.

* There is a missing condition:

  6. G. [\[tests\]](../vomb6g) The type of the inspect expression is attached.

  This condition is implemented both in ISE Eiffel (as of 25.12.9.8922 and after)
  and Gobo Eiffel (as of 26.06 and after).

* In the context of once classes, the condition `2` should be adapted to also
  accept values of the form `{C}.f` where `C` is a once class and `f` is one
  of its creation procedures (possibly with actual arguments).

  Once classes are not described in the ECMA Eiffel standard, therefore
  this condition extension is not part of the standard.

* In the context of once classes, another condition is needed (between `4` and `5`):

  7. G. [\[tests\]](../vomb7g) If the base class of the inspect expression is a once class,
     all inspect values are instances of a type with the same base class.

  Once classes are not described in the ECMA Eiffel standard, therefore
  this condition extension is not part of the standard.

* Another condition is needed in the context of SCOOP, the Eiffel concurrency mechanism:

  8. `G.` [\[tests\]](../vomb8g) If the inspect expression is a separate expression, it is controlled.
  
  ISE Eiffel (as of 25.12.9.8922 and after) fails to report this validity condition
  and the execution hangs forever.

  SCOOP is not described in the ECMA Eiffel standard, therefore this condition is not part of the standard.

* Another condition is needed when using Unique attributes:

  9. `G.` [\[tests\]](../vomb9g) If some of the inspect values are Unique attributes
     then all inspect values are either Unique attributes are declared (or redeclared)
     in the same class, or non-positive integer constants.
  
  Unique attributes were described in ETL2, but have not been kept
  in the ECMA Eiffel standard.
