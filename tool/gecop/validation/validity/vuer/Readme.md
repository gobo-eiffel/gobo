# Validity VUER

These [tests](.) are exercising the validity rule below.

## VUER: Expanded Result rule

This validity rule is part of SCOOP, the Eiffel concurrency mechanism. SCOOP is not described in the ECMA Eiffel standard, therefore this semantics is not part of the standard.

### ISE Eiffel (as of 23.09.10.7341 and after)

The result type of a separate call of target type `ST` and feature `sf` is valid if and only if it does not contain (directly or indirectly) attributes of reference types which are not separate.
  
This also applies when the separate call is of the form:
```
t.label
```
where the type of `t` is `separate TUPLE [...; label: X; ...]`. If the type `X` is expanded, it should not contain (directly or indirectly) attributes of reference type which is not separate.

##  Notes

* This validity rule still fails to catch cases where an object of expanded type with non-separate reference attributes is assigned to a `Result` of a reference type. This is resulting in a type issue where an object from another SCOOP region is not flagged as separate. ISE Eiffel (as of 23.09.10.7341 and after) fails to report this issue.

* Gobo Eiffel does not report this validity error, but relies on the validity rule `V1EA-1G` instead. This addresses the case mentioned above.
