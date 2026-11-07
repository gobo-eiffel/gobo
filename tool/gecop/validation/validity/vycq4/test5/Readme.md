# Validity VYCQ-4

This [test](.) is exercising the condition [4](../Readme.md) of the validity rule [VYCQ](../../vycq/Readme.md).

### Description

In this test, class `BB` declares a conversion query of the form `f: {CC [ANY], CC [STRING]}`,
but the two convert types have the same base class. This violates `VYCQ-4`.

### Notes

* `VYCQ-4` is too strict to accept some existing classes in ISE's libraries
  similar to this example.
  ISE Eiffel (as of 25.12.9.8922 and after) and Gobo Eiffel (as of 26.11 and after)
  both accept this code where the two conversion types can have the same base class,
  provided that they are not the same type and they are part of two *Conversion_query*s
  with the same feature name `fn`. There is no ambiguity in that case.
  