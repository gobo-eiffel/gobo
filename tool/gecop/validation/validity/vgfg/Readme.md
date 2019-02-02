# Validity VGFG

These [tests](.) are exercising the validity rule below.</br>
Click on the `[tests]` label following the condition numbers to below to see tests specific to these conditions.

### VGFG: Formal Generic rule

####ECMA 367-2, 8.12.3 page 78.

A *Formal\_generics* part of a *Class\_declaration* is valid if and only if every *Formal\_generic\_name* `G` in its *Formal\_generic\_list* satisfies the following conditions:

1. [\[tests\]](../vgfg1) `G` is different from the name of any class in the universe.
2. [\[tests\]](../vgfg2) `G` is different from any other *Formal\_generic\_name* appearing in the same *Formal\_generics* part.

####ECMA 367-3 (working version 3-36), 8.12.5 page 69.

A *Formal\_generics* part of a *Class\_declaration* is valid if and only if every formal generic parameter
`G` satisfies the following conditions:

1. [\[tests\]](../vgfg1) `G` is different from the name of any class in the universe.
2. [\[tests\]](../vgfg2) `G` is different from any other *Formal\_generic\_name* appearing in the same *Formal\_generics* part.

### Notes

* The code of this validity rule was `VCFG` in ECMA 367-2 and before.
* There was a third condition `VCFG-3` in ETR (between ETL2 and ECMA 367-1). It is now covered by [VGGC](../vggc\Readme.md)-1.
