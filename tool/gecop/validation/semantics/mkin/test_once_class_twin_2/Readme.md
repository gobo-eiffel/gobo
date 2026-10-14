# Semantics MKIN

This [test](.) is exercising the semantics rule `MKIN`.

### Description

In this test, an instance of the once class `BB` is cloned. The cloned object
still matches the same branch in an inspect instruction. This test satisfies `MKIN`.

### Notes

* With ISE Eiffel (as of 25.12.9.8922 and after) in finalized mode, none of objects
  matches the expected branch in an inspect instruction.
