indexing

	description:

		"Eiffel token and symbol codes"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_TOKEN_CODES

feature -- Keyword and symbol codes

	infix_and_code: CHARACTER is '%/1/'
	infix_implies_code: CHARACTER is '%/2/'
	infix_or_code: CHARACTER is '%/3/'
	infix_xor_code: CHARACTER is '%/4/'
	infix_div_code: CHARACTER is '%/5/'
	infix_divide_code: CHARACTER is '%/6/'
	infix_ge_code: CHARACTER is '%/7/'
	infix_gt_code: CHARACTER is '%/8/'
	infix_le_code: CHARACTER is '%/9/'
	infix_lt_code: CHARACTER is '%/10/'
	infix_minus_code: CHARACTER is '%/11/'
	infix_mod_code: CHARACTER is '%/12/'
	infix_plus_code: CHARACTER is '%/13/'
	infix_power_code: CHARACTER is '%/14/'
	infix_times_code: CHARACTER is '%/15/'
	infix_freeop_code: CHARACTER is '%/16/'
	infix_and_then_code: CHARACTER is '%/17/'
	infix_or_else_code: CHARACTER is '%/18/'
	infix_dotdot_code: CHARACTER is '%/19/'
	min_infix_code: CHARACTER is '%/1/'
	max_infix_code: CHARACTER is '%/19/'
			-- Infix operator codes

	prefix_not_code: CHARACTER is '%/62/'
	prefix_minus_code: CHARACTER is '%/63/'
	prefix_plus_code: CHARACTER is '%/64/'
	prefix_freeop_code: CHARACTER is '%/65/'
	min_prefix_code: CHARACTER is '%/62/'
	max_prefix_code: CHARACTER is '%/65/'
			-- Prefix operator codes

	alias_bracket_code: CHARACTER is '%/20/'
			-- Alias operator codes

	agent_keyword_code: CHARACTER is '%/101/'
	alias_keyword_code: CHARACTER is '%/102/'
	all_keyword_code: CHARACTER is '%/103/'
	as_keyword_code: CHARACTER is '%/104/'
	assign_keyword_code: CHARACTER is '%/59/'
	attribute_keyword_code: CHARACTER is '%/105/'
	check_keyword_code: CHARACTER is '%/106/'
	class_keyword_code: CHARACTER is '%/107/'
	convert_keyword_code: CHARACTER is '%/108/'
	create_keyword_code: CHARACTER is '%/109/'
	creation_keyword_code: CHARACTER is '%/110/'
	current_keyword_code: CHARACTER is '%/111/'
	debug_keyword_code: CHARACTER is '%/112/'
	deferred_keyword_code: CHARACTER is '%/113/'
	do_keyword_code: CHARACTER is '%/114/'
	else_keyword_code: CHARACTER is '%/115/'
	elseif_keyword_code: CHARACTER is '%/116/'
	end_keyword_code: CHARACTER is '%/117/'
	ensure_keyword_code: CHARACTER is '%/118/'
	expanded_keyword_code: CHARACTER is '%/119/'
	export_keyword_code: CHARACTER is '%/120/'
	external_keyword_code: CHARACTER is '%/121/'
	false_keyword_code: CHARACTER is '%/122/'
	feature_keyword_code: CHARACTER is '%/123/'
	from_keyword_code: CHARACTER is '%/124/'
	frozen_keyword_code: CHARACTER is '%/125/'
	if_keyword_code: CHARACTER is '%/126/'
	indexing_keyword_code: CHARACTER is '%/27/'
	infix_keyword_code: CHARACTER is '%/28/'
	inherit_keyword_code: CHARACTER is '%/29/'
	inspect_keyword_code: CHARACTER is '%/30/'
	invariant_keyword_code: CHARACTER is '%/31/'
	is_keyword_code: CHARACTER is '%/32/'
	like_keyword_code: CHARACTER is '%/33/'
	local_keyword_code: CHARACTER is '%/34/'
	loop_keyword_code: CHARACTER is '%/35/'
	obsolete_keyword_code: CHARACTER is '%/36/'
	old_keyword_code: CHARACTER is '%/37/'
	once_keyword_code: CHARACTER is '%/38/'
	precursor_keyword_code: CHARACTER is '%/39/'
	prefix_keyword_code: CHARACTER is '%/40/'
	recast_keyword_code: CHARACTER is '%/41/'
	redefine_keyword_code: CHARACTER is '%/42/'
	reference_keyword_code: CHARACTER is '%/43/'
	rename_keyword_code: CHARACTER is '%/44/'
	require_keyword_code: CHARACTER is '%/45/'
	rescue_keyword_code: CHARACTER is '%/46/'
	result_keyword_code: CHARACTER is '%/47/'
	retry_keyword_code: CHARACTER is '%/48/'
	select_keyword_code: CHARACTER is '%/49/'
	separate_keyword_code: CHARACTER is '%/50/'
	strip_keyword_code: CHARACTER is '%/51/'
	then_keyword_code: CHARACTER is '%/52/'
	true_keyword_code: CHARACTER is '%/53/'
	undefine_keyword_code: CHARACTER is '%/54/'
	unique_keyword_code: CHARACTER is '%/55/'
	until_keyword_code: CHARACTER is '%/56/'
	variant_keyword_code: CHARACTER is '%/57/'
	void_keyword_code: CHARACTER is '%/61/'
	when_keyword_code: CHARACTER is '%/58/'
			-- Eiffel keyword codes

	arrow_symbol_code: CHARACTER is '%/71/'
	assign_symbol_code: CHARACTER is '%/72/'
	assign_attempt_symbol_code: CHARACTER is '%/73/'
	bang_symbol_code: CHARACTER is '%/74/'
	colon_symbol_code: CHARACTER is '%/75/'
	comma_symbol_code: CHARACTER is '%/76/'
	dollar_symbol_code: CHARACTER is '%/77/'
	dot_symbol_code: CHARACTER is '%/78/'
	dotdot_symbol_code: CHARACTER is '%/79/'
	equal_symbol_code: CHARACTER is '%/80/'
	left_array_symbol_code: CHARACTER is '%/81/'
	left_brace_symbol_code: CHARACTER is '%/82/'
	left_bracket_symbol_code: CHARACTER is '%/83/'
	left_parenthesis_symbol_code: CHARACTER is '%/84/'
	not_equal_symbol_code: CHARACTER is '%/85/'
	question_mark_symbol_code: CHARACTER is '%/86/'
	right_array_symbol_code: CHARACTER is '%/87/'
	right_brace_symbol_code: CHARACTER is '%/88/'
	right_bracket_symbol_code: CHARACTER is '%/89/'
	right_parenthesis_symbol_code: CHARACTER is '%/90/'
	semicolon_symbol_code: CHARACTER is '%/91/'
	tilde_symbol_code: CHARACTER is '%/92/'
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
			-- Full code for built-in feature from class ANY
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
			-- Codes for built-in features from class ANY

	builtin_special_feature (a_feature_code: INTEGER): INTEGER is
			-- Full code for built-in feature from class SPECIAL
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
			-- Codes for built-in features from class SPECIAL

	builtin_character_feature (a_feature_code: INTEGER): INTEGER is
			-- Full code for built-in feature from class CHARACTER
		do
			Result := builtin_character_class * builtin_capacity + a_feature_code
		end

	builtin_character_class: INTEGER is 3
	builtin_character_item: INTEGER is 1
	builtin_character_set_item: INTEGER is 2
	builtin_character_code: INTEGER is 3
			-- Codes for built-in features from class CHARACTER

	builtin_boolean_feature (a_feature_code: INTEGER): INTEGER is
			-- Full code for built-in feature from class BOOLEAN
		do
			Result := builtin_boolean_class * builtin_capacity + a_feature_code
		end

	builtin_boolean_class: INTEGER is 4
	builtin_boolean_item: INTEGER is 1
	builtin_boolean_set_item: INTEGER is 2
	builtin_boolean_and: INTEGER is 3
	builtin_boolean_or: INTEGER is 4
	builtin_boolean_xor: INTEGER is 5
	builtin_boolean_not: INTEGER is 6
	builtin_boolean_and_then: INTEGER is 7
	builtin_boolean_or_else: INTEGER is 8
	builtin_boolean_implies: INTEGER is 9
			-- Codes for built-in features from class BOOLEAN

	builtin_integer_feature (a_feature_code: INTEGER): INTEGER is
			-- Full code for built-in feature from class INTEGER
		do
			Result := builtin_integer_class * builtin_capacity + a_feature_code
		end

	builtin_integer_class: INTEGER is 5
	builtin_integer_8_class: INTEGER is 6
	builtin_integer_16_class: INTEGER is 7
	builtin_integer_64_class: INTEGER is 8
	builtin_natural_8_class: INTEGER is 9
	builtin_natural_16_class: INTEGER is 10
	builtin_natural_32_class: INTEGER is 11
	builtin_natural_64_class: INTEGER is 12
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
	builtin_integer_to_character: INTEGER is 31
			-- Codes for built-in features from class INTEGER

	builtin_real_feature (a_feature_code: INTEGER): INTEGER is
			-- Full code for built-in feature from class REAL
		do
			Result := builtin_real_class * builtin_capacity + a_feature_code
		end

	builtin_real_class: INTEGER is 13
	builtin_double_class: INTEGER is 14
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
			-- Codes for built-in features from class REAL

	builtin_pointer_feature (a_feature_code: INTEGER): INTEGER is
			-- Full code for built-in feature from class POINTER
		do
			Result := builtin_pointer_class * builtin_capacity + a_feature_code
		end

	builtin_pointer_class: INTEGER is 15
	builtin_pointer_item: INTEGER is 1
	builtin_pointer_set_item: INTEGER is 2
	builtin_pointer_plus: INTEGER is 3
	builtin_pointer_to_integer_32: INTEGER is 4
	builtin_pointer_out: INTEGER is 5
	builtin_pointer_hash_code: INTEGER is 6
			-- Codes for built-in features from class POINTER

	builtin_arguments_feature (a_feature_code: INTEGER): INTEGER is
			-- Full code for built-in feature from class ARGUMENTS
		do
			Result := builtin_arguments_class * builtin_capacity + a_feature_code
		end

	builtin_arguments_class: INTEGER is 16
	builtin_arguments_argument: INTEGER is 1
	builtin_arguments_argument_count: INTEGER is 2

	builtin_function_item: INTEGER is 5001
	builtin_routine_call: INTEGER is 5101
			-- Built-in feature codes

end
