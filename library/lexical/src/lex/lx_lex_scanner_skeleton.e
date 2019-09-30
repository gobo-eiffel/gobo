note

	description:

		"Scanner skeletons for lexical %
		%analyzer generators such as 'gelex'"

	library: "Gobo Eiffel Lexical Library"
	copyright: "Copyright (c) 1999-2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class LX_LEX_SCANNER_SKELETON

inherit

	YY_COMPRESSED_SCANNER_SKELETON
		rename
			make as make_compressed_scanner_skeleton,
			reset as reset_compressed_scanner_skeleton
		redefine
			report_invalid_unicode_character_error
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
			last_string_value := ""
			create last_string_32_value.make (0)
			create last_lx_symbol_class_value.make (description.minimum_symbol, description.maximum_symbol)
			error_handler := handler
			create name_definitions.make_map (Initial_max_nb_names)
			name_definitions.set_key_equality_tester (string_equality_tester)
			create character_classes.make_equal (Initial_max_character_classes)
			create character_classes_by_name.make_map (Initial_max_character_classes)
			character_classes_by_name.set_key_equality_tester (string_32_equality_tester)
			create equiv_character_classes.make (Initial_max_character_classes)
			create utf8_character_classes_by_name.make_map (Initial_max_character_classes)
			utf8_character_classes_by_name.set_key_equality_tester (string_32_equality_tester)
			create utf8_mode.make (Initial_max_utf8_mode)
			utf8_mode.force (description.utf8_mode)
			successful := True
			line_nb := 1
			eiffel_verbatim_marker := eiffel_no_verbatim_marker
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
			last_string_value := ""
			create last_string_32_value.make (0)
			create last_lx_symbol_class_value.make (description.minimum_symbol, description.maximum_symbol)
			error_handler := handler
			create name_definitions.make_map (Initial_max_nb_names)
			name_definitions.set_key_equality_tester (string_equality_tester)
			create character_classes.make_equal (Initial_max_character_classes)
			create character_classes_by_name.make_map (Initial_max_character_classes)
			character_classes_by_name.set_key_equality_tester (string_32_equality_tester)
			create equiv_character_classes.make (Initial_max_character_classes)
			create utf8_character_classes_by_name.make_map (Initial_max_character_classes)
			utf8_character_classes_by_name.set_key_equality_tester (string_32_equality_tester)
			create utf8_mode.make (Initial_max_utf8_mode)
			utf8_mode.force (a_description.utf8_mode)
			successful := True
			line_nb := 1
			eiffel_verbatim_marker := eiffel_no_verbatim_marker
		ensure
			description_set: description = a_description
			error_handler_set: error_handler = handler
		end

feature -- Initialization

	reset
			-- Reset scanner before scanning next input.
		do
			reset_compressed_scanner_skeleton
			last_string_value := ""
			create last_string_32_value.make (0)
			create last_lx_symbol_class_value.make (description.minimum_symbol, description.maximum_symbol)
			description.reset
			name_definitions.wipe_out
			character_classes.wipe_out
			character_classes_by_name.wipe_out
			equiv_character_classes.wipe_out
			utf8_character_classes_by_name.wipe_out
			utf8_mode.wipe_out
			utf8_mode.force (description.utf8_mode)
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

	character_classes: DS_HASH_SET [LX_SYMBOL_CLASS]
			-- Character classes built so far

	character_classes_by_name: DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_32]
			-- Character classes indexed by names

	equiv_character_classes: DS_HASH_SET [LX_SYMBOL_CLASS]
			-- Character classes already added to `description.equiv_classes'

	utf8_character_classes_by_name: DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_32]
			-- Character classes to be converted to UTF-8, indexed by names
			-- (each to be converted to unions of concatenations of UTF-8 byte symbol classes)

	character_class_with_name (a_name: STRING_32): detachable LX_SYMBOL_CLASS
			-- Character class (or character class to be converted to UTF-8
			-- if in UTF-8 mode) with name `a_name' if already parsed.
			-- Void otherwise.
		require
--			valid_text: `a_name' recognized by "["{FIRST_CCL_CHAR}{CCL_CHAR}*"]"
		local
			l_character_classes_by_name: like character_classes_by_name
		do
			if utf8_mode.item then
				l_character_classes_by_name := utf8_character_classes_by_name
			else
				l_character_classes_by_name := character_classes_by_name
			end
			l_character_classes_by_name.search (a_name)
			if l_character_classes_by_name.found then
				Result := l_character_classes_by_name.found_item
			end
		end

	name_definitions: DS_HASH_TABLE [STRING_32, STRING_8]
			-- Name definition table

	utf8_mode: DS_ARRAYED_STACK [BOOLEAN]
			-- Should characters in the currently processed regular expression
			-- be handled as their sequence of UTF-8 bytes?

	nb_open_brackets: INTEGER
			-- Number of characters { not-yet-balanced
			-- in semantic actions

	last_string: detachable STRING_8
			-- Last string which has been read

	last_integer_value: INTEGER
			-- Last semantic value of type INTEGER

	last_string_value: STRING
			-- Last semantic value of type STRING

	last_string_32_value: STRING_32
			-- Last semantic value of type STRING_32

	last_lx_symbol_class_value: LX_SYMBOL_CLASS
			-- Last semantic value of type LX_SYMBOL_CLASS

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

feature {NONE} -- Eiffel code scanning

	eiffel_text_count: INTEGER
			-- Number of characters read so far in the Eiffel code block

	eiffel_more
			-- Update `eiffel_text_count', then
			-- tell scanner to append the next matched token
			-- to current value of `text' instead of
			-- replacing it.
		do
			eiffel_text_count := text_count
			more
		end

	eiffel_verbatim_marker: STRING_32
			-- Marker of Eiffel verbatim string currently scanned

	eiffel_verbatim_opening_character: CHARACTER_32
			-- Eiffel verbatim string opening character [ or {

	eiffel_no_verbatim_marker: STRING_32 = ""
			-- No verbatim marker

	is_eiffel_verbatim_string_closer (a_start, an_end: INTEGER): BOOLEAN
			-- Is string between indexes `a_start' and `an_end' the
			-- end marker of the Eiffel verbatim string currently scanned?
		require
			verbatim_string_scanned: eiffel_verbatim_marker /= eiffel_no_verbatim_marker
			a_start_large_enough: a_start >= 1
			an_end_small_enough: an_end <= text_count
			valid_string: {RX_PCRE_ROUTINES}.regexp ("(\r?\n)?[ \t\x0B\f\r\u{00A0}\u{1680}\u{2000}-\u{200A}\u{202F}\u{205F}\u{3000}]*[\]\}][^\n%"]*").recognizes (unicode_text_substring (a_start, an_end))
		local
			i, j, nb: INTEGER
			l_marker_count: INTEGER
			l_text_count: INTEGER
			c: CHARACTER_32
		do
			l_marker_count := eiffel_verbatim_marker.count
			l_text_count := an_end - a_start + 1
			if l_text_count > l_marker_count then
				nb := an_end - l_marker_count
				c := unicode_text_item (nb)
				if (c = ']' or c = '}') and then c = eiffel_verbatim_opening_character + 2 then
					Result := True
						-- Compare end marker with start marker.
					j := nb + 1
					from i := 1 until i > l_marker_count loop
						c := eiffel_verbatim_marker.item (i)
						if c = unicode_text_item (j) then
							i := i + 1
							j := j + 1
						else
							Result := False
								-- Jump out of the loop.
							i := l_marker_count + 1
						end
					end
					if Result then
							-- Check that all leading characters are white characters.
						from j := a_start until j = nb loop
							inspect unicode_text_item (j).natural_32_code
							when 9..13, 32, 160, 5760, 8192..8202, 8239, 8287, 12288 then
								j := j + 1
							else
								Result := False
								j := nb -- Jump out of the loop.
							end
						end
					end
				end
			end
		end

feature {NONE} -- Implementation

	put_back_string (str: STRING_32)
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
				unread_unicode_character (str.item (i))
				i := i - 1
			end
		end

	add_new_start_condition (a_name: STRING_8; exclusive: BOOLEAN)
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
		require
			a_code_not_negative: a_code >= 0
		do
			if description.utf8_mode and then not utf8_mode.item then
					-- Byte mode.
				if a_code <= {CHARACTER_8}.max_value then
					last_integer_value := a_code
				else
					report_character_out_of_range_error (character_text)
					last_integer_value := 0
				end
			else
				if a_code < {UC_UNICODE_CONSTANTS}.minimum_unicode_surrogate_code then
					last_integer_value := a_code
				elseif a_code <= {UC_UNICODE_CONSTANTS}.maximum_unicode_surrogate_code then
					report_invalid_character_error (character_text)
					last_integer_value := 0
				elseif a_code > {UC_UNICODE_CONSTANTS}.maximum_unicode_character_code then
					report_invalid_character_error (character_text)
					last_integer_value := 0
				else
					last_integer_value := a_code - {UC_UNICODE_CONSTANTS}.unicode_surrogate_count
				end
				if last_integer_value > description.maximum_symbol then
					report_character_out_of_range_error (character_text)
					last_integer_value := 0
				end
			end
		end

	process_escaped_character
			-- Process escaped character whose printable representation
			-- is held in `text'.
			-- Check whether the corresponding character is not out of range.
			-- Set `last_integer_value' accordingly.
		require
--			valid_text: `text' recognized by \\.
		local
			c: CHARACTER
			a_code: INTEGER
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
			else
				a_code := c.code
			end
			process_character (a_code)
		end

	process_octal_character
			-- Process octal escaped character whose printable representation
			-- is held in `text'.
			-- Check whether the corresponding byte is not out of range.
			-- Set `last_integer_value' accordingly.
		require
--			valid_text: `text' recognized by \\[0-7]{1,3}
		local
			a_code: INTEGER
			i, nb: INTEGER
		do

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
			process_character (a_code)
		end

	process_hexadecimal_character
			-- Process hexadecimal escaped character whose printable representation
			-- is held in `text'.
			-- Check whether the corresponding byte is not out of range.
			-- Set `last_integer_value' accordingly.
		require
--			valid_text: `text' recognized by \\x[0-9a-f]{1,2}|\\x\{[0-9a-f]{1,6}\}
		local
			c: CHARACTER
			a_code: INTEGER
			i, nb: INTEGER
		do
			nb := text_count
			a_code := 0
			from
				i := 3
				if text_item (i) = '{' then
					i := i + 1
					nb := nb - 1
				end
			until
				i > nb
			loop
				a_code := a_code * 16
				c := text_item (i)
				inspect c
				when '0' .. '9' then
					a_code := a_code + c.code - Zero_code
				when 'a' .. 'f' then
					a_code := a_code + c.code - Lower_a_code + 10
				when 'A' .. 'F' then
					a_code := a_code + c.code - Upper_a_code + 10
				end
				i := i + 1
			end
			process_character (a_code)
		end

	process_unicode_character
			-- Process escaped Unicode character whose printable representation
			-- is held in `text'.
			-- Check whether the corresponding Unicode character is valid.
			-- Set `last_integer_value' accordingly.
		require
--			valid_text: `text' recognized by \\u[0-9a-f]{1,4}|\\u\{[0-9a-f]{1,6}\}
		local
			c: CHARACTER
			a_code: INTEGER
			i, nb: INTEGER
		do
			nb := text_count
			a_code := 0
			from
				i := 3
				if text_item (i) = '{' then
					i := i + 1
					nb := nb - 1
				end
			until
				i > nb
			loop
				a_code := a_code * 16
				c := text_item (i)
				inspect c
				when '0' .. '9' then
					a_code := a_code + c.code - Zero_code
				when 'a' .. 'f' then
					a_code := a_code + c.code - Lower_a_code + 10
				when 'A' .. 'F' then
					a_code := a_code + c.code - Upper_a_code + 10
				end
				i := i + 1
			end
			process_character (a_code)
		end

	process_single_character
			-- Process Unicode character whose printable representation
			-- is held in `unicode_text'.
			-- Check whether the corresponding Unicode character is valid.
			-- Set `last_integer_value' accordingly.
		require
			single_character: text_count = 1
		local
			l_code: NATURAL_32
		do
			l_code := unicode_text_item (1).natural_32_code
			if l_code <= {UC_UNICODE_CONSTANTS}.maximum_unicode_character_natural_32_code then
				process_character (l_code.to_integer_32)
			else
				report_invalid_character_error (character_text)
				last_integer_value := 0
			end
		end

	process_name_definition (a_name: STRING_8; a_definition: STRING_32)
			-- Keep track of name definition.
			-- Trailing spaces are removed from `a_definition'
			-- and parentheses are added around it.
		require
			a_name_not_void: a_name /= Void
			a_definition_not_void: a_definition /= Void
		local
			bracketed_name: STRING_8
			parenthesised_definition: STRING_32
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

	character_text: STRING_8
			-- Textual representation of the character corresponding to
			-- `unicode_text'
		local
			l_character: CHARACTER_32
		do
			if text_count = 1 then
				Result := text
			else
				l_character := unicode_text_item (1)
				if l_character.is_character_8 then
					Result := text
				else
					Result := "\x{" + l_character.natural_32_code.to_hex_string + "}"
				end
			end
		ensure
			character_text_not_void: Result /= Void
		end

feature {NONE} -- Error handling

	report_invalid_unicode_character_error (a_code: NATURAL_32)
			-- Report that the surrogate or invalid Unicode character
			-- with code `a_code' has been read from the input
			-- buffer and caused the scanner to fail.
		do
			report_invalid_character_error ("\u{" + a_code.to_hex_string + "}")
		ensure then
			not_successful: not successful
		end

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

	report_invalid_character_error (a_char: STRING)
			-- Report that character `a_char' is not a valid Unicode character.
		require
			a_char_not_void: a_char /= Void
		local
			an_error: LX_INVALID_UNICODE_CHARACTER_ERROR
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

	Initial_max_utf8_mode: INTEGER = 10
			-- Initial maximum number of modes in `utf8_mode'

invariant

	description_not_void: description /= Void
	error_handler_not_void: error_handler /= Void
	name_definitions_not_void: name_definitions /= Void
	no_void_name_definition: not name_definitions.has_void_item
	character_classes_not_void: character_classes /= Void
	no_void_character_class: not character_classes.has_void
	character_classes_by_name_not_void: character_classes_by_name /= Void
	no_void_named_character_class: not character_classes_by_name.has_void_item
	equiv_character_classes_not_void: equiv_character_classes /= Void
	no_void_equiv_character_class: not equiv_character_classes.has_void
	utf8_character_classes_by_name_not_void: utf8_character_classes_by_name /= Void
	no_void_named_utf8_character_class: not utf8_character_classes_by_name.has_void_item
	utf8_mode_not_void: utf8_mode /= Void
	utf8_mode_not_empty: not utf8_mode.is_empty
	eiffel_verbatim_marker_not_void: eiffel_verbatim_marker /= Void

end
