indexing

	description:

		"Scanner skeletons for Eiffel parsers"

	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999-2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class ET_EIFFEL_SCANNER_SKELETON

inherit

	YY_COMPRESSED_SCANNER_SKELETON
		rename
			make as make_compressed_scanner_skeleton,
			reset as reset_compressed_scanner_skeleton,
			text as skeleton_text,
			text_substring as skeleton_text_substring
		end

	ET_EIFFEL_TOKENS
		export {NONE} all end

	UT_CHARACTER_CODES
		export {NONE} all end

	KL_IMPORTED_INTEGER_ROUTINES
	KL_IMPORTED_STRING_ROUTINES
	KL_SHARED_PLATFORM
	ET_SHARED_TOKEN_CONSTANTS

feature {NONE} -- Initialization

	make (a_filename: STRING; an_error_handler: like error_handler) is
			-- Create a new Eiffel scanner.
		require
			a_filename_not_void: a_filename /= Void
			an_error_handler_not_void: an_error_handler /= Void
		local
			a_factory: ET_AST_FACTORY
		do
			!! a_factory.make
			make_with_factory (a_filename, a_factory, an_error_handler)
		ensure
			filename_set: filename = a_filename
			error_handler_set: error_handler = an_error_handler
		end

	make_with_factory (a_filename: STRING; a_factory: like ast_factory; an_error_handler: like error_handler) is
			-- Create a new Eiffel scanner.
		require
			a_filename_not_void: a_filename /= Void
			a_factory_not_void: a_factory /= Void
			an_error_handler_not_void: an_error_handler /= Void
		do
			make_with_buffer (Empty_buffer)
			filename := a_filename
			ast_factory := a_factory
			error_handler := an_error_handler
		ensure
			filename_set: filename = a_filename
			ast_factory_set: ast_factory = a_factory
			error_handler_set: error_handler = an_error_handler
		end

feature -- Initialization

	reset is
			-- Reset scanner before scanning next input.
		do
			reset_compressed_scanner_skeleton
			verbatim_marker := Void
			verbatim_open_white_characters := Void
			last_class := Void
		end

feature -- Access

	filename: STRING
			-- Name of file being parsed

	last_class: ET_CLASS
			-- Class being parsed

	last_value: ANY
			-- Semantic value to be passed to the parser

	current_position: ET_POSITION is
			-- Current position
			-- (Create a new object at each call.)
		do
			!ET_FILE_POSITION! Result.make (filename, line, column)
		ensure
			current_position_not_void: Result /= Void
		end

	ast_factory: ET_AST_FACTORY
			-- Abstract Syntax Tree factory

	error_handler: ET_ERROR_HANDLER
			-- Error handler

feature -- Status report

	use_create_keyword: BOOLEAN
			-- Should `create' be considered as
			-- a keyword (otherwise identifier)?

	use_reference_keyword: BOOLEAN
			-- Should `reference' be considered as
			-- a keyword (otherwise identifier)?

	keep_all_breaks: BOOLEAN
			-- Should the generated AST be decorated with
			-- breaks and comments?

	keep_all_comments: BOOLEAN
			-- Should the generated AST be decorated with comments?

	keep_header_comments: BOOLEAN
			-- Should the generated AST be decorated with feature
			-- and feature_clause header comments?

feature -- Statut setting

	set_use_create_keyword (b: BOOLEAN) is
			-- Set `use_create_keyword' to `b'.
		do
			use_create_keyword := b
		ensure
			use_create_keyword_set: use_create_keyword = b
		end

	set_use_reference_keyword (b: BOOLEAN) is
			-- Set `use_reference_keyword' to `b'.
		do
			use_reference_keyword := b
		ensure
			use_reference_keyword_set: use_reference_keyword = b
		end

feature {NONE} -- AST factory

	new_bit_constant (a_literal: STRING): ET_BIT_CONSTANT is
			-- New bit constant
		require
			a_literal_not_void: a_literal /= Void
			-- valid_literal: regexp: [0-1]+[bB]
		do
			Result := ast_factory.new_bit_constant (a_literal, line, column)
		ensure
			bit_constant_not_void: Result /= Void
		end

	new_c2_character_constant (a_value: CHARACTER): ET_CHARACTER_CONSTANT is
			-- New character constant of the form '%A'
		do
			Result := ast_factory.new_c2_character_constant (a_value, line, column)
		ensure
			character_constant_not_void: Result /= Void
		end

	new_c3_character_constant (a_literal: STRING): ET_CHARACTER_CONSTANT is
			-- New character constant of the form '%/code/`'
		require
			a_literal_not_void: a_literal /= Void
			-- valid_literal: regexp: [0-9]+
		do
			Result := ast_factory.new_c3_character_constant (a_literal, line, column)
		ensure
			character_constant_not_void: Result /= Void
		end

	new_character_constant (a_value: CHARACTER): ET_CHARACTER_CONSTANT is
			-- New character constant of the form 'A'
		do
			Result := ast_factory.new_c1_character_constant (a_value, line, column)
		ensure
			character_constant_not_void: Result /= Void
		end

	new_current (a_text: STRING): ET_CURRENT is
			-- New current entity
		require
			a_text_not_void: a_text /= Void
			a_text_not_empty: a_text.count > 0
		do
			Result := ast_factory.new_current (a_text, line, column)
		ensure
			current_not_void: Result /= Void
		end

	new_equal_symbol: ET_EQUAL_SYMBOL is
			-- New '=' symbol
		do
			Result := ast_factory.new_equal_symbol (line, column)
		ensure
			equal_symbol_not_void: Result /= Void
		end

	new_expanded_mark (a_text: STRING): ET_EXPANDED_MARK is
			-- New 'expanded' keyword
		require
			a_text_not_void: a_text /= Void
			a_text_not_empty: a_text.count > 0
		do
			Result := ast_factory.new_expanded_mark (a_text, line, column)
		ensure
			expanded_mark_not_void: Result /= Void
		end

	new_false_constant (a_text: STRING): ET_FALSE_CONSTANT is
			-- New False constant
		require
			a_text_not_void: a_text /= Void
			a_text_not_empty: a_text.count > 0
		do
			Result := ast_factory.new_false_constant (a_text, line, column)
		ensure
			false_constant_not_void: Result /= Void
		end

	new_free_operator (a_string: STRING): ET_FREE_OPERATOR is
			-- New free operator
		require
			a_string_not_void: a_string /= Void
			a_string_not_empty: a_string.count > 0
		do
			Result := ast_factory.new_free_operator (a_string, line, column)
		ensure
			free_operator_not_void: Result /= Void
			is_prefix: Result.is_prefix
		end

	new_identifier (a_text: STRING): ET_IDENTIFIER is
			-- New identifier
		require
			a_text_not_void: a_text /= Void
			a_text_not_empty: a_text.count > 0
		do
			Result := ast_factory.new_identifier (a_text, line, column)
		ensure
			identifier_not_void: Result /= Void
		end

	new_infix_and_operator (a_text: STRING): ET_INFIX_AND_OPERATOR is
			-- New binary "and" operator
		require
			a_text_not_void: a_text /= Void
			a_text_not_empty: a_text.count > 0
		do
			Result := ast_factory.new_infix_and_operator (a_text, line, column)
		ensure
			infix_and_operator_not_void: Result /= Void
		end

	new_infix_div_operator: ET_INFIX_DIV_OPERATOR is
			-- New binary "//" operator
		do
			Result := ast_factory.new_infix_div_operator (line, column)
		ensure
			infix_div_operator_not_void: Result /= Void
		end

	new_infix_divide_operator: ET_INFIX_DIVIDE_OPERATOR is
			-- New binary "//" operator
		do
			Result := ast_factory.new_infix_divide_operator (line, column)
		ensure
			infix_divide_operator_not_void: Result /= Void
		end

	new_infix_ge_operator: ET_INFIX_GE_OPERATOR is
			-- New binary ">=" operator
		do
			Result := ast_factory.new_infix_ge_operator (line, column)
		ensure
			infix_ge_operator_not_void: Result /= Void
		end

	new_infix_gt_operator: ET_INFIX_GT_OPERATOR is
			-- New binary ">" operator
		do
			Result := ast_factory.new_infix_gt_operator (line, column)
		ensure
			infix_gt_operator_not_void: Result /= Void
		end

	new_infix_implies_operator (a_text: STRING): ET_INFIX_IMPLIES_OPERATOR is
			-- New binary "implies" operator
		require
			a_text_not_void: a_text /= Void
			a_text_not_empty: a_text.count > 0
		do
			Result := ast_factory.new_infix_implies_operator (a_text, line, column)
		ensure
			infix_implies_operator_not_void: Result /= Void
		end

	new_infix_le_operator: ET_INFIX_LE_OPERATOR is
			-- New binary "<=" operator
		do
			Result := ast_factory.new_infix_le_operator (line, column)
		ensure
			infix_le_operator_not_void: Result /= Void
		end

	new_infix_lt_operator: ET_INFIX_LT_OPERATOR is
			-- New binary "<" operator
		do
			Result := ast_factory.new_infix_lt_operator (line, column)
		ensure
			infix_lt_operator_not_void: Result /= Void
		end

	new_infix_mod_operator: ET_INFIX_MOD_OPERATOR is
			-- New binary "\\" operator
		do
			Result := ast_factory.new_infix_mod_operator (line, column)
		ensure
			infix_mod_operator_not_void: Result /= Void
		end

	new_infix_or_operator (a_text: STRING): ET_INFIX_OR_OPERATOR is
			-- New binary "or" operator
		require
			a_text_not_void: a_text /= Void
			a_text_not_empty: a_text.count > 0
		do
			Result := ast_factory.new_infix_or_operator (a_text, line, column)
		ensure
			infix_or_operator_not_void: Result /= Void
		end

	new_infix_power_operator: ET_INFIX_POWER_OPERATOR is
			-- New binary "^" operator
		do
			Result := ast_factory.new_infix_power_operator (line, column)
		ensure
			infix_power_operator_not_void: Result /= Void
		end

	new_infix_times_operator: ET_INFIX_TIMES_OPERATOR is
			-- New binary "*" operator
		do
			Result := ast_factory.new_infix_times_operator (line, column)
		ensure
			infix_times_operator_not_void: Result /= Void
		end

	new_infix_xor_operator (a_text: STRING): ET_INFIX_XOR_OPERATOR is
			-- New binary "xor" operator
		require
			a_text_not_void: a_text /= Void
			a_text_not_empty: a_text.count > 0
		do
			Result := ast_factory.new_infix_xor_operator (a_text, line, column)
		ensure
			infix_xor_operator_not_void: Result /= Void
		end

	new_integer_constant (a_literal: STRING): ET_INTEGER_CONSTANT is
			-- New integer constant with no underscore
		require
			a_literal_not_void: a_literal /= Void
			-- valid_literal: regexp: [0-9]+
		do
			Result := ast_factory.new_regular_integer_constant (a_literal, current_position)
		ensure
			integer_constant_not_void: Result /= Void
		end

	new_manifest_string (a_literal: STRING): ET_MANIFEST_STRING is
			-- New manifest string with no special character
		require
			a_literal_not_void: a_literal /= Void
			-- valid_literal: regexp: \"[^"%\n]*\"
		do
			Result := ast_factory.new_regular_manifest_string (a_literal, line, column)
		ensure
			manifest_string_not_void: Result /= Void
		end

	new_minus_symbol: ET_MINUS_SYMBOL is
			-- New '-' symbol
		do
			Result := ast_factory.new_minus_symbol (line, column)
		ensure
			minus_symbol_not_void: Result /= Void
			is_prefix: Result.is_prefix
		end

	new_not_equal_symbol: ET_NOT_EQUAL_SYMBOL is
			-- New '/=' symbol
		do
			Result := ast_factory.new_not_equal_symbol (line, column)
		ensure
			not_equal_symbol_not_void: Result /= Void
		end

	new_plus_symbol: ET_PLUS_SYMBOL is
			-- New '+' symbol
		do
			Result := ast_factory.new_plus_symbol (line, column)
		ensure
			plus_symbol_not_void: Result /= Void
			is_prefix: Result.is_prefix
		end

	new_prefix_not_operator (a_text: STRING): ET_PREFIX_NOT_OPERATOR is
			-- New unary "not" operator
		require
			a_text_not_void: a_text /= Void
			a_text_not_empty: a_text.count > 0
		do
			Result := ast_factory.new_prefix_not_operator (a_text, line, column)
		ensure
			prefix_not_operator_not_void: Result /= Void
		end

	new_real_constant (a_literal: STRING): ET_REAL_CONSTANT is
			-- New real constant with no underscore
		require
			a_literal_not_void: a_literal /= Void
			-- valid_literal: regexp: ([0-9]+\.[0-9]*|[0-9]*\.[0-9]+)([eE][+-]?[0-9]+)?
		do
			Result := ast_factory.new_regular_real_constant (a_literal, current_position)
		ensure
			real_constant_not_void: Result /= Void
		end

	new_reference_mark (a_text: STRING): ET_REFERENCE_MARK is
			-- New 'reference' keyword
		require
			a_text_not_void: a_text /= Void
			a_text_not_empty: a_text.count > 0
		do
			Result := ast_factory.new_reference_mark (a_text, line, column)
		ensure
			reference_mark_not_void: Result /= Void
		end

	new_result (a_text: STRING): ET_RESULT is
			-- New result entity
		require
			a_text_not_void: a_text /= Void
			a_text_not_empty: a_text.count > 0
		do
			Result := ast_factory.new_result (a_text, line, column)
		ensure
			result_not_void: Result /= Void
		end

	new_retry_instruction (a_text: STRING): ET_RETRY_INSTRUCTION is
			-- New retry instruction
		require
			a_text_not_void: a_text /= Void
			a_text_not_empty: a_text.count > 0
		do
			Result := ast_factory.new_retry_instruction (a_text, line, column)
		ensure
			retry_instruction_not_void: Result /= Void
		end

	new_separate_mark (a_text: STRING): ET_SEPARATE_MARK is
			-- New 'separate' keyword
		require
			a_text_not_void: a_text /= Void
			a_text_not_empty: a_text.count > 0
		do
			Result := ast_factory.new_separate_mark (a_text, line, column)
		ensure
			separate_mark_not_void: Result /= Void
		end

	new_special_manifest_string (a_literal: STRING): ET_MANIFEST_STRING is
			-- New manifest string with special characters
		require
			a_literal_not_void: a_literal /= Void
			-- valid_literal: regexp: \"([^"%\n]|%([^\n]|\/[0-9]+\/|[ \t\r]*\n[ \t\r\n]*%))*\"
		do
			Result := ast_factory.new_special_manifest_string (a_literal, line, column)
		ensure
			manifest_string_not_void: Result /= Void
		end

	new_symbol: ET_SYMBOL is
			-- New lexical symbol
		do
			Result := ast_factory.new_symbol (line, column)
		ensure
			symbol_not_void: Result /= Void
		end

	new_token (a_text: STRING): ET_TOKEN is
			-- New token
		require
			a_text_not_void: a_text /= Void
			a_text_not_empty: a_text.count > 0
		do
			Result := ast_factory.new_token (a_text, line, column)
		ensure
			token_not_void: Result /= Void
		end

	new_true_constant (a_text: STRING): ET_TRUE_CONSTANT is
			-- New True constant
		require
			a_text_not_void: a_text /= Void
			a_text_not_empty: a_text.count > 0
		do
			Result := ast_factory.new_true_constant (a_text, line, column)
		ensure
			true_constant_not_void: Result /= Void
		end

	new_underscored_integer_constant (a_literal: STRING): ET_INTEGER_CONSTANT is
			-- New integer constant with underscores
		require
			a_literal_not_void: a_literal /= Void
			-- valid_literal: regexp: (_*[0-9]+_*)+
		do
			Result := ast_factory.new_underscored_integer_constant (a_literal, current_position)
		ensure
			integer_constant_not_void: Result /= Void
		end

	new_underscored_real_constant (a_literal: STRING): ET_REAL_CONSTANT is
			-- New real constant with underscores
		require
			a_literal_not_void: a_literal /= Void
			-- valid_literal: regexp: ((_*[0-9]+_*)+\.(_*[0-9]_*)*|(_*[0-9]_*)*\.(_*[0-9]_*)+)([eE][+-]?(_*[0-9]_*)+)?
		do
			Result := ast_factory.new_underscored_real_constant (a_literal, current_position)
		ensure
			real_constant_not_void: Result /= Void
		end

	new_verbatim_string (a_literal, a_marker, an_open, a_close: STRING): ET_VERBATIM_STRING is
			-- New verbatim string
		require
			a_literal_not_void: a_literal /= Void
			a_marker_not_void: a_marker /= Void
			an_open_not_void: an_open /= Void
			a_close_not_void: a_close /= Void
		do
			Result := ast_factory.new_verbatim_string (a_literal, a_marker, an_open, a_close, line, column)
		ensure
			verbatim_string_not_void: Result /= Void
		end

feature {NONE} -- String handler

	text: STRING is
		local
			a_string: STRING
		do
			a_string := string_buffer
			STRING_.wipe_out (a_string)
			append_text_to_string (a_string)
			strings.search (a_string)
			if strings.found then
				Result := strings.found_item
			else
				Result := STRING_.make (a_string.count)
				Result.append_string (a_string)
				strings.force_new (Result)
			end
		end

	text_substring (s, e: INTEGER): STRING is
		local
			a_string: STRING
		do
			a_string := string_buffer
			STRING_.wipe_out (a_string)
			append_text_substring_to_string (s, e, a_string)
			strings.search (a_string)
			if strings.found then
				Result := strings.found_item
			else
				Result := STRING_.make (a_string.count)
				Result.append_string (a_string)
				strings.force_new (Result)
			end
		end

	strings: DS_HASH_SET [STRING] is
		once
			!! Result.make_equal (1000)
		end

	string_buffer: STRING is
		once
			Result := STRING_.make (30)
		end

feature {NONE} -- Implementation

	ms_line, ms_column: INTEGER
			-- Line and column numbers of currently
			-- scanned special manifest string

	vs_count: INTEGER
			-- Character count used when scanning verbatim strings

	verbatim_marker: STRING
			-- Marker of verbatim string currently scanned

	verbatim_open_white_characters: STRING
			-- White characters after "xyz[

	is_verbatim_string_closer (a_start, an_end: INTEGER): BOOLEAN is
			-- Is string between indexes `a_start' and `an_end' the
			-- end marker of the verbatim string currently scanned?
		require
			verbatim_string_scanned: verbatim_marker /= Void
			a_start_large_enough: a_start >= 1
			an_end_small_enough: an_end <= text_count
			-- valid_string: regexp of text_substring (a_start, an_end): '[ \t\r]*\][^%\n"]*'
		local
			i, nb: INTEGER
		do
				-- Skip white characters:
			from i := a_start until text_item (i) = ']' loop
				i := i + 1
			end
				-- Compare end marker with start marker.
			nb := an_end - i
			if nb = verbatim_marker.count then
				Result := verbatim_marker.is_equal (text_substring (i + 1, an_end))
			end
		end

feature {NONE} -- Processing

	process_one_character_symbol (a_token: INTEGER) is
			-- Process Eiffel symbol made up of one character.
		do
			last_token := a_token
			last_value := new_symbol
		end

	process_two_character_symbol (a_token: INTEGER) is
			-- Process Eiffel symbol made up of two characters.
		do
			last_token := a_token
			last_value := new_symbol
		end

	process_c2_character_constant (a_value: CHARACTER) is
			-- Process character constant of the form '%A'.
		do
			last_token := E_CHARACTER
			last_value := new_c2_character_constant (a_value)
		end

	process_lower_case_c2_character_constant (a_value: CHARACTER) is
			-- Process character constant of the form '%a'.
		do
				-- Syntax error: special character specification
				-- %l where l is a letter code should be in
				-- upper-case in character constant.
			column := column + 2
			error_handler.report_SCCU_error (current_position)
			column := column - 2

			last_token := E_CHARACTER
			last_value := new_c2_character_constant (a_value)
		end

feature {NONE} -- Constants

	capitalized_current_keyword: STRING is "Current"
	capitalized_false_keyword: STRING is "False"
	capitalized_precursor_keyword: STRING is "Precursor"
	capitalized_result_keyword: STRING is "Result"
	capitalized_true_keyword: STRING is "True"
			-- Eiffel keywords with first letter in upper-case

	alias_keyword: STRING is "alias"
	all_keyword: STRING is "all"
	and_keyword: STRING is "and"
	as_keyword: STRING is "as"
	check_keyword: STRING is "check"
	class_keyword: STRING is "class"
	create_keyword: STRING is "create"
	creation_keyword: STRING is "creation"
	current_keyword: STRING is "current"
	debug_keyword: STRING is "debug"
	deferred_keyword: STRING is "deferred"
	do_keyword: STRING is "do"
	else_keyword: STRING is "else"
	elseif_keyword: STRING is "elseif"
	end_keyword: STRING is "end"
	ensure_keyword: STRING is "ensure"
	expanded_keyword: STRING is "expanded"
	export_keyword: STRING is "export"
	external_keyword: STRING is "external"
	false_keyword: STRING is "false"
	feature_keyword: STRING is "feature"
	from_keyword: STRING is "from"
	frozen_keyword: STRING is "frozen"
	if_keyword: STRING is "if"
	implies_keyword: STRING is "implies"
	indexing_keyword: STRING is "indexing"
	infix_keyword: STRING is "infix"
	inherit_keyword: STRING is "inherit"
	inspect_keyword: STRING is "inspect"
	invariant_keyword: STRING is "invariant"
	is_keyword: STRING is "is"
	like_keyword: STRING is "like"
	local_keyword: STRING is "local"
	loop_keyword: STRING is "loop"
	not_keyword: STRING is "not"
	obsolete_keyword: STRING is "obsolet"
	old_keyword: STRING is "old"
	once_keyword: STRING is "once"
	or_keyword: STRING is "or"
	precursor_keyword: STRING is "precursor"
	prefix_keyword: STRING is "prefix"
	redefine_keyword: STRING is "redefine"
	reference_keyword: STRING is "reference"
	rename_keyword: STRING is "rename"
	require_keyword: STRING is "require"
	rescue_keyword: STRING is "rescue"
	result_keyword: STRING is "result"
	retry_keyword: STRING is "retry"
	select_keyword: STRING is "select"
	separate_keyword: STRING is "separate"
	strip_keyword: STRING is "strip"
	then_keyword: STRING is "then"
	true_keyword: STRING is "true"
	undefine_keyword: STRING is "undefine"
	unique_keyword: STRING is "unique"
	until_keyword: STRING is "until"
	variant_keyword: STRING is "variant"
	when_keyword: STRING is "when"
	xor_keyword: STRING is "xor"
			-- Eiffel keywords

invariant

	filename_not_void: filename /= Void
	ast_factory_not_void: ast_factory /= Void
	error_handler_not_void: error_handler /= Void

end -- class ET_EIFFEL_SCANNER_SKELETON
