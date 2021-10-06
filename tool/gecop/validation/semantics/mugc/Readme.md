# Semantics MUGC

These [tests](.) are exercising the semantics rule below.  
Click on the `[tests]` label following the step numbers below to see tests specific to these steps.

## MUGC: General Call Semantics

### ECMA 367-2, 8.23.26 page 125

The effect of an *Object_call* of feature `sf` is, in the absence of any exception, the effect of the following sequence of steps:

1. Determine the target object `O` through the applicable definition.
2. [\[tests\]](../mugc2) Attach `Current` to `O`.
3. Determine the dynamic feature `df` of the call through the applicable definition.
4. For every actual argument `a`, if any, in the order listed: obtain the value `v` of `a`; then if the type of `a` converts to the type of the corresponding formal in `sf`, replace `v` by the result of the applicable conversion. Let `arg_values` be the resulting sequence of all such `v`.
5. Attach every formal argument of `df` to the corresponding element of `arg_values` by applying the *Reattachment Semantics* rule.
6. If the call is qualified and class invariant monitoring is on, evaluate the class invariant of `O`'s base type on `O`.
7. If precondition monitoring is on, evaluate the precondition of `df`.
8. If `df` is not an attribute, not a once routine and not external, apply *Non-Once Routine Execution Semantics* to `O` and `df`.
9. If `df` is a once routine, apply the *Once Routine Execution Semantics* to `O` and `df`.
10. If `df` is an external routine, execute that routine on the actual arguments given, if any, according to the rules of the language in which it is written.
11. If `df` is a self-initializing attribute and has not yet been initialized, initialize it through the *Default Initialization* rule.
12. If the call is qualified and class invariant monitoring is on, evaluate the class invariant of `O`'s base type on `O`.
13. If postcondition monitoring is on, evaluate the postcondition of `df`.

An exception occurring during any of these steps causes the execution to skip the remaining parts of this process and instead handle the exception according to the *Exception Semantics* rule.

### ECMA 367-3 (working version 3-42), 8.18.31 page 183

The effect of an *Object_call* of feature `sf` is, in the absence of any exception, the effect of the following sequence of steps:

1. Determine the target object `O` through the applicable definition.
2. [\[tests\]](../mugc2) Attach `Current` to `O`.
3. Determine the dynamic feature `df` of the call through the applicable definition.
4. Replace the *Actuals* part, if any, by its tuple-argument-unfolded form.
5. For every actual argument `a`, if any, in the order listed: obtain the value `v` of `a`; then if the type of `a` converts to the type of the corresponding formal in `sf`, replace `v` by the result of the applicable conversion. Let `arg_values` be the resulting sequence of all such `v`.
6. Attach every formal argument of `df` to the corresponding element of `arg_values` by applying the *Reattachment Semantics* rule.
7. If the call is targeted and class invariant monitoring is on, evaluate the class invariant of `O`'s base type on `O`.
8. If precondition monitoring is applicable per the Assertion monitoring rule, evaluate the precondition of `df`.
9. If `df` is not an attribute, not a once routine and not external, apply *Non-Once Routine Execution Semantics* to `O` and `df`.
10. If `df` is a once routine, apply the *Once Routine Execution Semantics* to `O` and `df`.
11. If `df` is an external routine, execute that routine on the actual arguments given, if any, according to the rules of the language in which it is written.
12. If `df` is a self-initializing attribute and has not yet been initialized, initialize it through the *Default Initialization* rule.
13. If invariant monitoring is applicable per the Assertion monitoring rule, evaluate the class invariant of `O`'s base type on `O`.
14. If postcondition monitoring is applicable per the Assertion monitoring rule, evaluate the postcondition of `df`.

An exception occurring during any of these steps causes the execution to skip the remaining parts of this process and instead handle the exception according to the *Exception Semantics* rule.

## Notes

* For each actual argument in the order listed, first it is evaluated, then converted if needed, and finally if the resulting object has copy semantics it is cloned. This is different from what is specified above where the actual arguments are first evaluated and converted (first traversal in step `4`) and then cloned (second traversal in step `5`). So the two traversals in steps `4` and `5` need to be merged into a single traversal. See this [test](../mugc5/test_expanded_convert_1) as an example.

* We should use the same wording in `7` and `13` (about class invariant).

* The part about conversion of actual arguments in `5` is redundant with `1` of the *Reattachment Semantics* rule ([`MBRE-1`](../mbre/Readme.md)). It should be removed from `MBRE`.
