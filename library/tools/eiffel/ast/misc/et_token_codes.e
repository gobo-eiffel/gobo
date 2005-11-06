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
	builtin_any_twin: INTEGER is 101
	builtin_any_standard_copy: INTEGER is 102
	builtin_any_standard_is_equal: INTEGER is 103
	builtin_any_same_type: INTEGER is 104
	builtin_any_generating_type: INTEGER is 105
	builtin_any_generator: INTEGER is 106
	builtin_any_conforms_to: INTEGER is 107
	builtin_any_is_deep_equal: INTEGER is 108
	builtin_any_tagged_out: INTEGER is 109
	builtin_any_standard_twin: INTEGER is 110
	builtin_any_deep_twin: INTEGER is 111
	builtin_special_make: INTEGER is 201
	builtin_special_item: INTEGER is 202
	builtin_special_put: INTEGER is 203
	builtin_special_count: INTEGER is 204
	builtin_special_element_size: INTEGER is 205
	builtin_special_aliased_resized_area: INTEGER is 206
	builtin_character_code: INTEGER is 301
	builtin_character_lt: INTEGER is 302
	builtin_character_gt: INTEGER is 303
	builtin_character_le: INTEGER is 304
	builtin_character_ge: INTEGER is 305
	builtin_integer_plus: INTEGER is 401
	builtin_integer_minus: INTEGER is 402
	builtin_integer_times: INTEGER is 403
	builtin_integer_divide: INTEGER is 404
	builtin_integer_div: INTEGER is 405
	builtin_integer_mod: INTEGER is 406
	builtin_integer_opposite: INTEGER is 407
	builtin_integer_lt: INTEGER is 408
	builtin_integer_to_character: INTEGER is 409
	builtin_integer_bit_or: INTEGER is 410
	builtin_integer_bit_shift_left: INTEGER is 411
	builtin_integer_gt: INTEGER is 412
	builtin_integer_le: INTEGER is 413
	builtin_integer_ge: INTEGER is 414
	builtin_boolean_and_then: INTEGER is 501
	builtin_boolean_or_else: INTEGER is 502
	builtin_boolean_implies: INTEGER is 503
	builtin_boolean_and: INTEGER is 504
	builtin_boolean_or: INTEGER is 505
	builtin_boolean_xor: INTEGER is 506
	builtin_boolean_not: INTEGER is 507
	builtin_boolean_item: INTEGER is 508
	builtin_boolean_set_item: INTEGER is 509
	builtin_function_item: INTEGER is 1001
	builtin_routine_call: INTEGER is 1101
			-- Built-in feature codes

end
