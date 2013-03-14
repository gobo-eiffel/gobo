note

	description:

		"Eiffel token and symbol constants"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004-2013, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_TOKEN_CONSTANTS

inherit

	ET_TOKEN_CODES

feature -- Class names

	any_class_name: ET_CLASS_NAME
			-- "ANY" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_any_name)
		ensure
			any_class_name_not_void: Result /= Void
		end

	arguments_32_class_name: ET_CLASS_NAME
			-- "ARGUMENTS_32" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_arguments_32_name)
		ensure
			arguments_32_class_name_not_void: Result /= Void
		end

	array_class_name: ET_CLASS_NAME
			-- "ARRAY" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_array_name)
		ensure
			array_class_name_not_void: Result /= Void
		end

	bit_class_name: ET_CLASS_NAME
			-- "BIT" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_bit_name)
		ensure
			bit_class_name_not_void: Result /= Void
		end

	boolean_class_name: ET_CLASS_NAME
			-- "BOOLEAN" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_boolean_name)
		ensure
			boolean_class_name_not_void: Result /= Void
		end

	character_class_name: ET_CLASS_NAME
			-- "CHARACTER" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_character_name)
		ensure
			character_class_name_not_void: Result /= Void
		end

	character_8_class_name: ET_CLASS_NAME
			-- "CHARACTER_8" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_character_8_name)
		ensure
			character_8_class_name_not_void: Result /= Void
		end

	character_32_class_name: ET_CLASS_NAME
			-- "CHARACTER_32" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_character_32_name)
		ensure
			character_32_class_name_not_void: Result /= Void
		end

	disposable_class_name: ET_CLASS_NAME
			-- "DISPOSABLE" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_disposable_name)
		ensure
			disposable_class_name_not_void: Result /= Void
		end

	double_class_name: ET_CLASS_NAME
			-- "DOUBLE" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_double_name)
		ensure
			double_class_name_not_void: Result /= Void
		end

	function_class_name: ET_CLASS_NAME
			-- "FUNCTION" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_function_name)
		ensure
			function_class_name_not_void: Result /= Void
		end

	identified_routines_class_name: ET_CLASS_NAME
			-- "IDENTIFIED_ROUTINES" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_identified_routines_name)
		ensure
			identified_routines_class_name_not_void: Result /= Void
		end

	integer_class_name: ET_CLASS_NAME
			-- "INTEGER" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_integer_name)
		ensure
			integer_class_name_not_void: Result /= Void
		end

	integer_8_class_name: ET_CLASS_NAME
			-- "INTEGER_8" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_integer_8_name)
		ensure
			integer_8_class_name_not_void: Result /= Void
		end

	integer_16_class_name: ET_CLASS_NAME
			-- "INTEGER_16" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_integer_16_name)
		ensure
			integer_16_class_name_not_void: Result /= Void
		end

	integer_32_class_name: ET_CLASS_NAME
			-- "INTEGER_32" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_integer_32_name)
		ensure
			integer_32_class_name_not_void: Result /= Void
		end

	integer_64_class_name: ET_CLASS_NAME
			-- "INTEGER_64" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_integer_64_name)
		ensure
			integer_64_class_name_not_void: Result /= Void
		end

	internal_class_name: ET_CLASS_NAME
			-- "INTERNAL" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_internal_name)
		ensure
			internal_class_name_not_void: Result /= Void
		end

	iterable_class_name: ET_CLASS_NAME
			-- "ITERABLE" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_iterable_name)
		ensure
			iterable_class_name_not_void: Result /= Void
		end

	iteration_cursor_class_name: ET_CLASS_NAME
			-- "ITERATION_CURSOR" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_iteration_cursor_name)
		ensure
			iteration_cursor_class_name_not_void: Result /= Void
		end

	memory_class_name: ET_CLASS_NAME
			-- "MEMORY" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_memory_name)
		ensure
			memory_class_name_not_void: Result /= Void
		end

	native_array_class_name: ET_CLASS_NAME
			-- "NATIVE_ARRAY" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_native_array_name)
		ensure
			native_array_class_name_not_void: Result /= Void
		end

	natural_class_name: ET_CLASS_NAME
			-- "NATURAL" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_natural_name)
		ensure
			natural_class_name_not_void: Result /= Void
		end

	natural_8_class_name: ET_CLASS_NAME
			-- "NATURAL_8" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_natural_8_name)
		ensure
			natural_8_class_name_not_void: Result /= Void
		end

	natural_16_class_name: ET_CLASS_NAME
			-- "NATURAL_16" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_natural_16_name)
		ensure
			natural_16_class_name_not_void: Result /= Void
		end

	natural_32_class_name: ET_CLASS_NAME
			-- "NATURAL_32" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_natural_32_name)
		ensure
			natural_32_class_name_not_void: Result /= Void
		end

	natural_64_class_name: ET_CLASS_NAME
			-- "NATURAL_64" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_natural_64_name)
		ensure
			natural_64_class_name_not_void: Result /= Void
		end

	none_class_name: ET_CLASS_NAME
			-- "NONE" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_none_name)
		ensure
			none_class_name_not_void: Result /= Void
		end

	platform_class_name: ET_CLASS_NAME
			-- "PLATFORM" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_platform_name)
		ensure
			platform_class_name_not_void: Result /= Void
		end

	pointer_class_name: ET_CLASS_NAME
			-- "POINTER" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_pointer_name)
		ensure
			pointer_class_name_not_void: Result /= Void
		end

	predicate_class_name: ET_CLASS_NAME
			-- "PREDICATE" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_predicate_name)
		ensure
			predicate_class_name_not_void: Result /= Void
		end

	procedure_class_name: ET_CLASS_NAME
			-- "PROCEDURE" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_procedure_name)
		ensure
			procedure_class_name_not_void: Result /= Void
		end

	real_class_name: ET_CLASS_NAME
			-- "REAL" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_real_name)
		ensure
			real_class_name_not_void: Result /= Void
		end

	real_32_class_name: ET_CLASS_NAME
			-- "REAL_32" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_real_32_name)
		ensure
			real_32_class_name_not_void: Result /= Void
		end

	real_64_class_name: ET_CLASS_NAME
			-- "REAL_64" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_real_64_name)
		ensure
			real_64_class_name_not_void: Result /= Void
		end

	routine_class_name: ET_CLASS_NAME
			-- "ROUTINE" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_routine_name)
		ensure
			routine_class_name_not_void: Result /= Void
		end

	special_class_name: ET_CLASS_NAME
			-- "SPECIAL" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_special_name)
		ensure
			special_class_name_not_void: Result /= Void
		end

	string_class_name: ET_CLASS_NAME
			-- "STRING" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_string_name)
		ensure
			string_class_name_not_void: Result /= Void
		end

	string_8_class_name: ET_CLASS_NAME
			-- "STRING_8" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_string_8_name)
		ensure
			string_8_class_name_not_void: Result /= Void
		end

	string_32_class_name: ET_CLASS_NAME
			-- "STRING_32" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_string_32_name)
		ensure
			string_32_class_name_not_void: Result /= Void
		end

	system_object_class_name: ET_CLASS_NAME
			-- "SYSTEM_OBJECT" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_system_object_name)
		ensure
			system_object_class_name_not_void: Result /= Void
		end

	system_string_class_name: ET_CLASS_NAME
			-- "SYSTEM_STRING" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_system_string_name)
		ensure
			system_string_class_name_not_void: Result /= Void
		end

	tuple_class_name: ET_CLASS_NAME
			-- "TUPLE" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_tuple_name)
		ensure
			tuple_class_name_not_void: Result /= Void
		end

	type_class_name: ET_CLASS_NAME
			-- "TYPE" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_type_name)
		ensure
			type_class_name_not_void: Result /= Void
		end

	typed_pointer_class_name: ET_CLASS_NAME
			-- "TYPED_POINTER" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_typed_pointer_name)
		ensure
			typed_pointer_class_name_not_void: Result /= Void
		end

	wide_character_class_name: ET_CLASS_NAME
			-- "WIDE_CHARACTER" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_wide_character_name)
		ensure
			wide_character_class_name_not_void: Result /= Void
		end

	unknown_class_name: ET_CLASS_NAME
			-- "*UNKNOWN*" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_unknown_name)
		ensure
			unknown_class_name_not_void: Result /= Void
		end

feature -- Class names (used for compatibility with 5.6.0610, to be removed later)

	boolean_ref_class_name: ET_CLASS_NAME
			-- "BOOLEAN_REF" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_boolean_ref_name)
		ensure
			boolean_ref_class_name_not_void: Result /= Void
		end

	character_ref_class_name: ET_CLASS_NAME
			-- "CHARACTER_REF" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_character_ref_name)
		ensure
			character_ref_class_name_not_void: Result /= Void
		end

	character_8_ref_class_name: ET_CLASS_NAME
			-- "CHARACTER_8_REF" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_character_8_ref_name)
		ensure
			character_8_ref_class_name_not_void: Result /= Void
		end

	character_32_ref_class_name: ET_CLASS_NAME
			-- "CHARACTER_32_REF" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_character_32_ref_name)
		ensure
			character_32_ref_class_name_not_void: Result /= Void
		end

	double_ref_class_name: ET_CLASS_NAME
			-- "DOUBLE_REF" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_double_ref_name)
		ensure
			double_ref_class_name_not_void: Result /= Void
		end

	integer_ref_class_name: ET_CLASS_NAME
			-- "INTEGER_REF" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_integer_ref_name)
		ensure
			integer_class_name_not_void: Result /= Void
		end

	integer_8_ref_class_name: ET_CLASS_NAME
			-- "INTEGER_8_REF" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_integer_8_ref_name)
		ensure
			integer_8_ref_class_name_not_void: Result /= Void
		end

	integer_16_ref_class_name: ET_CLASS_NAME
			-- "INTEGER_16_REF" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_integer_16_ref_name)
		ensure
			integer_16_ref_class_name_not_void: Result /= Void
		end

	integer_32_ref_class_name: ET_CLASS_NAME
			-- "INTEGER_32_REF" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_integer_32_ref_name)
		ensure
			integer_32_ref_class_name_not_void: Result /= Void
		end

	integer_64_ref_class_name: ET_CLASS_NAME
			-- "INTEGER_64_REF" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_integer_64_ref_name)
		ensure
			integer_64_ref_class_name_not_void: Result /= Void
		end

	natural_ref_class_name: ET_CLASS_NAME
			-- "NATURAL_REF" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_natural_ref_name)
		ensure
			natural_ref_class_name_not_void: Result /= Void
		end

	natural_8_ref_class_name: ET_CLASS_NAME
			-- "NATURAL_8_REF" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_natural_8_ref_name)
		ensure
			natural_8_ref_class_name_not_void: Result /= Void
		end

	natural_16_ref_class_name: ET_CLASS_NAME
			-- "NATURAL_16_REF" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_natural_16_ref_name)
		ensure
			natural_16_ref_class_name_not_void: Result /= Void
		end

	natural_32_ref_class_name: ET_CLASS_NAME
			-- "NATURAL_32_REF" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_natural_32_ref_name)
		ensure
			natural_32_ref_class_name_not_void: Result /= Void
		end

	natural_64_ref_class_name: ET_CLASS_NAME
			-- "NATURAL_64_REF" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_natural_64_ref_name)
		ensure
			natural_64_ref_class_name_not_void: Result /= Void
		end

	pointer_ref_class_name: ET_CLASS_NAME
			-- "POINTER_REF" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_pointer_ref_name)
		ensure
			pointer_ref_class_name_not_void: Result /= Void
		end

	real_ref_class_name: ET_CLASS_NAME
			-- "REAL_REF" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_real_ref_name)
		ensure
			real_ref_class_name_not_void: Result /= Void
		end

	real_32_ref_class_name: ET_CLASS_NAME
			-- "REAL_32_REF" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_real_32_ref_name)
		ensure
			real_32_ref_class_name_not_void: Result /= Void
		end

	real_64_ref_class_name: ET_CLASS_NAME
			-- "REAL_64_REF" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_real_64_ref_name)
		ensure
			real_64_ref_class_name_not_void: Result /= Void
		end

	wide_character_ref_class_name: ET_CLASS_NAME
			-- "WIDE_CHARACTER_REF" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_wide_character_ref_name)
		ensure
			wide_character_ref_class_name_not_void: Result /= Void
		end

feature -- Feature names

	after_feature_name: ET_FEATURE_NAME
			-- 'after' feature name
		once
			create {ET_IDENTIFIER} Result.make (after_name)
		ensure
			after_feature_name_not_void: Result /= Void
		end

	aliased_resized_area_feature_name: ET_FEATURE_NAME
			-- 'aliased_resized_area' feature name
		once
			create {ET_IDENTIFIER} Result.make (aliased_resized_area_name)
		ensure
			aliased_resized_area_feature_name_not_void: Result /= Void
		end

	area_feature_name: ET_FEATURE_NAME
			-- 'area' feature name
		once
			create {ET_IDENTIFIER} Result.make (area_name)
		ensure
			area_feature_name_not_void: Result /= Void
		end

	argument_count_feature_name: ET_FEATURE_NAME
			-- 'argument_count' feature name
		once
			create {ET_IDENTIFIER} Result.make (argument_count_name)
		ensure
			argument_count_feature_name_not_void: Result /= Void
		end

	as_natural_8_feature_name: ET_FEATURE_NAME
			-- 'as_natural_8' feature name
		once
			create {ET_IDENTIFIER} Result.make (as_natural_8_name)
		ensure
			as_natural_8_feature_name_not_void: Result /= Void
		end

	as_natural_16_feature_name: ET_FEATURE_NAME
			-- 'as_natural_16' feature name
		once
			create {ET_IDENTIFIER} Result.make (as_natural_16_name)
		ensure
			as_natural_16_feature_name_not_void: Result /= Void
		end

	as_natural_32_feature_name: ET_FEATURE_NAME
			-- 'as_natural_32' feature name
		once
			create {ET_IDENTIFIER} Result.make (as_natural_32_name)
		ensure
			as_natural_32_feature_name_not_void: Result /= Void
		end

	as_natural_64_feature_name: ET_FEATURE_NAME
			-- 'as_natural_64' feature name
		once
			create {ET_IDENTIFIER} Result.make (as_natural_64_name)
		ensure
			as_natural_64_feature_name_not_void: Result /= Void
		end

	as_integer_8_feature_name: ET_FEATURE_NAME
			-- 'as_integer_8' feature name
		once
			create {ET_IDENTIFIER} Result.make (as_integer_8_name)
		ensure
			as_integer_8_feature_name_not_void: Result /= Void
		end

	as_integer_16_feature_name: ET_FEATURE_NAME
			-- 'as_integer_16' feature name
		once
			create {ET_IDENTIFIER} Result.make (as_integer_16_name)
		ensure
			as_integer_16_feature_name_not_void: Result /= Void
		end

	as_integer_32_feature_name: ET_FEATURE_NAME
			-- 'as_integer_32' feature name
		once
			create {ET_IDENTIFIER} Result.make (as_integer_32_name)
		ensure
			as_integer_32_feature_name_not_void: Result /= Void
		end

	as_integer_64_feature_name: ET_FEATURE_NAME
			-- 'as_integer_84' feature name
		once
			create {ET_IDENTIFIER} Result.make (as_integer_64_name)
		ensure
			as_integer_64_feature_name_not_void: Result /= Void
		end

	base_address_feature_name: ET_FEATURE_NAME
			-- 'base_address' feature name
		once
			create {ET_IDENTIFIER} Result.make (base_address_name)
		ensure
			base_address_feature_name_not_void: Result /= Void
		end

	base_class_name_feature_name: ET_FEATURE_NAME
			-- 'base_class_name' feature name
		once
			create {ET_IDENTIFIER} Result.make (base_class_name_name)
		ensure
			base_class_name_feature_name_not_void: Result /= Void
		end

	bit_and_feature_name: ET_FEATURE_NAME
			-- 'bit_and' feature name
		once
			create {ET_IDENTIFIER} Result.make (bit_and_name)
		ensure
			bit_and_feature_name_not_void: Result /= Void
		end

	bit_not_feature_name: ET_FEATURE_NAME
			-- 'bit_not' feature name
		once
			create {ET_IDENTIFIER} Result.make (bit_not_name)
		ensure
			bit_not_feature_name_not_void: Result /= Void
		end

	bit_or_feature_name: ET_FEATURE_NAME
			-- 'bit_or' feature name
		once
			create {ET_IDENTIFIER} Result.make (bit_or_name)
		ensure
			bit_or_feature_name_not_void: Result /= Void
		end

	bit_shift_left_feature_name: ET_FEATURE_NAME
			-- 'bit_shift_left' feature name
		once
			create {ET_IDENTIFIER} Result.make (bit_shift_left_name)
		ensure
			bit_shift_left_feature_name_not_void: Result /= Void
		end

	bit_shift_right_feature_name: ET_FEATURE_NAME
			-- 'bit_shift_right' feature name
		once
			create {ET_IDENTIFIER} Result.make (bit_shift_right_name)
		ensure
			bit_shift_right_feature_name_not_void: Result /= Void
		end

	bit_xor_feature_name: ET_FEATURE_NAME
			-- 'bit_xor' feature name
		once
			create {ET_IDENTIFIER} Result.make (bit_xor_name)
		ensure
			bit_xor_feature_name_not_void: Result /= Void
		end

	boolean_bytes_feature_name: ET_FEATURE_NAME
			-- 'boolean_bytes' feature name
		once
			create {ET_IDENTIFIER} Result.make (boolean_bytes_name)
		ensure
			boolean_bytes_feature_name_not_void: Result /= Void
		end

	boolean_item_feature_name: ET_FEATURE_NAME
			-- 'boolean_item' feature name
		once
			create {ET_IDENTIFIER} Result.make (boolean_item_name)
		ensure
			boolean_item_feature_name_not_void: Result /= Void
		end

	boolean_field_feature_name: ET_FEATURE_NAME
			-- 'boolean_field' feature name
		once
			create {ET_IDENTIFIER} Result.make (boolean_field_name)
		ensure
			boolean_field_feature_name_not_void: Result /= Void
		end

	call_feature_name: ET_FEATURE_NAME
			-- 'call' feature name
		once
			create {ET_IDENTIFIER} Result.make (call_name)
		ensure
			call_feature_name_not_void: Result /= Void
		end

	capacity_feature_name: ET_FEATURE_NAME
			-- 'capacity' feature name
		once
			create {ET_IDENTIFIER} Result.make (capacity_name)
		ensure
			capacity_feature_name_not_void: Result /= Void
		end

	ceiling_real_32_feature_name: ET_FEATURE_NAME
			-- 'ceiling_real_32' feature name
		once
			create {ET_IDENTIFIER} Result.make (ceiling_real_32_name)
		ensure
			ceiling_real_32_feature_name_not_void: Result /= Void
		end

	ceiling_real_64_feature_name: ET_FEATURE_NAME
			-- 'ceiling_real_64' feature name
		once
			create {ET_IDENTIFIER} Result.make (ceiling_real_64_name)
		ensure
			ceiling_real_64_feature_name_not_void: Result /= Void
		end

	character_8_item_feature_name: ET_FEATURE_NAME
			-- 'character_8_item' feature name
		once
			create {ET_IDENTIFIER} Result.make (character_8_item_name)
		ensure
			character_8_item_feature_name_not_void: Result /= Void
		end

	character_8_field_feature_name: ET_FEATURE_NAME
			-- 'character_8_field' feature name
		once
			create {ET_IDENTIFIER} Result.make (character_8_field_name)
		ensure
			character_8_field_feature_name_not_void: Result /= Void
		end

	character_32_item_feature_name: ET_FEATURE_NAME
			-- 'character_32_item' feature name
		once
			create {ET_IDENTIFIER} Result.make (character_32_item_name)
		ensure
			character_32_item_feature_name_not_void: Result /= Void
		end

	character_32_field_feature_name: ET_FEATURE_NAME
			-- 'character_32_field' feature name
		once
			create {ET_IDENTIFIER} Result.make (character_32_field_name)
		ensure
			character_32_field_feature_name_not_void: Result /= Void
		end

	character_bytes_feature_name: ET_FEATURE_NAME
			-- 'character_bytes' feature name
		once
			create {ET_IDENTIFIER} Result.make (character_bytes_name)
		ensure
			character_bytes_feature_name_not_void: Result /= Void
		end

	closed_operands_feature_name: ET_FEATURE_NAME
			-- 'closed_operands' feature name
		once
			create {ET_IDENTIFIER} Result.make (closed_operands_name)
		ensure
			closed_operands_feature_name_not_void: Result /= Void
		end

	code_feature_name: ET_FEATURE_NAME
			-- 'code' feature name
		once
			create {ET_IDENTIFIER} Result.make (code_name)
		ensure
			code_feature_name_not_void: Result /= Void
		end

	conforms_to_feature_name: ET_FEATURE_NAME
			-- 'conforms_to' feature name
		once
			create {ET_IDENTIFIER} Result.make (conforms_to_name)
		ensure
			conforms_to_feature_name_not_void: Result /= Void
		end

	conjuncted_feature_name: ET_FEATURE_NAME
			-- 'conjuncted' feature name
		once
			create {ET_IDENTIFIER} Result.make (conjuncted_name)
		ensure
			conjuncted_feature_name_not_void: Result /= Void
		end

	conjuncted_semistrict_feature_name: ET_FEATURE_NAME
			-- 'conjuncted_semistrict' feature name
		once
			create {ET_IDENTIFIER} Result.make (conjuncted_semistrict_name)
		ensure
			conjuncted_semistrict_feature_name_not_void: Result /= Void
		end

	copy_feature_name: ET_FEATURE_NAME
			-- 'copy' feature name
		once
			create {ET_IDENTIFIER} Result.make (copy_name)
		ensure
			copy_feature_name_not_void: Result /= Void
		end

	count_feature_name: ET_FEATURE_NAME
			-- 'count' feature name
		once
			create {ET_IDENTIFIER} Result.make (count_name)
		ensure
			count_feature_name_not_void: Result /= Void
		end

	deep_twin_feature_name: ET_FEATURE_NAME
			-- 'deep_twin' feature name
		once
			create {ET_IDENTIFIER} Result.make (deep_twin_name)
		ensure
			deep_twin_feature_name_not_void: Result /= Void
		end

	default_feature_name: ET_FEATURE_NAME
			-- 'default' feature name
		once
			create {ET_IDENTIFIER} Result.make (default_name)
		ensure
			default_feature_name_not_void: Result /= Void
		end

	default_create_feature_name: ET_FEATURE_NAME
			-- 'default_create' feature name
		once
			create {ET_IDENTIFIER} Result.make (default_create_name)
		ensure
			default_create_feature_name_not_void: Result /= Void
		end

	disjuncted_feature_name: ET_FEATURE_NAME
			-- 'disjuncted' feature name
		once
			create {ET_IDENTIFIER} Result.make (disjuncted_name)
		ensure
			disjuncted_feature_name_not_void: Result /= Void
		end

	disjuncted_exclusive_feature_name: ET_FEATURE_NAME
			-- 'disjuncted' feature name
		once
			create {ET_IDENTIFIER} Result.make (disjuncted_exclusive_name)
		ensure
			disjuncted_exclusive_feature_name_not_void: Result /= Void
		end

	disjuncted_semistrict_feature_name: ET_FEATURE_NAME
			-- 'disjuncted_semistrict' feature name
		once
			create {ET_IDENTIFIER} Result.make (disjuncted_semistrict_name)
		ensure
			disjuncted_semistrict_feature_name_not_void: Result /= Void
		end

	dispose_feature_name: ET_FEATURE_NAME
			-- 'dispose' feature name
		once
			create {ET_IDENTIFIER} Result.make (dispose_name)
		ensure
			dispose_feature_name_not_void: Result /= Void
		end

	double_bytes_feature_name: ET_FEATURE_NAME
			-- 'double_bytes' feature name
		once
			create {ET_IDENTIFIER} Result.make (double_bytes_name)
		ensure
			double_bytes_feature_name_not_void: Result /= Void
		end

	eif_id_object_feature_name: ET_FEATURE_NAME
			-- 'eif_id_object' feature name
		once
			create {ET_IDENTIFIER} Result.make (eif_id_object_name)
		ensure
			eif_id_object_feature_name_not_void: Result /= Void
		end

	eif_object_id_feature_name: ET_FEATURE_NAME
			-- 'eif_object_id' feature name
		once
			create {ET_IDENTIFIER} Result.make (eif_object_id_name)
		ensure
			eif_object_id_feature_name_not_void: Result /= Void
		end

	eif_object_id_free_feature_name: ET_FEATURE_NAME
			-- 'eif_object_id_free' feature name
		once
			create {ET_IDENTIFIER} Result.make (eif_object_id_free_name)
		ensure
			eif_object_id_free_feature_name_not_void: Result /= Void
		end

	element_size_feature_name: ET_FEATURE_NAME
			-- 'element_size' feature name
		once
			create {ET_IDENTIFIER} Result.make (element_size_name)
		ensure
			element_size_feature_name_not_void: Result /= Void
		end

	extend_feature_name: ET_FEATURE_NAME
			-- 'extend' feature name
		once
			create {ET_IDENTIFIER} Result.make (extend_name)
		ensure
			extend_feature_name_not_void: Result /= Void
		end

	field_feature_name: ET_FEATURE_NAME
			-- 'field' feature name
		once
			create {ET_IDENTIFIER} Result.make (field_name)
		ensure
			field_feature_name_not_void: Result /= Void
		end

	field_count_feature_name: ET_FEATURE_NAME
			-- 'field_count' feature name
		once
			create {ET_IDENTIFIER} Result.make (field_count_name)
		ensure
			field_count_feature_name_not_void: Result /= Void
		end

	field_name_feature_name: ET_FEATURE_NAME
			-- 'field_name' feature name
		once
			create {ET_IDENTIFIER} Result.make (field_name_name)
		ensure
			field_name_feature_name_not_void: Result /= Void
		end

	field_static_type_feature_name: ET_FEATURE_NAME
			-- 'field_static_type' feature name
		once
			create {ET_IDENTIFIER} Result.make (field_static_type_name)
		ensure
			field_static_type_feature_name_not_void: Result /= Void
		end

	field_type_feature_name: ET_FEATURE_NAME
			-- 'field_type' feature name
		once
			create {ET_IDENTIFIER} Result.make (field_type_name)
		ensure
			field_type_feature_name_not_void: Result /= Void
		end

	find_referers_feature_name: ET_FEATURE_NAME
			-- 'find_referers' feature name
		once
			create {ET_IDENTIFIER} Result.make (find_referers_name)
		ensure
			find_referers_feature_name_not_void: Result /= Void
		end

	floor_real_32_feature_name: ET_FEATURE_NAME
			-- 'floor_real_32' feature name
		once
			create {ET_IDENTIFIER} Result.make (floor_real_32_name)
		ensure
			floor_real_32_feature_name_not_void: Result /= Void
		end

	floor_real_64_feature_name: ET_FEATURE_NAME
			-- 'floor_real_64' feature name
		once
			create {ET_IDENTIFIER} Result.make (floor_real_64_name)
		ensure
			floor_real_64_feature_name_not_void: Result /= Void
		end

	forth_feature_name: ET_FEATURE_NAME
			-- 'forth' feature name
		once
			create {ET_IDENTIFIER} Result.make (forth_name)
		ensure
			forth_feature_name_not_void: Result /= Void
		end

	free_feature_name: ET_FEATURE_NAME
			-- 'free' feature name
		once
			create {ET_IDENTIFIER} Result.make (free_name)
		ensure
			free_feature_name_not_void: Result /= Void
		end

	generating_type_feature_name: ET_FEATURE_NAME
			-- 'generating_type' feature name
		once
			create {ET_IDENTIFIER} Result.make (generating_type_name)
		ensure
			generating_type_feature_name_not_void: Result /= Void
		end

	generator_feature_name: ET_FEATURE_NAME
			-- 'generator' feature name
		once
			create {ET_IDENTIFIER} Result.make (generator_name)
		ensure
			generator_feature_name_not_void: Result /= Void
		end

	generic_parameter_count_feature_name: ET_FEATURE_NAME
			-- 'generic_parameter_count' feature name
		once
			create {ET_IDENTIFIER} Result.make (generic_parameter_count_name)
		ensure
			generic_parameter_count_feature_name_not_void: Result /= Void
		end

	generic_parameter_type_feature_name: ET_FEATURE_NAME
			-- 'generic_parameter_type' feature name
		once
			create {ET_IDENTIFIER} Result.make (generic_parameter_type_name)
		ensure
			generic_parameter_type_feature_name_not_void: Result /= Void
		end
		
	has_default_feature_name: ET_FEATURE_NAME
			-- 'has_default' feature name
		once
			create {ET_IDENTIFIER} Result.make (has_default_name)
		ensure
			has_default_feature_name_not_void: Result /= Void
		end

	hash_code_feature_name: ET_FEATURE_NAME
			-- 'hash_code' feature name
		once
			create {ET_IDENTIFIER} Result.make (hash_code_name)
		ensure
			hash_code_feature_name_not_void: Result /= Void
		end

	i_th_argument_pointer_feature_name: ET_FEATURE_NAME
			-- 'i_th_argument_pointer' feature name
		once
			create {ET_IDENTIFIER} Result.make (i_th_argument_pointer_name)
		ensure
			i_th_argument_pointer_feature_name_not_void: Result /= Void
		end

	i_th_argument_string_feature_name: ET_FEATURE_NAME
			-- 'i_th_argument_string' feature name
		once
			create {ET_IDENTIFIER} Result.make (i_th_argument_string_name)
		ensure
			i_th_argument_string_feature_name_not_void: Result /= Void
		end

	identity_feature_name: ET_FEATURE_NAME
			-- 'identity' feature name
		once
			create {ET_IDENTIFIER} Result.make (identity_name)
		ensure
			identity_feature_name_not_void: Result /= Void
		end

	implication_feature_name: ET_FEATURE_NAME
			-- 'implication' feature name
		once
			create {ET_IDENTIFIER} Result.make (implication_name)
		ensure
			implication_feature_name_not_void: Result /= Void
		end

	infix_and_feature_name: ET_FEATURE_NAME
			-- 'infix "and"' feature name
		local
			l_string: ET_REGULAR_MANIFEST_STRING
		once
			create l_string.make (and_keyword_name)
			create {ET_INFIX_NAME} Result.make_and (l_string)
		ensure
			infix_and_feature_name_not_void: Result /= Void
		end

	infix_and_then_feature_name: ET_FEATURE_NAME
			-- 'infix "and then"' feature name
		local
			l_string: ET_REGULAR_MANIFEST_STRING
		once
			create l_string.make (and_then_keywords_name)
			create {ET_INFIX_NAME} Result.make_and_then (l_string)
		ensure
			infix_and_then_feature_name_not_void: Result /= Void
		end

	infix_at_feature_name: ET_FEATURE_NAME
			-- 'infix "@"' feature name
		local
			l_string: ET_REGULAR_MANIFEST_STRING
		once
			create l_string.make (at_symbol_name)
			create {ET_INFIX_FREE_NAME} Result.make (l_string)
		ensure
			infix_at_feature_name_not_void: Result /= Void
		end

	infix_div_feature_name: ET_FEATURE_NAME
			-- 'infix "//"' feature name
		local
			l_string: ET_REGULAR_MANIFEST_STRING
		once
			create l_string.make (div_symbol_name)
			create {ET_INFIX_NAME} Result.make_div (l_string)
		ensure
			infix_div_feature_name_not_void: Result /= Void
		end

	infix_divide_feature_name: ET_FEATURE_NAME
			-- 'infix "/"' feature name
		local
			l_string: ET_REGULAR_MANIFEST_STRING
		once
			create l_string.make (divide_symbol_name)
			create {ET_INFIX_NAME} Result.make_divide (l_string)
		ensure
			infix_divide_feature_name_not_void: Result /= Void
		end

	infix_ge_feature_name: ET_FEATURE_NAME
			-- 'infix ">="' feature name
		local
			l_string: ET_REGULAR_MANIFEST_STRING
		once
			create l_string.make (le_symbol_name)
			create {ET_INFIX_NAME} Result.make_ge (l_string)
		ensure
			infix_ge_feature_name_not_void: Result /= Void
		end

	infix_gt_feature_name: ET_FEATURE_NAME
			-- 'infix ">"' feature name
		local
			l_string: ET_REGULAR_MANIFEST_STRING
		once
			create l_string.make (gt_symbol_name)
			create {ET_INFIX_NAME} Result.make_gt (l_string)
		ensure
			infix_gt_feature_name_not_void: Result /= Void
		end

	infix_implies_feature_name: ET_FEATURE_NAME
			-- 'infix "implies"' feature name
		local
			l_string: ET_REGULAR_MANIFEST_STRING
		once
			create l_string.make (implies_keyword_name)
			create {ET_INFIX_NAME} Result.make_implies (l_string)
		ensure
			infix_implies_feature_name_not_void: Result /= Void
		end

	infix_le_feature_name: ET_FEATURE_NAME
			-- 'infix "<="' feature name
		local
			l_string: ET_REGULAR_MANIFEST_STRING
		once
			create l_string.make (le_symbol_name)
			create {ET_INFIX_NAME} Result.make_le (l_string)
		ensure
			infix_le_feature_name_not_void: Result /= Void
		end

	infix_lt_feature_name: ET_FEATURE_NAME
			-- 'infix "<"' feature name
		local
			l_string: ET_REGULAR_MANIFEST_STRING
		once
			create l_string.make (lt_symbol_name)
			create {ET_INFIX_NAME} Result.make_lt (l_string)
		ensure
			infix_lt_feature_name_not_void: Result /= Void
		end

	infix_minus_feature_name: ET_FEATURE_NAME
			-- 'infix "-"' feature name
		local
			l_string: ET_REGULAR_MANIFEST_STRING
		once
			create l_string.make (minus_symbol_name)
			create {ET_INFIX_NAME} Result.make_minus (l_string)
		ensure
			infix_minus_feature_name_not_void: Result /= Void
		end

	infix_mod_feature_name: ET_FEATURE_NAME
			-- 'infix "\\"' feature name
		local
			l_string: ET_REGULAR_MANIFEST_STRING
		once
			create l_string.make (mod_symbol_name)
			create {ET_INFIX_NAME} Result.make_mod (l_string)
		ensure
			infix_mod_feature_name_not_void: Result /= Void
		end

	infix_or_feature_name: ET_FEATURE_NAME
			-- 'infix "or"' feature name
		local
			l_string: ET_REGULAR_MANIFEST_STRING
		once
			create l_string.make (or_keyword_name)
			create {ET_INFIX_NAME} Result.make_or (l_string)
		ensure
			infix_or_feature_name_not_void: Result /= Void
		end

	infix_or_else_feature_name: ET_FEATURE_NAME
			-- 'infix "or else"' feature name
		local
			l_string: ET_REGULAR_MANIFEST_STRING
		once
			create l_string.make (or_else_keywords_name)
			create {ET_INFIX_NAME} Result.make_or_else (l_string)
		ensure
			infix_or_else_feature_name_not_void: Result /= Void
		end

	infix_plus_feature_name: ET_FEATURE_NAME
			-- 'infix "+"' feature name
		local
			l_string: ET_REGULAR_MANIFEST_STRING
		once
			create l_string.make (plus_symbol_name)
			create {ET_INFIX_NAME} Result.make_plus (l_string)
		ensure
			infix_plus_feature_name_not_void: Result /= Void
		end

	infix_power_feature_name: ET_FEATURE_NAME
			-- 'infix "^"' feature name
		local
			l_string: ET_REGULAR_MANIFEST_STRING
		once
			create l_string.make (power_symbol_name)
			create {ET_INFIX_NAME} Result.make_power (l_string)
		ensure
			infix_power_feature_name_not_void: Result /= Void
		end

	infix_times_feature_name: ET_FEATURE_NAME
			-- 'infix "*"' feature name
		local
			l_string: ET_REGULAR_MANIFEST_STRING
		once
			create l_string.make (times_symbol_name)
			create {ET_INFIX_NAME} Result.make_times (l_string)
		ensure
			infix_times_feature_name_not_void: Result /= Void
		end

	infix_xor_feature_name: ET_FEATURE_NAME
			-- 'infix "xor"' feature name
		local
			l_string: ET_REGULAR_MANIFEST_STRING
		once
			create l_string.make (xor_keyword_name)
			create {ET_INFIX_NAME} Result.make_xor (l_string)
		ensure
			infix_xor_feature_name_not_void: Result /= Void
		end

	integer_8_item_feature_name: ET_FEATURE_NAME
			-- 'integer_8_item' feature name
		once
			create {ET_IDENTIFIER} Result.make (integer_8_item_name)
		ensure
			integer_8_item_feature_name_not_void: Result /= Void
		end

	integer_8_field_feature_name: ET_FEATURE_NAME
			-- 'integer_8_field' feature name
		once
			create {ET_IDENTIFIER} Result.make (integer_8_field_name)
		ensure
			integer_8_field_feature_name_not_void: Result /= Void
		end

	integer_16_item_feature_name: ET_FEATURE_NAME
			-- 'integer_16_item' feature name
		once
			create {ET_IDENTIFIER} Result.make (integer_16_item_name)
		ensure
			integer_16_item_feature_name_not_void: Result /= Void
		end

	integer_16_field_feature_name: ET_FEATURE_NAME
			-- 'integer_16_field' feature name
		once
			create {ET_IDENTIFIER} Result.make (integer_16_field_name)
		ensure
			integer_16_field_feature_name_not_void: Result /= Void
		end

	integer_32_item_feature_name: ET_FEATURE_NAME
			-- 'integer_32_item' feature name
		once
			create {ET_IDENTIFIER} Result.make (integer_32_item_name)
		ensure
			integer_32_item_feature_name_not_void: Result /= Void
		end

	integer_32_field_feature_name: ET_FEATURE_NAME
			-- 'integer_32_field' feature name
		once
			create {ET_IDENTIFIER} Result.make (integer_32_field_name)
		ensure
			integer_32_field_feature_name_not_void: Result /= Void
		end

	integer_64_item_feature_name: ET_FEATURE_NAME
			-- 'integer_64_item' feature name
		once
			create {ET_IDENTIFIER} Result.make (integer_64_item_name)
		ensure
			integer_64_item_feature_name_not_void: Result /= Void
		end

	integer_64_field_feature_name: ET_FEATURE_NAME
			-- 'integer_64_field' feature name
		once
			create {ET_IDENTIFIER} Result.make (integer_64_field_name)
		ensure
			integer_64_field_feature_name_not_void: Result /= Void
		end

	integer_bytes_feature_name: ET_FEATURE_NAME
			-- 'integer_bytes' feature name
		once
			create {ET_IDENTIFIER} Result.make (integer_bytes_name)
		ensure
			integer_bytes_feature_name_not_void: Result /= Void
		end

	integer_quotient_feature_name: ET_FEATURE_NAME
			-- 'integer_quotient' feature name
		once
			create {ET_IDENTIFIER} Result.make (integer_quotient_name)
		ensure
			integer_quotient_feature_name_not_void: Result /= Void
		end

	integer_remainder_feature_name: ET_FEATURE_NAME
			-- 'integer_remainder' feature name
		once
			create {ET_IDENTIFIER} Result.make (integer_remainder_name)
		ensure
			integer_remainder_feature_name_not_void: Result /= Void
		end

	invariant_feature_name: ET_FEATURE_NAME
			-- Fictitious 'invariant' feature name
		once
			create {ET_IDENTIFIER} Result.make (invariant_keyword_name)
		ensure
			invariant_feature_name_not_void: Result /= Void
		end

	is_deep_equal_feature_name: ET_FEATURE_NAME
			-- 'is_deep_equal' feature name
		once
			create {ET_IDENTIFIER} Result.make (is_deep_equal_name)
		ensure
			is_deep_equal_feature_name_not_void: Result /= Void
		end

	is_default_pointer_feature_name: ET_FEATURE_NAME
			-- 'is_default_pointer' feature name
		once
			create {ET_IDENTIFIER} Result.make (is_default_pointer_name)
		ensure
			is_default_pointer_feature_name_not_void: Result /= Void
		end

	is_dotnet_feature_name: ET_FEATURE_NAME
			-- 'is_dotnet' feature name
		once
			create {ET_IDENTIFIER} Result.make (is_dotnet_name)
		ensure
			is_dotnet_feature_name_not_void: Result /= Void
		end

	is_equal_feature_name: ET_FEATURE_NAME
			-- 'is_equal' feature name
		once
			create {ET_IDENTIFIER} Result.make (is_equal_name)
		ensure
			is_equal_feature_name_not_void: Result /= Void
		end

	is_expanded_feature_name: ET_FEATURE_NAME
			-- 'is_expanded' feature name
		once
			create {ET_IDENTIFIER} Result.make (is_expanded_name)
		ensure
			is_expanded_feature_name_not_void: Result /= Void
		end

	is_less_feature_name: ET_FEATURE_NAME
			-- 'is_less' feature name
		once
			create {ET_IDENTIFIER} Result.make (is_less_name)
		ensure
			is_less_feature_name_not_void: Result /= Void
		end

	is_mac_feature_name: ET_FEATURE_NAME
			-- 'is_mac' feature name
		once
			create {ET_IDENTIFIER} Result.make (is_mac_name)
		ensure
			is_mac_feature_name_not_void: Result /= Void
		end

	is_nan_feature_name: ET_FEATURE_NAME
			-- 'is_nan' feature name
		once
			create {ET_IDENTIFIER} Result.make (is_nan_name)
		ensure
			is_nan_feature_name_not_void: Result /= Void
		end

	is_negative_infinity_feature_name: ET_FEATURE_NAME
			-- 'is_negative_infinity' feature name
		once
			create {ET_IDENTIFIER} Result.make (is_negative_infinity_name)
		ensure
			is_negative_infinity_feature_name_not_void: Result /= Void
		end

	is_positive_infinity_feature_name: ET_FEATURE_NAME
			-- 'is_positive_infinity' feature name
		once
			create {ET_IDENTIFIER} Result.make (is_positive_infinity_name)
		ensure
			is_positive_infinity_feature_name_not_void: Result /= Void
		end

	is_scoop_capable_feature_name: ET_FEATURE_NAME
			-- 'is_scoop_capable' feature name
		once
			create {ET_IDENTIFIER} Result.make (is_scoop_capable_name)
		ensure
			is_scoop_capable_feature_name_not_void: Result /= Void
		end

	is_target_closed_feature_name: ET_FEATURE_NAME
			-- 'is_target_closed' feature name
		once
			create {ET_IDENTIFIER} Result.make (is_target_closed_name)
		ensure
			is_target_closed_feature_name_not_void: Result /= Void
		end

	is_thread_capable_feature_name: ET_FEATURE_NAME
			-- 'is_thread_capable' feature name
		once
			create {ET_IDENTIFIER} Result.make (is_thread_capable_name)
		ensure
			is_thread_capable_feature_name_not_void: Result /= Void
		end

	is_unix_feature_name: ET_FEATURE_NAME
			-- 'is_unix' feature name
		once
			create {ET_IDENTIFIER} Result.make (is_unix_name)
		ensure
			is_unix_feature_name_not_void: Result /= Void
		end

	is_vms_feature_name: ET_FEATURE_NAME
			-- 'is_vms' feature name
		once
			create {ET_IDENTIFIER} Result.make (is_vms_name)
		ensure
			is_vms_feature_name_not_void: Result /= Void
		end

	is_vxworks_feature_name: ET_FEATURE_NAME
			-- 'is_vxworks' feature name
		once
			create {ET_IDENTIFIER} Result.make (is_vxworks_name)
		ensure
			is_vxworks_feature_name_not_void: Result /= Void
		end

	is_windows_feature_name: ET_FEATURE_NAME
			-- 'is_windowsvms' feature name
		once
			create {ET_IDENTIFIER} Result.make (is_windows_name)
		ensure
			is_windows_feature_name_not_void: Result /= Void
		end

	item_feature_name: ET_FEATURE_NAME
			-- 'item' feature name
		once
			create {ET_IDENTIFIER} Result.make (item_name)
		ensure
			item_feature_name_not_void: Result /= Void
		end

	item_code_feature_name: ET_FEATURE_NAME
			-- 'item_code' feature name
		once
			create {ET_IDENTIFIER} Result.make (item_code_name)
		ensure
			item_code_feature_name_not_void: Result /= Void
		end

	last_result_feature_name: ET_FEATURE_NAME
			-- 'last_result' feature name
		once
			create {ET_IDENTIFIER} Result.make (last_result_name)
		ensure
			last_result_feature_name_not_void: Result /= Void
		end

	lower_feature_name: ET_FEATURE_NAME
			-- 'lower' feature name
		once
			create {ET_IDENTIFIER} Result.make (lower_name)
		ensure
			lower_feature_name_not_void: Result /= Void
		end

	make_feature_name: ET_FEATURE_NAME
			-- 'make' feature name
		once
			create {ET_IDENTIFIER} Result.make (make_name)
		ensure
			make_feature_name_not_void: Result /= Void
		end

	make_empty_feature_name: ET_FEATURE_NAME
			-- 'make_empty' feature name
		once
			create {ET_IDENTIFIER} Result.make (make_empty_name)
		ensure
			make_empty_feature_name_not_void: Result /= Void
		end

	max_type_id_feature_name: ET_FEATURE_NAME
			-- 'max_type_id' feature name
		once
			create {ET_IDENTIFIER} Result.make (max_type_id_name)
		ensure
			max_type_id_feature_name_not_void: Result /= Void
		end

	minus_feature_name: ET_FEATURE_NAME
			-- 'minus' feature name
		once
			create {ET_IDENTIFIER} Result.make (minus_name)
		ensure
			minus_feature_name_not_void: Result /= Void
		end

	name_feature_name: ET_FEATURE_NAME
			-- 'name' feature name
		once
			create {ET_IDENTIFIER} Result.make (name_name)
		ensure
			name_feature_name_not_void: Result /= Void
		end

	nan_feature_name: ET_FEATURE_NAME
			-- 'nan' feature name
		once
			create {ET_IDENTIFIER} Result.make (nan_name)
		ensure
			nan_feature_name_not_void: Result /= Void
		end

	natural_8_item_feature_name: ET_FEATURE_NAME
			-- 'natural_8_item' feature name
		once
			create {ET_IDENTIFIER} Result.make (natural_8_item_name)
		ensure
			natural_8_item_feature_name_not_void: Result /= Void
		end

	natural_8_field_feature_name: ET_FEATURE_NAME
			-- 'natural_8_field' feature name
		once
			create {ET_IDENTIFIER} Result.make (natural_8_field_name)
		ensure
			natural_8_field_feature_name_not_void: Result /= Void
		end

	natural_16_item_feature_name: ET_FEATURE_NAME
			-- 'natural_16_item' feature name
		once
			create {ET_IDENTIFIER} Result.make (natural_16_item_name)
		ensure
			natural_16_item_feature_name_not_void: Result /= Void
		end

	natural_16_field_feature_name: ET_FEATURE_NAME
			-- 'natural_16_field' feature name
		once
			create {ET_IDENTIFIER} Result.make (natural_16_field_name)
		ensure
			natural_16_field_feature_name_not_void: Result /= Void
		end

	natural_32_code_feature_name: ET_FEATURE_NAME
			-- 'natural_32_code' feature name
		once
			create {ET_IDENTIFIER} Result.make (natural_32_code_name)
		ensure
			natural_32_code_feature_name_not_void: Result /= Void
		end

	natural_32_item_feature_name: ET_FEATURE_NAME
			-- 'natural_32_item' feature name
		once
			create {ET_IDENTIFIER} Result.make (natural_32_item_name)
		ensure
			natural_32_item_feature_name_not_void: Result /= Void
		end

	natural_32_field_feature_name: ET_FEATURE_NAME
			-- 'natural_32_field' feature name
		once
			create {ET_IDENTIFIER} Result.make (natural_32_field_name)
		ensure
			natural_32_field_feature_name_not_void: Result /= Void
		end

	natural_64_item_feature_name: ET_FEATURE_NAME
			-- 'natural_64_item' feature name
		once
			create {ET_IDENTIFIER} Result.make (natural_64_item_name)
		ensure
			natural_64_item_feature_name_not_void: Result /= Void
		end

	natural_64_field_feature_name: ET_FEATURE_NAME
			-- 'natural_64_field' feature name
		once
			create {ET_IDENTIFIER} Result.make (natural_64_field_name)
		ensure
			natural_64_field_feature_name_not_void: Result /= Void
		end

	negated_feature_name: ET_FEATURE_NAME
			-- 'negated' feature name
		once
			create {ET_IDENTIFIER} Result.make (negated_name)
		ensure
			negated_feature_name_not_void: Result /= Void
		end

	negative_infinity_feature_name: ET_FEATURE_NAME
			-- 'negative_infinity' feature name
		once
			create {ET_IDENTIFIER} Result.make (negative_infinity_name)
		ensure
			negative_infinity_feature_name_not_void: Result /= Void
		end

	new_cursor_feature_name: ET_FEATURE_NAME
			-- 'new_cursor' feature name
		once
			create {ET_IDENTIFIER} Result.make (new_cursor_name)
		ensure
			new_cursor_feature_name_not_void: Result /= Void
		end

	new_instance_feature_name: ET_FEATURE_NAME
			-- 'new_instance' feature name
		once
			create {ET_IDENTIFIER} Result.make (new_instance_name)
		ensure
			new_instance_feature_name_not_void: Result /= Void
		end

	new_special_any_instance_feature_name: ET_FEATURE_NAME
			-- 'new_special_any_instance' feature name
		once
			create {ET_IDENTIFIER} Result.make (new_special_any_instance_name)
		ensure
			new_special_any_instance_feature_name_not_void: Result /= Void
		end
		
	object_comparison_feature_name: ET_FEATURE_NAME
			-- 'object_comparison' feature name
		once
			create {ET_IDENTIFIER} Result.make (object_comparison_name)
		ensure
			object_comparison_feature_name_not_void: Result /= Void
		end

	opposite_feature_name: ET_FEATURE_NAME
			-- 'opposite' feature name
		once
			create {ET_IDENTIFIER} Result.make (opposite_name)
		ensure
			opposite_feature_name_not_void: Result /= Void
		end

	out_feature_name: ET_FEATURE_NAME
			-- 'out' feature name
		once
			create {ET_IDENTIFIER} Result.make (out_name)
		ensure
			out_feature_name_not_void: Result /= Void
		end

	plus_feature_name: ET_FEATURE_NAME
			-- 'plus' feature name
		once
			create {ET_IDENTIFIER} Result.make (plus_name)
		ensure
			plus_feature_name_not_void: Result /= Void
		end

	pointer_bytes_feature_name: ET_FEATURE_NAME
			-- 'pointer_bytes' feature name
		once
			create {ET_IDENTIFIER} Result.make (pointer_bytes_name)
		ensure
			pointer_bytes_feature_name_not_void: Result /= Void
		end

	pointer_item_feature_name: ET_FEATURE_NAME
			-- 'pointer_item' feature name
		once
			create {ET_IDENTIFIER} Result.make (pointer_item_name)
		ensure
			pointer_item_feature_name_not_void: Result /= Void
		end

	pointer_field_feature_name: ET_FEATURE_NAME
			-- 'pointer_field' feature name
		once
			create {ET_IDENTIFIER} Result.make (pointer_field_name)
		ensure
			pointer_field_feature_name_not_void: Result /= Void
		end

	positive_infinity_feature_name: ET_FEATURE_NAME
			-- 'positive_infinity' feature name
		once
			create {ET_IDENTIFIER} Result.make (positive_infinity_name)
		ensure
			positive_infinity_feature_name_not_void: Result /= Void
		end

	power_feature_name: ET_FEATURE_NAME
			-- 'power' feature name
		once
			create {ET_IDENTIFIER} Result.make (power_name)
		ensure
			power_feature_name_not_void: Result /= Void
		end

	prefix_minus_feature_name: ET_FEATURE_NAME
			-- 'prefix "-"' feature name
		local
			l_string: ET_REGULAR_MANIFEST_STRING
		once
			create l_string.make (minus_symbol_name)
			create {ET_PREFIX_NAME} Result.make_minus (l_string)
		ensure
			prefix_minus_feature_name_not_void: Result /= Void
		end

	prefix_not_feature_name: ET_FEATURE_NAME
			-- 'prefix "not"' feature name
		local
			l_string: ET_REGULAR_MANIFEST_STRING
		once
			create l_string.make (not_keyword_name)
			create {ET_PREFIX_NAME} Result.make_not (l_string)
		ensure
			prefix_not_feature_name_not_void: Result /= Void
		end

	prefix_plus_feature_name: ET_FEATURE_NAME
			-- 'prefix "+"' feature name
		local
			l_string: ET_REGULAR_MANIFEST_STRING
		once
			create l_string.make (plus_symbol_name)
			create {ET_PREFIX_NAME} Result.make_plus (l_string)
		ensure
			prefix_plus_feature_name_not_void: Result /= Void
		end

	product_feature_name: ET_FEATURE_NAME
			-- 'product' feature name
		once
			create {ET_IDENTIFIER} Result.make (product_name)
		ensure
			product_feature_name_not_void: Result /= Void
		end

	put_feature_name: ET_FEATURE_NAME
			-- 'put' feature name
		once
			create {ET_IDENTIFIER} Result.make (put_name)
		ensure
			put_feature_name_not_void: Result /= Void
		end

	put_boolean_feature_name: ET_FEATURE_NAME
			-- 'put_boolean' feature name
		once
			create {ET_IDENTIFIER} Result.make (put_boolean_name)
		ensure
			put_boolean_feature_name_not_void: Result /= Void
		end

	put_character_8_feature_name: ET_FEATURE_NAME
			-- 'put_character_8' feature name
		once
			create {ET_IDENTIFIER} Result.make (put_character_8_name)
		ensure
			put_character_8_feature_name_not_void: Result /= Void
		end

	put_character_32_feature_name: ET_FEATURE_NAME
			-- 'put_character_32' feature name
		once
			create {ET_IDENTIFIER} Result.make (put_character_32_name)
		ensure
			put_character_32_feature_name_not_void: Result /= Void
		end

	put_integer_8_feature_name: ET_FEATURE_NAME
			-- 'put_integer_8' feature name
		once
			create {ET_IDENTIFIER} Result.make (put_integer_8_name)
		ensure
			put_integer_8_feature_name_not_void: Result /= Void
		end

	put_integer_16_feature_name: ET_FEATURE_NAME
			-- 'put_integer_16' feature name
		once
			create {ET_IDENTIFIER} Result.make (put_integer_16_name)
		ensure
			put_integer_16_feature_name_not_void: Result /= Void
		end

	put_integer_32_feature_name: ET_FEATURE_NAME
			-- 'put_integer_32' feature name
		once
			create {ET_IDENTIFIER} Result.make (put_integer_32_name)
		ensure
			put_integer_32_feature_name_not_void: Result /= Void
		end

	put_integer_64_feature_name: ET_FEATURE_NAME
			-- 'put_integer_64' feature name
		once
			create {ET_IDENTIFIER} Result.make (put_integer_64_name)
		ensure
			put_integer_64_feature_name_not_void: Result /= Void
		end

	put_natural_8_feature_name: ET_FEATURE_NAME
			-- 'put_natural_8' feature name
		once
			create {ET_IDENTIFIER} Result.make (put_natural_8_name)
		ensure
			put_natural_8_feature_name_not_void: Result /= Void
		end

	put_natural_16_feature_name: ET_FEATURE_NAME
			-- 'put_natural_16' feature name
		once
			create {ET_IDENTIFIER} Result.make (put_natural_16_name)
		ensure
			put_natural_16_feature_name_not_void: Result /= Void
		end

	put_natural_32_feature_name: ET_FEATURE_NAME
			-- 'put_natural_32' feature name
		once
			create {ET_IDENTIFIER} Result.make (put_natural_32_name)
		ensure
			put_natural_32_feature_name_not_void: Result /= Void
		end

	put_natural_64_feature_name: ET_FEATURE_NAME
			-- 'put_natural_64' feature name
		once
			create {ET_IDENTIFIER} Result.make (put_natural_64_name)
		ensure
			put_natural_64_feature_name_not_void: Result /= Void
		end

	put_pointer_feature_name: ET_FEATURE_NAME
			-- 'put_pointer' feature name
		once
			create {ET_IDENTIFIER} Result.make (put_pointer_name)
		ensure
			put_pointer_feature_name_not_void: Result /= Void
		end

	put_real_32_feature_name: ET_FEATURE_NAME
			-- 'put_real_32' feature name
		once
			create {ET_IDENTIFIER} Result.make (put_real_32_name)
		ensure
			put_real_32_feature_name_not_void: Result /= Void
		end

	put_real_64_feature_name: ET_FEATURE_NAME
			-- 'put_real_64' feature name
		once
			create {ET_IDENTIFIER} Result.make (put_real_64_name)
		ensure
			put_real_64_feature_name_not_void: Result /= Void
		end

	put_reference_feature_name: ET_FEATURE_NAME
			-- 'put_reference' feature name
		once
			create {ET_IDENTIFIER} Result.make (put_reference_name)
		ensure
			put_reference_feature_name_not_void: Result /= Void
		end

	quotient_feature_name: ET_FEATURE_NAME
			-- 'quotient' feature name
		once
			create {ET_IDENTIFIER} Result.make (quotient_name)
		ensure
			quotient_feature_name_not_void: Result /= Void
		end

	real_32_item_feature_name: ET_FEATURE_NAME
			-- 'real_32_item' feature name
		once
			create {ET_IDENTIFIER} Result.make (real_32_item_name)
		ensure
			real_32_item_feature_name_not_void: Result /= Void
		end

	real_32_field_feature_name: ET_FEATURE_NAME
			-- 'real_32_field' feature name
		once
			create {ET_IDENTIFIER} Result.make (real_32_field_name)
		ensure
			real_32_field_feature_name_not_void: Result /= Void
		end

	real_64_item_feature_name: ET_FEATURE_NAME
			-- 'real_64_item' feature name
		once
			create {ET_IDENTIFIER} Result.make (real_64_item_name)
		ensure
			real_64_item_feature_name_not_void: Result /= Void
		end

	real_64_field_feature_name: ET_FEATURE_NAME
			-- 'real_64_field' feature name
		once
			create {ET_IDENTIFIER} Result.make (real_64_field_name)
		ensure
			real_64_field_feature_name_not_void: Result /= Void
		end

	real_bytes_feature_name: ET_FEATURE_NAME
			-- 'real_bytes' feature name
		once
			create {ET_IDENTIFIER} Result.make (real_bytes_name)
		ensure
			real_bytes_feature_name_not_void: Result /= Void
		end

	reference_item_feature_name: ET_FEATURE_NAME
			-- 'reference_item' feature name
		once
			create {ET_IDENTIFIER} Result.make (reference_item_name)
		ensure
			reference_item_feature_name_not_void: Result /= Void
		end

	runtime_name_feature_name: ET_FEATURE_NAME
			-- 'runtime_name' feature name
		once
			create {ET_IDENTIFIER} Result.make (runtime_name_name)
		ensure
			runtime_name_feature_name_not_void: Result /= Void
		end

	same_type_feature_name: ET_FEATURE_NAME
			-- 'same_type' feature name
		once
			create {ET_IDENTIFIER} Result.make (same_type_name)
		ensure
			same_type_feature_name_not_void: Result /= Void
		end

	set_boolean_field_feature_name: ET_FEATURE_NAME
			-- 'set_boolean_field' feature name
		once
			create {ET_IDENTIFIER} Result.make (set_boolean_field_name)
		ensure
			set_boolean_field_feature_name_not_void: Result /= Void
		end

	set_character_8_field_feature_name: ET_FEATURE_NAME
			-- 'set_character_8_field' feature name
		once
			create {ET_IDENTIFIER} Result.make (set_character_8_field_name)
		ensure
			set_character_8_field_feature_name_not_void: Result /= Void
		end

	set_character_32_field_feature_name: ET_FEATURE_NAME
			-- 'set_character_32_field' feature name
		once
			create {ET_IDENTIFIER} Result.make (set_character_32_field_name)
		ensure
			set_character_32_field_feature_name_not_void: Result /= Void
		end

	set_count_feature_name: ET_FEATURE_NAME
			-- 'set_count' feature name
		once
			create {ET_IDENTIFIER} Result.make (set_count_name)
		ensure
			set_count_feature_name_not_void: Result /= Void
		end

	set_integer_8_field_feature_name: ET_FEATURE_NAME
			-- 'set_integer_8_field' feature name
		once
			create {ET_IDENTIFIER} Result.make (set_integer_8_field_name)
		ensure
			set_integer_8_field_feature_name_not_void: Result /= Void
		end

	set_integer_16_field_feature_name: ET_FEATURE_NAME
			-- 'set_integer_16_field' feature name
		once
			create {ET_IDENTIFIER} Result.make (set_integer_16_field_name)
		ensure
			set_integer_16_field_feature_name_not_void: Result /= Void
		end

	set_integer_32_field_feature_name: ET_FEATURE_NAME
			-- 'set_integer_32_field' feature name
		once
			create {ET_IDENTIFIER} Result.make (set_integer_32_field_name)
		ensure
			set_integer_32_field_feature_name_not_void: Result /= Void
		end

	set_integer_64_field_feature_name: ET_FEATURE_NAME
			-- 'set_integer_64_field' feature name
		once
			create {ET_IDENTIFIER} Result.make (set_integer_64_field_name)
		ensure
			set_integer_64_field_feature_name_not_void: Result /= Void
		end

	set_item_feature_name: ET_FEATURE_NAME
			-- 'set_item' feature name
		once
			create {ET_IDENTIFIER} Result.make (set_item_name)
		ensure
			set_item_feature_name_not_void: Result /= Void
		end

	set_natural_8_field_feature_name: ET_FEATURE_NAME
			-- 'set_natural_8_field' feature name
		once
			create {ET_IDENTIFIER} Result.make (set_natural_8_field_name)
		ensure
			set_natural_8_field_feature_name_not_void: Result /= Void
		end

	set_natural_16_field_feature_name: ET_FEATURE_NAME
			-- 'set_natural_16_field' feature name
		once
			create {ET_IDENTIFIER} Result.make (set_natural_16_field_name)
		ensure
			set_natural_16_field_feature_name_not_void: Result /= Void
		end

	set_natural_32_field_feature_name: ET_FEATURE_NAME
			-- 'set_natural_32_field' feature name
		once
			create {ET_IDENTIFIER} Result.make (set_natural_32_field_name)
		ensure
			set_natural_32_field_feature_name_not_void: Result /= Void
		end

	set_natural_64_field_feature_name: ET_FEATURE_NAME
			-- 'set_natural_64_field' feature name
		once
			create {ET_IDENTIFIER} Result.make (set_natural_64_field_name)
		ensure
			set_natural_64_field_feature_name_not_void: Result /= Void
		end

	set_object_comparison_feature_name: ET_FEATURE_NAME
			-- 'set_object_comparison' feature name
		once
			create {ET_IDENTIFIER} Result.make (set_object_comparison_name)
		ensure
			set_object_comparison_feature_name_not_void: Result /= Void
		end

	set_operands_feature_name: ET_FEATURE_NAME
			-- 'set_operands' feature name
		once
			create {ET_IDENTIFIER} Result.make (set_operands_name)
		ensure
			set_operands_feature_name_not_void: Result /= Void
		end

	set_pointer_field_feature_name: ET_FEATURE_NAME
			-- 'set_pointer_field' feature name
		once
			create {ET_IDENTIFIER} Result.make (set_pointer_field_name)
		ensure
			set_pointer_field_feature_name_not_void: Result /= Void
		end

	set_real_32_field_feature_name: ET_FEATURE_NAME
			-- 'set_real_32_field' feature name
		once
			create {ET_IDENTIFIER} Result.make (set_real_32_field_name)
		ensure
			set_real_32_field_feature_name_not_void: Result /= Void
		end

	set_real_64_field_feature_name: ET_FEATURE_NAME
			-- 'set_real_64_field' feature name
		once
			create {ET_IDENTIFIER} Result.make (set_real_64_field_name)
		ensure
			set_real_64_field_feature_name_not_void: Result /= Void
		end

	set_reference_field_feature_name: ET_FEATURE_NAME
			-- 'set_reference_field' feature name
		once
			create {ET_IDENTIFIER} Result.make (set_reference_field_name)
		ensure
			set_reference_field_feature_name_not_void: Result /= Void
		end

	standard_copy_feature_name: ET_FEATURE_NAME
			-- 'standard_copy' feature name
		once
			create {ET_IDENTIFIER} Result.make (standard_copy_name)
		ensure
			standard_copy_feature_name_not_void: Result /= Void
		end

	standard_is_equal_feature_name: ET_FEATURE_NAME
			-- 'standard_is_equal' feature name
		once
			create {ET_IDENTIFIER} Result.make (standard_is_equal_name)
		ensure
			standard_is_equal_feature_name_not_void: Result /= Void
		end

	standard_twin_feature_name: ET_FEATURE_NAME
			-- 'standard_twin' feature name
		once
			create {ET_IDENTIFIER} Result.make (standard_twin_name)
		ensure
			standard_twin_feature_name_not_void: Result /= Void
		end

	tagged_out_feature_name: ET_FEATURE_NAME
			-- 'tagged_out' feature name
		once
			create {ET_IDENTIFIER} Result.make (tagged_out_name)
		ensure
			tagged_out_feature_name_not_void: Result /= Void
		end

	to_character_feature_name: ET_FEATURE_NAME
			-- 'to_character' feature name
		once
			create {ET_IDENTIFIER} Result.make (to_character_name)
		ensure
			to_character_feature_name_not_void: Result /= Void
		end

	to_character_8_feature_name: ET_FEATURE_NAME
			-- 'to_character_8' feature name
		once
			create {ET_IDENTIFIER} Result.make (to_character_8_name)
		ensure
			to_character_8_feature_name_not_void: Result /= Void
		end

	to_character_32_feature_name: ET_FEATURE_NAME
			-- 'to_character_32' feature name
		once
			create {ET_IDENTIFIER} Result.make (to_character_32_name)
		ensure
			to_character_32_feature_name_not_void: Result /= Void
		end

	to_double_feature_name: ET_FEATURE_NAME
			-- 'to_double' feature name
		once
			create {ET_IDENTIFIER} Result.make (to_double_name)
		ensure
			to_double_feature_name_not_void: Result /= Void
		end

	to_integer_32_feature_name: ET_FEATURE_NAME
			-- 'to_integer_32' feature name
		once
			create {ET_IDENTIFIER} Result.make (to_integer_32_name)
		ensure
			to_integer_32_feature_name_not_void: Result /= Void
		end

	to_real_feature_name: ET_FEATURE_NAME
			-- 'to_real' feature name
		once
			create {ET_IDENTIFIER} Result.make (to_real_name)
		ensure
			to_real_feature_name_not_void: Result /= Void
		end

	to_pointer_feature_name: ET_FEATURE_NAME
			-- 'to_pointer' feature name
		once
			create {ET_IDENTIFIER} Result.make (to_pointer_name)
		ensure
			to_pointer_feature_name_not_void: Result /= Void
		end

	to_real_32_feature_name: ET_FEATURE_NAME
			-- 'to_real_32' feature name
		once
			create {ET_IDENTIFIER} Result.make (to_real_32_name)
		ensure
			to_real_32_feature_name_not_void: Result /= Void
		end

	to_real_64_feature_name: ET_FEATURE_NAME
			-- 'to_real_64' feature name
		once
			create {ET_IDENTIFIER} Result.make (to_real_64_name)
		ensure
			to_real_64_feature_name_not_void: Result /= Void
		end

	truncated_to_integer_feature_name: ET_FEATURE_NAME
			-- 'truncated_to_integer' feature name
		once
			create {ET_IDENTIFIER} Result.make (truncated_to_integer_name)
		ensure
			truncated_to_integer_feature_name_not_void: Result /= Void
		end

	truncated_to_integer_64_feature_name: ET_FEATURE_NAME
			-- 'truncated_to_integer_64' feature name
		once
			create {ET_IDENTIFIER} Result.make (truncated_to_integer_64_name)
		ensure
			truncated_to_integer_64_feature_name_not_void: Result /= Void
		end

	truncated_to_real_feature_name: ET_FEATURE_NAME
			-- 'truncated_to_real' feature name
		once
			create {ET_IDENTIFIER} Result.make (truncated_to_real_name)
		ensure
			truncated_to_real_feature_name_not_void: Result /= Void
		end

	twin_feature_name: ET_FEATURE_NAME
			-- 'twin' feature name
		once
			create {ET_IDENTIFIER} Result.make (twin_name)
		ensure
			twin_feature_name_not_void: Result /= Void
		end

	type_id_feature_name: ET_FEATURE_NAME
			-- 'type_id' feature name
		once
			create {ET_IDENTIFIER} Result.make (type_id_name)
		ensure
			type_id_feature_name_not_void: Result /= Void
		end

	type_of_type_feature_name: ET_FEATURE_NAME
			-- 'type_of_type' feature name
		once
			create {ET_IDENTIFIER} Result.make (type_of_type_name)
		ensure
			type_of_type_feature_name_not_void: Result /= Void
		end

	upper_feature_name: ET_FEATURE_NAME
			-- 'upper' feature name
		once
			create {ET_IDENTIFIER} Result.make (upper_name)
		ensure
			upper_feature_name_not_void: Result /= Void
		end

	void_feature_name: ET_FEATURE_NAME
			-- 'Void' feature name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_void_keyword_name)
		ensure
			void_feature_name_not_void: Result /= Void
		end

	wide_character_bytes_feature_name: ET_FEATURE_NAME
			-- 'wide_charafter_bytesVoid' feature name
		once
			create {ET_IDENTIFIER} Result.make (wide_character_bytes_name)
		ensure
			wide_character_bytes_feature_name_not_void: Result /= Void
		end

feature -- Types

	like_current: ET_LIKE_CURRENT
			-- Type 'like Current' with implicit 'attached' type mark
		once
			create Result.make (implicit_attached_type_mark)
		ensure
			like_current_not_void: Result /= Void
		end

	attached_like_current: ET_LIKE_CURRENT
			-- Type 'attached like Current'
		once
			create Result.make (attached_keyword)
		ensure
			attached_like_current_not_void: Result /= Void
		end

	identity_type: ET_LIKE_CURRENT
			-- Type 'like Current' with no type mark modifier
		once
			create Result.make (Void)
		ensure
			identity_type_not_void: Result /= Void
		end

	attached_separate_type_mark: ET_ATTACHMENT_SEPARATE_KEYWORDS
			-- 'attached separate' type mark
		once
			create Result.make (attached_keyword, separate_keyword)
		ensure
			attached_separate_type_mark_not_void: Result /= Void
		end

	implicit_attached_type_mark: ET_IMPLICIT_TYPE_MARK
			-- Implicit 'attached' type mark
		once
			create Result.make
			Result.set_attached_mark (True)
		ensure
			implicit_attached_type_mark_not_void: Result /= Void
		end

	implicit_attached_expanded_type_mark: ET_IMPLICIT_TYPE_MARK
			-- Implicit 'attached expanded' type mark
		once
			create Result.make
			Result.set_attached_mark (True)
			Result.set_expanded_mark (True)
		ensure
			implicit_attached_expanded_type_mark_not_void: Result /= Void
		end

	implicit_attached_reference_type_mark: ET_IMPLICIT_TYPE_MARK
			-- Implicit 'attached reference' type mark
		once
			create Result.make
			Result.set_attached_mark (True)
			Result.set_reference_mark (True)
		ensure
			implicit_attached_reference_type_mark_not_void: Result /= Void
		end

	implicit_attached_separate_type_mark: ET_IMPLICIT_TYPE_MARK
			-- Implicit 'attached separate' type mark
		once
			create Result.make
			Result.set_attached_mark (True)
			Result.set_separate_mark (True)
		ensure
			implicit_attached_separate_type_mark_not_void: Result /= Void
		end

	implicit_attached_separate_expanded_type_mark: ET_IMPLICIT_TYPE_MARK
			-- Implicit 'attached separate expanded' type mark
		once
			create Result.make
			Result.set_attached_mark (True)
			Result.set_separate_mark (True)
			Result.set_expanded_mark (True)
		ensure
			implicit_attached_separate_expanded_type_mark_not_void: Result /= Void
		end

	implicit_attached_separate_reference_type_mark: ET_IMPLICIT_TYPE_MARK
			-- Implicit 'attached separate reference' type mark
		once
			create Result.make
			Result.set_attached_mark (True)
			Result.set_separate_mark (True)
			Result.set_reference_mark (True)
		ensure
			implicit_attached_separate_reference_type_mark_not_void: Result /= Void
		end

	implicit_detachable_type_mark: ET_IMPLICIT_TYPE_MARK
			-- Implicit 'detachable' type mark
		once
			create Result.make
			Result.set_detachable_mark (True)
		ensure
			implicit_detachable_type_mark_not_void: Result /= Void
		end

	implicit_detachable_expanded_type_mark: ET_IMPLICIT_TYPE_MARK
			-- Implicit 'detachable expanded' type mark
		once
			create Result.make
			Result.set_detachable_mark (True)
			Result.set_expanded_mark (True)
		ensure
			implicit_detachable_expanded_type_mark_not_void: Result /= Void
		end

	implicit_detachable_reference_type_mark: ET_IMPLICIT_TYPE_MARK
			-- Implicit 'detachable reference' type mark
		once
			create Result.make
			Result.set_detachable_mark (True)
			Result.set_reference_mark (True)
		ensure
			implicit_detachable_reference_type_mark_not_void: Result /= Void
		end

	implicit_detachable_separate_type_mark: ET_IMPLICIT_TYPE_MARK
			-- Implicit 'detachable separate' type mark
		once
			create Result.make
			Result.set_detachable_mark (True)
			Result.set_separate_mark (True)
		ensure
			implicit_detachable_separate_type_mark_not_void: Result /= Void
		end

	implicit_detachable_separate_expanded_type_mark: ET_IMPLICIT_TYPE_MARK
			-- Implicit 'detachable separate expanded' type mark
		once
			create Result.make
			Result.set_detachable_mark (True)
			Result.set_separate_mark (True)
			Result.set_expanded_mark (True)
		ensure
			implicit_detachable_separate_expanded_type_mark_not_void: Result /= Void
		end

	implicit_detachable_separate_reference_type_mark: ET_IMPLICIT_TYPE_MARK
			-- Implicit 'detachable separate reference' type mark
		once
			create Result.make
			Result.set_detachable_mark (True)
			Result.set_separate_mark (True)
			Result.set_reference_mark (True)
		ensure
			implicit_detachable_separate_reference_type_mark_not_void: Result /= Void
		end

	implicit_expanded_type_mark: ET_IMPLICIT_TYPE_MARK
			-- Implicit 'expanded' type mark
		once
			create Result.make
			Result.set_expanded_mark (True)
		ensure
			implicit_expanded_type_mark_not_void: Result /= Void
		end

	implicit_reference_type_mark: ET_IMPLICIT_TYPE_MARK
			-- Implicit 'reference' type mark
		once
			create Result.make
			Result.set_reference_mark (True)
		ensure
			implicit_reference_type_mark_not_void: Result /= Void
		end

	implicit_separate_type_mark: ET_IMPLICIT_TYPE_MARK
			-- Implicit 'separate' type mark
		once
			create Result.make
			Result.set_separate_mark (True)
		ensure
			implicit_separate_type_mark_not_void: Result /= Void
		end

	implicit_separate_expanded_type_mark: ET_IMPLICIT_TYPE_MARK
			-- Implicit 'separate expanded' type mark
		once
			create Result.make
			Result.set_separate_mark (True)
			Result.set_expanded_mark (True)
		ensure
			implicit_separate_expanded_type_mark_not_void: Result /= Void
		end

	implicit_separate_reference_type_mark: ET_IMPLICIT_TYPE_MARK
			-- Implicit 'separate reference' type mark
		once
			create Result.make
			Result.set_separate_mark (True)
			Result.set_reference_mark (True)
		ensure
			implicit_separate_reference_type_mark_not_void: Result /= Void
		end

	implicit_no_type_mark: ET_IMPLICIT_TYPE_MARK
			-- Implicit no type mark
		once
			create Result.make
		ensure
			implicit_no_type_mark_not_void: Result /= Void
		end

	implicit_type_mark (a_expanded_mark, a_reference_mark, a_separate_mark, a_attached_mark, a_detachable_mark: BOOLEAN): ET_IMPLICIT_TYPE_MARK
			-- Implicity type mark
		require
			expandedness_consistency: not (a_expanded_mark and a_reference_mark)
			attachment_consistency: not (a_attached_mark and a_detachable_mark)
		do
			if a_attached_mark then
				if a_separate_mark then
					if a_expanded_mark then
						Result := implicit_attached_separate_expanded_type_mark
					elseif a_reference_mark then
						Result := implicit_attached_separate_reference_type_mark
					else
						Result := implicit_attached_separate_type_mark
					end
				elseif a_expanded_mark then
					Result := implicit_attached_expanded_type_mark
				elseif a_reference_mark then
					Result := implicit_attached_reference_type_mark
				else
					Result := implicit_attached_type_mark
				end
			elseif a_detachable_mark then
				if a_separate_mark then
					if a_expanded_mark then
						Result := implicit_detachable_separate_expanded_type_mark
					elseif a_reference_mark then
						Result := implicit_detachable_separate_reference_type_mark
					else
						Result := implicit_detachable_separate_type_mark
					end
				elseif a_expanded_mark then
					Result := implicit_detachable_expanded_type_mark
				elseif a_reference_mark then
					Result := implicit_detachable_reference_type_mark
				else
					Result := implicit_detachable_type_mark
				end
			elseif a_separate_mark then
				if a_expanded_mark then
					Result := implicit_separate_expanded_type_mark
				elseif a_reference_mark then
					Result := implicit_separate_reference_type_mark
				else
					Result := implicit_separate_type_mark
				end
			elseif a_expanded_mark then
				Result := implicit_expanded_type_mark
			elseif a_reference_mark then
				Result := implicit_reference_type_mark
			else
				Result := implicit_no_type_mark
			end
		ensure
			implicit_type_mark_not_void: Result /= Void
		end

feature -- Symbols

	symbol: ET_SYMBOL
			-- Dummy symbol
		once
			create Result.make_arrow
		ensure
			symbol_not_void: Result /= Void
		end

	arrow_symbol: ET_SYMBOL
			-- '->' symbol
		once
			create Result.make_arrow
		ensure
			symbol_not_void: Result /= Void
		end

	assign_symbol: ET_SYMBOL
			-- ':=' symbol
		once
			create Result.make_assign
		ensure
			symbol_not_void: Result /= Void
		end

	assign_attempt_symbol: ET_SYMBOL
			-- '?=' symbol
		once
			create Result.make_assign_attempt
		ensure
			symbol_not_void: Result /= Void
		end

	bang_symbol: ET_SYMBOL
			-- '!' symbol
		once
			create Result.make_bang
		ensure
			symbol_not_void: Result /= Void
		end

	colon_symbol: ET_SYMBOL
			-- ':' symbol
		once
			create Result.make_colon
		ensure
			symbol_not_void: Result /= Void
		end

	comma_symbol: ET_SYMBOL
			-- ',' symbol
		once
			create Result.make_comma
		ensure
			symbol_not_void: Result /= Void
		end

	dollar_symbol: ET_SYMBOL
			-- '$' symbol
		once
			create Result.make_dollar
		ensure
			symbol_not_void: Result /= Void
		end

	dot_symbol: ET_SYMBOL
			-- '.' symbol
		once
			create Result.make_dot
		ensure
			symbol_not_void: Result /= Void
		end

	dotdot_symbol: ET_SYMBOL
			-- '..' symbol
		once
			create Result.make_dotdot
		ensure
			symbol_not_void: Result /= Void
		end

	left_array_symbol: ET_SYMBOL
			-- '<<' symbol
		once
			create Result.make_left_array
		ensure
			symbol_not_void: Result /= Void
		end

	left_brace_symbol: ET_SYMBOL
			-- '{' symbol
		once
			create Result.make_left_brace
		ensure
			symbol_not_void: Result /= Void
		end

	left_bracket_symbol: ET_BRACKET_SYMBOL
			-- '[' symbol
		once
			create Result.make
		ensure
			symbol_not_void: Result /= Void
		end

	left_parenthesis_symbol: ET_SYMBOL
			-- '(' symbol
		once
			create Result.make_left_parenthesis
		ensure
			symbol_not_void: Result /= Void
		end

	question_mark_symbol: ET_QUESTION_MARK_SYMBOL
			-- '?' symbol
		once
			create Result.make
		ensure
			symbol_not_void: Result /= Void
		end

	right_array_symbol: ET_SYMBOL
			-- '>>' symbol
		once
			create Result.make_right_array
		ensure
			symbol_not_void: Result /= Void
		end

	right_brace_symbol: ET_SYMBOL
			-- '}' symbol
		once
			create Result.make_right_brace
		ensure
			symbol_not_void: Result /= Void
		end

	right_bracket_symbol: ET_SYMBOL
			-- ']' symbol
		once
			create Result.make_right_bracket
		ensure
			symbol_not_void: Result /= Void
		end

	right_parenthesis_symbol: ET_SYMBOL
			-- ')' symbol
		once
			create Result.make_right_parenthesis
		ensure
			symbol_not_void: Result /= Void
		end

	semicolon_symbol: ET_SEMICOLON_SYMBOL
			-- ';' symbol
		do
			create Result.make
		ensure
			symbol_not_void: Result /= Void
		end

	tilde_symbol: ET_SYMBOL
			-- '~' symbol
		once
			create Result.make_tilde
		ensure
			symbol_not_void: Result /= Void
		end

feature -- Keywords

	keyword: ET_KEYWORD
			-- Dummy keyword
		once
			Result := strip_keyword
		ensure
			keyword_not_void: Result /= Void
		end

	across_keyword: ET_KEYWORD
			-- 'across' keyword
		once
			create Result.make_across
		ensure
			keyword_not_void: Result /= Void
		end

	agent_keyword: ET_AGENT_KEYWORD
			-- 'agent' keyword
		once
			create Result.make
		ensure
			keyword_not_void: Result /= Void
		end

	and_keyword: ET_KEYWORD_OPERATOR
			-- 'and' keyword
		once
			create Result.make_and
		ensure
			keyword_not_void: Result /= Void
		end

	alias_keyword: ET_KEYWORD
			-- 'alias' keyword
		once
			create Result.make_alias
		ensure
			keyword_not_void: Result /= Void
		end

	all_keyword: ET_KEYWORD
			-- 'all' keyword
		once
			create Result.make_all
		ensure
			keyword_not_void: Result /= Void
		end

	as_keyword: ET_KEYWORD
			-- 'as' keyword
		once
			create Result.make_as
		ensure
			keyword_not_void: Result /= Void
		end

	assign_keyword: ET_KEYWORD
			-- 'assign' keyword
		once
			create Result.make_assign
		ensure
			keyword_not_void: Result /= Void
		end

	attached_keyword: ET_KEYWORD
			-- 'attached' keyword
		once
			create Result.make_attached
		ensure
			keyword_not_void: Result /= Void
		end

	attribute_keyword: ET_KEYWORD
			-- 'attribute' keyword
		once
			create Result.make_attribute
		ensure
			keyword_not_void: Result /= Void
		end

	bit_keyword: ET_IDENTIFIER
			-- 'BIT' keyword
		once
			create Result.make (capitalized_bit_name)
		ensure
			keyword_not_void: Result /= Void
		end

	check_keyword: ET_KEYWORD
			-- 'check' keyword
		once
			create Result.make_check
		ensure
			keyword_not_void: Result /= Void
		end

	class_keyword: ET_KEYWORD
			-- 'class' keyword
		once
			create Result.make_class
		ensure
			keyword_not_void: Result /= Void
		end

	convert_keyword: ET_KEYWORD
			-- 'convert' keyword
		once
			create Result.make_convert
		ensure
			keyword_not_void: Result /= Void
		end

	create_keyword: ET_KEYWORD
			-- 'create' keyword
		once
			create Result.make_create
		ensure
			keyword_not_void: Result /= Void
		end

	creation_keyword: ET_KEYWORD
			-- 'creation' keyword
		once
			create Result.make_creation
		ensure
			keyword_not_void: Result /= Void
		end

	current_keyword: ET_CURRENT
			-- 'Current' keyword
		once
			create Result.make
		ensure
			keyword_not_void: Result /= Void
		end

	debug_keyword: ET_KEYWORD
			-- 'debug' keyword
		once
			create Result.make_debug
		ensure
			keyword_not_void: Result /= Void
		end

	deferred_keyword: ET_KEYWORD
			-- 'deferred' keyword
		once
			create Result.make_deferred
		ensure
			keyword_not_void: Result /= Void
		end

	detachable_keyword: ET_KEYWORD
			-- 'detachable' keyword
		once
			create Result.make_detachable
		ensure
			keyword_not_void: Result /= Void
		end

	do_keyword: ET_KEYWORD
			-- 'do' keyword
		once
			create Result.make_do
		ensure
			keyword_not_void: Result /= Void
		end

	else_keyword: ET_KEYWORD
			-- 'else' keyword
		once
			create Result.make_else
		ensure
			keyword_not_void: Result /= Void
		end

	elseif_keyword: ET_KEYWORD
			-- 'elseif' keyword
		once
			create Result.make_elseif
		ensure
			keyword_not_void: Result /= Void
		end

	end_keyword: ET_KEYWORD
			-- 'end' keyword
		once
			create Result.make_end
		ensure
			keyword_not_void: Result /= Void
		end

	ensure_keyword: ET_KEYWORD
			-- 'ensure' keyword
		once
			create Result.make_ensure
		ensure
			keyword_not_void: Result /= Void
		end

	expanded_keyword: ET_KEYWORD
			-- 'expanded' keyword
		once
			create Result.make_expanded
		ensure
			keyword_not_void: Result /= Void
		end

	export_keyword: ET_KEYWORD
			-- 'export' keyword
		once
			create Result.make_export
		ensure
			keyword_not_void: Result /= Void
		end

	external_keyword: ET_KEYWORD
			-- 'external' keyword
		once
			create Result.make_external
		ensure
			keyword_not_void: Result /= Void
		end

	feature_keyword: ET_KEYWORD
			-- 'feature' keyword
		once
			create Result.make_feature
		ensure
			keyword_not_void: Result /= Void
		end

	from_keyword: ET_KEYWORD
			-- 'from' keyword
		once
			create Result.make_from
		ensure
			keyword_not_void: Result /= Void
		end

	frozen_keyword: ET_KEYWORD
			-- 'frozen' keyword
		once
			create Result.make_frozen
		ensure
			keyword_not_void: Result /= Void
		end

	if_keyword: ET_KEYWORD
			-- 'if' keyword
		once
			create Result.make_if
		ensure
			keyword_not_void: Result /= Void
		end

	indexing_keyword: ET_KEYWORD
			-- 'indexing' keyword
		once
			create Result.make_indexing
		ensure
			keyword_not_void: Result /= Void
		end

	infix_keyword: ET_KEYWORD
			-- 'infix' keyword
		once
			create Result.make_infix
		ensure
			keyword_not_void: Result /= Void
		end

	inherit_keyword: ET_KEYWORD
			-- 'inherit' keyword
		once
			create Result.make_inherit
		ensure
			keyword_not_void: Result /= Void
		end

	inspect_keyword: ET_KEYWORD
			-- 'inspect' keyword
		once
			create Result.make_inspect
		ensure
			keyword_not_void: Result /= Void
		end

	invariant_keyword: ET_KEYWORD
			-- 'invariant' keyword
		once
			create Result.make_invariant
		ensure
			keyword_not_void: Result /= Void
		end

	is_keyword: ET_KEYWORD
			-- 'is' keyword
		once
			create Result.make_is
		ensure
			keyword_not_void: Result /= Void
		end

	like_keyword: ET_KEYWORD
			-- 'like' keyword
		once
			create Result.make_like
		ensure
			keyword_not_void: Result /= Void
		end

	local_keyword: ET_KEYWORD
			-- 'local' keyword
		once
			create Result.make_local
		ensure
			keyword_not_void: Result /= Void
		end

	loop_keyword: ET_KEYWORD
			-- 'loop' keyword
		once
			create Result.make_loop
		ensure
			keyword_not_void: Result /= Void
		end

	note_keyword: ET_KEYWORD
			-- 'note' keyword
		once
			create Result.make_note
		ensure
			keyword_not_void: Result /= Void
		end

	obsolete_keyword: ET_KEYWORD
			-- 'obsolete' keyword
		once
			create Result.make_obsolete
		ensure
			keyword_not_void: Result /= Void
		end

	old_keyword: ET_KEYWORD
			-- 'old' keyword
		once
			create Result.make_old
		ensure
			keyword_not_void: Result /= Void
		end

	once_keyword: ET_KEYWORD
			-- 'once' keyword
		once
			create Result.make_once
		ensure
			keyword_not_void: Result /= Void
		end

	or_keyword: ET_KEYWORD_OPERATOR
			-- 'or' keyword
		once
			create Result.make_or
		ensure
			keyword_not_void: Result /= Void
		end

	precursor_keyword: ET_PRECURSOR_KEYWORD
			-- 'precursor' keyword
		once
			create Result.make
		ensure
			keyword_not_void: Result /= Void
		end

	prefix_keyword: ET_KEYWORD
			-- 'prefix' keyword
		once
			create Result.make_prefix
		ensure
			keyword_not_void: Result /= Void
		end

	redefine_keyword: ET_KEYWORD
			-- 'redefine' keyword
		once
			create Result.make_redefine
		ensure
			keyword_not_void: Result /= Void
		end

	reference_keyword: ET_KEYWORD
			-- 'reference' keyword
		once
			create Result.make_reference
		ensure
			keyword_not_void: Result /= Void
		end

	rename_keyword: ET_KEYWORD
			-- 'rename' keyword
		once
			create Result.make_rename
		ensure
			keyword_not_void: Result /= Void
		end

	require_keyword: ET_KEYWORD
			-- 'require' keyword
		once
			create Result.make_require
		ensure
			keyword_not_void: Result /= Void
		end

	rescue_keyword: ET_KEYWORD
			-- 'rescue' keyword
		once
			create Result.make_rescue
		ensure
			keyword_not_void: Result /= Void
		end

	result_keyword: ET_RESULT
			-- 'Result' keyword
		once
			create Result.make
		ensure
			keyword_not_void: Result /= Void
		end

	retry_keyword: ET_RETRY_INSTRUCTION
			-- 'retry' keyword
		once
			create Result.make
		ensure
			keyword_not_void: Result /= Void
		end

	select_keyword: ET_KEYWORD
			-- 'select' keyword
		once
			create Result.make_select
		ensure
			keyword_not_void: Result /= Void
		end

	separate_keyword: ET_KEYWORD
			-- 'separate' keyword
		once
			create Result.make_separate
		ensure
			keyword_not_void: Result /= Void
		end

	some_keyword: ET_KEYWORD
			-- 'some' keyword
		once
			create Result.make_some
		ensure
			keyword_not_void: Result /= Void
		end

	strip_keyword: ET_KEYWORD
			-- 'strip' keyword
		once
			create Result.make_strip
		ensure
			keyword_not_void: Result /= Void
		end

	then_keyword: ET_KEYWORD
			-- 'then' keyword
		once
			create Result.make_then
		ensure
			keyword_not_void: Result /= Void
		end

	true_keyword: ET_TRUE_CONSTANT
			-- 'True' keyword
		once
			create Result.make
		ensure
			keyword_not_void: Result /= Void
		end

	tuple_keyword: ET_IDENTIFIER
			-- 'TUPLE' keyword
		once
			create Result.make (capitalized_tuple_name)
		ensure
			keyword_not_void: Result /= Void
		end

	undefine_keyword: ET_KEYWORD
			-- 'undefine' keyword
		once
			create Result.make_undefine
		ensure
			keyword_not_void: Result /= Void
		end

	unique_keyword: ET_KEYWORD
			-- 'unique' keyword
		once
			create Result.make_unique
		ensure
			keyword_not_void: Result /= Void
		end

	until_keyword: ET_KEYWORD
			-- 'until' keyword
		once
			create Result.make_until
		ensure
			keyword_not_void: Result /= Void
		end

	variant_keyword: ET_KEYWORD
			-- 'variant' keyword
		once
			create Result.make_variant
		ensure
			keyword_not_void: Result /= Void
		end

	void_keyword: ET_VOID
			-- 'Void' keyword
		once
			create Result.make
		ensure
			keyword_not_void: Result /= Void
		end

	when_keyword: ET_KEYWORD
			-- 'when' keyword
		once
			create Result.make_when
		ensure
			keyword_not_void: Result /= Void
		end

feature -- Keyword and symbol names

	capitalized_any_name: STRING = "ANY"
	capitalized_arguments_32_name: STRING = "ARGUMENTS_32"
	capitalized_array_name: STRING = "ARRAY"
	capitalized_bit_name: STRING = "BIT"
	capitalized_boolean_name: STRING = "BOOLEAN"
	capitalized_character_name: STRING = "CHARACTER"
	capitalized_character_8_name: STRING = "CHARACTER_8"
	capitalized_character_32_name: STRING = "CHARACTER_32"
	capitalized_double_name: STRING = "DOUBLE"
	capitalized_disposable_name: STRING = "DISPOSABLE"
	capitalized_function_name: STRING = "FUNCTION"
	capitalized_identified_routines_name: STRING = "IDENTIFIED_ROUTINES"
	capitalized_integer_name: STRING = "INTEGER"
	capitalized_integer_8_name: STRING = "INTEGER_8"
	capitalized_integer_16_name: STRING = "INTEGER_16"
	capitalized_integer_32_name: STRING = "INTEGER_32"
	capitalized_integer_64_name: STRING = "INTEGER_64"
	capitalized_internal_name: STRING = "INTERNAL"
	capitalized_iterable_name: STRING = "ITERABLE"
	capitalized_iteration_cursor_name: STRING = "ITERATION_CURSOR"
	capitalized_memory_name: STRING = "MEMORY"
	capitalized_native_array_name: STRING = "NATIVE_ARRAY"
	capitalized_natural_name: STRING = "NATURAL"
	capitalized_natural_8_name: STRING = "NATURAL_8"
	capitalized_natural_16_name: STRING = "NATURAL_16"
	capitalized_natural_32_name: STRING = "NATURAL_32"
	capitalized_natural_64_name: STRING = "NATURAL_64"
	capitalized_none_name: STRING = "NONE"
	capitalized_platform_name: STRING = "PLATFORM"
	capitalized_pointer_name: STRING = "POINTER"
	capitalized_predicate_name: STRING = "PREDICATE"
	capitalized_procedure_name: STRING = "PROCEDURE"
	capitalized_real_name: STRING = "REAL"
	capitalized_real_32_name: STRING = "REAL_32"
	capitalized_real_64_name: STRING = "REAL_64"
	capitalized_routine_name: STRING = "ROUTINE"
	capitalized_special_name: STRING = "SPECIAL"
	capitalized_string_name: STRING = "STRING"
	capitalized_string_8_name: STRING = "STRING_8"
	capitalized_string_32_name: STRING = "STRING_32"
	capitalized_system_object_name: STRING = "SYSTEM_OBJECT"
	capitalized_system_string_name: STRING = "SYSTEM_STRING"
	capitalized_tuple_name: STRING = "TUPLE"
	capitalized_type_name: STRING = "TYPE"
	capitalized_typed_pointer_name: STRING = "TYPED_POINTER"
	capitalized_wide_character_name: STRING = "WIDE_CHARACTER"
	capitalized_unknown_name: STRING = "*UNKNOWN*"
			-- Eiffel class names

	after_name: STRING = "after"
			-- Name of Eiffel feature 'after'

	aliased_resized_area_name: STRING = "aliased_resized_area"
			-- Name of Eiffel feature 'aliased_resized_area'

	area_name: STRING = "area"
			-- Name of Eiffel feature 'area'

	argument_count_name: STRING = "argument_count"
			-- Name of Eiffel feature 'argument_count'

	as_integer_8_name: STRING = "as_integer_8"
			-- Name of Eiffel feature 'as_integer_8'

	as_integer_16_name: STRING = "as_integer_16"
			-- Name of Eiffel feature 'as_integer_16'

	as_integer_32_name: STRING = "as_integer_32"
			-- Name of Eiffel feature 'as_integer_32'

	as_integer_64_name: STRING = "as_integer_64"
			-- Name of Eiffel feature 'as_integer_64'

	as_natural_8_name: STRING = "as_natural_8"
			-- Name of Eiffel feature 'as_natural_8'

	as_natural_16_name: STRING = "as_natural_16"
			-- Name of Eiffel feature 'as_natural_16'

	as_natural_32_name: STRING = "as_natural_32"
			-- Name of Eiffel feature 'as_natural_32'

	as_natural_64_name: STRING = "as_natural_64"
			-- Name of Eiffel feature 'as_natural_64'

	base_address_name: STRING = "base_address"
			-- Name of Eiffel feature 'base_address'

	base_class_name_name: STRING = "base_class_name"
			-- Name of Eiffel feature 'base_class_name'

	bit_and_name: STRING = "bit_and"
			-- Name of Eiffel feature 'bit_and'

	bit_not_name: STRING = "bit_not"
			-- Name of Eiffel feature 'bit_not'

	bit_or_name: STRING = "bit_or"
			-- Name of Eiffel feature 'bit_or'

	bit_shift_left_name: STRING = "bit_shift_left"
			-- Name of Eiffel feature 'bit_shift_left'

	bit_shift_right_name: STRING = "bit_shift_right"
			-- Name of Eiffel feature 'bit_shift_right'

	bit_xor_name: STRING = "bit_xor"
			-- Name of Eiffel feature 'bit_xor'

	boolean_bytes_name: STRING = "boolean_bytes"
			-- Name of Eiffel feature 'boolean_bytes'

	boolean_field_name: STRING = "boolean_field"
			-- Name of Eiffel feature 'boolean_field'

	boolean_item_name: STRING = "boolean_item"
			-- Name of Eiffel feature 'boolean_item'

	call_name: STRING = "call"
			-- Name of Eiffel feature 'call'

	capacity_name: STRING = "capacity"
			-- Name of Eiffel feature 'capacity'

	ceiling_real_32_name: STRING = "ceiling_real_32"
			-- Name of Eiffel feature 'ceiling_real_32'

	ceiling_real_64_name: STRING = "ceiling_real_64"
			-- Name of Eiffel feature 'ceiling_real_64'

	character_8_item_name: STRING = "character_8_item"
			-- Name of Eiffel feature 'character_8_item'

	character_8_field_name: STRING = "character_8_field"
			-- Name of Eiffel feature 'character_8_field'

	character_32_item_name: STRING = "character_32_item"
			-- Name of Eiffel feature 'character_32_item'

	character_32_field_name: STRING = "character_32_field"
			-- Name of Eiffel feature 'character_32_field'

	character_bytes_name: STRING = "character_bytes"
			-- Name of Eiffel feature 'character_bytes'

	closed_operands_name: STRING = "closed_operands"
			-- Name of Eiffel feature 'closed_operands'

	code_name: STRING = "code"
			-- Name of Eiffel feature 'code'

	conforms_to_name: STRING = "conforms_to"
			-- Name of Eiffel feature 'conforms_to'

	conjuncted_name: STRING = "conjuncted"
			-- Name of Eiffel feature 'conjuncted'

	conjuncted_semistrict_name: STRING = "conjuncted_semistrict"
			-- Name of Eiffel feature 'conjuncted_semistrict'

	copy_name: STRING = "copy"
			-- Name of Eiffel feature 'copy'

	count_name: STRING = "count"
			-- Name of Eiffel feature 'count'

	deep_twin_name: STRING = "deep_twin"
			-- Name of Eiffel feature 'deep_twin'

	default_name: STRING = "default"
			-- Name of Eiffel feature 'default'

	default_create_name: STRING = "default_create"
			-- Name of Eiffel feature 'default_create'

	disjuncted_name: STRING = "disjuncted"
			-- Name of Eiffel feature 'disjuncted'

	disjuncted_exclusive_name: STRING = "disjuncted_exclusive"
			-- Name of Eiffel feature 'disjuncted_exclusive'

	disjuncted_semistrict_name: STRING = "disjuncted_semistrict"
			-- Name of Eiffel feature 'disjuncted_semistrict'

	dispose_name: STRING = "dispose"
			-- Name of Eiffel feature 'dispose'

	double_bytes_name: STRING = "double_bytes"
			-- Name of Eiffel feature 'double_bytes'

	eif_id_object_name: STRING = "eif_id_object"
			-- Name of Eiffel feature 'eif_id_object'

	eif_object_id_name: STRING = "eif_object_id"
			-- Name of Eiffel feature 'eif_object_id'

	eif_object_id_free_name: STRING = "eif_object_id_free"
			-- Name of Eiffel feature 'eif_object_id_free'

	element_size_name: STRING = "element_size"
			-- Name of Eiffel feature 'element_size'

	extend_name: STRING = "extend"
			-- Name of Eiffel feature 'extend'

	field_name: STRING = "field"
			-- Name of Eiffel feature 'field'

	field_count_name: STRING = "field_count"
			-- Name of Eiffel feature 'field_count'

	field_name_name: STRING = "field_name"
			-- Name of Eiffel feature 'field_name'

	field_static_type_name: STRING = "field_static_type"
			-- Name of Eiffel feature 'field_static_type'

	field_type_name: STRING = "field_type"
			-- Name of Eiffel feature 'field_type'

	find_referers_name: STRING = "find_referers"
			-- Name of Eiffel feature 'find_referers'

	floor_real_32_name: STRING = "floor_real_32"
			-- Name of Eiffel feature 'floor_real_32'

	floor_real_64_name: STRING = "floor_real_64"
			-- Name of Eiffel feature 'floor_real_64'

	forth_name: STRING = "forth"
			-- Name of Eiffel feature 'forth'

	free_name: STRING = "free"
			-- Name of Eiffel feature 'free'

	generating_type_name: STRING = "generating_type"
			-- Name of Eiffel feature 'generating_type'

	generator_name: STRING = "generator"
			-- Name of Eiffel feature 'generator'

	generic_parameter_count_name: STRING = "generic_parameter_count"
			-- Name of Eiffel feature 'generic_parameter_count'

	generic_parameter_type_name: STRING = "generic_parameter_type"
			-- Name of Eiffel feature 'generic_parameter_type'
			
	has_default_name: STRING = "has_default"
			-- Name of Eiffel feature 'has_default'

	hash_code_name: STRING = "hash_code"
			-- Name of Eiffel feature 'hash_code'

	i_th_argument_pointer_name: STRING = "i_th_argument_pointer"
			-- Name of Eiffel feature 'i_th_argument_pointer'

	i_th_argument_string_name: STRING = "i_th_argument_string"
			-- Name of Eiffel feature 'i_th_argument_string'

	identity_name: STRING = "identity"
			-- Name of Eiffel feature 'identity'

	implication_name: STRING = "implication"
			-- Name of Eiffel feature 'implication'

	integer_8_item_name: STRING = "integer_8_item"
			-- Name of Eiffel feature 'integer_8_item'

	integer_8_field_name: STRING = "integer_8_field"
			-- Name of Eiffel feature 'integer_8_field'

	integer_16_item_name: STRING = "integer_16_item"
			-- Name of Eiffel feature 'integer_16_item'

	integer_16_field_name: STRING = "integer_16_field"
			-- Name of Eiffel feature 'integer_16_field'

	integer_32_item_name: STRING = "integer_32_item"
			-- Name of Eiffel feature 'integer_32_item'

	integer_32_field_name: STRING = "integer_32_field"
			-- Name of Eiffel feature 'integer_32_item'

	integer_64_item_name: STRING = "integer_64_item"
			-- Name of Eiffel feature 'integer_64_item'

	integer_64_field_name: STRING = "integer_64_field"
			-- Name of Eiffel feature 'integer_64_field'

	integer_bytes_name: STRING = "integer_bytes"
			-- Name of Eiffel feature 'integer_bytes'

	integer_quotient_name: STRING = "integer_quotient"
			-- Name of Eiffel feature 'integer_quotient'

	integer_remainder_name: STRING = "integer_remainder"
			-- Name of Eiffel feature 'integer_remainder'

	is_deep_equal_name: STRING = "is_deep_equal"
			-- Name of Eiffel feature 'is_deep_equal'

	is_default_pointer_name: STRING = "is_default_pointer"
			-- Name of Eiffel feature 'is_default_pointer'

	is_dotnet_name: STRING = "is_dotnet"
			-- Name of Eiffel feature 'is_dotnet'

	is_equal_name: STRING = "is_equal"
			-- Name of Eiffel feature 'is_equal'

	is_expanded_name: STRING = "is_expanded"
			-- Name of Eiffel feature 'is_expanded'

	is_less_name: STRING = "is_less"
			-- Name of Eiffel feature 'is_less'

	is_mac_name: STRING = "is_mac"
			-- Name of Eiffel feature 'is_mac'

	is_nan_name: STRING = "is_nan"
			-- Name of Eiffel feature 'is_nan'

	is_negative_infinity_name: STRING = "is_negative_infinity"
			-- Name of Eiffel feature 'is_negative_infinity'

	is_positive_infinity_name: STRING = "is_positive_infinity"
			-- Name of Eiffel feature 'is_positive_infinity'

	is_scoop_capable_name: STRING = "is_scoop_capable"
			-- Name of Eiffel feature 'is_scoop_capable'

	is_target_closed_name: STRING = "is_target_closed"
			-- Name of Eiffel feature 'is_target_closed'

	is_thread_capable_name: STRING = "is_thread_capable"
			-- Name of Eiffel feature 'is_thread_capable'

	is_unix_name: STRING = "is_unix"
			-- Name of Eiffel feature 'is_unix'

	is_vms_name: STRING = "is_vms"
			-- Name of Eiffel feature 'is_vms'

	is_vxworks_name: STRING = "is_vxworks"
			-- Name of Eiffel feature 'is_vxworks'

	is_windows_name: STRING = "is_windows"
			-- Name of Eiffel feature 'is_windows'

	item_name: STRING = "item"
			-- Name of Eiffel feature 'item'

	item_code_name: STRING = "item_code"
			-- Name of Eiffel feature 'item_code'

	last_result_name: STRING = "last_result"
			-- Name of Eiffel feature 'last_result'

	lower_name: STRING = "lower"
			-- Name of Eiffel feature 'lower'

	make_name: STRING = "make"
			-- Name of Eiffel feature 'make'

	make_empty_name: STRING = "make_empty"
			-- Name of Eiffel feature 'make_empty'

	max_type_id_name: STRING = "max_type_id"
			-- Name of Eiffel feature 'max_type_id'

	minus_name: STRING = "minus"
			-- Name of Eiffel feature 'minus'

	name_name: STRING = "name"
			-- Name of Eiffel feature 'name'

	nan_name: STRING = "nan"
			-- Name of Eiffel feature 'nan'

	natural_8_item_name: STRING = "natural_8_item"
			-- Name of Eiffel feature 'natural_8_item'

	natural_8_field_name: STRING = "natural_8_field"
			-- Name of Eiffel feature 'natural_8_field'

	natural_16_item_name: STRING = "natural_16_item"
			-- Name of Eiffel feature 'natural_16_item'

	natural_16_field_name: STRING = "natural_16_field"
			-- Name of Eiffel feature 'natural_16_field'

	natural_32_code_name: STRING = "natural_32_code"
			-- Name of Eiffel feature 'natural_32_code'

	natural_32_item_name: STRING = "natural_32_item"
			-- Name of Eiffel feature 'natural_32_item'

	natural_32_field_name: STRING = "natural_32_field"
			-- Name of Eiffel feature 'natural_32_field'

	natural_64_item_name: STRING = "natural_64_item"
			-- Name of Eiffel feature 'natural_64_item'

	natural_64_field_name: STRING = "natural_64_field"
			-- Name of Eiffel feature 'natural_64_field'

	negated_name: STRING = "negated"
			-- Name of Eiffel feature 'negated'

	negative_infinity_name: STRING = "negative_infinity"
			-- Name of Eiffel feature 'negative_infinity'

	new_cursor_name: STRING = "new_cursor"
			-- Name of Eiffel feature 'new_cursor'

	new_instance_name: STRING = "new_instance"
			-- Name of Eiffel feature 'new_instance'

	new_special_any_instance_name: STRING = "new_special_any_instance"
			-- Name of Eiffel feature 'new_special_any_instance'
			
	object_comparison_name: STRING = "object_comparison"
			-- Name of Eiffel feature 'object_comparison'

	opposite_name: STRING = "opposite"
			-- Name of Eiffel feature 'opposite'

	out_name: STRING = "out"
			-- Name of Eiffel feature 'out'

	plus_name: STRING = "plus"
			-- Name of Eiffel feature 'plus'

	pointer_bytes_name: STRING = "pointer_bytes"
			-- Name of Eiffel feature 'pointer_bytes'

	pointer_item_name: STRING = "pointer_item"
			-- Name of Eiffel feature 'pointer_item'

	pointer_field_name: STRING = "pointer_field"
			-- Name of Eiffel feature 'pointer_field'

	positive_infinity_name: STRING = "positive_infinity"
			-- Name of Eiffel feature 'positive_infinity'

	power_name: STRING = "power"
			-- Name of Eiffel feature 'power'

	product_name: STRING = "product"
			-- Name of Eiffel feature 'product'

	put_name: STRING = "put"
			-- Name of Eiffel feature 'put'

	put_boolean_name: STRING = "put_boolean"
			-- Name of Eiffel feature 'put_boolean'

	put_character_8_name: STRING = "put_character_8"
			-- Name of Eiffel feature 'put_character_8'

	put_character_32_name: STRING = "put_character_32"
			-- Name of Eiffel feature 'put_character_32'

	put_integer_8_name: STRING = "put_integer_8"
			-- Name of Eiffel feature 'put_integer_8'

	put_integer_16_name: STRING = "put_integer_16"
			-- Name of Eiffel feature 'put_integer_16'

	put_integer_32_name: STRING = "put_integer_32"
			-- Name of Eiffel feature 'put_integer_32'

	put_integer_64_name: STRING = "put_integer_64"
			-- Name of Eiffel feature 'put_integer_64'

	put_natural_8_name: STRING = "put_natural_8"
			-- Name of Eiffel feature 'put_natural_8'

	put_natural_16_name: STRING = "put_natural_16"
			-- Name of Eiffel feature 'put_natural_16'

	put_natural_32_name: STRING = "put_natural_32"
			-- Name of Eiffel feature 'put_natural_32'

	put_natural_64_name: STRING = "put_natural_64"
			-- Name of Eiffel feature 'put_natural_64'

	put_pointer_name: STRING = "put_pointer"
			-- Name of Eiffel feature 'put_pointer'

	put_real_32_name: STRING = "put_real_32"
			-- Name of Eiffel feature 'put_real_32'

	put_real_64_name: STRING = "put_real_64"
			-- Name of Eiffel feature 'put_real_64'

	put_reference_name: STRING = "put_reference"
			-- Name of Eiffel feature 'put_reference'

	quotient_name: STRING = "quotient"
			-- Name of Eiffel feature 'quotient'

	real_32_item_name: STRING = "real_32_item"
			-- Name of Eiffel feature 'real_32_item'

	real_32_field_name: STRING = "real_32_field"
			-- Name of Eiffel feature 'real_32_field'

	real_64_item_name: STRING = "real_64_item"
			-- Name of Eiffel feature 'real_64_item'

	real_64_field_name: STRING = "real_64_field"
			-- Name of Eiffel feature 'real_64_field'

	real_bytes_name: STRING = "real_bytes"
			-- Name of Eiffel feature 'real_bytes'

	reference_item_name: STRING = "reference_item"
			-- Name of Eiffel feature 'reference_item'

	runtime_name_name: STRING = "runtime_name"
			-- Name of Eiffel feature 'runtime_name'

	same_type_name: STRING = "same_type"
			-- Name of Eiffel feature 'same_type'

	set_boolean_field_name: STRING = "set_boolean_field"
			-- Name of Eiffel feature 'set_boolean_field'

	set_character_8_field_name: STRING = "set_character_8_field"
			-- Name of Eiffel feature 'set_character_8_field'

	set_character_32_field_name: STRING = "set_character_32_field"
			-- Name of Eiffel feature 'set_character_32_field'

	set_count_name: STRING = "set_count"
			-- Name of Eiffel feature 'set_count'

	set_integer_8_field_name: STRING = "set_integer_8_field"
			-- Name of Eiffel feature 'set_integer_8_field'

	set_integer_16_field_name: STRING = "set_integer_16_field"
			-- Name of Eiffel feature 'set_integer_16_field'

	set_integer_32_field_name: STRING = "set_integer_32_field"
			-- Name of Eiffel feature 'set_integer_32_field'

	set_integer_64_field_name: STRING = "set_integer_64_field"
			-- Name of Eiffel feature 'set_integer_64_field'

	set_item_name: STRING = "set_item"
			-- Name of Eiffel feature 'set_item'

	set_natural_8_field_name: STRING = "set_natural_8_field"
			-- Name of Eiffel feature 'set_natural_8_field'

	set_natural_16_field_name: STRING = "set_natural_16_field"
			-- Name of Eiffel feature 'set_natural_16_field'

	set_natural_32_field_name: STRING = "set_natural_32_field"
			-- Name of Eiffel feature 'set_natural_32_field'

	set_natural_64_field_name: STRING = "set_natural_64_field"
			-- Name of Eiffel feature 'set_natural_64_field'

	set_object_comparison_name: STRING = "set_object_comparison"
			-- Name of Eiffel feature 'set_object_comparison'

	set_operands_name: STRING = "set_operands"
			-- Name of Eiffel feature 'set_operands'

	set_pointer_field_name: STRING = "set_pointer_field"
			-- Name of Eiffel feature 'set_pointer_field'

	set_real_32_field_name: STRING = "set_real_32_field"
			-- Name of Eiffel feature 'set_real_32_field'

	set_real_64_field_name: STRING = "set_real_64_field"
			-- Name of Eiffel feature 'set_real_64_field'

	set_reference_field_name: STRING = "set_reference_field"
			-- Name of Eiffel feature 'set_reference_field'

	standard_copy_name: STRING = "standard_copy"
			-- Name of Eiffel feature 'standard_copy'

	standard_is_equal_name: STRING = "standard_is_equal"
			-- Name of Eiffel feature 'standard_is_equal'

	standard_twin_name: STRING = "standard_twin"
			-- Name of Eiffel feature 'standard_twin'

	tagged_out_name: STRING = "tagged_out"
			-- Name of Eiffel feature 'tagged_out'

	to_character_name: STRING = "to_character"
			-- Name of Eiffel feature 'tagged_out'

	to_character_8_name: STRING = "to_character_8"
			-- Name of Eiffel feature 'to_character_8'

	to_character_32_name: STRING = "to_character_32"
			-- Name of Eiffel feature 'to_character_32'

	to_double_name: STRING = "to_double"
			-- Name of Eiffel feature 'to_double'

	to_integer_32_name: STRING = "to_integer_32"
			-- Name of Eiffel feature 'to_integer_32'

	to_pointer_name: STRING = "to_pointer"
			-- Name of Eiffel feature 'to_pointer'

	to_real_name: STRING = "to_real"
			-- Name of Eiffel feature 'to_real'

	to_real_32_name: STRING = "to_real_32"
			-- Name of Eiffel feature 'to_real_32'

	to_real_64_name: STRING = "to_real_64"
			-- Name of Eiffel feature 'to_real_64'

	truncated_to_integer_name: STRING = "truncated_to_integer"
			-- Name of Eiffel feature 'truncated_to_integer'

	truncated_to_integer_64_name: STRING = "truncated_to_integer_64"
			-- Name of Eiffel feature 'truncated_to_integer_64'

	truncated_to_real_name: STRING = "truncated_to_real"
			-- Name of Eiffel feature 'truncated_to_real'

	twin_name: STRING = "twin"
			-- Name of Eiffel feature 'twin'

	type_id_name: STRING = "type_id"
			-- Name of Eiffel feature 'type_id'

	type_of_type_name: STRING = "type_of_type"
			-- Name of Eiffel feature 'type_id'

	upper_name: STRING = "upper"
			-- Name of Eiffel feature 'upper'

	wide_character_bytes_name: STRING = "wide_character_bytes"
			-- Name of Eiffel feature 'wide_character_bytes'

	capitalized_current_keyword_name: STRING = "Current"
	capitalized_false_keyword_name: STRING = "False"
	capitalized_precursor_keyword_name: STRING = "Precursor"
	capitalized_result_keyword_name: STRING = "Result"
	capitalized_true_keyword_name: STRING = "True"
	capitalized_void_keyword_name: STRING = "Void"
	capitalized_unique_keyword_name: STRING = "Unique"
			-- Eiffel keyword names with first letter in upper-case

	across_keyword_name: STRING = "across"
	agent_keyword_name: STRING = "agent"
	alias_keyword_name: STRING = "alias"
	all_keyword_name: STRING = "all"
	and_keyword_name: STRING = "and"
	and_then_keywords_name: STRING = "and then"
	as_keyword_name: STRING = "as"
	assign_keyword_name: STRING = "assign"
	attached_keyword_name: STRING = "attached"
	attribute_keyword_name: STRING = "attribute"
	check_keyword_name: STRING = "check"
	class_keyword_name: STRING = "class"
	convert_keyword_name: STRING = "convert"
	create_keyword_name: STRING = "create"
	creation_keyword_name: STRING = "creation"
	current_keyword_name: STRING = "current"
	debug_keyword_name: STRING = "debug"
	deferred_keyword_name: STRING = "deferred"
	detachable_keyword_name: STRING = "detachable"
	do_keyword_name: STRING = "do"
	else_keyword_name: STRING = "else"
	elseif_keyword_name: STRING = "elseif"
	end_keyword_name: STRING = "end"
	ensure_keyword_name: STRING = "ensure"
	expanded_keyword_name: STRING = "expanded"
	export_keyword_name: STRING = "export"
	external_keyword_name: STRING = "external"
	false_keyword_name: STRING = "false"
	feature_keyword_name: STRING = "feature"
	from_keyword_name: STRING = "from"
	frozen_keyword_name: STRING = "frozen"
	if_keyword_name: STRING = "if"
	implies_keyword_name: STRING = "implies"
	indexing_keyword_name: STRING = "indexing"
	infix_keyword_name: STRING = "infix"
	inherit_keyword_name: STRING = "inherit"
	inspect_keyword_name: STRING = "inspect"
	invariant_keyword_name: STRING = "invariant"
	is_keyword_name: STRING = "is"
	like_keyword_name: STRING = "like"
	local_keyword_name: STRING = "local"
	loop_keyword_name: STRING = "loop"
	not_keyword_name: STRING = "not"
	note_keyword_name: STRING = "note"
	obsolete_keyword_name: STRING = "obsolete"
	old_keyword_name: STRING = "old"
	once_keyword_name: STRING = "once"
	or_keyword_name: STRING = "or"
	or_else_keywords_name: STRING = "or else"
	precursor_keyword_name: STRING = "precursor"
	prefix_keyword_name: STRING = "prefix"
	redefine_keyword_name: STRING = "redefine"
	reference_keyword_name: STRING = "reference"
	rename_keyword_name: STRING = "rename"
	require_keyword_name: STRING = "require"
	rescue_keyword_name: STRING = "rescue"
	result_keyword_name: STRING = "result"
	retry_keyword_name: STRING = "retry"
	select_keyword_name: STRING = "select"
	separate_keyword_name: STRING = "separate"
	some_keyword_name: STRING = "some"
	strip_keyword_name: STRING = "strip"
	then_keyword_name: STRING = "then"
	true_keyword_name: STRING = "true"
	undefine_keyword_name: STRING = "undefine"
	unique_keyword_name: STRING = "unique"
	until_keyword_name: STRING = "until"
	variant_keyword_name: STRING = "variant"
	void_keyword_name: STRING = "void"
	when_keyword_name: STRING = "when"
	xor_keyword_name: STRING = "xor"
			-- Eiffel keyword names

	attached_expanded_type_mark_name: STRING = "attached expanded"
	attached_reference_type_mark_name: STRING = "attached reference"
	attached_separate_type_mark_name: STRING = "attached separate"
	attached_separate_expanded_type_mark_name: STRING = "attached separate expanded"
	attached_separate_reference_type_mark_name: STRING = "attached separate reference"
	detachable_expanded_type_mark_name: STRING = "detachable expanded"
	detachable_reference_type_mark_name: STRING = "detachable reference"
	detachable_separate_type_mark_name: STRING = "detachable separate"
	detachable_separate_expanded_type_mark_name: STRING = "detachable separate expanded"
	detachable_separate_reference_type_mark_name: STRING = "detachable separate reference"
	separate_expanded_type_mark_name: STRING = "separate expanded"
	separate_reference_type_mark_name: STRING = "separate reference"
	no_type_mark_name: STRING = ""
			-- Type mark names

	arrow_symbol_name: STRING = "->"
	assign_symbol_name: STRING = ":="
	assign_attempt_symbol_name: STRING = "?="
	at_symbol_name: STRING = "@"
	bang_symbol_name: STRING = "!"
	colon_symbol_name: STRING = ":"
	comma_symbol_name: STRING = ","
	div_symbol_name: STRING = "//"
	divide_symbol_name: STRING = "/"
	dollar_symbol_name: STRING = "$"
	dot_symbol_name: STRING = "."
	dotdot_symbol_name: STRING = ".."
	equal_symbol_name: STRING = "="
	ge_symbol_name: STRING = ">="
	gt_symbol_name: STRING = ">"
	le_symbol_name: STRING = "<="
	left_array_symbol_name: STRING = "<<"
	left_brace_symbol_name: STRING = "{"
	left_bracket_symbol_name: STRING = "["
	left_parenthesis_symbol_name: STRING = "("
	lt_symbol_name: STRING = "<"
	minus_symbol_name: STRING = "-"
	mod_symbol_name: STRING = "\\"
	not_equal_symbol_name: STRING = "/="
	not_tilde_symbol_name: STRING = "/~"
	plus_symbol_name: STRING = "+"
	power_symbol_name: STRING = "^"
	question_mark_symbol_name: STRING = "?"
	right_array_symbol_name: STRING = ">>"
	right_brace_symbol_name: STRING = "}"
	right_bracket_symbol_name: STRING = "]"
	right_parenthesis_symbol_name: STRING = ")"
	semicolon_symbol_name: STRING = ";"
	tilde_symbol_name: STRING = "~"
	times_symbol_name: STRING = "*"
			-- Eiffel symbol names

	unknown_name: STRING = "***unknown_name***"
			-- Unknown name

feature -- Keyword and symbol names (used for compatibility with 5.6.0610, to be removed later)

	capitalized_boolean_ref_name: STRING = "BOOLEAN_REF"
	capitalized_character_ref_name: STRING = "CHARACTER_REF"
	capitalized_character_8_ref_name: STRING = "CHARACTER_8_REF"
	capitalized_character_32_ref_name: STRING = "CHARACTER_32_REF"
	capitalized_double_ref_name: STRING = "DOUBLE_REF"
	capitalized_integer_ref_name: STRING = "INTEGER_REF"
	capitalized_integer_8_ref_name: STRING = "INTEGER_8_REF"
	capitalized_integer_16_ref_name: STRING = "INTEGER_16_REF"
	capitalized_integer_32_ref_name: STRING = "INTEGER_32_REF"
	capitalized_integer_64_ref_name: STRING = "INTEGER_64_REF"
	capitalized_natural_ref_name: STRING = "NATURAL_REF"
	capitalized_natural_8_ref_name: STRING = "NATURAL_8_REF"
	capitalized_natural_16_ref_name: STRING = "NATURAL_16_REF"
	capitalized_natural_32_ref_name: STRING = "NATURAL_32_REF"
	capitalized_natural_64_ref_name: STRING = "NATURAL_64_REF"
	capitalized_pointer_ref_name: STRING = "POINTER_REF"
	capitalized_real_ref_name: STRING = "REAL_REF"
	capitalized_real_32_ref_name: STRING = "REAL_32_REF"
	capitalized_real_64_ref_name: STRING = "REAL_64_REF"
	capitalized_wide_character_ref_name: STRING = "WIDE_CHARACTER_REF"
		-- Eiffel class names

feature -- Infix, prefix and alias feature names

	infix_and_name: STRING = "infix %"and%""
	infix_implies_name: STRING = "infix %"implies%""
	infix_or_name: STRING = "infix %"or%""
	infix_xor_name: STRING = "infix %"xor%""
	infix_div_name: STRING = "infix %"//%""
	infix_divide_name: STRING = "infix %"/%""
	infix_ge_name: STRING = "infix %">=%""
	infix_gt_name: STRING = "infix %">%""
	infix_le_name: STRING = "infix %"<=%""
	infix_lt_name: STRING = "infix %"<%""
	infix_minus_name: STRING = "infix %"-%""
	infix_mod_name: STRING = "infix %"\\%""
	infix_plus_name: STRING = "infix %"+%""
	infix_power_name: STRING = "infix %"^%""
	infix_times_name: STRING = "infix %"*%""
	infix_dotdot_name: STRING = "infix %"..%""
	infix_and_then_name: STRING = "infix %"and then%""
	infix_or_else_name: STRING = "infix %"or else%""
			-- Infix feature names

	prefix_not_name: STRING = "prefix %"not%""
	prefix_minus_name: STRING = "prefix %"-%""
	prefix_plus_name: STRING = "prefix %"+%""
			-- Prefix feature names

	alias_and_name: STRING = "alias %"and%""
	alias_implies_name: STRING = "alias %"implies%""
	alias_or_name: STRING = "alias %"or%""
	alias_xor_name: STRING = "alias %"xor%""
	alias_div_name: STRING = "alias %"//%""
	alias_divide_name: STRING = "alias %"/%""
	alias_ge_name: STRING = "alias %">=%""
	alias_gt_name: STRING = "alias %">%""
	alias_le_name: STRING = "alias %"<=%""
	alias_lt_name: STRING = "alias %"<%""
	alias_minus_name: STRING = "alias %"-%""
	alias_mod_name: STRING = "alias %"\\%""
	alias_plus_name: STRING = "alias %"+%""
	alias_power_name: STRING = "alias %"^%""
	alias_times_name: STRING = "alias %"*%""
	alias_dotdot_name: STRING = "alias %"..%""
	alias_and_then_name: STRING = "alias %"and then%""
	alias_or_else_name: STRING = "alias %"or else%""
	alias_not_name: STRING = "alias %"not%""
	alias_bracket_name: STRING = "alias %"[]%""
			-- Alias feature names

feature -- Built-in

	builtin_marker: STRING = "built_in"
			-- Built-in marker

	static_builtin_marker: STRING = "static built_in"
			-- Static built-in marker

	builtin_static_marker: STRING = "built_in static"
			-- Bbuilt-in static marker

feature -- Position

	null_position: ET_POSITION
			-- Null position
		once
			create {ET_COMPRESSED_POSITION} Result.make_default
		ensure
			position_not_void: Result /= Void
			position_is_null: Result.is_null
		end

feature -- Ancestors

	empty_ancestors: ET_BASE_TYPE_LIST
			-- Shared empty ancestors
		once
			create Result.make_with_capacity (0)
		ensure
			ancestors_not_void: Result /= Void
			ancestors_empty: Result.is_empty
		end

feature -- Features

	empty_queries: ET_QUERY_LIST
			-- Shared empty queries
		once
			create Result.make_with_capacity (0)
		ensure
			queries_not_void: Result /= Void
			queries_empty: Result.is_empty
		end

	empty_procedures: ET_PROCEDURE_LIST
			-- Shared empty procedures
		once
			create Result.make_with_capacity (0)
		ensure
			procedures_not_void: Result /= Void
			procedures_empty: Result.is_empty
		end

feature -- Clients

	empty_clients: ET_CLIENT_LIST
			-- Shared empty clients
		once
			create Result.make
		ensure
			clients_not_void: Result /= Void
			clients_empty: Result.is_empty
		end

feature -- System

	unknown_class: ET_CLASS
			-- Shared unknown class "*UNKNOWN*";
			-- This class is equal to no other classes, not even itself;
			-- it does conform to no type, not even itself, and no type
			-- conforms to it
		once
			create Result.make_unknown
			Result.set_group (unknown_group)
			Result.set_parsed
			Result.set_syntax_error
			Result.set_ancestors_built
			Result.set_ancestors_error
			Result.set_features_flattened
			Result.set_flattening_error
			Result.set_interface_checked
			Result.set_interface_error
			Result.set_implementation_checked
			Result.set_implementation_error
		ensure
			unknown_class_not_void: Result /= Void
		end

	unknown_group: ET_UNKNOWN_GROUP
			-- Shared unknown group
		once
			create Result.make
		ensure
			unknown_group_not_void: Result /= Void
		end

	unknown_system: ET_SYSTEM
			-- Shared unknown Eiffel system
		once
			create Result.make ("*unknown*")
		ensure
			unknown_system_not_void: Result /= Void
		end

	unknown_library: ET_LIBRARY
			-- Shared unknown Eiffel class library
		once
			create Result.make ("*unknown*", unknown_system)
		ensure
			unknown_library_not_void: Result /= Void
		end

	unknown_dotnet_assembly: ET_DOTNET_ASSEMBLY
			-- Shared unknown .NET assembly
		once
			create Result.make ("*unknown*", Void, unknown_system)
		ensure
			unknown_dotnet_assembly_not_void: Result /= Void
		end

	standard_error_handler: ET_ERROR_HANDLER
			-- Shared error handler where error messages
			-- will be sent to standard files
		once
			create Result.make_standard
		ensure
			standard_error_handler_not_void: Result /= Void
		end

	default_ast_factory: ET_AST_FACTORY
			-- Shared default Eiffel AST factory
		once
			create Result.make
		ensure
			default_ast_factory_not_void: Result /= Void
		end

feature -- Empty lists

	empty_classes: DS_ARRAYED_LIST [ET_CLASS]
			-- Shared empty list of classes
		once
			create Result.make (0)
		ensure
			list_not_void: Result /= Void
			list_empty: Result.is_empty
		end

	empty_master_classes: DS_ARRAYED_LIST [ET_MASTER_CLASS]
			-- Shared empty list of master classes
		once
			create Result.make (0)
		ensure
			list_not_void: Result /= Void
			list_empty: Result.is_empty
		end

end
