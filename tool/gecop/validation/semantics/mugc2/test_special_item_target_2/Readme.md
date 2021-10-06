# Semantics MUGC-2

This [test](.) is exercising the step [`2`](../Readme.md) of the semantics rule [`MUGC`](../../mugc/Readme.md).

### Description

This test is exercising the fact that there is no *Reattachment Semantics* rule involved for the target of a call. So even when the target is an attribute whose type is expanded (object with copy semantics), this object is not cloned and the feature is called on this object.

In this test, we have a call `s.item(0).f` where `s` is either of type `SPECIAL [BB]` or `SPECIAL [CC]`, with `BB` a reference type and `CC` an expanded type. In both cases, the call to `f` sets the value of `bar` in the object attached to the first item, not in a clone ot this item. This test satisfies `MUGC-2`.

Note that this is different from:

```
b := s.item (0)
b.f (i)
```

because the *Reattachment Semantics* rule applies in the assignment `b := s.item (0)`, and therefore the target of the call to `f` is a clone of the first item, and not the item itself.

### Notes

* See also `MUVA` (*Value of a call expression*): The value of a *Call* `c` used as an expression is, at any run-time moment, the result of executing `c`.

* See also `MURE-3` (*Call result*): If `df` is an attribute: the corresponding field in `O`.  
Informative text: A labeled tuple access, `t.b` where the type of `t` is a *Tuple_type*, falls under case 3 as a result of the notion of unfolded form of tuple types.

* Feature `item` in class `SPECIAL` is declared as `external "built_it"`. It is assumed to return the item object, not a clone of the item, since there is no explicit assignment and hence no *Reattachment Semantics* rule involved.

* ISE Eiffel (as of 20.11.10.5058 and after) applies the *Reattachment Semantics* rule within the implementation of `item` in class `SPECIAL`, and hence returns a clone of the item and not the item object itself.
