# Validity VHPR

These [tests](.) are exercising the validity rule below.  
Click on the `[tests]` label following the condition numbers below to see tests specific to these conditions.

## Validity: Parent rule

### ECMA 367-2, 8.6.13 page 47

The unfolded inheritance part of a class `D` is valid if and only if it satisfies the following conditions:

1. In every Parent part for a class `B`, `B` is not a descendant of `D`.
2. [\[tests\]](../vhpr2) No conforming parent is a frozen class.
3. If two or more *Parent* parts are for classes which have a common ancestor `A`,
   `D` meets the conditions of the Repeated Inheritance Consistency constraint for `A`.
4. At least one of the *Parent* parts is conforming.
5. No two ancestor types of `D` are different generic derivations of the same class.
6. Every *Parent* is generic-creation-ready.

### ECMA 367-3 (working version 115), 8.11.14 page 131

The unfolded inheritance part of a class `D` is valid if and only if it satisfies the following conditions:

1. In every Parent part for a class `B`, `B` is not a descendant of `D`.
2. [\[tests\]](../vhpr2) No conforming parent is a frozen class.
3. If two or more *Parent* parts are for classes which have a common ancestor `A`,
   `D` meets the conditions of the Repeated Inheritance Consistency constraint for `A`.
4. At least one of the *Parent* parts is conforming.
5. No two ancestor types of `D` are different generic derivations of the same class.
6. Every *Parent* is generic-creation-ready.
7. Any anchored type involved in any actual generic parameter of any *Parent*
   is of the form `like Current`.
