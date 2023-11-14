# Validity VUTA

These [tests](.) are exercising the validity rule below.  
Click on the `[tests]` label following the condition numbers below to see tests specific to these conditions.

## VUTA: Target rule

### ECMA 367-2, 8.23.14 page 123

An *Object\_call* is target-valid if and only if either:

1. It is unqualified.
2. Its target is an attached expression.

### ECMA 367-3 (working version 3-42), 8.18.14 page 179

An *Object\_call* is target-valid if and only if it satisfies one of the following conditions:

1. It is an *Non\_object\_call*.
2. It is an *Object\_call* without a *Target*.
3. It is an *Object\_call* with a *Target* which is an attached expression.

###  Notes

* Another condition is needed in the context of SCOOP, the Eiffel concurrency mechanism:

  4. `G` [\[tests\]](../vuta4g) It is an *Object\_call* with a *Target* which is a separate attached expression and it is controlled.

  This assumes that in condition `3` the target is not separate.

  This condition is just an extension of `3` in ISE Eiffel 23.09.10.7341 and after:

  * Error code: VUTA(3)
  * Error: separate target of the Object_call is not controlled.
  * What to do: ensure the target of the call is controlled or is not separate.


  A expression of separate type is controlled if:
  * It is a formal argument of the enclosing feature.
  * It is a separate argument of a separate instruction.
  * It is a query whose result type is not separate and whose target is (recursively) controlled.

  See [Exclusive Access](https://www.eiffel.org/doc/solutions/Exclusive_Access) in [eiffel.org](https://www.eiffel.org) for more details.

  Note that some compilers may be smart and consider that a local variable is controlled if the source of its last assignment, before being used as target of the call, is controlled. This would be similar to what a compiler might do to infer that a local variable is attached when used as target of the call. The Gobo Eiffel compiler and ISE Eiffel compiler (as of 23.09.10.7341 and after) do not support this smart behavior to infer whether such local variable is controlled.
   
  SCOOP is not described in the ECMA Eiffel standard, therefore this condition is not part of the standard.
