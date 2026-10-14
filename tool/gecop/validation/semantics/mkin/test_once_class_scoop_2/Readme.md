# Semantics MKIN

This [test](.) is exercising the semantics rule `MKIN`.

### Description

In this test, the same creation procedure of the once class `BB` is used
in two different SCOOP regions. The creation procedure is a once-per-process,
so we end up with the same object which matches the same branch in
an inspect instruction. This test satisfies `MKIN`.
