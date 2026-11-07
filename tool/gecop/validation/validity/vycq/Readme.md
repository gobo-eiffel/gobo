# Validity VYCQ

These [tests](.) are exercising the validity rule below.</br>
Click on the `[tests]` label following the condition numbers to below to see
tests specific to these conditions.

## VYCQ: Conversion Query rule

### ECMA 367-2, 8.15.8 page 89

A *Conversion_query* listing a *Feature_name* `fn` and appearing in a class `C`
with current type `CT` is valid if and only if it satisfies the following conditions,
applicable to every type `TARGET` listed in its *Type_list*:

1. [\[tests\]](../vycq1) `fn` is the name of a query `f` of `C`.
2. [\[tests\]](../vycq2) If `C` is not generic, `CT` does not conform to `TARGET`.
3. [\[tests\]](../vycq3) If `C` is generic, the type obtained from `CT` by replacing
   every formal generic parameter by its constraint does not conform to `TARGET`.
4. [\[tests\]](../vycq4) `TARGET`'s base class is different from the base class of
   any other conversion type listed for a *Conversion_query* in the *Converters*
   clause of `C`.
5. [\[tests\]](../vycq5) The specification of the base class of `TARGET` does not
   list a conversion procedure specifying a type of base class `C`.
6. [\[tests\]](../vycq6) `f` has no formal argument.
7. [\[tests\]](../vycq7) The result type of `f` conforms to `TARGET`.
8. [\[tests\]](../vycq8) `TARGET` involves no anchored type.

### ECMA 367-3 (working version 115), 8.18.8 page 182

A *Conversion_query* listing a *Feature_name* `fn` and appearing in a class `C`
with current type `CT` is valid if and only if it satisfies the following conditions,
applicable to every type `TARGET` listed in its *Type_list*:

1. [\[tests\]](../vycq1) `fn` is the name of a query `f` of `C`.
2. [\[tests\]](../vycq2) If `C` is not generic, `CT` does not conform to `TARGET`.
3. [\[tests\]](../vycq3) If `C` is generic, the type obtained from `CT` by replacing
   every formal generic parameter by its constraining type does not conform to `TARGET`.
4. [\[tests\]](../vycq4) `TARGET`'s base class is different from the base class of
   any other conversion type listed for a *Conversion_query* in the *Converters*
   clause of `C`.
5. [\[tests\]](../vycq5) The specification of the base class of `TARGET` does not
   list a conversion procedure specifying a type of base class `C`.
6. [\[tests\]](../vycq6) `f` has no formal argument.
7. [\[tests\]](../vycq7) The result type of `f` conforms to `TARGET`.
8. [\[tests\]](../vycq8) `TARGET` involves no anchored type.
9. [\[tests\]](../vycq9) `TARGET` is an attached type.

### Notes

* Condition 5 is redundant with condition 5 of the Conversion Procedure rule
  but is included anyway for symmetry. In case of violation, a compiler may
  refer to either rule.

* Condition 3 is not strict enough. It should forbid the case where the base
  class of `TARGET` is a conforming ancestor of `C`. Otherwise we might end up
  with a type which both conforms and converts to another type. For example, in:
  ```
  class BB [G -> ANY]
  inherit
    CC [INTEGER]
  convert
    f: {CC [G]}
  feature
    f: CC [G]
	  do
        ...
      end
  end
  ```
  type `BB [INTEGER]` both conforms and converts to `CC [INTEGER]`.

* Condition 8 is not strict enough. It should also forbid the case where `TARGET`
  is a formal generic parameter of `C`. Otherwise we might end up with a type
  which both conforms and converts to another type. For example, in:
  ```
  class BB [G -> ANY]
  convert
    f: {G}
  feature
    f: G
	  do
        ...
      end
  end
  ```
  type `BB [ANY]` both conforms and converts to `ANY`.

* Condition 4 is too strict to accept some existing classes in ISE's libraries.
  ISE Eiffel (as of 25.12.9.8922 and after) and Gobo Eiffel (as of 26.11 and after)
  both accept a relaxed version where the two conversion types can have the same
  base class, provided that they are not the same type and they are part of two
  *Conversion_query*s with the same feature name `fn`. There is no ambiguity
  in that case.

