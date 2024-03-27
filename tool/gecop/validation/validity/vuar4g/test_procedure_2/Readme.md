# Validity VUAR-4G

This [test](.) is exercising the condition [4G](../Readme.md) of the validity rule [VUAR](../../vuar/Readme.md).

### Description

In this test, there is a separate call to the procedure `f` from class `BB`. The type `CC` of the actual argument of `f` is expanded, but it contains an attribute `name` whose type is reference but not separate. This violates `VUAR-4G`.

### Notes

* It does not matter whether the type of the formal argument of `f` is reference separate. The copy of the expanded object of type `CC` will be in the region of the target of the call where it attribute object will still be in the region of the caller.

* ISE Eiffel (as of 23.09.10.7341 and after) reports a violation of rule `VUAR-2` instead. This is because apparently it considers that an expanded type which has, directly or indirectly, an attribute of reference type which is not separate, does not conform to any separate type. So `CC` does not conform to `separate ANY`. This is flawed because `CC` conforms to `ANY` which conforms to `separate ANY`.

* Gobo Eiffel reports a validity error `V1EA-1G` instead. This is because the issue of having non-separate reference attributes in expanded classes is more general than just this particular case.
