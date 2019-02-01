# Validity VGGC-2

This [test](.) is exercising the condition [2](../Readme.md) of the validity rule [VGGC](../../vggc/Readme.md).

### Description

In this test, the constraint of the formal generic parameter of class `BB` has a `rename` clause, renaming feature `f` as `g`. Feature `f` is the final name of a feature in `CC`, but `g` is also the final name of a feature in `CC`. Even though `f` is deferred in `CC` and `g` is effective, this renaming does not result in `f` being merged and effected with `g`. Indeed, in actual generic parameters, `f` may not necessarily be deferred and `f` and `g` may be the names of two different (non-merged) routines. Therefore, after renaming we end up with two features with the same name `g`. This violates `VGGC-2`.

Note that in this test, we show in class `DD` inheriting from `CC` that the same `rename` clause is valid when appearing in an `inherit` clause, resulting in having features `f` and `g` being merged together into a single routine `g` in class `DD`.

### Notes

* ISE Eiffel (as of 18.11.10.2592 and after) reports this validity rule violation using the old code `VTGC-2`.
