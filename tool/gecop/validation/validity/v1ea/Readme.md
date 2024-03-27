# Validity V1EA

These [tests](.) are exercising the validity rule below.  
Click on the `[tests]` label following the condition numbers below to see tests specific to these conditions.

## V1EA: Expanded Class Attribute rule

### Gobo Eiffel

An attribute of type `T` in an expanded class `C` is valid if and only if:

1. `G` [\[tests\]](../v1ea1g) if `T` is either separate or expanded.
2. `G` if `T` is an expanded type, its base class is not a direct or indirect expanded client of `C`.

### Notes

* Condition `1G` is useful in SCOOP when the type of an actual argument of a separate call, of the result of a separate call, or of the result of a once-per-process function is expanded. This is to avoid having non-separate objects crossing SCOOP region boundaries.

  This condition is part of SCOOP, the Eiffel concurrency mechanism.
  SCOOP is not described in the ECMA Eiffel standard, therefore this condition is not part of the standard.

  ISE Eiffel (as of 23.09.10.7341 and after) has the following rule for the type of an actual argument of a separate call:

  * Error code: VUAR(4)
  * Type error: base type of an actual argument of a separate call or of a source expression of a tuple field assignment is expanded and includes directly or indirectly, a non-separate reference attribute.
  * What to do: make sure the type of the actual argument or the source expression is reference or does not include, directly or indirectly, any non-separate reference attribute.

  But it does not catch cases where an object of expanded type with non-separate reference attributes is first assigned to an entity of a reference type and then this entity is used as actual argument of the separate call. This is resulting in a type issue where an object from another SCOOP region is not flagged as separate. ISE Eiffel (as of 23.09.10.7341 and after) fails to report this issue.

  ISE Eiffel (as of 23.09.10.7341 and after) has the following rule for the type of the result of a separate call:

  * Error code: VUER
  * Error: expanded result type of a separate call includes non-separate reference attributes.
  * What to do: Ensure that expanded result type has no non-separate reference attributes.

  But it does not catch cases where an object of expanded type with non-separate reference attributes is assigned to a `Result` entity of a reference type. This is resulting in a type issue where an object from another SCOOP region is not flagged as separate. ISE Eiffel (as of 23.09.10.7341 and after) fails to report this issue.

  ISE Eiffel (as of 23.09.10.7341 and after) has no validity rule for the case of once-per-process function with an expanded result type.

* Condition `2G` comes from the validy rule `VLEC` in ETL2 page 94. It has no equivalent in ECMA Eiffel standard.

  Gobo Eiffel and ISE Eiffel (as of 23.09.10.7341 and after) both reports this validity rule violation using the code `VLEC`.
