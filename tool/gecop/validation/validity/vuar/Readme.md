# Validity VUAR

These [tests](.) are exercising the validity rule below.  
Click on the `[tests]` label following the condition numbers below to see tests specific to these conditions.

## VUAR: Argument rule

### ECMA 367-2, 8.23.13 page 121

An export-valid call of target type `ST` and feature `fname` appearing in a class `C` where it denotes a feature `sf` is argument-valid if and only if it satisfies the following conditions:

1. The number of actual arguments is the same as the number of formal arguments declared for `sf`.
2. Every actual argument of the call is compatible with the corresponding formal argument of `sf`.

### ECMA 367-3 (working version 3-42), 8.18.13 page 178

An export-valid *Call* of target type `ST` and feature `sf` is argument-valid if and only if its tuple-argument-unfolded form satisfies the following conditions:

1. The number of actual arguments is the same as the number of formal arguments declared for `sf`.
2. Every actual argument of the call is compatible with the corresponding formal argument of `sf`.
3. If compatibility in clause `2` does not involve conversion, the call is conforming-argument-valid.

##  Notes

* Gobo Eiffel checks validity rules on the flat version of each class by default. Therefore the condition `3` above is redundant with the condition `2` checked on the flat version of the class.

* Two other conditions are needed in the context of SCOOP, the Eiffel concurrency mechanism:

  3. `G` [\[tests\]](../vuar3g) In case of a separate call (when the target type `ST` is separate) the type of a formal argument of `sf` is separate when the type of associated actual argument is reference.
  
      This also applies when `sf` is the assign procedure of an *Assigner\_call*, as well as when the *Assigner\_call* is of the form:
      ```
      t.label := value
      ```
      where the type of `t` is `separate TUPLE [...; label: X; ...]`. If the type of `value` is reference, the type `X` should be separate.

  4. `G` [\[tests\]](../vuar4g) In case of a separate call (when the target type `ST` is separate) every actual argument of expanded type does not contain (directly or indirectly) attributes of reference types which are not separate.
  
      This also applies when `sf` is the assign procedure of an *Assigner\_call*, as well as when the *Assigner\_call* is of the form:
      ```
      t.label := value
      ```
      where the type of `t` is `separate TUPLE [...; label: X; ...]`. If the type of `value` is expanded, it should not contain (directly or indirectly) attributes of reference type which is not separate.

  These conditions are reported by ISE Eiffel 23.09.10.7341 and after as follows:

  * Error code: VUAR(3)
  * Type error: formal argument or tuple field of a separate call should be of a separate type if the actual argument or the source expression is of a reference type.
  * What to do: make sure that type of the formal argument or of the tuple field is separate.

  and:

  * Error code: VUAR(4)
  * Type error: base type of an actual argument of a separate call or of a source expression of a tuple field assignment is expanded and includes, directly or indirectly, a non-separate reference attribute.
  * What to do: make sure the type of the actual argument or the source expression is reference or does not include, directly or indirectly, any non-separate reference attribute.

  Note that the condition `4` still fails to catch cases where an object of expanded type with non-separate reference attributes is first assigned to an entity of a reference type and then this entity is used as actual argument of the separate call. This is resulting in a type issue where an object from another SCOOP region is not flagged as separate. ISE Eiffel (as of 23.09.10.7341 and after) fails to report this issue. To address this issue, Gobo Eiffel does not report this validity error, but relies on the validity rule `V1EA-1G` instead.

  SCOOP is not described in the ECMA Eiffel standard, therefore these conditions are not part of the standard.
