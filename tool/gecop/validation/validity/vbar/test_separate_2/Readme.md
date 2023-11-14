# Validity VBAR

This [test](.) is exercising the validity rule [VBAR](../../vbar/Readme.md).

### Description

In this test, there is an assignment `x := b.f` where the type of the source `b.f` is `separate BB` even though the type of `f` in class `BB` is `like Current` which is not separate. This is because the type of `b` is separate and the separateness is propagated to the result type of `b.f`. But the type of the target of the assignment `x` is `BB`. This violates `VBAR` because `separate BB` does not conform to `BB`.

### Notes

* Gobo Eiffel and ISE Eiffel (as of 23.9.10.7341 and after) report this validity rule violation using the old code `VJAR`.
