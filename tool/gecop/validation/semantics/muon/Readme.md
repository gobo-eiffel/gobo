# Semantics MUON

These [tests](.) are exercising the semantics rule below.  
Click on the `[tests]` label following the case numbers below to see tests specific to these cases.

## MUON: Once Routine Execution Semantics

### ECMA 367-2, 8.23.22 page 124

The effect of executing a once routine `df` on a target object `O` is:

1. [\[tests\]](../muon1) If the call is fresh: that of a non-once call made of the same elements, as determined by Non-Once Routine Execution Semantics.
2. [\[tests\]](../muon2) If the call is not fresh and the last execution of `f` on the latest applicable target triggered an exception: to trigger again an identical exception. The remaining cases do not then apply.
3. [\[tests\]](../muon3) If the call is not fresh and `df` is a procedure: no further effect.
4. [\[tests\]](../muon4) If the call is not fresh and `df` is a function: to attach the local variable `Result` to the latest applicable result of the call.

### ECMA 367-3 (working version 3-36), 8.23.26 page 131

Same as above.

## Notes

* Case 2 above mentions `f`. It should be `df`.
