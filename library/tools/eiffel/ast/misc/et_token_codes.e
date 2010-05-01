note

	description:

		"Eiffel token and symbol codes"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2010, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_TOKEN_CODES

feature -- Keyword and symbol codes

	infix_and_code: CHARACTER is '%/71/'
	infix_implies_code: CHARACTER is '%/72/'
	infix_or_code: CHARACTER is '%/73/'
	infix_xor_code: CHARACTER is '%/74/'
	infix_div_code: CHARACTER is '%/75/'
	infix_divide_code: CHARACTER is '%/76/'
	infix_ge_code: CHARACTER is '%/77/'
	infix_gt_code: CHARACTER is '%/78/'
	infix_le_code: CHARACTER is '%/79/'
	infix_lt_code: CHARACTER is '%/80/'
	infix_minus_code: CHARACTER is '%/81/'
	infix_mod_code: CHARACTER is '%/82/'
	infix_plus_code: CHARACTER is '%/83/'
	infix_power_code: CHARACTER is '%/84/'
	infix_times_code: CHARACTER is '%/85/'
	infix_freeop_code: CHARACTER is '%/86/'
	infix_and_then_code: CHARACTER is '%/87/'
	infix_or_else_code: CHARACTER is '%/88/'
	infix_dotdot_code: CHARACTER is '%/89/'
	min_infix_code: CHARACTER is '%/71/'
	max_infix_code: CHARACTER is '%/89/'
			-- Infix operator codes

	prefix_not_code: CHARACTER is '%/91/'
	prefix_minus_code: CHARACTER is '%/92/'
	prefix_plus_code: CHARACTER is '%/93/'
	prefix_freeop_code: CHARACTER is '%/94/'
	min_prefix_code: CHARACTER is '%/91/'
	max_prefix_code: CHARACTER is '%/94/'
			-- Prefix operator codes

	alias_bracket_code: CHARACTER is '%/100/'
			-- Alias operator codes

	agent_keyword_code: CHARACTER is '%/1/'
	alias_keyword_code: CHARACTER is '%/2/'
	all_keyword_code: CHARACTER is '%/3/'
	as_keyword_code: CHARACTER is '%/4/'
	assign_keyword_code: CHARACTER is '%/5/'
	attached_keyword_code: CHARACTER is '%/6/'
	attribute_keyword_code: CHARACTER is '%/7/'
	check_keyword_code: CHARACTER is '%/8/'
	class_keyword_code: CHARACTER is '%/9/'
	convert_keyword_code: CHARACTER is '%/10/'
	create_keyword_code: CHARACTER is '%/11/'
	creation_keyword_code: CHARACTER is '%/12/'
	current_keyword_code: CHARACTER is '%/13/'
	debug_keyword_code: CHARACTER is '%/14/'
	deferred_keyword_code: CHARACTER is '%/15/'
	detachable_keyword_code: CHARACTER is '%/16/'
	do_keyword_code: CHARACTER is '%/17/'
	else_keyword_code: CHARACTER is '%/18/'
	elseif_keyword_code: CHARACTER is '%/19/'
	end_keyword_code: CHARACTER is '%/20/'
	ensure_keyword_code: CHARACTER is '%/21/'
	expanded_keyword_code: CHARACTER is '%/22/'
	export_keyword_code: CHARACTER is '%/23/'
	external_keyword_code: CHARACTER is '%/24/'
	false_keyword_code: CHARACTER is '%/25/'
	feature_keyword_code: CHARACTER is '%/26/'
	from_keyword_code: CHARACTER is '%/27/'
	frozen_keyword_code: CHARACTER is '%/28/'
	if_keyword_code: CHARACTER is '%/29/'
	indexing_keyword_code: CHARACTER is '%/30/'
	infix_keyword_code: CHARACTER is '%/31/'
	inherit_keyword_code: CHARACTER is '%/32/'
	inspect_keyword_code: CHARACTER is '%/33/'
	invariant_keyword_code: CHARACTER is '%/34/'
	is_keyword_code: CHARACTER is '%/35/'
	like_keyword_code: CHARACTER is '%/36/'
	local_keyword_code: CHARACTER is '%/37/'
	loop_keyword_code: CHARACTER is '%/38/'
	note_keyword_code: CHARACTER is '%/39/'
	obsolete_keyword_code: CHARACTER is '%/40/'
	old_keyword_code: CHARACTER is '%/41/'
	once_keyword_code: CHARACTER is '%/42/'
	precursor_keyword_code: CHARACTER is '%/43/'
	prefix_keyword_code: CHARACTER is '%/44/'
	redefine_keyword_code: CHARACTER is '%/45/'
	reference_keyword_code: CHARACTER is '%/48/'
	rename_keyword_code: CHARACTER is '%/47/'
	require_keyword_code: CHARACTER is '%/48/'
	rescue_keyword_code: CHARACTER is '%/49/'
	result_keyword_code: CHARACTER is '%/50/'
	retry_keyword_code: CHARACTER is '%/51/'
	select_keyword_code: CHARACTER is '%/52/'
	separate_keyword_code: CHARACTER is '%/53/'
	strip_keyword_code: CHARACTER is '%/54/'
	then_keyword_code: CHARACTER is '%/55/'
	true_keyword_code: CHARACTER is '%/56/'
	undefine_keyword_code: CHARACTER is '%/57/'
	unique_keyword_code: CHARACTER is '%/58/'
	until_keyword_code: CHARACTER is '%/59/'
	variant_keyword_code: CHARACTER is '%/60/'
	void_keyword_code: CHARACTER is '%/61/'
	when_keyword_code: CHARACTER is '%/62/'
			-- Eiffel keyword codes

	arrow_symbol_code: CHARACTER is '%/101/'
	assign_symbol_code: CHARACTER is '%/102/'
	assign_attempt_symbol_code: CHARACTER is '%/103/'
	bang_symbol_code: CHARACTER is '%/104/'
	colon_symbol_code: CHARACTER is '%/105/'
	comma_symbol_code: CHARACTER is '%/106/'
	dollar_symbol_code: CHARACTER is '%/107/'
	dot_symbol_code: CHARACTER is '%/108/'
	dotdot_symbol_code: CHARACTER is '%/109/'
	equal_symbol_code: CHARACTER is '%/110/'
	left_array_symbol_code: CHARACTER is '%/111/'
	left_brace_symbol_code: CHARACTER is '%/112/'
	left_bracket_symbol_code: CHARACTER is '%/113/'
	left_parenthesis_symbol_code: CHARACTER is '%/114/'
	not_equal_symbol_code: CHARACTER is '%/115/'
	not_tilde_symbol_code: CHARACTER is '%/116/'
	question_mark_symbol_code: CHARACTER is '%/117/'
	right_array_symbol_code: CHARACTER is '%/118/'
	right_brace_symbol_code: CHARACTER is '%/119/'
	right_bracket_symbol_code: CHARACTER is '%/120/'
	right_parenthesis_symbol_code: CHARACTER is '%/121/'
	semicolon_symbol_code: CHARACTER is '%/122/'
	tilde_symbol_code: CHARACTER is '%/123/'
			-- Eiffel symbol codes

feature -- Built-in codes

	builtin_not_builtin: INTEGER is 0
	builtin_unknown: INTEGER is 1
	builtin_capacity: INTEGER is 100

	builtin_feature (a_class_code, a_feature_code: INTEGER): INTEGER is
			-- Full code for built-in feature
		do
			Result := a_class_code * builtin_capacity + a_feature_code
		end

	builtin_any_feature (a_feature_code: INTEGER): INTEGER is
			-- Full code for built-in feature from class "ANY"
		do
			Result := builtin_any_class * builtin_capacity + a_feature_code
		end

	builtin_any_class: INTEGER is 1
	builtin_any_twin: INTEGER is 1
	builtin_any_standard_copy: INTEGER is 2
	builtin_any_standard_is_equal: INTEGER is 3
	builtin_any_same_type: INTEGER is 4
	builtin_any_generating_type: INTEGER is 5
	builtin_any_generator: INTEGER is 6
	builtin_any_conforms_to: INTEGER is 7
	builtin_any_is_deep_equal: INTEGER is 8
	builtin_any_tagged_out: INTEGER is 9
	builtin_any_standard_twin: INTEGER is 10
	builtin_any_deep_twin: INTEGER is 11
	builtin_any_copy: INTEGER is 12
	builtin_any_is_equal: INTEGER is 13
			-- Codes for built-in features from class "ANY"

	builtin_special_feature (a_feature_code: INTEGER): INTEGER is
			-- Full code for built-in feature from class "SPECIAL"
		do
			Result := builtin_special_class * builtin_capacity + a_feature_code
		end

	builtin_special_class: INTEGER is 2
	builtin_special_make: INTEGER is 1
	builtin_special_item: INTEGER is 2
	builtin_special_put: INTEGER is 3
	builtin_special_count: INTEGER is 4
	builtin_special_element_size: INTEGER is 5
	builtin_special_aliased_resized_area: INTEGER is 6
	builtin_special_base_address: INTEGER is 7
	builtin_special_put_default: INTEGER is 8
	builtin_special_capacity: INTEGER is 9
			-- Codes for built-in features from class "SPECIAL"

	builtin_character_8_class: INTEGER is 3
	builtin_character_32_class: INTEGER is 4
	builtin_character_item: INTEGER is 1
	builtin_character_set_item: INTEGER is 2
	builtin_character_code: INTEGER is 3
	builtin_character_natural_32_code: INTEGER is 4
	builtin_character_to_character_8: INTEGER is 5
	builtin_character_to_character_32: INTEGER is 6
			-- Codes for built-in features from class "CHARACTER" and related classes

	builtin_boolean_feature (a_feature_code: INTEGER): INTEGER is
			-- Full code for built-in feature from class "BOOLEAN" and related classes
		do
			Result := builtin_boolean_class * builtin_capacity + a_feature_code
		end

	builtin_boolean_class: INTEGER is 5
	builtin_boolean_item: INTEGER is 1
	builtin_boolean_set_item: INTEGER is 2
	builtin_boolean_and: INTEGER is 3
	builtin_boolean_or: INTEGER is 4
	builtin_boolean_xor: INTEGER is 5
	builtin_boolean_not: INTEGER is 6
	builtin_boolean_and_then: INTEGER is 7
	builtin_boolean_or_else: INTEGER is 8
	builtin_boolean_implies: INTEGER is 9
			-- Codes for built-in features from class "BOOLEAN" and related classes

	builtin_integer_8_class: INTEGER is 6
	builtin_integer_16_class: INTEGER is 7
	builtin_integer_32_class: INTEGER is 8
	builtin_integer_64_class: INTEGER is 9
	builtin_natural_8_class: INTEGER is 10
	builtin_natural_16_class: INTEGER is 11
	builtin_natural_32_class: INTEGER is 12
	builtin_natural_64_class: INTEGER is 13
	builtin_integer_item: INTEGER is 1
	builtin_integer_set_item: INTEGER is 2
	builtin_integer_plus: INTEGER is 3
	builtin_integer_minus: INTEGER is 4
	builtin_integer_times: INTEGER is 5
	builtin_integer_divide: INTEGER is 6
	builtin_integer_div: INTEGER is 7
	builtin_integer_mod: INTEGER is 8
	builtin_integer_power: INTEGER is 9
	builtin_integer_opposite: INTEGER is 10
	builtin_integer_identity: INTEGER is 11
	builtin_integer_lt: INTEGER is 12
	builtin_integer_bit_and: INTEGER is 13
	builtin_integer_bit_or: INTEGER is 14
	builtin_integer_bit_xor: INTEGER is 15
	builtin_integer_bit_not: INTEGER is 16
	builtin_integer_bit_shift_left: INTEGER is 17
	builtin_integer_bit_shift_right: INTEGER is 18
	builtin_integer_as_natural_8: INTEGER is 19
	builtin_integer_as_natural_16: INTEGER is 20
	builtin_integer_as_natural_32: INTEGER is 21
	builtin_integer_as_natural_64: INTEGER is 22
	builtin_integer_as_integer_8: INTEGER is 23
	builtin_integer_as_integer_16: INTEGER is 24
	builtin_integer_as_integer_32: INTEGER is 25
	builtin_integer_as_integer_64: INTEGER is 26
	builtin_integer_to_real: INTEGER is 27
	builtin_integer_to_real_32: INTEGER is 28
	builtin_integer_to_real_64: INTEGER is 29
	builtin_integer_to_double: INTEGER is 30
	builtin_integer_to_character_8: INTEGER is 31
	builtin_integer_to_character_32: INTEGER is 32
			-- Codes for built-in features from class "INTEGER" and related classes

	builtin_real_32_class: INTEGER is 14
	builtin_real_64_class: INTEGER is 15
	builtin_real_item: INTEGER is 1
	builtin_real_set_item: INTEGER is 2
	builtin_real_lt: INTEGER is 3
	builtin_real_truncated_to_integer: INTEGER is 4
	builtin_real_truncated_to_integer_64: INTEGER is 5
	builtin_real_truncated_to_real: INTEGER is 6
	builtin_real_to_double: INTEGER is 7
	builtin_real_ceiling_real_32: INTEGER is 8
	builtin_real_ceiling_real_64: INTEGER is 9
	builtin_real_floor_real_32: INTEGER is 10
	builtin_real_floor_real_64: INTEGER is 11
	builtin_real_plus: INTEGER is 12
	builtin_real_minus: INTEGER is 13
	builtin_real_times: INTEGER is 14
	builtin_real_divide: INTEGER is 15
	builtin_real_power: INTEGER is 16
	builtin_real_opposite: INTEGER is 17
	builtin_real_identity: INTEGER is 18
	builtin_real_out: INTEGER is 19
			-- Codes for built-in features from class "REAL" and related classes

	builtin_pointer_feature (a_feature_code: INTEGER): INTEGER is
			-- Full code for built-in feature from class "POINTER" and related classes
		do
			Result := builtin_pointer_class * builtin_capacity + a_feature_code
		end

	builtin_pointer_class: INTEGER is 16
	builtin_pointer_item: INTEGER is 1
	builtin_pointer_set_item: INTEGER is 2
	builtin_pointer_plus: INTEGER is 3
	builtin_pointer_to_integer_32: INTEGER is 4
	builtin_pointer_out: INTEGER is 5
	builtin_pointer_hash_code: INTEGER is 6
			-- Codes for built-in features from class "POINTER" and related classes

	builtin_arguments_feature (a_feature_code: INTEGER): INTEGER is
			-- Full code for built-in feature from class "ARGUMENTS"
		do
			Result := builtin_arguments_class * builtin_capacity + a_feature_code
		end

	builtin_arguments_class: INTEGER is 17
	builtin_arguments_argument: INTEGER is 1
	builtin_arguments_argument_count: INTEGER is 2

	builtin_platform_feature (a_feature_code: INTEGER): INTEGER is
			-- Full code for built-in feature from class "PLATFORM"
		do
			Result := builtin_platform_class * builtin_capacity + a_feature_code
		end

	builtin_platform_class: INTEGER is 18
	builtin_platform_boolean_bytes: INTEGER is 1
	builtin_platform_character_bytes: INTEGER is 2
	builtin_platform_integer_bytes: INTEGER is 3
	builtin_platform_is_dotnet: INTEGER is 4
	builtin_platform_is_mac: INTEGER is 5
	builtin_platform_is_thread_capable: INTEGER is 6
	builtin_platform_is_unix: INTEGER is 7
	builtin_platform_is_vms: INTEGER is 8
	builtin_platform_is_windows: INTEGER is 9
	builtin_platform_pointer_bytes: INTEGER is 10
	builtin_platform_real_bytes: INTEGER is 11
	builtin_platform_wide_character_bytes: INTEGER is 12
	builtin_platform_double_bytes: INTEGER is 13
	builtin_platform_is_vxworks: INTEGER is 14
			-- Codes for built-in features from class "PLATFORM"

	builtin_procedure_feature (a_feature_code: INTEGER): INTEGER is
			-- Full code for built-in feature from class "PROCEDURE"
		do
			Result := builtin_procedure_class * builtin_capacity + a_feature_code
		end

	builtin_procedure_class: INTEGER is 19
	builtin_procedure_call: INTEGER is 1
			-- Codes for built-in features from class "PROCEDURE"

	builtin_function_feature (a_feature_code: INTEGER): INTEGER is
			-- Full code for built-in feature from class "FUNCTION"
		do
			Result := builtin_function_class * builtin_capacity + a_feature_code
		end

	builtin_function_class: INTEGER is 20
	builtin_function_item: INTEGER is 1
	builtin_function_call: INTEGER is 2
			-- Codes for built-in features from class "FUNCTION"

	builtin_type_feature (a_feature_code: INTEGER): INTEGER is
			-- Full code for built-in feature from class "TYPE"
		do
			Result := builtin_type_class * builtin_capacity + a_feature_code
		end

	builtin_type_class: INTEGER is 21
	builtin_type_base_class_name: INTEGER is 41
	builtin_type_boolean_field: INTEGER is 1
	builtin_type_character_8_field: INTEGER is 2
	builtin_type_character_32_field: INTEGER is 3
	builtin_type_field: INTEGER is 4
	builtin_type_field_count: INTEGER is 5
	builtin_type_field_name: INTEGER is 6
	builtin_type_field_static_type: INTEGER is 7
	builtin_type_field_type: INTEGER is 8
	builtin_type_generating_type: INTEGER is 9
	builtin_type_generic_parameter: INTEGER is 10
	builtin_type_generic_parameter_count: INTEGER is 11
	builtin_type_integer_8_field: INTEGER is 12
	builtin_type_integer_16_field: INTEGER is 13
	builtin_type_integer_32_field: INTEGER is 14
	builtin_type_integer_64_field: INTEGER is 15
	builtin_type_is_expanded: INTEGER is 42
	builtin_type_name: INTEGER is 16
	builtin_type_natural_8_field: INTEGER is 17
	builtin_type_natural_16_field: INTEGER is 18
	builtin_type_natural_32_field: INTEGER is 19
	builtin_type_natural_64_field: INTEGER is 20
	builtin_type_pointer_field: INTEGER is 21
	builtin_type_real_32_field: INTEGER is 22
	builtin_type_real_64_field: INTEGER is 23
	builtin_type_runtime_name: INTEGER is 24
	builtin_type_set_boolean_field: INTEGER is 25
	builtin_type_set_character_8_field: INTEGER is 26
	builtin_type_set_character_32_field: INTEGER is 27
	builtin_type_set_integer_8_field: INTEGER is 28
	builtin_type_set_integer_16_field: INTEGER is 29
	builtin_type_set_integer_32_field: INTEGER is 30
	builtin_type_set_integer_64_field: INTEGER is 31
	builtin_type_set_natural_8_field: INTEGER is 32
	builtin_type_set_natural_16_field: INTEGER is 33
	builtin_type_set_natural_32_field: INTEGER is 34
	builtin_type_set_natural_64_field: INTEGER is 35
	builtin_type_set_pointer_field: INTEGER is 36
	builtin_type_set_real_32_field: INTEGER is 37
	builtin_type_set_real_64_field: INTEGER is 38
	builtin_type_set_reference_field: INTEGER is 39
	builtin_type_type_id: INTEGER is 40
			-- Codes for built-in features from class "TYPE"

	builtin_identified_feature (a_feature_code: INTEGER): INTEGER is
			-- Full code for built-in feature from class "IDENTIFIED" and related classes
		do
			Result := builtin_identified_class * builtin_capacity + a_feature_code
		end

	builtin_identified_class: INTEGER is 22
	builtin_identified_eif_id_object: INTEGER is 1
	builtin_identified_eif_object_id: INTEGER is 2
	builtin_identified_eif_object_id_free: INTEGER is 3
			-- Codes for built-in features from class "IDENTIFIED" and related classes

	builtin_tuple_feature (a_feature_code: INTEGER): INTEGER is
			-- Full code for built-in feature from class "TUPLE"
		do
			Result := builtin_tuple_class * builtin_capacity + a_feature_code
		end

	builtin_tuple_class: INTEGER is 23
	builtin_tuple_boolean_item: INTEGER is 1
	builtin_tuple_character_8_item: INTEGER is 2
	builtin_tuple_character_32_item: INTEGER is 3
	builtin_tuple_count: INTEGER is 4
	builtin_tuple_integer_8_item: INTEGER is 5
	builtin_tuple_integer_16_item: INTEGER is 6
	builtin_tuple_integer_32_item: INTEGER is 7
	builtin_tuple_integer_64_item: INTEGER is 8
	builtin_tuple_item_code: INTEGER is 9
	builtin_tuple_natural_8_item: INTEGER is 10
	builtin_tuple_natural_16_item: INTEGER is 11
	builtin_tuple_natural_32_item: INTEGER is 12
	builtin_tuple_natural_64_item: INTEGER is 13
	builtin_tuple_object_comparison: INTEGER is 14
	builtin_tuple_pointer_item: INTEGER is 15
	builtin_tuple_put_boolean: INTEGER is 16
	builtin_tuple_put_character_8: INTEGER is 17
	builtin_tuple_put_character_32: INTEGER is 18
	builtin_tuple_put_integer_8: INTEGER is 19
	builtin_tuple_put_integer_16: INTEGER is 20
	builtin_tuple_put_integer_32: INTEGER is 21
	builtin_tuple_put_integer_64: INTEGER is 22
	builtin_tuple_put_natural_8: INTEGER is 23
	builtin_tuple_put_natural_16: INTEGER is 24
	builtin_tuple_put_natural_32: INTEGER is 25
	builtin_tuple_put_natural_64: INTEGER is 26
	builtin_tuple_put_pointer: INTEGER is 27
	builtin_tuple_put_real_32: INTEGER is 28
	builtin_tuple_put_real_64: INTEGER is 29
	builtin_tuple_put_reference: INTEGER is 30
	builtin_tuple_real_32_item: INTEGER is 31
	builtin_tuple_real_64_item: INTEGER is 32
	builtin_tuple_reference_item: INTEGER is 33
	builtin_tuple_set_object_comparison: INTEGER is 34
			-- Codes for built-in features from class "TUPLE"

	builtin_memory_feature (a_feature_code: INTEGER): INTEGER is
			-- Full code for built-in feature from class "MEMORY"
		do
			Result := builtin_memory_class * builtin_capacity + a_feature_code
		end

	builtin_memory_class: INTEGER is 24
	builtin_memory_find_referers: INTEGER is 1
	builtin_memory_free: INTEGER is 2
			-- Codes for built-in features from class "MEMORY"

	builtin_internal_feature (a_feature_code: INTEGER): INTEGER is
			-- Full code for built-in feature from class "INTERNAL"
		do
			Result := builtin_internal_class * builtin_capacity + a_feature_code
		end

	builtin_internal_class: INTEGER is 25
	builtin_internal_type_of_type: INTEGER is 1
	builtin_internal_max_type_id: INTEGER is 2
			-- Codes for built-in features from class "INTERNAL"

end
