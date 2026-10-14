# Semantics MKIN

This [test](.) is exercising the semantics rule `MKIN`.

### Description

In this test, an instance of the once class `BB` is cloned. We end up with two different objects.
This test satisfies `MKIN`.

### Notes

* With ISE Eiffel (as of 25.12.9.8922 and after) in finalized mode, none of objects
  is equal to the expected once instance of `BB`.
