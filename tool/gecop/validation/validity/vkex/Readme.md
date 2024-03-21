# Validity VKEX

These [tests](.) are exercising the validity rule below.  
Click on the `[tests]` label following the condition numbers below to see tests specific to these conditions.

## VKEX: Creation Expression rule

### ECMA 367-2, 8.20.20 page 113

A *Creation_expression* of creation type `CT`, appearing in a class `C`, is valid if and only if it satisfies the following conditions:

1. The feature of the *Creation_call* of the expression’s unfolded form is available for creation to `C`.
2. That *Creation_call* is argument-valid.
3. `CT` is generic-creation-ready.

### ECMA 367-3 (working version 3-42), 8.22.20 page 210

Same as above.

##  Notes

* The code of this validity rule was `VGCE` in ECMA 367-2.

* Another condition is needed in the context of SCOOP, the Eiffel concurrency mechanism:

  4. `G` [\[tests\]](../vkex4g) The *Region* part, when provided, should use the type specifier `NONE`.
  
  This is used to indicate that the SCOOP region created will be a passive region. Here is an example:

      create <NONE> {FOO}.make
  
  This condition is reported as a syntax error in ISE Eiffel 23.09.10.7341 and after:

  * Syntax error at line 19 in class AA
  * Passive regions should use type specifier "NONE".

  Note that the *Region* part is silently ignored when the creation type is not separate, which makes it easier to compile the same Eiffel code in SCOOP and non-SCOOP modes.

  SCOOP is not described in the ECMA Eiffel standard, therefore this condition is not part of the standard.
