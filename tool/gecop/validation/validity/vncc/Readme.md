# Validity VNCC

These [tests](.) are exercising the validity rule below.  
Click on the `[tests]` label following the condition numbers below to see tests specific to these conditions.

## VNCC: General conformance

### ECMA 367-2, 8.14.6 page 86

Let `T` and `V` be two types. `V` conforms to `T` if and only if one of the following conditions holds:

1. `V` and `T` are identical.
2. `V` conforms directly to `T`.
3. `V` is `NONE` and `T` is a detachable reference type.
4. [\[tests\]](../vncc4) `V` is `B [Y1,... Yn]` where `B` is a generic class, `T` is `B [X1,... Xn]`, and for every `Xi` the corresponding `Yi` is identical to `Xi` or, if the corresponding formal generic parameter does not
specify `frozen`, conforms (recursively) to `Xi`.
5. For some type `U` (recursively), `V` conforms to `U` and `U` conforms to `T`.
6. `T` or `V` or both are anchored types appearing in the same class `C`, and the deanchored form of `V` in `C` (recursively) conforms to the deanchored form of `T`.

### ECMA 367-3 (working version 3-42), 8.16.6 page 166

Same as above.

## Notes

* Condition 4 allows `B [C]` to conform to `B [D]` when class `B` is expanded, even when `C` and `D` are different types. This means that an entity of that type can be polymorphic even though it's expanded. However one of the main purposes of using expanded types, apart from copy semantics, is that objects of that type will not be allocated on the heap but be subobjects of other objects. This permits runtime optimizations, but is incompatible with polymorphism. 
* [GVNCC-4](../gvncc4/Readme.md) is a non-standard extension of the condition 4 which disallows polymorphism when the type of the entity is expanded. The associated [tests](../gvncc4) show what can go wrong when this non-standard extension is not enforced.
