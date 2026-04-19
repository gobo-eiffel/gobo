# Validity VEVI

These [tests](.) are exercising the validity rule below.

## VEVI: Variable Initialization rule

### ECMA 367-2, 8.19.17 page 105

It is valid for an *Expression*, other than the target of an *Assigner_call*,
to be also a *Variable* if it is properly set at the evaluation position
defined by the closest enclosing *Instruction* or *Assertion_clause*.

#### Definition: Properly set variable

At an evaluation position `ep` in a class `C`, a variable `x` is properly set
if one of the following conditions holds:

1. `x` is self-initializing.
2. `ep` is an evaluation position of the *Compound* of a feature or
   *Inline_agent* of the *Internal* form, one of whose instructions
   precedes `ep` and is a setter for `x`.
3. `x` is a variable attribute, and is (recursively) properly set at
   the end position of every creation procedure of `C`.
4. `ep` is an evaluation position in a *Compound* that is part of an
   instruction `ep'` , itself belonging to a *Compound*, and `x` is
   (recursively) properly set at position `ep'`.
5. `ep` is in a *Postcondition* of a routine or *Inline_agent* of the
   *Internal* form, and `x` is (recursively) properly set at the end
   position of its *Compound*.
6. `ep` is an *Assertion_clause* containing `Result` in the *Postcondition*
    of a constant attribute.
