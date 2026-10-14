# Semantics MKIN

This [test](.) is exercising the semantics rule `MKIN`.

### Description

In this test, the same creation procedure of the once class `BB` is used.
We end up with the same object each time. This test satisfies `MKIN`.

### Notes

* With ISE Eiffel (as of 25.12.9.8922 and after) in finalized mode, we get
  different objects and none of them is equal to the expected once instance
  of `BB`.
  