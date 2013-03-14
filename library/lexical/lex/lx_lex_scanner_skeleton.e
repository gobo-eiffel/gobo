note

	description:

		"Scanner skeletons for lexical %
		%analyzer generators such as 'gelex'"

	library: "Gobo Eiffel Lexical Library"
	copyright: "Copyright (c) 1999-2012, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class LX_LEX_SCANNER_SKELETON

inherit

	YY_COMPRESSED_SCANNER_SKELETON
		rename
			make as make_compressed_scanner_skeleton,
			reset as reset_compressed_scanner_skeleton
		end

	UT_CHARACTER_CODES
		export {NONE} all end

	KL_IMPORTED_STRING_ROUTINES

	KL_SHARED_STRING_EQUALITY_TESTER

feature {NONE} -- Initialization

	make (handler: like error_handler)
			-- Create a new scanner description scanner.
		require
			handler_not_void: handler /= Void
		do
			create description.make
			make_with_buffer (Empty_buffer)
			error_handler := handler
			create name_definitions.make_map (Initial_max_nb_names)
			name_definitions.set_key_equality_tester (string_equality_tester)
			create character_classes.make_map (Initial_max_character_classes)
			character_classes.set_key_equality_tester (string_equality_tester)
			successful := True
			line_nb := 1
		ensure
			error_handler_set: error_handler = handler
		end

	make_from_description (a_description: LX_DESCRIPTION; handler: like error_handler)
			-- Create a new scanner description scanner and
			-- initialize it with `a_description'.
		require
			a_description_not_void: a_description /= Void
			handler_not_void: handler /= Void
		do
			description := a_description
			make_with_buffer (Empty_buffer)
			error_handler := handler
			create name_definitions.make_map (Initial_max_nb_names)
			name_definitions.set_key_equality_tester (string_equality_tester)
			create character_classes.make_map (Initial_max_character_classes)
			character_classes.set_key_equality_tester (string_equality_tester)
			successful := True
			line_nb := 1
		ensure
			description_set: description = a_description
			error_handler_set: error_handler = handler
		end

feature -- Initialization

	reset
			-- Reset scanner before scanning next input.
		do
			reset_compressed_scanner_skeleton
			description.reset
			name_definitions.wipe_out
			character_classes.wipe_out
			successful := True
			line_nb := 1
			nb_open_brackets := 0
			last_string := Void
		end

feature -- Status report

	successful: BOOLEAN
			-- Has no fatal error been detected?

feature -- Access

	description: LX_DESCRIPTION
			-- Scanner description

	error_handler: UT_ERROR_HANDLER
			-- Error handler

	line_nb: INTEGER
			-- Current line number

	rule_line_nb: INTEGER
			-- Line number of rule being parsed

	filename: STRING
			-- Name of file being parsed
		do
			if attached {YY_FILE_BUFFER} input_buffer as file_buffer then
				Result := file_buffer.file.name
			else
				Result := "string"
			end
		ensure
			filename_not_void: Result /= Void
		end

feature {NONE} -- Access

	character_classes: DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING]
			-- Character classes declared so far

	name_definitions: DS_HASH_TABLE [STRING, STRING]
			-- Name definition table

	nb_open_brackets: INTEGER
			-- Number of characters { not-yet-balanced
			-- in semantic actions

	last_string: STRING
			-- Last string which has been read

	last_integer_value: INTEGER
			-- Last semantic value of type INTEGER

feature -- Setting

	set_error_handler (handler: like error_handler)
			-- Set `error_handler' to `handler'.
		require
			handler_not_void: handler /= Void
		do
			error_handler := handler
		ensure
			error_handler_set: error_handler = handler
		end

feature {NONE} -- Implementation

	put_back_string (str: STRING)
			-- Put `str' back to buffer for the scanner
			-- to analyze it again.
		require
			str_not_void: str /= Void
		local
			i: INTEGER
		do
			from
				i := str.count
			until
				i < 1
			loop
				unread_character (str.item (i))
				i := i - 1
			end
		end

	add_new_start_condition (a_name: STRING; exclusive: BOOLEAN)
			-- Create a new start condition named `a_name' and
			-- insert it at the end of `start_conditions'.
		require
			a_name_not_void: a_name /= Void
		local
			start_conditions: LX_START_CONDITIONS
		do
			start_conditions := description.start_conditions
			if start_conditions.has_start_condition (a_name) then
				report_start_condition_declared_twice_error (a_name)
			else
				start_conditions.force_new_start_condition (a_name, exclusive)
			end
		end

	process_character (a_code: INTEGER)
			-- Check whether `a_code' is a valid code for character
			-- whose printable representation is held in `text'.
			-- Set `last_integer_value' accordingly.
		do
			if a_code < description.characters_count then
				last_integer_value := a_code
			else
				report_character_out_of_range_error (text)
				last_integer_value := 0
			end
		end

	process_escaped_character
			-- Process escaped character whose printable representation
			-- is held in `text'. Check whether the corresponding
			-- character is not out of range. Set `last_integer_value' accordingly.
		require
--			valid_text: `text' recognized by \\(.|[0-7]{1,3}|x[0-9a-f]{1,2})
		local
			c: CHARACTER
			a_code: INTEGER
			i, nb: INTEGER
		do
			c := text_item (2)
			inspect c
			when 'b' then
				a_code := Back_space_code
			when 'f' then
				a_code := Form_feed_code
			when 'n' then
				a_code := New_line_code
			when 'r' then
				a_code := Carriage_return_code
			when 't' then
				a_code := Tabulation_code
			when 'a' then
				a_code := 7
			when 'v' then
				a_code := 13
			when '0' .. '7' then
					-- Octal.
				nb := text_count
				a_code := 0
				from
					i := 2
				until
					i > nb
				loop
					a_code := a_code * 8 + text_item (i).code - Zero_code
					i := i + 1
				end
			when 'x', 'X' then
				nb := text_count
				if nb = 2 then
					a_code := c.code
				else
						-- Hexadecimal.
					a_code := 0
					from
						i := 3
					until
						i > nb
					loop
						a_code := a_code * 16
						c := text_item (i)
						inspect c
						when '0' .. '9' then
							a_code := a_code + c.code - Zero_code
						when 'a' .. 'z' then
							a_code := a_code + c.code - Lower_a_code + 10
						when 'A' .. 'Z' then
							a_code := a_code + c.code - Upper_a_code + 10
						end
						i := i + 1
					end
				end
			else
				a_code := c.code
			end
			process_character (a_code)
		end

	process_name_definition (a_name, a_definition: STRING)
			-- Keep track of name definition.
			-- Trailing spaces are removed from `a_definition'
			-- and parentheses are added around it.
		require
			a_name_not_void: a_name /= Void
			a_definition_not_void: a_definition /= Void
		local
			bracketed_name: STRING
			parenthesised_definition: STRING
			i, nb: INTEGER
			stop: BOOLEAN
		do
			create bracketed_name.make (a_name.count + 2)
			bracketed_name.append_character ('{')
			bracketed_name.append_string (a_name.as_lower)
			bracketed_name.append_character ('}')
			if name_definitions.has (bracketed_name) then
				report_name_defined_twice_error (a_name)
			end
			create parenthesised_definition.make (a_definition.count + 2)
			parenthesised_definition.append_character ('(')
				-- Skip trailing white spaces.
			from
				nb := a_definition.count
				i := nb
			until
				i < 1 or stop
			loop
				inspect a_definition.item (i)
				when ' ', '%T', '%R', '%N' then
					i := i - 1
				else
					stop := True
				end
			end
			if i >= 1 then
				if i < nb then
					parenthesised_definition.append_string (a_definition.substring (1, i))
				else
					parenthesised_definition.append_string (a_definition)
				end
			end
			parenthesised_definition.append_character (')')
			name_definitions.force (parenthesised_definition, bracketed_name)
		end

feature {NONE} -- Error handling

	report_bad_character_error (a_char: STRING)
			-- Report the presence of a bad character `a_char'.
		require
			a_char_not_void: a_char /= Void
		local
			an_error: LX_BAD_CHARACTER_ERROR
		do
			create an_error.make (filename, line_nb, a_char)
			error_handler.report_error (an_error)
			successful := False
		ensure
			not_successful: not successful
		end

	report_bad_character_class_error
			-- Report the presence of a bad character class.
		local
			an_error: LX_BAD_CHARACTER_CLASS_ERROR
		do
			create an_error.make (filename, line_nb)
			error_handler.report_error (an_error)
			successful := False
		ensure
			not_successful: not successful
		end

	report_bad_character_in_brackets_error
			-- Report the presence of a bad character in {}'s.
		local
			an_error: LX_BAD_CHARACTER_IN_BRACKETS_ERROR
		do
			create an_error.make (filename, line_nb)
			error_handler.report_error (an_error)
			successful := False
		ensure
			not_successful: not successful
		end

	report_bad_start_condition_error (sc: STRING)
			-- Report the presence of a bad start condition `sc'.
		require
			sc_not_void: sc /= Void
		local
			an_error: LX_BAD_START_CONDITION_ERROR
		do
			create an_error.make (filename, line_nb, sc)
			error_handler.report_error (an_error)
			successful := False
		ensure
			not_successful: not successful
		end

	report_character_out_of_range_error (a_char: STRING)
			-- Report that character `a_char' is out of range.
		require
			a_char_not_void: a_char /= Void
		local
			an_error: LX_CHARACTER_OUT_OF_RANGE_ERROR
		do
			create an_error.make (filename, line_nb, a_char)
			error_handler.report_error (an_error)
			successful := False
		ensure
			not_successful: not successful
		end

	report_integer_too_large_error (an_int: STRING)
			-- Report that integer `an_int' is too large (implementation limitation).
		require
			an_int_not_void: an_int /= Void
		local
			an_error: LX_INTEGER_TOO_LARGE_ERROR
		do
			create an_error.make (filename, line_nb, an_int)
			error_handler.report_error (an_error)
			successful := False
		ensure
			not_successful: not successful
		end

	report_directive_expected_error
			-- Report that a '%' directive was expected.
		local
			an_error: LX_DIRECTIVE_EXPECTED_ERROR
		do
			create an_error.make (filename, line_nb)
			error_handler.report_error (an_error)
			successful := False
		ensure
			not_successful: not successful
		end

	report_incomplete_name_definition_error
			-- Report an incomplete name definition.
		local
			an_error: LX_INCOMPLETE_NAME_DEFINITION_ERROR
		do
			create an_error.make (filename, line_nb)
			error_handler.report_error (an_error)
			successful := False
		ensure
			not_successful: not successful
		end

	report_missing_bracket_error
			-- Report a missing }.
		local
			an_error: LX_MISSING_BRACKET_ERROR
		do
			create an_error.make (filename, line_nb)
			error_handler.report_error (an_error)
			successful := False
		ensure
			not_successful: not successful
		end

	report_missing_quote_error
			-- Report a missing quote.
		local
			an_error: LX_MISSING_QUOTE_ERROR
		do
			create an_error.make (filename, line_nb)
			error_handler.report_error (an_error)
			successful := False
		ensure
			not_successful: not successful
		end

	report_name_defined_twice_error (a_name: STRING)
			-- Report that `a_name' has been defined twice.
		require
			a_name_not_void: a_name /= Void
		local
			an_error: LX_NAME_DEFINED_TWICE_ERROR
		do
			create an_error.make (filename, line_nb, a_name)
			error_handler.report_error (an_error)
			successful := False
		ensure
			not_successful: not successful
		end

	report_start_condition_declared_twice_error (sc: STRING)
			-- Report that `sc' has been declared twice.
			-- This error is not fatal (do not set
			-- `successful' to false).
		require
			sc_not_void: sc /= Void
		local
			an_error: LX_START_CONDITION_DECLARED_TWICE_ERROR
		do
			create an_error.make (filename, line_nb, sc)
			error_handler.report_error (an_error)
		end

	report_start_condition_expected_error
			-- Report that a start condition name was expected.
		local
			an_error: LX_START_CONDITION_EXPECTED_ERROR
		do
			create an_error.make (filename, line_nb)
			error_handler.report_error (an_error)
			successful := False
		ensure
			not_successful: not successful
		end

	report_undefined_definition_error (def: STRING)
			-- Report an undefined definition.
		require
			def_not_void: def /= Void
		local
			an_error: LX_UNDEFINED_DEFINITION_ERROR
		do
			create an_error.make (filename, line_nb, def)
			error_handler.report_error (an_error)
			successful := False
		ensure
			not_successful: not successful
		end

	report_unrecognized_directive_error
			-- Report an unrecoginzed '%' directive.
		local
			an_error: LX_UNRECOGNIZED_DIRECTIVE_ERROR
		do
			create an_error.make (filename, line_nb)
			error_handler.report_error (an_error)
			successful := False
		ensure
			not_successful: not successful
		end

	report_unrecognized_option_error (an_option: STRING)
			-- Report an unrecoginzed %option.
		require
			an_option_not_void: an_option /= Void
		local
			an_error: LX_UNRECOGNIZED_OPTION_ERROR
		do
			create an_error.make (filename, line_nb, an_option)
			error_handler.report_error (an_error)
			successful := False
		ensure
			not_successful: not successful
		end

feature {NONE} -- Constants

	Initial_max_nb_names: INTEGER = 101
			-- Maximum number of name definitions

	Initial_max_character_classes: INTEGER = 101
			-- Maximum number of character classes

invariant

	description_not_void: description /= Void
	error_handler_not_void: error_handler /= Void
	name_definitions_not_void: name_definitions /= Void
	no_void_name_definition: not name_definitions.has_void_item
	character_classes_not_void: character_classes /= Void
	no_void_character_class: not character_classes.has_void_item

end
