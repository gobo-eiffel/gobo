indexing

	description:

		"Scanner skeletons for Eiffel parsers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_EIFFEL_SCANNER_SKELETON

inherit

	YY_COMPRESSED_SCANNER_SKELETON
		rename
			make as make_compressed_scanner_skeleton,
			text as skeleton_text,
			text_substring as skeleton_text_substring
		redefine
			reset
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
			last_literal_start := 1
			last_break_start := 1
			last_comment_start := 1
			filename := a_filename
			ast_factory := a_factory
			error_handler := an_error_handler
			set_use_create_keyword (True)
			set_use_reference_keyword (True)
		ensure
			filename_set: filename = a_filename
			ast_factory_set: ast_factory = a_factory
			error_handler_set: error_handler = an_error_handler
		end

feature -- Initialization

	reset is
			-- Reset scanner before scanning next input.
		do
			precursor
			verbatim_marker := Void
			verbatim_open_white_characters := Void
		end

feature -- Access

	filename: STRING
			-- Name of file being parsed

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

	set_keep_all_breaks (b: BOOLEAN) is
			-- Set `keep_all_breaks' to `b'.
		do
			keep_all_breaks := b
		ensure
			keep_all_breaks_set: keep_all_breaks = b
		end

feature {NONE} -- AST factory

	new_break (a_text: STRING): ET_BREAK is
			-- New break
		require
			a_text_not_void: a_text /= Void
		do
			Result := ast_factory.new_break (a_text, line, column)
		ensure
			break_not_void: Result /= Void
		end

	new_comment (a_text: STRING): ET_COMMENT is
			-- New comment
		require
			a_text_not_void: a_text /= Void
		do
			Result := ast_factory.new_comment (a_text, line, column)
		ensure
			comment_not_void: Result /= Void
		end

feature --

	last_literal: STRING is
		do
			if last_literal_start = 0 then
				Result := last_literal_impl
			else
				Result := text_substring (last_literal_start, last_literal_end)
			end
		end

	last_break: STRING is
		require
			has_break: has_break
		do
			Result := text_substring (last_break_start, last_break_end)
		end

	last_comment: STRING is
		require
			has_comment: has_comment
		do
			Result := text_substring (last_comment_start, last_comment_end)
		end

	has_break: BOOLEAN is
		do
			Result := last_break_end >= last_break_start
		end

	has_comment: BOOLEAN is
		do
			Result := last_comment_end >= last_comment_start
		end

	last_literal_start: INTEGER
	last_literal_end: INTEGER
	last_break_start: INTEGER
	last_break_end: INTEGER
	last_comment_start: INTEGER
	last_comment_end: INTEGER
	last_literal_impl: STRING

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

	last_string_kind: INTEGER
			-- Kind of manifest string being parsed when reading the
			-- following break or comment

	str_regular, str_special, str_freeop, str_verbatim: INTEGER is unique
			-- Various kinds of manifest string being parsed when
			-- reading the following break or comment

	ms_line, ms_column: INTEGER
			-- Line and column numbers of currently
			-- scanned special manifest string

	vs_count: INTEGER
			-- Character count used when scanning verbatim strings

	verbatim_marker: STRING
			-- Marker of verbatim string currently scanned

	verbatim_open_white_characters: STRING
			-- White characters after "xyz[

	verbatim_close_white_characters: STRING
			-- White characters before ]xyz"

	is_verbatim_string_closer (a_start, an_end: INTEGER): BOOLEAN is
			-- Is string between indexes `a_start' and `an_end' the
			-- end marker of the verbatim string currently scanned?
		require
			verbatim_string_scanned: verbatim_marker /= Void
			a_start_large_enough: a_start >= 1
			an_end_small_enough: an_end <= text_count
			-- valid_string: regexp of text_substring (a_start, an_end): '[ \t\r]*\][^%\n"]*'
		local
			i, j, nb: INTEGER
		do
				-- Skip white characters:
			from i := a_start until text_item (i) = ']' loop
				i := i + 1
			end
				-- Compare end marker with start marker.
			nb := an_end - i
			if nb = verbatim_marker.count then
				i := i + 1
				Result := True
				from j := 1 until j > nb loop
					if verbatim_marker.item (j) = text_item (i) then
						i := i + 1
						j := j + 1
					else
						Result := False
						j := nb + 1 -- Jump out of the loop.
					end
				end
			end
		end

feature {NONE} -- Processing

	process_c2_character_constant (a_value: CHARACTER) is
			-- Process character constant of the form '%A'.
		do
			last_token := E_CHARACTER
			last_break_end := 0
			last_comment_end := 0
			last_value := ast_factory.new_c2_character_constant (a_value, Current)
		end

	process_c2_character_constant_break (a_value: CHARACTER) is
			-- Process character constant of the form '%A',
			-- followed by a break.
		do
			last_token := E_CHARACTER
			last_break_start := 5
			last_break_end := text_count
			last_comment_end := 0
			last_value := ast_factory.new_c2_character_constant (a_value, Current)
		end

	process_c2_character_constant_comment (a_value: CHARACTER) is
			-- Process character constant of the form '%A',
			-- followed by a comment.
		do
			last_token := E_CHARACTER
			last_break_end := 0
			last_comment_start := 5
			last_comment_end := text_count
			last_value := ast_factory.new_c2_character_constant (a_value, Current)
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
			last_break_end := 0
			last_comment_end := 0
			last_value := ast_factory.new_c2_character_constant (a_value, Current)
		end

	process_lower_case_c2_character_constant_break (a_value: CHARACTER) is
			-- Process character constant of the form '%a',
			-- followed by a break.
		do
				-- Syntax error: special character specification
				-- %l where l is a letter code should be in
				-- upper-case in character constant.
			column := column + 2
			error_handler.report_SCCU_error (current_position)
			column := column - 2

			last_token := E_CHARACTER
			last_break_start := 5
			last_break_end := text_count
			last_comment_end := 0
			last_value := ast_factory.new_c2_character_constant (a_value, Current)
		end

	process_lower_case_c2_character_constant_comment (a_value: CHARACTER) is
			-- Process character constant of the form '%a',
			-- followed by a comment.
		do
				-- Syntax error: special character specification
				-- %l where l is a letter code should be in
				-- upper-case in character constant.
			column := column + 2
			error_handler.report_SCCU_error (current_position)
			column := column - 2

			last_token := E_CHARACTER
			last_break_end := 0
			last_comment_start := 5
			last_comment_end := text_count
			last_value := ast_factory.new_c2_character_constant (a_value, Current)
		end

feature {NONE} -- Constants

	capitalized_current_keyword: STRING is "Current"
	capitalized_false_keyword: STRING is "False"
	capitalized_precursor_keyword: STRING is "Precursor"
	capitalized_result_keyword: STRING is "Result"
	capitalized_true_keyword: STRING is "True"
	capitalized_unique_keyword: STRING is "Unique"
			-- Eiffel keywords with first letter in upper-case

	agent_keyword: STRING is "agent"
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
	obsolete_keyword: STRING is "obsolete"
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

	arrow_symbol: STRING is "->"
	assign_symbol: STRING is ":="
	assign_attempt_symbol: STRING is "?="
	bang_symbol: STRING is "!"
	bangbang_symbol: STRING is "!!"
	colon_symbol: STRING is ":"
	comma_symbol: STRING is ","
	div_symbol: STRING is "//"
	divide_symbol: STRING is "/"
	dollar_symbol: STRING is "$"
	dot_symbol: STRING is "."
	dotdot_symbol: STRING is ".."
	equal_symbol: STRING is "="
	ge_symbol: STRING is ">="
	gt_symbol: STRING is ">"
	le_symbol: STRING is "<="
	left_array_symbol: STRING is "<<"
	left_brace_symbol: STRING is "{"
	left_bracket_symbol: STRING is "["
	left_parenthesis_symbol: STRING is "("
	lt_symbol: STRING is "<"
	minus_symbol: STRING is "-"
	mod_symbol: STRING is "\\"
	not_equal_symbol: STRING is "/="
	plus_symbol: STRING is "+"
	power_symbol: STRING is "^"
	question_mark_symbol: STRING is "?"
	right_array_symbol: STRING is ">>"
	right_brace_symbol: STRING is "}"
	right_bracket_symbol: STRING is "]"
	right_parenthesis_symbol: STRING is ")"
	semicolon_symbol: STRING is ";"
	times_symbol: STRING is "*"
			-- Eiffel symbols

invariant

	filename_not_void: filename /= Void
	ast_factory_not_void: ast_factory /= Void
	error_handler_not_void: error_handler /= Void

end
