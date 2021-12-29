note

	description:

		"Eiffel token and symbol constants"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004-2021, Eric Bezault and others"
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
			instance_free: class
			any_class_name_not_void: Result /= Void
		end

	arguments_32_class_name: ET_CLASS_NAME
			-- "ARGUMENTS_32" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_arguments_32_name)
		ensure
			instance_free: class
			arguments_32_class_name_not_void: Result /= Void
		end

	array_class_name: ET_CLASS_NAME
			-- "ARRAY" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_array_name)
		ensure
			instance_free: class
			array_class_name_not_void: Result /= Void
		end

	boolean_class_name: ET_CLASS_NAME
			-- "BOOLEAN" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_boolean_name)
		ensure
			instance_free: class
			boolean_class_name_not_void: Result /= Void
		end

	character_class_name: ET_CLASS_NAME
			-- "CHARACTER" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_character_name)
		ensure
			instance_free: class
			character_class_name_not_void: Result /= Void
		end

	character_8_class_name: ET_CLASS_NAME
			-- "CHARACTER_8" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_character_8_name)
		ensure
			instance_free: class
			character_8_class_name_not_void: Result /= Void
		end

	character_32_class_name: ET_CLASS_NAME
			-- "CHARACTER_32" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_character_32_name)
		ensure
			instance_free: class
			character_32_class_name_not_void: Result /= Void
		end

	com_failure_class_name: ET_CLASS_NAME
			-- "COM_FAILURE" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_com_failure_name)
		ensure
			instance_free: class
			com_failure_class_name_not_void: Result /= Void
		end

	disposable_class_name: ET_CLASS_NAME
			-- "DISPOSABLE" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_disposable_name)
		ensure
			instance_free: class
			disposable_class_name_not_void: Result /= Void
		end

	double_class_name: ET_CLASS_NAME
			-- "DOUBLE" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_double_name)
		ensure
			instance_free: class
			double_class_name_not_void: Result /= Void
		end

	exception_class_name: ET_CLASS_NAME
			-- "EXCEPTION" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_exception_name)
		ensure
			instance_free: class
			exception_class_name_not_void: Result /= Void
		end

	exception_manager_class_name: ET_CLASS_NAME
			-- "EXCEPTION_MANAGER" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_exception_manager_name)
		ensure
			instance_free: class
			exception_manager_class_name_not_void: Result /= Void
		end

	exception_manager_factory_class_name: ET_CLASS_NAME
			-- "EXCEPTION_MANAGER_FACTORY" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_exception_manager_factory_name)
		ensure
			instance_free: class
			exception_manager_factory_class_name_not_void: Result /= Void
		end

	function_class_name: ET_CLASS_NAME
			-- "FUNCTION" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_function_name)
		ensure
			instance_free: class
			function_class_name_not_void: Result /= Void
		end

	identified_routines_class_name: ET_CLASS_NAME
			-- "IDENTIFIED_ROUTINES" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_identified_routines_name)
		ensure
			instance_free: class
			identified_routines_class_name_not_void: Result /= Void
		end

	immutable_string_8_class_name: ET_CLASS_NAME
			-- "IMMUTABLE_STRING_8" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_immutable_string_8_name)
		ensure
			instance_free: class
			immutable_string_8_class_name_not_void: Result /= Void
		end

	immutable_string_32_class_name: ET_CLASS_NAME
			-- "IMMUTABLE_STRING_32" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_immutable_string_32_name)
		ensure
			instance_free: class
			immutable_string_32_class_name_not_void: Result /= Void
		end

	integer_class_name: ET_CLASS_NAME
			-- "INTEGER" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_integer_name)
		ensure
			instance_free: class
			integer_class_name_not_void: Result /= Void
		end

	integer_8_class_name: ET_CLASS_NAME
			-- "INTEGER_8" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_integer_8_name)
		ensure
			instance_free: class
			integer_8_class_name_not_void: Result /= Void
		end

	integer_16_class_name: ET_CLASS_NAME
			-- "INTEGER_16" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_integer_16_name)
		ensure
			instance_free: class
			integer_16_class_name_not_void: Result /= Void
		end

	integer_32_class_name: ET_CLASS_NAME
			-- "INTEGER_32" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_integer_32_name)
		ensure
			instance_free: class
			integer_32_class_name_not_void: Result /= Void
		end

	integer_64_class_name: ET_CLASS_NAME
			-- "INTEGER_64" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_integer_64_name)
		ensure
			instance_free: class
			integer_64_class_name_not_void: Result /= Void
		end

	internal_class_name: ET_CLASS_NAME
			-- "INTERNAL" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_internal_name)
		ensure
			instance_free: class
			internal_class_name_not_void: Result /= Void
		end

	ise_exception_manager_class_name: ET_CLASS_NAME
			-- "ISE_EXCEPTION_MANAGER" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_ise_exception_manager_name)
		ensure
			instance_free: class
			ise_exception_manager_class_name_not_void: Result /= Void
		end

	ise_runtime_class_name: ET_CLASS_NAME
			-- "ISE_RUNTIME" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_ise_runtime_name)
		ensure
			instance_free: class
			ise_runtime_class_name_not_void: Result /= Void
		end

	iterable_class_name: ET_CLASS_NAME
			-- "ITERABLE" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_iterable_name)
		ensure
			instance_free: class
			iterable_class_name_not_void: Result /= Void
		end

	iteration_cursor_class_name: ET_CLASS_NAME
			-- "ITERATION_CURSOR" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_iteration_cursor_name)
		ensure
			instance_free: class
			iteration_cursor_class_name_not_void: Result /= Void
		end

	memory_class_name: ET_CLASS_NAME
			-- "MEMORY" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_memory_name)
		ensure
			instance_free: class
			memory_class_name_not_void: Result /= Void
		end

	native_array_class_name: ET_CLASS_NAME
			-- "NATIVE_ARRAY" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_native_array_name)
		ensure
			instance_free: class
			native_array_class_name_not_void: Result /= Void
		end

	natural_class_name: ET_CLASS_NAME
			-- "NATURAL" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_natural_name)
		ensure
			instance_free: class
			natural_class_name_not_void: Result /= Void
		end

	natural_8_class_name: ET_CLASS_NAME
			-- "NATURAL_8" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_natural_8_name)
		ensure
			instance_free: class
			natural_8_class_name_not_void: Result /= Void
		end

	natural_16_class_name: ET_CLASS_NAME
			-- "NATURAL_16" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_natural_16_name)
		ensure
			instance_free: class
			natural_16_class_name_not_void: Result /= Void
		end

	natural_32_class_name: ET_CLASS_NAME
			-- "NATURAL_32" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_natural_32_name)
		ensure
			instance_free: class
			natural_32_class_name_not_void: Result /= Void
		end

	natural_64_class_name: ET_CLASS_NAME
			-- "NATURAL_64" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_natural_64_name)
		ensure
			instance_free: class
			natural_64_class_name_not_void: Result /= Void
		end

	none_class_name: ET_CLASS_NAME
			-- "NONE" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_none_name)
		ensure
			instance_free: class
			none_class_name_not_void: Result /= Void
		end

	platform_class_name: ET_CLASS_NAME
			-- "PLATFORM" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_platform_name)
		ensure
			instance_free: class
			platform_class_name_not_void: Result /= Void
		end

	pointer_class_name: ET_CLASS_NAME
			-- "POINTER" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_pointer_name)
		ensure
			instance_free: class
			pointer_class_name_not_void: Result /= Void
		end

	predicate_class_name: ET_CLASS_NAME
			-- "PREDICATE" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_predicate_name)
		ensure
			instance_free: class
			predicate_class_name_not_void: Result /= Void
		end

	procedure_class_name: ET_CLASS_NAME
			-- "PROCEDURE" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_procedure_name)
		ensure
			instance_free: class
			procedure_class_name_not_void: Result /= Void
		end

	real_class_name: ET_CLASS_NAME
			-- "REAL" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_real_name)
		ensure
			instance_free: class
			real_class_name_not_void: Result /= Void
		end

	real_32_class_name: ET_CLASS_NAME
			-- "REAL_32" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_real_32_name)
		ensure
			instance_free: class
			real_32_class_name_not_void: Result /= Void
		end

	real_64_class_name: ET_CLASS_NAME
			-- "REAL_64" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_real_64_name)
		ensure
			instance_free: class
			real_64_class_name_not_void: Result /= Void
		end

	routine_class_name: ET_CLASS_NAME
			-- "ROUTINE" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_routine_name)
		ensure
			instance_free: class
			routine_class_name_not_void: Result /= Void
		end

	special_class_name: ET_CLASS_NAME
			-- "SPECIAL" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_special_name)
		ensure
			instance_free: class
			special_class_name_not_void: Result /= Void
		end

	string_class_name: ET_CLASS_NAME
			-- "STRING" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_string_name)
		ensure
			instance_free: class
			string_class_name_not_void: Result /= Void
		end

	string_8_class_name: ET_CLASS_NAME
			-- "STRING_8" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_string_8_name)
		ensure
			instance_free: class
			string_8_class_name_not_void: Result /= Void
		end

	string_32_class_name: ET_CLASS_NAME
			-- "STRING_32" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_string_32_name)
		ensure
			instance_free: class
			string_32_class_name_not_void: Result /= Void
		end

	system_object_class_name: ET_CLASS_NAME
			-- "SYSTEM_OBJECT" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_system_object_name)
		ensure
			instance_free: class
			system_object_class_name_not_void: Result /= Void
		end

	system_string_class_name: ET_CLASS_NAME
			-- "SYSTEM_STRING" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_system_string_name)
		ensure
			instance_free: class
			system_string_class_name_not_void: Result /= Void
		end

	tuple_class_name: ET_CLASS_NAME
			-- "TUPLE" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_tuple_name)
		ensure
			instance_free: class
			tuple_class_name_not_void: Result /= Void
		end

	type_class_name: ET_CLASS_NAME
			-- "TYPE" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_type_name)
		ensure
			instance_free: class
			type_class_name_not_void: Result /= Void
		end

	typed_pointer_class_name: ET_CLASS_NAME
			-- "TYPED_POINTER" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_typed_pointer_name)
		ensure
			instance_free: class
			typed_pointer_class_name_not_void: Result /= Void
		end

	wide_character_class_name: ET_CLASS_NAME
			-- "WIDE_CHARACTER" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_wide_character_name)
		ensure
			instance_free: class
			wide_character_class_name_not_void: Result /= Void
		end

	unknown_class_name: ET_CLASS_NAME
			-- "*UNKNOWN*" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_unknown_name)
		ensure
			instance_free: class
			unknown_class_name_not_void: Result /= Void
		end

feature -- Class names (used for compatibility with 5.6.0610, to be removed later)

	boolean_ref_class_name: ET_CLASS_NAME
			-- "BOOLEAN_REF" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_boolean_ref_name)
		ensure
			instance_free: class
			boolean_ref_class_name_not_void: Result /= Void
		end

	character_ref_class_name: ET_CLASS_NAME
			-- "CHARACTER_REF" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_character_ref_name)
		ensure
			instance_free: class
			character_ref_class_name_not_void: Result /= Void
		end

	character_8_ref_class_name: ET_CLASS_NAME
			-- "CHARACTER_8_REF" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_character_8_ref_name)
		ensure
			instance_free: class
			character_8_ref_class_name_not_void: Result /= Void
		end

	character_32_ref_class_name: ET_CLASS_NAME
			-- "CHARACTER_32_REF" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_character_32_ref_name)
		ensure
			instance_free: class
			character_32_ref_class_name_not_void: Result /= Void
		end

	double_ref_class_name: ET_CLASS_NAME
			-- "DOUBLE_REF" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_double_ref_name)
		ensure
			instance_free: class
			double_ref_class_name_not_void: Result /= Void
		end

	integer_ref_class_name: ET_CLASS_NAME
			-- "INTEGER_REF" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_integer_ref_name)
		ensure
			instance_free: class
			integer_class_name_not_void: Result /= Void
		end

	integer_8_ref_class_name: ET_CLASS_NAME
			-- "INTEGER_8_REF" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_integer_8_ref_name)
		ensure
			instance_free: class
			integer_8_ref_class_name_not_void: Result /= Void
		end

	integer_16_ref_class_name: ET_CLASS_NAME
			-- "INTEGER_16_REF" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_integer_16_ref_name)
		ensure
			instance_free: class
			integer_16_ref_class_name_not_void: Result /= Void
		end

	integer_32_ref_class_name: ET_CLASS_NAME
			-- "INTEGER_32_REF" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_integer_32_ref_name)
		ensure
			instance_free: class
			integer_32_ref_class_name_not_void: Result /= Void
		end

	integer_64_ref_class_name: ET_CLASS_NAME
			-- "INTEGER_64_REF" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_integer_64_ref_name)
		ensure
			instance_free: class
			integer_64_ref_class_name_not_void: Result /= Void
		end

	natural_ref_class_name: ET_CLASS_NAME
			-- "NATURAL_REF" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_natural_ref_name)
		ensure
			instance_free: class
			natural_ref_class_name_not_void: Result /= Void
		end

	natural_8_ref_class_name: ET_CLASS_NAME
			-- "NATURAL_8_REF" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_natural_8_ref_name)
		ensure
			instance_free: class
			natural_8_ref_class_name_not_void: Result /= Void
		end

	natural_16_ref_class_name: ET_CLASS_NAME
			-- "NATURAL_16_REF" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_natural_16_ref_name)
		ensure
			instance_free: class
			natural_16_ref_class_name_not_void: Result /= Void
		end

	natural_32_ref_class_name: ET_CLASS_NAME
			-- "NATURAL_32_REF" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_natural_32_ref_name)
		ensure
			instance_free: class
			natural_32_ref_class_name_not_void: Result /= Void
		end

	natural_64_ref_class_name: ET_CLASS_NAME
			-- "NATURAL_64_REF" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_natural_64_ref_name)
		ensure
			instance_free: class
			natural_64_ref_class_name_not_void: Result /= Void
		end

	pointer_ref_class_name: ET_CLASS_NAME
			-- "POINTER_REF" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_pointer_ref_name)
		ensure
			instance_free: class
			pointer_ref_class_name_not_void: Result /= Void
		end

	real_ref_class_name: ET_CLASS_NAME
			-- "REAL_REF" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_real_ref_name)
		ensure
			instance_free: class
			real_ref_class_name_not_void: Result /= Void
		end

	real_32_ref_class_name: ET_CLASS_NAME
			-- "REAL_32_REF" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_real_32_ref_name)
		ensure
			instance_free: class
			real_32_ref_class_name_not_void: Result /= Void
		end

	real_64_ref_class_name: ET_CLASS_NAME
			-- "REAL_64_REF" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_real_64_ref_name)
		ensure
			instance_free: class
			real_64_ref_class_name_not_void: Result /= Void
		end

	wide_character_ref_class_name: ET_CLASS_NAME
			-- "WIDE_CHARACTER_REF" class name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_wide_character_ref_name)
		ensure
			instance_free: class
			wide_character_ref_class_name_not_void: Result /= Void
		end

feature -- Feature names

	after_feature_name: ET_FEATURE_NAME
			-- 'after' feature name
		once
			create {ET_IDENTIFIER} Result.make (after_name)
		ensure
			instance_free: class
			after_feature_name_not_void: Result /= Void
		end

	aliased_resized_area_feature_name: ET_FEATURE_NAME
			-- 'aliased_resized_area' feature name
		once
			create {ET_IDENTIFIER} Result.make (aliased_resized_area_name)
		ensure
			instance_free: class
			aliased_resized_area_feature_name_not_void: Result /= Void
		end

	area_feature_name: ET_FEATURE_NAME
			-- 'area' feature name
		once
			create {ET_IDENTIFIER} Result.make (area_name)
		ensure
			instance_free: class
			area_feature_name_not_void: Result /= Void
		end

	argument_count_feature_name: ET_FEATURE_NAME
			-- 'argument_count' feature name
		once
			create {ET_IDENTIFIER} Result.make (argument_count_name)
		ensure
			instance_free: class
			argument_count_feature_name_not_void: Result /= Void
		end

	as_integer_8_feature_name: ET_FEATURE_NAME
			-- 'as_integer_8' feature name
		once
			create {ET_IDENTIFIER} Result.make (as_integer_8_name)
		ensure
			instance_free: class
			as_integer_8_feature_name_not_void: Result /= Void
		end

	as_integer_16_feature_name: ET_FEATURE_NAME
			-- 'as_integer_16' feature name
		once
			create {ET_IDENTIFIER} Result.make (as_integer_16_name)
		ensure
			instance_free: class
			as_integer_16_feature_name_not_void: Result /= Void
		end

	as_integer_32_feature_name: ET_FEATURE_NAME
			-- 'as_integer_32' feature name
		once
			create {ET_IDENTIFIER} Result.make (as_integer_32_name)
		ensure
			instance_free: class
			as_integer_32_feature_name_not_void: Result /= Void
		end

	as_integer_64_feature_name: ET_FEATURE_NAME
			-- 'as_integer_84' feature name
		once
			create {ET_IDENTIFIER} Result.make (as_integer_64_name)
		ensure
			instance_free: class
			as_integer_64_feature_name_not_void: Result /= Void
		end

	as_natural_8_feature_name: ET_FEATURE_NAME
			-- 'as_natural_8' feature name
		once
			create {ET_IDENTIFIER} Result.make (as_natural_8_name)
		ensure
			instance_free: class
			as_natural_8_feature_name_not_void: Result /= Void
		end

	as_natural_16_feature_name: ET_FEATURE_NAME
			-- 'as_natural_16' feature name
		once
			create {ET_IDENTIFIER} Result.make (as_natural_16_name)
		ensure
			instance_free: class
			as_natural_16_feature_name_not_void: Result /= Void
		end

	as_natural_32_feature_name: ET_FEATURE_NAME
			-- 'as_natural_32' feature name
		once
			create {ET_IDENTIFIER} Result.make (as_natural_32_name)
		ensure
			instance_free: class
			as_natural_32_feature_name_not_void: Result /= Void
		end

	as_natural_64_feature_name: ET_FEATURE_NAME
			-- 'as_natural_64' feature name
		once
			create {ET_IDENTIFIER} Result.make (as_natural_64_name)
		ensure
			instance_free: class
			as_natural_64_feature_name_not_void: Result /= Void
		end

	attached_type_feature_name: ET_FEATURE_NAME
			-- 'attached_type' feature name
		once
			create {ET_IDENTIFIER} Result.make (attached_type_name)
		ensure
			instance_free: class
			attached_type_feature_name_not_void: Result /= Void
		end

	base_address_feature_name: ET_FEATURE_NAME
			-- 'base_address' feature name
		once
			create {ET_IDENTIFIER} Result.make (base_address_name)
		ensure
			instance_free: class
			base_address_feature_name_not_void: Result /= Void
		end

	base_class_name_feature_name: ET_FEATURE_NAME
			-- 'base_class_name' feature name
		once
			create {ET_IDENTIFIER} Result.make (base_class_name_name)
		ensure
			instance_free: class
			base_class_name_feature_name_not_void: Result /= Void
		end

	bit_and_feature_name: ET_FEATURE_NAME
			-- 'bit_and' feature name
		once
			create {ET_IDENTIFIER} Result.make (bit_and_name)
		ensure
			instance_free: class
			bit_and_feature_name_not_void: Result /= Void
		end

	bit_not_feature_name: ET_FEATURE_NAME
			-- 'bit_not' feature name
		once
			create {ET_IDENTIFIER} Result.make (bit_not_name)
		ensure
			instance_free: class
			bit_not_feature_name_not_void: Result /= Void
		end

	bit_or_feature_name: ET_FEATURE_NAME
			-- 'bit_or' feature name
		once
			create {ET_IDENTIFIER} Result.make (bit_or_name)
		ensure
			instance_free: class
			bit_or_feature_name_not_void: Result /= Void
		end

	bit_shift_left_feature_name: ET_FEATURE_NAME
			-- 'bit_shift_left' feature name
		once
			create {ET_IDENTIFIER} Result.make (bit_shift_left_name)
		ensure
			instance_free: class
			bit_shift_left_feature_name_not_void: Result /= Void
		end

	bit_shift_right_feature_name: ET_FEATURE_NAME
			-- 'bit_shift_right' feature name
		once
			create {ET_IDENTIFIER} Result.make (bit_shift_right_name)
		ensure
			instance_free: class
			bit_shift_right_feature_name_not_void: Result /= Void
		end

	bit_xor_feature_name: ET_FEATURE_NAME
			-- 'bit_xor' feature name
		once
			create {ET_IDENTIFIER} Result.make (bit_xor_name)
		ensure
			instance_free: class
			bit_xor_feature_name_not_void: Result /= Void
		end

	boolean_bytes_feature_name: ET_FEATURE_NAME
			-- 'boolean_bytes' feature name
		once
			create {ET_IDENTIFIER} Result.make (boolean_bytes_name)
		ensure
			instance_free: class
			boolean_bytes_feature_name_not_void: Result /= Void
		end

	boolean_item_feature_name: ET_FEATURE_NAME
			-- 'boolean_item' feature name
		once
			create {ET_IDENTIFIER} Result.make (boolean_item_name)
		ensure
			instance_free: class
			boolean_item_feature_name_not_void: Result /= Void
		end

	boolean_field_feature_name: ET_FEATURE_NAME
			-- 'boolean_field' feature name
		once
			create {ET_IDENTIFIER} Result.make (boolean_field_name)
		ensure
			instance_free: class
			boolean_field_feature_name_not_void: Result /= Void
		end

	boolean_field_at_feature_name: ET_FEATURE_NAME
			-- 'boolean_field_at' feature name
		once
			create {ET_IDENTIFIER} Result.make (boolean_field_at_name)
		ensure
			instance_free: class
			boolean_field_at_feature_name_not_void: Result /= Void
		end

	c_strlen_feature_name: ET_FEATURE_NAME
			-- 'c_strlen' feature name
		once
			create {ET_IDENTIFIER} Result.make (c_strlen_name)
		ensure
			instance_free: class
			c_strlen_feature_name_not_void: Result /= Void
		end

	call_feature_name: ET_FEATURE_NAME
			-- 'call' feature name
		once
			create {ET_IDENTIFIER} Result.make (call_name)
		ensure
			instance_free: class
			call_feature_name_not_void: Result /= Void
		end

	capacity_feature_name: ET_FEATURE_NAME
			-- 'capacity' feature name
		once
			create {ET_IDENTIFIER} Result.make (capacity_name)
		ensure
			instance_free: class
			capacity_feature_name_not_void: Result /= Void
		end

	catch_feature_name: ET_FEATURE_NAME
			-- 'catch' feature name
		once
			create {ET_IDENTIFIER} Result.make (catch_name)
		ensure
			instance_free: class
			catch_feature_name_not_void: Result /= Void
		end

	ccom_hresult_feature_name: ET_FEATURE_NAME
			-- 'ccom_hresult' feature name
		once
			create {ET_IDENTIFIER} Result.make (ccom_hresult_name)
		ensure
			instance_free: class
			ccom_hresult_feature_name_not_void: Result /= Void
		end

	ccom_hresult_code_feature_name: ET_FEATURE_NAME
			-- 'ccom_hresult_code' feature name
		once
			create {ET_IDENTIFIER} Result.make (ccom_hresult_code_name)
		ensure
			instance_free: class
			ccom_hresult_code_feature_name_not_void: Result /= Void
		end

	ccom_hresult_facility_feature_name: ET_FEATURE_NAME
			-- 'ccom_hresult_facility' feature name
		once
			create {ET_IDENTIFIER} Result.make (ccom_hresult_facility_name)
		ensure
			instance_free: class
			ccom_hresult_facility_feature_name_not_void: Result /= Void
		end

	ceiling_real_32_feature_name: ET_FEATURE_NAME
			-- 'ceiling_real_32' feature name
		once
			create {ET_IDENTIFIER} Result.make (ceiling_real_32_name)
		ensure
			instance_free: class
			ceiling_real_32_feature_name_not_void: Result /= Void
		end

	ceiling_real_64_feature_name: ET_FEATURE_NAME
			-- 'ceiling_real_64' feature name
		once
			create {ET_IDENTIFIER} Result.make (ceiling_real_64_name)
		ensure
			instance_free: class
			ceiling_real_64_feature_name_not_void: Result /= Void
		end

	character_8_field_feature_name: ET_FEATURE_NAME
			-- 'character_8_field' feature name
		once
			create {ET_IDENTIFIER} Result.make (character_8_field_name)
		ensure
			instance_free: class
			character_8_field_feature_name_not_void: Result /= Void
		end

	character_8_field_at_feature_name: ET_FEATURE_NAME
			-- 'character_8_field_at' feature name
		once
			create {ET_IDENTIFIER} Result.make (character_8_field_at_name)
		ensure
			instance_free: class
			character_8_field_at_feature_name_not_void: Result /= Void
		end

	character_8_item_feature_name: ET_FEATURE_NAME
			-- 'character_8_item' feature name
		once
			create {ET_IDENTIFIER} Result.make (character_8_item_name)
		ensure
			instance_free: class
			character_8_item_feature_name_not_void: Result /= Void
		end

	character_32_field_feature_name: ET_FEATURE_NAME
			-- 'character_32_field' feature name
		once
			create {ET_IDENTIFIER} Result.make (character_32_field_name)
		ensure
			instance_free: class
			character_32_field_feature_name_not_void: Result /= Void
		end

	character_32_field_at_feature_name: ET_FEATURE_NAME
			-- 'character_32_field_at' feature name
		once
			create {ET_IDENTIFIER} Result.make (character_32_field_at_name)
		ensure
			instance_free: class
			character_32_field_at_feature_name_not_void: Result /= Void
		end

	character_32_item_feature_name: ET_FEATURE_NAME
			-- 'character_32_item' feature name
		once
			create {ET_IDENTIFIER} Result.make (character_32_item_name)
		ensure
			instance_free: class
			character_32_item_feature_name_not_void: Result /= Void
		end

	character_bytes_feature_name: ET_FEATURE_NAME
			-- 'character_bytes' feature name
		once
			create {ET_IDENTIFIER} Result.make (character_bytes_name)
		ensure
			instance_free: class
			character_bytes_feature_name_not_void: Result /= Void
		end

	character_size_feature_name: ET_FEATURE_NAME
			-- 'character_size' feature name
		once
			create {ET_IDENTIFIER} Result.make (character_size_name)
		ensure
			instance_free: class
			character_size_feature_name_not_void: Result /= Void
		end

	check_assert_feature_name: ET_FEATURE_NAME
			-- 'check_assert' feature name
		once
			create {ET_IDENTIFIER} Result.make (check_assert_name)
		ensure
			instance_free: class
			check_assert_feature_name_not_void: Result /= Void
		end

	closed_operands_feature_name: ET_FEATURE_NAME
			-- 'closed_operands' feature name
		once
			create {ET_IDENTIFIER} Result.make (closed_operands_name)
		ensure
			instance_free: class
			closed_operands_feature_name_not_void: Result /= Void
		end

	code_feature_name: ET_FEATURE_NAME
			-- 'code' feature name
		once
			create {ET_IDENTIFIER} Result.make (code_name)
		ensure
			instance_free: class
			code_feature_name_not_void: Result /= Void
		end

	compiler_version_feature_name: ET_FEATURE_NAME
			-- 'compiler_version' feature name
		once
			create {ET_IDENTIFIER} Result.make (compiler_version_name)
		ensure
			instance_free: class
			compiler_version_feature_name_not_void: Result /= Void
		end

	conforms_to_feature_name: ET_FEATURE_NAME
			-- 'conforms_to' feature name
		once
			create {ET_IDENTIFIER} Result.make (conforms_to_name)
		ensure
			instance_free: class
			conforms_to_feature_name_not_void: Result /= Void
		end

	conjuncted_feature_name: ET_FEATURE_NAME
			-- 'conjuncted' feature name
		once
			create {ET_IDENTIFIER} Result.make (conjuncted_name)
		ensure
			instance_free: class
			conjuncted_feature_name_not_void: Result /= Void
		end

	conjuncted_semistrict_feature_name: ET_FEATURE_NAME
			-- 'conjuncted_semistrict' feature name
		once
			create {ET_IDENTIFIER} Result.make (conjuncted_semistrict_name)
		ensure
			instance_free: class
			conjuncted_semistrict_feature_name_not_void: Result /= Void
		end

	copy_feature_name: ET_FEATURE_NAME
			-- 'copy' feature name
		once
			create {ET_IDENTIFIER} Result.make (copy_name)
		ensure
			instance_free: class
			copy_feature_name_not_void: Result /= Void
		end

	count_feature_name: ET_FEATURE_NAME
			-- 'count' feature name
		once
			create {ET_IDENTIFIER} Result.make (count_name)
		ensure
			instance_free: class
			count_feature_name_not_void: Result /= Void
		end

	cwin_error_text_feature_name: ET_FEATURE_NAME
			-- 'cwin_error_text' feature name
		once
			create {ET_IDENTIFIER} Result.make (cwin_error_text_name)
		ensure
			instance_free: class
			cwin_error_text_feature_name_not_void: Result /= Void
		end

	cwin_local_free_feature_name: ET_FEATURE_NAME
			-- 'cwin_local_free' feature name
		once
			create {ET_IDENTIFIER} Result.make (cwin_local_free_name)
		ensure
			instance_free: class
			cwin_local_free_feature_name_not_void: Result /= Void
		end

	deep_twin_feature_name: ET_FEATURE_NAME
			-- 'deep_twin' feature name
		once
			create {ET_IDENTIFIER} Result.make (deep_twin_name)
		ensure
			instance_free: class
			deep_twin_feature_name_not_void: Result /= Void
		end

	default_feature_name: ET_FEATURE_NAME
			-- 'default' feature name
		once
			create {ET_IDENTIFIER} Result.make (default_name)
		ensure
			instance_free: class
			default_feature_name_not_void: Result /= Void
		end

	default_create_feature_name: ET_FEATURE_NAME
			-- 'default_create' feature name
		once
			create {ET_IDENTIFIER} Result.make (default_create_name)
		ensure
			instance_free: class
			default_create_feature_name_not_void: Result /= Void
		end

	detachable_type_feature_name: ET_FEATURE_NAME
			-- 'detachable_type' feature name
		once
			create {ET_IDENTIFIER} Result.make (detachable_type_name)
		ensure
			instance_free: class
			detachable_type_feature_name_not_void: Result /= Void
		end

	developer_raise_feature_name: ET_FEATURE_NAME
			-- 'developer_raise' feature name
		once
			create {ET_IDENTIFIER} Result.make (developer_raise_name)
		ensure
			instance_free: class
			developer_raise_feature_name_not_void: Result /= Void
		end

	disjuncted_feature_name: ET_FEATURE_NAME
			-- 'disjuncted' feature name
		once
			create {ET_IDENTIFIER} Result.make (disjuncted_name)
		ensure
			instance_free: class
			disjuncted_feature_name_not_void: Result /= Void
		end

	disjuncted_exclusive_feature_name: ET_FEATURE_NAME
			-- 'disjuncted' feature name
		once
			create {ET_IDENTIFIER} Result.make (disjuncted_exclusive_name)
		ensure
			instance_free: class
			disjuncted_exclusive_feature_name_not_void: Result /= Void
		end

	disjuncted_semistrict_feature_name: ET_FEATURE_NAME
			-- 'disjuncted_semistrict' feature name
		once
			create {ET_IDENTIFIER} Result.make (disjuncted_semistrict_name)
		ensure
			instance_free: class
			disjuncted_semistrict_feature_name_not_void: Result /= Void
		end

	dispose_feature_name: ET_FEATURE_NAME
			-- 'dispose' feature name
		once
			create {ET_IDENTIFIER} Result.make (dispose_name)
		ensure
			instance_free: class
			dispose_feature_name_not_void: Result /= Void
		end

	double_bytes_feature_name: ET_FEATURE_NAME
			-- 'double_bytes' feature name
		once
			create {ET_IDENTIFIER} Result.make (double_bytes_name)
		ensure
			instance_free: class
			double_bytes_feature_name_not_void: Result /= Void
		end

	dynamic_type_feature_name: ET_FEATURE_NAME
			-- 'dynamic_type' feature name
		once
			create {ET_IDENTIFIER} Result.make (dynamic_type_name)
		ensure
			instance_free: class
			dynamic_type_feature_name_not_void: Result /= Void
		end

	dynamic_type_at_offset_feature_name: ET_FEATURE_NAME
			-- 'dynamic_type_at_offset' feature name
		once
			create {ET_IDENTIFIER} Result.make (dynamic_type_at_offset_name)
		ensure
			instance_free: class
			dynamic_type_at_offset_feature_name_not_void: Result /= Void
		end

	eif_current_object_id_feature_name: ET_FEATURE_NAME
			-- 'eif_current_object_id' feature name
		once
			create {ET_IDENTIFIER} Result.make (eif_current_object_id_name)
		ensure
			instance_free: class
			eif_current_object_id_feature_name_not_void: Result /= Void
		end

	eif_gen_param_id_feature_name: ET_FEATURE_NAME
			-- 'eif_gen_param_id' feature name
		once
			create {ET_IDENTIFIER} Result.make (eif_gen_param_id_name)
		ensure
			instance_free: class
			eif_gen_param_id_feature_name_not_void: Result /= Void
		end

	eif_id_object_feature_name: ET_FEATURE_NAME
			-- 'eif_id_object' feature name
		once
			create {ET_IDENTIFIER} Result.make (eif_id_object_name)
		ensure
			instance_free: class
			eif_id_object_feature_name_not_void: Result /= Void
		end

	eif_is_object_id_of_current_feature_name: ET_FEATURE_NAME
			-- 'eif_is_object_id_of_current' feature name
		once
			create {ET_IDENTIFIER} Result.make (eif_is_object_id_of_current_name)
		ensure
			instance_free: class
			eif_is_object_id_of_current_feature_name_not_void: Result /= Void
		end

	eif_object_id_feature_name: ET_FEATURE_NAME
			-- 'eif_object_id' feature name
		once
			create {ET_IDENTIFIER} Result.make (eif_object_id_name)
		ensure
			instance_free: class
			eif_object_id_feature_name_not_void: Result /= Void
		end

	eif_object_id_free_feature_name: ET_FEATURE_NAME
			-- 'eif_object_id_free' feature name
		once
			create {ET_IDENTIFIER} Result.make (eif_object_id_free_name)
		ensure
			instance_free: class
			eif_object_id_free_feature_name_not_void: Result /= Void
		end

	element_size_feature_name: ET_FEATURE_NAME
			-- 'element_size' feature name
		once
			create {ET_IDENTIFIER} Result.make (element_size_name)
		ensure
			instance_free: class
			element_size_feature_name_not_void: Result /= Void
		end

	exception_from_code_feature_name: ET_FEATURE_NAME
			-- 'exception_from_code' feature name
		once
			create {ET_IDENTIFIER} Result.make (exception_from_code_name)
		ensure
			instance_free: class
			exception_from_code_feature_name_not_void: Result /= Void
		end

	exception_manager_feature_name: ET_FEATURE_NAME
			-- 'exception_manager' feature name
		once
			create {ET_IDENTIFIER} Result.make (exception_manager_name)
		ensure
			instance_free: class
			exception_manager_feature_name_not_void: Result /= Void
		end

	extend_feature_name: ET_FEATURE_NAME
			-- 'extend' feature name
		once
			create {ET_IDENTIFIER} Result.make (extend_name)
		ensure
			instance_free: class
			extend_feature_name_not_void: Result /= Void
		end

	fast_call_feature_name: ET_FEATURE_NAME
			-- 'fast_call' feature name
		once
			create {ET_IDENTIFIER} Result.make (fast_call_name)
		ensure
			instance_free: class
			fast_call_feature_name_not_void: Result /= Void
		end

	fast_item_feature_name: ET_FEATURE_NAME
			-- 'fast_item' feature name
		once
			create {ET_IDENTIFIER} Result.make (fast_item_name)
		ensure
			instance_free: class
			fast_item_feature_name_not_void: Result /= Void
		end

	field_feature_name: ET_FEATURE_NAME
			-- 'field' feature name
		once
			create {ET_IDENTIFIER} Result.make (field_name)
		ensure
			instance_free: class
			field_feature_name_not_void: Result /= Void
		end

	field_count_feature_name: ET_FEATURE_NAME
			-- 'field_count' feature name
		once
			create {ET_IDENTIFIER} Result.make (field_count_name)
		ensure
			instance_free: class
			field_count_feature_name_not_void: Result /= Void
		end

	field_count_of_type_feature_name: ET_FEATURE_NAME
			-- 'field_count_of_type' feature name
		once
			create {ET_IDENTIFIER} Result.make (field_count_of_type_name)
		ensure
			instance_free: class
			field_count_of_type_feature_name_not_void: Result /= Void
		end

	field_name_feature_name: ET_FEATURE_NAME
			-- 'field_name' feature name
		once
			create {ET_IDENTIFIER} Result.make (field_name_name)
		ensure
			instance_free: class
			field_name_feature_name_not_void: Result /= Void
		end

	field_name_of_type_feature_name: ET_FEATURE_NAME
			-- 'field_name_of_type' feature name
		once
			create {ET_IDENTIFIER} Result.make (field_name_of_type_name)
		ensure
			instance_free: class
			field_name_of_type_feature_name_not_void: Result /= Void
		end

	field_offset_of_type_feature_name: ET_FEATURE_NAME
			-- 'field_offset_of_type' feature name
		once
			create {ET_IDENTIFIER} Result.make (field_offset_of_type_name)
		ensure
			instance_free: class
			field_offset_of_type_feature_name_not_void: Result /= Void
		end

	field_static_type_feature_name: ET_FEATURE_NAME
			-- 'field_static_type' feature name
		once
			create {ET_IDENTIFIER} Result.make (field_static_type_name)
		ensure
			instance_free: class
			field_static_type_feature_name_not_void: Result /= Void
		end

	field_static_type_of_type_feature_name: ET_FEATURE_NAME
			-- 'field_static_type_of_type' feature name
		once
			create {ET_IDENTIFIER} Result.make (field_static_type_of_type_name)
		ensure
			instance_free: class
			field_static_type_of_type_feature_name_not_void: Result /= Void
		end

	field_type_feature_name: ET_FEATURE_NAME
			-- 'field_type' feature name
		once
			create {ET_IDENTIFIER} Result.make (field_type_name)
		ensure
			instance_free: class
			field_type_feature_name_not_void: Result /= Void
		end

	field_type_of_type_feature_name: ET_FEATURE_NAME
			-- 'field_type_of_type' feature name
		once
			create {ET_IDENTIFIER} Result.make (field_type_of_type_name)
		ensure
			instance_free: class
			field_type_of_type_feature_name_not_void: Result /= Void
		end

	find_referers_feature_name: ET_FEATURE_NAME
			-- 'find_referers' feature name
		once
			create {ET_IDENTIFIER} Result.make (find_referers_name)
		ensure
			instance_free: class
			find_referers_feature_name_not_void: Result /= Void
		end

	floor_real_32_feature_name: ET_FEATURE_NAME
			-- 'floor_real_32' feature name
		once
			create {ET_IDENTIFIER} Result.make (floor_real_32_name)
		ensure
			instance_free: class
			floor_real_32_feature_name_not_void: Result /= Void
		end

	floor_real_64_feature_name: ET_FEATURE_NAME
			-- 'floor_real_64' feature name
		once
			create {ET_IDENTIFIER} Result.make (floor_real_64_name)
		ensure
			instance_free: class
			floor_real_64_feature_name_not_void: Result /= Void
		end

	forth_feature_name: ET_FEATURE_NAME
			-- 'forth' feature name
		once
			create {ET_IDENTIFIER} Result.make (forth_name)
		ensure
			instance_free: class
			forth_feature_name_not_void: Result /= Void
		end

	free_feature_name: ET_FEATURE_NAME
			-- 'free' feature name
		once
			create {ET_IDENTIFIER} Result.make (free_name)
		ensure
			instance_free: class
			free_feature_name_not_void: Result /= Void
		end

	generating_type_feature_name: ET_FEATURE_NAME
			-- 'generating_type' feature name
		once
			create {ET_IDENTIFIER} Result.make (generating_type_name)
		ensure
			instance_free: class
			generating_type_feature_name_not_void: Result /= Void
		end

	generating_type_of_type_feature_name: ET_FEATURE_NAME
			-- 'generating_type_of_type' feature name
		once
			create {ET_IDENTIFIER} Result.make (generating_type_of_type_name)
		ensure
			instance_free: class
			generating_type_of_type_feature_name_not_void: Result /= Void
		end

	generating_type_8_of_type_feature_name: ET_FEATURE_NAME
			-- 'generating_type_8_of_type' feature name
		once
			create {ET_IDENTIFIER} Result.make (generating_type_8_of_type_name)
		ensure
			instance_free: class
			generating_type_8_of_type_feature_name_not_void: Result /= Void
		end

	generator_feature_name: ET_FEATURE_NAME
			-- 'generator' feature name
		once
			create {ET_IDENTIFIER} Result.make (generator_name)
		ensure
			instance_free: class
			generator_feature_name_not_void: Result /= Void
		end

	generator_of_type_feature_name: ET_FEATURE_NAME
			-- 'generator_of_type' feature name
		once
			create {ET_IDENTIFIER} Result.make (generator_of_type_name)
		ensure
			instance_free: class
			generator_of_type_feature_name_not_void: Result /= Void
		end

	generator_8_of_type_feature_name: ET_FEATURE_NAME
			-- 'generator_8_of_type' feature name
		once
			create {ET_IDENTIFIER} Result.make (generator_8_of_type_name)
		ensure
			instance_free: class
			generator_8_of_type_feature_name_not_void: Result /= Void
		end

	generic_parameter_count_feature_name: ET_FEATURE_NAME
			-- 'generic_parameter_count' feature name
		once
			create {ET_IDENTIFIER} Result.make (generic_parameter_count_name)
		ensure
			instance_free: class
			generic_parameter_count_feature_name_not_void: Result /= Void
		end

	generic_parameter_type_feature_name: ET_FEATURE_NAME
			-- 'generic_parameter_type' feature name
		once
			create {ET_IDENTIFIER} Result.make (generic_parameter_type_name)
		ensure
			instance_free: class
			generic_parameter_type_feature_name_not_void: Result /= Void
		end

	has_default_feature_name: ET_FEATURE_NAME
			-- 'has_default' feature name
		once
			create {ET_IDENTIFIER} Result.make (has_default_name)
		ensure
			instance_free: class
			has_default_feature_name_not_void: Result /= Void
		end

	hash_code_feature_name: ET_FEATURE_NAME
			-- 'hash_code' feature name
		once
			create {ET_IDENTIFIER} Result.make (hash_code_name)
		ensure
			instance_free: class
			hash_code_feature_name_not_void: Result /= Void
		end

	i_th_argument_pointer_feature_name: ET_FEATURE_NAME
			-- 'i_th_argument_pointer' feature name
		once
			create {ET_IDENTIFIER} Result.make (i_th_argument_pointer_name)
		ensure
			instance_free: class
			i_th_argument_pointer_feature_name_not_void: Result /= Void
		end

	i_th_argument_string_feature_name: ET_FEATURE_NAME
			-- 'i_th_argument_string' feature name
		once
			create {ET_IDENTIFIER} Result.make (i_th_argument_string_name)
		ensure
			instance_free: class
			i_th_argument_string_feature_name_not_void: Result /= Void
		end

	identity_feature_name: ET_FEATURE_NAME
			-- 'identity' feature name
		once
			create {ET_IDENTIFIER} Result.make (identity_name)
		ensure
			instance_free: class
			identity_feature_name_not_void: Result /= Void
		end

	ieee_is_equal_feature_name: ET_FEATURE_NAME
			-- 'ieee_is_equal' feature name
		once
			create {ET_IDENTIFIER} Result.make (ieee_is_equal_name)
		ensure
			instance_free: class
			ieee_is_equal_feature_name_not_void: Result /= Void
		end

	ieee_is_greater_feature_name: ET_FEATURE_NAME
			-- 'ieee_is_greater' feature name
		once
			create {ET_IDENTIFIER} Result.make (ieee_is_greater_name)
		ensure
			instance_free: class
			ieee_is_greater_feature_name_not_void: Result /= Void
		end

	ieee_is_greater_equal_feature_name: ET_FEATURE_NAME
			-- 'ieee_is_greater_equal' feature name
		once
			create {ET_IDENTIFIER} Result.make (ieee_is_greater_equal_name)
		ensure
			instance_free: class
			ieee_is_greater_equal_feature_name_not_void: Result /= Void
		end

	ieee_is_less_feature_name: ET_FEATURE_NAME
			-- 'ieee_is_less' feature name
		once
			create {ET_IDENTIFIER} Result.make (ieee_is_less_name)
		ensure
			instance_free: class
			ieee_is_less_feature_name_not_void: Result /= Void
		end

	ieee_is_less_equal_feature_name: ET_FEATURE_NAME
			-- 'ieee_is_less_equal' feature name
		once
			create {ET_IDENTIFIER} Result.make (ieee_is_less_equal_name)
		ensure
			instance_free: class
			ieee_is_less_equal_feature_name_not_void: Result /= Void
		end

	ieee_maximum_number_feature_name: ET_FEATURE_NAME
			-- 'ieee_maximum_number' feature name
		once
			create {ET_IDENTIFIER} Result.make (ieee_maximum_number_name)
		ensure
			instance_free: class
			ieee_maximum_number_feature_name_not_void: Result /= Void
		end

	ieee_minimum_number_feature_name: ET_FEATURE_NAME
			-- 'ieee_minimum_number' feature name
		once
			create {ET_IDENTIFIER} Result.make (ieee_minimum_number_name)
		ensure
			instance_free: class
			ieee_minimum_number_feature_name_not_void: Result /= Void
		end

	ignore_feature_name: ET_FEATURE_NAME
			-- 'ignore' feature name
		once
			create {ET_IDENTIFIER} Result.make (ignore_name)
		ensure
			instance_free: class
			ignore_feature_name_not_void: Result /= Void
		end

	implication_feature_name: ET_FEATURE_NAME
			-- 'implication' feature name
		once
			create {ET_IDENTIFIER} Result.make (implication_name)
		ensure
			instance_free: class
			implication_feature_name_not_void: Result /= Void
		end

	in_assertion_feature_name: ET_FEATURE_NAME
			-- 'in_assertion' feature name
		once
			create {ET_IDENTIFIER} Result.make (in_assertion_name)
		ensure
			instance_free: class
			in_assertion_feature_name_not_void: Result /= Void
		end

	init_exception_manager_feature_name: ET_FEATURE_NAME
			-- 'init_exception_manager' feature name
		once
			create {ET_IDENTIFIER} Result.make (init_exception_manager_name)
		ensure
			instance_free: class
			init_exception_manager_feature_name_not_void: Result /= Void
		end

	integer_8_field_feature_name: ET_FEATURE_NAME
			-- 'integer_8_field' feature name
		once
			create {ET_IDENTIFIER} Result.make (integer_8_field_name)
		ensure
			instance_free: class
			integer_8_field_feature_name_not_void: Result /= Void
		end

	integer_8_field_at_feature_name: ET_FEATURE_NAME
			-- 'integer_8_field_at' feature name
		once
			create {ET_IDENTIFIER} Result.make (integer_8_field_at_name)
		ensure
			instance_free: class
			integer_8_field_at_feature_name_not_void: Result /= Void
		end

	integer_8_item_feature_name: ET_FEATURE_NAME
			-- 'integer_8_item' feature name
		once
			create {ET_IDENTIFIER} Result.make (integer_8_item_name)
		ensure
			instance_free: class
			integer_8_item_feature_name_not_void: Result /= Void
		end

	integer_16_field_feature_name: ET_FEATURE_NAME
			-- 'integer_16_field' feature name
		once
			create {ET_IDENTIFIER} Result.make (integer_16_field_name)
		ensure
			instance_free: class
			integer_16_field_feature_name_not_void: Result /= Void
		end

	integer_16_field_at_feature_name: ET_FEATURE_NAME
			-- 'integer_16_field_at' feature name
		once
			create {ET_IDENTIFIER} Result.make (integer_16_field_at_name)
		ensure
			instance_free: class
			integer_16_field_at_feature_name_not_void: Result /= Void
		end

	integer_16_item_feature_name: ET_FEATURE_NAME
			-- 'integer_16_item' feature name
		once
			create {ET_IDENTIFIER} Result.make (integer_16_item_name)
		ensure
			instance_free: class
			integer_16_item_feature_name_not_void: Result /= Void
		end

	integer_32_field_feature_name: ET_FEATURE_NAME
			-- 'integer_32_field' feature name
		once
			create {ET_IDENTIFIER} Result.make (integer_32_field_name)
		ensure
			instance_free: class
			integer_32_field_feature_name_not_void: Result /= Void
		end

	integer_32_field_at_feature_name: ET_FEATURE_NAME
			-- 'integer_32_field_at' feature name
		once
			create {ET_IDENTIFIER} Result.make (integer_32_field_at_name)
		ensure
			instance_free: class
			integer_32_field_at_feature_name_not_void: Result /= Void
		end

	integer_32_item_feature_name: ET_FEATURE_NAME
			-- 'integer_32_item' feature name
		once
			create {ET_IDENTIFIER} Result.make (integer_32_item_name)
		ensure
			instance_free: class
			integer_32_item_feature_name_not_void: Result /= Void
		end

	integer_64_field_feature_name: ET_FEATURE_NAME
			-- 'integer_64_field' feature name
		once
			create {ET_IDENTIFIER} Result.make (integer_64_field_name)
		ensure
			instance_free: class
			integer_64_field_feature_name_not_void: Result /= Void
		end

	integer_64_field_at_feature_name: ET_FEATURE_NAME
			-- 'integer_64_field_at' feature name
		once
			create {ET_IDENTIFIER} Result.make (integer_64_field_at_name)
		ensure
			instance_free: class
			integer_64_field_at_feature_name_not_void: Result /= Void
		end

	integer_64_item_feature_name: ET_FEATURE_NAME
			-- 'integer_64_item' feature name
		once
			create {ET_IDENTIFIER} Result.make (integer_64_item_name)
		ensure
			instance_free: class
			integer_64_item_feature_name_not_void: Result /= Void
		end

	integer_bytes_feature_name: ET_FEATURE_NAME
			-- 'integer_bytes' feature name
		once
			create {ET_IDENTIFIER} Result.make (integer_bytes_name)
		ensure
			instance_free: class
			integer_bytes_feature_name_not_void: Result /= Void
		end

	integer_quotient_feature_name: ET_FEATURE_NAME
			-- 'integer_quotient' feature name
		once
			create {ET_IDENTIFIER} Result.make (integer_quotient_name)
		ensure
			instance_free: class
			integer_quotient_feature_name_not_void: Result /= Void
		end

	integer_remainder_feature_name: ET_FEATURE_NAME
			-- 'integer_remainder' feature name
		once
			create {ET_IDENTIFIER} Result.make (integer_remainder_name)
		ensure
			instance_free: class
			integer_remainder_feature_name_not_void: Result /= Void
		end

	invariant_feature_name: ET_FEATURE_NAME
			-- Fictitious 'invariant' feature name
		once
			create {ET_IDENTIFIER} Result.make (invariant_keyword_name)
		ensure
			instance_free: class
			invariant_feature_name_not_void: Result /= Void
		end

	is_64_bits_feature_name: ET_FEATURE_NAME
			-- 'is_64_bits' feature name
		once
			create {ET_IDENTIFIER} Result.make (is_64_bits_name)
		ensure
			instance_free: class
			is_64_bits_feature_name_not_void: Result /= Void
		end

	is_attached_feature_name: ET_FEATURE_NAME
			-- 'is_attached' feature name
		once
			create {ET_IDENTIFIER} Result.make (is_attached_name)
		ensure
			instance_free: class
			is_attached_feature_name_not_void: Result /= Void
		end

	is_attached_type_feature_name: ET_FEATURE_NAME
			-- 'is_attached_type' feature name
		once
			create {ET_IDENTIFIER} Result.make (is_attached_type_name)
		ensure
			instance_free: class
			is_attached_type_feature_name_not_void: Result /= Void
		end

	is_caught_feature_name: ET_FEATURE_NAME
			-- 'is_caught' feature name
		once
			create {ET_IDENTIFIER} Result.make (is_caught_name)
		ensure
			instance_free: class
			is_caught_feature_name_not_void: Result /= Void
		end

	is_copy_semantics_field_feature_name: ET_FEATURE_NAME
			-- 'is_copy_semantics_field' feature name
		once
			create {ET_IDENTIFIER} Result.make (is_copy_semantics_field_name)
		ensure
			instance_free: class
			is_copy_semantics_field_feature_name_not_void: Result /= Void
		end

	is_deep_equal_feature_name: ET_FEATURE_NAME
			-- 'is_deep_equal' feature name
		once
			create {ET_IDENTIFIER} Result.make (is_deep_equal_name)
		ensure
			instance_free: class
			is_deep_equal_feature_name_not_void: Result /= Void
		end

	is_default_pointer_feature_name: ET_FEATURE_NAME
			-- 'is_default_pointer' feature name
		once
			create {ET_IDENTIFIER} Result.make (is_default_pointer_name)
		ensure
			instance_free: class
			is_default_pointer_feature_name_not_void: Result /= Void
		end

	is_deferred_feature_name: ET_FEATURE_NAME
			-- 'is_deferred' feature name
		once
			create {ET_IDENTIFIER} Result.make (is_deferred_name)
		ensure
			instance_free: class
			is_deferred_feature_name_not_void: Result /= Void
		end

	is_dotnet_feature_name: ET_FEATURE_NAME
			-- 'is_dotnet' feature name
		once
			create {ET_IDENTIFIER} Result.make (is_dotnet_name)
		ensure
			instance_free: class
			is_dotnet_feature_name_not_void: Result /= Void
		end

	is_equal_feature_name: ET_FEATURE_NAME
			-- 'is_equal' feature name
		once
			create {ET_IDENTIFIER} Result.make (is_equal_name)
		ensure
			instance_free: class
			is_equal_feature_name_not_void: Result /= Void
		end

	is_expanded_feature_name: ET_FEATURE_NAME
			-- 'is_expanded' feature name
		once
			create {ET_IDENTIFIER} Result.make (is_expanded_name)
		ensure
			instance_free: class
			is_expanded_feature_name_not_void: Result /= Void
		end

	is_field_expanded_of_type_feature_name: ET_FEATURE_NAME
			-- 'is_field_expanded_of_type' feature name
		once
			create {ET_IDENTIFIER} Result.make (is_field_expanded_of_type_name)
		ensure
			instance_free: class
			is_field_expanded_of_type_feature_name_not_void: Result /= Void
		end

	is_field_transient_of_type_feature_name: ET_FEATURE_NAME
			-- 'is_field_transient_of_type' feature name
		once
			create {ET_IDENTIFIER} Result.make (is_field_transient_of_type_name)
		ensure
			instance_free: class
			is_field_transient_of_type_feature_name_not_void: Result /= Void
		end

	is_ignorable_feature_name: ET_FEATURE_NAME
			-- 'is_ignorable' feature name
		once
			create {ET_IDENTIFIER} Result.make (is_ignorable_name)
		ensure
			instance_free: class
			is_ignorable_feature_name_not_void: Result /= Void
		end

	is_ignored_feature_name: ET_FEATURE_NAME
			-- 'is_ignored' feature name
		once
			create {ET_IDENTIFIER} Result.make (is_ignored_name)
		ensure
			instance_free: class
			is_ignored_feature_name_not_void: Result /= Void
		end

	is_less_feature_name: ET_FEATURE_NAME
			-- 'is_less' feature name
		once
			create {ET_IDENTIFIER} Result.make (is_less_name)
		ensure
			instance_free: class
			is_less_feature_name_not_void: Result /= Void
		end

	is_mac_feature_name: ET_FEATURE_NAME
			-- 'is_mac' feature name
		once
			create {ET_IDENTIFIER} Result.make (is_mac_name)
		ensure
			instance_free: class
			is_mac_feature_name_not_void: Result /= Void
		end

	is_nan_feature_name: ET_FEATURE_NAME
			-- 'is_nan' feature name
		once
			create {ET_IDENTIFIER} Result.make (is_nan_name)
		ensure
			instance_free: class
			is_nan_feature_name_not_void: Result /= Void
		end

	is_negative_infinity_feature_name: ET_FEATURE_NAME
			-- 'is_negative_infinity' feature name
		once
			create {ET_IDENTIFIER} Result.make (is_negative_infinity_name)
		ensure
			instance_free: class
			is_negative_infinity_feature_name_not_void: Result /= Void
		end

	is_object_marked_feature_name: ET_FEATURE_NAME
			-- 'is_object_marked' feature name
		once
			create {ET_IDENTIFIER} Result.make (is_object_marked_name)
		ensure
			instance_free: class
			is_object_marked_feature_name_not_void: Result /= Void
		end

	is_positive_infinity_feature_name: ET_FEATURE_NAME
			-- 'is_positive_infinity' feature name
		once
			create {ET_IDENTIFIER} Result.make (is_positive_infinity_name)
		ensure
			instance_free: class
			is_positive_infinity_feature_name_not_void: Result /= Void
		end

	is_raisable_feature_name: ET_FEATURE_NAME
			-- 'is_raisable' feature name
		once
			create {ET_IDENTIFIER} Result.make (is_raisable_name)
		ensure
			instance_free: class
			is_raisable_feature_name_not_void: Result /= Void
		end

	is_scoop_capable_feature_name: ET_FEATURE_NAME
			-- 'is_scoop_capable' feature name
		once
			create {ET_IDENTIFIER} Result.make (is_scoop_capable_name)
		ensure
			instance_free: class
			is_scoop_capable_feature_name_not_void: Result /= Void
		end

	is_special_feature_name: ET_FEATURE_NAME
			-- 'is_special' feature name
		once
			create {ET_IDENTIFIER} Result.make (is_special_name)
		ensure
			instance_free: class
			is_special_feature_name_not_void: Result /= Void
		end

	is_special_copy_semantics_item_feature_name: ET_FEATURE_NAME
			-- 'is_special_copy_semantics_item' feature name
		once
			create {ET_IDENTIFIER} Result.make (is_special_copy_semantics_item_name)
		ensure
			instance_free: class
			is_special_copy_semantics_item_feature_name_not_void: Result /= Void
		end

	is_special_of_expanded_feature_name: ET_FEATURE_NAME
			-- 'is_special_of_expanded' feature name
		once
			create {ET_IDENTIFIER} Result.make (is_special_of_expanded_name)
		ensure
			instance_free: class
			is_special_of_expanded_feature_name_not_void: Result /= Void
		end

	is_special_of_reference_feature_name: ET_FEATURE_NAME
			-- 'is_special_of_reference' feature name
		once
			create {ET_IDENTIFIER} Result.make (is_special_of_reference_name)
		ensure
			instance_free: class
			is_special_of_reference_feature_name_not_void: Result /= Void
		end

	is_special_of_reference_or_basic_type_feature_name: ET_FEATURE_NAME
			-- 'is_special_of_reference_or_basic_type' feature name
		once
			create {ET_IDENTIFIER} Result.make (is_special_of_reference_or_basic_type_name)
		ensure
			instance_free: class
			is_special_of_reference_or_basic_type_feature_name_not_void: Result /= Void
		end

	is_special_of_reference_type_feature_name: ET_FEATURE_NAME
			-- 'is_special_of_reference_type' feature name
		once
			create {ET_IDENTIFIER} Result.make (is_special_of_reference_type_name)
		ensure
			instance_free: class
			is_special_of_reference_type_feature_name_not_void: Result /= Void
		end

	is_thread_capable_feature_name: ET_FEATURE_NAME
			-- 'is_thread_capable' feature name
		once
			create {ET_IDENTIFIER} Result.make (is_thread_capable_name)
		ensure
			instance_free: class
			is_thread_capable_feature_name_not_void: Result /= Void
		end

	is_tuple_feature_name: ET_FEATURE_NAME
			-- 'is_tuple' feature name
		once
			create {ET_IDENTIFIER} Result.make (is_tuple_name)
		ensure
			instance_free: class
			is_tuple_feature_name_not_void: Result /= Void
		end

	is_tuple_type_feature_name: ET_FEATURE_NAME
			-- 'is_tuple_type' feature name
		once
			create {ET_IDENTIFIER} Result.make (is_tuple_type_name)
		ensure
			instance_free: class
			is_tuple_type_feature_name_not_void: Result /= Void
		end

	is_unix_feature_name: ET_FEATURE_NAME
			-- 'is_unix' feature name
		once
			create {ET_IDENTIFIER} Result.make (is_unix_name)
		ensure
			instance_free: class
			is_unix_feature_name_not_void: Result /= Void
		end

	is_vms_feature_name: ET_FEATURE_NAME
			-- 'is_vms' feature name
		once
			create {ET_IDENTIFIER} Result.make (is_vms_name)
		ensure
			instance_free: class
			is_vms_feature_name_not_void: Result /= Void
		end

	is_vxworks_feature_name: ET_FEATURE_NAME
			-- 'is_vxworks' feature name
		once
			create {ET_IDENTIFIER} Result.make (is_vxworks_name)
		ensure
			instance_free: class
			is_vxworks_feature_name_not_void: Result /= Void
		end

	is_windows_feature_name: ET_FEATURE_NAME
			-- 'is_windows' feature name
		once
			create {ET_IDENTIFIER} Result.make (is_windows_name)
		ensure
			instance_free: class
			is_windows_feature_name_not_void: Result /= Void
		end

	item_feature_name: ET_FEATURE_NAME
			-- 'item' feature name
		once
			create {ET_IDENTIFIER} Result.make (item_name)
		ensure
			instance_free: class
			item_feature_name_not_void: Result /= Void
		end

	item_code_feature_name: ET_FEATURE_NAME
			-- 'item_code' feature name
		once
			create {ET_IDENTIFIER} Result.make (item_code_name)
		ensure
			instance_free: class
			item_code_feature_name_not_void: Result /= Void
		end

	last_exception_feature_name: ET_FEATURE_NAME
			-- 'last_exception' feature name
		once
			create {ET_IDENTIFIER} Result.make (last_exception_name)
		ensure
			instance_free: class
			last_exception_feature_name_not_void: Result /= Void
		end

	last_result_feature_name: ET_FEATURE_NAME
			-- 'last_result' feature name
		once
			create {ET_IDENTIFIER} Result.make (last_result_name)
		ensure
			instance_free: class
			last_result_feature_name_not_void: Result /= Void
		end

	lock_marking_feature_name: ET_FEATURE_NAME
			-- 'lock_marking' feature name
		once
			create {ET_IDENTIFIER} Result.make (lock_marking_name)
		ensure
			instance_free: class
			lock_marking_feature_name_not_void: Result /= Void
		end

	lower_feature_name: ET_FEATURE_NAME
			-- 'lower' feature name
		once
			create {ET_IDENTIFIER} Result.make (lower_name)
		ensure
			instance_free: class
			lower_feature_name_not_void: Result /= Void
		end

	make_feature_name: ET_FEATURE_NAME
			-- 'make' feature name
		once
			create {ET_IDENTIFIER} Result.make (make_name)
		ensure
			instance_free: class
			make_feature_name_not_void: Result /= Void
		end

	make_empty_feature_name: ET_FEATURE_NAME
			-- 'make_empty' feature name
		once
			create {ET_IDENTIFIER} Result.make (make_empty_name)
		ensure
			instance_free: class
			make_empty_feature_name_not_void: Result /= Void
		end

	mark_object_feature_name: ET_FEATURE_NAME
			-- 'mark_object' feature name
		once
			create {ET_IDENTIFIER} Result.make (mark_object_name)
		ensure
			instance_free: class
			mark_object_feature_name_not_void: Result /= Void
		end

	max_type_id_feature_name: ET_FEATURE_NAME
			-- 'max_type_id' feature name
		once
			create {ET_IDENTIFIER} Result.make (max_type_id_name)
		ensure
			instance_free: class
			max_type_id_feature_name_not_void: Result /= Void
		end

	minus_feature_name: ET_FEATURE_NAME
			-- 'minus' feature name
		once
			create {ET_IDENTIFIER} Result.make (minus_name)
		ensure
			instance_free: class
			minus_feature_name_not_void: Result /= Void
		end

	name_feature_name: ET_FEATURE_NAME
			-- 'name' feature name
		once
			create {ET_IDENTIFIER} Result.make (name_name)
		ensure
			instance_free: class
			name_feature_name_not_void: Result /= Void
		end

	nan_feature_name: ET_FEATURE_NAME
			-- 'nan' feature name
		once
			create {ET_IDENTIFIER} Result.make (nan_name)
		ensure
			instance_free: class
			nan_feature_name_not_void: Result /= Void
		end

	natural_8_field_feature_name: ET_FEATURE_NAME
			-- 'natural_8_field' feature name
		once
			create {ET_IDENTIFIER} Result.make (natural_8_field_name)
		ensure
			instance_free: class
			natural_8_field_feature_name_not_void: Result /= Void
		end

	natural_8_field_at_feature_name: ET_FEATURE_NAME
			-- 'natural_8_field_at' feature name
		once
			create {ET_IDENTIFIER} Result.make (natural_8_field_at_name)
		ensure
			instance_free: class
			natural_8_field_at_feature_name_not_void: Result /= Void
		end

	natural_8_item_feature_name: ET_FEATURE_NAME
			-- 'natural_8_item' feature name
		once
			create {ET_IDENTIFIER} Result.make (natural_8_item_name)
		ensure
			instance_free: class
			natural_8_item_feature_name_not_void: Result /= Void
		end

	natural_16_field_feature_name: ET_FEATURE_NAME
			-- 'natural_16_field' feature name
		once
			create {ET_IDENTIFIER} Result.make (natural_16_field_name)
		ensure
			instance_free: class
			natural_16_field_feature_name_not_void: Result /= Void
		end

	natural_16_field_at_feature_name: ET_FEATURE_NAME
			-- 'natural_16_field_at' feature name
		once
			create {ET_IDENTIFIER} Result.make (natural_16_field_at_name)
		ensure
			instance_free: class
			natural_16_field_at_feature_name_not_void: Result /= Void
		end

	natural_16_item_feature_name: ET_FEATURE_NAME
			-- 'natural_16_item' feature name
		once
			create {ET_IDENTIFIER} Result.make (natural_16_item_name)
		ensure
			instance_free: class
			natural_16_item_feature_name_not_void: Result /= Void
		end

	natural_32_code_feature_name: ET_FEATURE_NAME
			-- 'natural_32_code' feature name
		once
			create {ET_IDENTIFIER} Result.make (natural_32_code_name)
		ensure
			instance_free: class
			natural_32_code_feature_name_not_void: Result /= Void
		end

	natural_32_field_feature_name: ET_FEATURE_NAME
			-- 'natural_32_field' feature name
		once
			create {ET_IDENTIFIER} Result.make (natural_32_field_name)
		ensure
			instance_free: class
			natural_32_field_feature_name_not_void: Result /= Void
		end

	natural_32_field_at_feature_name: ET_FEATURE_NAME
			-- 'natural_32_field_at' feature name
		once
			create {ET_IDENTIFIER} Result.make (natural_32_field_at_name)
		ensure
			instance_free: class
			natural_32_field_at_feature_name_not_void: Result /= Void
		end

	natural_32_item_feature_name: ET_FEATURE_NAME
			-- 'natural_32_item' feature name
		once
			create {ET_IDENTIFIER} Result.make (natural_32_item_name)
		ensure
			instance_free: class
			natural_32_item_feature_name_not_void: Result /= Void
		end

	natural_64_field_feature_name: ET_FEATURE_NAME
			-- 'natural_64_field' feature name
		once
			create {ET_IDENTIFIER} Result.make (natural_64_field_name)
		ensure
			instance_free: class
			natural_64_field_feature_name_not_void: Result /= Void
		end

	natural_64_field_at_feature_name: ET_FEATURE_NAME
			-- 'natural_64_field_at' feature name
		once
			create {ET_IDENTIFIER} Result.make (natural_64_field_at_name)
		ensure
			instance_free: class
			natural_64_field_at_feature_name_not_void: Result /= Void
		end

	natural_64_item_feature_name: ET_FEATURE_NAME
			-- 'natural_64_item' feature name
		once
			create {ET_IDENTIFIER} Result.make (natural_64_item_name)
		ensure
			instance_free: class
			natural_64_item_feature_name_not_void: Result /= Void
		end

	negated_feature_name: ET_FEATURE_NAME
			-- 'negated' feature name
		once
			create {ET_IDENTIFIER} Result.make (negated_name)
		ensure
			instance_free: class
			negated_feature_name_not_void: Result /= Void
		end

	negative_infinity_feature_name: ET_FEATURE_NAME
			-- 'negative_infinity' feature name
		once
			create {ET_IDENTIFIER} Result.make (negative_infinity_name)
		ensure
			instance_free: class
			negative_infinity_feature_name_not_void: Result /= Void
		end

	new_cursor_feature_name: ET_FEATURE_NAME
			-- 'new_cursor' feature name
		once
			create {ET_IDENTIFIER} Result.make (new_cursor_name)
		ensure
			instance_free: class
			new_cursor_feature_name_not_void: Result /= Void
		end

	new_instance_feature_name: ET_FEATURE_NAME
			-- 'new_instance' feature name
		once
			create {ET_IDENTIFIER} Result.make (new_instance_name)
		ensure
			instance_free: class
			new_instance_feature_name_not_void: Result /= Void
		end

	new_instance_of_feature_name: ET_FEATURE_NAME
			-- 'new_instance_of' feature name
		once
			create {ET_IDENTIFIER} Result.make (new_instance_of_name)
		ensure
			instance_free: class
			new_instance_of_feature_name_not_void: Result /= Void
		end

	new_special_any_instance_feature_name: ET_FEATURE_NAME
			-- 'new_special_any_instance' feature name
		once
			create {ET_IDENTIFIER} Result.make (new_special_any_instance_name)
		ensure
			instance_free: class
			new_special_any_instance_feature_name_not_void: Result /= Void
		end

	new_special_of_reference_instance_of_feature_name: ET_FEATURE_NAME
			-- 'new_special_of_reference_instance_of' feature name
		once
			create {ET_IDENTIFIER} Result.make (new_special_of_reference_instance_of_name)
		ensure
			instance_free: class
			new_special_of_reference_instance_of_feature_name_not_void: Result /= Void
		end

	new_tuple_instance_of_feature_name: ET_FEATURE_NAME
			-- 'new_tuple_instance_of' feature name
		once
			create {ET_IDENTIFIER} Result.make (new_tuple_instance_of_name)
		ensure
			instance_free: class
			new_tuple_instance_of_feature_name_not_void: Result /= Void
		end

	new_type_instance_of_feature_name: ET_FEATURE_NAME
			-- 'new_type_instance_of' feature name
		once
			create {ET_IDENTIFIER} Result.make (new_type_instance_of_name)
		ensure
			instance_free: class
			new_type_instance_of_feature_name_not_void: Result /= Void
		end

	object_comparison_feature_name: ET_FEATURE_NAME
			-- 'object_comparison' feature name
		once
			create {ET_IDENTIFIER} Result.make (object_comparison_name)
		ensure
			instance_free: class
			object_comparison_feature_name_not_void: Result /= Void
		end

	object_size_feature_name: ET_FEATURE_NAME
			-- 'object_size' feature name
		once
			create {ET_IDENTIFIER} Result.make (object_size_name)
		ensure
			instance_free: class
			object_size_feature_name_not_void: Result /= Void
		end

	once_objects_feature_name: ET_FEATURE_NAME
			-- 'once_objects' feature name
		once
			create {ET_IDENTIFIER} Result.make (once_objects_name)
		ensure
			instance_free: class
			once_objects_feature_name_not_void: Result /= Void
		end

	once_raise_feature_name: ET_FEATURE_NAME
			-- 'once_raise' feature name
		once
			create {ET_IDENTIFIER} Result.make (once_raise_name)
		ensure
			instance_free: class
			once_raise_feature_name_not_void: Result /= Void
		end

	opposite_feature_name: ET_FEATURE_NAME
			-- 'opposite' feature name
		once
			create {ET_IDENTIFIER} Result.make (opposite_name)
		ensure
			instance_free: class
			opposite_feature_name_not_void: Result /= Void
		end

	out_feature_name: ET_FEATURE_NAME
			-- 'out' feature name
		once
			create {ET_IDENTIFIER} Result.make (out_name)
		ensure
			instance_free: class
			out_feature_name_not_void: Result /= Void
		end

	persistent_field_count_of_type_feature_name: ET_FEATURE_NAME
			-- 'persistent_field_count_of_type' feature name
		once
			create {ET_IDENTIFIER} Result.make (persistent_field_count_of_type_name)
		ensure
			instance_free: class
			persistent_field_count_of_type_feature_name_not_void: Result /= Void
		end

	plus_feature_name: ET_FEATURE_NAME
			-- 'plus' feature name
		once
			create {ET_IDENTIFIER} Result.make (plus_name)
		ensure
			instance_free: class
			plus_feature_name_not_void: Result /= Void
		end

	pointer_bytes_feature_name: ET_FEATURE_NAME
			-- 'pointer_bytes' feature name
		once
			create {ET_IDENTIFIER} Result.make (pointer_bytes_name)
		ensure
			instance_free: class
			pointer_bytes_feature_name_not_void: Result /= Void
		end

	pointer_field_feature_name: ET_FEATURE_NAME
			-- 'pointer_field' feature name
		once
			create {ET_IDENTIFIER} Result.make (pointer_field_name)
		ensure
			instance_free: class
			pointer_field_feature_name_not_void: Result /= Void
		end

	pointer_field_at_feature_name: ET_FEATURE_NAME
			-- 'pointer_field_at' feature name
		once
			create {ET_IDENTIFIER} Result.make (pointer_field_at_name)
		ensure
			instance_free: class
			pointer_field_at_feature_name_not_void: Result /= Void
		end

	pointer_item_feature_name: ET_FEATURE_NAME
			-- 'pointer_item' feature name
		once
			create {ET_IDENTIFIER} Result.make (pointer_item_name)
		ensure
			instance_free: class
			pointer_item_feature_name_not_void: Result /= Void
		end

	positive_infinity_feature_name: ET_FEATURE_NAME
			-- 'positive_infinity' feature name
		once
			create {ET_IDENTIFIER} Result.make (positive_infinity_name)
		ensure
			instance_free: class
			positive_infinity_feature_name_not_void: Result /= Void
		end

	power_feature_name: ET_FEATURE_NAME
			-- 'power' feature name
		once
			create {ET_IDENTIFIER} Result.make (power_name)
		ensure
			instance_free: class
			power_feature_name_not_void: Result /= Void
		end

	pre_ecma_mapping_status_feature_name: ET_FEATURE_NAME
			-- 'pre_ecma_mapping_status' feature name
		once
			create {ET_IDENTIFIER} Result.make (pre_ecma_mapping_status_name)
		ensure
			instance_free: class
			pre_ecma_mapping_status_feature_name_not_void: Result /= Void
		end

	product_feature_name: ET_FEATURE_NAME
			-- 'product' feature name
		once
			create {ET_IDENTIFIER} Result.make (product_name)
		ensure
			instance_free: class
			product_feature_name_not_void: Result /= Void
		end

	put_feature_name: ET_FEATURE_NAME
			-- 'put' feature name
		once
			create {ET_IDENTIFIER} Result.make (put_name)
		ensure
			instance_free: class
			put_feature_name_not_void: Result /= Void
		end

	put_boolean_feature_name: ET_FEATURE_NAME
			-- 'put_boolean' feature name
		once
			create {ET_IDENTIFIER} Result.make (put_boolean_name)
		ensure
			instance_free: class
			put_boolean_feature_name_not_void: Result /= Void
		end

	put_character_8_feature_name: ET_FEATURE_NAME
			-- 'put_character_8' feature name
		once
			create {ET_IDENTIFIER} Result.make (put_character_8_name)
		ensure
			instance_free: class
			put_character_8_feature_name_not_void: Result /= Void
		end

	put_character_32_feature_name: ET_FEATURE_NAME
			-- 'put_character_32' feature name
		once
			create {ET_IDENTIFIER} Result.make (put_character_32_name)
		ensure
			instance_free: class
			put_character_32_feature_name_not_void: Result /= Void
		end

	put_integer_8_feature_name: ET_FEATURE_NAME
			-- 'put_integer_8' feature name
		once
			create {ET_IDENTIFIER} Result.make (put_integer_8_name)
		ensure
			instance_free: class
			put_integer_8_feature_name_not_void: Result /= Void
		end

	put_integer_16_feature_name: ET_FEATURE_NAME
			-- 'put_integer_16' feature name
		once
			create {ET_IDENTIFIER} Result.make (put_integer_16_name)
		ensure
			instance_free: class
			put_integer_16_feature_name_not_void: Result /= Void
		end

	put_integer_32_feature_name: ET_FEATURE_NAME
			-- 'put_integer_32' feature name
		once
			create {ET_IDENTIFIER} Result.make (put_integer_32_name)
		ensure
			instance_free: class
			put_integer_32_feature_name_not_void: Result /= Void
		end

	put_integer_64_feature_name: ET_FEATURE_NAME
			-- 'put_integer_64' feature name
		once
			create {ET_IDENTIFIER} Result.make (put_integer_64_name)
		ensure
			instance_free: class
			put_integer_64_feature_name_not_void: Result /= Void
		end

	put_natural_8_feature_name: ET_FEATURE_NAME
			-- 'put_natural_8' feature name
		once
			create {ET_IDENTIFIER} Result.make (put_natural_8_name)
		ensure
			instance_free: class
			put_natural_8_feature_name_not_void: Result /= Void
		end

	put_natural_16_feature_name: ET_FEATURE_NAME
			-- 'put_natural_16' feature name
		once
			create {ET_IDENTIFIER} Result.make (put_natural_16_name)
		ensure
			instance_free: class
			put_natural_16_feature_name_not_void: Result /= Void
		end

	put_natural_32_feature_name: ET_FEATURE_NAME
			-- 'put_natural_32' feature name
		once
			create {ET_IDENTIFIER} Result.make (put_natural_32_name)
		ensure
			instance_free: class
			put_natural_32_feature_name_not_void: Result /= Void
		end

	put_natural_64_feature_name: ET_FEATURE_NAME
			-- 'put_natural_64' feature name
		once
			create {ET_IDENTIFIER} Result.make (put_natural_64_name)
		ensure
			instance_free: class
			put_natural_64_feature_name_not_void: Result /= Void
		end

	put_pointer_feature_name: ET_FEATURE_NAME
			-- 'put_pointer' feature name
		once
			create {ET_IDENTIFIER} Result.make (put_pointer_name)
		ensure
			instance_free: class
			put_pointer_feature_name_not_void: Result /= Void
		end

	put_real_32_feature_name: ET_FEATURE_NAME
			-- 'put_real_32' feature name
		once
			create {ET_IDENTIFIER} Result.make (put_real_32_name)
		ensure
			instance_free: class
			put_real_32_feature_name_not_void: Result /= Void
		end

	put_real_64_feature_name: ET_FEATURE_NAME
			-- 'put_real_64' feature name
		once
			create {ET_IDENTIFIER} Result.make (put_real_64_name)
		ensure
			instance_free: class
			put_real_64_feature_name_not_void: Result /= Void
		end

	put_reference_feature_name: ET_FEATURE_NAME
			-- 'put_reference' feature name
		once
			create {ET_IDENTIFIER} Result.make (put_reference_name)
		ensure
			instance_free: class
			put_reference_feature_name_not_void: Result /= Void
		end

	quotient_feature_name: ET_FEATURE_NAME
			-- 'quotient' feature name
		once
			create {ET_IDENTIFIER} Result.make (quotient_name)
		ensure
			instance_free: class
			quotient_feature_name_not_void: Result /= Void
		end

	raise_feature_name: ET_FEATURE_NAME
			-- 'raise' feature name
		once
			create {ET_IDENTIFIER} Result.make (raise_name)
		ensure
			instance_free: class
			raise_feature_name_not_void: Result /= Void
		end

	raw_reference_field_at_feature_name: ET_FEATURE_NAME
			-- 'raw_reference_field_at' feature name
		once
			create {ET_IDENTIFIER} Result.make (raw_reference_field_at_name)
		ensure
			instance_free: class
			raw_reference_field_at_feature_name_not_void: Result /= Void
		end

	raw_reference_field_at_offset_feature_name: ET_FEATURE_NAME
			-- 'raw_reference_field_at_offset' feature name
		once
			create {ET_IDENTIFIER} Result.make (raw_reference_field_at_offset_name)
		ensure
			instance_free: class
			raw_reference_field_at_offset_feature_name_not_void: Result /= Void
		end

	real_32_field_feature_name: ET_FEATURE_NAME
			-- 'real_32_field' feature name
		once
			create {ET_IDENTIFIER} Result.make (real_32_field_name)
		ensure
			instance_free: class
			real_32_field_feature_name_not_void: Result /= Void
		end

	real_32_field_at_feature_name: ET_FEATURE_NAME
			-- 'real_32_field_at' feature name
		once
			create {ET_IDENTIFIER} Result.make (real_32_field_at_name)
		ensure
			instance_free: class
			real_32_field_at_feature_name_not_void: Result /= Void
		end

	real_32_item_feature_name: ET_FEATURE_NAME
			-- 'real_32_item' feature name
		once
			create {ET_IDENTIFIER} Result.make (real_32_item_name)
		ensure
			instance_free: class
			real_32_item_feature_name_not_void: Result /= Void
		end

	real_64_field_feature_name: ET_FEATURE_NAME
			-- 'real_64_field' feature name
		once
			create {ET_IDENTIFIER} Result.make (real_64_field_name)
		ensure
			instance_free: class
			real_64_field_feature_name_not_void: Result /= Void
		end

	real_64_field_at_feature_name: ET_FEATURE_NAME
			-- 'real_64_field_at' feature name
		once
			create {ET_IDENTIFIER} Result.make (real_64_field_at_name)
		ensure
			instance_free: class
			real_64_field_at_feature_name_not_void: Result /= Void
		end

	real_64_item_feature_name: ET_FEATURE_NAME
			-- 'real_64_item' feature name
		once
			create {ET_IDENTIFIER} Result.make (real_64_item_name)
		ensure
			instance_free: class
			real_64_item_feature_name_not_void: Result /= Void
		end

	real_bytes_feature_name: ET_FEATURE_NAME
			-- 'real_bytes' feature name
		once
			create {ET_IDENTIFIER} Result.make (real_bytes_name)
		ensure
			instance_free: class
			real_bytes_feature_name_not_void: Result /= Void
		end

	reference_field_feature_name: ET_FEATURE_NAME
			-- 'reference_field' feature name
		once
			create {ET_IDENTIFIER} Result.make (reference_field_name)
		ensure
			instance_free: class
			reference_field_feature_name_not_void: Result /= Void
		end

	reference_field_at_feature_name: ET_FEATURE_NAME
			-- 'reference_field_at' feature name
		once
			create {ET_IDENTIFIER} Result.make (reference_field_at_name)
		ensure
			instance_free: class
			reference_field_at_feature_name_not_void: Result /= Void
		end

	reference_field_at_offset_feature_name: ET_FEATURE_NAME
			-- 'reference_field_at_offset' feature name
		once
			create {ET_IDENTIFIER} Result.make (reference_field_at_offset_name)
		ensure
			instance_free: class
			reference_field_at_offset_feature_name_not_void: Result /= Void
		end

	reference_item_feature_name: ET_FEATURE_NAME
			-- 'reference_item' feature name
		once
			create {ET_IDENTIFIER} Result.make (reference_item_name)
		ensure
			instance_free: class
			reference_item_feature_name_not_void: Result /= Void
		end

	rout_disp_feature_name: ET_FEATURE_NAME
			-- 'rout_disp' feature name
		once
			create {ET_IDENTIFIER} Result.make (rout_disp_name)
		ensure
			instance_free: class
			rout_disp_feature_name_not_void: Result /= Void
		end

	runtime_name_feature_name: ET_FEATURE_NAME
			-- 'runtime_name' feature name
		once
			create {ET_IDENTIFIER} Result.make (runtime_name_name)
		ensure
			instance_free: class
			runtime_name_feature_name_not_void: Result /= Void
		end

	same_type_feature_name: ET_FEATURE_NAME
			-- 'same_type' feature name
		once
			create {ET_IDENTIFIER} Result.make (same_type_name)
		ensure
			instance_free: class
			same_type_feature_name_not_void: Result /= Void
		end

	set_boolean_field_feature_name: ET_FEATURE_NAME
			-- 'set_boolean_field' feature name
		once
			create {ET_IDENTIFIER} Result.make (set_boolean_field_name)
		ensure
			instance_free: class
			set_boolean_field_feature_name_not_void: Result /= Void
		end

	set_boolean_field_at_feature_name: ET_FEATURE_NAME
			-- 'set_boolean_field_at' feature name
		once
			create {ET_IDENTIFIER} Result.make (set_boolean_field_at_name)
		ensure
			instance_free: class
			set_boolean_field_at_feature_name_not_void: Result /= Void
		end

	set_character_8_field_feature_name: ET_FEATURE_NAME
			-- 'set_character_8_field' feature name
		once
			create {ET_IDENTIFIER} Result.make (set_character_8_field_name)
		ensure
			instance_free: class
			set_character_8_field_feature_name_not_void: Result /= Void
		end

	set_character_8_field_at_feature_name: ET_FEATURE_NAME
			-- 'set_character_8_field_at' feature name
		once
			create {ET_IDENTIFIER} Result.make (set_character_8_field_at_name)
		ensure
			instance_free: class
			set_character_8_field_at_feature_name_not_void: Result /= Void
		end

	set_character_32_field_feature_name: ET_FEATURE_NAME
			-- 'set_character_32_field' feature name
		once
			create {ET_IDENTIFIER} Result.make (set_character_32_field_name)
		ensure
			instance_free: class
			set_character_32_field_feature_name_not_void: Result /= Void
		end

	set_character_32_field_at_feature_name: ET_FEATURE_NAME
			-- 'set_character_32_field_at' feature name
		once
			create {ET_IDENTIFIER} Result.make (set_character_32_field_at_name)
		ensure
			instance_free: class
			set_character_32_field_at_feature_name_not_void: Result /= Void
		end

	set_count_feature_name: ET_FEATURE_NAME
			-- 'set_count' feature name
		once
			create {ET_IDENTIFIER} Result.make (set_count_name)
		ensure
			instance_free: class
			set_count_feature_name_not_void: Result /= Void
		end

	set_exception_data_feature_name: ET_FEATURE_NAME
			-- 'set_exception_data' feature name
		once
			create {ET_IDENTIFIER} Result.make (set_exception_data_name)
		ensure
			instance_free: class
			set_exception_data_feature_name_not_void: Result /= Void
		end

	set_integer_8_field_feature_name: ET_FEATURE_NAME
			-- 'set_integer_8_field' feature name
		once
			create {ET_IDENTIFIER} Result.make (set_integer_8_field_name)
		ensure
			instance_free: class
			set_integer_8_field_feature_name_not_void: Result /= Void
		end

	set_integer_8_field_at_feature_name: ET_FEATURE_NAME
			-- 'set_integer_8_field_at' feature name
		once
			create {ET_IDENTIFIER} Result.make (set_integer_8_field_at_name)
		ensure
			instance_free: class
			set_integer_8_field_at_feature_name_not_void: Result /= Void
		end

	set_integer_16_field_feature_name: ET_FEATURE_NAME
			-- 'set_integer_16_field' feature name
		once
			create {ET_IDENTIFIER} Result.make (set_integer_16_field_name)
		ensure
			instance_free: class
			set_integer_16_field_feature_name_not_void: Result /= Void
		end

	set_integer_16_field_at_feature_name: ET_FEATURE_NAME
			-- 'set_integer_16_field_at' feature name
		once
			create {ET_IDENTIFIER} Result.make (set_integer_16_field_at_name)
		ensure
			instance_free: class
			set_integer_16_field_at_feature_name_not_void: Result /= Void
		end

	set_integer_32_field_feature_name: ET_FEATURE_NAME
			-- 'set_integer_32_field' feature name
		once
			create {ET_IDENTIFIER} Result.make (set_integer_32_field_name)
		ensure
			instance_free: class
			set_integer_32_field_feature_name_not_void: Result /= Void
		end

	set_integer_32_field_at_feature_name: ET_FEATURE_NAME
			-- 'set_integer_32_field_at' feature name
		once
			create {ET_IDENTIFIER} Result.make (set_integer_32_field_at_name)
		ensure
			instance_free: class
			set_integer_32_field_at_feature_name_not_void: Result /= Void
		end

	set_integer_64_field_feature_name: ET_FEATURE_NAME
			-- 'set_integer_64_field' feature name
		once
			create {ET_IDENTIFIER} Result.make (set_integer_64_field_name)
		ensure
			instance_free: class
			set_integer_64_field_feature_name_not_void: Result /= Void
		end

	set_integer_64_field_at_feature_name: ET_FEATURE_NAME
			-- 'set_integer_64_field_at' feature name
		once
			create {ET_IDENTIFIER} Result.make (set_integer_64_field_at_name)
		ensure
			instance_free: class
			set_integer_64_field_at_feature_name_not_void: Result /= Void
		end

	set_is_ignored_feature_name: ET_FEATURE_NAME
			-- 'set_is_ignored' feature name
		once
			create {ET_IDENTIFIER} Result.make (set_is_ignored_name)
		ensure
			instance_free: class
			set_is_ignored_feature_name_not_void: Result /= Void
		end

	set_item_feature_name: ET_FEATURE_NAME
			-- 'set_item' feature name
		once
			create {ET_IDENTIFIER} Result.make (set_item_name)
		ensure
			instance_free: class
			set_item_feature_name_not_void: Result /= Void
		end

	set_natural_8_field_feature_name: ET_FEATURE_NAME
			-- 'set_natural_8_field' feature name
		once
			create {ET_IDENTIFIER} Result.make (set_natural_8_field_name)
		ensure
			instance_free: class
			set_natural_8_field_feature_name_not_void: Result /= Void
		end

	set_natural_8_field_at_feature_name: ET_FEATURE_NAME
			-- 'set_natural_8_field_at' feature name
		once
			create {ET_IDENTIFIER} Result.make (set_natural_8_field_at_name)
		ensure
			instance_free: class
			set_natural_8_field_at_feature_name_not_void: Result /= Void
		end

	set_natural_16_field_feature_name: ET_FEATURE_NAME
			-- 'set_natural_16_field' feature name
		once
			create {ET_IDENTIFIER} Result.make (set_natural_16_field_name)
		ensure
			instance_free: class
			set_natural_16_field_feature_name_not_void: Result /= Void
		end

	set_natural_16_field_at_feature_name: ET_FEATURE_NAME
			-- 'set_natural_16_field_at' feature name
		once
			create {ET_IDENTIFIER} Result.make (set_natural_16_field_at_name)
		ensure
			instance_free: class
			set_natural_16_field_at_feature_name_not_void: Result /= Void
		end

	set_natural_32_field_feature_name: ET_FEATURE_NAME
			-- 'set_natural_32_field' feature name
		once
			create {ET_IDENTIFIER} Result.make (set_natural_32_field_name)
		ensure
			instance_free: class
			set_natural_32_field_feature_name_not_void: Result /= Void
		end

	set_natural_32_field_at_feature_name: ET_FEATURE_NAME
			-- 'set_natural_32_field_at' feature name
		once
			create {ET_IDENTIFIER} Result.make (set_natural_32_field_at_name)
		ensure
			instance_free: class
			set_natural_32_field_at_feature_name_not_void: Result /= Void
		end

	set_natural_64_field_feature_name: ET_FEATURE_NAME
			-- 'set_natural_64_field' feature name
		once
			create {ET_IDENTIFIER} Result.make (set_natural_64_field_name)
		ensure
			instance_free: class
			set_natural_64_field_feature_name_not_void: Result /= Void
		end

	set_natural_64_field_at_feature_name: ET_FEATURE_NAME
			-- 'set_natural_64_field_at' feature name
		once
			create {ET_IDENTIFIER} Result.make (set_natural_64_field_at_name)
		ensure
			instance_free: class
			set_natural_64_field_at_feature_name_not_void: Result /= Void
		end

	set_object_comparison_feature_name: ET_FEATURE_NAME
			-- 'set_object_comparison' feature name
		once
			create {ET_IDENTIFIER} Result.make (set_object_comparison_name)
		ensure
			instance_free: class
			set_object_comparison_feature_name_not_void: Result /= Void
		end

	set_operands_feature_name: ET_FEATURE_NAME
			-- 'set_operands' feature name
		once
			create {ET_IDENTIFIER} Result.make (set_operands_name)
		ensure
			instance_free: class
			set_operands_feature_name_not_void: Result /= Void
		end

	set_pointer_field_feature_name: ET_FEATURE_NAME
			-- 'set_pointer_field' feature name
		once
			create {ET_IDENTIFIER} Result.make (set_pointer_field_name)
		ensure
			instance_free: class
			set_pointer_field_feature_name_not_void: Result /= Void
		end

	set_pointer_field_at_feature_name: ET_FEATURE_NAME
			-- 'set_pointer_field_at' feature name
		once
			create {ET_IDENTIFIER} Result.make (set_pointer_field_at_name)
		ensure
			instance_free: class
			set_pointer_field_at_feature_name_not_void: Result /= Void
		end

	set_pre_ecma_mapping_feature_name: ET_FEATURE_NAME
			-- 'set_pre_ecma_mapping' feature name
		once
			create {ET_IDENTIFIER} Result.make (set_pre_ecma_mapping_name)
		ensure
			instance_free: class
			set_pre_ecma_mapping_feature_name_not_void: Result /= Void
		end

	set_real_32_field_feature_name: ET_FEATURE_NAME
			-- 'set_real_32_field' feature name
		once
			create {ET_IDENTIFIER} Result.make (set_real_32_field_name)
		ensure
			instance_free: class
			set_real_32_field_feature_name_not_void: Result /= Void
		end

	set_real_32_field_at_feature_name: ET_FEATURE_NAME
			-- 'set_real_32_field_at' feature name
		once
			create {ET_IDENTIFIER} Result.make (set_real_32_field_at_name)
		ensure
			instance_free: class
			set_real_32_field_at_feature_name_not_void: Result /= Void
		end

	set_real_64_field_feature_name: ET_FEATURE_NAME
			-- 'set_real_64_field' feature name
		once
			create {ET_IDENTIFIER} Result.make (set_real_64_field_name)
		ensure
			instance_free: class
			set_real_64_field_feature_name_not_void: Result /= Void
		end

	set_real_64_field_at_feature_name: ET_FEATURE_NAME
			-- 'set_real_64_field_at' feature name
		once
			create {ET_IDENTIFIER} Result.make (set_real_64_field_at_name)
		ensure
			instance_free: class
			set_real_64_field_at_feature_name_not_void: Result /= Void
		end

	set_reference_field_feature_name: ET_FEATURE_NAME
			-- 'set_reference_field' feature name
		once
			create {ET_IDENTIFIER} Result.make (set_reference_field_name)
		ensure
			instance_free: class
			set_reference_field_feature_name_not_void: Result /= Void
		end

	set_reference_field_at_feature_name: ET_FEATURE_NAME
			-- 'set_reference_field_at' feature name
		once
			create {ET_IDENTIFIER} Result.make (set_reference_field_at_name)
		ensure
			instance_free: class
			set_reference_field_at_feature_name_not_void: Result /= Void
		end

	set_rout_disp_final_feature_name: ET_FEATURE_NAME
			-- 'set_rout_disp_final' feature name
		once
			create {ET_IDENTIFIER} Result.make (set_rout_disp_final_name)
		ensure
			instance_free: class
			set_rout_disp_final_feature_name_not_void: Result /= Void
		end

	standard_copy_feature_name: ET_FEATURE_NAME
			-- 'standard_copy' feature name
		once
			create {ET_IDENTIFIER} Result.make (standard_copy_name)
		ensure
			instance_free: class
			standard_copy_feature_name_not_void: Result /= Void
		end

	standard_is_equal_feature_name: ET_FEATURE_NAME
			-- 'standard_is_equal' feature name
		once
			create {ET_IDENTIFIER} Result.make (standard_is_equal_name)
		ensure
			instance_free: class
			standard_is_equal_feature_name_not_void: Result /= Void
		end

	standard_twin_feature_name: ET_FEATURE_NAME
			-- 'standard_twin' feature name
		once
			create {ET_IDENTIFIER} Result.make (standard_twin_name)
		ensure
			instance_free: class
			standard_twin_feature_name_not_void: Result /= Void
		end

	storable_version_of_type_feature_name: ET_FEATURE_NAME
			-- 'storable_version_of_type' feature name
		once
			create {ET_IDENTIFIER} Result.make (storable_version_of_type_name)
		ensure
			instance_free: class
			storable_version_of_type_feature_name_not_void: Result /= Void
		end

	tagged_out_feature_name: ET_FEATURE_NAME
			-- 'tagged_out' feature name
		once
			create {ET_IDENTIFIER} Result.make (tagged_out_name)
		ensure
			instance_free: class
			tagged_out_feature_name_not_void: Result /= Void
		end

	to_character_feature_name: ET_FEATURE_NAME
			-- 'to_character' feature name
		once
			create {ET_IDENTIFIER} Result.make (to_character_name)
		ensure
			instance_free: class
			to_character_feature_name_not_void: Result /= Void
		end

	to_character_8_feature_name: ET_FEATURE_NAME
			-- 'to_character_8' feature name
		once
			create {ET_IDENTIFIER} Result.make (to_character_8_name)
		ensure
			instance_free: class
			to_character_8_feature_name_not_void: Result /= Void
		end

	to_character_32_feature_name: ET_FEATURE_NAME
			-- 'to_character_32' feature name
		once
			create {ET_IDENTIFIER} Result.make (to_character_32_name)
		ensure
			instance_free: class
			to_character_32_feature_name_not_void: Result /= Void
		end

	to_double_feature_name: ET_FEATURE_NAME
			-- 'to_double' feature name
		once
			create {ET_IDENTIFIER} Result.make (to_double_name)
		ensure
			instance_free: class
			to_double_feature_name_not_void: Result /= Void
		end

	to_integer_32_feature_name: ET_FEATURE_NAME
			-- 'to_integer_32' feature name
		once
			create {ET_IDENTIFIER} Result.make (to_integer_32_name)
		ensure
			instance_free: class
			to_integer_32_feature_name_not_void: Result /= Void
		end

	to_real_feature_name: ET_FEATURE_NAME
			-- 'to_real' feature name
		once
			create {ET_IDENTIFIER} Result.make (to_real_name)
		ensure
			instance_free: class
			to_real_feature_name_not_void: Result /= Void
		end

	to_pointer_feature_name: ET_FEATURE_NAME
			-- 'to_pointer' feature name
		once
			create {ET_IDENTIFIER} Result.make (to_pointer_name)
		ensure
			instance_free: class
			to_pointer_feature_name_not_void: Result /= Void
		end

	to_real_32_feature_name: ET_FEATURE_NAME
			-- 'to_real_32' feature name
		once
			create {ET_IDENTIFIER} Result.make (to_real_32_name)
		ensure
			instance_free: class
			to_real_32_feature_name_not_void: Result /= Void
		end

	to_real_64_feature_name: ET_FEATURE_NAME
			-- 'to_real_64' feature name
		once
			create {ET_IDENTIFIER} Result.make (to_real_64_name)
		ensure
			instance_free: class
			to_real_64_feature_name_not_void: Result /= Void
		end

	truncated_to_integer_feature_name: ET_FEATURE_NAME
			-- 'truncated_to_integer' feature name
		once
			create {ET_IDENTIFIER} Result.make (truncated_to_integer_name)
		ensure
			instance_free: class
			truncated_to_integer_feature_name_not_void: Result /= Void
		end

	truncated_to_integer_64_feature_name: ET_FEATURE_NAME
			-- 'truncated_to_integer_64' feature name
		once
			create {ET_IDENTIFIER} Result.make (truncated_to_integer_64_name)
		ensure
			instance_free: class
			truncated_to_integer_64_feature_name_not_void: Result /= Void
		end

	truncated_to_real_feature_name: ET_FEATURE_NAME
			-- 'truncated_to_real' feature name
		once
			create {ET_IDENTIFIER} Result.make (truncated_to_real_name)
		ensure
			instance_free: class
			truncated_to_real_feature_name_not_void: Result /= Void
		end

	twin_feature_name: ET_FEATURE_NAME
			-- 'twin' feature name
		once
			create {ET_IDENTIFIER} Result.make (twin_name)
		ensure
			instance_free: class
			twin_feature_name_not_void: Result /= Void
		end

	type_conforms_to_feature_name: ET_FEATURE_NAME
			-- 'type_conforms_to' feature name
		once
			create {ET_IDENTIFIER} Result.make (type_conforms_to_name)
		ensure
			instance_free: class
			type_conforms_to_feature_name_not_void: Result /= Void
		end

	type_id_feature_name: ET_FEATURE_NAME
			-- 'type_id' feature name
		once
			create {ET_IDENTIFIER} Result.make (type_id_name)
		ensure
			instance_free: class
			type_id_feature_name_not_void: Result /= Void
		end

	type_id_from_name_feature_name: ET_FEATURE_NAME
			-- 'type_id_from_name' feature name
		once
			create {ET_IDENTIFIER} Result.make (type_id_from_name_name)
		ensure
			instance_free: class
			type_id_from_name_feature_name_not_void: Result /= Void
		end

	type_of_code_feature_name: ET_FEATURE_NAME
			-- 'type_of_code' feature name
		once
			create {ET_IDENTIFIER} Result.make (type_of_code_name)
		ensure
			instance_free: class
			type_of_code_feature_name_not_void: Result /= Void
		end

	type_of_type_feature_name: ET_FEATURE_NAME
			-- 'type_of_type' feature name
		once
			create {ET_IDENTIFIER} Result.make (type_of_type_name)
		ensure
			instance_free: class
			type_of_type_feature_name_not_void: Result /= Void
		end

	unlock_marking_feature_name: ET_FEATURE_NAME
			-- 'unlock_marking' feature name
		once
			create {ET_IDENTIFIER} Result.make (unlock_marking_name)
		ensure
			instance_free: class
			unlock_marking_feature_name_not_void: Result /= Void
		end

	unmark_object_feature_name: ET_FEATURE_NAME
			-- 'unmark_object' feature name
		once
			create {ET_IDENTIFIER} Result.make (unmark_object_name)
		ensure
			instance_free: class
			unmark_object_feature_name_not_void: Result /= Void
		end

	upper_feature_name: ET_FEATURE_NAME
			-- 'upper' feature name
		once
			create {ET_IDENTIFIER} Result.make (upper_name)
		ensure
			instance_free: class
			upper_feature_name_not_void: Result /= Void
		end

	void_feature_name: ET_FEATURE_NAME
			-- 'Void' feature name
		once
			create {ET_IDENTIFIER} Result.make (capitalized_void_keyword_name)
		ensure
			instance_free: class
			void_feature_name_not_void: Result /= Void
		end

	wide_character_bytes_feature_name: ET_FEATURE_NAME
			-- 'wide_charafter_bytes' feature name
		once
			create {ET_IDENTIFIER} Result.make (wide_character_bytes_name)
		ensure
			instance_free: class
			wide_character_bytes_feature_name_not_void: Result /= Void
		end

feature -- Types

	like_current: ET_LIKE_CURRENT
			-- Type '[attached] like Current',
			-- where '[attached]' is an implicit type mark
		once
			create Result.make (implicit_attached_type_mark)
		ensure
			instance_free: class
			like_current_not_void: Result /= Void
		end

	attached_like_current: ET_LIKE_CURRENT
			-- Type 'attached like Current'
		once
			create Result.make (attached_keyword)
		ensure
			instance_free: class
			attached_like_current_not_void: Result /= Void
		end

	detachable_like_current: ET_LIKE_CURRENT
			-- Type 'detachable like Current'
		once
			create Result.make (detachable_keyword)
		ensure
			instance_free: class
			detachable_like_current_not_void: Result /= Void
		end

	identity_type: ET_LIKE_CURRENT
			-- Type 'like Current' with no type mark modifier
		once
			create Result.make (Void)
		ensure
			instance_free: class
			identity_type_not_void: Result /= Void
		end

	like_0: ET_LIKE_N
			-- Type 'like 0' with no type mark modifier
		once
			create Result.make_zero (Void)
		ensure
			instance_free: class
			like_0_not_void: Result /= Void
		end

	attached_separate_type_mark: ET_ATTACHMENT_MARK_SEPARATE_KEYWORD
			-- 'attached separate' type mark
		once
			create Result.make (attached_keyword, separate_keyword)
		ensure
			instance_free: class
			attached_separate_type_mark_not_void: Result /= Void
		end

	detachable_separate_type_mark: ET_ATTACHMENT_MARK_SEPARATE_KEYWORD
			-- 'detachable separate' type mark
		once
			create Result.make (detachable_keyword, separate_keyword)
		ensure
			instance_free: class
			detachable_separate_type_mark_not_void: Result /= Void
		end

	implicit_attached_type_mark: ET_IMPLICIT_TYPE_MARK
			-- Implicit 'attached' type mark
		once
			create Result.make
			Result.set_attached_mark (True)
		ensure
			instance_free: class
			implicit_attached_type_mark_not_void: Result /= Void
		end

	implicit_attached_expanded_type_mark: ET_IMPLICIT_TYPE_MARK
			-- Implicit 'attached expanded' type mark
		once
			create Result.make
			Result.set_attached_mark (True)
			Result.set_expanded_mark (True)
		ensure
			instance_free: class
			implicit_attached_expanded_type_mark_not_void: Result /= Void
		end

	implicit_attached_reference_type_mark: ET_IMPLICIT_TYPE_MARK
			-- Implicit 'attached reference' type mark
		once
			create Result.make
			Result.set_attached_mark (True)
			Result.set_reference_mark (True)
		ensure
			instance_free: class
			implicit_attached_reference_type_mark_not_void: Result /= Void
		end

	implicit_attached_separate_type_mark: ET_IMPLICIT_TYPE_MARK
			-- Implicit 'attached separate' type mark
		once
			create Result.make
			Result.set_attached_mark (True)
			Result.set_separate_mark (True)
		ensure
			instance_free: class
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
			instance_free: class
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
			instance_free: class
			implicit_attached_separate_reference_type_mark_not_void: Result /= Void
		end

	implicit_detachable_type_mark: ET_IMPLICIT_TYPE_MARK
			-- Implicit 'detachable' type mark
		once
			create Result.make
			Result.set_detachable_mark (True)
		ensure
			instance_free: class
			implicit_detachable_type_mark_not_void: Result /= Void
		end

	implicit_detachable_expanded_type_mark: ET_IMPLICIT_TYPE_MARK
			-- Implicit 'detachable expanded' type mark
		once
			create Result.make
			Result.set_detachable_mark (True)
			Result.set_expanded_mark (True)
		ensure
			instance_free: class
			implicit_detachable_expanded_type_mark_not_void: Result /= Void
		end

	implicit_detachable_reference_type_mark: ET_IMPLICIT_TYPE_MARK
			-- Implicit 'detachable reference' type mark
		once
			create Result.make
			Result.set_detachable_mark (True)
			Result.set_reference_mark (True)
		ensure
			instance_free: class
			implicit_detachable_reference_type_mark_not_void: Result /= Void
		end

	implicit_detachable_separate_type_mark: ET_IMPLICIT_TYPE_MARK
			-- Implicit 'detachable separate' type mark
		once
			create Result.make
			Result.set_detachable_mark (True)
			Result.set_separate_mark (True)
		ensure
			instance_free: class
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
			instance_free: class
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
			instance_free: class
			implicit_detachable_separate_reference_type_mark_not_void: Result /= Void
		end

	implicit_expanded_type_mark: ET_IMPLICIT_TYPE_MARK
			-- Implicit 'expanded' type mark
		once
			create Result.make
			Result.set_expanded_mark (True)
		ensure
			instance_free: class
			implicit_expanded_type_mark_not_void: Result /= Void
		end

	implicit_reference_type_mark: ET_IMPLICIT_TYPE_MARK
			-- Implicit 'reference' type mark
		once
			create Result.make
			Result.set_reference_mark (True)
		ensure
			instance_free: class
			implicit_reference_type_mark_not_void: Result /= Void
		end

	implicit_separate_type_mark: ET_IMPLICIT_TYPE_MARK
			-- Implicit 'separate' type mark
		once
			create Result.make
			Result.set_separate_mark (True)
		ensure
			instance_free: class
			implicit_separate_type_mark_not_void: Result /= Void
		end

	implicit_separate_expanded_type_mark: ET_IMPLICIT_TYPE_MARK
			-- Implicit 'separate expanded' type mark
		once
			create Result.make
			Result.set_separate_mark (True)
			Result.set_expanded_mark (True)
		ensure
			instance_free: class
			implicit_separate_expanded_type_mark_not_void: Result /= Void
		end

	implicit_separate_reference_type_mark: ET_IMPLICIT_TYPE_MARK
			-- Implicit 'separate reference' type mark
		once
			create Result.make
			Result.set_separate_mark (True)
			Result.set_reference_mark (True)
		ensure
			instance_free: class
			implicit_separate_reference_type_mark_not_void: Result /= Void
		end

	implicit_no_type_mark: ET_IMPLICIT_TYPE_MARK
			-- Implicit no type mark
		once
			create Result.make
		ensure
			instance_free: class
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
			instance_free: class
			implicit_type_mark_not_void: Result /= Void
		end

feature -- Leaf nodes

	null_leaf: ET_AST_NULL_LEAF
			-- Leaf with no characters
		once
			create Result.make
		ensure
			instance_free: class
			leaf_not_void: Result /= Void
			leaf_is_null: Result.is_null
		end

feature -- Symbols

	symbol: ET_SYMBOL
			-- Dummy symbol
		once
			create Result.make_arrow
		ensure
			instance_free: class
			symbol_not_void: Result /= Void
		end

	arrow_symbol: ET_SYMBOL
			-- '->' symbol
		once
			create Result.make_arrow
		ensure
			instance_free: class
			symbol_not_void: Result /= Void
		end

	assign_symbol: ET_SYMBOL
			-- ':=' symbol
		once
			create Result.make_assign
		ensure
			instance_free: class
			symbol_not_void: Result /= Void
		end

	assign_attempt_symbol: ET_SYMBOL
			-- '?=' symbol
		once
			create Result.make_assign_attempt
		ensure
			instance_free: class
			symbol_not_void: Result /= Void
		end

	at_symbol: ET_SYMBOL
			-- '@' symbol
		once
			create Result.make_at
		ensure
			instance_free: class
			symbol_not_void: Result /= Void
		end

	bang_symbol: ET_SYMBOL
			-- '!' symbol
		once
			create Result.make_bang
		ensure
			instance_free: class
			symbol_not_void: Result /= Void
		end

	bar_symbol: ET_SYMBOL
			-- '¦' symbol
		once
			create Result.make_bar
		ensure
			instance_free: class
			symbol_not_void: Result /= Void
		end

	close_repeat_symbol: ET_SYMBOL
			-- '⟲' symbol
		once
			create Result.make_close_repeat
		ensure
			instance_free: class
			symbol_not_void: Result /= Void
		end

	colon_symbol: ET_SYMBOL
			-- ':' symbol
		once
			create Result.make_colon
		ensure
			instance_free: class
			symbol_not_void: Result /= Void
		end

	comma_symbol: ET_SYMBOL
			-- ',' symbol
		once
			create Result.make_comma
		ensure
			instance_free: class
			symbol_not_void: Result /= Void
		end

	dollar_symbol: ET_SYMBOL
			-- '$' symbol
		once
			create Result.make_dollar
		ensure
			instance_free: class
			symbol_not_void: Result /= Void
		end

	dot_symbol: ET_SYMBOL
			-- '.' symbol
		once
			create Result.make_dot
		ensure
			instance_free: class
			symbol_not_void: Result /= Void
		end

	dotdot_symbol: ET_SYMBOL
			-- '..' symbol
		once
			create Result.make_dotdot
		ensure
			instance_free: class
			symbol_not_void: Result /= Void
		end

	equal_symbol: ET_SYMBOL
			-- '=' symbol
		once
			create Result.make_equal
		ensure
			instance_free: class
			symbol_not_void: Result /= Void
		end

	for_all_symbol: ET_SYMBOL
			-- '∀' symbol
		once
			create Result.make_for_all
		ensure
			instance_free: class
			symbol_not_void: Result /= Void
		end

	greater_than_symbol: ET_SYMBOL_OPERATOR
			-- '>' symbol
		once
			create Result.make_gt
		ensure
			instance_free: class
			symbol_not_void: Result /= Void
		end

	left_array_symbol: ET_SYMBOL
			-- '<<' symbol
		once
			create Result.make_left_array
		ensure
			instance_free: class
			symbol_not_void: Result /= Void
		end

	left_brace_symbol: ET_SYMBOL
			-- '{' symbol
		once
			create Result.make_left_brace
		ensure
			instance_free: class
			symbol_not_void: Result /= Void
		end

	left_bracket_symbol: ET_BRACKET_SYMBOL
			-- '[' symbol
		once
			create Result.make
		ensure
			instance_free: class
			symbol_not_void: Result /= Void
		end

	left_parenthesis_symbol: ET_SYMBOL
			-- '(' symbol
		once
			create Result.make_left_parenthesis
		ensure
			instance_free: class
			symbol_not_void: Result /= Void
		end

	less_than_symbol: ET_SYMBOL_OPERATOR
			-- '<' symbol
		once
			create Result.make_lt
		ensure
			instance_free: class
			symbol_not_void: Result /= Void
		end

	open_repeat_symbol: ET_SYMBOL
			-- '⟳' symbol
		once
			create Result.make_open_repeat
		ensure
			instance_free: class
			symbol_not_void: Result /= Void
		end

	question_mark_symbol: ET_QUESTION_MARK_SYMBOL
			-- '?' symbol
		once
			create Result.make
		ensure
			instance_free: class
			symbol_not_void: Result /= Void
		end

	right_array_symbol: ET_SYMBOL
			-- '>>' symbol
		once
			create Result.make_right_array
		ensure
			instance_free: class
			symbol_not_void: Result /= Void
		end

	right_brace_symbol: ET_SYMBOL
			-- '}' symbol
		once
			create Result.make_right_brace
		ensure
			instance_free: class
			symbol_not_void: Result /= Void
		end

	right_bracket_symbol: ET_SYMBOL
			-- ']' symbol
		once
			create Result.make_right_bracket
		ensure
			instance_free: class
			symbol_not_void: Result /= Void
		end

	right_parenthesis_symbol: ET_SYMBOL
			-- ')' symbol
		once
			create Result.make_right_parenthesis
		ensure
			instance_free: class
			symbol_not_void: Result /= Void
		end

	semicolon_symbol: ET_SEMICOLON_SYMBOL
			-- ';' symbol
		once
			create Result.make
		ensure
			instance_free: class
			symbol_not_void: Result /= Void
		end

	there_exists_symbol: ET_SYMBOL
			-- '∃' symbol
		once
			create Result.make_there_exists
		ensure
			instance_free: class
			symbol_not_void: Result /= Void
		end

	tilde_symbol: ET_SYMBOL
			-- '~' symbol
		once
			create Result.make_tilde
		ensure
			instance_free: class
			symbol_not_void: Result /= Void
		end

feature -- Keywords

	keyword: ET_KEYWORD
			-- Dummy keyword
		once
			Result := strip_keyword
		ensure
			instance_free: class
			keyword_not_void: Result /= Void
		end

	across_keyword: ET_KEYWORD
			-- 'across' keyword
		once
			create Result.make_across
		ensure
			instance_free: class
			keyword_not_void: Result /= Void
		end

	agent_keyword: ET_AGENT_KEYWORD
			-- 'agent' keyword
		once
			create Result.make
		ensure
			instance_free: class
			keyword_not_void: Result /= Void
		end

	and_keyword: ET_KEYWORD_OPERATOR
			-- 'and' keyword
		once
			create Result.make_and
		ensure
			instance_free: class
			keyword_not_void: Result /= Void
		end

	alias_keyword: ET_KEYWORD
			-- 'alias' keyword
		once
			create Result.make_alias
		ensure
			instance_free: class
			keyword_not_void: Result /= Void
		end

	all_keyword: ET_KEYWORD
			-- 'all' keyword
		once
			create Result.make_all
		ensure
			instance_free: class
			keyword_not_void: Result /= Void
		end

	as_keyword: ET_KEYWORD
			-- 'as' keyword
		once
			create Result.make_as
		ensure
			instance_free: class
			keyword_not_void: Result /= Void
		end

	assign_keyword: ET_KEYWORD
			-- 'assign' keyword
		once
			create Result.make_assign
		ensure
			instance_free: class
			keyword_not_void: Result /= Void
		end

	attached_keyword: ET_KEYWORD
			-- 'attached' keyword
		once
			create Result.make_attached
		ensure
			instance_free: class
			keyword_not_void: Result /= Void
		end

	attribute_keyword: ET_KEYWORD
			-- 'attribute' keyword
		once
			create Result.make_attribute
		ensure
			instance_free: class
			keyword_not_void: Result /= Void
		end

	check_keyword: ET_KEYWORD
			-- 'check' keyword
		once
			create Result.make_check
		ensure
			instance_free: class
			keyword_not_void: Result /= Void
		end

	class_keyword: ET_KEYWORD
			-- 'class' keyword
		once
			create Result.make_class
		ensure
			instance_free: class
			keyword_not_void: Result /= Void
		end

	convert_keyword: ET_KEYWORD
			-- 'convert' keyword
		once
			create Result.make_convert
		ensure
			instance_free: class
			keyword_not_void: Result /= Void
		end

	create_keyword: ET_KEYWORD
			-- 'create' keyword
		once
			create Result.make_create
		ensure
			instance_free: class
			keyword_not_void: Result /= Void
		end

	creation_keyword: ET_KEYWORD
			-- 'creation' keyword
		once
			create Result.make_creation
		ensure
			instance_free: class
			keyword_not_void: Result /= Void
		end

	current_keyword: ET_CURRENT
			-- 'Current' keyword
		once
			create Result.make
		ensure
			instance_free: class
			keyword_not_void: Result /= Void
		end

	debug_keyword: ET_KEYWORD
			-- 'debug' keyword
		once
			create Result.make_debug
		ensure
			instance_free: class
			keyword_not_void: Result /= Void
		end

	deferred_keyword: ET_KEYWORD
			-- 'deferred' keyword
		once
			create Result.make_deferred
		ensure
			instance_free: class
			keyword_not_void: Result /= Void
		end

	detachable_keyword: ET_KEYWORD
			-- 'detachable' keyword
		once
			create Result.make_detachable
		ensure
			instance_free: class
			keyword_not_void: Result /= Void
		end

	do_keyword: ET_KEYWORD
			-- 'do' keyword
		once
			create Result.make_do
		ensure
			instance_free: class
			keyword_not_void: Result /= Void
		end

	else_keyword: ET_KEYWORD
			-- 'else' keyword
		once
			create Result.make_else
		ensure
			instance_free: class
			keyword_not_void: Result /= Void
		end

	elseif_keyword: ET_KEYWORD
			-- 'elseif' keyword
		once
			create Result.make_elseif
		ensure
			instance_free: class
			keyword_not_void: Result /= Void
		end

	end_keyword: ET_KEYWORD
			-- 'end' keyword
		once
			create Result.make_end
		ensure
			instance_free: class
			keyword_not_void: Result /= Void
		end

	ensure_keyword: ET_KEYWORD
			-- 'ensure' keyword
		once
			create Result.make_ensure
		ensure
			instance_free: class
			keyword_not_void: Result /= Void
		end

	expanded_keyword: ET_KEYWORD
			-- 'expanded' keyword
		once
			create Result.make_expanded
		ensure
			instance_free: class
			keyword_not_void: Result /= Void
		end

	export_keyword: ET_KEYWORD
			-- 'export' keyword
		once
			create Result.make_export
		ensure
			instance_free: class
			keyword_not_void: Result /= Void
		end

	external_keyword: ET_KEYWORD
			-- 'external' keyword
		once
			create Result.make_external
		ensure
			instance_free: class
			keyword_not_void: Result /= Void
		end

	false_keyword: ET_FALSE_CONSTANT
			-- 'False' keyword
		once
			create Result.make
		ensure
			instance_free: class
			keyword_not_void: Result /= Void
		end

	feature_keyword: ET_KEYWORD
			-- 'feature' keyword
		once
			create Result.make_feature
		ensure
			instance_free: class
			keyword_not_void: Result /= Void
		end

	from_keyword: ET_KEYWORD
			-- 'from' keyword
		once
			create Result.make_from
		ensure
			instance_free: class
			keyword_not_void: Result /= Void
		end

	frozen_keyword: ET_KEYWORD
			-- 'frozen' keyword
		once
			create Result.make_frozen
		ensure
			instance_free: class
			keyword_not_void: Result /= Void
		end

	if_keyword: ET_KEYWORD
			-- 'if' keyword
		once
			create Result.make_if
		ensure
			instance_free: class
			keyword_not_void: Result /= Void
		end

	indexing_keyword: ET_KEYWORD
			-- 'indexing' keyword
		once
			create Result.make_indexing
		ensure
			instance_free: class
			keyword_not_void: Result /= Void
		end

	inherit_keyword: ET_KEYWORD
			-- 'inherit' keyword
		once
			create Result.make_inherit
		ensure
			instance_free: class
			keyword_not_void: Result /= Void
		end

	inspect_keyword: ET_KEYWORD
			-- 'inspect' keyword
		once
			create Result.make_inspect
		ensure
			instance_free: class
			keyword_not_void: Result /= Void
		end

	invariant_keyword: ET_KEYWORD
			-- 'invariant' keyword
		once
			create Result.make_invariant
		ensure
			instance_free: class
			keyword_not_void: Result /= Void
		end

	is_keyword: ET_KEYWORD
			-- 'is' keyword
		once
			create Result.make_is
		ensure
			instance_free: class
			keyword_not_void: Result /= Void
		end

	like_keyword: ET_KEYWORD
			-- 'like' keyword
		once
			create Result.make_like
		ensure
			instance_free: class
			keyword_not_void: Result /= Void
		end

	local_keyword: ET_KEYWORD
			-- 'local' keyword
		once
			create Result.make_local
		ensure
			instance_free: class
			keyword_not_void: Result /= Void
		end

	loop_keyword: ET_KEYWORD
			-- 'loop' keyword
		once
			create Result.make_loop
		ensure
			instance_free: class
			keyword_not_void: Result /= Void
		end

	note_keyword: ET_KEYWORD
			-- 'note' keyword
		once
			create Result.make_note
		ensure
			instance_free: class
			keyword_not_void: Result /= Void
		end

	obsolete_keyword: ET_KEYWORD
			-- 'obsolete' keyword
		once
			create Result.make_obsolete
		ensure
			instance_free: class
			keyword_not_void: Result /= Void
		end

	old_keyword: ET_KEYWORD
			-- 'old' keyword
		once
			create Result.make_old
		ensure
			instance_free: class
			keyword_not_void: Result /= Void
		end

	once_keyword: ET_KEYWORD
			-- 'once' keyword
		once
			create Result.make_once
		ensure
			instance_free: class
			keyword_not_void: Result /= Void
		end

	or_keyword: ET_KEYWORD_OPERATOR
			-- 'or' keyword
		once
			create Result.make_or
		ensure
			instance_free: class
			keyword_not_void: Result /= Void
		end

	precursor_keyword: ET_PRECURSOR_KEYWORD
			-- 'precursor' keyword
		once
			create Result.make
		ensure
			instance_free: class
			keyword_not_void: Result /= Void
		end

	redefine_keyword: ET_KEYWORD
			-- 'redefine' keyword
		once
			create Result.make_redefine
		ensure
			instance_free: class
			keyword_not_void: Result /= Void
		end

	reference_keyword: ET_KEYWORD
			-- 'reference' keyword
		once
			create Result.make_reference
		ensure
			instance_free: class
			keyword_not_void: Result /= Void
		end

	rename_keyword: ET_KEYWORD
			-- 'rename' keyword
		once
			create Result.make_rename
		ensure
			instance_free: class
			keyword_not_void: Result /= Void
		end

	require_keyword: ET_KEYWORD
			-- 'require' keyword
		once
			create Result.make_require
		ensure
			instance_free: class
			keyword_not_void: Result /= Void
		end

	rescue_keyword: ET_KEYWORD
			-- 'rescue' keyword
		once
			create Result.make_rescue
		ensure
			instance_free: class
			keyword_not_void: Result /= Void
		end

	result_keyword: ET_RESULT
			-- 'Result' keyword
		once
			create Result.make
		ensure
			instance_free: class
			keyword_not_void: Result /= Void
		end

	retry_keyword: ET_RETRY_INSTRUCTION
			-- 'retry' keyword
		once
			create Result.make
		ensure
			instance_free: class
			keyword_not_void: Result /= Void
		end

	select_keyword: ET_KEYWORD
			-- 'select' keyword
		once
			create Result.make_select
		ensure
			instance_free: class
			keyword_not_void: Result /= Void
		end

	separate_keyword: ET_KEYWORD
			-- 'separate' keyword
		once
			create Result.make_separate
		ensure
			instance_free: class
			keyword_not_void: Result /= Void
		end

	some_keyword: ET_KEYWORD
			-- 'some' keyword
		once
			create Result.make_some
		ensure
			instance_free: class
			keyword_not_void: Result /= Void
		end

	strip_keyword: ET_KEYWORD
			-- 'strip' keyword
		once
			create Result.make_strip
		ensure
			instance_free: class
			keyword_not_void: Result /= Void
		end

	then_keyword: ET_KEYWORD
			-- 'then' keyword
		once
			create Result.make_then
		ensure
			instance_free: class
			keyword_not_void: Result /= Void
		end

	true_keyword: ET_TRUE_CONSTANT
			-- 'True' keyword
		once
			create Result.make
		ensure
			instance_free: class
			keyword_not_void: Result /= Void
		end

	tuple_keyword: ET_IDENTIFIER
			-- 'TUPLE' keyword
		once
			create Result.make (capitalized_tuple_name)
		ensure
			instance_free: class
			keyword_not_void: Result /= Void
		end

	undefine_keyword: ET_KEYWORD
			-- 'undefine' keyword
		once
			create Result.make_undefine
		ensure
			instance_free: class
			keyword_not_void: Result /= Void
		end

	unique_keyword: ET_KEYWORD
			-- 'unique' keyword
		once
			create Result.make_unique
		ensure
			instance_free: class
			keyword_not_void: Result /= Void
		end

	until_keyword: ET_KEYWORD
			-- 'until' keyword
		once
			create Result.make_until
		ensure
			instance_free: class
			keyword_not_void: Result /= Void
		end

	variant_keyword: ET_KEYWORD
			-- 'variant' keyword
		once
			create Result.make_variant
		ensure
			instance_free: class
			keyword_not_void: Result /= Void
		end

	void_keyword: ET_VOID
			-- 'Void' keyword
		once
			create Result.make
		ensure
			instance_free: class
			keyword_not_void: Result /= Void
		end

	when_keyword: ET_KEYWORD
			-- 'when' keyword
		once
			create Result.make_when
		ensure
			instance_free: class
			keyword_not_void: Result /= Void
		end

feature -- Keyword and symbol names

	capitalized_any_name: STRING = "ANY"
	capitalized_arguments_32_name: STRING = "ARGUMENTS_32"
	capitalized_array_name: STRING = "ARRAY"
	capitalized_boolean_name: STRING = "BOOLEAN"
	capitalized_character_name: STRING = "CHARACTER"
	capitalized_character_8_name: STRING = "CHARACTER_8"
	capitalized_character_32_name: STRING = "CHARACTER_32"
	capitalized_com_failure_name: STRING = "COM_FAILURE"
	capitalized_disposable_name: STRING = "DISPOSABLE"
	capitalized_double_name: STRING = "DOUBLE"
	capitalized_exception_name: STRING = "EXCEPTION"
	capitalized_exception_manager_name: STRING = "EXCEPTION_MANAGER"
	capitalized_exception_manager_factory_name: STRING = "EXCEPTION_MANAGER_FACTORY"
	capitalized_function_name: STRING = "FUNCTION"
	capitalized_identified_routines_name: STRING = "IDENTIFIED_ROUTINES"
	capitalized_immutable_string_8_name: STRING = "IMMUTABLE_STRING_8"
	capitalized_immutable_string_32_name: STRING = "IMMUTABLE_STRING_32"
	capitalized_integer_name: STRING = "INTEGER"
	capitalized_integer_8_name: STRING = "INTEGER_8"
	capitalized_integer_16_name: STRING = "INTEGER_16"
	capitalized_integer_32_name: STRING = "INTEGER_32"
	capitalized_integer_64_name: STRING = "INTEGER_64"
	capitalized_internal_name: STRING = "INTERNAL"
	capitalized_ise_exception_manager_name: STRING = "ISE_EXCEPTION_MANAGER"
	capitalized_ise_runtime_name: STRING = "ISE_RUNTIME"
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

	attached_type_name: STRING = "attached_type"
			-- Name of Eiffel feature 'attached_type'

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

	boolean_field_at_name: STRING = "boolean_field_at"
			-- Name of Eiffel feature 'boolean_field_at'

	boolean_item_name: STRING = "boolean_item"
			-- Name of Eiffel feature 'boolean_item'

	c_strlen_name: STRING = "c_strlen"
			-- Name of Eiffel feature 'c_strlen'

	call_name: STRING = "call"
			-- Name of Eiffel feature 'call'

	capacity_name: STRING = "capacity"
			-- Name of Eiffel feature 'capacity'

	catch_name: STRING = "catch"
			-- Name of Eiffel feature 'catch'

	ccom_hresult_name: STRING = "ccom_hresult"
			-- Name of Eiffel feature 'ccom_hresult'

	ccom_hresult_code_name: STRING = "ccom_hresult_code"
			-- Name of Eiffel feature 'ccom_hresult_code'

	ccom_hresult_facility_name: STRING = "ccom_hresult_facility"
			-- Name of Eiffel feature 'ccom_hresult_facility'

	ceiling_real_32_name: STRING = "ceiling_real_32"
			-- Name of Eiffel feature 'ceiling_real_32'

	ceiling_real_64_name: STRING = "ceiling_real_64"
			-- Name of Eiffel feature 'ceiling_real_64'

	character_8_field_name: STRING = "character_8_field"
			-- Name of Eiffel feature 'character_8_field'

	character_8_field_at_name: STRING = "character_8_field_at"
			-- Name of Eiffel feature 'character_8_field_at'

	character_8_item_name: STRING = "character_8_item"
			-- Name of Eiffel feature 'character_8_item'

	character_32_field_name: STRING = "character_32_field"
			-- Name of Eiffel feature 'character_32_field'

	character_32_field_at_name: STRING = "character_32_field_at"
			-- Name of Eiffel feature 'character_32_field_at'

	character_32_item_name: STRING = "character_32_item"
			-- Name of Eiffel feature 'character_32_item'

	character_bytes_name: STRING = "character_bytes"
			-- Name of Eiffel feature 'character_bytes'

	character_size_name: STRING = "character_size"
			-- Name of Eiffel feature 'character_size'

	check_assert_name: STRING = "check_assert"
			-- Name of Eiffel feature 'check_assert'

	closed_operands_name: STRING = "closed_operands"
			-- Name of Eiffel feature 'closed_operands'

	code_name: STRING = "code"
			-- Name of Eiffel feature 'code'

	compiler_version_name: STRING = "compiler_version"
			-- Name of Eiffel feature 'compiler_version'

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

	cwin_error_text_name: STRING = "cwin_error_text"
			-- Name of Eiffel feature 'cwin_error_text'

	cwin_local_free_name: STRING = "cwin_local_free"
			-- Name of Eiffel feature 'cwin_local_free'

	deep_twin_name: STRING = "deep_twin"
			-- Name of Eiffel feature 'deep_twin'

	default_name: STRING = "default"
			-- Name of Eiffel feature 'default'

	default_create_name: STRING = "default_create"
			-- Name of Eiffel feature 'default_create'

	detachable_type_name: STRING = "detachable_type"
			-- Name of Eiffel feature 'detachable_type'

	developer_raise_name: STRING = "developer_raise"
			-- Name of Eiffel feature 'developer_raise'

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

	dynamic_type_name: STRING = "dynamic_type"
			-- Name of Eiffel feature 'dynamic_type'

	dynamic_type_at_offset_name: STRING = "dynamic_type_at_offset"
			-- Name of Eiffel feature 'dynamic_type_at_offset'

	eif_current_object_id_name: STRING = "eif_current_object_id"
			-- Name of Eiffel feature 'eif_current_object_id'

	eif_gen_param_id_name: STRING = "eif_gen_param_id"
			-- Name of Eiffel feature 'eif_gen_param_id'

	eif_id_object_name: STRING = "eif_id_object"
			-- Name of Eiffel feature 'eif_id_object'

	eif_is_object_id_of_current_name: STRING = "eif_is_object_id_of_current"
			-- Name of Eiffel feature 'eif_is_object_id_of_current'

	eif_object_id_name: STRING = "eif_object_id"
			-- Name of Eiffel feature 'eif_object_id'

	eif_object_id_free_name: STRING = "eif_object_id_free"
			-- Name of Eiffel feature 'eif_object_id_free'

	element_size_name: STRING = "element_size"
			-- Name of Eiffel feature 'element_size'

	exception_from_code_name: STRING = "exception_from_code"
			-- Name of Eiffel feature 'exception_from_code'

	exception_manager_name: STRING = "exception_manager"
			-- Name of Eiffel feature 'exception_manager'

	extend_name: STRING = "extend"
			-- Name of Eiffel feature 'extend'

	fast_call_name: STRING = "fast_call"
			-- Name of Eiffel feature 'fast_call'

	fast_item_name: STRING = "fast_item"
			-- Name of Eiffel feature 'fast_item'

	field_name: STRING = "field"
			-- Name of Eiffel feature 'field'

	field_count_name: STRING = "field_count"
			-- Name of Eiffel feature 'field_count'

	field_count_of_type_name: STRING = "field_count_of_type"
			-- Name of Eiffel feature 'field_count_of_type'

	field_name_name: STRING = "field_name"
			-- Name of Eiffel feature 'field_name'

	field_name_of_type_name: STRING = "field_name_of_type"
			-- Name of Eiffel feature 'field_name_of_type'

	field_offset_of_type_name: STRING = "field_offset_of_type"
			-- Name of Eiffel feature 'field_offset_of_type'

	field_static_type_name: STRING = "field_static_type"
			-- Name of Eiffel feature 'field_static_type'

	field_static_type_of_type_name: STRING = "field_static_type_of_type"
			-- Name of Eiffel feature 'field_static_type_of_type'

	field_type_name: STRING = "field_type"
			-- Name of Eiffel feature 'field_type'

	field_type_of_type_name: STRING = "field_type_of_type"
			-- Name of Eiffel feature 'field_type_of_type'

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

	generating_type_of_type_name: STRING = "generating_type_of_type"
			-- Name of Eiffel feature 'generating_type_of_type'

	generating_type_8_of_type_name: STRING = "generating_type_8_of_type"
			-- Name of Eiffel feature 'generating_type_8_of_type'

	generator_name: STRING = "generator"
			-- Name of Eiffel feature 'generator'

	generator_of_type_name: STRING = "generator_of_type"
			-- Name of Eiffel feature 'generator_of_type'

	generator_8_of_type_name: STRING = "generator_8_of_type"
			-- Name of Eiffel feature 'generator_8_of_type'

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

	ieee_is_equal_name: STRING = "ieee_is_equal"
			-- Name of Eiffel feature 'ieee_is_equal'

	ieee_is_greater_name: STRING = "ieee_is_greater"
			-- Name of Eiffel feature 'ieee_is_greater'

	ieee_is_greater_equal_name: STRING = "ieee_is_greater_equal"
			-- Name of Eiffel feature 'ieee_is_greater_equal'

	ieee_is_less_name: STRING = "ieee_is_less"
			-- Name of Eiffel feature 'ieee_is_less'

	ieee_is_less_equal_name: STRING = "ieee_is_less_equal"
			-- Name of Eiffel feature 'ieee_is_less_equal'

	ieee_maximum_number_name: STRING = "ieee_maximum_number"
			-- Name of Eiffel feature 'ieee_maximum_number'

	ieee_minimum_number_name: STRING = "ieee_minimum_number"
			-- Name of Eiffel feature 'ieee_minimum_number'

	ignore_name: STRING = "ignore"
			-- Name of Eiffel feature 'ignore'

	implication_name: STRING = "implication"
			-- Name of Eiffel feature 'implication'

	in_assertion_name: STRING = "in_assertion"
			-- Name of Eiffel feature 'in_assertion'

	init_exception_manager_name: STRING = "init_exception_manager"
			-- Name of Eiffel feature 'init_exception_manager'

	integer_8_field_name: STRING = "integer_8_field"
			-- Name of Eiffel feature 'integer_8_field'

	integer_8_field_at_name: STRING = "integer_8_field_at"
			-- Name of Eiffel feature 'integer_8_field_at'

	integer_8_item_name: STRING = "integer_8_item"
			-- Name of Eiffel feature 'integer_8_item'

	integer_16_field_name: STRING = "integer_16_field"
			-- Name of Eiffel feature 'integer_16_field'

	integer_16_field_at_name: STRING = "integer_16_field_at"
			-- Name of Eiffel feature 'integer_16_field_at'

	integer_16_item_name: STRING = "integer_16_item"
			-- Name of Eiffel feature 'integer_16_item'

	integer_32_field_name: STRING = "integer_32_field"
			-- Name of Eiffel feature 'integer_32_field'

	integer_32_field_at_name: STRING = "integer_32_field_at"
			-- Name of Eiffel feature 'integer_32_field_at'

	integer_32_item_name: STRING = "integer_32_item"
			-- Name of Eiffel feature 'integer_32_item'

	integer_64_field_name: STRING = "integer_64_field"
			-- Name of Eiffel feature 'integer_64_field'

	integer_64_field_at_name: STRING = "integer_64_field_at"
			-- Name of Eiffel feature 'integer_64_field_at'

	integer_64_item_name: STRING = "integer_64_item"
			-- Name of Eiffel feature 'integer_64_item'

	integer_bytes_name: STRING = "integer_bytes"
			-- Name of Eiffel feature 'integer_bytes'

	integer_quotient_name: STRING = "integer_quotient"
			-- Name of Eiffel feature 'integer_quotient'

	integer_remainder_name: STRING = "integer_remainder"
			-- Name of Eiffel feature 'integer_remainder'

	is_64_bits_name: STRING = "is_64_bits"
			-- Name of Eiffel feature 'is_64_bits'

	is_attached_name: STRING = "is_attached"
			-- Name of Eiffel feature 'is_attached'

	is_attached_type_name: STRING = "is_attached_type"
			-- Name of Eiffel feature 'is_attached_type'

	is_caught_name: STRING = "is_caught"
			-- Name of Eiffel feature 'is_caught'

	is_copy_semantics_field_name: STRING = "is_copy_semantics_field"
			-- Name of Eiffel feature 'is_copy_semantics_field'

	is_deep_equal_name: STRING = "is_deep_equal"
			-- Name of Eiffel feature 'is_deep_equal'

	is_default_pointer_name: STRING = "is_default_pointer"
			-- Name of Eiffel feature 'is_default_pointer'

	is_deferred_name: STRING = "is_deferred"
			-- Name of Eiffel feature 'is_deferred'

	is_dotnet_name: STRING = "is_dotnet"
			-- Name of Eiffel feature 'is_dotnet'

	is_equal_name: STRING = "is_equal"
			-- Name of Eiffel feature 'is_equal'

	is_expanded_name: STRING = "is_expanded"
			-- Name of Eiffel feature 'is_expanded'

	is_field_expanded_of_type_name: STRING = "is_field_expanded_of_type"
			-- Name of Eiffel feature 'is_field_expanded_of_type'

	is_field_transient_of_type_name: STRING = "is_field_transient_of_type"
			-- Name of Eiffel feature 'is_field_transient_of_type'

	is_ignorable_name: STRING = "is_ignorable"
			-- Name of Eiffel feature 'is_ignorable'

	is_ignored_name: STRING = "is_ignored"
			-- Name of Eiffel feature 'is_ignored'

	is_less_name: STRING = "is_less"
			-- Name of Eiffel feature 'is_less'

	is_mac_name: STRING = "is_mac"
			-- Name of Eiffel feature 'is_mac'

	is_nan_name: STRING = "is_nan"
			-- Name of Eiffel feature 'is_nan'

	is_negative_infinity_name: STRING = "is_negative_infinity"
			-- Name of Eiffel feature 'is_negative_infinity'

	is_object_marked_name: STRING = "is_object_marked"
			-- Name of Eiffel feature 'is_object_marked'

	is_positive_infinity_name: STRING = "is_positive_infinity"
			-- Name of Eiffel feature 'is_positive_infinity'

	is_raisable_name: STRING = "is_raisable"
			-- Name of Eiffel feature 'is_raisable'

	is_scoop_capable_name: STRING = "is_scoop_capable"
			-- Name of Eiffel feature 'is_scoop_capable'

	is_special_name: STRING = "is_special"
			-- Name of Eiffel feature 'is_special'

	is_special_copy_semantics_item_name: STRING = "is_special_copy_semantics_item"
			-- Name of Eiffel feature 'is_special_copy_semantics_item'

	is_special_of_expanded_name: STRING = "is_special_of_expanded"
			-- Name of Eiffel feature 'is_special_of_expanded'

	is_special_of_reference_name: STRING = "is_special_of_reference"
			-- Name of Eiffel feature 'is_special_of_reference'

	is_special_of_reference_or_basic_type_name: STRING = "is_special_of_reference_or_basic_type"
			-- Name of Eiffel feature 'is_special_of_reference_or_basic_type'

	is_special_of_reference_type_name: STRING = "is_special_of_reference_type"
			-- Name of Eiffel feature 'is_special_of_reference_type'

	is_thread_capable_name: STRING = "is_thread_capable"
			-- Name of Eiffel feature 'is_thread_capable'

	is_tuple_name: STRING = "is_tuple"
			-- Name of Eiffel feature 'is_tuple'

	is_tuple_type_name: STRING = "is_tuple_type"
			-- Name of Eiffel feature 'is_tuple_type'

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

	last_exception_name: STRING = "last_exception"
			-- Name of Eiffel feature 'last_exception'

	last_result_name: STRING = "last_result"
			-- Name of Eiffel feature 'last_result'

	lock_marking_name: STRING = "lock_marking"
			-- Name of Eiffel feature 'lock_marking'

	lower_name: STRING = "lower"
			-- Name of Eiffel feature 'lower'

	make_name: STRING = "make"
			-- Name of Eiffel feature 'make'

	make_empty_name: STRING = "make_empty"
			-- Name of Eiffel feature 'make_empty'

	mark_object_name: STRING = "mark_object"
			-- Name of Eiffel feature 'mark_object'

	max_type_id_name: STRING = "max_type_id"
			-- Name of Eiffel feature 'max_type_id'

	minus_name: STRING = "minus"
			-- Name of Eiffel feature 'minus'

	name_name: STRING = "name"
			-- Name of Eiffel feature 'name'

	nan_name: STRING = "nan"
			-- Name of Eiffel feature 'nan'

	natural_8_field_name: STRING = "natural_8_field"
			-- Name of Eiffel feature 'natural_8_field'

	natural_8_field_at_name: STRING = "natural_8_field_at"
			-- Name of Eiffel feature 'natural_8_field_at'

	natural_8_item_name: STRING = "natural_8_item"
			-- Name of Eiffel feature 'natural_8_item'

	natural_16_field_name: STRING = "natural_16_field"
			-- Name of Eiffel feature 'natural_16_field'

	natural_16_field_at_name: STRING = "natural_16_field_at"
			-- Name of Eiffel feature 'natural_16_field_at'

	natural_16_item_name: STRING = "natural_16_item"
			-- Name of Eiffel feature 'natural_16_item'

	natural_32_code_name: STRING = "natural_32_code"
			-- Name of Eiffel feature 'natural_32_code'

	natural_32_field_name: STRING = "natural_32_field"
			-- Name of Eiffel feature 'natural_32_field'

	natural_32_field_at_name: STRING = "natural_32_field_at"
			-- Name of Eiffel feature 'natural_32_field_at'

	natural_32_item_name: STRING = "natural_32_item"
			-- Name of Eiffel feature 'natural_32_item'

	natural_64_field_name: STRING = "natural_64_field"
			-- Name of Eiffel feature 'natural_64_field'

	natural_64_field_at_name: STRING = "natural_64_field_at"
			-- Name of Eiffel feature 'natural_64_field_at'

	natural_64_item_name: STRING = "natural_64_item"
			-- Name of Eiffel feature 'natural_64_item'

	negated_name: STRING = "negated"
			-- Name of Eiffel feature 'negated'

	negative_infinity_name: STRING = "negative_infinity"
			-- Name of Eiffel feature 'negative_infinity'

	new_cursor_name: STRING = "new_cursor"
			-- Name of Eiffel feature 'new_cursor'

	new_instance_name: STRING = "new_instance"
			-- Name of Eiffel feature 'new_instance'

	new_instance_of_name: STRING = "new_instance_of"
			-- Name of Eiffel feature 'new_instance_of'

	new_special_any_instance_name: STRING = "new_special_any_instance"
			-- Name of Eiffel feature 'new_special_any_instance'

	new_special_of_reference_instance_of_name: STRING = "new_special_of_reference_instance_of"
			-- Name of Eiffel feature 'new_special_of_reference_instance_of'

	new_tuple_instance_of_name: STRING = "new_tuple_instance_of"
			-- Name of Eiffel feature 'new_tuple_instance_of'

	new_type_instance_of_name: STRING = "new_type_instance_of"
			-- Name of Eiffel feature 'new_type_instance_of'

	object_comparison_name: STRING = "object_comparison"
			-- Name of Eiffel feature 'object_comparison'

	object_size_name: STRING = "object_size"
			-- Name of Eiffel feature 'object_size'

	once_objects_name: STRING = "once_objects"
			-- Name of Eiffel feature 'once_objects'

	once_raise_name: STRING = "once_raise"
			-- Name of Eiffel feature 'once_raise'

	opposite_name: STRING = "opposite"
			-- Name of Eiffel feature 'opposite'

	out_name: STRING = "out"
			-- Name of Eiffel feature 'out'

	persistent_field_count_of_type_name: STRING = "persistent_field_count_of_type"
			-- Name of Eiffel feature 'persistent_field_count_of_type'

	plus_name: STRING = "plus"
			-- Name of Eiffel feature 'plus'

	pointer_bytes_name: STRING = "pointer_bytes"
			-- Name of Eiffel feature 'pointer_bytes'

	pointer_field_name: STRING = "pointer_field"
			-- Name of Eiffel feature 'pointer_field'

	pointer_field_at_name: STRING = "pointer_field_at"
			-- Name of Eiffel feature 'pointer_field_at'

	pointer_item_name: STRING = "pointer_item"
			-- Name of Eiffel feature 'pointer_item'

	positive_infinity_name: STRING = "positive_infinity"
			-- Name of Eiffel feature 'positive_infinity'

	power_name: STRING = "power"
			-- Name of Eiffel feature 'power'

	pre_ecma_mapping_status_name: STRING = "pre_ecma_mapping_status"
			-- Name of Eiffel feature 'pre_ecma_mapping_status'

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

	raise_name: STRING = "raise"
			-- Name of Eiffel feature 'raise'

	raw_reference_field_at_name: STRING = "raw_reference_field_at"
			-- Name of Eiffel feature 'raw_reference_field_at'

	raw_reference_field_at_offset_name: STRING = "raw_reference_field_at_offset"
			-- Name of Eiffel feature 'raw_reference_field_at_offset'

	real_32_field_name: STRING = "real_32_field"
			-- Name of Eiffel feature 'real_32_field'

	real_32_field_at_name: STRING = "real_32_field_at"
			-- Name of Eiffel feature 'real_32_field_at'

	real_32_item_name: STRING = "real_32_item"
			-- Name of Eiffel feature 'real_32_item'

	real_64_field_name: STRING = "real_64_field"
			-- Name of Eiffel feature 'real_64_field'

	real_64_field_at_name: STRING = "real_64_field_at"
			-- Name of Eiffel feature 'real_64_field_at'

	real_64_item_name: STRING = "real_64_item"
			-- Name of Eiffel feature 'real_64_item'

	real_bytes_name: STRING = "real_bytes"
			-- Name of Eiffel feature 'real_bytes'

	reference_field_name: STRING = "reference_field"
			-- Name of Eiffel feature 'reference_field'

	reference_field_at_name: STRING = "reference_field_at"
			-- Name of Eiffel feature 'reference_field_at'

	reference_field_at_offset_name: STRING = "reference_field_at_offset"
			-- Name of Eiffel feature 'reference_field_at_offset'

	reference_item_name: STRING = "reference_item"
			-- Name of Eiffel feature 'reference_item'

	rout_disp_name: STRING = "rout_disp"
			-- Name of Eiffel feature 'rout_disp'

	runtime_name_name: STRING = "runtime_name"
			-- Name of Eiffel feature 'runtime_name'

	same_type_name: STRING = "same_type"
			-- Name of Eiffel feature 'same_type'

	set_boolean_field_name: STRING = "set_boolean_field"
			-- Name of Eiffel feature 'set_boolean_field'

	set_boolean_field_at_name: STRING = "set_boolean_field_at"
			-- Name of Eiffel feature 'set_boolean_field_at'

	set_character_8_field_name: STRING = "set_character_8_field"
			-- Name of Eiffel feature 'set_character_8_field'

	set_character_8_field_at_name: STRING = "set_character_8_field_at"
			-- Name of Eiffel feature 'set_character_8_field_at'

	set_character_32_field_name: STRING = "set_character_32_field"
			-- Name of Eiffel feature 'set_character_32_field'

	set_character_32_field_at_name: STRING = "set_character_32_field_at"
			-- Name of Eiffel feature 'set_character_32_field_at'

	set_count_name: STRING = "set_count"
			-- Name of Eiffel feature 'set_count'

	set_exception_data_name: STRING = "set_exception_data"
			-- Name of Eiffel feature 'set_exception_data'

	set_integer_8_field_name: STRING = "set_integer_8_field"
			-- Name of Eiffel feature 'set_integer_8_field'

	set_integer_8_field_at_name: STRING = "set_integer_8_field_at"
			-- Name of Eiffel feature 'set_integer_8_field_at'

	set_integer_16_field_name: STRING = "set_integer_16_field"
			-- Name of Eiffel feature 'set_integer_16_field'

	set_integer_16_field_at_name: STRING = "set_integer_16_field_at"
			-- Name of Eiffel feature 'set_integer_16_field_at'

	set_integer_32_field_name: STRING = "set_integer_32_field"
			-- Name of Eiffel feature 'set_integer_32_field'

	set_integer_32_field_at_name: STRING = "set_integer_32_field_at"
			-- Name of Eiffel feature 'set_integer_32_field_at'

	set_integer_64_field_name: STRING = "set_integer_64_field"
			-- Name of Eiffel feature 'set_integer_64_field'

	set_integer_64_field_at_name: STRING = "set_integer_64_field_at"
			-- Name of Eiffel feature 'set_integer_64_field_at'

	set_is_ignored_name: STRING = "set_is_ignored"
			-- Name of Eiffel feature 'set_is_ignored'

	set_item_name: STRING = "set_item"
			-- Name of Eiffel feature 'set_item'

	set_natural_8_field_name: STRING = "set_natural_8_field"
			-- Name of Eiffel feature 'set_natural_8_field'

	set_natural_8_field_at_name: STRING = "set_natural_8_field_at"
			-- Name of Eiffel feature 'set_natural_8_field_at'

	set_natural_16_field_name: STRING = "set_natural_16_field"
			-- Name of Eiffel feature 'set_natural_16_field'

	set_natural_16_field_at_name: STRING = "set_natural_16_field_at"
			-- Name of Eiffel feature 'set_natural_16_field_at'

	set_natural_32_field_name: STRING = "set_natural_32_field"
			-- Name of Eiffel feature 'set_natural_32_field'

	set_natural_32_field_at_name: STRING = "set_natural_32_field_at"
			-- Name of Eiffel feature 'set_natural_32_field_at'

	set_natural_64_field_name: STRING = "set_natural_64_field"
			-- Name of Eiffel feature 'set_natural_64_field'

	set_natural_64_field_at_name: STRING = "set_natural_64_field_at"
			-- Name of Eiffel feature 'set_natural_64_field_at'

	set_object_comparison_name: STRING = "set_object_comparison"
			-- Name of Eiffel feature 'set_object_comparison'

	set_operands_name: STRING = "set_operands"
			-- Name of Eiffel feature 'set_operands'

	set_pointer_field_name: STRING = "set_pointer_field"
			-- Name of Eiffel feature 'set_pointer_field'

	set_pointer_field_at_name: STRING = "set_pointer_field_at"
			-- Name of Eiffel feature 'set_pointer_field_at'

	set_pre_ecma_mapping_name: STRING = "set_pre_ecma_mapping"
			-- Name of Eiffel feature 'set_pre_ecma_mapping'

	set_real_32_field_name: STRING = "set_real_32_field"
			-- Name of Eiffel feature 'set_real_32_field'

	set_real_32_field_at_name: STRING = "set_real_32_field_at"
			-- Name of Eiffel feature 'set_real_32_field_at'

	set_real_64_field_name: STRING = "set_real_64_field"
			-- Name of Eiffel feature 'set_real_64_field'

	set_real_64_field_at_name: STRING = "set_real_64_field_at"
			-- Name of Eiffel feature 'set_real_64_field_at'

	set_reference_field_name: STRING = "set_reference_field"
			-- Name of Eiffel feature 'set_reference_field'

	set_reference_field_at_name: STRING = "set_reference_field_at"
			-- Name of Eiffel feature 'set_reference_field_at'

	set_rout_disp_final_name: STRING = "set_rout_disp_final"
			-- Name of Eiffel feature 'set_rout_disp_final'

	standard_copy_name: STRING = "standard_copy"
			-- Name of Eiffel feature 'standard_copy'

	standard_is_equal_name: STRING = "standard_is_equal"
			-- Name of Eiffel feature 'standard_is_equal'

	standard_twin_name: STRING = "standard_twin"
			-- Name of Eiffel feature 'standard_twin'

	storable_version_of_type_name: STRING = "storable_version_of_type"
			-- Name of Eiffel feature 'storable_version_of_type'

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

	type_conforms_to_name: STRING = "type_conforms_to"
			-- Name of Eiffel feature 'type_conforms_to'

	type_id_name: STRING = "type_id"
			-- Name of Eiffel feature 'type_id'

	type_id_from_name_name: STRING = "type_id_from_name"
			-- Name of Eiffel feature 'type_id_from_name'

	type_of_code_name: STRING = "type_of_code"
			-- Name of Eiffel feature 'type_code'

	type_of_type_name: STRING = "type_of_type"
			-- Name of Eiffel feature 'type_of_type'

	unlock_marking_name: STRING = "unlock_marking"
			-- Name of Eiffel feature 'unlock_marking'

	unmark_object_name: STRING = "unmark_object"
			-- Name of Eiffel feature 'unmark_object'

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

	implicit_attached_type_mark_name: STRING = "[attached]"
	implicit_detachable_type_mark_name: STRING = "[detachable]"
	implicit_expanded_type_mark_name: STRING = "[expanded]"
	implicit_reference_type_mark_name: STRING = "[reference]"
	implicit_separate_type_mark_name: STRING = "[separate]"
	no_type_mark_name: STRING = ""
			-- Type mark names

	and_symbol_name: STRING once Result := {UC_UTF8_ROUTINES}.string_to_utf8 ({STRING_32} "∧") end
	and_then_symbol_name: STRING once Result := {UC_UTF8_ROUTINES}.string_to_utf8 ({STRING_32} "∧…") end
	arrow_symbol_name: STRING = "->"
	assign_symbol_name: STRING = ":="
	assign_attempt_symbol_name: STRING = "?="
	at_symbol_name: STRING = "@"
	bang_symbol_name: STRING = "!"
	bar_symbol_name: STRING once Result := {UC_UTF8_ROUTINES}.string_to_utf8 ({STRING_32} "¦") end
	brackets_symbol_name: STRING = "[]"
	close_repeat_symbol_name: STRING once Result := {UC_UTF8_ROUTINES}.string_to_utf8 ({STRING_32} "⟲") end
	colon_symbol_name: STRING = ":"
	comma_symbol_name: STRING = ","
	div_symbol_name: STRING = "//"
	divide_symbol_name: STRING = "/"
	dollar_symbol_name: STRING = "$"
	dot_symbol_name: STRING = "."
	dotdot_symbol_name: STRING = ".."
	equal_symbol_name: STRING = "="
	for_all_symbol_name: STRING once Result := {UC_UTF8_ROUTINES}.string_to_utf8 ({STRING_32} "∀") end
	ge_symbol_name: STRING = ">="
	gt_symbol_name: STRING = ">"
	implies_symbol_name: STRING once Result := {UC_UTF8_ROUTINES}.string_to_utf8 ({STRING_32} "⇒") end
	le_symbol_name: STRING = "<="
	left_array_symbol_name: STRING = "<<"
	left_brace_symbol_name: STRING = "{"
	left_bracket_symbol_name: STRING = "["
	left_parenthesis_symbol_name: STRING = "("
	lt_symbol_name: STRING = "<"
	minus_symbol_name: STRING = "-"
	mod_symbol_name: STRING = "\\"
	not_symbol_name: STRING once Result := {UC_UTF8_ROUTINES}.string_to_utf8 ({STRING_32} "¬") end
	not_equal_symbol_name: STRING = "/="
	not_tilde_symbol_name: STRING = "/~"
	open_repeat_symbol_name: STRING once Result := {UC_UTF8_ROUTINES}.string_to_utf8 ({STRING_32} "⟳") end
	or_symbol_name: STRING once Result := {UC_UTF8_ROUTINES}.string_to_utf8 ({STRING_32} "∨") end
	or_else_symbol_name: STRING once Result := {UC_UTF8_ROUTINES}.string_to_utf8 ({STRING_32} "∨…") end
	parentheses_symbol_name: STRING = "()"
	plus_symbol_name: STRING = "+"
	power_symbol_name: STRING = "^"
	question_mark_symbol_name: STRING = "?"
	right_array_symbol_name: STRING = ">>"
	right_brace_symbol_name: STRING = "}"
	right_bracket_symbol_name: STRING = "]"
	right_parenthesis_symbol_name: STRING = ")"
	semicolon_symbol_name: STRING = ";"
	there_exists_symbol_name: STRING once Result := {UC_UTF8_ROUTINES}.string_to_utf8 ({STRING_32} "∃") end
	tilde_symbol_name: STRING = "~"
	times_symbol_name: STRING = "*"
	xor_symbol_name: STRING once Result := {UC_UTF8_ROUTINES}.string_to_utf8 ({STRING_32} "⊻") end
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

feature -- Alias names

	alias_and_name: STRING = "alias %"and%""
	alias_and_symbol_name: STRING once Result := {UC_UTF8_ROUTINES}.string_to_utf8 ({STRING_32} "alias %"∧%"") end
	alias_and_then_symbol_name: STRING once Result := {UC_UTF8_ROUTINES}.string_to_utf8 ({STRING_32} "alias %"∧…%"") end
	alias_implies_name: STRING = "alias %"implies%""
	alias_implies_symbol_name: STRING once Result := {UC_UTF8_ROUTINES}.string_to_utf8 ({STRING_32} "alias %"⇒%"") end
	alias_or_name: STRING = "alias %"or%""
	alias_or_symbol_name: STRING once Result := {UC_UTF8_ROUTINES}.string_to_utf8 ({STRING_32} "alias %"∨%"") end
	alias_or_else_symbol_name: STRING once Result := {UC_UTF8_ROUTINES}.string_to_utf8 ({STRING_32} "alias %"∨…%"") end
	alias_xor_name: STRING = "alias %"xor%""
	alias_xor_symbol_name: STRING once Result := {UC_UTF8_ROUTINES}.string_to_utf8 ({STRING_32} "alias %"⊻%"") end
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
	alias_not_symbol_name: STRING once Result := {UC_UTF8_ROUTINES}.string_to_utf8 ({STRING_32} "alias %"¬%"") end
	alias_bracket_name: STRING = "alias %"[]%""
	alias_parenthesis_name: STRING = "alias %"()%""
			-- Alias feature names

feature -- Built-in

	builtin_marker: STRING = "built_in"
			-- Built-in marker

	static_builtin_marker: STRING = "static built_in"
			-- Static built-in marker

	builtin_static_marker: STRING = "built_in static"
			-- Built-in static marker

	unknown_convert_feature: ET_BUILTIN_CONVERT_FEATURE
			-- Shared unknown convertion feature
		once
			create Result.make (unknown_class_type)
		ensure
			instance_free: class
			unknown_convert_feature_not_void: Result /= Void
		end

feature -- Indexing clauses

	once_indexing_tag: STRING = "once_status"
			-- Tag in indexing clauses for once status

	option_indexing_tag: STRING = "option"
			-- Tag in indexing clauses for feature options

	global_once_indexing_value: STRING = "global"
			-- "global" indexing value for once status

	thread_once_indexing_value: STRING = "thread"
			-- "thread" indexing value for once status

	stable_indexing_value: STRING = "stable"
			-- "stable" indexing value for stable attributes

	transient_indexing_value: STRING = "transient"
			-- "transient" indexing value for transient attributes

feature -- Position

	null_position: ET_POSITION
			-- Null position
		once
			create {ET_COMPRESSED_POSITION} Result.make_default
		ensure
			instance_free: class
			position_not_void: Result /= Void
			position_is_null: Result.is_null
		end

feature -- Ancestors

	empty_ancestors: ET_BASE_TYPE_LIST
			-- Shared empty ancestors
		once
			create Result.make_with_capacity (0)
		ensure
			instance_free: class
			ancestors_not_void: Result /= Void
			ancestors_empty: Result.is_empty
		end

	unknown_parent: ET_PARENT
			-- Shared parent based on `unknown_class_type'
		once
			create Result.make (unknown_class_type, Void, Void, Void, Void, Void)
		ensure
			instance_free: class
			unknown_parent_not_void: Result /= Void
		end

	unknown_parents: ET_PARENT_LIST
			-- Shared parents only made up of `unknown_parent'
		once
			create Result.make_with_capacity (1)
			Result.put_first (unknown_parent)
		ensure
			instance_free: class
			unknown_parents_not_void: Result /= Void
		end

feature -- Features

	empty_queries: ET_QUERY_LIST
			-- Shared empty queries
		once
			create Result.make_with_capacity (0)
		ensure
			instance_free: class
			queries_not_void: Result /= Void
			queries_empty: Result.is_empty
		end

	empty_procedures: ET_PROCEDURE_LIST
			-- Shared empty procedures
		once
			create Result.make_with_capacity (0)
		ensure
			instance_free: class
			procedures_not_void: Result /= Void
			procedures_empty: Result.is_empty
		end

feature -- Clients

	empty_clients: ET_CLIENT_LIST
			-- Shared empty clients
		once
			create Result.make
		ensure
			instance_free: class
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
			Result.set_syntax_error
			Result.set_ancestors_error
			Result.set_flattening_error
			Result.set_interface_error
			Result.set_implementation_error
		ensure
			instance_free: class
			unknown_class_not_void: Result /= Void
		end

	unknown_class_type: ET_CLASS_TYPE
			-- Shared class type whose base class is unknown
		once
			create Result.make (implicit_attached_type_mark, unknown_class.name, unknown_class)
		ensure
			instance_free: class
			unknown_class_type_not_void: Result /= Void
		end

	unknown_generic_class_type: ET_CLASS_TYPE
			-- Shared generic class type whose base class is unknown
		local
			l_parameters: ET_ACTUAL_PARAMETER_LIST
		once
			create l_parameters.make
			create Result.make_generic (implicit_attached_type_mark, unknown_class.name, l_parameters, unknown_class)
		ensure
			instance_free: class
			unknown_generic_class_type_not_void: Result /= Void
		end

	unknown_tuple_type: ET_TUPLE_TYPE
			-- Shared tuple type whose base class is unknown
		once
			create Result.make (implicit_attached_type_mark, Void, unknown_class)
		ensure
			instance_free: class
			unknown_tuple_type_not_void: Result /= Void
		end

	unknown_group: ET_UNKNOWN_GROUP
			-- Shared unknown group
		once
			create Result.make
		ensure
			instance_free: class
			unknown_group_not_void: Result /= Void
		end

	unknown_system: ET_SYSTEM
			-- Shared unknown Eiffel system
		once
			create Result.make ("*unknown*")
		ensure
			instance_free: class
			unknown_system_not_void: Result /= Void
		end

	unknown_library: ET_LIBRARY
			-- Shared unknown Eiffel class library
		once
			create Result.make ("*unknown*", unknown_system)
		ensure
			instance_free: class
			unknown_library_not_void: Result /= Void
		end

	unknown_dotnet_assembly: ET_DOTNET_ASSEMBLY
			-- Shared unknown .NET assembly
		once
			create Result.make ("*unknown*", Void, unknown_system)
		ensure
			instance_free: class
			unknown_dotnet_assembly_not_void: Result /= Void
		end

	standard_error_handler: ET_ERROR_HANDLER
			-- Shared error handler where error messages
			-- will be sent to standard files
		once
			create Result.make_standard
		ensure
			instance_free: class
			standard_error_handler_not_void: Result /= Void
		end

	null_error_handler: ET_NULL_ERROR_HANDLER
			-- Shared error handler where no error message
			-- will be displayed
		once
			create Result.make_null
		ensure
			instance_free: class
			null_error_handler_not_void: Result /= Void
		end

	default_ast_factory: ET_AST_FACTORY
			-- Shared default Eiffel AST factory
		once
			create Result.make
		ensure
			instance_free: class
			default_ast_factory_not_void: Result /= Void
		end

	empty_actual_parameters: ET_ACTUAL_PARAMETER_LIST
			-- Empty actual generic parameter list "[]"
		once
			create Result.make_with_capacity (0)
		ensure
			instance_free: class
			empty_actual_parameters_not_void: Result /= Void
			actual_parameters_is_empty: Result.is_empty
		end

	null_ast_processor: ET_AST_NULL_PROCESSOR
			-- Null AST processor
		once
			create Result.make
		ensure
			instance_free: class
			null_ast_processor_not_void: Result /= Void
		end

	null_system_processor: ET_SYSTEM_PROCESSOR
			-- Null system processor
		once
			create Result.make_null
		ensure
			instance_free: class
			null_system_processor_not_void: Result /= Void
		end

feature -- Empty lists

	empty_classes: DS_ARRAYED_LIST [ET_CLASS]
			-- Shared empty list of classes
		once
			create Result.make (0)
		ensure
			instance_free: class
			list_not_void: Result /= Void
			list_empty: Result.is_empty
		end

	empty_master_classes: DS_ARRAYED_LIST [ET_MASTER_CLASS]
			-- Shared empty list of master classes
		once
			create Result.make (0)
		ensure
			instance_free: class
			list_not_void: Result /= Void
			list_empty: Result.is_empty
		end

end
