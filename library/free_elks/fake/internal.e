class INTERNAL

feature

	dynamic_type (object: ANY): INTEGER is
			-- Dynamic type of `object'
		require
			object_not_void: object /= Void
		do
			Result := object.generating_type.type_id
		ensure
			dynamic_type_nonnegative: Result >= 0
		end

	new_instance_of (type_id: INTEGER): ANY is
		do
			print ("TODO: INTERNAL.new_instance_of%N")
		end

	type_of (object: ANY): TYPE [ANY]
			-- Type object for `object'
		do
			if object /= Void then
				Result := object.generating_type
			else
				Result := {NONE}
			end
		ensure
			type_not_void: Result /= Void
		end

	field (i: INTEGER; object: ANY): ANY is
		do
			print ("TODO: INTERNAL.field%N")
		end

	boolean_field (i: INTEGER; object: ANY): BOOLEAN is
		do
			print ("TODO: INTERNAL.boolean_field%N")
		end

	character_8_field, character_field (i: INTEGER; object: ANY): CHARACTER_8 is
		do
			print ("TODO: INTERNAL.character_field%N")
		end

	integer_8_field (i: INTEGER; object: ANY): INTEGER_8 is
		do
			print ("TODO: INTERNAL.integer_8_field%N")
		end

	integer_16_field (i: INTEGER; object: ANY): INTEGER_16 is
		do
			print ("TODO: INTERNAL.integer_16_field%N")
		end

	integer_32_field, integer_field (i: INTEGER; object: ANY): INTEGER_32 is
		do
			print ("TODO: INTERNAL.integer_32_field%N")
		end

	integer_64_field (i: INTEGER; object: ANY): INTEGER_64 is
		do
			print ("TODO: INTERNAL.integer_64_field%N")
		end

	natural_8_field (i: INTEGER; object: ANY): NATURAL_8 is
		do
			print ("TODO: INTERNAL.natural_8_field%N")
		end

	natural_16_field (i: INTEGER; object: ANY): NATURAL_16 is
		do
			print ("TODO: INTERNAL.natural_16_field%N")
		end

	natural_32_field (i: INTEGER; object: ANY): NATURAL_32 is
		do
			print ("TODO: INTERNAL.natural_32_field%N")
		end

	natural_64_field (i: INTEGER; object: ANY): NATURAL_64 is
		do
			print ("TODO: INTERNAL.natural_64_field%N")
		end

	real_32_field, real_field (i: INTEGER; object: ANY): REAL is
			-- Real value of `i'-th field of `object'
		do
			print ("TODO: INTERNAL.real_field%N")
		end

	real_64_field, double_field (i: INTEGER; object: ANY): DOUBLE is
		do
			print ("TODO: INTERNAL.double_field%N")
		end

	pointer_field (i: INTEGER; object: ANY): POINTER is
		do
			print ("TODO: INTERNAL.pointer_field%N")
		end

	field_name (i: INTEGER; object: ANY): STRING is
			-- Name of `i'-th field of `object'
		do
			print ("TODO: INTERNAL.field_name%N")
		end

	field_count (object: ANY): INTEGER is
			-- Number of logical fields in `object'
		do
			print ("TODO: INTERNAL.field_count%N")
		end

	dynamic_type_from_string (class_type: STRING): INTEGER is
		do
			print ("TODO: INTERNAL.dynamic_type_from_string%N")
		end

	type_conforms_to (type1, type2: INTEGER): BOOLEAN is
		do
			print ("TODO: INTERNAL.type_conforms_to%N")
		end

	is_special (object: ANY): BOOLEAN is
		do
			print ("TODO: INTERNAL.is_special%N")
		end

	generic_dynamic_type_of_type (type_id: INTEGER; i: INTEGER): INTEGER is
		do
			print ("TODO: INTERNAL.generic_dynamic_type_of_type%N")
		end

	generic_dynamic_type (object: ANY; i: INTEGER): INTEGER is
		do
			print ("TODO: INTERNAL.generic_dynamic_type%N")
		end

	none_type: INTEGER is -2
			-- Type ID representation for NONE.

	Pointer_type: INTEGER is 0

	Reference_type: INTEGER is 1

	character_8_type, Character_type: INTEGER is 2

	Boolean_type: INTEGER is 3

	Integer_type, integer_32_type: INTEGER is 4

	Real_type, real_32_type: INTEGER is 5

	Double_type, real_64_type: INTEGER is 6

	Expanded_type: INTEGER is 7

	Bit_type: INTEGER is 8

	Integer_8_type: INTEGER is 9

	Integer_16_type: INTEGER is 10

	Integer_64_type: INTEGER is 11

	character_32_type, Wide_character_type: INTEGER is 12

	natural_8_type: INTEGER is 13

	natural_16_type: INTEGER is 14

	natural_32_type: INTEGER is 15

	natural_64_type: INTEGER is 16

	max_predefined_type: INTEGER is 16

	is_tuple (object: ANY): BOOLEAN is
		do
			print ("TODO: INTERNAL.is_tuple%N")
		end

	field_count_of_type (type_id: INTEGER): INTEGER is
		do
			print ("TODO: INTERNAL.field_count_of_type%N")
		end

	field_type_of_type (i: INTEGER; type_id: INTEGER): INTEGER is
		do
			print ("TODO: INTERNAL.field_type_of_type%N")
		end

	set_reference_field (i: INTEGER; object: ANY; value: ANY) is
		do
			print ("TODO: INTERNAL.set_reference_field%N")
		end

	set_real_64_field, set_double_field (i: INTEGER; object: ANY; value: DOUBLE) is
		do
			print ("TODO: INTERNAL.set_double_field%N")
		end

	set_character_8_field, set_character_field (i: INTEGER; object: ANY; value: CHARACTER) is
		do
			print ("TODO: INTERNAL.set_character_field%N")
		end

	set_character_32_field (i: INTEGER; object: ANY; value: CHARACTER_32) is
		do
			print ("TODO: INTERNAL.set_character_32_field%N")
		end

	set_boolean_field (i: INTEGER; object: ANY; value: BOOLEAN) is
		do
			print ("TODO: INTERNAL.set_boolean_field%N")
		end

	set_natural_8_field (i: INTEGER; object: ANY; value: NATURAL_8) is
		do
			print ("TODO: INTERNAL.set_natural_8_field%N")
		end

	set_natural_16_field (i: INTEGER; object: ANY; value: NATURAL_16) is
		do
			print ("TODO: INTERNAL.set_natural_16_field%N")
		end

	set_natural_32_field (i: INTEGER; object: ANY; value: NATURAL_32) is
		do
			print ("TODO: INTERNAL.set_natural_32_field%N")
		end

	set_natural_64_field (i: INTEGER; object: ANY; value: NATURAL_64) is
		do
			print ("TODO: INTERNAL.set_natural_64_field%N")
		end

	set_integer_8_field (i: INTEGER; object: ANY; value: INTEGER_8) is
		do
			print ("TODO: INTERNAL.set_integer_8_field%N")
		end

	set_integer_16_field (i: INTEGER; object: ANY; value: INTEGER_16) is
		do
			print ("TODO: INTERNAL.set_integer_16_field%N")
		end

	set_integer_field, set_integer_32_field (i: INTEGER; object: ANY; value: INTEGER) is
		do
			print ("TODO: INTERNAL.set_integer_32_field%N")
		end

	set_integer_64_field (i: INTEGER; object: ANY; value: INTEGER_64) is
		do
			print ("TODO: INTERNAL.set_integer_64_field%N")
		end

	set_real_32_field, set_real_field (i: INTEGER; object: ANY; value: REAL) is
		do
			print ("TODO: INTERNAL.set_real_field%N")
		end

	set_pointer_field (i: INTEGER; object: ANY; value: POINTER) is
		do
			print ("TODO: INTERNAL.set_pointer_field%N")
		end

	new_special_any_instance (type_id, count: INTEGER): SPECIAL [ANY] is
		do
			print ("TODO: INTERNAL.new_special_any_instance%N")
		end

	field_static_type_of_type (i: INTEGER; type_id: INTEGER): INTEGER is
			-- Static type of declared `i'-th field of dynamic type `type_id'
		do
			print ("TODO: INTERNAL.field_static_type_of_type%N")
		end

	field_name_of_type (i: INTEGER; type_id: INTEGER): STRING is
		do
			print ("TODO: INTERNAL.field_name_of_type%N")
		end

	field_type (i: INTEGER; object: ANY): INTEGER is
		do
			print ("TODO: INTERNAL.field_type%N")
		end

end
