# Semantics MOMB

These [tests](.) are exercising the semantics rule below.

## MOMB: Multi-Branch semantics

### ECMA 367-3 (working version 115), 8.22.15 page 215

Executing a *Multi_branch* with a matching branch consists of executing the *Compound* following
the `then` in that branch. In the absence of matching branch:

1. If the *Else_part* is present, the effect of the *Multi_branch* is that of the *Compound*
   appearing in its *Else_part*.
2. Otherwise the execution triggers an exception of type `BAD_INSPECT_VALUE`.

### Notes

* ISE Eiffel (as of 25.12.9.8922 and after) does not support inspect expressions
  whose type if a sized variant of `STRING`.

* ISE Eiffel (as of 25.12.9.8922 and after) does not support inspect expressions
  of type `TYPE [T]` for some type `T`.
