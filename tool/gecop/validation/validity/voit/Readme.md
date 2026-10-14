# Validity VOIT

These [tests](.) are exercising the validity rule below.  
Click on the `[tests]` label following the condition numbers below to see tests specific to these conditions.

## VOIT: Iteration rule

### ECMA 367-3 (working version 115), 8.22.18 page 216

An *Iteration* instruction is valid if and only if it satisfies the following conditions.

1. [\[tests\]](../voit1) The type of the *Expression* conforms to `ITERABLE [T]`, based on
   the Kernel Library class `ITERABLE`, for some type `T`. (By VHPR (5), this `T` is unique.)
2. The *Identifier* is a fresh identifier.

### Notes

* Another condition is needed in the context of SCOOP, the Eiffel concurrency mechanism:

  3. `G.` [\[tests\]](../voit3g) If the *Expression* is a separate expression, it is controlled.

  SCOOP is not described in the ECMA Eiffel standard, therefore this condition is not part of the standard.
