indexing

	description:

		"Eiffel token and symbol constants"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_TOKEN_CONSTANTS

feature -- Symbols

	symbol: ET_SYMBOL is
			-- Dummy symbol
		once
			!! Result.make
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

	class_keyword: ET_KEYWORD is
			-- 'class' keyword
		once
			!! Result.make (class_keyword_name)
		ensure
			keyword_not_void: Result /= Void
		end

	create_keyword: ET_KEYWORD is
			-- 'create' keyword
		once
			!! Result.make (create_keyword_name)
		ensure
			keyword_not_void: Result /= Void
		end

	creation_keyword: ET_KEYWORD is
			-- 'creation' keyword
		once
			!! Result.make (creation_keyword_name)
		ensure
			keyword_not_void: Result /= Void
		end

	debug_keyword: ET_KEYWORD is
			-- 'debug' keyword
		once
			!! Result.make (debug_keyword_name)
		ensure
			keyword_not_void: Result /= Void
		end

	deferred_keyword: ET_DEFERRED_KEYWORD is
			-- 'deferred' keyword
		once
			!! Result.make (deferred_keyword_name)
		ensure
			keyword_not_void: Result /= Void
		end

	end_keyword: ET_KEYWORD is
			-- 'end' keyword
		once
			!! Result.make (end_keyword_name)
		ensure
			keyword_not_void: Result /= Void
		end

	export_keyword: ET_KEYWORD is
			-- 'export' keyword
		once
			!! Result.make (export_keyword_name)
		ensure
			keyword_not_void: Result /= Void
		end

	feature_keyword: ET_KEYWORD is
			-- 'feature' keyword
		once
			!! Result.make (feature_keyword_name)
		ensure
			keyword_not_void: Result /= Void
		end

	indexing_keyword: ET_KEYWORD is
			-- 'indexing' keyword
		once
			!! Result.make (indexing_keyword_name)
		ensure
			keyword_not_void: Result /= Void
		end

	inherit_keyword: ET_KEYWORD is
			-- 'inherit' keyword
		once
			!! Result.make (inherit_keyword_name)
		ensure
			keyword_not_void: Result /= Void
		end

	is_keyword: ET_KEYWORD is
			-- 'is' keyword
		once
			!! Result.make (is_keyword_name)
		ensure
			keyword_not_void: Result /= Void
		end

	local_keyword: ET_KEYWORD is
			-- 'local' keyword
		once
			!! Result.make (local_keyword_name)
		ensure
			keyword_not_void: Result /= Void
		end

	rename_keyword: ET_KEYWORD is
			-- 'rename' keyword
		once
			!! Result.make (rename_keyword_name)
		ensure
			keyword_not_void: Result /= Void
		end

	strip_keyword: ET_KEYWORD is
			-- 'strip' keyword
		once
			!! Result.make (strip_keyword_name)
		ensure
			keyword_not_void: Result /= Void
		end

	unique_keyword: ET_KEYWORD is
			-- 'unique' keyword
		once
			!! Result.make (unique_keyword_name)
		ensure
			keyword_not_void: Result /= Void
		end

feature -- Keyword and symbol names

	capitalized_current_keyword_name: STRING is "Current"
	capitalized_false_keyword_name: STRING is "False"
	capitalized_precursor_keyword_name: STRING is "Precursor"
	capitalized_result_keyword_name: STRING is "Result"
	capitalized_true_keyword_name: STRING is "True"
	capitalized_unique_keyword_name: STRING is "Unique"
			-- Eiffel keyword names with first letter in upper-case

	agent_keyword_name: STRING is "agent"
	alias_keyword_name: STRING is "alias"
	all_keyword_name: STRING is "all"
	and_keyword_name: STRING is "and"
	as_keyword_name: STRING is "as"
	check_keyword_name: STRING is "check"
	class_keyword_name: STRING is "class"
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
	precursor_keyword_name: STRING is "precursor"
	prefix_keyword_name: STRING is "prefix"
	redefine_keyword_name: STRING is "redefine"
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
	when_keyword_name: STRING is "when"
	xor_keyword_name: STRING is "xor"
			-- Eiffel keyword names

	arrow_symbol_name: STRING is "->"
	assign_symbol_name: STRING is ":="
	assign_attempt_symbol_name: STRING is "?="
	bang_symbol_name: STRING is "!"
	bangbang_symbol_name: STRING is "!!"
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
	times_symbol_name: STRING is "*"
			-- Eiffel symbol names

feature -- Nodes

	clients: ET_CLIENTS is
		once
		end

end
