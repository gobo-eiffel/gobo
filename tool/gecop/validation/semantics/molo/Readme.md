# Semantics MOLO

These [tests](.) are exercising the semantics rule below.

## MOLO: Loop semantics

### ECMA 367-3 (working version 3-36), 8.17.20 page 101

The effect of executing a *Loop* `l` is the effect of executing its unfolded form `ul`. The effect of
executing `ul` is the effect of executing the *Compound* of its *Initialization*, then its *Loop\_body*.
The effect of executing a *Loop\_body* is:

* If the *Boolean\_expression* of the *Exit\_condition* evaluates to true: no effect (leave the state of
the computation unchanged).
* Otherwise: the effect of executing the *Compound* clause, followed (recursively) by the effect
of executing the *Loop\_body* again in the resulting state.

## Notes

* The definition of the unfolded form does not indicate what to do in case of an *Iteration* of the form `across ... is ...`.
* The definition of the unfolded form does not indicate what to do in case of an *Iteration* of the form `∀ ...`, `∃ ...` or `⟳ ... ⟲`.
