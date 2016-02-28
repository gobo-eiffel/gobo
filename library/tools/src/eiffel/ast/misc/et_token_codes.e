note

	description:

		"Eiffel token and symbol codes"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2014, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_TOKEN_CODES

feature -- Keyword and symbol codes

	infix_and_code: CHARACTER = '%/71/'
	infix_implies_code: CHARACTER = '%/72/'
	infix_or_code: CHARACTER = '%/73/'
	infix_xor_code: CHARACTER = '%/74/'
	infix_div_code: CHARACTER = '%/75/'
	infix_divide_code: CHARACTER = '%/76/'
	infix_ge_code: CHARACTER = '%/77/'
	infix_gt_code: CHARACTER = '%/78/'
	infix_le_code: CHARACTER = '%/79/'
	infix_lt_code: CHARACTER = '%/80/'
	infix_minus_code: CHARACTER = '%/81/'
	infix_mod_code: CHARACTER = '%/82/'
	infix_plus_code: CHARACTER = '%/83/'
	infix_power_code: CHARACTER = '%/84/'
	infix_times_code: CHARACTER = '%/85/'
	infix_freeop_code: CHARACTER = '%/86/'
	infix_and_then_code: CHARACTER = '%/87/'
	infix_or_else_code: CHARACTER = '%/88/'
	infix_dotdot_code: CHARACTER = '%/89/'
	min_infix_code: CHARACTER = '%/71/'
	max_infix_code: CHARACTER = '%/89/'
			-- Infix operator codes

	prefix_not_code: CHARACTER = '%/91/'
	prefix_minus_code: CHARACTER = '%/92/'
	prefix_plus_code: CHARACTER = '%/93/'
	prefix_freeop_code: CHARACTER = '%/94/'
	min_prefix_code: CHARACTER = '%/91/'
	max_prefix_code: CHARACTER = '%/94/'
			-- Prefix operator codes

	alias_bracket_code: CHARACTER = '%/100/'
	alias_parenthesis_code: CHARACTER = '%/99/'
			-- Alias operator codes

	across_keyword_code: CHARACTER = '%/1/'
	agent_keyword_code: CHARACTER = '%/2/'
	alias_keyword_code: CHARACTER = '%/3/'
	all_keyword_code: CHARACTER = '%/4/'
	as_keyword_code: CHARACTER = '%/5/'
	assign_keyword_code: CHARACTER = '%/6/'
	attached_keyword_code: CHARACTER = '%/7/'
	attribute_keyword_code: CHARACTER = '%/8/'
	check_keyword_code: CHARACTER = '%/9/'
	class_keyword_code: CHARACTER = '%/10/'
	convert_keyword_code: CHARACTER = '%/11/'
	create_keyword_code: CHARACTER = '%/12/'
	creation_keyword_code: CHARACTER = '%/13/'
	current_keyword_code: CHARACTER = '%/14/'
	debug_keyword_code: CHARACTER = '%/15/'
	deferred_keyword_code: CHARACTER = '%/16/'
	detachable_keyword_code: CHARACTER = '%/17/'
	do_keyword_code: CHARACTER = '%/18/'
	else_keyword_code: CHARACTER = '%/19/'
	elseif_keyword_code: CHARACTER = '%/20/'
	end_keyword_code: CHARACTER = '%/21/'
	ensure_keyword_code: CHARACTER = '%/22/'
	expanded_keyword_code: CHARACTER = '%/23/'
	export_keyword_code: CHARACTER = '%/24/'
	external_keyword_code: CHARACTER = '%/25/'
	false_keyword_code: CHARACTER = '%/26/'
	feature_keyword_code: CHARACTER = '%/27/'
	from_keyword_code: CHARACTER = '%/28/'
	frozen_keyword_code: CHARACTER = '%/29/'
	if_keyword_code: CHARACTER = '%/30/'
	indexing_keyword_code: CHARACTER = '%/31/'
	infix_keyword_code: CHARACTER = '%/32/'
	inherit_keyword_code: CHARACTER = '%/33/'
	inspect_keyword_code: CHARACTER = '%/34/'
	invariant_keyword_code: CHARACTER = '%/35/'
	is_keyword_code: CHARACTER = '%/36/'
	like_keyword_code: CHARACTER = '%/37/'
	local_keyword_code: CHARACTER = '%/38/'
	loop_keyword_code: CHARACTER = '%/39/'
	note_keyword_code: CHARACTER = '%/40/'
	obsolete_keyword_code: CHARACTER = '%/41/'
	old_keyword_code: CHARACTER = '%/42/'
	once_keyword_code: CHARACTER = '%/43/'
	precursor_keyword_code: CHARACTER = '%/44/'
	prefix_keyword_code: CHARACTER = '%/45/'
	redefine_keyword_code: CHARACTER = '%/46/'
	reference_keyword_code: CHARACTER = '%/47/'
	rename_keyword_code: CHARACTER = '%/48/'
	require_keyword_code: CHARACTER = '%/49/'
	rescue_keyword_code: CHARACTER = '%/50/'
	result_keyword_code: CHARACTER = '%/51/'
	retry_keyword_code: CHARACTER = '%/52/'
	select_keyword_code: CHARACTER = '%/53/'
	separate_keyword_code: CHARACTER = '%/54/'
	some_keyword_code: CHARACTER = '%/55/'
	strip_keyword_code: CHARACTER = '%/56/'
	then_keyword_code: CHARACTER = '%/57/'
	true_keyword_code: CHARACTER = '%/58/'
	undefine_keyword_code: CHARACTER = '%/59/'
	unique_keyword_code: CHARACTER = '%/60/'
	until_keyword_code: CHARACTER = '%/61/'
	variant_keyword_code: CHARACTER = '%/62/'
	void_keyword_code: CHARACTER = '%/63/'
	when_keyword_code: CHARACTER = '%/64/'
			-- Eiffel keyword codes

	arrow_symbol_code: CHARACTER = '%/101/'
	assign_symbol_code: CHARACTER = '%/102/'
	assign_attempt_symbol_code: CHARACTER = '%/103/'
	bang_symbol_code: CHARACTER = '%/104/'
	colon_symbol_code: CHARACTER = '%/105/'
	comma_symbol_code: CHARACTER = '%/106/'
	dollar_symbol_code: CHARACTER = '%/107/'
	dot_symbol_code: CHARACTER = '%/108/'
	dotdot_symbol_code: CHARACTER = '%/109/'
	equal_symbol_code: CHARACTER = '%/110/'
	left_array_symbol_code: CHARACTER = '%/111/'
	left_brace_symbol_code: CHARACTER = '%/112/'
	left_bracket_symbol_code: CHARACTER = '%/113/'
	left_parenthesis_symbol_code: CHARACTER = '%/114/'
	not_equal_symbol_code: CHARACTER = '%/115/'
	not_tilde_symbol_code: CHARACTER = '%/116/'
	question_mark_symbol_code: CHARACTER = '%/117/'
	right_array_symbol_code: CHARACTER = '%/118/'
	right_brace_symbol_code: CHARACTER = '%/119/'
	right_bracket_symbol_code: CHARACTER = '%/120/'
	right_parenthesis_symbol_code: CHARACTER = '%/121/'
	semicolon_symbol_code: CHARACTER = '%/122/'
	tilde_symbol_code: CHARACTER = '%/123/'
			-- Eiffel symbol codes

feature -- Built-in codes

	builtin_not_builtin: INTEGER = 0
	builtin_unknown: INTEGER = 1
	builtin_capacity: INTEGER = 100

	builtin_feature (a_class_code, a_feature_code: INTEGER): INTEGER
			-- Full code for built-in feature
		do
			Result := a_class_code * builtin_capacity + a_feature_code
		end

	builtin_any_feature (a_feature_code: INTEGER): INTEGER
			-- Full code for built-in feature from class "ANY"
		do
			Result := builtin_any_class * builtin_capacity + a_feature_code
		end

	builtin_any_class: INTEGER = 1
	builtin_any_twin: INTEGER = 1
	builtin_any_standard_copy: INTEGER = 2
	builtin_any_standard_is_equal: INTEGER = 3
	builtin_any_same_type: INTEGER = 4
	builtin_any_generating_type: INTEGER = 5
	builtin_any_generator: INTEGER = 6
	builtin_any_conforms_to: INTEGER = 7
	builtin_any_is_deep_equal: INTEGER = 8
	builtin_any_tagged_out: INTEGER = 9
	builtin_any_standard_twin: INTEGER = 10
	builtin_any_deep_twin: INTEGER = 11
	builtin_any_copy: INTEGER = 12
	builtin_any_is_equal: INTEGER = 13
			-- Codes for built-in features from class "ANY"

	builtin_special_feature (a_feature_code: INTEGER): INTEGER
			-- Full code for built-in feature from class "SPECIAL"
		do
			Result := builtin_special_class * builtin_capacity + a_feature_code
		end

	builtin_special_class: INTEGER = 2
	builtin_special_make_empty: INTEGER = 1
	builtin_special_item: INTEGER = 2
	builtin_special_put: INTEGER = 3
	builtin_special_capacity: INTEGER = 4
	builtin_special_count: INTEGER = 5
	builtin_special_element_size: INTEGER = 6
	builtin_special_aliased_resized_area: INTEGER = 7
	builtin_special_base_address: INTEGER = 8
	builtin_special_set_count: INTEGER = 9
	builtin_special_extend: INTEGER = 10
			-- Codes for built-in features from class "SPECIAL"

	builtin_character_8_class: INTEGER = 3
	builtin_character_32_class: INTEGER = 4
	builtin_character_item: INTEGER = 1
	builtin_character_set_item: INTEGER = 2
	builtin_character_code: INTEGER = 3
	builtin_character_natural_32_code: INTEGER = 4
	builtin_character_to_character_8: INTEGER = 5
	builtin_character_to_character_32: INTEGER = 6
			-- Codes for built-in features from class "CHARACTER" and related classes

	builtin_boolean_feature (a_feature_code: INTEGER): INTEGER
			-- Full code for built-in feature from class "BOOLEAN" and related classes
		do
			Result := builtin_boolean_class * builtin_capacity + a_feature_code
		end

	builtin_boolean_class: INTEGER = 5
	builtin_boolean_item: INTEGER = 1
	builtin_boolean_set_item: INTEGER = 2
	builtin_boolean_and: INTEGER = 3
	builtin_boolean_or: INTEGER = 4
	builtin_boolean_xor: INTEGER = 5
	builtin_boolean_not: INTEGER = 6
	builtin_boolean_and_then: INTEGER = 7
	builtin_boolean_or_else: INTEGER = 8
	builtin_boolean_implies: INTEGER = 9
			-- Codes for built-in features from class "BOOLEAN" and related classes

	builtin_integer_8_class: INTEGER = 6
	builtin_integer_16_class: INTEGER = 7
	builtin_integer_32_class: INTEGER = 8
	builtin_integer_64_class: INTEGER = 9
	builtin_natural_8_class: INTEGER = 10
	builtin_natural_16_class: INTEGER = 11
	builtin_natural_32_class: INTEGER = 12
	builtin_natural_64_class: INTEGER = 13
	builtin_integer_item: INTEGER = 1
	builtin_integer_set_item: INTEGER = 2
	builtin_integer_plus: INTEGER = 3
	builtin_integer_minus: INTEGER = 4
	builtin_integer_times: INTEGER = 5
	builtin_integer_divide: INTEGER = 6
	builtin_integer_div: INTEGER = 7
	builtin_integer_mod: INTEGER = 8
	builtin_integer_power: INTEGER = 9
	builtin_integer_opposite: INTEGER = 10
	builtin_integer_identity: INTEGER = 11
	builtin_integer_lt: INTEGER = 12
	builtin_integer_bit_and: INTEGER = 13
	builtin_integer_bit_or: INTEGER = 14
	builtin_integer_bit_xor: INTEGER = 15
	builtin_integer_bit_not: INTEGER = 16
	builtin_integer_bit_shift_left: INTEGER = 17
	builtin_integer_bit_shift_right: INTEGER = 18
	builtin_integer_as_natural_8: INTEGER = 19
	builtin_integer_as_natural_16: INTEGER = 20
	builtin_integer_as_natural_32: INTEGER = 21
	builtin_integer_as_natural_64: INTEGER = 22
	builtin_integer_as_integer_8: INTEGER = 23
	builtin_integer_as_integer_16: INTEGER = 24
	builtin_integer_as_integer_32: INTEGER = 25
	builtin_integer_as_integer_64: INTEGER = 26
	builtin_integer_to_real: INTEGER = 27
	builtin_integer_to_real_32: INTEGER = 28
	builtin_integer_to_real_64: INTEGER = 29
	builtin_integer_to_double: INTEGER = 30
	builtin_integer_to_character_8: INTEGER = 31
	builtin_integer_to_character_32: INTEGER = 32
			-- Codes for built-in features from class "INTEGER" and related classes

	builtin_real_32_class: INTEGER = 14
	builtin_real_64_class: INTEGER = 15
	builtin_real_item: INTEGER = 1
	builtin_real_set_item: INTEGER = 2
	builtin_real_lt: INTEGER = 3
	builtin_real_truncated_to_integer: INTEGER = 4
	builtin_real_truncated_to_integer_64: INTEGER = 5
	builtin_real_truncated_to_real: INTEGER = 6
	builtin_real_to_double: INTEGER = 7
	builtin_real_ceiling_real_32: INTEGER = 8
	builtin_real_ceiling_real_64: INTEGER = 9
	builtin_real_floor_real_32: INTEGER = 10
	builtin_real_floor_real_64: INTEGER = 11
	builtin_real_plus: INTEGER = 12
	builtin_real_minus: INTEGER = 13
	builtin_real_times: INTEGER = 14
	builtin_real_divide: INTEGER = 15
	builtin_real_power: INTEGER = 16
	builtin_real_opposite: INTEGER = 17
	builtin_real_identity: INTEGER = 18
	builtin_real_out: INTEGER = 19
	builtin_real_nan: INTEGER = 20
	builtin_real_negative_infinity: INTEGER = 21
	builtin_real_positive_infinity: INTEGER = 22
	builtin_real_is_nan: INTEGER = 23
	builtin_real_is_negative_infinity: INTEGER = 24
	builtin_real_is_positive_infinity: INTEGER = 25
			-- Codes for built-in features from class "REAL" and related classes

	builtin_pointer_feature (a_feature_code: INTEGER): INTEGER
			-- Full code for built-in feature from class "POINTER" and related classes
		do
			Result := builtin_pointer_class * builtin_capacity + a_feature_code
		end

	builtin_pointer_class: INTEGER = 16
	builtin_pointer_item: INTEGER = 1
	builtin_pointer_set_item: INTEGER = 2
	builtin_pointer_plus: INTEGER = 3
	builtin_pointer_to_integer_32: INTEGER = 4
	builtin_pointer_out: INTEGER = 5
	builtin_pointer_hash_code: INTEGER = 6
	builtin_pointer_is_default_pointer: INTEGER = 7
			-- Codes for built-in features from class "POINTER" and related classes

	builtin_arguments_32_feature (a_feature_code: INTEGER): INTEGER
			-- Full code for built-in feature from class "ARGUMENTS_32"
		do
			Result := builtin_arguments_32_class * builtin_capacity + a_feature_code
		end

	builtin_arguments_32_class: INTEGER = 17
	builtin_arguments_32_argument_count: INTEGER = 1
	builtin_arguments_32_i_th_argument_pointer: INTEGER = 2
	builtin_arguments_32_i_th_argument_string: INTEGER = 3

	builtin_platform_feature (a_feature_code: INTEGER): INTEGER
			-- Full code for built-in feature from class "PLATFORM"
		do
			Result := builtin_platform_class * builtin_capacity + a_feature_code
		end

	builtin_platform_class: INTEGER = 18
	builtin_platform_boolean_bytes: INTEGER = 1
	builtin_platform_character_bytes: INTEGER = 2
	builtin_platform_integer_bytes: INTEGER = 3
	builtin_platform_is_dotnet: INTEGER = 4
	builtin_platform_is_mac: INTEGER = 5
	builtin_platform_is_scoop_capable: INTEGER = 6
	builtin_platform_is_thread_capable: INTEGER = 7
	builtin_platform_is_unix: INTEGER = 8
	builtin_platform_is_vms: INTEGER = 9
	builtin_platform_is_windows: INTEGER = 10
	builtin_platform_pointer_bytes: INTEGER = 11
	builtin_platform_real_bytes: INTEGER = 12
	builtin_platform_wide_character_bytes: INTEGER = 13
	builtin_platform_double_bytes: INTEGER = 14
	builtin_platform_is_vxworks: INTEGER = 15
			-- Codes for built-in features from class "PLATFORM"

	builtin_procedure_feature (a_feature_code: INTEGER): INTEGER
			-- Full code for built-in feature from class "PROCEDURE"
		do
			Result := builtin_procedure_class * builtin_capacity + a_feature_code
		end

	builtin_procedure_class: INTEGER = 19
	builtin_procedure_call: INTEGER = 1
			-- Codes for built-in features from class "PROCEDURE"

	builtin_function_feature (a_feature_code: INTEGER): INTEGER
			-- Full code for built-in feature from class "FUNCTION"
		do
			Result := builtin_function_class * builtin_capacity + a_feature_code
		end

	builtin_function_class: INTEGER = 20
	builtin_function_item: INTEGER = 1
	builtin_function_call: INTEGER = 2
			-- Codes for built-in features from class "FUNCTION"

	builtin_type_feature (a_feature_code: INTEGER): INTEGER
			-- Full code for built-in feature from class "TYPE"
		do
			Result := builtin_type_class * builtin_capacity + a_feature_code
		end

	builtin_type_class: INTEGER = 21
	builtin_type_base_class_name: INTEGER = 1
	builtin_type_boolean_field: INTEGER = 2
	builtin_type_character_8_field: INTEGER = 3
	builtin_type_character_32_field: INTEGER = 4
	builtin_type_default: INTEGER = 5
	builtin_type_field: INTEGER = 6
	builtin_type_field_count: INTEGER = 7
	builtin_type_field_name: INTEGER = 8
	builtin_type_field_static_type: INTEGER = 9
	builtin_type_field_type: INTEGER = 10
	builtin_type_generating_type: INTEGER = 11
	builtin_type_generic_parameter_type: INTEGER = 12
	builtin_type_generic_parameter_count: INTEGER = 13
	builtin_type_has_default: INTEGER = 14
	builtin_type_integer_8_field: INTEGER = 15
	builtin_type_integer_16_field: INTEGER = 16
	builtin_type_integer_32_field: INTEGER = 17
	builtin_type_integer_64_field: INTEGER = 18
	builtin_type_is_expanded: INTEGER = 19
	builtin_type_name: INTEGER = 20
	builtin_type_natural_8_field: INTEGER = 21
	builtin_type_natural_16_field: INTEGER = 22
	builtin_type_natural_32_field: INTEGER = 23
	builtin_type_natural_64_field: INTEGER = 24
	builtin_type_pointer_field: INTEGER = 25
	builtin_type_real_32_field: INTEGER = 26
	builtin_type_real_64_field: INTEGER = 27
	builtin_type_runtime_name: INTEGER = 28
	builtin_type_set_boolean_field: INTEGER = 29
	builtin_type_set_character_8_field: INTEGER = 30
	builtin_type_set_character_32_field: INTEGER = 31
	builtin_type_set_integer_8_field: INTEGER = 32
	builtin_type_set_integer_16_field: INTEGER = 33
	builtin_type_set_integer_32_field: INTEGER = 34
	builtin_type_set_integer_64_field: INTEGER = 35
	builtin_type_set_natural_8_field: INTEGER = 36
	builtin_type_set_natural_16_field: INTEGER = 37
	builtin_type_set_natural_32_field: INTEGER = 38
	builtin_type_set_natural_64_field: INTEGER = 39
	builtin_type_set_pointer_field: INTEGER = 40
	builtin_type_set_real_32_field: INTEGER = 41
	builtin_type_set_real_64_field: INTEGER = 42
	builtin_type_set_reference_field: INTEGER = 43
	builtin_type_type_id: INTEGER = 44
	builtin_type_new_instance: INTEGER = 45
	builtin_type_new_special_any_instance: INTEGER = 46
			-- Codes for built-in features from class "TYPE"

	builtin_identified_feature (a_feature_code: INTEGER): INTEGER
			-- Full code for built-in feature from class "IDENTIFIED" and related classes
		do
			Result := builtin_identified_class * builtin_capacity + a_feature_code
		end

	builtin_identified_class: INTEGER = 22
	builtin_identified_eif_id_object: INTEGER = 1
	builtin_identified_eif_object_id: INTEGER = 2
	builtin_identified_eif_object_id_free: INTEGER = 3
			-- Codes for built-in features from class "IDENTIFIED" and related classes

	builtin_tuple_feature (a_feature_code: INTEGER): INTEGER
			-- Full code for built-in feature from class "TUPLE"
		do
			Result := builtin_tuple_class * builtin_capacity + a_feature_code
		end

	builtin_tuple_class: INTEGER = 23
	builtin_tuple_boolean_item: INTEGER = 1
	builtin_tuple_character_8_item: INTEGER = 2
	builtin_tuple_character_32_item: INTEGER = 3
	builtin_tuple_count: INTEGER = 4
	builtin_tuple_integer_8_item: INTEGER = 5
	builtin_tuple_integer_16_item: INTEGER = 6
	builtin_tuple_integer_32_item: INTEGER = 7
	builtin_tuple_integer_64_item: INTEGER = 8
	builtin_tuple_item_code: INTEGER = 9
	builtin_tuple_natural_8_item: INTEGER = 10
	builtin_tuple_natural_16_item: INTEGER = 11
	builtin_tuple_natural_32_item: INTEGER = 12
	builtin_tuple_natural_64_item: INTEGER = 13
	builtin_tuple_object_comparison: INTEGER = 14
	builtin_tuple_pointer_item: INTEGER = 15
	builtin_tuple_put_boolean: INTEGER = 16
	builtin_tuple_put_character_8: INTEGER = 17
	builtin_tuple_put_character_32: INTEGER = 18
	builtin_tuple_put_integer_8: INTEGER = 19
	builtin_tuple_put_integer_16: INTEGER = 20
	builtin_tuple_put_integer_32: INTEGER = 21
	builtin_tuple_put_integer_64: INTEGER = 22
	builtin_tuple_put_natural_8: INTEGER = 23
	builtin_tuple_put_natural_16: INTEGER = 24
	builtin_tuple_put_natural_32: INTEGER = 25
	builtin_tuple_put_natural_64: INTEGER = 26
	builtin_tuple_put_pointer: INTEGER = 27
	builtin_tuple_put_real_32: INTEGER = 28
	builtin_tuple_put_real_64: INTEGER = 29
	builtin_tuple_put_reference: INTEGER = 30
	builtin_tuple_real_32_item: INTEGER = 31
	builtin_tuple_real_64_item: INTEGER = 32
	builtin_tuple_reference_item: INTEGER = 33
	builtin_tuple_set_object_comparison: INTEGER = 34
			-- Codes for built-in features from class "TUPLE"

	builtin_memory_feature (a_feature_code: INTEGER): INTEGER
			-- Full code for built-in feature from class "MEMORY"
		do
			Result := builtin_memory_class * builtin_capacity + a_feature_code
		end

	builtin_memory_class: INTEGER = 24
	builtin_memory_find_referers: INTEGER = 1
	builtin_memory_free: INTEGER = 2
			-- Codes for built-in features from class "MEMORY"

	builtin_internal_feature (a_feature_code: INTEGER): INTEGER
			-- Full code for built-in feature from class "INTERNAL"
		do
			Result := builtin_internal_class * builtin_capacity + a_feature_code
		end

	builtin_internal_class: INTEGER = 25
	builtin_internal_type_of_type: INTEGER = 1
	builtin_internal_max_type_id: INTEGER = 2
			-- Codes for built-in features from class "INTERNAL"

end
