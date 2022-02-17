# Validity V1SE-G3

This [test](.) is exercising the condition [G3](../Readme.md) of the validity rule [V1SE](../../v1se/Readme.md).

### Description

In this test, there is a separate instruction with an argument `Void` whose type `detachable NONE` is not separate. This violates `V1SE-G3`.

### Notes

* The following code:
  ```
  separate Void as x do ... end
  ```

  will violate condition `G3` because the type of `Void`, `detachable NONE`, is not separate, whereas:
  ```
  f: detachable separate FOO do Result := Void end

  separate f as x do ... end
  ```

  will compile because the type of `f` is separate.
