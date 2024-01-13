# Definition DLCF

These [tests](.) are exercising the definition below.</br>
Click on the `[tests]` label following the case numbers to below to see tests specific to these cases.

## DLCF: Client set of a feature

### ECMA 367-3 (working version 3-36), 8.7.12 page 34

The **client set** of a feature *f* of a class *C*, of final name *fname*, includes the following classes (for all cases that match):

1. [\[tests\]](../dlcf1) If *f* is introduced or redeclared in *C*: the client set of the *Feature\_clause* of the declaration for *f* in *C*.
2. [\[tests\]](../dlcf2) If *f*  is inherited: the union of the client sets (recursively) of all its precursors from conforming parents.
3. [\[tests\]](../dlcf3) If the *Feature\_set* of one or more *New\_exports* clauses of *C* includes *fname* or *all*, the union of the client sets of their *Clients* parts.

### Notes

* What is the client set of a feature which is inherited (and not redeclared nor listed in a *New\_exports* clause) from a non-conforming parent?
* For the case of *all*, we should only consider the *New\_exports* associated with the parents from which *f* is inherited.
