indexing

	description:

		"Eiffel token and symbol constants"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004-2006, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_TOKEN_CONSTANTS

inherit

	ET_TOKEN_CODES

feature -- Class names

	any_class_name: ET_CLASS_NAME is
			-- "ANY" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_any_name)
		ensure
			any_class_name_not_void: Result /= Void
		end

	arguments_class_name: ET_CLASS_NAME is
			-- "ARGUMENTS" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_arguments_name)
		ensure
			arguments_class_name_not_void: Result /= Void
		end

	array_class_name: ET_CLASS_NAME is
			-- "ARRAY" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_array_name)
		ensure
			array_class_name_not_void: Result /= Void
		end

	bit_class_name: ET_CLASS_NAME is
			-- "BIT" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_bit_name)
		ensure
			bit_class_name_not_void: Result /= Void
		end

	boolean_class_name: ET_CLASS_NAME is
			-- "BOOLEAN" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_boolean_name)
		ensure
			boolean_class_name_not_void: Result /= Void
		end

	character_class_name: ET_CLASS_NAME is
			-- "CHARACTER" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_character_name)
		ensure
			character_class_name_not_void: Result /= Void
		end

	character_8_class_name: ET_CLASS_NAME is
			-- "CHARACTER_8" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_character_8_name)
		ensure
			character_8_class_name_not_void: Result /= Void
		end

	character_32_class_name: ET_CLASS_NAME is
			-- "CHARACTER_32" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_character_32_name)
		ensure
			character_32_class_name_not_void: Result /= Void
		end

	double_class_name: ET_CLASS_NAME is
			-- "DOUBLE" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_double_name)
		ensure
			double_class_name_not_void: Result /= Void
		end

	function_class_name: ET_CLASS_NAME is
			-- "FUNCTION" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_function_name)
		ensure
			function_class_name_not_void: Result /= Void
		end

	general_class_name: ET_CLASS_NAME is
			-- "GENERAL" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_general_name)
		ensure
			general_class_name_not_void: Result /= Void
		end

	integer_class_name: ET_CLASS_NAME is
			-- "INTEGER" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_integer_name)
		ensure
			integer_class_name_not_void: Result /= Void
		end

	integer_8_class_name: ET_CLASS_NAME is
			-- "INTEGER_8" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_integer_8_name)
		ensure
			integer_8_class_name_not_void: Result /= Void
		end

	integer_16_class_name: ET_CLASS_NAME is
			-- "INTEGER_16" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_integer_16_name)
		ensure
			integer_16_class_name_not_void: Result /= Void
		end

	integer_32_class_name: ET_CLASS_NAME is
			-- "INTEGER_32" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_integer_32_name)
		ensure
			integer_32_class_name_not_void: Result /= Void
		end

	integer_64_class_name: ET_CLASS_NAME is
			-- "INTEGER_64" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_integer_64_name)
		ensure
			integer_64_class_name_not_void: Result /= Void
		end

	native_array_class_name: ET_CLASS_NAME is
			-- "NATIVE_ARRAY" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_native_array_name)
		ensure
			native_array_class_name_not_void: Result /= Void
		end

	natural_class_name: ET_CLASS_NAME is
			-- "NATURAL" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_natural_name)
		ensure
			natural_class_name_not_void: Result /= Void
		end

	natural_8_class_name: ET_CLASS_NAME is
			-- "NATURAL_8" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_natural_8_name)
		ensure
			natural_8_class_name_not_void: Result /= Void
		end

	natural_16_class_name: ET_CLASS_NAME is
			-- "NATURAL_16" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_natural_16_name)
		ensure
			natural_16_class_name_not_void: Result /= Void
		end

	natural_32_class_name: ET_CLASS_NAME is
			-- "NATURAL_32" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_natural_32_name)
		ensure
			natural_32_class_name_not_void: Result /= Void
		end

	natural_64_class_name: ET_CLASS_NAME is
			-- "NATURAL_64" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_natural_64_name)
		ensure
			natural_64_class_name_not_void: Result /= Void
		end

	none_class_name: ET_CLASS_NAME is
			-- "NONE" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_none_name)
		ensure
			none_class_name_not_void: Result /= Void
		end

	platform_class_name: ET_CLASS_NAME is
			-- "PLATFORM" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_platform_name)
		ensure
			platform_class_name_not_void: Result /= Void
		end

	pointer_class_name: ET_CLASS_NAME is
			-- "POINTER" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_pointer_name)
		ensure
			pointer_class_name_not_void: Result /= Void
		end

	predicate_class_name: ET_CLASS_NAME is
			-- "PREDICATE" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_predicate_name)
		ensure
			predicate_class_name_not_void: Result /= Void
		end

	procedure_class_name: ET_CLASS_NAME is
			-- "PROCEDURE" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_procedure_name)
		ensure
			procedure_class_name_not_void: Result /= Void
		end

	real_class_name: ET_CLASS_NAME is
			-- "REAL" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_real_name)
		ensure
			real_class_name_not_void: Result /= Void
		end

	real_32_class_name: ET_CLASS_NAME is
			-- "REAL_32" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_real_32_name)
		ensure
			real_32_class_name_not_void: Result /= Void
		end

	real_64_class_name: ET_CLASS_NAME is
			-- "REAL_64" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_real_64_name)
		ensure
			real_64_class_name_not_void: Result /= Void
		end

	routine_class_name: ET_CLASS_NAME is
			-- "ROUTINE" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_routine_name)
		ensure
			routine_class_name_not_void: Result /= Void
		end

	special_class_name: ET_CLASS_NAME is
			-- "SPECIAL" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_special_name)
		ensure
			special_class_name_not_void: Result /= Void
		end

	string_class_name: ET_CLASS_NAME is
			-- "STRING" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_string_name)
		ensure
			string_class_name_not_void: Result /= Void
		end

	string_8_class_name: ET_CLASS_NAME is
			-- "STRING_8" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_string_8_name)
		ensure
			string_8_class_name_not_void: Result /= Void
		end

	string_32_class_name: ET_CLASS_NAME is
			-- "STRING_32" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_string_32_name)
		ensure
			string_32_class_name_not_void: Result /= Void
		end

	system_object_class_name: ET_CLASS_NAME is
			-- "SYSTEM_OBJECT" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_system_object_name)
		ensure
			system_object_class_name_not_void: Result /= Void
		end

	tuple_class_name: ET_CLASS_NAME is
			-- "TUPLE" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_tuple_name)
		ensure
			tuple_class_name_not_void: Result /= Void
		end

	type_class_name: ET_CLASS_NAME is
			-- "TYPE" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_type_name)
		ensure
			type_class_name_not_void: Result /= Void
		end

	typed_pointer_class_name: ET_CLASS_NAME is
			-- "TYPED_POINTER" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_typed_pointer_name)
		ensure
			typed_pointer_class_name_not_void: Result /= Void
		end

	wide_character_class_name: ET_CLASS_NAME is
			-- "WIDE_CHARACTER" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_wide_character_name)
		ensure
			wide_character_class_name_not_void: Result /= Void
		end

	unknown_class_name: ET_CLASS_NAME is
			-- "*UNKNOWN*" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_unknown_name)
		ensure
			unknown_class_name_not_void: Result /= Void
		end

feature -- Class names (used for compatibility with 5.6.0610, to be removed later)

	boolean_ref_class_name: ET_CLASS_NAME is
			-- "BOOLEAN_REF" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_boolean_ref_name)
		ensure
			boolean_ref_class_name_not_void: Result /= Void
		end

	character_ref_class_name: ET_CLASS_NAME is
			-- "CHARACTER_REF" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_character_ref_name)
		ensure
			character_ref_class_name_not_void: Result /= Void
		end

	character_8_ref_class_name: ET_CLASS_NAME is
			-- "CHARACTER_8_REF" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_character_8_ref_name)
		ensure
			character_8_ref_class_name_not_void: Result /= Void
		end

	character_32_ref_class_name: ET_CLASS_NAME is
			-- "CHARACTER_32_REF" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_character_32_ref_name)
		ensure
			character_32_ref_class_name_not_void: Result /= Void
		end

	comparable_class_name: ET_CLASS_NAME is
			-- "COMPARABLE" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_comparable_name)
		ensure
			comparable_class_name_not_void: Result /= Void
		end

	double_ref_class_name: ET_CLASS_NAME is
			-- "DOUBLE_REF" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_double_ref_name)
		ensure
			double_ref_class_name_not_void: Result /= Void
		end

	hashable_class_name: ET_CLASS_NAME is
			-- "HASHABLE" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_hashable_name)
		ensure
			hashable_class_name_not_void: Result /= Void
		end

	integer_ref_class_name: ET_CLASS_NAME is
			-- "INTEGER_REF" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_integer_ref_name)
		ensure
			integer_class_name_not_void: Result /= Void
		end

	integer_8_ref_class_name: ET_CLASS_NAME is
			-- "INTEGER_8_REF" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_integer_8_ref_name)
		ensure
			integer_8_ref_class_name_not_void: Result /= Void
		end

	integer_16_ref_class_name: ET_CLASS_NAME is
			-- "INTEGER_16_REF" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_integer_16_ref_name)
		ensure
			integer_16_ref_class_name_not_void: Result /= Void
		end

	integer_32_ref_class_name: ET_CLASS_NAME is
			-- "INTEGER_32_REF" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_integer_32_ref_name)
		ensure
			integer_32_ref_class_name_not_void: Result /= Void
		end

	integer_64_ref_class_name: ET_CLASS_NAME is
			-- "INTEGER_64_REF" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_integer_64_ref_name)
		ensure
			integer_64_ref_class_name_not_void: Result /= Void
		end

	natural_ref_class_name: ET_CLASS_NAME is
			-- "NATURAL_REF" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_natural_ref_name)
		ensure
			natural_ref_class_name_not_void: Result /= Void
		end

	natural_8_ref_class_name: ET_CLASS_NAME is
			-- "NATURAL_8_REF" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_natural_8_ref_name)
		ensure
			natural_8_ref_class_name_not_void: Result /= Void
		end

	natural_16_ref_class_name: ET_CLASS_NAME is
			-- "NATURAL_16_REF" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_natural_16_ref_name)
		ensure
			natural_16_ref_class_name_not_void: Result /= Void
		end

	natural_32_ref_class_name: ET_CLASS_NAME is
			-- "NATURAL_32_REF" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_natural_32_ref_name)
		ensure
			natural_32_ref_class_name_not_void: Result /= Void
		end

	natural_64_ref_class_name: ET_CLASS_NAME is
			-- "NATURAL_64_REF" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_natural_64_ref_name)
		ensure
			natural_64_ref_class_name_not_void: Result /= Void
		end

	numeric_class_name: ET_CLASS_NAME is
			-- "NUMERIC" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_numeric_name)
		ensure
			numeric_class_name_not_void: Result /= Void
		end

	part_comparable_class_name: ET_CLASS_NAME is
			-- "PART_COMPARABLE" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_part_comparable_name)
		ensure
			part_comparable_class_name_not_void: Result /= Void
		end

	pointer_ref_class_name: ET_CLASS_NAME is
			-- "POINTER_REF" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_pointer_ref_name)
		ensure
			pointer_ref_class_name_not_void: Result /= Void
		end

	real_ref_class_name: ET_CLASS_NAME is
			-- "REAL_REF" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_real_ref_name)
		ensure
			real_ref_class_name_not_void: Result /= Void
		end

	real_32_ref_class_name: ET_CLASS_NAME is
			-- "REAL_32_REF" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_real_32_ref_name)
		ensure
			real_32_ref_class_name_not_void: Result /= Void
		end

	real_64_ref_class_name: ET_CLASS_NAME is
			-- "REAL_64_REF" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_real_64_ref_name)
		ensure
			real_64_ref_class_name_not_void: Result /= Void
		end

	wide_character_ref_class_name: ET_CLASS_NAME is
			-- "WIDE_CHARACTER_REF" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_wide_character_ref_name)
		ensure
			wide_character_ref_class_name_not_void: Result /= Void
		end

feature -- Feature names

	aliased_resized_area_feature_name: ET_FEATURE_NAME is
			-- 'aliased_resized_area' feature name
		once
			create {ET_IDENTIFIER} Result.make (aliased_resized_area_name)
		ensure
			aliased_resized_area_feature_name_not_void: Result /= Void
		end

	area_feature_name: ET_FEATURE_NAME is
			-- 'area' feature name
		once
			create {ET_IDENTIFIER} Result.make (area_name)
		ensure
			area_feature_name_not_void: Result /= Void
		end

	argument_feature_name: ET_FEATURE_NAME is
			-- 'argument' feature name
		once
			create {ET_IDENTIFIER} Result.make (argument_name)
		ensure
			argument_feature_name_not_void: Result /= Void
		end

	argument_count_feature_name: ET_FEATURE_NAME is
			-- 'argument_count' feature name
		once
			create {ET_IDENTIFIER} Result.make (argument_count_name)
		ensure
			argument_count_feature_name_not_void: Result /= Void
		end

	as_natural_8_feature_name: ET_FEATURE_NAME is
			-- 'as_natural_8' feature name
		once
			create {ET_IDENTIFIER} Result.make (as_natural_8_name)
		ensure
			as_natural_8_feature_name_not_void: Result /= Void
		end

	as_natural_16_feature_name: ET_FEATURE_NAME is
			-- 'as_natural_16' feature name
		once
			create {ET_IDENTIFIER} Result.make (as_natural_16_name)
		ensure
			as_natural_16_feature_name_not_void: Result /= Void
		end

	as_natural_32_feature_name: ET_FEATURE_NAME is
			-- 'as_natural_32' feature name
		once
			create {ET_IDENTIFIER} Result.make (as_natural_32_name)
		ensure
			as_natural_32_feature_name_not_void: Result /= Void
		end

	as_natural_64_feature_name: ET_FEATURE_NAME is
			-- 'as_natural_64' feature name
		once
			create {ET_IDENTIFIER} Result.make (as_natural_64_name)
		ensure
			as_natural_64_feature_name_not_void: Result /= Void
		end

	as_integer_8_feature_name: ET_FEATURE_NAME is
			-- 'as_integer_8' feature name
		once
			create {ET_IDENTIFIER} Result.make (as_integer_8_name)
		ensure
			as_integer_8_feature_name_not_void: Result /= Void
		end

	as_integer_16_feature_name: ET_FEATURE_NAME is
			-- 'as_integer_16' feature name
		once
			create {ET_IDENTIFIER} Result.make (as_integer_16_name)
		ensure
			as_integer_16_feature_name_not_void: Result /= Void
		end

	as_integer_32_feature_name: ET_FEATURE_NAME is
			-- 'as_integer_32' feature name
		once
			create {ET_IDENTIFIER} Result.make (as_integer_32_name)
		ensure
			as_integer_32_feature_name_not_void: Result /= Void
		end

	as_integer_64_feature_name: ET_FEATURE_NAME is
			-- 'as_integer_84' feature name
		once
			create {ET_IDENTIFIER} Result.make (as_integer_64_name)
		ensure
			as_integer_64_feature_name_not_void: Result /= Void
		end

	bit_and_feature_name: ET_FEATURE_NAME is
			-- 'bit_and' feature name
		once
			create {ET_IDENTIFIER} Result.make (bit_and_name)
		ensure
			bit_and_feature_name_not_void: Result /= Void
		end

	bit_not_feature_name: ET_FEATURE_NAME is
			-- 'bit_not' feature name
		once
			create {ET_IDENTIFIER} Result.make (bit_not_name)
		ensure
			bit_not_feature_name_not_void: Result /= Void
		end

	bit_or_feature_name: ET_FEATURE_NAME is
			-- 'bit_or' feature name
		once
			create {ET_IDENTIFIER} Result.make (bit_or_name)
		ensure
			bit_or_feature_name_not_void: Result /= Void
		end

	bit_shift_left_feature_name: ET_FEATURE_NAME is
			-- 'bit_shift_left' feature name
		once
			create {ET_IDENTIFIER} Result.make (bit_shift_left_name)
		ensure
			bit_shift_left_feature_name_not_void: Result /= Void
		end

	bit_shift_right_feature_name: ET_FEATURE_NAME is
			-- 'bit_shift_right' feature name
		once
			create {ET_IDENTIFIER} Result.make (bit_shift_right_name)
		ensure
			bit_shift_right_feature_name_not_void: Result /= Void
		end

	bit_xor_feature_name: ET_FEATURE_NAME is
			-- 'bit_xor' feature name
		once
			create {ET_IDENTIFIER} Result.make (bit_xor_name)
		ensure
			bit_xor_feature_name_not_void: Result /= Void
		end

	boolean_bytes_feature_name: ET_FEATURE_NAME is
			-- 'boolean_bytes' feature name
		once
			create {ET_IDENTIFIER} Result.make (boolean_bytes_name)
		ensure
			boolean_bytes_feature_name_not_void: Result /= Void
		end

	call_feature_name: ET_FEATURE_NAME is
			-- 'call' feature name
		once
			create {ET_IDENTIFIER} Result.make (call_name)
		ensure
			call_feature_name_not_void: Result /= Void
		end

	ceiling_real_32_feature_name: ET_FEATURE_NAME is
			-- 'ceiling_real_32' feature name
		once
			create {ET_IDENTIFIER} Result.make (ceiling_real_32_name)
		ensure
			ceiling_real_32_feature_name_not_void: Result /= Void
		end

	ceiling_real_64_feature_name: ET_FEATURE_NAME is
			-- 'ceiling_real_64' feature name
		once
			create {ET_IDENTIFIER} Result.make (ceiling_real_64_name)
		ensure
			ceiling_real_64_feature_name_not_void: Result /= Void
		end

	character_bytes_feature_name: ET_FEATURE_NAME is
			-- 'character_bytes' feature name
		once
			create {ET_IDENTIFIER} Result.make (character_bytes_name)
		ensure
			character_bytes_feature_name_not_void: Result /= Void
		end

	code_feature_name: ET_FEATURE_NAME is
			-- 'code' feature name
		once
			create {ET_IDENTIFIER} Result.make (code_name)
		ensure
			code_feature_name_not_void: Result /= Void
		end

	conforms_to_feature_name: ET_FEATURE_NAME is
			-- 'conforms_to' feature name
		once
			create {ET_IDENTIFIER} Result.make (conforms_to_name)
		ensure
			conforms_to_feature_name_not_void: Result /= Void
		end

	copy_feature_name: ET_FEATURE_NAME is
			-- 'copy' feature name
		once
			create {ET_IDENTIFIER} Result.make (copy_name)
		ensure
			copy_feature_name_not_void: Result /= Void
		end

	count_feature_name: ET_FEATURE_NAME is
			-- 'count' feature name
		once
			create {ET_IDENTIFIER} Result.make (count_name)
		ensure
			count_feature_name_not_void: Result /= Void
		end

	deep_twin_feature_name: ET_FEATURE_NAME is
			-- 'deep_twin' feature name
		once
			create {ET_IDENTIFIER} Result.make (deep_twin_name)
		ensure
			deep_twin_feature_name_not_void: Result /= Void
		end

	default_create_feature_name: ET_FEATURE_NAME is
			-- 'default_create' feature name
		once
			create {ET_IDENTIFIER} Result.make (default_create_name)
		ensure
			default_create_feature_name_not_void: Result /= Void
		end

	element_size_feature_name: ET_FEATURE_NAME is
			-- 'element_size' feature name
		once
			create {ET_IDENTIFIER} Result.make (element_size_name)
		ensure
			element_size_feature_name_not_void: Result /= Void
		end

	floor_real_32_feature_name: ET_FEATURE_NAME is
			-- 'floor_real_32' feature name
		once
			create {ET_IDENTIFIER} Result.make (floor_real_32_name)
		ensure
			floor_real_32_feature_name_not_void: Result /= Void
		end

	floor_real_64_feature_name: ET_FEATURE_NAME is
			-- 'floor_real_64' feature name
		once
			create {ET_IDENTIFIER} Result.make (floor_real_64_name)
		ensure
			floor_real_64_feature_name_not_void: Result /= Void
		end

	generating_type_feature_name: ET_FEATURE_NAME is
			-- 'generating_type' feature name
		once
			create {ET_IDENTIFIER} Result.make (generating_type_name)
		ensure
			generating_type_feature_name_not_void: Result /= Void
		end

	generator_feature_name: ET_FEATURE_NAME is
			-- 'generator' feature name
		once
			create {ET_IDENTIFIER} Result.make (generator_name)
		ensure
			generator_feature_name_not_void: Result /= Void
		end

	hash_code_feature_name: ET_FEATURE_NAME is
			-- 'hash_code' feature name
		once
			create {ET_IDENTIFIER} Result.make (hash_code_name)
		ensure
			hash_code_feature_name_not_void: Result /= Void
		end

	infix_and_feature_name: ET_FEATURE_NAME is
			-- 'infix "and"' feature name
		local
			l_string: ET_REGULAR_MANIFEST_STRING
		once
			create l_string.make (and_keyword_name)
			create {ET_INFIX_NAME} Result.make_and (l_string)
		ensure
			infix_and_feature_name_not_void: Result /= Void
		end

	infix_and_then_feature_name: ET_FEATURE_NAME is
			-- 'infix "and then"' feature name
		local
			l_string: ET_REGULAR_MANIFEST_STRING
		once
			create l_string.make (and_then_keywords_name)
			create {ET_INFIX_NAME} Result.make_and_then (l_string)
		ensure
			infix_and_then_feature_name_not_void: Result /= Void
		end

	infix_at_feature_name: ET_FEATURE_NAME is
			-- 'infix "@"' feature name
		local
			l_string: ET_REGULAR_MANIFEST_STRING
		once
			create l_string.make (at_symbol_name)
			create {ET_INFIX_FREE_NAME} Result.make (l_string)
		ensure
			infix_at_feature_name_not_void: Result /= Void
		end

	infix_div_feature_name: ET_FEATURE_NAME is
			-- 'infix "//"' feature name
		local
			l_string: ET_REGULAR_MANIFEST_STRING
		once
			create l_string.make (div_symbol_name)
			create {ET_INFIX_NAME} Result.make_div (l_string)
		ensure
			infix_div_feature_name_not_void: Result /= Void
		end

	infix_divide_feature_name: ET_FEATURE_NAME is
			-- 'infix "/"' feature name
		local
			l_string: ET_REGULAR_MANIFEST_STRING
		once
			create l_string.make (divide_symbol_name)
			create {ET_INFIX_NAME} Result.make_divide (l_string)
		ensure
			infix_divide_feature_name_not_void: Result /= Void
		end

	infix_ge_feature_name: ET_FEATURE_NAME is
			-- 'infix ">="' feature name
		local
			l_string: ET_REGULAR_MANIFEST_STRING
		once
			create l_string.make (le_symbol_name)
			create {ET_INFIX_NAME} Result.make_ge (l_string)
		ensure
			infix_ge_feature_name_not_void: Result /= Void
		end

	infix_gt_feature_name: ET_FEATURE_NAME is
			-- 'infix ">"' feature name
		local
			l_string: ET_REGULAR_MANIFEST_STRING
		once
			create l_string.make (gt_symbol_name)
			create {ET_INFIX_NAME} Result.make_gt (l_string)
		ensure
			infix_gt_feature_name_not_void: Result /= Void
		end

	infix_implies_feature_name: ET_FEATURE_NAME is
			-- 'infix "implies"' feature name
		local
			l_string: ET_REGULAR_MANIFEST_STRING
		once
			create l_string.make (implies_keyword_name)
			create {ET_INFIX_NAME} Result.make_implies (l_string)
		ensure
			infix_implies_feature_name_not_void: Result /= Void
		end

	infix_le_feature_name: ET_FEATURE_NAME is
			-- 'infix "<="' feature name
		local
			l_string: ET_REGULAR_MANIFEST_STRING
		once
			create l_string.make (le_symbol_name)
			create {ET_INFIX_NAME} Result.make_le (l_string)
		ensure
			infix_le_feature_name_not_void: Result /= Void
		end

	infix_lt_feature_name: ET_FEATURE_NAME is
			-- 'infix "<"' feature name
		local
			l_string: ET_REGULAR_MANIFEST_STRING
		once
			create l_string.make (lt_symbol_name)
			create {ET_INFIX_NAME} Result.make_lt (l_string)
		ensure
			infix_lt_feature_name_not_void: Result /= Void
		end

	infix_minus_feature_name: ET_FEATURE_NAME is
			-- 'infix "-"' feature name
		local
			l_string: ET_REGULAR_MANIFEST_STRING
		once
			create l_string.make (minus_symbol_name)
			create {ET_INFIX_NAME} Result.make_minus (l_string)
		ensure
			infix_minus_feature_name_not_void: Result /= Void
		end

	infix_mod_feature_name: ET_FEATURE_NAME is
			-- 'infix "\\"' feature name
		local
			l_string: ET_REGULAR_MANIFEST_STRING
		once
			create l_string.make (mod_symbol_name)
			create {ET_INFIX_NAME} Result.make_mod (l_string)
		ensure
			infix_mod_feature_name_not_void: Result /= Void
		end

	infix_or_feature_name: ET_FEATURE_NAME is
			-- 'infix "or"' feature name
		local
			l_string: ET_REGULAR_MANIFEST_STRING
		once
			create l_string.make (or_keyword_name)
			create {ET_INFIX_NAME} Result.make_or (l_string)
		ensure
			infix_or_feature_name_not_void: Result /= Void
		end

	infix_or_else_feature_name: ET_FEATURE_NAME is
			-- 'infix "or else"' feature name
		local
			l_string: ET_REGULAR_MANIFEST_STRING
		once
			create l_string.make (or_else_keywords_name)
			create {ET_INFIX_NAME} Result.make_or_else (l_string)
		ensure
			infix_or_else_feature_name_not_void: Result /= Void
		end

	infix_plus_feature_name: ET_FEATURE_NAME is
			-- 'infix "+"' feature name
		local
			l_string: ET_REGULAR_MANIFEST_STRING
		once
			create l_string.make (plus_symbol_name)
			create {ET_INFIX_NAME} Result.make_plus (l_string)
		ensure
			infix_plus_feature_name_not_void: Result /= Void
		end

	infix_power_feature_name: ET_FEATURE_NAME is
			-- 'infix "^"' feature name
		local
			l_string: ET_REGULAR_MANIFEST_STRING
		once
			create l_string.make (power_symbol_name)
			create {ET_INFIX_NAME} Result.make_power (l_string)
		ensure
			infix_power_feature_name_not_void: Result /= Void
		end

	infix_times_feature_name: ET_FEATURE_NAME is
			-- 'infix "*"' feature name
		local
			l_string: ET_REGULAR_MANIFEST_STRING
		once
			create l_string.make (times_symbol_name)
			create {ET_INFIX_NAME} Result.make_times (l_string)
		ensure
			infix_times_feature_name_not_void: Result /= Void
		end

	infix_xor_feature_name: ET_FEATURE_NAME is
			-- 'infix "xor"' feature name
		local
			l_string: ET_REGULAR_MANIFEST_STRING
		once
			create l_string.make (xor_keyword_name)
			create {ET_INFIX_NAME} Result.make_xor (l_string)
		ensure
			infix_xor_feature_name_not_void: Result /= Void
		end

	integer_bytes_feature_name: ET_FEATURE_NAME is
			-- 'integer_bytes' feature name
		once
			create {ET_IDENTIFIER} Result.make (integer_bytes_name)
		ensure
			integer_bytes_feature_name_not_void: Result /= Void
		end

	invariant_feature_name: ET_FEATURE_NAME is
			-- Fictitious 'invariant' feature name
		once
			create {ET_IDENTIFIER} Result.make (invariant_keyword_name)
		ensure
			invariant_feature_name_not_void: Result /= Void
		end

	is_deep_equal_feature_name: ET_FEATURE_NAME is
			-- 'is_deep_equal' feature name
		once
			create {ET_IDENTIFIER} Result.make (is_deep_equal_name)
		ensure
			is_deep_equal_feature_name_not_void: Result /= Void
		end

	is_dotnet_feature_name: ET_FEATURE_NAME is
			-- 'is_dotnet' feature name
		once
			create {ET_IDENTIFIER} Result.make (is_dotnet_name)
		ensure
			is_dotnet_feature_name_not_void: Result /= Void
		end

	is_unix_feature_name: ET_FEATURE_NAME is
			-- 'is_unix' feature name
		once
			create {ET_IDENTIFIER} Result.make (is_unix_name)
		ensure
			is_unix_feature_name_not_void: Result /= Void
		end

	is_vms_feature_name: ET_FEATURE_NAME is
			-- 'is_vms' feature name
		once
			create {ET_IDENTIFIER} Result.make (is_vms_name)
		ensure
			is_vms_feature_name_not_void: Result /= Void
		end

	is_windows_feature_name: ET_FEATURE_NAME is
			-- 'is_windowsvms' feature name
		once
			create {ET_IDENTIFIER} Result.make (is_windows_name)
		ensure
			is_windows_feature_name_not_void: Result /= Void
		end

	item_feature_name: ET_FEATURE_NAME is
			-- 'item' feature name
		once
			create {ET_IDENTIFIER} Result.make (item_name)
		ensure
			item_feature_name_not_void: Result /= Void
		end

	last_result_feature_name: ET_FEATURE_NAME is
			-- 'last_result' feature name
		once
			create {ET_IDENTIFIER} Result.make (last_result_name)
		ensure
			last_result_feature_name_not_void: Result /= Void
		end

	lower_feature_name: ET_FEATURE_NAME is
			-- 'lower' feature name
		once
			create {ET_IDENTIFIER} Result.make (lower_name)
		ensure
			lower_feature_name_not_void: Result /= Void
		end

	make_feature_name: ET_FEATURE_NAME is
			-- 'make' feature name
		once
			create {ET_IDENTIFIER} Result.make (make_name)
		ensure
			make_feature_name_not_void: Result /= Void
		end

	out_feature_name: ET_FEATURE_NAME is
			-- 'out' feature name
		once
			create {ET_IDENTIFIER} Result.make (out_name)
		ensure
			out_feature_name_not_void: Result /= Void
		end

	pointer_bytes_feature_name: ET_FEATURE_NAME is
			-- 'pointer_bytes' feature name
		once
			create {ET_IDENTIFIER} Result.make (pointer_bytes_name)
		ensure
			pointer_bytes_feature_name_not_void: Result /= Void
		end

	pointer_item_feature_name: ET_FEATURE_NAME is
			-- 'pointer_item' feature name
		once
			create {ET_IDENTIFIER} Result.make (pointer_item_name)
		ensure
			pointer_item_feature_name_not_void: Result /= Void
		end

	prefix_minus_feature_name: ET_FEATURE_NAME is
			-- 'prefix "-"' feature name
		local
			l_string: ET_REGULAR_MANIFEST_STRING
		once
			create l_string.make (minus_symbol_name)
			create {ET_PREFIX_NAME} Result.make_minus (l_string)
		ensure
			prefix_minus_feature_name_not_void: Result /= Void
		end

	prefix_not_feature_name: ET_FEATURE_NAME is
			-- 'prefix "not"' feature name
		local
			l_string: ET_REGULAR_MANIFEST_STRING
		once
			create l_string.make (not_keyword_name)
			create {ET_PREFIX_NAME} Result.make_not (l_string)
		ensure
			prefix_not_feature_name_not_void: Result /= Void
		end

	prefix_plus_feature_name: ET_FEATURE_NAME is
			-- 'prefix "+"' feature name
		local
			l_string: ET_REGULAR_MANIFEST_STRING
		once
			create l_string.make (plus_symbol_name)
			create {ET_PREFIX_NAME} Result.make_plus (l_string)
		ensure
			prefix_plus_feature_name_not_void: Result /= Void
		end

	put_feature_name: ET_FEATURE_NAME is
			-- 'put' feature name
		once
			create {ET_IDENTIFIER} Result.make (put_name)
		ensure
			put_feature_name_not_void: Result /= Void
		end

	put_reference_feature_name: ET_FEATURE_NAME is
			-- 'put_reference' feature name
		once
			create {ET_IDENTIFIER} Result.make (put_reference_name)
		ensure
			put_reference_feature_name_not_void: Result /= Void
		end

	real_bytes_feature_name: ET_FEATURE_NAME is
			-- 'real_bytes' feature name
		once
			create {ET_IDENTIFIER} Result.make (real_bytes_name)
		ensure
			real_bytes_feature_name_not_void: Result /= Void
		end

	reference_item_feature_name: ET_FEATURE_NAME is
			-- 'reference_item' feature name
		once
			create {ET_IDENTIFIER} Result.make (reference_item_name)
		ensure
			reference_item_feature_name_not_void: Result /= Void
		end

	same_type_feature_name: ET_FEATURE_NAME is
			-- 'same_type' feature name
		once
			create {ET_IDENTIFIER} Result.make (same_type_name)
		ensure
			same_type_feature_name_not_void: Result /= Void
		end

	set_item_feature_name: ET_FEATURE_NAME is
			-- 'set_item' feature name
		once
			create {ET_IDENTIFIER} Result.make (set_item_name)
		ensure
			set_item_feature_name_not_void: Result /= Void
		end

	set_operands_feature_name: ET_FEATURE_NAME is
			-- 'set_operands' feature name
		once
			create {ET_IDENTIFIER} Result.make (set_operands_name)
		ensure
			set_operands_feature_name_not_void: Result /= Void
		end

	standard_copy_feature_name: ET_FEATURE_NAME is
			-- 'standard_copy' feature name
		once
			create {ET_IDENTIFIER} Result.make (standard_copy_name)
		ensure
			standard_copy_feature_name_not_void: Result /= Void
		end

	standard_is_equal_feature_name: ET_FEATURE_NAME is
			-- 'standard_is_equal' feature name
		once
			create {ET_IDENTIFIER} Result.make (standard_is_equal_name)
		ensure
			standard_is_equal_feature_name_not_void: Result /= Void
		end

	standard_twin_feature_name: ET_FEATURE_NAME is
			-- 'standard_twin' feature name
		once
			create {ET_IDENTIFIER} Result.make (standard_twin_name)
		ensure
			standard_twin_feature_name_not_void: Result /= Void
		end

	tagged_out_feature_name: ET_FEATURE_NAME is
			-- 'tagged_out' feature name
		once
			create {ET_IDENTIFIER} Result.make (tagged_out_name)
		ensure
			tagged_out_feature_name_not_void: Result /= Void
		end

	to_character_feature_name: ET_FEATURE_NAME is
			-- 'to_character' feature name
		once
			create {ET_IDENTIFIER} Result.make (to_character_name)
		ensure
			to_character_feature_name_not_void: Result /= Void
		end

	to_double_feature_name: ET_FEATURE_NAME is
			-- 'to_double' feature name
		once
			create {ET_IDENTIFIER} Result.make (to_double_name)
		ensure
			to_double_feature_name_not_void: Result /= Void
		end

	to_integer_32_feature_name: ET_FEATURE_NAME is
			-- 'to_integer_32' feature name
		once
			create {ET_IDENTIFIER} Result.make (to_integer_32_name)
		ensure
			to_integer_32_feature_name_not_void: Result /= Void
		end

	to_real_feature_name: ET_FEATURE_NAME is
			-- 'to_real' feature name
		once
			create {ET_IDENTIFIER} Result.make (to_real_name)
		ensure
			to_real_feature_name_not_void: Result /= Void
		end

	to_real_32_feature_name: ET_FEATURE_NAME is
			-- 'to_real_32' feature name
		once
			create {ET_IDENTIFIER} Result.make (to_real_32_name)
		ensure
			to_real_32_feature_name_not_void: Result /= Void
		end

	to_real_64_feature_name: ET_FEATURE_NAME is
			-- 'to_real_64' feature name
		once
			create {ET_IDENTIFIER} Result.make (to_real_64_name)
		ensure
			to_real_64_feature_name_not_void: Result /= Void
		end

	truncated_to_integer_feature_name: ET_FEATURE_NAME is
			-- 'truncated_to_integer' feature name
		once
			create {ET_IDENTIFIER} Result.make (truncated_to_integer_name)
		ensure
			truncated_to_integer_feature_name_not_void: Result /= Void
		end

	truncated_to_integer_64_feature_name: ET_FEATURE_NAME is
			-- 'truncated_to_integer_64' feature name
		once
			create {ET_IDENTIFIER} Result.make (truncated_to_integer_64_name)
		ensure
			truncated_to_integer_64_feature_name_not_void: Result /= Void
		end

	truncated_to_real_feature_name: ET_FEATURE_NAME is
			-- 'truncated_to_real' feature name
		once
			create {ET_IDENTIFIER} Result.make (truncated_to_real_name)
		ensure
			truncated_to_real_feature_name_not_void: Result /= Void
		end

	twin_feature_name: ET_FEATURE_NAME is
			-- 'twin' feature name
		once
			create {ET_IDENTIFIER} Result.make (twin_name)
		ensure
			twin_feature_name_not_void: Result /= Void
		end

	upper_feature_name: ET_FEATURE_NAME is
			-- 'upper' feature name
		once
			create {ET_IDENTIFIER} Result.make (upper_name)
		ensure
			upper_feature_name_not_void: Result /= Void
		end

	void_feature_name: ET_FEATURE_NAME is
			-- 'Void' feature name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_void_keyword_name)
		ensure
			default_create_feature_name_not_void: Result /= Void
		end

feature -- Types

	like_current: ET_LIKE_CURRENT is
			-- Type 'like Current'
		once
			create Result.make
		ensure
			like_current_not_void: Result /= Void
		end

	formal_parameter_1: ET_FORMAL_PARAMETER_TYPE is
			-- Type 'G#1'
		local
			l_name: ET_IDENTIFIER
		once
			create l_name.make ("G")
			create Result.make (l_name, 1)
		ensure
			formal_parameter_not_void: Result /= Void
		end

	formal_parameter_2: ET_FORMAL_PARAMETER_TYPE is
			-- Type 'G#2'
		local
			l_name: ET_IDENTIFIER
		once
			create l_name.make ("H")
			create Result.make (l_name, 2)
		ensure
			formal_parameter_not_void: Result /= Void
		end

	formal_parameter_3: ET_FORMAL_PARAMETER_TYPE is
			-- Type 'G#3'
		local
			l_name: ET_IDENTIFIER
		once
			create l_name.make ("I")
			create Result.make (l_name, 3)
		ensure
			formal_parameter_not_void: Result /= Void
		end

feature -- Symbols

	symbol: ET_SYMBOL is
			-- Dummy symbol
		once
			create Result.make_arrow
		ensure
			symbol_not_void: Result /= Void
		end

	arrow_symbol: ET_SYMBOL is
			-- '->' symbol
		once
			create Result.make_arrow
		ensure
			symbol_not_void: Result /= Void
		end

	assign_symbol: ET_SYMBOL is
			-- ':=' symbol
		once
			create Result.make_assign
		ensure
			symbol_not_void: Result /= Void
		end

	assign_attempt_symbol: ET_SYMBOL is
			-- '?=' symbol
		once
			create Result.make_assign_attempt
		ensure
			symbol_not_void: Result /= Void
		end

	bang_symbol: ET_SYMBOL is
			-- '!' symbol
		once
			create Result.make_bang
		ensure
			symbol_not_void: Result /= Void
		end

	colon_symbol: ET_SYMBOL is
			-- ':' symbol
		once
			create Result.make_colon
		ensure
			symbol_not_void: Result /= Void
		end

	comma_symbol: ET_SYMBOL is
			-- ',' symbol
		once
			create Result.make_comma
		ensure
			symbol_not_void: Result /= Void
		end

	dollar_symbol: ET_SYMBOL is
			-- '$' symbol
		once
			create Result.make_dollar
		ensure
			symbol_not_void: Result /= Void
		end

	dot_symbol: ET_SYMBOL is
			-- '.' symbol
		once
			create Result.make_dot
		ensure
			symbol_not_void: Result /= Void
		end

	dotdot_symbol: ET_SYMBOL is
			-- '..' symbol
		once
			create Result.make_dotdot
		ensure
			symbol_not_void: Result /= Void
		end

	left_array_symbol: ET_SYMBOL is
			-- '<<' symbol
		once
			create Result.make_left_array
		ensure
			symbol_not_void: Result /= Void
		end

	left_brace_symbol: ET_SYMBOL is
			-- '{' symbol
		once
			create Result.make_left_brace
		ensure
			symbol_not_void: Result /= Void
		end

	left_bracket_symbol: ET_BRACKET_SYMBOL is
			-- '[' symbol
		once
			create Result.make
		ensure
			symbol_not_void: Result /= Void
		end

	left_parenthesis_symbol: ET_SYMBOL is
			-- '(' symbol
		once
			create Result.make_left_parenthesis
		ensure
			symbol_not_void: Result /= Void
		end

	question_mark_symbol: ET_QUESTION_MARK_SYMBOL is
			-- '?' symbol
		once
			create Result.make
		ensure
			symbol_not_void: Result /= Void
		end

	right_array_symbol: ET_SYMBOL is
			-- '>>' symbol
		once
			create Result.make_right_array
		ensure
			symbol_not_void: Result /= Void
		end

	right_brace_symbol: ET_SYMBOL is
			-- '}' symbol
		once
			create Result.make_right_brace
		ensure
			symbol_not_void: Result /= Void
		end

	right_bracket_symbol: ET_SYMBOL is
			-- ']' symbol
		once
			create Result.make_right_bracket
		ensure
			symbol_not_void: Result /= Void
		end

	right_parenthesis_symbol: ET_SYMBOL is
			-- ')' symbol
		once
			create Result.make_right_parenthesis
		ensure
			symbol_not_void: Result /= Void
		end

	semicolon_symbol: ET_SEMICOLON_SYMBOL is
			-- ';' symbol
		do
			create Result.make
		ensure
			symbol_not_void: Result /= Void
		end

	tilde_symbol: ET_SYMBOL is
			-- '~' symbol
		once
			create Result.make_tilde
		ensure
			symbol_not_void: Result /= Void
		end

feature -- Keywords

	keyword: ET_KEYWORD is
			-- Dummy keyword
		once
			Result := strip_keyword
		ensure
			keyword_not_void: Result /= Void
		end

	agent_keyword: ET_KEYWORD is
			-- 'agent' keyword
		once
			create Result.make_agent
		ensure
			keyword_not_void: Result /= Void
		end

	and_keyword: ET_KEYWORD_OPERATOR is
			-- 'and' keyword
		once
			create Result.make_and
		ensure
			keyword_not_void: Result /= Void
		end

	alias_keyword: ET_KEYWORD is
			-- 'alias' keyword
		once
			create Result.make_alias
		ensure
			keyword_not_void: Result /= Void
		end

	all_keyword: ET_KEYWORD is
			-- 'all' keyword
		once
			create Result.make_all
		ensure
			keyword_not_void: Result /= Void
		end

	as_keyword: ET_KEYWORD is
			-- 'as' keyword
		once
			create Result.make_as
		ensure
			keyword_not_void: Result /= Void
		end

	assign_keyword: ET_KEYWORD is
			-- 'assign' keyword
		once
			create Result.make_assign
		ensure
			keyword_not_void: Result /= Void
		end

	attribute_keyword: ET_KEYWORD is
			-- 'attribute' keyword
		once
			create Result.make_attribute
		ensure
			keyword_not_void: Result /= Void
		end

	bit_keyword: ET_IDENTIFIER is
			-- 'BIT' keyword
		once
			create Result.make (capitalized_bit_name)
		ensure
			keyword_not_void: Result /= Void
		end

	check_keyword: ET_KEYWORD is
			-- 'check' keyword
		once
			create Result.make_check
		ensure
			keyword_not_void: Result /= Void
		end

	class_keyword: ET_KEYWORD is
			-- 'class' keyword
		once
			create Result.make_class
		ensure
			keyword_not_void: Result /= Void
		end

	convert_keyword: ET_KEYWORD is
			-- 'convert' keyword
		once
			create Result.make_convert
		ensure
			keyword_not_void: Result /= Void
		end

	create_keyword: ET_KEYWORD is
			-- 'create' keyword
		once
			create Result.make_create
		ensure
			keyword_not_void: Result /= Void
		end

	creation_keyword: ET_KEYWORD is
			-- 'creation' keyword
		once
			create Result.make_creation
		ensure
			keyword_not_void: Result /= Void
		end

	current_keyword: ET_CURRENT is
			-- 'Current' keyword
		once
			create Result.make
		ensure
			keyword_not_void: Result /= Void
		end

	debug_keyword: ET_KEYWORD is
			-- 'debug' keyword
		once
			create Result.make_debug
		ensure
			keyword_not_void: Result /= Void
		end

	deferred_keyword: ET_KEYWORD is
			-- 'deferred' keyword
		once
			create Result.make_deferred
		ensure
			keyword_not_void: Result /= Void
		end

	do_keyword: ET_KEYWORD is
			-- 'do' keyword
		once
			create Result.make_do
		ensure
			keyword_not_void: Result /= Void
		end

	else_keyword: ET_KEYWORD is
			-- 'else' keyword
		once
			create Result.make_else
		ensure
			keyword_not_void: Result /= Void
		end

	elseif_keyword: ET_KEYWORD is
			-- 'elseif' keyword
		once
			create Result.make_elseif
		ensure
			keyword_not_void: Result /= Void
		end

	end_keyword: ET_KEYWORD is
			-- 'end' keyword
		once
			create Result.make_end
		ensure
			keyword_not_void: Result /= Void
		end

	ensure_keyword: ET_KEYWORD is
			-- 'ensure' keyword
		once
			create Result.make_ensure
		ensure
			keyword_not_void: Result /= Void
		end

	expanded_keyword: ET_KEYWORD is
			-- 'expanded' keyword
		once
			create Result.make_expanded
		ensure
			keyword_not_void: Result /= Void
		end

	export_keyword: ET_KEYWORD is
			-- 'export' keyword
		once
			create Result.make_export
		ensure
			keyword_not_void: Result /= Void
		end

	external_keyword: ET_KEYWORD is
			-- 'external' keyword
		once
			create Result.make_external
		ensure
			keyword_not_void: Result /= Void
		end

	feature_keyword: ET_KEYWORD is
			-- 'feature' keyword
		once
			create Result.make_feature
		ensure
			keyword_not_void: Result /= Void
		end

	from_keyword: ET_KEYWORD is
			-- 'from' keyword
		once
			create Result.make_from
		ensure
			keyword_not_void: Result /= Void
		end

	if_keyword: ET_KEYWORD is
			-- 'if' keyword
		once
			create Result.make_if
		ensure
			keyword_not_void: Result /= Void
		end

	indexing_keyword: ET_KEYWORD is
			-- 'indexing' keyword
		once
			create Result.make_indexing
		ensure
			keyword_not_void: Result /= Void
		end

	infix_keyword: ET_KEYWORD is
			-- 'infix' keyword
		once
			create Result.make_infix
		ensure
			keyword_not_void: Result /= Void
		end

	inherit_keyword: ET_KEYWORD is
			-- 'inherit' keyword
		once
			create Result.make_inherit
		ensure
			keyword_not_void: Result /= Void
		end

	inspect_keyword: ET_KEYWORD is
			-- 'inspect' keyword
		once
			create Result.make_inspect
		ensure
			keyword_not_void: Result /= Void
		end

	invariant_keyword: ET_KEYWORD is
			-- 'invariant' keyword
		once
			create Result.make_invariant
		ensure
			keyword_not_void: Result /= Void
		end

	is_keyword: ET_KEYWORD is
			-- 'is' keyword
		once
			create Result.make_is
		ensure
			keyword_not_void: Result /= Void
		end

	like_keyword: ET_KEYWORD is
			-- 'like' keyword
		once
			create Result.make_like
		ensure
			keyword_not_void: Result /= Void
		end

	local_keyword: ET_KEYWORD is
			-- 'local' keyword
		once
			create Result.make_local
		ensure
			keyword_not_void: Result /= Void
		end

	loop_keyword: ET_KEYWORD is
			-- 'loop' keyword
		once
			create Result.make_loop
		ensure
			keyword_not_void: Result /= Void
		end

	obsolete_keyword: ET_KEYWORD is
			-- 'obsolete' keyword
		once
			create Result.make_obsolete
		ensure
			keyword_not_void: Result /= Void
		end

	old_keyword: ET_KEYWORD is
			-- 'old' keyword
		once
			create Result.make_old
		ensure
			keyword_not_void: Result /= Void
		end

	once_keyword: ET_KEYWORD is
			-- 'once' keyword
		once
			create Result.make_once
		ensure
			keyword_not_void: Result /= Void
		end

	or_keyword: ET_KEYWORD_OPERATOR is
			-- 'or' keyword
		once
			create Result.make_or
		ensure
			keyword_not_void: Result /= Void
		end

	precursor_keyword: ET_PRECURSOR_KEYWORD is
			-- 'precursor' keyword
		once
			create Result.make
		ensure
			keyword_not_void: Result /= Void
		end

	prefix_keyword: ET_KEYWORD is
			-- 'prefix' keyword
		once
			create Result.make_prefix
		ensure
			keyword_not_void: Result /= Void
		end

	recast_keyword: ET_KEYWORD is
			-- 'recast' keyword
		once
			create Result.make_recast
		ensure
			keyword_not_void: Result /= Void
		end

	redefine_keyword: ET_KEYWORD is
			-- 'redefine' keyword
		once
			create Result.make_redefine
		ensure
			keyword_not_void: Result /= Void
		end

	reference_keyword: ET_KEYWORD is
			-- 'reference' keyword
		once
			create Result.make_reference
		ensure
			keyword_not_void: Result /= Void
		end

	rename_keyword: ET_KEYWORD is
			-- 'rename' keyword
		once
			create Result.make_rename
		ensure
			keyword_not_void: Result /= Void
		end

	require_keyword: ET_KEYWORD is
			-- 'require' keyword
		once
			create Result.make_require
		ensure
			keyword_not_void: Result /= Void
		end

	rescue_keyword: ET_KEYWORD is
			-- 'rescue' keyword
		once
			create Result.make_rescue
		ensure
			keyword_not_void: Result /= Void
		end

	result_keyword: ET_RESULT is
			-- 'Result' keyword
		once
			create Result.make
		ensure
			keyword_not_void: Result /= Void
		end

	select_keyword: ET_KEYWORD is
			-- 'select' keyword
		once
			create Result.make_select
		ensure
			keyword_not_void: Result /= Void
		end

	strip_keyword: ET_KEYWORD is
			-- 'strip' keyword
		once
			create Result.make_strip
		ensure
			keyword_not_void: Result /= Void
		end

	then_keyword: ET_KEYWORD is
			-- 'then' keyword
		once
			create Result.make_then
		ensure
			keyword_not_void: Result /= Void
		end

	tuple_keyword: ET_IDENTIFIER is
			-- 'TUPLE' keyword
		once
			create Result.make (capitalized_tuple_name)
		ensure
			keyword_not_void: Result /= Void
		end

	undefine_keyword: ET_KEYWORD is
			-- 'undefine' keyword
		once
			create Result.make_undefine
		ensure
			keyword_not_void: Result /= Void
		end

	unique_keyword: ET_KEYWORD is
			-- 'unique' keyword
		once
			create Result.make_unique
		ensure
			keyword_not_void: Result /= Void
		end

	until_keyword: ET_KEYWORD is
			-- 'until' keyword
		once
			create Result.make_until
		ensure
			keyword_not_void: Result /= Void
		end

	variant_keyword: ET_KEYWORD is
			-- 'variant' keyword
		once
			create Result.make_variant
		ensure
			keyword_not_void: Result /= Void
		end

	void_keyword: ET_VOID is
			-- 'Void' keyword
		once
			create Result.make
		ensure
			keyword_not_void: Result /= Void
		end

	when_keyword: ET_KEYWORD is
			-- 'when' keyword
		once
			create Result.make_when
		ensure
			keyword_not_void: Result /= Void
		end

feature -- Keyword and symbol names

	capitalized_any_name: STRING is "ANY"
	capitalized_arguments_name: STRING is "ARGUMENTS"
	capitalized_array_name: STRING is "ARRAY"
	capitalized_bit_name: STRING is "BIT"
	capitalized_boolean_name: STRING is "BOOLEAN"
	capitalized_character_name: STRING is "CHARACTER"
	capitalized_character_8_name: STRING is "CHARACTER_8"
	capitalized_character_32_name: STRING is "CHARACTER_32"
	capitalized_double_name: STRING is "DOUBLE"
	capitalized_function_name: STRING is "FUNCTION"
	capitalized_general_name: STRING is "GENERAL"
	capitalized_integer_name: STRING is "INTEGER"
	capitalized_integer_8_name: STRING is "INTEGER_8"
	capitalized_integer_16_name: STRING is "INTEGER_16"
	capitalized_integer_32_name: STRING is "INTEGER_32"
	capitalized_integer_64_name: STRING is "INTEGER_64"
	capitalized_native_array_name: STRING is "NATIVE_ARRAY"
	capitalized_natural_name: STRING is "NATURAL"
	capitalized_natural_8_name: STRING is "NATURAL_8"
	capitalized_natural_16_name: STRING is "NATURAL_16"
	capitalized_natural_32_name: STRING is "NATURAL_32"
	capitalized_natural_64_name: STRING is "NATURAL_64"
	capitalized_none_name: STRING is "NONE"
	capitalized_platform_name: STRING is "PLATFORM"
	capitalized_pointer_name: STRING is "POINTER"
	capitalized_predicate_name: STRING is "PREDICATE"
	capitalized_procedure_name: STRING is "PROCEDURE"
	capitalized_real_name: STRING is "REAL"
	capitalized_real_32_name: STRING is "REAL_32"
	capitalized_real_64_name: STRING is "REAL_64"
	capitalized_routine_name: STRING is "ROUTINE"
	capitalized_special_name: STRING is "SPECIAL"
	capitalized_string_name: STRING is "STRING"
	capitalized_string_8_name: STRING is "STRING_8"
	capitalized_string_32_name: STRING is "STRING_32"
	capitalized_system_object_name: STRING is "SYSTEM_OBJECT"
	capitalized_tuple_name: STRING is "TUPLE"
	capitalized_type_name: STRING is "TYPE"
	capitalized_typed_pointer_name: STRING is "TYPED_POINTER"
	capitalized_wide_character_name: STRING is "WIDE_CHARACTER"
	capitalized_unknown_name: STRING is "*UNKNOWN*"
		-- Eiffel class names

	aliased_resized_area_name: STRING is "aliased_resized_area"
	area_name: STRING is "area"
	argument_name: STRING is "argument"
	argument_count_name: STRING is "argument_count"
	as_natural_8_name: STRING is "as_natural_8"
	as_natural_16_name: STRING is "as_natural_16"
	as_natural_32_name: STRING is "as_natural_32"
	as_natural_64_name: STRING is "as_natural_64"
	as_integer_8_name: STRING is "as_integer_8"
	as_integer_16_name: STRING is "as_integer_16"
	as_integer_32_name: STRING is "as_integer_32"
	as_integer_64_name: STRING is "as_integer_64"
	bit_and_name: STRING is "bit_and"
	bit_not_name: STRING is "bit_not"
	bit_or_name: STRING is "bit_or"
	bit_shift_left_name: STRING is "bit_shift_left"
	bit_shift_right_name: STRING is "bit_shift_right"
	bit_xor_name: STRING is "bit_xor"
	boolean_bytes_name: STRING is "boolean_bytes"
	call_name: STRING is "call"
	ceiling_real_32_name: STRING is "ceiling_real_32"
	ceiling_real_64_name: STRING is "ceiling_real_64"
	character_bytes_name: STRING is "character_bytes"
	code_name: STRING is "code"
	conforms_to_name: STRING is "conforms_to"
	copy_name: STRING is "copy"
	count_name: STRING is "count"
	deep_twin_name: STRING is "deep_twin"
	default_create_name: STRING is "default_create"
	element_size_name: STRING is "element_size"
	floor_real_32_name: STRING is "floor_real_32"
	floor_real_64_name: STRING is "floor_real_64"
	generating_type_name: STRING is "generating_type"
	generator_name: STRING is "generator"
	hash_code_name: STRING is "hash_code"
	integer_bytes_name: STRING is "integer_bytes"
	is_deep_equal_name: STRING is "is_deep_equal"
	is_dotnet_name: STRING is "is_dotnet"
	is_unix_name: STRING is "is_unix"
	is_vms_name: STRING is "is_vms"
	is_windows_name: STRING is "is_windows"
	item_name: STRING is "item"
	last_result_name: STRING is "last_result"
	lower_name: STRING is "lower"
	make_name: STRING is "make"
	out_name: STRING is "out"
	pointer_bytes_name: STRING is "pointer_bytes"
	pointer_item_name: STRING is "pointer_item"
	put_name: STRING is "put"
	put_reference_name: STRING is "put_reference"
	real_bytes_name: STRING is "real_bytes"
	reference_item_name: STRING is "reference_item"
	same_type_name: STRING is "same_type"
	set_item_name: STRING is "set_item"
	set_operands_name: STRING is "set_operands"
	standard_copy_name: STRING is "standard_copy"
	standard_is_equal_name: STRING is "standard_is_equal"
	standard_twin_name: STRING is "standard_twin"
	tagged_out_name: STRING is "tagged_out"
	to_character_name: STRING is "to_character"
	to_double_name: STRING is "to_double"
	to_integer_32_name: STRING is "to_integer_32"
	to_real_name: STRING is "to_real"
	to_real_32_name: STRING is "to_real_32"
	to_real_64_name: STRING is "to_real_64"
	truncated_to_integer_name: STRING is "truncated_to_integer"
	truncated_to_integer_64_name: STRING is "truncated_to_integer_64"
	truncated_to_real_name: STRING is "truncated_to_real"
	twin_name: STRING is "twin"
	upper_name: STRING is "upper"
		-- Eiffel feature names

	capitalized_current_keyword_name: STRING is "Current"
	capitalized_false_keyword_name: STRING is "False"
	capitalized_precursor_keyword_name: STRING is "Precursor"
	capitalized_result_keyword_name: STRING is "Result"
	capitalized_true_keyword_name: STRING is "True"
	capitalized_void_keyword_name: STRING is "Void"
	capitalized_unique_keyword_name: STRING is "Unique"
			-- Eiffel keyword names with first letter in upper-case

	agent_keyword_name: STRING is "agent"
	alias_keyword_name: STRING is "alias"
	all_keyword_name: STRING is "all"
	and_keyword_name: STRING is "and"
	and_then_keywords_name: STRING is "and then"
	as_keyword_name: STRING is "as"
	assign_keyword_name: STRING is "assign"
	attribute_keyword_name: STRING is "attribute"
	check_keyword_name: STRING is "check"
	class_keyword_name: STRING is "class"
	convert_keyword_name: STRING is "convert"
	create_keyword_name: STRING is "create"
	creation_keyword_name: STRING is "creation"
	current_keyword_name: STRING is "current"
	debug_keyword_name: STRING is "debug"
	deferred_keyword_name: STRING is "deferred"
	do_keyword_name: STRING is "do"
	else_keyword_name: STRING is "else"
	elseif_keyword_name: STRING is "elseif"
	end_keyword_name: STRING is "end"
	ensure_keyword_name: STRING is "ensure"
	expanded_keyword_name: STRING is "expanded"
	export_keyword_name: STRING is "export"
	external_keyword_name: STRING is "external"
	false_keyword_name: STRING is "false"
	feature_keyword_name: STRING is "feature"
	from_keyword_name: STRING is "from"
	frozen_keyword_name: STRING is "frozen"
	if_keyword_name: STRING is "if"
	implies_keyword_name: STRING is "implies"
	indexing_keyword_name: STRING is "indexing"
	infix_keyword_name: STRING is "infix"
	inherit_keyword_name: STRING is "inherit"
	inspect_keyword_name: STRING is "inspect"
	invariant_keyword_name: STRING is "invariant"
	is_keyword_name: STRING is "is"
	like_keyword_name: STRING is "like"
	local_keyword_name: STRING is "local"
	loop_keyword_name: STRING is "loop"
	not_keyword_name: STRING is "not"
	obsolete_keyword_name: STRING is "obsolete"
	old_keyword_name: STRING is "old"
	once_keyword_name: STRING is "once"
	or_keyword_name: STRING is "or"
	or_else_keywords_name: STRING is "or else"
	precursor_keyword_name: STRING is "precursor"
	prefix_keyword_name: STRING is "prefix"
	redefine_keyword_name: STRING is "redefine"
	recast_keyword_name: STRING is "recast"
	reference_keyword_name: STRING is "reference"
	rename_keyword_name: STRING is "rename"
	require_keyword_name: STRING is "require"
	rescue_keyword_name: STRING is "rescue"
	result_keyword_name: STRING is "result"
	retry_keyword_name: STRING is "retry"
	select_keyword_name: STRING is "select"
	separate_keyword_name: STRING is "separate"
	strip_keyword_name: STRING is "strip"
	then_keyword_name: STRING is "then"
	true_keyword_name: STRING is "true"
	undefine_keyword_name: STRING is "undefine"
	unique_keyword_name: STRING is "unique"
	until_keyword_name: STRING is "until"
	variant_keyword_name: STRING is "variant"
	void_keyword_name: STRING is "void"
	when_keyword_name: STRING is "when"
	xor_keyword_name: STRING is "xor"
			-- Eiffel keyword names

	arrow_symbol_name: STRING is "->"
	assign_symbol_name: STRING is ":="
	assign_attempt_symbol_name: STRING is "?="
	at_symbol_name: STRING is "@"
	bang_symbol_name: STRING is "!"
	colon_symbol_name: STRING is ":"
	comma_symbol_name: STRING is ","
	div_symbol_name: STRING is "//"
	divide_symbol_name: STRING is "/"
	dollar_symbol_name: STRING is "$"
	dot_symbol_name: STRING is "."
	dotdot_symbol_name: STRING is ".."
	equal_symbol_name: STRING is "="
	ge_symbol_name: STRING is ">="
	gt_symbol_name: STRING is ">"
	le_symbol_name: STRING is "<="
	left_array_symbol_name: STRING is "<<"
	left_brace_symbol_name: STRING is "{"
	left_bracket_symbol_name: STRING is "["
	left_parenthesis_symbol_name: STRING is "("
	lt_symbol_name: STRING is "<"
	minus_symbol_name: STRING is "-"
	mod_symbol_name: STRING is "\\"
	not_equal_symbol_name: STRING is "/="
	plus_symbol_name: STRING is "+"
	power_symbol_name: STRING is "^"
	question_mark_symbol_name: STRING is "?"
	right_array_symbol_name: STRING is ">>"
	right_brace_symbol_name: STRING is "}"
	right_bracket_symbol_name: STRING is "]"
	right_parenthesis_symbol_name: STRING is ")"
	semicolon_symbol_name: STRING is ";"
	tilde_symbol_name: STRING is "~"
	times_symbol_name: STRING is "*"
			-- Eiffel symbol names

	unknown_name: STRING is "***unknown_name***"
			-- Unknown name

feature -- Keyword and symbol names (used for compatibility with 5.6.0610, to be removed later)

	capitalized_boolean_ref_name: STRING is "BOOLEAN_REF"
	capitalized_character_ref_name: STRING is "CHARACTER_REF"
	capitalized_character_8_ref_name: STRING is "CHARACTER_8_REF"
	capitalized_character_32_ref_name: STRING is "CHARACTER_32_REF"
	capitalized_comparable_name: STRING is "COMPARABLE"
	capitalized_double_ref_name: STRING is "DOUBLE_REF"
	capitalized_hashable_name: STRING is "HASHABLE"
	capitalized_integer_ref_name: STRING is "INTEGER_REF"
	capitalized_integer_8_ref_name: STRING is "INTEGER_8_REF"
	capitalized_integer_16_ref_name: STRING is "INTEGER_16_REF"
	capitalized_integer_32_ref_name: STRING is "INTEGER_32_REF"
	capitalized_integer_64_ref_name: STRING is "INTEGER_64_REF"
	capitalized_natural_ref_name: STRING is "NATURAL_REF"
	capitalized_natural_8_ref_name: STRING is "NATURAL_8_REF"
	capitalized_natural_16_ref_name: STRING is "NATURAL_16_REF"
	capitalized_natural_32_ref_name: STRING is "NATURAL_32_REF"
	capitalized_natural_64_ref_name: STRING is "NATURAL_64_REF"
	capitalized_numeric_name: STRING is "NUMERIC"
	capitalized_part_comparable_name: STRING is "PART_COMPARABLE"
	capitalized_pointer_ref_name: STRING is "POINTER_REF"
	capitalized_real_ref_name: STRING is "REAL_REF"
	capitalized_real_32_ref_name: STRING is "REAL_32_REF"
	capitalized_real_64_ref_name: STRING is "REAL_64_REF"
	capitalized_wide_character_ref_name: STRING is "WIDE_CHARACTER_REF"
		-- Eiffel class names

feature -- Infix, prefix and alias feature names

	infix_and_name: STRING is "infix %"and%""
	infix_implies_name: STRING is "infix %"implies%""
	infix_or_name: STRING is "infix %"or%""
	infix_xor_name: STRING is "infix %"xor%""
	infix_div_name: STRING is "infix %"//%""
	infix_divide_name: STRING is "infix %"/%""
	infix_ge_name: STRING is "infix %">=%""
	infix_gt_name: STRING is "infix %">%""
	infix_le_name: STRING is "infix %"<=%""
	infix_lt_name: STRING is "infix %"<%""
	infix_minus_name: STRING is "infix %"-%""
	infix_mod_name: STRING is "infix %"\\%""
	infix_plus_name: STRING is "infix %"+%""
	infix_power_name: STRING is "infix %"^%""
	infix_times_name: STRING is "infix %"*%""
	infix_dotdot_name: STRING is "infix %"..%""
	infix_and_then_name: STRING is "infix %"and then%""
	infix_or_else_name: STRING is "infix %"or else%""
			-- Infix feature names

	prefix_not_name: STRING is "prefix %"not%""
	prefix_minus_name: STRING is "prefix %"-%""
	prefix_plus_name: STRING is "prefix %"+%""
			-- Prefix feature names

	alias_and_name: STRING is "alias %"and%""
	alias_implies_name: STRING is "alias %"implies%""
	alias_or_name: STRING is "alias %"or%""
	alias_xor_name: STRING is "alias %"xor%""
	alias_div_name: STRING is "alias %"//%""
	alias_divide_name: STRING is "alias %"/%""
	alias_ge_name: STRING is "alias %">=%""
	alias_gt_name: STRING is "alias %">%""
	alias_le_name: STRING is "alias %"<=%""
	alias_lt_name: STRING is "alias %"<%""
	alias_minus_name: STRING is "alias %"-%""
	alias_mod_name: STRING is "alias %"\\%""
	alias_plus_name: STRING is "alias %"+%""
	alias_power_name: STRING is "alias %"^%""
	alias_times_name: STRING is "alias %"*%""
	alias_dotdot_name: STRING is "alias %"..%""
	alias_and_then_name: STRING is "alias %"and then%""
	alias_or_else_name: STRING is "alias %"or else%""
	alias_not_name: STRING is "alias %"not%""
	alias_bracket_name: STRING is "alias %"[]%""
			-- Alias feature names

feature -- Built-in

	builtin_marker: STRING is "built_in"
			-- Built-in marker

feature -- Position

	null_position: ET_POSITION is
			-- Null position
		once
			create {ET_COMPRESSED_POSITION} Result.make_default
		ensure
			position_not_void: Result /= Void
			position_is_null: Result.is_null
		end

feature -- Ancestors

	empty_ancestors: ET_BASE_TYPE_LIST is
			-- Shared empty ancestors
		once
			create Result.make_with_capacity (0)
		ensure
			ancestors_not_void: Result /= Void
			ancestors_empty: Result.is_empty
		end

feature -- Features

	empty_queries: ET_QUERY_LIST is
			-- Shared empty queries
		once
			create Result.make_with_capacity (0)
		ensure
			queries_not_void: Result /= Void
			queries_empty: Result.is_empty
		end

	empty_procedures: ET_PROCEDURE_LIST is
			-- Shared empty procedures
		once
			create Result.make_with_capacity (0)
		ensure
			procedures_not_void: Result /= Void
			procedures_empty: Result.is_empty
		end

feature -- Clients

	empty_clients: ET_CLASS_NAME_LIST is
			-- Shared empty clients
		once
			create Result.make_with_capacity (0)
		ensure
			clients_not_void: Result /= Void
			clients_empty: Result.is_empty
		end

	any_clients: ET_CLASS_NAME_LIST is
			-- Shared ANY clients
		once
			create Result.make_with_capacity (1)
			Result.put_first (any_class_name)
		ensure
			clients_not_void: Result /= Void
			one_client: Result.count = 1
			any_clients: Result.class_name (1) = any_class_name
		end

end
