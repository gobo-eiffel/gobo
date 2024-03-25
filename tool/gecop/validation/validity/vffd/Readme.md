# Validity VFFD

These [tests](.) are exercising the validity rule below.  
Click on the `[tests]` label following the condition numbers below to see tests specific to these conditions.

## VFFD: Feature Declaration rule

### ECMA 367-2, 8.5.25 page 43

A *Feature_declaration* appearing in a class `C` is valid if and only if it satisfies all of the following conditions for every declaration of a feature `f` in its unfolded form:

1. The *Declaration_body* describes a feature which, according to the rules given earlier, is one of: variable attribute, constant attribute, procedure, function.
2. `f` does not have the same feature name as any other feature introduced in `C` (in particular, any other feature of the unfolded form).
3. If `f` has the same feature name as the final name of any inherited feature, the *Declaration_body* satisfies the Redeclaration rule.
4. If the *Declaration_body* describes a deferred feature, then the *Extended_feature_name* of `f` is not preceded by `frozen`.
5. If the *Declaration_body* describes a once function, the result type is stand-alone.
6. Any anchored type for an argument is detachable.
7. The *Alias* clause, if present, is alias-valid for `f`.

### ECMA 367-3 (working version 3-42), 8.6.35 page 91

A *Feature_declaration* appearing in a class `C` is valid if and only if it satisfies all of the following
conditions for every declaration of a feature `f` in its unfolded form:

1. The *Declaration_body* describes a feature which, according to the respective definitions, is one of: attribute, procedure, function.
2. `f` does not have the same feature name as any other feature introduced in `C` (in particular, any other feature of the unfolded form).
3. If `f` has the same feature name as the final name of any inherited feature, the *Declaration_body* satisfies the Redeclaration rule.
4. If the *Declaration_body* describes a deferred feature, the *Extended_feature_name* of `f` is not preceded by `invariant`.
5. If the *Declaration_body* describes a constant attribute, it is constant-valid.
6. If the *Declaration_body* describes a once function other than once per object, the result type is stand-alone.
7. Any anchored type for an argument is detachable.
8. The *Alias* clause, if present, is alias-valid for `f`.
9. If a *Variance_mark* is present, the *Declaration_body* describes a variable attribute whose type is a *Class_type*.
10. If an *Emergence_mark* is present, the *Declaration_body* describes a variable attribute.

##  Notes

* Another condition is needed in the context of SCOOP, the Eiffel concurrency mechanism:

  11. `G` [\[tests\]](../vffd11g) In SCOOP mode, if the *Declaration_body* describes a once per process function, the resut type is either separate, or expanded and does not contain (directly or indirectly) attributes of reference types which are not separate.
  
  ISE Eiffel (as of 23.09.10.7341 and after) reports this validity rule violation using the code `VFFD-8`, but does not check the case of expanded types which contain (directly or indirectly) attributes of reference types which are not separate.

  This validity rule still fails to catch cases where an object of expanded type with non-separate reference attributes is assigned to a `Result` of a reference type. Gobo Eiffel and ISE Eiffel (as of 23.09.10.7341 and after) both fail to report this issue.

  SCOOP is not described in the ECMA Eiffel standard, therefore this condition is not part of the standard.
