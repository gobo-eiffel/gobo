# Validity VUAR

These [tests](.) are exercising the validity rule below.  
Click on the `[tests]` label following the condition numbers below to see tests specific to these conditions.

## VUAR: Argument rule

### ECMA 367-2, 8.23.13 page 121

An export-valid call of target type `ST` and feature `fname` appearing in a class `C` where it denotes a feature `sf` is argument-valid if and only if it satisfies the following conditions:

1. The number of actual arguments is the same as the number of formal arguments declared for `sf`.
2. Every actual argument of the call is compatible with the corresponding formal argument of `sf`.

### ECMA 367-3 (working version 3-42), 8.18.13 page 178

An export-valid *Call* of target type `ST` and feature `sf` is argument-valid if and only if its tuple-argument-unfolded form satisfies the following conditions:

1. The number of actual arguments is the same as the number of formal arguments declared for `sf`.
2. Every actual argument of the call is compatible with the corresponding formal argument of `sf`.
3. If compatibility in clause `2` does not involve conversion, the call is conforming-argument-valid.

##  Notes

* Another condition is needed in the context of SCOOP, the Eiffel concurrency mechanism:

  4. `G` [\[tests\]](../vuar4g) In case of a separate call, when the target type `ST` is separate, the type of every formal argument of `sf` which is reference is also separate.

  This also applies to the unfolded form of this *Assigner\_call*:
  ```
    t.label := value
  ```
  where the type of `t` is `separate TUPLE [...; label: X; ...]`. If `X` is a reference type it should also be separate.

  This condition is reported as `VUAR-3` in ISE Eiffel 23.09.10.7341 and after:

  * Error code: VUTA(3)
  * Type error: formal argument or tuple field of a separate call should be of a separate type if the actual argument or the source expression is of a reference type.
  * What to do: make sure that type of the formal argument or of the tuple field is separate.
   
  SCOOP is not described in the ECMA Eiffel standard, therefore this condition is not part of the standard.
