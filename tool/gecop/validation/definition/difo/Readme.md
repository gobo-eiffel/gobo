# Definition DIFO

These [tests](.) are exercising the definition below.  
Click on the `[tests]` label following the property numbers below to see tests specific to these properties.

## DIFO: Free operator

### ECMA 367-3 (working version 3-36), 8.32.21 page 171

A **free operator** is sequence of one or more *characters* satisfying the following properties:

1. [\[tests\]](../difo1) It is not a *special symbol*, *standard operator* or *predefined operator*.
2. [\[tests\]](../difo2) Every character in the sequence is an *operator symbol*.
3. [\[tests\]](../difo3) Every subsequence that is not a standard operator or predefined operator is distinct
from all special symbols.

A *Free\_unary* is a free operator that is distinct from all *standard unary operators*.
A *Free\_binary* is a free operator that is distinct from all *standard binary operators*.

## Notes

* If we want to allow `∀∀` as free operator (but not `∀`), I think that we need add `∀`, `∃`, `⟳`, `⟲` and `¦` (symbols used in symbolic forms of *across loops*) to:
  * DISP: Special symbol
  * DIPO: Predefined operator
  * DIOS: Operator symbol, clause `3`
