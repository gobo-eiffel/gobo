# Validity VUER

These [tests](.) are exercising the validity rule below.

## VUER: Expanded Result rule

This validity rule is part of SCOOP, the Eiffel concurrency mechanism. SCOOP is not described in the ECMA Eiffel standard, therefore this semantics is not part of the standard.

The result type of a separate call of target type `ST` and feature `sf`  is valid if and only if it does not contain (directly or indirectly) attributes of reference types which are not separate.
  
This also applies when the separate call is of the form:
```
t.label
```
where the type of `t` is `separate TUPLE [...; label: X; ...]`. If the type `X` is expanded, it should not contain (directly or indirectly) attributes of reference type which is not separate.

##  Notes

This validity rule still fails to catch cases where an object of expanded type with non-separate reference attributes is assigned to a `Result` of a reference type. Gobo Eiffel and ISE Eiffel (as of 23.09.10.7341 and after) both fail to report this issue.