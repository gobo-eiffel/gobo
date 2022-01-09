# Semantics M1EE

This [test](.) is exercising the semantics rule [`M1EE`](../Readme.md).

### Description

In this test, we have the call `c.standard_is_equal (d)` where `c` and `d` have a reference attribute attached to objects with copy semantics of type `INTEGER_32` with the same value `4`. The value of this expression is true because `standard_is_equal` uses `=` to compare fields.

### Notes

* ISE Eiffel (as of 21.11.10.6046 and after) erroneously considers that the two objects are not equal. This cannot be because when cloning such object the reference attribute attached to an object with copy semantics will need to be cloned. Otherwise we would end up with two entities attached to the same object with copy semantics which copy semantics is here to avoid. And after cloning, the two objects have to be equal according to the assertions of the clone routines.
