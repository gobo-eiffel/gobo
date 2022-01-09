# Semantics M1EE

These [tests](.) are exercising the semantics rule below.  

## M1EE: Equality Expression Semantics

### ECMA 367-2, 8.21.3 page 115

The *Boolean\_expression* `e ~ f` has value true if and only if the values of `e` and `f` are both attached and such that `e.is_equal (f)` holds.

The *Boolean\_expression* `e = f` has value true if and only if the values of `e` and `f` are one of:

1. Both void.
2. Both attached to the same object with reference semantics.
3. Both attached to objects with copy semantics, and such that `e ~ f` holds.

### ECMA 367-3 (working version 3-42), 8.25.3 page 225

The *Boolean\_expression* `e ~ f` has value true if and only if the values of `e` and `f` are attached to objects of the same type and `e.is_equal (f)` holds.

The *Boolean\_expression* `e = f` has value true if and only if the values of `e` and `f` are one of:

1. Both void.
2. Both attached to the same object with reference semantics.
3. Both attached to objects with copy semantics, and such that `e ~ f` holds.

### Notes

* The standard says that the value of `Void ~ Void` is false, but both ISE Eiffel (as of 21.11.10.6046 and after) and Gobo Eiffel consider the value of this expression to be true.
