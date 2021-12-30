note

	description:

		"Parser skeletons for lexical analyzer %
		%generators such as 'gelex'"

	library: "Gobo Eiffel Lexical Library"
	copyright: "Copyright (c) 1999-2021, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class LX_LEX_PARSER_SKELETON

inherit

	YY_PARSER_SKELETON
		rename
			make as make_parser_skeleton
		redefine
			report_error
		end

	LX_LEX_SCANNER_SKELETON
		rename
			make as make_lex_scanner,
			make_from_description as make_lex_scanner_from_description,
			reset as reset_lex_scanner,
			push_start_condition as lex_push_start_condition
		end

feature {NONE} -- Initialization

	make (handler: like error_handler)
			-- Create a new scanner description parser.
		require
			handler_not_void: handler /= Void
		do
			make_lex_scanner (handler)
			make_parser_skeleton
			create pending_rules.make (Initial_max_pending_rules)
			create start_condition_stack.make (Initial_max_start_conditions)
			create action_factory.make
			create old_singleton_lines.make (Initial_old_positions)
			create old_singleton_columns.make (Initial_old_positions)
			create old_singleton_counts.make (Initial_old_positions)
			create old_regexp_lines.make (Initial_old_positions)
			create old_regexp_columns.make (Initial_old_positions)
			create old_regexp_counts.make (Initial_old_positions)
			create unions_of_concatenations_of_symbol_classes_by_utf8_character_class.make (Initial_max_character_classes)
			create buffer.make (4)
			maximum_used_symbol := {CHARACTER_8}.max_value
		ensure
			error_handler_set: error_handler = handler
		end

	make_from_description (a_description: LX_DESCRIPTION; handler: like error_handler)
			-- Create a new scanner description parser
			-- and initialize it with `a_description'.
		require
			a_description_not_void: a_description /= Void
			handler_not_void: handler /= Void
		do
			make_lex_scanner_from_description (a_description, handler)
			make_parser_skeleton
			create pending_rules.make (Initial_max_pending_rules)
			create start_condition_stack.make (Initial_max_start_conditions)
			create action_factory.make
			create old_singleton_lines.make (Initial_old_positions)
			create old_singleton_columns.make (Initial_old_positions)
			create old_singleton_counts.make (Initial_old_positions)
			create old_regexp_lines.make (Initial_old_positions)
			create old_regexp_columns.make (Initial_old_positions)
			create old_regexp_counts.make (Initial_old_positions)
			create unions_of_concatenations_of_symbol_classes_by_utf8_character_class.make (Initial_max_character_classes)
			create buffer.make (4)
			maximum_used_symbol := {CHARACTER_8}.max_value
		ensure
			error_handler_set: error_handler = handler
			description_set: description = a_description
		end

feature -- Initialization

	reset
			-- Reset parser before parsing next input.
		do
			reset_lex_scanner
			pending_rules.wipe_out
			start_condition_stack.wipe_out
			old_singleton_lines.wipe_out
			old_singleton_columns.wipe_out
			old_singleton_counts.wipe_out
			old_regexp_lines.wipe_out
			old_regexp_columns.wipe_out
			old_regexp_counts.wipe_out
			maximum_used_symbol := {CHARACTER_8}.max_value
		end

feature -- Parsing

	parse_file (a_file: KI_CHARACTER_INPUT_STREAM)
			-- Parse scanner description from `a_file'.
			-- `a_file' is expected to be encoded in UTF-8
			-- or ISO-8859-1.
		require
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
		local
			l_input_buffer: like new_unicode_file_buffer
		do
			l_input_buffer := new_unicode_file_buffer (a_file)
			set_input_buffer (l_input_buffer)
			parse
			description.set_has_utf8_enconding (l_input_buffer.has_utf8_enconding)
		end

	parse_string (a_string: READABLE_STRING_GENERAL)
			-- Parse scanner description from `a_string'.
			-- `a_string' is expected to contain valid
			-- non-surrogate Unicode characters.
		require
			a_string_not_void: a_string /= Void
		do
			set_input_buffer (new_unicode_string_buffer (a_string))
			parse
		end

feature -- Access

	pending_rules: DS_ARRAYED_LIST [LX_RULE]
			-- Rules which share the same semantic action

	start_condition_stack: LX_START_CONDITIONS
			-- Start condition containing
			-- the rule currently being parsed

	action_factory: LX_ACTION_FACTORY
			-- Semantic action factory

	options_overrider: detachable LX_DESCRIPTION_OVERRIDER
			-- Overrider of options specified in the input file

	maximum_used_symbol: INTEGER
			-- Maximum symbol used so far
			-- (We consider that the first 256 symbols are used.)

feature -- Setting

	set_action_factory (a_factory: like action_factory)
			-- Set `action_factory' to `a_factory'.
		require
			a_factory_not_void: a_factory /= Void
		do
			action_factory := a_factory
		ensure
			action_factory_set: action_factory = a_factory
		end

	set_options_overrider (an_overrider: like options_overrider)
			-- Set `options_overrider' to `an_overrider'.
		do
			options_overrider := an_overrider
		ensure
			options_overrider_set: options_overrider = an_overrider
		end

feature -- Status report

	rule: detachable LX_RULE
			-- Rule being parsed

	in_trail_context: BOOLEAN
			-- Is a trailing context being parsed?

	has_trail_context: BOOLEAN
			-- Does the regexp being parsed have a trailing context?

	has_bol_context: BOOLEAN
			-- Does the regexp being paresed has a begining-of-line context?

feature {NONE} -- Measurement

	process_singleton_char (a_char: INTEGER)
			-- Update `singleton_{line,column,count}'.
			-- Singleton: a_char
		do
			singleton_count := 1
			if a_char = New_line_code then
				singleton_line := 1
				singleton_column := 0
			else
				singleton_line := 0
				singleton_column := 1
			end
		end

	process_singleton_star
			-- Update `singleton_{line,column,count}'.
			-- Singleton: Singleton '*'
		do
			singleton_count := Zero_or_more
			if singleton_line /= 0 then
				singleton_line := Zero_or_more
			end
			if singleton_column /= 0 then
				singleton_column := Zero_or_more
			end
		end

	process_singleton_plus
			-- Update `singleton_{line,column,count}'.
			-- Singleton: Singleton '+'
		do
			singleton_count := Zero_or_more
			if singleton_line = 0 then
				if singleton_column /= 0 then
					singleton_column := Zero_or_more
				end
			elseif singleton_line > 0 then
				singleton_line := One_or_more
			elseif singleton_line = Zero_or_more then
				if singleton_column /= 0 then
					singleton_column := Zero_or_more
				end
			end
		end

	process_singleton_optional
			-- Update `singleton_{line,column,count}'.
			-- Singleton: Singleton '?'
		do
			singleton_count := Zero_or_more
			if singleton_line /= 0 then
				singleton_line := Zero_or_more
			end
			if singleton_column /= 0 then
				singleton_column := Zero_or_more
			end
		end

	process_singleton_fixed_iteration (i: INTEGER)
			-- Update `singleton_{line,column,count}'.
			-- Singleton: Singleton '{' i '}'
		do
			if singleton_count >= 0 then
				singleton_count := singleton_count * i
			end
			if singleton_line = 0 then
				if singleton_column >= 0 then
					singleton_column := singleton_column * i
				end
			elseif singleton_line > 0 then
				singleton_line := singleton_line * i
			elseif singleton_line = Zero_or_more then
				if singleton_column /= 0 then
					singleton_column := Zero_or_more
				end
			end
		end

	process_singleton_bounded_iteration (i, j: INTEGER)
			-- Update `singleton_{line,column,count}'.
			-- Singleton: Singleton '{' i ',' j '}'
		do
			if i = j then
				process_singleton_fixed_iteration (i)
			elseif i = 0 then
				process_singleton_star
			else
				process_singleton_plus
			end
		end

	process_singleton_unbounded_iteration (i: INTEGER)
			-- Update `singleton_{line,column,count}'.
			-- Singleton: Singleton '{' i ',' '}'
		do
			if i = 0 then
				process_singleton_star
			else
				process_singleton_plus
			end
		end

	process_singleton_dot
			-- Update `singleton_{line,column,count}'.
			-- Singleton: '.'
		do
			singleton_line := 0
			if utf8_mode.item then
				singleton_count := One_or_more
				singleton_column := One_or_more
			else
				singleton_count := 1
				singleton_column := 1
			end
		end

	process_singleton_empty_string
			-- Update `singleton_{line,column,count}'.
			-- String: -- Empty
		do
			singleton_count := 0
			singleton_line := 0
			singleton_column := 0
		ensure
			singleton_count_known: singleton_count = 0
			singleton_line_known: singleton_line = 0
			singleton_column_known: singleton_column = 0
		end

	process_singleton_string (a_char: INTEGER)
			-- Update `singleton_{line,column,count}'.
			-- String: String a_char
		require
			singleton_count_known: singleton_count >= 0
			singleton_line_known: singleton_line >= 0
			singleton_column_known: singleton_column >= 0
		do
			singleton_count := singleton_count + 1
			if a_char = New_line_code then
				singleton_line := singleton_line + 1
				singleton_column := 0
			else
				singleton_column := singleton_column + 1
			end
		ensure
			singleton_count_known: singleton_count >= 0
			singleton_line_known: singleton_line >= 0
			singleton_column_known: singleton_column >= 0
		end

	process_singleton_symbol_class (a_symbol_class: LX_SYMBOL_CLASS)
			-- Update `singleton_{line,column,count}'.
			-- Singleton: CCL_OP
			-- Singleton: Full_CCl
		require
			a_symbol_class_not_void: a_symbol_class /= Void
		do
			if a_symbol_class.is_negated then
				if utf8_mode.item then
					singleton_count := Zero_or_more
				elseif a_symbol_class.is_full then
					singleton_count := 0
				else
					singleton_count := 1
				end
			elseif a_symbol_class.is_empty then
				singleton_count := 0
			elseif utf8_mode.item then
				singleton_count := One_or_more
			else
				singleton_count := 1
			end
			if a_symbol_class.has (New_line_code) then
				singleton_line := Zero_or_more
				singleton_column := Zero_or_more
			else
				singleton_line := 0
				singleton_column := singleton_count
			end
		end

	process_singleton_series
			-- Update `series_{line,column,count}'.
			-- Series: Singleton Series
		do
			if series_count >= 0 and singleton_count >= 0 then
				series_count := series_count + singleton_count
			else
				series_count := Zero_or_more
			end
			if series_line = 0 then
				series_line := singleton_line
				if series_column >= 0 and singleton_column >= 0 then
					series_column := series_column + singleton_column
				else
					series_column := Zero_or_more
				end
			elseif series_line > 0 then
				if singleton_line >= 0 then
					series_line := series_line + singleton_line
				else
					series_line := One_or_more
				end
			elseif series_line /= One_or_more then
				if singleton_line > 0 or singleton_line = One_or_more then
					series_line := One_or_more
				else
					series_line := Zero_or_more
				end
				if singleton_column /= 0 then
					series_column := Zero_or_more
				end
			end
		end

	process_regexp_or_series
			-- Update `regexp_{line,column,count}'.
			-- Regular_expression: Regular_expression '|' Series
		do
			if regexp_count /= series_count then
				regexp_count := Zero_or_more
			end
			if regexp_line /= series_line then
				if (regexp_line = One_or_more or regexp_line > 0) and (series_line = One_or_more or series_line > 0) then
					regexp_line := One_or_more
				else
					regexp_line := Zero_or_more
				end
			end
			if regexp_column /= series_column then
				regexp_column := Zero_or_more
			end
		end

	singleton_line: INTEGER
			-- Number of new-line characters in current Singleton

	singleton_column: INTEGER
			-- Number of characters after last new-line
			-- in current Singleton

	singleton_count: INTEGER
			-- Number of characters in current Singleton

	old_singleton_lines: DS_ARRAYED_STACK [INTEGER]
			-- Number of new-line characters in previous Singleton

	old_singleton_columns: DS_ARRAYED_STACK [INTEGER]
			-- Number of characters after last new-line in previous Singleton

	old_singleton_counts: DS_ARRAYED_STACK [INTEGER]
			-- Number of characters in previous Singleton

	series_line: INTEGER
			-- Number of new-line characters in current Series

	series_column: INTEGER
			-- Number of characters after last new-line in current Series

	series_count: INTEGER
			-- Number of characters in current Series

	regexp_line: INTEGER
			-- Number of new-line characters in current Regular_expression

	regexp_column: INTEGER
			-- Number of characters after last new-line
			-- in current Regular_expression

	regexp_count: INTEGER
			-- Number of characters in current Regular_expression

	old_regexp_lines: DS_ARRAYED_STACK [INTEGER]
			-- Number of new-line characters in previous Regular_expressions

	old_regexp_columns: DS_ARRAYED_STACK [INTEGER]
			-- Number of characters after last new-line
			-- in previous Regular_expressions

	old_regexp_counts: DS_ARRAYED_STACK [INTEGER]
			-- Number of characters in previous Regular_expressions

	head_line: INTEGER
			-- Number of new-line characters in head part
			-- of current Rule

	head_column: INTEGER
			-- Number of characters after last new-line
			-- in head part of current Rule

	head_count: INTEGER
			-- Length of the tokens recognized by the
			-- the head part of the rule being parsed

	trail_count: INTEGER
			-- Length of the tokens recognized by the
			-- the trail part of the rule being parsed
			-- when this rule has a trailing context

	Zero_or_more: INTEGER = -1

	One_or_more: INTEGER = -2

feature {NONE} -- Factory

	new_symbol_nfa (symbol: INTEGER): LX_NFA
			-- New NFA made of two states and a
			-- symbol transition labeled `symbol'
			-- (Register to `description.equiv_classes' if needed.)
		local
			a_name: STRING_32
			a_character_class: LX_SYMBOL_CLASS
		do
			if description.equiv_classes_used then
					-- Use a transition with a character class
					-- containing only `symbol' instead of a
					-- simple symbol transition labeled `symbol'.
					-- This is to allow later symbol renumbering
					-- using equivalence classes.
				create a_name.make (10)
				a_name.append_integer (symbol)
				character_classes_by_name.search (a_name)
				if character_classes_by_name.found then
					a_character_class := character_classes_by_name.found_item
				else
					a_character_class := new_character_class
					a_character_class.add_symbol (symbol)
					character_classes.search (a_character_class)
					if character_classes.found then
						a_character_class := character_classes.found_item
					else
						character_classes.force_new (a_character_class)
					end
					character_classes_by_name.force_new (a_character_class, a_name)
				end
				Result := new_symbol_class_nfa (a_character_class)
			else
				create Result.make_symbol (symbol, in_trail_context)
			end
		ensure
			nfa_not_void: Result /= Void
		end

	new_epsilon_nfa: LX_NFA
			-- New NFA made of two states and an epsilon transition
		do
			create Result.make_epsilon (in_trail_context)
		ensure
			nfa_not_void: Result /= Void
		end

	new_symbol_class_nfa (symbols: LX_SYMBOL_CLASS): LX_NFA
			-- New NFA made of two states and a symbol
			-- class transition labeled `symbols'
		require
			symbols_not_void: symbols /= Void
		do
			equiv_character_classes.force (symbols)
			create Result.make_symbol_class (symbols, in_trail_context)
		ensure
			nfa_not_void: Result /= Void
		end

	new_character_class: LX_SYMBOL_CLASS
			-- New empty character class
		do
			create Result.make (description.minimum_symbol, description.maximum_symbol)
		ensure
			character_class_not_void: Result /= Void
		end

	new_nfa_from_character (a_char: INTEGER): LX_NFA
			-- New NFA with a transition labeled `a_char'
			-- (Take case-sensitiveness into account.)
		local
			lower_char: INTEGER
			a_name: STRING_32
			a_character_class: LX_SYMBOL_CLASS
		do
			if description.case_insensitive then
				inspect a_char
				when Upper_a_code .. Upper_z_code then
					lower_char := a_char + Case_diff
					create a_name.make (2)
					a_name.append_integer (lower_char)
					character_classes_by_name.search (a_name)
					if character_classes_by_name.found then
						a_character_class := character_classes_by_name.found_item
					else
						a_character_class := new_character_class
						a_character_class.add_symbol (a_char)
						a_character_class.add_symbol (lower_char)
						character_classes.search (a_character_class)
						if character_classes.found then
							a_character_class := character_classes.found_item
						end
						character_classes_by_name.force_new (a_character_class, a_name)
					end
					Result := new_symbol_class_nfa (a_character_class)
				when Lower_a_code .. Lower_z_code then
					create a_name.make (2)
					a_name.append_integer (a_char)
					character_classes_by_name.search (a_name)
					if character_classes_by_name.found then
						a_character_class := character_classes_by_name.found_item
					else
						a_character_class := new_character_class
						a_character_class.add_symbol (a_char - Case_diff)
						a_character_class.add_symbol (a_char)
						character_classes.search (a_character_class)
						if character_classes.found then
							a_character_class := character_classes.found_item
						end
						character_classes_by_name.force_new (a_character_class, a_name)
					end
					Result := new_symbol_class_nfa (a_character_class)
				else
					Result := new_symbol_nfa (a_char)
				end
			else
				Result := new_symbol_nfa (a_char)
			end
			maximum_used_symbol := maximum_used_symbol.max (a_char)
		ensure
			nfa_not_void: Result /= Void
		end

	new_nfa_from_character_class (a_character_class: LX_SYMBOL_CLASS): LX_NFA
			-- New NFA corresponding to `a_character_class'
		require
			a_character_class_not_void: a_character_class /= Void
		do
			if utf8_mode.item then
				Result := new_nfa_from_utf8_character_class (a_character_class)
			else
				Result := new_symbol_class_nfa (a_character_class)
			end
		ensure
			nfa_not_void: Result /= Void
		end

	new_nfa_from_utf8_character_class (a_unicode_character_class: LX_SYMBOL_CLASS): LX_NFA
			-- New NFA corresponding to a Unicode character set whose characters
			-- will be encoded in UTF-8
		require
			a_unicode_character_class_not_void: a_unicode_character_class /= Void
		local
			i, nb: INTEGER
			l_symbol: INTEGER
			l_symbol_class: detachable LX_SYMBOL_CLASS
			l_array_2: detachable ARRAY [detachable LX_SYMBOL_CLASS]
			l_array_n: detachable ARRAY [detachable DS_HASH_SET [INTEGER]]
			l_integer_set: detachable DS_HASH_SET [INTEGER]
			l_encoded_bytes: INTEGER
			l_found: BOOLEAN
			l_list: detachable DS_ARRAYED_LIST [DS_ARRAYED_LIST [LX_SYMBOL_CLASS]]
			l_concatenation: DS_ARRAYED_LIST [LX_SYMBOL_CLASS]
		do
			unions_of_concatenations_of_symbol_classes_by_utf8_character_class.search (a_unicode_character_class)
			if unions_of_concatenations_of_symbol_classes_by_utf8_character_class.found then
				l_list := unions_of_concatenations_of_symbol_classes_by_utf8_character_class.found_item
			else
				create l_list.make (20)
					-- 0xxxxxxx
				l_symbol_class := new_character_class
				from
					i := 0
					nb := (0x7F).min (a_unicode_character_class.upper)
				until
					i > nb
				loop
					if a_unicode_character_class.has (i) then
						l_symbol_class.add_symbol (i)
					end
					i := i + 1
				end
				if not l_symbol_class.is_empty then
					create l_concatenation.make (1)
					l_concatenation.put_last (l_symbol_class)
					l_list.force_last (l_concatenation)
				end
				l_symbol_class := Void
					-- 110xxxxx 10xxxxxx
				create l_array_2.make_filled (Void, 0, {CHARACTER_8}.max_value)
				from
					nb := (0x07FF).min (a_unicode_character_class.upper)
				until
					i > nb
				loop
					if a_unicode_character_class.has (i) then
						l_found := True
						buffer.wipe_out
						{UC_UTF8_ROUTINES}.append_code_to_utf8 (buffer, i)
						l_symbol_class := l_array_2.item (buffer.item_code (1))
						if l_symbol_class = Void then
							l_symbol_class := new_character_class
							l_array_2.put (l_symbol_class, buffer.item_code (1))
						end
						l_symbol_class.add_symbol (buffer.item_code (2))
					end
					i := i + 1
				end
				l_symbol_class := Void
				if l_found then
					append_concatenations_of_symbol_classes_from_utf8_2_byte_character_class (l_array_2, Void, Void, l_list)
					l_found := False
				end
				l_array_2 := Void
					-- 1110xxxx 10xxxxxx 10xxxxxx
				create l_array_n.make_filled (Void, 0, {CHARACTER_8}.max_value)
				from
					nb := ({UC_UNICODE_CONSTANTS}.minimum_unicode_surrogate_code - 1).min (a_unicode_character_class.upper)
				until
					i > nb
				loop
					if a_unicode_character_class.has (i) then
						l_found := True
						buffer.wipe_out
						{UC_UTF8_ROUTINES}.append_code_to_utf8 (buffer, i)
						l_integer_set := l_array_n.item (buffer.item_code (1))
						if l_integer_set = Void then
							create l_integer_set.make ({CHARACTER_8}.max_value)
							l_array_n.put (l_integer_set, buffer.item_code (1))
						end
						l_encoded_bytes := (buffer.item_code (3) |<< {PLATFORM}.character_8_bits) | buffer.item_code (2)
						l_integer_set.force (l_encoded_bytes)
					end
					i := i + 1
				end
				from
					nb := (0xFFFF - {UC_UNICODE_CONSTANTS}.unicode_surrogate_count).min (a_unicode_character_class.upper)
				until
					i > nb
				loop
					if a_unicode_character_class.has (i) then
						l_symbol := i + {UC_UNICODE_CONSTANTS}.unicode_surrogate_count
						l_found := True
						buffer.wipe_out
						{UC_UTF8_ROUTINES}.append_code_to_utf8 (buffer, l_symbol)
						l_integer_set := l_array_n.item (buffer.item_code (1))
						if l_integer_set = Void then
							create l_integer_set.make (description.maximum_symbol)
							l_array_n.put (l_integer_set, buffer.item_code (1))
						end
						l_encoded_bytes := (buffer.item_code (3) |<< {PLATFORM}.character_8_bits) | buffer.item_code (2)
						l_integer_set.force (l_encoded_bytes)
					end
					i := i + 1
				end
				l_integer_set := Void
				if l_found then
					append_concatenations_of_symbol_classes_from_utf8_n_byte_character_class (l_array_n, 3, Void, l_list)
					l_found := False
				end
					-- 11110xxx 10xxxxxx 10xxxxxx 10xxxxxx
				from
					nb := (0x10FFFF - {UC_UNICODE_CONSTANTS}.unicode_surrogate_count).min (a_unicode_character_class.upper)
				until
					i > nb
				loop
					if a_unicode_character_class.has (i) then
						l_symbol := i + {UC_UNICODE_CONSTANTS}.unicode_surrogate_count
						l_found := True
						buffer.wipe_out
						{UC_UTF8_ROUTINES}.append_code_to_utf8 (buffer, l_symbol)
						l_integer_set := l_array_n.item (buffer.item_code (1))
						if l_integer_set = Void then
							create l_integer_set.make ({CHARACTER_8}.max_value)
							l_array_n.put (l_integer_set, buffer.item_code (1))
						end
						l_encoded_bytes := (((buffer.item_code (4) |<< {PLATFORM}.character_8_bits) | buffer.item_code (3)) |<< {PLATFORM}.character_8_bits) | buffer.item_code (2)
						l_integer_set.force (l_encoded_bytes)
					end
					i := i + 1
				end
				l_integer_set := Void
				if l_found then
					append_concatenations_of_symbol_classes_from_utf8_n_byte_character_class (l_array_n, 4, Void, l_list)
				end
				if l_list.is_empty then
					l_symbol_class := new_character_class
					create l_concatenation.make (1)
					l_concatenation.put_last (l_symbol_class)
					l_list.force_last (l_concatenation)
				end
				unions_of_concatenations_of_symbol_classes_by_utf8_character_class.force_new (l_list, a_unicode_character_class)
			end
			Result := new_nfa_from_unions_of_concatenations_of_symbol_classes (l_list)
		ensure
			nfa_not_void: Result /= Void
		end

	new_nfa_from_unions_of_concatenations_of_symbol_classes (a_list: like unions_of_concatenations_of_symbol_classes): LX_NFA
			-- New NFA corresponding to the unions (outer list) of
			-- the concatenations (inner lists) of symbol classes
		require
			a_list_not_void: a_list /= Void
			a_list_not_empty: not a_list.is_empty
			no_void_concanetation: not a_list.has_void
			no_empty_concatenation: not a_list.there_exists (agent {DS_ARRAYED_LIST [LX_SYMBOL_CLASS]}.is_empty)
			no_void_symbol_class: not a_list.there_exists (agent {DS_ARRAYED_LIST [LX_SYMBOL_CLASS]}.has_void)
		local
			i, nb_i: INTEGER
			j, nb_j: INTEGER
			l_concatenation: DS_ARRAYED_LIST [LX_SYMBOL_CLASS]
			l_nfa: LX_NFA
		do
			from
				i := 1
				nb_i := a_list.count
			until
				i > nb_i
			loop
				l_concatenation := a_list.item (i)
				from
					l_nfa := new_symbol_class_nfa (l_concatenation.first)
					j := 2
					nb_j := l_concatenation.count
				until
					j > nb_j
				loop
					l_nfa.build_concatenation (new_symbol_class_nfa (l_concatenation.item (j)))
					j := j + 1
				end
				if Result = Void then
					Result := l_nfa
				else
					Result.build_union (l_nfa)
				end
				i := i + 1
			end
			if Result = Void then
					-- Should never happen (according to the precondition).
					-- Make void-safe compiler happy.
				Result := new_epsilon_nfa
			end
		end

	new_bounded_iteration_nfa (a_nfa: LX_NFA; i, j: INTEGER): LX_NFA
			-- New NFA that matches whatever matched `a_nfa' from
			-- `i' number of times to `j' number of times
		require
			a_nfa_not_void: a_nfa /= Void
		do
			if i < 0 or i > j then
				report_bad_iteration_values_error
				Result := new_epsilon_nfa
			else
				if i = 0 then
					if j <= 0 then
						report_bad_iteration_values_error
						Result := new_epsilon_nfa
					else
						Result := a_nfa
						Result.build_bounded_iteration (1, j)
						Result.build_optional
					end
				else
					Result := a_nfa
					Result.build_bounded_iteration (i, j)
				end
			end
		ensure
			nfa_not_void: Result /= Void
		end

	new_unbounded_iteration_nfa (a_nfa: LX_NFA; i: INTEGER): LX_NFA
			-- New NFA that matches `i' or more occurrences of `a_nfa'
		require
			a_nfa_not_void: a_nfa /= Void
		do
			if i <= 0 then
				report_iteration_not_positive_error
				Result := new_epsilon_nfa
			else
				Result := a_nfa
				Result.build_unbounded_iteration (i)
			end
		ensure
			nfa_not_void: Result /= Void
		end

	new_iteration_nfa (a_nfa: LX_NFA; i: INTEGER): LX_NFA
			-- New NFA that matches whatever `a_nfa'
			-- matched `i' number of times
		require
			a_nfa_not_void: a_nfa /= Void
		do
			if i <= 0 then
				report_iteration_not_positive_error
				Result := new_epsilon_nfa
			else
				Result := a_nfa
				Result.build_iteration (i)
			end
		ensure
			nfa_not_void: Result /= Void
		end

feature {NONE} -- Implementation

	push_start_condition (a_name: STRING_8; stack: LX_START_CONDITIONS)
			-- Push start condition named `a_name' on top of `stack'.
			-- Do nothing if that start condition is already in `stack'.
		require
			a_name_not_void: a_name /= Void
			stack_not_void: stack /= Void
		local
			start_conditions: LX_START_CONDITIONS
		do
			start_conditions := description.start_conditions
			if start_conditions.has_start_condition (a_name) then
				if stack.has_start_condition (a_name) then
					report_start_condition_specified_twice_warning (a_name)
				else
					stack.put_last (start_conditions.start_condition (a_name))
				end
			else
				report_undeclared_start_condition_error (a_name)
			end
		end

	process_rule (a_nfa: LX_NFA)
			-- Process a rule.
		require
			a_nfa_not_void: a_nfa /= Void
			rule_not_void: rule /= Void
		do
			check precondition: attached rule as l_rule then
				a_nfa.set_accepted_rule (l_rule)
				l_rule.set_pattern (a_nfa)
				description.rules.force_last (l_rule)
				pending_rules.force_last (l_rule)
				l_rule.set_line_nb (rule_line_nb)
				l_rule.set_trail_context (has_trail_context)
				l_rule.set_head_count (head_count)
				l_rule.set_trail_count (trail_count)
				l_rule.set_line_count (head_line)
				l_rule.set_column_count (head_column)
				if has_trail_context and then not (head_count >= 0 or trail_count >= 0) then
					description.set_variable_trail_context (True)
				end
				if has_bol_context then
					description.set_bol_needed (True)
				end
				if start_condition_stack.is_empty then
						-- Add `a_nfa' to all non-exclusive start condition,
						-- including the default (INITIAL) start condition.
					description.start_conditions.add_nfa_to_non_exclusive (a_nfa, has_bol_context)
				else
					start_condition_stack.add_nfa_to_all (a_nfa, has_bol_context)
				end
			end
		end

	process_eof_rule
			-- Process a "<<EOF>>" rule.
		do
			if start_condition_stack.is_empty then
					-- This EOF applies to all start conditions
					-- which don't already have EOF actions.
				start_condition_stack.append_non_eof_start_conditions (description.start_conditions)
				if start_condition_stack.is_empty then
					report_all_start_conditions_eof_warning
				else
					build_eof_action (start_condition_stack)
				end
			else
				build_eof_action (start_condition_stack)
			end
		end

	build_eof_action (stack: LX_START_CONDITIONS)
			-- Build the "<<EOF>>" action for start conditions in `stack'.
		require
			stack_not_void: stack /= Void
			stack_not_empty: not stack.is_empty
		local
			a_rule: LX_RULE
			i, nb: INTEGER
			a_start_condition: LX_START_CONDITION
			eof_rules: DS_ARRAYED_LIST [LX_RULE]
		do
			eof_rules := description.eof_rules
			nb := stack.count
			from
				i := 1
			until
				i > nb
			loop
				a_start_condition := stack.item (i)
				if a_start_condition.has_eof then
					report_multiple_EOF_rules_error (a_start_condition.name)
				else
					a_start_condition.set_has_eof (True)
					create a_rule.make_default (a_start_condition.id)
					a_rule.set_pattern (Eof_nfa)
						-- Save `a_rule' as an end-of-file rule.
					eof_rules.force_last (a_rule)
					pending_rules.force_last (a_rule)
					a_rule.set_line_nb (rule_line_nb)
				end
				i := i + 1
			end
		end

	process_default_rule
			-- Process default rule.
		require
			rule_not_void: rule /= Void
		local
			a_character_class: LX_SYMBOL_CLASS
			a_nfa: LX_NFA
		do
			check precondition: attached rule as l_rule then
				a_character_class := new_character_class
				a_character_class.set_negated (True)
				a_nfa := new_symbol_class_nfa (a_character_class)
				a_nfa.set_accepted_rule (l_rule)
				l_rule.set_pattern (a_nfa)
				description.rules.force_last (l_rule)
				pending_rules.force_last (l_rule)
				l_rule.set_line_nb (0)
				l_rule.set_trail_context (False)
				l_rule.set_head_count (1)
				l_rule.set_trail_count (0)
				l_rule.set_line_count (Zero_or_more)
				l_rule.set_column_count (Zero_or_more)
				description.start_conditions.add_nfa_to_all (a_nfa, False)
				if description.no_default_rule then
					set_action ("last_token := yyError_token%N%
						%fatal_error (%"scanner jammed%")")
				else
					set_action ("default_action")
				end
			end
		end

	append_character_to_string (a_char: INTEGER; a_string: LX_NFA): LX_NFA
			-- Append character `a_char' at end of string `a_string'.
		require
			a_string_not_void: a_string /= Void
		local
			a_name: STRING_32
			lower_char: INTEGER
			a_character_class: LX_SYMBOL_CLASS
		do
			Result := a_string
			if description.case_insensitive then
				inspect a_char
				when Upper_a_code .. Upper_z_code then
					lower_char := a_char + Case_diff
					create a_name.make (2)
					a_name.append_integer (lower_char)
					character_classes_by_name.search (a_name)
					if character_classes_by_name.found then
						a_character_class := character_classes_by_name.found_item
					else
						a_character_class := new_character_class
						a_character_class.add_symbol (a_char)
						a_character_class.add_symbol (lower_char)
						character_classes.search (a_character_class)
						if character_classes.found then
							a_character_class := character_classes.found_item
						else
							character_classes.force_new (a_character_class)
						end
						character_classes_by_name.force_new (a_character_class, a_name)
					end
					Result.build_concatenation (new_symbol_class_nfa (a_character_class))
				when Lower_a_code .. Lower_z_code then
					create a_name.make (2)
					a_name.append_integer (a_char)
					character_classes_by_name.search (a_name)
					if character_classes_by_name.found then
						a_character_class := character_classes_by_name.found_item
					else
						a_character_class := new_character_class
						a_character_class.add_symbol (a_char - Case_diff)
						a_character_class.add_symbol (a_char)
						character_classes.search (a_character_class)
						if character_classes.found then
							a_character_class := character_classes.found_item
						else
							character_classes.force_new (a_character_class)
						end
						character_classes_by_name.force_new (a_character_class, a_name)
					end
					Result.build_concatenation (new_symbol_class_nfa (a_character_class))
				else
					Result.build_concatenation (new_symbol_nfa (a_char))
				end
			else
				Result.build_concatenation (new_symbol_nfa (a_char))
			end
			maximum_used_symbol := maximum_used_symbol.max (a_char)
		ensure
			string_set: Result = a_string
		end

	append_character_to_character_class (a_char: INTEGER; a_character_class: LX_SYMBOL_CLASS): LX_SYMBOL_CLASS
			-- Append character `a_char' to `a_character_class'.
		require
			a_character_class_not_void: a_character_class /= Void
		do
			Result := a_character_class
			if description.case_insensitive then
				inspect a_char
				when Upper_a_code .. Upper_z_code then
					a_character_class.add_symbol (a_char)
					a_character_class.add_symbol (a_char + Case_diff)
				when Lower_a_code .. Lower_z_code then
					a_character_class.add_symbol (a_char - Case_diff)
					a_character_class.add_symbol (a_char)
				else
					a_character_class.add_symbol (a_char)
				end
			else
				a_character_class.add_symbol (a_char)
			end
			if description.utf8_mode then
				maximum_used_symbol := maximum_used_symbol.max ({CHARACTER_8}.max_value)
			else
				maximum_used_symbol := maximum_used_symbol.max (a_char)
			end
		ensure
			character_class_set: Result = a_character_class
		end

	append_character_set_to_character_class (char1, char2: INTEGER; a_character_class: LX_SYMBOL_CLASS): LX_SYMBOL_CLASS
			-- Append character set `char1'-`char2' to `a_character_class'.
		require
			a_character_class_not_void: a_character_class /= Void
		local
			a_char: INTEGER
		do
			Result := a_character_class
			if char1 > char2 then
				report_negative_range_in_character_class_error
			elseif description.case_insensitive then
				from
					a_char := char1
				until
					a_char > char2
				loop
					inspect a_char
					when Upper_a_code .. Upper_z_code then
						a_character_class.add_symbol (a_char)
						a_character_class.add_symbol (a_char + Case_diff)
					when Lower_a_code .. Lower_z_code then
						a_character_class.add_symbol (a_char - Case_diff)
						a_character_class.add_symbol (a_char)
					else
						a_character_class.add_symbol (a_char)
					end
					a_char := a_char + 1
				end
			else
				from
					a_char := char1
				until
					a_char > char2
				loop
					a_character_class.add_symbol (a_char)
					a_char := a_char + 1
				end
			end
			if description.utf8_mode then
				maximum_used_symbol := maximum_used_symbol.max ({CHARACTER_8}.max_value)
			elseif char2 >= description.maximum_symbol then
				maximum_used_symbol := maximum_used_symbol.max (char1 - 1)
			else
				maximum_used_symbol := maximum_used_symbol.max (char2)
			end
		ensure
			character_class_set: Result = a_character_class
		end

	unions_of_concatenations_of_symbol_classes_by_utf8_character_class: DS_HASH_TABLE [like unions_of_concatenations_of_symbol_classes, LX_SYMBOL_CLASS]
				-- Unions (outer list) of the concatenations (inner lists) of symbol classes,
				-- indexed by Unicode character classes from which they are the conversion

	unions_of_concatenations_of_symbol_classes: DS_ARRAYED_LIST [DS_ARRAYED_LIST [LX_SYMBOL_CLASS]]
				-- Type anchor
			do
				check anchor: False then end
			end

	append_concatenations_of_symbol_classes_from_utf8_2_byte_character_class (a_symbol_classes: ARRAY [detachable LX_SYMBOL_CLASS]; a_preceding_1, a_preceding_2: detachable LX_SYMBOL_CLASS; a_list: DS_ARRAYED_LIST [DS_ARRAYED_LIST [LX_SYMBOL_CLASS]])
			-- Append to `a_list' the concatenations of symbol (bytes) classes corresponding
			-- to a Unicode character set whose characters can be encoded with 2 bytes in UTF-8.
			-- The first byte is the index in the array, the second byte is one of
			-- the symbols in the items of the array.
			-- `a_preceding_1' and `a_preceding_2', if not Void, are the first symbol classes
			-- in the concatenations to be added.
		require
			a_symbol_classes_not_void: a_symbol_classes /= Void
			has_symbol_class: across a_symbol_classes as i_class some i_class /= Void end
			a_list_not_void: a_list /= Void
		local
			l_done: BOOLEAN
			i, nb: INTEGER
			l_symbol_class_1: detachable LX_SYMBOL_CLASS
			l_symbol_class_2: detachable LX_SYMBOL_CLASS
			l_concatenation: DS_ARRAYED_LIST [LX_SYMBOL_CLASS]
		do
			from
			until
				l_done
			loop
				l_done := True
				from
					i := a_symbol_classes.lower
					nb := a_symbol_classes.upper
				until
					i > nb
				loop
					if attached a_symbol_classes.item (i) as l_other_symbol_class then
						l_done := False
						if l_symbol_class_2 = Void or l_symbol_class_1 = Void then
							l_symbol_class_2 := l_other_symbol_class
							l_symbol_class_1 := new_character_class
							l_symbol_class_1.add_symbol (i)
							a_symbol_classes.put (Void, i)
						elseif l_symbol_class_2.same_symbol_class (l_other_symbol_class) then
							l_symbol_class_1.add_symbol (i)
							a_symbol_classes.put (Void, i)
						end
					end
					i := i + 1
				end
				if l_symbol_class_1 /= Void and l_symbol_class_2 /= Void then
					create l_concatenation.make (4)
					if a_preceding_1 /= Void then
						l_concatenation.put_last (a_preceding_1)
					end
					if a_preceding_2 /= Void then
						l_concatenation.put_last (a_preceding_2)
					end
					l_concatenation.put_last (l_symbol_class_1)
					l_concatenation.put_last (l_symbol_class_2)
					a_list.force_last (l_concatenation)
					l_symbol_class_1 := Void
					l_symbol_class_2 := Void
				end
			end
		ensure
			added: a_list.count > old a_list.count
			wiped_out: across a_symbol_classes as i_class all i_class = Void end
		end

	append_concatenations_of_symbol_classes_from_utf8_n_byte_character_class (a_symbol_classes: ARRAY [detachable DS_HASH_SET [INTEGER]]; a_byte_count: INTEGER; a_preceding: detachable LX_SYMBOL_CLASS; a_list: DS_ARRAYED_LIST [DS_ARRAYED_LIST [LX_SYMBOL_CLASS]])
			-- Append to `a_list' the concatenations of symbol (bytes) classes corresponding
			-- to a Unicode character set whose characters can be encoded with `a_byte_count'
			--  bytes in UTF-8.
			-- The first byte is the index in the array, the next bytes are encoded in
			-- one of the integers in the items of the array (second byte in the right-most
			-- 8 bits, third byte in the preceding 8 bits, etc.).
			-- `a_preceding', if not Void, is the first symbol class in the concatenations
			-- to be added.
		require
			a_symbol_classes_not_void: a_symbol_classes /= Void
			has_symbol_class: across a_symbol_classes as i_class some i_class /= Void end
			a_byte_count_valid: a_byte_count >= 3 and a_byte_count <= 4
			no_preceding_when_4_byes: a_byte_count = 4 implies a_preceding = Void
			a_list_not_void: a_list /= Void
		local
			l_done: BOOLEAN
			i, nb: INTEGER
			l_symbol_class_1: detachable LX_SYMBOL_CLASS
			l_next_symbols_2: detachable DS_HASH_SET [INTEGER]
			l_array_2: ARRAY [detachable LX_SYMBOL_CLASS]
			l_array_n_minus_1: ARRAY [detachable DS_HASH_SET [INTEGER]]
			l_byte_1: INTEGER
			l_symbol_class_2: detachable LX_SYMBOL_CLASS
			l_next_symbols_n_minus_1: detachable DS_HASH_SET [INTEGER]
		do
			from
			until
				l_done
			loop
				l_done := True
				from
					i := a_symbol_classes.lower
					nb := a_symbol_classes.upper
				until
					i > nb
				loop
					if attached a_symbol_classes.item (i) as l_other_symbols then
						l_done := False
						if l_next_symbols_2 = Void or l_symbol_class_1 = Void then
							l_next_symbols_2 := l_other_symbols
							l_symbol_class_1 := new_character_class
							l_symbol_class_1.add_symbol (i)
							a_symbol_classes.put (Void, i)
						elseif l_next_symbols_2.is_equal (l_other_symbols) then
							l_symbol_class_1.add_symbol (i)
							a_symbol_classes.put (Void, i)
						end
					end
					i := i + 1
				end
				if l_symbol_class_1 /= Void and l_next_symbols_2 /= Void then
					if a_byte_count = 3 then
						create l_array_2.make_filled (Void, {CHARACTER_8}.min_value, {CHARACTER_8}.max_value)
						across l_next_symbols_2 as l_bytes loop
							l_byte_1 := l_bytes.item & 0xFF
							l_symbol_class_2 := l_array_2.item (l_byte_1)
							if l_symbol_class_2 = Void then
								l_symbol_class_2 := new_character_class
								l_array_2.put (l_symbol_class_2, l_byte_1)
							end
							l_symbol_class_2.add_symbol (l_bytes.item |>> {PLATFORM}.character_8_bits)
						end
						l_symbol_class_2 := Void
						append_concatenations_of_symbol_classes_from_utf8_2_byte_character_class (l_array_2, a_preceding, l_symbol_class_1, a_list)
					else
						create l_array_n_minus_1.make_filled (Void, {CHARACTER_8}.min_value, {CHARACTER_8}.max_value)
						across l_next_symbols_2 as l_bytes loop
							l_byte_1 := l_bytes.item & 0xFF
							l_next_symbols_n_minus_1 := l_array_n_minus_1.item (l_byte_1)
							if l_next_symbols_n_minus_1 = Void then
								create l_next_symbols_n_minus_1.make ({CHARACTER_8}.max_value)
								l_array_n_minus_1.put (l_next_symbols_n_minus_1, l_byte_1)
							end
							l_next_symbols_n_minus_1.force (l_bytes.item |>> {PLATFORM}.character_8_bits)
						end
						l_next_symbols_n_minus_1 := Void
						append_concatenations_of_symbol_classes_from_utf8_n_byte_character_class (l_array_n_minus_1, a_byte_count - 1, l_symbol_class_1, a_list)
					end
					l_symbol_class_1 := Void
					l_next_symbols_2 := Void
				end
			end
		ensure
			added: a_list.count > old a_list.count
			wiped_out: across a_symbol_classes as i_class all i_class = Void end
		end

	append_trail_context_to_regexp (a_trail, a_regexp: LX_NFA): LX_NFA
			-- Append trailing context `a_trail'
			-- to regular expression `a_regexp'.
		require
			a_trail_not_void: a_trail /= Void
			a_regexp_not_void: a_regexp /= Void
			rule_not_void: rule /= Void
		do
			a_trail.set_beginning_as_normal
			if not (head_count >= 0 or trail_count >= 0) then
					-- Variable trailing context rule.
					-- Mark the first part of the rule as the accepting
					-- "head" part of a trailing context rule.
				check precondition: attached rule as l_rule then
					a_regexp.set_accepted_rule (l_rule)
				end
			end
			Result := a_regexp
			Result.build_concatenation (a_trail)
		ensure
			regexp_set: Result = a_regexp
		end

	append_eol_to_regexp (a_regexp: LX_NFA): LX_NFA
			-- Append end-of-line trailing context (i.e. "$")
			-- to regular expression `a_regexp'.
		require
			a_regexp_not_void: a_regexp /= Void
		do
			Result := a_regexp
			Result.build_concatenation (new_epsilon_nfa)
			Result.build_concatenation (new_symbol_nfa (New_line_code))
		ensure
			regexp_set: Result = a_regexp
		end

	dot_character_class: LX_SYMBOL_CLASS
			-- "." character class (i.e. all characters except new_line)
		local
			dot_string: STRING_32
			l_character_classes_by_name: like character_classes_by_name
		do
			create dot_string.make (1)
			dot_string.append_character ({CHARACTER_32} '.')
			if utf8_mode.item then
				l_character_classes_by_name := utf8_character_classes_by_name
			else
				l_character_classes_by_name := character_classes_by_name
			end
			l_character_classes_by_name.search (dot_string)
			if l_character_classes_by_name.found then
				Result := l_character_classes_by_name.found_item
			else
				Result := new_character_class
				Result.add_symbol (New_line_code)
				Result.set_negated (True)
				character_classes.search (Result)
				if character_classes.found then
					Result := character_classes.found_item
				else
					character_classes.force_new (Result)
				end
				l_character_classes_by_name.force_new (Result, dot_string)
			end
		ensure
			dot_character_class_not_void: Result /= Void
		end

	set_action (a_text: STRING)
			-- Set pending rules' action using `a_text'.
		require
			a_text_not_void: a_text /= Void
		local
			i, nb: INTEGER
			action: DP_COMMAND
		do
			action := action_factory.new_action (a_text)
			nb := pending_rules.count
			from
				i := 1
			until
				i > nb
			loop
				pending_rules.item (i).set_action (action)
				i := i + 1
			end
			pending_rules.wipe_out
		end

	set_maximum_symbol_equivalence_class
			-- Take into account the fact that all symbols greater than
			-- `maximum_used_symbol' will have the same equivalence class.
			-- Set `description.maximum_symbol' to the next valid character
			-- after `maximum_used_symbol' if any.
			-- Update the character classes accordingly.
		local
			l_max: INTEGER
			l_cursor: DS_HASH_SET_CURSOR [LX_SYMBOL_CLASS]
		do
			l_max := maximum_used_symbol + 1
			if l_max < description.maximum_symbol then
				description.set_maximum_symbol (l_max)
				l_cursor := equiv_character_classes.new_cursor
				from l_cursor.start until l_cursor.after loop
					l_cursor.item.set_maximum_symbol_equivalence_class (l_max)
					l_cursor.forth
				end
			end
		end

	build_equiv_classes
			-- Build equivalence classes and renumber
			-- symbol and character class transitions.
		require
			equiv_classes_used: description.equiv_classes_used
		local
			cursor: DS_HASH_SET_CURSOR [LX_SYMBOL_CLASS]
			l_equivalence_classes: LX_EQUIVALENCE_CLASSES
		do
			create l_equivalence_classes.make (description.minimum_symbol, description.maximum_symbol)
			cursor := equiv_character_classes.new_cursor
			from cursor.start until cursor.after loop
				l_equivalence_classes.add (cursor.item)
				cursor.forth
			end
			l_equivalence_classes.build
			from cursor.start until cursor.after loop
				cursor.item.convert_to_equivalence (l_equivalence_classes)
				cursor.forth
			end
			description.set_equiv_classes (l_equivalence_classes)
		ensure
			built: attached description.equiv_classes as l_equiv_classes and then l_equiv_classes.built
		end

	check_options
			-- Check user-specified options.
		do
			if description.full_table then
				if description.meta_equiv_classes_used then
					report_full_and_meta_equiv_classes_error
				end
				if description.reject_used then
					report_full_and_reject_error
				elseif description.variable_trail_context then
					report_full_and_variable_trailing_context_error
				end
			end
		end

	override_options
			-- Override options specified in the input file.
		do
			if attached options_overrider as l_options_overrider then
				l_options_overrider.override_description (description)
			end
		end

	buffer: STRING
			-- Buffer to convert to UTF-8

	i_: INTEGER
			-- To traverse buffer

feature {NONE} -- Error handling

	report_error (a_message: STRING)
			-- Report a syntax error.
		local
			an_error: UT_SYNTAX_ERROR
		do
			create an_error.make (filename, line_nb)
			error_handler.report_error (an_error)
			successful := False
		ensure then
			not_successful: not successful
		end

	report_all_start_conditions_eof_warning
			-- Report that all start conditions already
			-- have <<EOF>> rules.
		local
			an_error: LX_ALL_START_CONDITIONS_EOF_ERROR
		do
			if not description.no_warning then
				create an_error.make (filename, line_nb)
				error_handler.report_warning (an_error)
			end
		end

	report_bad_start_condition_list_error
			-- Report the presence of a bad start condition list.
		local
			an_error: LX_BAD_START_CONDITION_LIST_ERROR
		do
			create an_error.make (filename, line_nb)
			error_handler.report_error (an_error)
			successful := False
		ensure
			not_successful: not successful
		end

	report_bad_iteration_values_error
			-- Report the presence of bad iteration values.
		local
			an_error: LX_BAD_ITERATION_VALUES_ERROR
		do
			create an_error.make (filename, line_nb)
			error_handler.report_error (an_error)
			successful := False
		ensure
			not_successful: not successful
		end

	report_iteration_not_positive_error
			-- Report that the iteration in a regular
			-- expression must be positive.
		local
			an_error: LX_ITERATION_NOT_POSITIVE_ERROR
		do
			create an_error.make (filename, line_nb)
			error_handler.report_error (an_error)
			successful := False
		ensure
			not_successful: not successful
		end

	report_multiple_EOF_rules_error (sc: STRING)
			-- Report that there are multiple <<EOF>> rules for
			-- start condition `sc'. This error is not fatal
			-- (do not set `successful' to false).
		require
			sc_not_void: sc /= Void
		local
			an_error: LX_MULTIPLE_EOF_RULES_ERROR
		do
			create an_error.make (filename, line_nb, sc)
			error_handler.report_error (an_error)
		end

	report_negative_range_in_character_class_error
			-- Report that there is a negative range in character class.
		local
			an_error: LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR
		do
			create an_error.make (filename, line_nb)
			error_handler.report_error (an_error)
			successful := False
		ensure
			not_successful: not successful
		end

	report_start_condition_specified_twice_warning (sc: STRING)
			-- Report that `sc' has been specified twice.
		require
			sc_not_void: sc /= Void
		local
			an_error: LX_START_CONDITION_SPECIFIED_TWICE_ERROR
		do
			if not description.no_warning then
				create an_error.make (filename, line_nb, sc)
				error_handler.report_warning (an_error)
			end
		end

	report_trailing_context_used_twice_error
			-- Report that trailing context is used twice.
		local
			an_error: LX_TRAILING_CONTEXT_USED_TWICE_ERROR
		do
			create an_error.make (filename, line_nb)
			error_handler.report_error (an_error)
			successful := False
		ensure
			not_successful: not successful
		end

	report_undeclared_start_condition_error (sc: STRING)
			-- Report that `sc' has not been declared as a start condition.
			-- (do not set `successful' to false).
		require
			sc_not_void: sc /= Void
		local
			an_error: LX_UNDECLARED_START_CONDITION_ERROR
		do
			create an_error.make (filename, line_nb, sc)
			error_handler.report_error (an_error)
		end

	report_unrecognized_rule_error
			-- Report an unrecoginzed rule.
		local
			an_error: LX_UNRECOGNIZED_RULE_ERROR
		do
			create an_error.make (filename, line_nb)
			error_handler.report_error (an_error)
			successful := False
		ensure
			not_successful: not successful
		end

	report_full_and_meta_equiv_classes_error
			-- Report that the use of meta equivalence classes
			-- does not make sense with full tables.
		local
			an_error: LX_FULL_AND_META_ERROR
		do
			create an_error.make
			error_handler.report_error (an_error)
			successful := False
		ensure
			not_successful: not successful
		end

	report_full_and_reject_error
			-- Report that the use of reject is incompatible
			-- with full tables.
		local
			an_error: LX_FULL_AND_REJECT_ERROR
		do
			create an_error.make
			error_handler.report_error (an_error)
			successful := False
		ensure
			not_successful: not successful
		end

	report_full_and_variable_trailing_context_error
			-- Report that the use of variable trailing context
			-- is incompatible with full tables.
		local
			an_error: LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR
		do
			create an_error.make
			error_handler.report_error (an_error)
			successful := False
		ensure
			not_successful: not successful
		end

feature {NONE} -- Constants

	Initial_max_pending_rules: INTEGER = 10
			-- Initial maximum number of pending rules

	Initial_max_start_conditions: INTEGER = 40
			-- Initial maximum number of start conditions

	Initial_old_positions: INTEGER = 10
			-- Initial maximum number of old {lines,columns,counts}

	Eof_nfa: LX_NFA
			-- End-of-file NFA
		once
			create Result.make_epsilon (False)
		ensure
			nfa_not_void: Result /= Void
		end

invariant

	pending_rules_not_void: pending_rules /= Void
	no_void_pending_rule: not pending_rules.has_void
	start_condition_stack_not_void: start_condition_stack /= Void
	action_factory_not_void: action_factory /= Void
	old_singleton_lines_not_void: old_singleton_lines /= Void
	old_singleton_columns_not_void: old_singleton_columns /= Void
	old_singleton_counts_not_void: old_singleton_counts /= Void
	old_regexp_lines_not_void: old_regexp_lines /= Void
	old_regexp_columns_not_void: old_regexp_columns /= Void
	old_regexp_counts_not_void: old_regexp_counts /= Void
	unions_of_concatenations_of_symbol_classes_by_utf8_character_class_not_void: unions_of_concatenations_of_symbol_classes_by_utf8_character_class /= Void
	no_void_union_of_concatenations_of_symbol_classes_by_utf8_character_class: not unions_of_concatenations_of_symbol_classes_by_utf8_character_class.has_void_item
	no_empty_union_of_concatenations_of_symbol_classes_by_utf8_character_class: not unions_of_concatenations_of_symbol_classes_by_utf8_character_class.there_exists (agent {DS_ARRAYED_LIST [DS_ARRAYED_LIST [LX_SYMBOL_CLASS]]}.is_empty)
	no_void_concanetation: not unions_of_concatenations_of_symbol_classes_by_utf8_character_class.there_exists (agent {DS_ARRAYED_LIST [DS_ARRAYED_LIST [LX_SYMBOL_CLASS]]}.has_void)
	no_empty_concatenation: not unions_of_concatenations_of_symbol_classes_by_utf8_character_class.there_exists (agent {DS_ARRAYED_LIST [DS_ARRAYED_LIST [LX_SYMBOL_CLASS]]}.there_exists (agent {DS_ARRAYED_LIST [LX_SYMBOL_CLASS]}.is_empty))
	no_void_symbol_class: not unions_of_concatenations_of_symbol_classes_by_utf8_character_class.there_exists (agent {DS_ARRAYED_LIST [DS_ARRAYED_LIST [LX_SYMBOL_CLASS]]}.there_exists (agent {DS_ARRAYED_LIST [LX_SYMBOL_CLASS]}.has_void))
	buffer_not_void: buffer /= Void
	maximum_used_symbol_large_enough: maximum_used_symbol >= {CHARACTER_8}.max_value

end
