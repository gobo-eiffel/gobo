# Semantics MUGC-2

This [test](.) is exercising the step [`2`](../Readme.md) of the semantics rule [`MUGC`](../../mugc/Readme.md).

### Description

This test is exercising the fact that there is no *Reattachment Semantics* rule involved for the target of a call. So even when the target is an attribute whose type is expanded (object with copy semantics), this object is not cloned and the feature is called on this object.

In this test, we have a call `b.c.copy (5)` where `c` is an attribute of basic expanded type `INTEGER`. The call to `copy` sets the value of the object attached to this attribute, not of a clone. This test satisfies `MUGC-2`.

Note that this is different from:

```
c := b.c
c.copy (5)
```

because the *Reattachment Semantics* rule applies in the assignment `c := b.c`, and therefore the target of the call to `copy` is a clone of the attribute `c` in `b`, and not the object itself.

### Notes

* See also `MUVA` (*Value of a call expression*): The value of a *Call* `c` used as an expression is, at any run-time moment, the result of executing `c`.

* See also `MURE-3` (*Call result*): If `df` is an attribute: the corresponding field in `O`.

* ISE Eiffel (as of 20.11.10.5058 and after) crashes with an exception trace when executing this code.
