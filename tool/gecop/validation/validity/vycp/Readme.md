# Validity VYCP

These [tests](.) are exercising the validity rule below.</br>
Click on the `[tests]` label following the condition numbers to below to see
tests specific to these conditions.

## VYCP: Conversion Procedure rule

### ECMA 367-2, 8.15.7 page 88

A *Conversion_procedure* listing a *Feature_name* `fn` and appearing in a class `C`
with current type `CT` is valid if and only if it satisfies the following conditions,
applicable to every type `SOURCE` listed in its *Type_list*:

1. [\[tests\]](../vycp1) `fn` is the name of a creation procedure `cp` of `C`.
2. [\[tests\]](../vycp2) If `C` is not generic, `SOURCE` does not conform to `CT`.
3. [\[tests\]](../vycp3) If `C` is generic, `SOURCE` does not conform to the type
   obtained from `CT` by replacing every formal generic parameter by its constraint.
4. [\[tests\]](../vycp4) `SOURCE`'s base class is different from the base class of
   any other conversion type listed for a *Conversion_procedure* in the *Converters*
   clause of `C`.
5. [\[tests\]](../vycp5) The specification of the base class of `SOURCE` does not
   list a conversion query specifying a type of base class `C`.
6. [\[tests\]](../vycp6) `cp` has exactly one formal argument, of a type `ARG`.
7. [\[tests\]](../vycp7) `SOURCE` conforms to `ARG`.
8. [\[tests\]](../vycp8) `SOURCE` involves no anchored type.

### ECMA 367-3 (working version 115), 8.18.7 page 181

A *Conversion_procedure* listing a *Feature_name* `fn` and appearing in a class `C`
with current type `CT` is valid if and only if it satisfies the following conditions,
applicable to every type `SOURCE` listed in its *Type_list*:

1. [\[tests\]](../vycp1) `fn` is the name of a creation procedure `cp` of `C`.
2. [\[tests\]](../vycp2) If `C` is not generic, `SOURCE` does not conform to `CT`.
3. [\[tests\]](../vycp3) If `C` is generic, `SOURCE` does not conform to the type
   obtained from `CT` by replacing every formal generic parameter by its constraining
   type.
4. [\[tests\]](../vycp4) `SOURCE`'s base class is different from the base class of
   any other conversion type listed for a *Conversion_procedure* in the *Converters*
   clause of `C`.
5. [\[tests\]](../vycp5) The specification of the base class of `SOURCE` does not
   list a conversion query specifying a type of base class `C`.
6. [\[tests\]](../vycp6) `cp` has exactly one formal argument, of a type `ARG`.
7. [\[tests\]](../vycp7) `SOURCE` conforms to `ARG`.
8. [\[tests\]](../vycp8) `SOURCE` involves no anchored type.
9. [\[tests\]](../vycp9) `SOURCE` is an attached type.

### Notes

* Condition 5 is redundant with condition 5 of the Conversion Query rule
  but is included anyway for symmetry. In case of violation, a compiler may
  refer to either rule.

* Condition 8 is not strict enough. It should also forbid the case where `SOURCE`
  is a formal generic parameter of `C`. Otherwise we might end up with a type
  which both conforms and converts to another type. For example, in:
  ```
  class BB [G -> ANY]
  create
    f
  convert
    f ({G})
  feature
    f (a: G)
	  do
     end
  end

  class CC
  inherit
    BB [CC]
  end
  ```
  type `CC` both conforms and converts to `BB [CC]`.

* Condition 4 is too strict to accept some existing classes in ISE's libraries.
  ISE Eiffel (as of 25.12.9.8922 and after) and Gobo Eiffel (as of 26.11 and after)
  both accept a relaxed version where the two conversion types can have the same
  base class, provided that they are not the same type and they are part of two
  *Conversion_procedure*s with the same feature name `fn`. There is no ambiguity
  in that case.
