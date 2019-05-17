note

	description:

		"Eiffel token and symbol codes"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_TOKEN_CODES

feature -- Keyword and symbol codes

	infix_div_code: CHARACTER = '%/71/'
	infix_divide_code: CHARACTER = '%/72/'
	infix_ge_code: CHARACTER = '%/73/'
	infix_gt_code: CHARACTER = '%/74/'
	infix_le_code: CHARACTER = '%/75/'
	infix_lt_code: CHARACTER = '%/76/'
	infix_minus_code: CHARACTER = '%/77/'
	infix_mod_code: CHARACTER = '%/78/'
	infix_plus_code: CHARACTER = '%/79/'
	infix_power_code: CHARACTER = '%/80/'
	infix_times_code: CHARACTER = '%/81/'
	infix_freeop_code: CHARACTER = '%/82/'
	infix_dotdot_code: CHARACTER = '%/83/'
	infix_and_code: CHARACTER = '%/84/'
	infix_implies_code: CHARACTER = '%/85/'
	infix_or_code: CHARACTER = '%/86/'
	infix_xor_code: CHARACTER = '%/87/'
	infix_and_then_code: CHARACTER = '%/88/'
	infix_or_else_code: CHARACTER = '%/89/'
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

	min_keyword_code: CHARACTER = '%/84/'
	max_keyword_code: CHARACTER = '%/91/'
			-- Keyword operator codes

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

	builtin_not_builtin: NATURAL_8 = 0
	builtin_unknown: NATURAL_8 = 1
	builtin_any_class: NATURAL_8 = 2
	builtin_arguments_32_class: NATURAL_8 = 3
	builtin_boolean_class: NATURAL_8 = 4
	builtin_boolean_ref_class: NATURAL_8 = 5
	builtin_character_8_class: NATURAL_8 = 6
	builtin_character_8_ref_class: NATURAL_8 = 7
	builtin_character_32_class: NATURAL_8 = 8
	builtin_character_32_ref_class: NATURAL_8 = 9
	builtin_com_failure_class: NATURAL_8 = 10
	builtin_exception_manager_class: NATURAL_8 = 11
	builtin_exception_manager_factory_class: NATURAL_8 = 12
	builtin_function_class: NATURAL_8 = 13
	builtin_identified_routines_class: NATURAL_8 = 14
	builtin_integer_8_class: NATURAL_8 = 15
	builtin_integer_8_ref_class: NATURAL_8 = 16
	builtin_integer_16_class: NATURAL_8 = 17
	builtin_integer_16_ref_class: NATURAL_8 = 18
	builtin_integer_32_class: NATURAL_8 = 19
	builtin_integer_32_ref_class: NATURAL_8 = 20
	builtin_integer_64_class: NATURAL_8 = 21
	builtin_integer_64_ref_class: NATURAL_8 = 22
	builtin_ise_exception_manager_class: NATURAL_8 = 23
	builtin_ise_runtime_class: NATURAL_8 = 24
	builtin_memory_class: NATURAL_8 = 25
	builtin_natural_8_class: NATURAL_8 = 26
	builtin_natural_8_ref_class: NATURAL_8 = 27
	builtin_natural_16_class: NATURAL_8 = 28
	builtin_natural_16_ref_class: NATURAL_8 = 29
	builtin_natural_32_class: NATURAL_8 = 30
	builtin_natural_32_ref_class: NATURAL_8 = 31
	builtin_natural_64_class: NATURAL_8 = 32
	builtin_natural_64_ref_class: NATURAL_8 = 33
	builtin_platform_class: NATURAL_8 = 34
	builtin_pointer_class: NATURAL_8 = 35
	builtin_pointer_ref_class: NATURAL_8 = 36
	builtin_procedure_class: NATURAL_8 = 37
	builtin_real_32_class: NATURAL_8 = 38
	builtin_real_32_ref_class: NATURAL_8 = 39
	builtin_real_64_class: NATURAL_8 = 40
	builtin_real_64_ref_class: NATURAL_8 = 41
	builtin_special_class: NATURAL_8 = 42
	builtin_tuple_class: NATURAL_8 = 43
	builtin_type_class: NATURAL_8 = 44
			-- Code for classes of built-in features	

	builtin_any_conforms_to: NATURAL_8 = 1
	builtin_any_deep_twin: NATURAL_8 = 2
	builtin_any_generating_type: NATURAL_8 = 3
	builtin_any_generator: NATURAL_8 = 4
	builtin_any_is_deep_equal: NATURAL_8 = 5
	builtin_any_is_equal: NATURAL_8 = 6
	builtin_any_same_type: NATURAL_8 = 7
	builtin_any_standard_is_equal: NATURAL_8 = 8
	builtin_any_standard_twin: NATURAL_8 = 9
	builtin_any_tagged_out: NATURAL_8 = 10
	builtin_any_twin: NATURAL_8 = 11
			-- Codes for built-in functions from class "ANY"

	builtin_any_copy: NATURAL_8 = 12
	builtin_any_standard_copy: NATURAL_8 = 13
			-- Codes for built-in procedures from class "ANY"

	builtin_arguments_32_argument_count: NATURAL_8 = 1
	builtin_arguments_32_i_th_argument_pointer: NATURAL_8 = 2
	builtin_arguments_32_i_th_argument_string: NATURAL_8 = 3
			-- Codes for built-in functions from class "ARGUMENTS_32"

	builtin_boolean_and: NATURAL_8 = 1
	builtin_boolean_and_then: NATURAL_8 = 2
	builtin_boolean_implies: NATURAL_8 = 3
	builtin_boolean_not: NATURAL_8 = 4
	builtin_boolean_or: NATURAL_8 = 5
	builtin_boolean_or_else: NATURAL_8 = 6
	builtin_boolean_xor: NATURAL_8 = 7
			-- Codes for built-in functions from class "BOOLEAN"

	builtin_boolean_ref_item: NATURAL_8 = 1
			-- Codes for built-in functions from class "BOOLEAN_REF"

	builtin_boolean_ref_set_item: NATURAL_8 = 2
			-- Codes for built-in procedures from class "BOOLEAN_REF"

	builtin_character_n_code: NATURAL_8 = 1
	builtin_character_n_natural_32_code: NATURAL_8 = 2
	builtin_character_n_to_character_8: NATURAL_8 = 3
	builtin_character_n_to_character_32: NATURAL_8 = 4
			-- Codes for built-in functions from class "CHARACTER_N"

	builtin_character_n_ref_item: NATURAL_8 = 1
			-- Codes for built-in functions from class "CHARACTER_N_REF"

	builtin_character_n_ref_set_item: NATURAL_8 = 2
			-- Codes for built-in procedures from class "CHARACTER_N_REF"

	builtin_com_failure_c_strlen: NATURAL_8 = 1
	builtin_com_failure_ccom_hresult: NATURAL_8 = 2
	builtin_com_failure_ccom_hresult_code: NATURAL_8 = 3
	builtin_com_failure_ccom_hresult_facility: NATURAL_8 = 4
	builtin_com_failure_character_size: NATURAL_8 = 5
	builtin_com_failure_cwin_error_text: NATURAL_8 = 6
			-- Codes for built-in functions from class "COM_FAILURE"

	builtin_com_failure_cwin_local_free: NATURAL_8 = 7
			-- Codes for built-in procedures from class "COM_FAILURE"

	builtin_exception_manager_exception_from_code: NATURAL_8 = 1
	builtin_exception_manager_is_caught: NATURAL_8 = 2
	builtin_exception_manager_is_ignorable: NATURAL_8 = 3
	builtin_exception_manager_is_ignored: NATURAL_8 = 4
	builtin_exception_manager_is_raisable: NATURAL_8 = 5
	builtin_exception_manager_last_exception: NATURAL_8 = 6
	builtin_exception_manager_type_of_code: NATURAL_8 = 7
			-- Codes for built-in functions from class "EXCEPTION_MANAGER"

	builtin_exception_manager_catch: NATURAL_8 = 8
	builtin_exception_manager_ignore: NATURAL_8 = 9
	builtin_exception_manager_raise: NATURAL_8 = 10
	builtin_exception_manager_set_is_ignored: NATURAL_8 = 11
			-- Codes for built-in procedures from class "EXCEPTION_MANAGER"

	builtin_exception_manager_factory_exception_manager: NATURAL_8 = 1
			-- Codes for built-in functions from class "EXCEPTION_MANAGER_FACTORY"

	builtin_function_fast_item: NATURAL_8 = 1
	builtin_function_item: NATURAL_8 = 2
			-- Codes for built-in functions from class "FUNCTION"

	builtin_identified_routines_eif_id_object: NATURAL_8 = 1
	builtin_identified_routines_eif_object_id: NATURAL_8 = 2
			-- Codes for built-in procedures from class "IDENTIFIED_ROUTINES"

	builtin_identified_routines_eif_object_id_free: NATURAL_8 = 3
			-- Codes for built-in procedures from class "IDENTIFIED_ROUTINES"

	builtin_integer_n_as_integer_8: NATURAL_8 = 1
	builtin_integer_n_as_integer_16: NATURAL_8 = 2
	builtin_integer_n_as_integer_32: NATURAL_8 = 3
	builtin_integer_n_as_integer_64: NATURAL_8 = 4
	builtin_integer_n_as_natural_8: NATURAL_8 = 5
	builtin_integer_n_as_natural_16: NATURAL_8 = 6
	builtin_integer_n_as_natural_32: NATURAL_8 = 7
	builtin_integer_n_as_natural_64: NATURAL_8 = 8
	builtin_integer_n_bit_and: NATURAL_8 = 9
	builtin_integer_n_bit_not: NATURAL_8 = 10
	builtin_integer_n_bit_or: NATURAL_8 = 11
	builtin_integer_n_bit_shift_left: NATURAL_8 = 12
	builtin_integer_n_bit_shift_right: NATURAL_8 = 13
	builtin_integer_n_bit_xor: NATURAL_8 = 14
	builtin_integer_n_identity: NATURAL_8 = 15
	builtin_integer_n_integer_quotient: NATURAL_8 = 16
	builtin_integer_n_integer_remainder: NATURAL_8 = 17
	builtin_integer_n_is_less: NATURAL_8 = 18
	builtin_integer_n_minus: NATURAL_8 = 19
	builtin_integer_n_opposite: NATURAL_8 = 20
	builtin_integer_n_plus: NATURAL_8 = 21
	builtin_integer_n_power: NATURAL_8 = 22
	builtin_integer_n_product: NATURAL_8 = 23
	builtin_integer_n_quotient: NATURAL_8 = 24
	builtin_integer_n_to_character_8: NATURAL_8 = 25
	builtin_integer_n_to_character_32: NATURAL_8 = 26
	builtin_integer_n_to_double: NATURAL_8 = 27
	builtin_integer_n_to_real: NATURAL_8 = 28
	builtin_integer_n_to_real_32: NATURAL_8 = 29
	builtin_integer_n_to_real_64: NATURAL_8 = 30
			-- Codes for built-in functions from class "INTEGER_N" and "NATURAL_N"

	builtin_integer_n_ref_item: NATURAL_8 = 1
			-- Codes for built-in functions from classes "INTEGER_N_REF" and "NATURAL_N_REF"

	builtin_integer_n_ref_set_item: NATURAL_8 = 2
			-- Codes for built-in procedures from classes "INTEGER_N_REF" and "NATURAL_N_REF"

	builtin_ise_exception_manager_developer_raise: NATURAL_8 = 1
			-- Codes for built-in procedures from class "ISE_EXCEPTION_MANAGER"

	builtin_ise_runtime_attached_type: NATURAL_8 = 1
	builtin_ise_runtime_boolean_field: NATURAL_8 = 2
	builtin_ise_runtime_boolean_field_at: NATURAL_8 = 3
	builtin_ise_runtime_character_8_field: NATURAL_8 = 4
	builtin_ise_runtime_character_8_field_at: NATURAL_8 = 5
	builtin_ise_runtime_character_32_field: NATURAL_8 = 6
	builtin_ise_runtime_character_32_field_at: NATURAL_8 = 7
	builtin_ise_runtime_check_assert: NATURAL_8 = 8
	builtin_ise_runtime_compiler_version: NATURAL_8 = 9
	builtin_ise_runtime_detachable_type: NATURAL_8 = 10
	builtin_ise_runtime_dynamic_type: NATURAL_8 = 11
	builtin_ise_runtime_dynamic_type_at_offset: NATURAL_8 = 12
	builtin_ise_runtime_eif_gen_param_id: NATURAL_8 = 13
	builtin_ise_runtime_field_count_of_type: NATURAL_8 = 14
	builtin_ise_runtime_field_name_of_type: NATURAL_8 = 15
	builtin_ise_runtime_field_offset_of_type: NATURAL_8 = 16
	builtin_ise_runtime_field_static_type_of_type: NATURAL_8 = 17
	builtin_ise_runtime_field_type_of_type: NATURAL_8 = 18
	builtin_ise_runtime_generating_type_of_type: NATURAL_8 = 19
	builtin_ise_runtime_generator_of_type: NATURAL_8 = 20
	builtin_ise_runtime_generic_parameter_count: NATURAL_8 = 21
	builtin_ise_runtime_in_assertion: NATURAL_8 = 22
	builtin_ise_runtime_integer_8_field: NATURAL_8 = 23
	builtin_ise_runtime_integer_8_field_at: NATURAL_8 = 24
	builtin_ise_runtime_integer_16_field: NATURAL_8 = 25
	builtin_ise_runtime_integer_16_field_at: NATURAL_8 = 26
	builtin_ise_runtime_integer_32_field: NATURAL_8 = 27
	builtin_ise_runtime_integer_32_field_at: NATURAL_8 = 28
	builtin_ise_runtime_integer_64_field: NATURAL_8 = 29
	builtin_ise_runtime_integer_64_field_at: NATURAL_8 = 30
	builtin_ise_runtime_is_attached_type: NATURAL_8 = 31
	builtin_ise_runtime_is_copy_semantics_field: NATURAL_8 = 32
	builtin_ise_runtime_is_expanded: NATURAL_8 = 33
	builtin_ise_runtime_is_field_expanded_of_type: NATURAL_8 = 34
	builtin_ise_runtime_is_field_transient_of_type: NATURAL_8 = 35
	builtin_ise_runtime_is_object_marked: NATURAL_8 = 36
	builtin_ise_runtime_is_special: NATURAL_8 = 37
	builtin_ise_runtime_is_special_copy_semantics_item: NATURAL_8 = 38
	builtin_ise_runtime_is_special_of_expanded: NATURAL_8 = 39
	builtin_ise_runtime_is_special_of_reference: NATURAL_8 = 40
	builtin_ise_runtime_is_special_of_reference_or_basic_type: NATURAL_8 = 41
	builtin_ise_runtime_is_special_of_reference_type: NATURAL_8 = 42
	builtin_ise_runtime_is_tuple: NATURAL_8 = 43
	builtin_ise_runtime_is_tuple_type: NATURAL_8 = 44
	builtin_ise_runtime_natural_8_field: NATURAL_8 = 45
	builtin_ise_runtime_natural_8_field_at: NATURAL_8 = 46
	builtin_ise_runtime_natural_16_field: NATURAL_8 = 47
	builtin_ise_runtime_natural_16_field_at: NATURAL_8 = 48
	builtin_ise_runtime_natural_32_field: NATURAL_8 = 49
	builtin_ise_runtime_natural_32_field_at: NATURAL_8 = 50
	builtin_ise_runtime_natural_64_field: NATURAL_8 = 51
	builtin_ise_runtime_natural_64_field_at: NATURAL_8 = 52
	builtin_ise_runtime_new_instance_of: NATURAL_8 = 53
	builtin_ise_runtime_new_special_of_reference_instance_of: NATURAL_8 = 54
	builtin_ise_runtime_new_tuple_instance_of: NATURAL_8 = 55
	builtin_ise_runtime_new_type_instance_of: NATURAL_8 = 56
	builtin_ise_runtime_object_size: NATURAL_8 = 57
	builtin_ise_runtime_once_objects: NATURAL_8 = 58
	builtin_ise_runtime_persistent_field_count_of_type: NATURAL_8 = 59
	builtin_ise_runtime_pointer_field: NATURAL_8 = 60
	builtin_ise_runtime_pointer_field_at: NATURAL_8 = 61
	builtin_ise_runtime_pre_ecma_mapping_status: NATURAL_8 = 62
	builtin_ise_runtime_raw_reference_field_at: NATURAL_8 = 63
	builtin_ise_runtime_raw_reference_field_at_offset: NATURAL_8 = 64
	builtin_ise_runtime_real_32_field: NATURAL_8 = 65
	builtin_ise_runtime_real_32_field_at: NATURAL_8 = 66
	builtin_ise_runtime_real_64_field: NATURAL_8 = 67
	builtin_ise_runtime_real_64_field_at: NATURAL_8 = 68
	builtin_ise_runtime_reference_field: NATURAL_8 = 69
	builtin_ise_runtime_reference_field_at: NATURAL_8 = 70
	builtin_ise_runtime_reference_field_at_offset: NATURAL_8 = 71
	builtin_ise_runtime_storable_version_of_type: NATURAL_8 = 72
	builtin_ise_runtime_type_conforms_to: NATURAL_8 = 73
	builtin_ise_runtime_type_id_from_name: NATURAL_8 = 74
			-- Codes for built-in functions from class "ISE_RUNTIME"

	builtin_ise_runtime_lock_marking: NATURAL_8 = 75
	builtin_ise_runtime_mark_object: NATURAL_8 = 76
	builtin_ise_runtime_set_boolean_field: NATURAL_8 = 77
	builtin_ise_runtime_set_boolean_field_at: NATURAL_8 = 78
	builtin_ise_runtime_set_character_8_field: NATURAL_8 = 79
	builtin_ise_runtime_set_character_8_field_at: NATURAL_8 = 80
	builtin_ise_runtime_set_character_32_field: NATURAL_8 = 81
	builtin_ise_runtime_set_character_32_field_at: NATURAL_8 = 82
	builtin_ise_runtime_set_integer_8_field: NATURAL_8 = 83
	builtin_ise_runtime_set_integer_8_field_at: NATURAL_8 = 84
	builtin_ise_runtime_set_integer_16_field: NATURAL_8 = 85
	builtin_ise_runtime_set_integer_16_field_at: NATURAL_8 = 86
	builtin_ise_runtime_set_integer_32_field: NATURAL_8 = 87
	builtin_ise_runtime_set_integer_32_field_at: NATURAL_8 = 88
	builtin_ise_runtime_set_integer_64_field: NATURAL_8 = 89
	builtin_ise_runtime_set_integer_64_field_at: NATURAL_8 = 90
	builtin_ise_runtime_set_natural_8_field: NATURAL_8 = 91
	builtin_ise_runtime_set_natural_8_field_at: NATURAL_8 = 92
	builtin_ise_runtime_set_natural_16_field: NATURAL_8 = 93
	builtin_ise_runtime_set_natural_16_field_at: NATURAL_8 = 94
	builtin_ise_runtime_set_natural_32_field: NATURAL_8 = 95
	builtin_ise_runtime_set_natural_32_field_at: NATURAL_8 = 96
	builtin_ise_runtime_set_natural_64_field: NATURAL_8 = 97
	builtin_ise_runtime_set_natural_64_field_at: NATURAL_8 = 98
	builtin_ise_runtime_set_pointer_field: NATURAL_8 = 99
	builtin_ise_runtime_set_pointer_field_at: NATURAL_8 = 100
	builtin_ise_runtime_set_pre_ecma_mapping: NATURAL_8 = 101
	builtin_ise_runtime_set_real_32_field: NATURAL_8 = 102
	builtin_ise_runtime_set_real_32_field_at: NATURAL_8 = 103
	builtin_ise_runtime_set_real_64_field: NATURAL_8 = 104
	builtin_ise_runtime_set_real_64_field_at: NATURAL_8 = 105
	builtin_ise_runtime_set_reference_field: NATURAL_8 = 106
	builtin_ise_runtime_set_reference_field_at: NATURAL_8 = 107
	builtin_ise_runtime_unlock_marking: NATURAL_8 = 108
	builtin_ise_runtime_unmark_object: NATURAL_8 = 109
			-- Codes for built-in procedures from class "ISE_RUNTIME"

	builtin_memory_find_referers: NATURAL_8 = 1
			-- Codes for built-in functions from class "MEMORY"

	builtin_memory_free: NATURAL_8 = 2
			-- Codes for built-in procedures from class "MEMORY"

	builtin_platform_boolean_bytes: NATURAL_8 = 1
	builtin_platform_character_bytes: NATURAL_8 = 2
	builtin_platform_double_bytes: NATURAL_8 = 3
	builtin_platform_integer_bytes: NATURAL_8 = 4
	builtin_platform_is_64_bits: NATURAL_8 = 5
	builtin_platform_is_dotnet: NATURAL_8 = 6
	builtin_platform_is_mac: NATURAL_8 = 7
	builtin_platform_is_scoop_capable: NATURAL_8 = 8
	builtin_platform_is_thread_capable: NATURAL_8 = 9
	builtin_platform_is_unix: NATURAL_8 = 10
	builtin_platform_is_vms: NATURAL_8 = 11
	builtin_platform_is_vxworks: NATURAL_8 = 12
	builtin_platform_is_windows: NATURAL_8 = 13
	builtin_platform_pointer_bytes: NATURAL_8 = 14
	builtin_platform_real_bytes: NATURAL_8 = 15
	builtin_platform_wide_character_bytes: NATURAL_8 = 16
			-- Codes for built-in functions from class "PLATFORM"

	builtin_pointer_hash_code: NATURAL_8 = 1
	builtin_pointer_is_default_pointer: NATURAL_8 = 2
	builtin_pointer_out: NATURAL_8 = 3
	builtin_pointer_plus: NATURAL_8 = 4
	builtin_pointer_to_integer_32: NATURAL_8 = 5
			-- Codes for built-in functions from class "POINTER"

	builtin_pointer_ref_item: NATURAL_8 = 1
			-- Codes for built-in functions from class "POINTER_REF"

	builtin_pointer_ref_set_item: NATURAL_8 = 2
			-- Codes for built-in procedures from class "POINTER_REF"			

	builtin_procedure_call: NATURAL_8 = 1
	builtin_procedure_fast_call: NATURAL_8 = 2
			-- Codes for built-in procedures from class "PROCEDURE"

	builtin_real_n_ceiling_real_32: NATURAL_8 = 1
	builtin_real_n_ceiling_real_64: NATURAL_8 = 2
	builtin_real_n_floor_real_32: NATURAL_8 = 3
	builtin_real_n_floor_real_64: NATURAL_8 = 4
	builtin_real_n_identity: NATURAL_8 = 5
	builtin_real_n_ieee_is_equal: NATURAL_8 = 6
	builtin_real_n_ieee_is_greater: NATURAL_8 = 7
	builtin_real_n_ieee_is_greater_equal: NATURAL_8 = 8
	builtin_real_n_ieee_is_less: NATURAL_8 = 9
	builtin_real_n_ieee_is_less_equal: NATURAL_8 = 10
	builtin_real_n_ieee_maximum_number: NATURAL_8 = 11
	builtin_real_n_ieee_minimum_number: NATURAL_8 = 12
	builtin_real_n_is_less: NATURAL_8 = 13
	builtin_real_n_is_nan: NATURAL_8 = 14
	builtin_real_n_is_negative_infinity: NATURAL_8 = 15
	builtin_real_n_is_positive_infinity: NATURAL_8 = 16
	builtin_real_n_minus: NATURAL_8 = 17
	builtin_real_n_opposite: NATURAL_8 = 18
	builtin_real_n_out: NATURAL_8 = 19
	builtin_real_n_plus: NATURAL_8 = 20
	builtin_real_n_power: NATURAL_8 = 21
	builtin_real_n_product: NATURAL_8 = 22
	builtin_real_n_quotient: NATURAL_8 = 23
	builtin_real_n_to_double: NATURAL_8 = 24
	builtin_real_n_truncated_to_integer: NATURAL_8 = 25
	builtin_real_n_truncated_to_integer_64: NATURAL_8 = 26
	builtin_real_n_truncated_to_real: NATURAL_8 = 27
			-- Codes for built-in functions from classes "REAL_N"

	builtin_real_n_ref_item: NATURAL_8 = 1
	builtin_real_n_ref_nan: NATURAL_8 = 2
	builtin_real_n_ref_negative_infinity: NATURAL_8 = 3
	builtin_real_n_ref_positive_infinity: NATURAL_8 = 4
			-- Codes for built-in functions from classes "REAL_N_REF"

	builtin_real_n_ref_set_item: NATURAL_8 = 5
			-- Codes for built-in procedures from classes "REAL_N_REF"

	builtin_special_aliased_resized_area: NATURAL_8 = 1
	builtin_special_base_address: NATURAL_8 = 2
	builtin_special_capacity: NATURAL_8 = 3
	builtin_special_count: NATURAL_8 = 4
	builtin_special_element_size: NATURAL_8 = 5
	builtin_special_item: NATURAL_8 = 6
			-- Codes for built-in functions from class "SPECIAL"

	builtin_special_extend: NATURAL_8 = 7
	builtin_special_make_empty: NATURAL_8 = 8
	builtin_special_put: NATURAL_8 = 9
	builtin_special_set_count: NATURAL_8 = 10
			-- Codes for built-in procedures from class "SPECIAL"

	builtin_tuple_boolean_item: NATURAL_8 = 1
	builtin_tuple_character_8_item: NATURAL_8 = 2
	builtin_tuple_character_32_item: NATURAL_8 = 3
	builtin_tuple_count: NATURAL_8 = 4
	builtin_tuple_integer_8_item: NATURAL_8 = 5
	builtin_tuple_integer_16_item: NATURAL_8 = 6
	builtin_tuple_integer_32_item: NATURAL_8 = 7
	builtin_tuple_integer_64_item: NATURAL_8 = 8
	builtin_tuple_item_code: NATURAL_8 = 9
	builtin_tuple_natural_8_item: NATURAL_8 = 10
	builtin_tuple_natural_16_item: NATURAL_8 = 11
	builtin_tuple_natural_32_item: NATURAL_8 = 12
	builtin_tuple_natural_64_item: NATURAL_8 = 13
	builtin_tuple_object_comparison: NATURAL_8 = 14
	builtin_tuple_pointer_item: NATURAL_8 = 15
	builtin_tuple_real_32_item: NATURAL_8 = 16
	builtin_tuple_real_64_item: NATURAL_8 = 17
			-- Codes for built-in functions from class "TUPLE"

	builtin_tuple_put_boolean: NATURAL_8 = 18
	builtin_tuple_put_character_8: NATURAL_8 = 19
	builtin_tuple_put_character_32: NATURAL_8 = 20
	builtin_tuple_put_integer_8: NATURAL_8 = 21
	builtin_tuple_put_integer_16: NATURAL_8 = 22
	builtin_tuple_put_integer_32: NATURAL_8 = 23
	builtin_tuple_put_integer_64: NATURAL_8 = 24
	builtin_tuple_put_natural_8: NATURAL_8 = 25
	builtin_tuple_put_natural_16: NATURAL_8 = 26
	builtin_tuple_put_natural_32: NATURAL_8 = 27
	builtin_tuple_put_natural_64: NATURAL_8 = 28
	builtin_tuple_put_pointer: NATURAL_8 = 29
	builtin_tuple_put_real_32: NATURAL_8 = 30
	builtin_tuple_put_real_64: NATURAL_8 = 31
	builtin_tuple_put_reference: NATURAL_8 = 32
	builtin_tuple_reference_item: NATURAL_8 = 33
	builtin_tuple_set_object_comparison: NATURAL_8 = 34
			-- Codes for built-in procedures from class "TUPLE"

	builtin_type_default: NATURAL_8 = 1
	builtin_type_generic_parameter_type: NATURAL_8 = 2
	builtin_type_generic_parameter_count: NATURAL_8 = 3
	builtin_type_has_default: NATURAL_8 = 4
	builtin_type_is_attached: NATURAL_8 = 5
	builtin_type_is_deferred: NATURAL_8 = 6
	builtin_type_is_expanded: NATURAL_8 = 7
	builtin_type_runtime_name: NATURAL_8 = 8
	builtin_type_type_id: NATURAL_8 = 9
			-- Codes for built-in functions from class "TYPE"

end
