# Validity GVNCC-4

These [tests](.) are exercising a non-standard extension of the condition 4 of the validity rule [VNCC](../vncc/Readme.md).

`VNCC-4` says:

4. `V` is `B [Y1,... Yn]` where `B` is a generic class, `T` is `B [X1,... Xn]`, and for every `Xi` the corresponding `Yi` is identical to `Xi` or, if the corresponding formal generic parameter does not
specify `frozen`, conforms (recursively) to `Xi`.

`GVNCC-4` says:

4. `V` is `B [Y1,... Yn]` where `B` is a generic class, `T` is `B [X1,... Xn]`, and for every `Xi` the corresponding `Yi` is identical to `Xi` or, if the corresponding formal generic parameter does not
specify `frozen` and class `B` is not expanded, conforms (recursively) to `Xi`.

## Notes

* `VNCC-4` allows `B [C]` to conform to `B [D]` when class `B` is expanded, even when `C` and `D` are different types. This means that an entity of that type can be polymorphic even though it's expanded. However one of the main purposes of using expanded types, apart from copy semantics, is that objects of that type will not be allocated on the heap but be subobjects of other objects. This permits runtime optimizations, but is incompatible with polymorphism. 
* `GVNCC-4` disallows polymorphism when the type of the entity is expanded. These [tests](.) show what can go wrong when this non-standard extension is not enforced.
