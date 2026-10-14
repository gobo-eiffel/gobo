# Semantics MKIN

This [test](.) is exercising the semantics rule `MKIN`.

### Description

In this test, the same creation procedure of the once class `BB` is used
in two different SCOOP regions. The creation procedure is a once-per-thread,
so we end up with the two different objects which match the same branch in
an inspect instruction. This test satisfies `MKIN`.

### Notes

* With ISE Eiffel (as of 25.12.9.8922 and after) in finalized mode, none of objects
  matches the expected branch in an inspect instruction.
