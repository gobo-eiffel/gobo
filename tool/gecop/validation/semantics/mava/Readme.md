# Semantics MAVA

These [tests](.) are exercising the semantics rule below.  
Click on the `[tests]` label following the condition numbers below to see tests specific to these conditions.

## MAVA: Associated variable semantics

### ECMA 367-2, 8.9.10 page 60

As part of the evaluation of a postcondition clause, the evaluation of the associated variable of an *Old* expression:

1. [\[tests\]](../mava1) Triggers an exception of type `OLD_EXCEPTION` if an associated exception marker has been recorded.
2. Otherwise, yields the value to which the variable has been set.

### ECMA 367-3 (working version 3-107), 8.10.30 page 120

Same as above.
