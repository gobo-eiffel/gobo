# Semantics M9WC

These [tests](.) are exercising the semantics rule below.

## M9WC: SCOOP Wait Conditions semantics

This semantics is part of SCOOP, the Eiffel concurrency mechanism. SCOOP is not described in the ECMA Eiffel standard, therefore this semantics is not part of the standard.

However, SCOOP is described in the eiffel.org documentation [Concurrent programming with SCOOP](https://www.eiffel.org/doc/solutions/Concurrent_programming_with_SCOOP).

### Description of SCOOP in eiffel.org (version 25.15), [Design by Contract in SCOOP](https://www.eiffel.org/doc/solutions/Design_by_Contract_in_SCOOP)

In the context of SCOOP, preconditions have the following semantics:

If one of the separate objects used as a target in a precondition clause is not locked
(see definition in Asynchronous Calls) in the context of the caller, the precondition
is treated as a wait condition. Otherwise, it is a correctness condition.

### Notes

* The rule in eiffe.org is different:

      If one of the separate objects used as a target in a precondition clause is locked
      (see definition in Asynchronous Calls) in the context of the caller, the precondition
      is treated as a correctness condition. Otherwise, it is a wait condition. 

  but it seems too restrictive.

* Gobo Eiffel (as of 26.07 and after) is more flexible, considering that a precondition
  is treated as a wait condition if it uses at least on of the separate arguments
  which is not locked in the context of the caller and a call in its region occurred
  (possibly indirectly) while evaluating this precondition.
