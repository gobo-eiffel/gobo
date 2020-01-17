# Validity VFAV

These [tests](.) are exercising the validity rule below.</br>
Click on the `[tests]` label following the condition numbers to below to see tests specific to these conditions.

## VFAV: Alias Validity rule

### ECMA 367-2, 8.5.26 page 43

An *Alias* clause is **alias-valid** for a feature `f` of a class `C` if and only if it satisfies the following conditions:

1. [\[tests\]](../vfav1) If it lists an *Operator* `op`: `f` is a query; no other query of `C` has an *Operator* alias using the same operator and the same number of arguments; and either: `op` is a *Unary* and `f` has no argument, or `op` is a *Binary* and `f` has one argument.
2. [\[tests\]](../vfav2) If it lists a *Bracket* alias: `f` is a query with at least one argument, and no other feature of `C` has a *Bracket* alias.
3. [\[tests\]](../vfav5) If it includes a `convert` mark: it lists an *Operator* and `f` has one argument.

### ECMA 367-3 (working version 3-36), 8.5.27 page 25

An *Alias* clause is **alias-valid** for a feature `f` of a class `C` if and only if it satisfies the following
conditions:

1. [\[tests\]](../vfav1) If it lists an *Operator* `op`: `f` is a query; no other query of `C` has an *Operator* alias using the same operator and the same number of arguments; and either: `op` is a *Unary* and `f` has no argument, or `op` is a *Binary* and `f` has one argument.
2. [\[tests\]](../vfav2) If it lists a *Bracket* alias: `f` is a query with at least one argument, and no other feature of `C` has a *Bracket* alias.
3. [\[tests\]](../vfav3) If it lists a *Parenthesis* alias: `f` is a routine with at least one argument, and no other feature of `C` has a *Parenthesis* alias.
4. [\[tests\]](../vfav5) If it includes a `convert` mark: it lists an *Operator* and `f` has one argument.

### Modified version of ECMA 367-3 (working version 3-36), 8.5.27 page 25

An *Alias* clause is **alias-valid** for a feature `f` of a class `C` if and only if it satisfies the following
conditions:

1. [\[tests\]](../vfav1) If it lists an *Operator* `op`: `f` is a query; no other query of `C` has an *Operator* alias using the same operator and the same number of arguments; and either: `op` is a *Unary* and `f` has no argument, or `op` is a *Binary* and `f` has one argument.
2. [\[tests\]](../vfav2) If it lists a *Bracket* alias: `f` is a query with at least one argument, and no other feature of `C` has a *Bracket* alias.
3. [\[tests\]](../vfav3) If it lists a *Parenthesis* alias: `f` is a routine with at least one argument, and no other feature of `C` has a *Parenthesis* alias.
4. [\[tests\]](../vfav4) No other *Alias* of `f` has the same *Alias_name*.
5. [\[tests\]](../vfav5) If it includes a `convert` mark: it lists an *Operator* and `f` has one argument.

## Notes

* The `convert` mark is not part of the syntax in ECMA 367-3, so the last condition is useless. In ECMA 367-2, it was possible to write `f alias "+" convert (a: A): B`.
* Both ISE Eiffel (as of 18.11.10.2592 and after) and Gobo Eiffel support target conversion without the explicit `convert` mark.
