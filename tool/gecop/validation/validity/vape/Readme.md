# Validity VAPE

These [tests](.) are exercising the validity rule below.</br>
Click on the `[tests]` label following the condition numbers to below to see tests specific to these conditions.

### VAPE: Precondition Export rule

#####ECMA 367-2, 8.9.5 page 58.

A *Precondition* of a feature `r` of a class `S` is valid if and only if every feature `f` appearing in every *Assertion_clause* of its unfolded form `u` satisfies the following two conditions for every class `C` to which `r` is available:

1. [\[tests\]](../vape1) If `f` appears as feature of a call in `u` or any of its subexpressions, `f` is available to `C`.
2. [\[tests\]](../vape2) If `u` or any of its subexpressions uses `f` as creation procedure of a *Creation_expression*, `f` is available for creation to `C`.

#####ECMA 367-3 (working version 3-36), 8.9.7 page 45.

A *Precondition* of a feature `r` of a class `S` is valid if and only if every feature `f` appearing in its
unfolded form `u` satisfies the following two conditions for every class `C` to which `r` is available:

1. [\[tests\]](../vape1) If `f` appears as the static feature of a call in `u` or any of its subexpressions, `f` is available
to `C`.
2. [\[tests\]](../vape2) If `u` or any of its subexpressions uses `f` as creation procedure of a *Creation_expression*,
`f` is available for creation to `C`.

### Notes

* We should also take into account the instructions in inline agents, not just the subexpressions.
* We should also take into account creation instructions appearing in inline agents, not just creation expressions.
* We should also take into account the case where `f` is the feature of a call agent (e.g. `agent f`).
* We should also take into account the case where `f` appears in an *Address* expression  (e.g. `$f`).
* We should also take into account the case where `f` is the feature of a Non-object call (e.g. `{A}.f`).
* We should also take into account the case where `f` is one of the features `new_cursor`, `after` or `forth` called behind the scene by an `across` expression or instruction.
* We should also take into account the case where `f` is one of the features `is_equal`, `copy` or `twin` called behind the scene by equality tests (`=` or `~`) and attachments (assignments or argument passings).
* We should also take into account the case where `f` is the convert feature of an implicit conversion appearing in the precondition.
