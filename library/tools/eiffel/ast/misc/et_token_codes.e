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
	alias_minus_code: CHARACTER is '%/21/'
	alias_plus_code: CHARACTER is '%/22/'
	alias_freeop_code: CHARACTER is '%/23/'
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
	builtin_any_twin: INTEGER is 2
	builtin_function_item: INTEGER is 3
	builtin_routine_call: INTEGER is 4
			-- Built-in feature codes

end
