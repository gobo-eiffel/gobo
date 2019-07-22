note

	description:

		"PCRE regexp compilers"

	library: "Gobo Eiffel Regexp Library"
	copyright: "Copyright (c) 2001-2019, Harald Erdbruegger and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class RX_PCRE_COMPILER

inherit

	ANY

	RX_PCRE_BYTE_CODE_CONSTANTS
		export {NONE} all end

	RX_PCRE_ERROR_CONSTANTS
		export {NONE} all end

	RX_PCRE_ESCAPE_CONSTANTS
		export {NONE} all end

	RX_PCRE_OPTION_ROUTINES
		export {NONE} all end

	RX_PCRE_SHARED_CHARACTER_SETS
		export
			{ANY}
				default_character_case_mapping,
				default_word_set
			{NONE} all
		end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

	KL_IMPORTED_CHARACTER_ROUTINES
		export {NONE} all end

	KL_IMPORTED_INTEGER_ROUTINES
		export {NONE} all end

	UT_IMPORTED_FORMATTERS
		export {NONE} all end

	KL_SHARED_STANDARD_FILES
		export {NONE} all end

	KL_SHARED_PLATFORM
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make
			-- Create a new regexp compiler.
		do
			create byte_code.make (1024)
			create internal_start_bits.make_empty
			pattern_buffer := STRING_.cloned_string (empty_pattern_buffer)
			reset
			set_character_case_mapping (default_character_case_mapping)
			set_word_set (default_word_set)
			set_default_options
		ensure
			not_compiled: not is_compiled
		end

feature -- Status report

	is_compiled: BOOLEAN
			-- Was last compilation successful?
		do
			Result := STRING_.same_string (error_message, err_msg_0)
		ensure
			pattern_not_void: Result implies pattern /= Void
		end

	is_case_insensitive: BOOLEAN
			-- Do letters in the pattern match both upper- and lower-case letters?
			-- This option cannot be changed after compilation.
			-- (It is equivalent to Perl's /i option.)
			-- Note that, unless overridden with `set_character_case_mapping',
			-- only ASCII characters (with code less than 128) are taken into account.
		do
			Result := is_caseless
		ensure
			definition: Result = is_caseless
		end

	is_caseless: BOOLEAN
			-- Do letters in the pattern match both upper- and lower-case letters?
			-- This option cannot be changed after compilation.
			-- (It is equivalent to Perl's /i option.)
			-- Note that, unless overridden with `set_character_case_mapping',
			-- only ASCII characters (with code less than 128) are taken into account.

	is_extended: BOOLEAN
			-- Are whitespace data characters in the pattern totally ignored
			-- except when escaped or inside a character class, and are
			-- characters between an unescaped # outside a character class
			-- and the next newline character, inclusive, also ignored?
			-- This option cannot be changed after compilation.
			-- (This is equivalent to Perl's /x option, and makes it possible
			-- to include comments inside complicated patterns. Note, however,
			-- that this applies only to data characters. Whitespace characters
			-- may never appear within special character sequences in a pattern,
			-- for example within the sequence (?( which introduces a conditional
			-- subpattern.)

	is_greedy: BOOLEAN
			-- Is the "greediness" of the quantifiers inverted so that they are
			-- are not greedy by default, but become greedy if followed by "?"?
			-- This option cannot be changed after compilation.
			-- (It is not compatible with Perl. It can also be set by a (?U)
			-- option setting within the pattern.)

	is_multiline: BOOLEAN
			-- By default, PCRE treats the input string as consisting of
			-- a single "line" of characters (even if it actually contains
			-- several newlines). The "start of line" metacharacter (^)
			-- matches only at the start of the string, while the "end of
			-- line" metacharacter ($) matches only at the end of the
			-- string, or before a terminating newline (unless
			-- `is_dollar_endonly' is set). This is the same as Perl.
			-- When `is_multiline' it is set, the "start of line" and "end
			-- of line" constructs match immediately following or immediately
			-- before any newline in the input string, respectively, as
			-- well as at the very start and end. This is equivalent to
			-- Perl's /m option. If there are no "\n" characters in an
			-- input string, or no occurrences of ^ or $ in a pattern,
			-- setting `is_multiline' has no effect.

	is_dotall: BOOLEAN
			-- If this option is set, a dot metacharater in the pattern
			-- matches all characters, including newlines. Without it,
			-- newlines are excluded. This option is equivalent to
			-- Perl's /s option. A negative class such as [^a] always
			-- matches a newline character, independent of the setting
			-- of this option.

	is_empty_allowed: BOOLEAN
			-- An empty string is not considered to be a valid match if
			-- this option is not set. If there are alternatives in the
			-- pattern, they are tried. If all the alternatives match the
			-- empty string, the entire match fails. For example, if the
			-- pattern "a?b?" is applied to a string not beginning with
			-- "a" or "b", it matches the empty string at the start of
			-- the input. With not `is_empty_allowed', this match is not
			-- valid, so PCRE searches further into the string for
			-- occurrences of "a" or "b". Perl has no direct equivalent
			-- of `is_empty_allowed', but it does make a special case of
			-- a pattern  match of the empty string  within its split()
			-- function, and when using the /g modifier. It is possible to
			-- emulate Perl's behaviour after matching a null string by first
			-- trying the match again at the same offset with `is_empty_allowed'
			-- not set, and then if that fails by advancing the starting
			-- offset (see below) and trying an ordinary match again.

	is_dollar_endonly: BOOLEAN
			-- If this option is set, a dollar metacharacter in the pattern
			-- matches only at the end of the input string. Without this
			-- option, a dollar also matches immediately before the final
			-- character if it is a newline (but not before any other
			-- newlines). The `is_dollar_endonly' option is ignored if
			-- `is_multiline' is set. There is no equivalent to this option
			-- in Perl.

	is_bol: BOOLEAN
			-- If not set, the first character of the string is not the
			-- beginning of a line, so the circumflex metacharacter should
			-- not match before it. Clearing this without `is_multiline'
			-- (at compile-time) causes circumflex never to match.

	is_eol: BOOLEAN
			-- If not set, the end of the string is not the end of a line,
			-- so the dollar metacharacter should not match it nor (except
			-- in multiline mode) a newline immediately before it. Setting
			-- this without `is_multiline' (at compile-time) causes dollar
			-- never to match.

	is_anchored: BOOLEAN
			-- If this option is set, the pattern is forced to be "anchored",
			-- that is, it is constrained to match only at the start of the
			-- string which is being searched (the "input string").  This
			-- effect can also be achieved by appropriate constructs in the
			-- pattern itself (^), which is the only way to do it in Perl.

	is_strict: BOOLEAN
			-- If true, the compiler checks the patterns more strictly, i.e.
			-- an unknown escaped character is reported as an error. Otherwise
			-- the character is treated as itself.
			-- This option cannot be changed after compilation, you need to
			-- reset the compiler.

feature -- Access

	pattern: detachable READABLE_STRING_GENERAL
			-- Pattern being compiled

	byte_code: RX_BYTE_CODE
			-- Byte code built during compilation

	character_case_mapping: RX_CASE_MAPPING
			-- Character lower- and upper-case mapping

	word_set: RX_CHARACTER_SET
			-- Set of characters making up words

feature -- Status setting

	set_default_options
			-- Set default options.
		require
			not_compiled: not is_compiled
		do
			set_caseless (False)
			set_multiline (False)
			set_dotall (False)
			set_extended (False)
			set_empty_allowed (True)
			set_dollar_endonly (False)
			set_bol (True)
			set_eol (True)
			set_anchored (False)
			set_greedy (True)
			set_strict (False)
		ensure
			caseless_set: is_caseless = False
			multiline_set: is_multiline = False
			dotall_set: is_dotall = False
			extended_set: is_extended = False
			empty_allowed_set: is_empty_allowed = True
			dollar_endonly_set: is_dollar_endonly = False
			bol_set: is_bol = True
			eol_set: is_eol = True
			anchored_set: is_anchored = False
			greedy_set: is_greedy = True
			strict_set: is_strict = False
		end

	set_case_insensitive (b: BOOLEAN)
			-- Set `is_case_insensitive' to `b'.
		require
			not_compiled: not is_compiled
		do
			set_caseless (b)
		ensure
			case_insensitive_set: is_case_insensitive = b
		end

	set_caseless (b: BOOLEAN)
			-- Set `is_caseless' to `b'.
		require
			not_compiled: not is_compiled
		do
			is_caseless := b
		ensure
			caseless_set: is_caseless = b
		end

	set_extended (b: BOOLEAN)
			-- Set `is_extended' to `b'.
		require
			not_compiled: not is_compiled
		do
			is_extended := b
		ensure
			extended_set: is_extended = b
		end

	set_greedy (b: BOOLEAN)
			-- Set `is_greedy' to `b'.
		require
			not_compiled: not is_compiled
		do
			is_greedy := b
		ensure
			greedy_set: is_greedy = b
		end

	set_strict (b: BOOLEAN)
			-- Set 'is_strict' to 'b'.
		require
			not_compiled: not is_compiled
		do
			is_strict := b
		ensure
			strict_set: is_strict = b
		end

	set_multiline (b: BOOLEAN)
			-- Set `is_multiline' to `b'.
		do
			is_multiline := b
		ensure
			multiline_set: is_multiline = b
		end

	set_dotall (b: BOOLEAN)
			-- Set `is_dotall' to `b'.
		do
			is_dotall := b
		ensure
			dotall_set: is_dotall = b
		end

	set_empty_allowed (b: BOOLEAN)
			-- Set `is_empty_allowed' to `b'.
		do
			is_empty_allowed := b
		ensure
			empty_allowed_set: is_empty_allowed = b
		end

	set_dollar_endonly (b: BOOLEAN)
			-- Set `is_dollar_endonly' to `b'.
		do
			is_dollar_endonly := b
		ensure
			dollar_endonly_set: is_dollar_endonly = b
		end

	set_bol (b: BOOLEAN)
			-- Set `is_bol' to `b'.
		do
			is_bol := b
		ensure
			bol_set: is_bol = b
		end

	set_eol (b: BOOLEAN)
			-- Set `is_eol' to `b'.
		do
			is_eol := b
		ensure
			eol_set: is_eol = b
		end

	set_anchored (b: BOOLEAN)
			-- Set `is_anchored' to `b'.
		do
			is_anchored := b
		ensure
			anchored_set: is_anchored = b
		end

feature {RX_PCRE_MATCHER} -- Status setting

	set_ims_options (an_option: NATURAL_32)
			-- Set `is_caseless', `is_multiline' and `is_dotall'
			-- from values encoded in `an_option'.
		do
			is_caseless := is_option_caseless (an_option)
			is_multiline := is_option_multiline (an_option)
			is_dotall := is_option_dotall (an_option)
		ensure
			caseless_set: is_caseless = is_option_caseless (an_option)
			multiline_set: is_multiline = is_option_multiline (an_option)
			dotall_set: is_dotall = is_option_dotall (an_option)
		end

feature -- Setting

	set_character_case_mapping (a_mapping: like character_case_mapping)
			-- Set `character_case_mapping' to `a_mapping'.
		require
			not_compiled: not is_compiled
			a_mapping_not_void: a_mapping /= Void
		do
			character_case_mapping := a_mapping
		ensure
			character_case_mapping_set: character_case_mapping = a_mapping
		end

	set_word_set (a_set: like word_set)
			-- Set `word_set' to `a_set'.
		require
			not_compiled: not is_compiled
			a_set_not_void: a_set /= Void
			a_set_not_empty: not a_set.is_empty
		do
			word_set := a_set
		ensure
			word_set_set: word_set = a_set
		end

feature -- Compilation

	compile (a_pattern: READABLE_STRING_GENERAL)
			-- Compile regular expression `a_pattern'.
			-- The compilation is driven by the various option flags.
			-- Set `is_compiled' to true if the pattern has been
			-- successfully compiled, otherwise the compilation error
			-- is described in `error_message' and `error_position'.
		require
			a_pattern_not_void: a_pattern /= Void
		local
			an_option: NATURAL_32
			l_hex: STRING
			c: NATURAL_32
		do
			pattern := a_pattern
			create {STRING_32} pattern_buffer.make (a_pattern.count + 1)
			pattern_buffer.append (a_pattern)
			pattern_buffer.append_code (0)
			pattern_count := a_pattern.count
			pattern_position := 1
			code_index := 0
			byte_code.wipe_out
			subexpression_count := 0
			maxbackrefs := 0
			set_default_internal_options
			optchanged := undef_mask
			first_character := -1
			required_character := -1
			regexp_countlits := -1
			start_bits := Void
			set_error (err_msg_99, 99, pattern_position)
			debug ("REGEXP")
				std.output.put_string ("COMPILING PATTERN: ")
				if a_pattern.is_valid_as_string_8 then
					std.output.put_line (a_pattern.to_string_8)
				else
					std.output.put_line ({UTF_CONVERTER}.utf_32_string_to_utf_8_string_8 (a_pattern))
				end
				print_options (std.output)
			end
				-- Enclose the whole pattern in a bracket.
			byte_code.append_opcode (op_bra)
			compile_regexp (optchanged, False, False, -1)
			if error_message = err_msg_99 and then pattern_position <= pattern_count then
					-- If not reached end of pattern on success, there's an excess bracket.
				set_error (err_msg_22, 22, pattern_position)
			elseif maxbackrefs > subexpression_count then
					-- Give an error if there's back reference to a non-existent
					-- capturing subpattern.
				set_error (err_msg_15, 15, pattern_position)
			end
			if error_message = err_msg_99 then
				set_error (err_msg_0, 0, 0)
					-- Fill in the terminating state.
				byte_code.append_opcode (op_end)
				an_option := ims_options
				if not is_anchored then
						-- If the anchored option was not passed, set flag if we can determine that the
						-- pattern is anchored by virtue of ^ characters or \A or anything else (such as
						-- starting with .* when `op_dotall' is set).
						-- For introspection reset `code_index'.
					code_index := 0
					if can_anchored (an_option) then
							-- For introspection reset `code_index'.
						code_index := 0
						set_anchored (True)
					else
							-- Otherwise, see if we can determine what the first character has to be, because
							-- that speeds up unanchored matches no end. If not, see if we can set the
							-- PCRE_STARTLINE flag. This is helpful for multiline matches when all branches
							-- start with ^, and also when all branches start with .* for non-DOTALL matches.
							-- For introspection reset `code_index'.
						code_index := 0
						an_option := find_firstchar (an_option)
							-- For introspection reset `code_index'.
						code_index := 0
						if first_character < 0 and then has_startline then
							set_startline (True)
						end
					end
				end
					-- Save the last required character if there are at least two literal
					-- characters on all paths, or if there is no first character setting.
				if regexp_countlits <= 1 and then first_character >= 0 then
					required_character := -1
				end
			end
			debug ("REGEXP")
				if not is_compiled then
					std.output.put_string ("COMPILER ERROR: ")
					std.output.put_string (error_message)
					std.output.put_string (" at ")
					std.output.put_integer (error_position)
					std.output.put_string (" character: ")
					if 1 <= error_position and error_position <= pattern_count then
						c := pattern_buffer.code (error_position)
						if c <= {CHARACTER_8}.max_value.to_natural_32 and then print_set.has (c) then
							std.output.put_character (c.to_character_8)
						else
							std.output.put_string ("\x")
							l_hex := {KL_NATURAL_32_ROUTINES}.to_hexadecimal (c, False)
							if l_hex.count > 2 then
								std.output.put_character ('{')
								std.output.put_string (l_hex)
								std.output.put_character ('}')
							else
								STRING_FORMATTER_.put_left_padded_string (std.output, l_hex, 2, '0')
							end
						end
					end
				end
				print_compiled_pattern_code (std.output, False)
				print_compiled_pattern_info (std.output)
				print_start_bits (std.output)
			end
		ensure
			pattern_set: pattern = a_pattern
		end

	optimize
			-- This feature scans a compiled unanchored expression and attempts to build a
			-- set of the initial characters. As time goes by, we may be able to get more clever
			-- at doing this.
		require
			compiled: is_compiled
		do
				-- For an anchored pattern, or an unanchored pattern that has a first char, or a
				-- multiline pattern that matches only at "line starts", no further processing at
				-- present.
			if not is_anchored and then first_character < 0 and then not is_startline then
				internal_start_bits.wipe_out
				set_start_bits (0, is_caseless)
			end
		end

feature -- Error report

	error_message: STRING
			-- State of last compilation

	error_code: INTEGER
			-- Error identification with an integral value

	error_position: INTEGER
			-- Position in pattern where an error was detected;
			-- Result <= 0 implies no valid position was found

feature {NONE} -- Error setting

	set_error (a_message: like error_message; an_error_code, a_position: INTEGER)
			-- Set error reporting data.
		require
			a_message_not_void: a_message /= Void
			valid_error_code: an_error_code >= 0 and an_error_code < 100
		do
			error_message := a_message
			error_code := an_error_code
			error_position := a_position
		ensure
			error_message_set: error_message = a_message
			error_code_set: error_code = an_error_code
			error_position_set: error_position = a_position
		end

feature -- Reset

	reset
			-- Reset the pattern.
			-- Do not change the options (see `set_default_options' for the list of options).
		do
			set_error (err_msg_99, 99, 0)
			pattern_buffer.wipe_out
			pattern_buffer.append_code (0)
			pattern_count := 0
			pattern := Void
		ensure
			no_pattern: pattern = Void
			not_compiled: not is_compiled
		end

feature -- Debugging

	print_options (a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print options to `a_file'. Only differences from
			-- the default setting where stated.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			if
				not is_anchored and not is_caseless and
				not is_extended and not is_multiline and
				not is_dotall and not is_dollar_endonly and
				is_greedy
			then
				a_file.put_string ("No options")
			else
				a_file.put_string ("Options:")
				if is_anchored then
					a_file.put_string (" anchored")
				end
				if is_caseless then
					a_file.put_string (" caseless")
				end
				if is_extended then
					a_file.put_string (" extended")
				end
				if is_multiline then
					a_file.put_string (" multiline")
				end
				if is_dotall then
					a_file.put_string (" dotall")
				end
				if is_dollar_endonly then
					a_file.put_string (" dollar_endonly")
				end
				if not is_greedy then
					a_file.put_string (" ungreedy")
				end
			end
			a_file.put_new_line
			if is_ichanged then
				a_file.put_line ("Case state changes")
			end
		end

	print_start_bits (a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print the starting character set of a compiled
			-- expression in a preformatted form to `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			i, j: NATURAL_32
			l_start_bits: like start_bits
			l_hex: STRING
		do
			l_start_bits := start_bits
			if l_start_bits = Void then
				a_file.put_string ("Study returned NULL")
			else
				a_file.put_string ("Starting character set: ")
				from
					i := 0
					j := 24
				until
					i > {UC_UNICODE_CONSTANTS}.maximum_unicode_character_natural_32_code
				loop
					if l_start_bits.has (i) then
						if j > 75 then
							a_file.put_new_line
							a_file.put_string ("  ")
							j := 2
						end
						if i <= {CHARACTER_8}.max_value.to_natural_32 and then print_set.has (i) and then i /= Space_code then
							a_file.put_character (i.to_character_8)
							j := j + 2
						else
							a_file.put_string ("\x")
							l_hex := {KL_NATURAL_32_ROUTINES}.to_hexadecimal (i, False)
							if l_hex.count > 2 then
								a_file.put_character ('{')
								a_file.put_string (l_hex)
								a_file.put_character ('}')
							else
								STRING_FORMATTER_.put_left_padded_string (a_file, l_hex, 2, '0')
							end
							j := j + 5
						end
						a_file.put_character (' ')
					end
					i := i + 1
				end
			end
			a_file.put_new_line
		end

	print_compiled_pattern_code (a_file: KI_TEXT_OUTPUT_STREAM; a_native_code: BOOLEAN)
			-- Print the compiled code in a readable form to `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			i, nb: INTEGER
			j, k: NATURAL_32
			len: INTEGER
			an_op: NATURAL_32
			a_code: NATURAL_32
			a_min, a_max: NATURAL_32
			a_set: INTEGER
			a_position: INTEGER
			a_position_map: detachable like new_position_map
			l_hex: STRING
		do
			if not a_native_code then
				a_position_map := new_position_map
				fill_position_map (a_position_map)
			end
			a_file.put_line ("------------------------------------------------------------------")
			nb := byte_code.count - 1
			from
				i := 0
			until
				i > nb
			loop
				if a_native_code then
					a_position := i
				else
					check
							-- `a_position_map' has been set when `a_native_code' is False.
						a_position_map_not_void: a_position_map /= Void
					then
						a_position := map_position (i, a_position_map)
					end
				end
				STRING_FORMATTER_.put_left_padded_string (a_file, a_position.out, 3, ' ')
				a_file.put_character (' ')
				an_op := byte_code.opcode_item (i)
				if an_op >= op_bra then
					if i + 1 <= nb then
						if a_native_code then
							a_position := byte_code.integer_item (i + 1).to_integer_32
						else
							check
									-- `a_position_map' has been set when `a_native_code' is False.
								a_position_map_not_void: a_position_map /= Void
							then
								a_position := map_position (i + byte_code.integer_item (i + 1).to_integer_32, a_position_map) - map_position (i, a_position_map)
							end
						end
						STRING_FORMATTER_.put_left_padded_string (a_file, a_position.out, 3, ' ')
					else
						a_file.put_string ("end-of-byte-code")
					end
					a_file.put_string (" Bra ")
					a_file.put_natural_32 (an_op - op_bra)
					i := i + 1
				else
					inspect an_op
					when op_alt then
						if i + 1 <= nb then
							if a_native_code then
								a_position := byte_code.integer_item (i + 1).to_integer_32
							else
								check
										-- `a_position_map' has been set when `a_native_code' is False.
									a_position_map_not_void: a_position_map /= Void
								then
									a_position := map_position (i + byte_code.integer_item (i + 1).to_integer_32, a_position_map) - map_position (i, a_position_map)
								end
							end
							STRING_FORMATTER_.put_left_padded_string (a_file, a_position.out, 3, ' ')
						else
							a_file.put_string ("end-of-byte-code")
						end
						a_file.put_character (' ')
						a_file.put_string (op_name (an_op))
						i := i + 1
					when op_ket then
						if i + 1 <= nb then
							if a_native_code then
								a_position := byte_code.integer_item (i + 1).to_integer_32
							else
								check
										-- `a_position_map' has been set when `a_native_code' is False.
									a_position_map_not_void: a_position_map /= Void
								then
									a_position := map_position (i, a_position_map) - map_position (i - byte_code.integer_item (i + 1).to_integer_32, a_position_map)
								end
							end
							STRING_FORMATTER_.put_left_padded_string (a_file, a_position.out, 3, ' ')
						else
							a_file.put_string ("end-of-byte-code")
						end
						a_file.put_character (' ')
						a_file.put_string (op_name (an_op))
						i := i + 1
					when op_opt then
						if i + 1 <= nb then
							a_file.put_character (' ')
							STRING_FORMATTER_.put_left_padded_string (a_file, INTEGER_.to_hexadecimal (byte_code.integer_item (i + 1).to_integer_32, False), 2, '0')
						else
							a_file.put_string ("end-of-byte-code")
						end
						a_file.put_character (' ')
						a_file.put_string (op_name (an_op))
						i := i + 1
					when
						op_reverse, op_cond, op_cref, op_ketrmax, op_ketrmin,
						op_assert, op_assert_not, op_assertback, op_assertback_not, op_once
					then
						if i + 1 <= nb then
							STRING_FORMATTER_.put_left_padded_string (a_file, byte_code.integer_item (i + 1).out, 3, ' ')
						else
							a_file.put_string ("end-of-byte-code")
						end
						a_file.put_character (' ')
						a_file.put_string (op_name (an_op))
						i := i + 1
					when op_chars then
						if i + 1 <= nb then
							len := byte_code.integer_item (i + 1).to_integer_32
							STRING_FORMATTER_.put_left_padded_string (a_file, len.out, 3, ' ')
							a_file.put_character (' ')
							i := i + 1
							if i + len <= nb then
								i := i + 1
								from
								until
									len <= 0
								loop
									a_code := byte_code.character_item (i)
									if a_code <= {CHARACTER_8}.max_value.to_natural_32 and then print_set.has (a_code) then
										a_file.put_character (a_code.to_character_8)
									else
										a_file.put_string ("\x")
										l_hex := {KL_NATURAL_32_ROUTINES}.to_hexadecimal (a_code, False)
										if l_hex.count > 2 then
											a_file.put_character ('{')
											a_file.put_string (l_hex)
											a_file.put_character ('}')
										else
											STRING_FORMATTER_.put_left_padded_string (a_file, l_hex, 2, '0')
										end
									end
									i := i + 1
									len := len - 1
								end
								i := i - 1
							else
								a_file.put_string ("chars wrong-length")
							end
						else
							a_file.put_string ("chars missing-length")
						end
					when op_star, op_minstar, op_plus, op_minplus, op_query, op_minquery then
						if i + 1 <= nb then
							a_code := byte_code.character_item (i + 1)
							if a_code <= {CHARACTER_8}.max_value.to_natural_32 and then print_set.has (a_code) then
								a_file.put_character (a_code.to_character_8)
							else
								a_file.put_string ("\x")
								l_hex := {KL_NATURAL_32_ROUTINES}.to_hexadecimal (a_code, False)
								if l_hex.count > 2 then
									a_file.put_character ('{')
									a_file.put_string (l_hex)
									a_file.put_character ('}')
								else
									STRING_FORMATTER_.put_left_padded_string (a_file, l_hex, 2, '0')
								end
							end
						else
							a_file.put_string ("end-of-byte-code")
						end
						a_file.put_character (' ')
						a_file.put_string (op_name (an_op))
						i := i + 1
					when op_typestar, op_typeminstar, op_typeplus, op_typeminplus, op_typequery, op_typeminquery then
						if i + 1 <= nb then
							a_file.put_string ("    ")
							a_file.put_string (op_name (byte_code.opcode_item (i + 1)))
						else
							a_file.put_string ("end-of-byte-code ")
						end
						a_file.put_string (op_name (an_op))
						i := i + 1
					when op_exact, op_upto, op_minupto then
						if i + 2 <= nb then
							a_code := byte_code.character_item (i + 2)
							if a_code <= {CHARACTER_8}.max_value.to_natural_32 and then print_set.has (a_code) then
								a_file.put_character (a_code.to_character_8)
							else
								a_file.put_string ("\x")
								l_hex := {KL_NATURAL_32_ROUTINES}.to_hexadecimal (a_code, False)
								if l_hex.count > 2 then
									a_file.put_character ('{')
									a_file.put_string (l_hex)
									a_file.put_character ('}')
								else
									STRING_FORMATTER_.put_left_padded_string (a_file, l_hex, 2, '0')
								end
							end
							a_file.put_character ('{')
							if an_op /= op_exact then
								a_file.put_string ("0,")
							end
							STRING_FORMATTER_.put_left_padded_string (a_file, byte_code.integer_item (i + 1).out, 3, ' ')
							if an_op = op_minupto then
								a_file.put_character ('?')
							end
							a_file.put_character ('}')
						else
							a_file.put_string ("end-of-byte-code")
							a_file.put_character (' ')
							a_file.put_string (op_name (an_op))
						end
						i := i + 2
					when op_typeexact, op_typeupto, op_typeminupto then
						if i + 2 <= nb then
							a_file.put_string (op_name (byte_code.opcode_item (i + 2)))
							a_file.put_character ('(')
							if an_op /= op_typeexact then
								a_file.put_character (',')
							end
							STRING_FORMATTER_.put_left_padded_string (a_file, byte_code.integer_item (i + 1).out, 3, ' ')
							a_file.put_character (')')
							if an_op = op_typeminupto then
								a_file.put_character ('?')
							end
						else
							a_file.put_string ("end-of-byte-code")
							a_file.put_character (' ')
							a_file.put_string (op_name (an_op))
						end
						i := i + 2
					when op_not then
						a_file.put_string ("[^")
						if i + 1 <= nb then
							a_code := byte_code.character_item (i + 1)
							if a_code <= {CHARACTER_8}.max_value.to_natural_32 and then print_set.has (a_code) then
								a_file.put_character (a_code.to_character_8)
							else
								a_file.put_string ("\x")
								l_hex := {KL_NATURAL_32_ROUTINES}.to_hexadecimal (a_code, False)
								if l_hex.count > 2 then
									a_file.put_character ('{')
									a_file.put_string (l_hex)
									a_file.put_character ('}')
								else
									STRING_FORMATTER_.put_left_padded_string (a_file, l_hex, 2, '0')
								end
							end
						else
							a_file.put_string ("end-of-byte-code")
						end
						a_file.put_character (']')
						i := i + 1
					when op_notstar, op_notminstar, op_notplus, op_notminplus, op_notquery, op_notminquery then
						a_file.put_string ("[^")
						if i + 1 <= nb then
							a_code := byte_code.character_item (i + 1)
							if a_code <= {CHARACTER_8}.max_value.to_natural_32 and then print_set.has (a_code) then
								a_file.put_character (a_code.to_character_8)
							else
								a_file.put_string ("\x")
								l_hex := {KL_NATURAL_32_ROUTINES}.to_hexadecimal (a_code, False)
								if l_hex.count > 2 then
									a_file.put_character ('{')
									a_file.put_string (l_hex)
									a_file.put_character ('}')
								else
									STRING_FORMATTER_.put_left_padded_string (a_file, l_hex, 2, '0')
								end
							end
						else
							a_file.put_string ("end-of-byte-code")
						end
						a_file.put_character (']')
						a_file.put_string (op_name (an_op))
						i := i + 1
					when op_notexact, op_notupto, op_notminupto then
						a_file.put_string ("[^")
						if i + 2 <= nb then
							a_code := byte_code.character_item (i + 2)
							if a_code <= {CHARACTER_8}.max_value.to_natural_32 and then print_set.has (a_code) then
								a_file.put_character (a_code.to_character_8)
							else
								a_file.put_string ("\x")
								l_hex := {KL_NATURAL_32_ROUTINES}.to_hexadecimal (a_code, False)
								if l_hex.count > 2 then
									a_file.put_character ('{')
									a_file.put_string (l_hex)
									a_file.put_character ('}')
								else
									STRING_FORMATTER_.put_left_padded_string (a_file, l_hex, 2, '0')
								end
							end
							a_file.put_string ("](")
							if an_op /= op_notexact then
								a_file.put_character (',')
							end
							STRING_FORMATTER_.put_left_padded_string (a_file, byte_code.integer_item (i + 1).out, 3, ' ')
							a_file.put_character (')')
							if an_op = op_notminupto then
								a_file.put_character ('?')
							end
						else
							a_file.put_string ("end-of-byte-code")
						end
						i := i + 2
					when op_ref, op_class then
						if an_op = op_ref then
							a_file.put_string (op_name (an_op))
							if i + 1 <= nb then
								STRING_FORMATTER_.put_left_padded_string (a_file, byte_code.integer_item (i + 1).out, 3, ' ')
							end
							i := i + 1
						else
							check
								op_class: an_op = op_class
							end
							a_file.put_string ("    [")
							if i + 1 <= nb then
								a_set := byte_code.integer_item (i + 1).to_integer_32
								if byte_code.valid_character_set (a_set) then
									from
										j := 0
									until
										j > {UC_UNICODE_CONSTANTS}.maximum_unicode_character_natural_32_code
									loop
										if byte_code.character_set_has (a_set, j) then
											from
												k := j + 1
											until
												k > {UC_UNICODE_CONSTANTS}.maximum_unicode_character_natural_32_code or else not byte_code.character_set_has (a_set, k)
											loop
												k := k + 1
											end
											if j <= {CHARACTER_8}.max_value.to_natural_32 and then print_set.has (j) then
												a_file.put_character (j.to_character_8)
											else
												a_file.put_string ("\x")
												l_hex := {KL_NATURAL_32_ROUTINES}.to_hexadecimal (j, False)
												if l_hex.count > 2 then
													a_file.put_character ('{')
													a_file.put_string (l_hex)
													a_file.put_character ('}')
												else
													STRING_FORMATTER_.put_left_padded_string (a_file, l_hex, 2, '0')
												end
											end
											k := k - 1
											if k > j then
												a_file.put_character ('-')
												if k <= {CHARACTER_8}.max_value.to_natural_32 and then print_set.has (k) then
													a_file.put_character (k.to_character_8)
												else
													a_file.put_string ("\x")
													l_hex := {KL_NATURAL_32_ROUTINES}.to_hexadecimal (k, False)
													if l_hex.count > 2 then
														a_file.put_character ('{')
														a_file.put_string (l_hex)
														a_file.put_character ('}')
													else
														STRING_FORMATTER_.put_left_padded_string (a_file, l_hex, 2, '0')
													end
												end
											end
											j := k
										end
										j := j + 1
									end
								else
									a_file.put_string ("invalid character set: ")
									STRING_FORMATTER_.put_left_padded_string (a_file, a_set.out, 3, ' ')
								end
								i := i + 1
							else
								a_file.put_string ("end-of-byte-code")
							end
							a_file.put_character (']')
						end
						if i + 1 <= nb then
							inspect byte_code.opcode_item (i + 1)
							when op_crstar, op_crminstar, op_crplus, op_crminplus, op_crquery, op_crminquery then
								a_file.put_string (op_name (byte_code.opcode_item (i + 1)))
								i := i + 1
							when op_crrange, op_crminrange then
								if i + 3 <= nb then
									a_min := byte_code.integer_item (i + 2)
									a_max := byte_code.integer_item (i + 3)
									a_file.put_character ('{')
									STRING_FORMATTER_.put_left_padded_string (a_file, a_min.out, 3, ' ')
									a_file.put_character (',')
									if a_max /= 0 then
										STRING_FORMATTER_.put_left_padded_string (a_file, a_max.out, 3, ' ')
									end
									a_file.put_character ('}')
									if byte_code.opcode_item (i + 1) = op_crminrange then
										a_file.put_character ('?')
									end
								else
									a_file.put_string ("end-of-byte-code")
								end
								i := i + 3
							else
									-- Do nothing.
							end
						end
					else
						a_file.put_string ("    ")
						a_file.put_string (op_name (an_op))
					end
				end
				i := i + 1
				a_file.put_new_line
			end
			a_file.put_line ("------------------------------------------------------------------")
		end

	print_compiled_pattern_info (a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print the compiled pattern info to `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			l_hex: STRING
		do
			a_file.put_string ("Capturing subpattern count = ")
			a_file.put_integer (subexpression_count)
			a_file.put_new_line
			if maxbackrefs > 0 then
				a_file.put_string ("Max back reference = ")
				a_file.put_integer (maxbackrefs)
				a_file.put_new_line
			end
			print_options (a_file)
			if first_character >= 0 then
				a_file.put_string ("First char = ")
				if first_character <= {CHARACTER_8}.max_value and then print_set.has (first_character.to_natural_32) then
					a_file.put_character ('%'')
					a_file.put_character (first_character.to_character_8)
					a_file.put_character ('%'')
				elseif first_character < 32 then
					a_file.put_integer_64 (first_character)
				else
					a_file.put_string ("\x")
					l_hex := {KL_NATURAL_32_ROUTINES}.to_hexadecimal (first_character.to_natural_32, False)
					if l_hex.count > 2 then
						a_file.put_character ('{')
						a_file.put_string (l_hex)
						a_file.put_character ('}')
					else
						STRING_FORMATTER_.put_left_padded_string (a_file, l_hex, 2, '0')
					end
				end
				a_file.put_new_line
			elseif is_startline then
				a_file.put_line ("First char at start or follows \n")
			else
				a_file.put_line ("No first char")
			end
			if required_character >= 0 then
				a_file.put_string ("Need char = ")
				if required_character <= {CHARACTER_8}.max_value and then print_set.has (required_character.to_natural_32) then
					a_file.put_character ('%'')
					a_file.put_character (required_character.to_character_8)
					a_file.put_character ('%'')
				elseif required_character < 32 then
					a_file.put_integer_64 (required_character)
				else
					a_file.put_string ("\x")
					l_hex := {KL_NATURAL_32_ROUTINES}.to_hexadecimal (required_character.to_natural_32, False)
					if l_hex.count > 2 then
						a_file.put_character ('{')
						a_file.put_string (l_hex)
						a_file.put_character ('}')
					else
						STRING_FORMATTER_.put_left_padded_string (a_file, l_hex, 2, '0')
					end
				end
				a_file.put_new_line
			else
				a_file.put_line ("No need char")
			end
		end

feature {NONE} -- Debug helpers

	map_position (a_position: INTEGER; a_position_map: like new_position_map): INTEGER
			-- Position in the byte code of the original PCRE
			-- package (coded with bytes) corresponding to
			-- `a position' in byte code of the Gobo version
			-- (coded with int32).
		require
			a_position_map_not_void: a_position_map /= Void
		do
			a_position_map.search (a_position)
			if a_position_map.found then
				Result := a_position_map.found_item
			else
				Result := 10000 + a_position
			end
		end

	fill_position_map (a_position_map: like new_position_map)
			-- Fill `a_position_map' with position mapping between
			-- byte code in the original PCRE package (coded with bytes)
			-- and the Gobo version (coded with int32).
		require
			a_position_map_not_void: a_position_map /= Void
			a_position_map_empty: a_position_map.is_empty
		local
			i, nb: INTEGER
			len: INTEGER
			an_op: NATURAL_32
			byte_offset: INTEGER
		do
			nb := byte_code.count - 1
			from
				i := 0
			until
				i > nb
			loop
				a_position_map.force (byte_offset, i)
				an_op := byte_code.opcode_item (i)
				if an_op >= op_bra then
					byte_offset := byte_offset + 3
					i := i + 1
				else
					inspect an_op
					when op_opt then
						byte_offset := byte_offset + 2
						i := i + 1
					when op_cond then
						byte_offset := byte_offset + 2
						i := i + 1
					when op_cref then
						byte_offset := byte_offset + 2
						i := i + 1
					when op_chars then
						len := byte_code.integer_item (i + 1).to_integer_32
						byte_offset := byte_offset + len + 2
						i := i + len + 1
					when op_ketrmax, op_ketrmin, op_alt, op_ket, op_assert, op_assert_not,
					     op_assertback, op_assertback_not, op_once then
						byte_offset := byte_offset + 3
						i := i + 1
					when op_reverse then
						byte_offset := byte_offset + 3
						i := i + 1
					when
						op_star, op_minstar, op_plus, op_minplus, op_query, op_minquery, op_typestar,
						op_typeminstar, op_typeplus, op_typeminplus, op_typequery, op_typeminquery
					then
						byte_offset := byte_offset + 2
						i := i + 1
					when op_exact, op_upto, op_minupto then
						byte_offset := byte_offset + 4
						i := i + 2
					when op_typeexact, op_typeupto, op_typeminupto then
						byte_offset := byte_offset + 4
						i := i + 2
					when op_not then
						byte_offset := byte_offset + 2
						i := i + 1
					when op_notstar, op_notminstar, op_notplus, op_notminplus, op_notquery, op_notminquery then
						byte_offset := byte_offset + 2
						i := i + 1
					when op_notexact, op_notupto, op_notminupto then
						byte_offset := byte_offset + 4
						i := i + 2
					when op_ref then
						inspect byte_code.opcode_item (i + 1)
						when op_crstar, op_crminstar, op_crplus, op_crminplus, op_crquery, op_crminquery then
							byte_offset := byte_offset + 3
							i := i + 1
						when op_crrange, op_crminrange then
							byte_offset := byte_offset + 7
							i := i + 3
						else
							byte_offset := byte_offset + 2
						end
					when op_class then
						inspect byte_code.opcode_item (i + 1)
						when op_crstar, op_crminstar, op_crplus, op_crminplus, op_crquery, op_crminquery then
							byte_offset := byte_offset + 33
							i := i + 1
						when op_crrange, op_crminrange then
							byte_offset := byte_offset + 37
							i := i + 3
						else
							byte_offset := byte_offset + 32
						end
					else
						byte_offset := byte_offset + 1
					end
				end
				i := i + 1
			end
			a_position_map.force (byte_offset, i)
		end

	new_position_map: DS_HASH_TABLE [INTEGER, INTEGER]
			-- Position mapping between byte code in the original
			-- PCRE package (coded with bytes) and the Gobo version
			-- (coded with int32)
		do
			create Result.make_map (50)
		ensure
			position_map_not_void: Result /= Void
			position_map_empty: Result.is_empty
		end

feature {NONE} -- Status report

	is_startline: BOOLEAN

	is_ichanged: BOOLEAN

	optchanged: NATURAL_32

	ims_options: NATURAL_32
			-- Encoded options containing `is_caseless',
			-- `is_multiline' and `is_dotall'
		do
			Result := null_option
			if is_caseless then
				Result := set_option_caseless (Result)
			end
			if is_multiline then
				Result := set_option_multiline (Result)
			end
			if is_dotall then
				Result := set_option_dotall (Result)
			end
		end

feature {NONE} -- Status setting

	set_default_internal_options
			-- Set default internal options.
		do
			set_startline (False)
			set_ichanged (False)
		ensure
			startline_set: is_startline = False
			ichanged_set: is_ichanged = False
		end

	set_startline (b: BOOLEAN)
			-- Set `startline' to `b'.
		do
			is_startline := b
		ensure
			startline_set: is_startline = b
		end

	set_ichanged (b: BOOLEAN)
			-- Set `ichanged' to `b'.
		do
			is_ichanged := b
		ensure
			ichanged_set: is_ichanged = b
		end

feature {NONE} -- Access

	code_index: INTEGER
			-- Position in byte code

	pattern_buffer: STRING_GENERAL
			-- Buffer containing the regular expression pattern being compiled

	pattern_position: INTEGER
			-- Current position in `pattern'

	pattern_count: INTEGER
			-- Number of characters in `pattern'

	subexpression_count: INTEGER
			-- Number of used brackets

	maxbackrefs: INTEGER
			-- Maximum number of back references

	internal_start_bits: RX_CHARACTER_SET
			-- To avoid repeated allocations of the `start_bits' character set

	start_bits: detachable RX_CHARACTER_SET
			-- A set of starting characters. This will be filled in by the optimizer

	first_character: INTEGER_64
			-- First character in regular expression
			-- if any, -1 otherwise

	required_character: INTEGER_64
			-- Required character in regular expression
			-- if any, -1 or -2 otherwise

	regexp_countlits: INTEGER
			-- Mandatory number of characters in literal

	find_fixed_code_length (a_position: INTEGER): INTEGER
			-- Scan the byte code and compute the fixed length of input string that will match it,
			-- if the length is fixed. This is needed for dealing with backward assertions.
			-- `a_position' is the position of the `op_bra' opcode in the byte code.
			-- Return the fixed length, or non-positive if there is no fixed length.
		require
			a_position_large_enough: a_position >= 0
			a_position_small_enough: a_position < byte_code.count - 2
		local
			cc, d: INTEGER
			op: NATURAL_32
			branchlength: INTEGER
			stop: BOOLEAN
		do
			Result := -1
				-- Skip the opcode and the length of the branch
				-- stored in the byte code.
			cc := a_position + 2
				-- Scan along the opcodes for this branch. If we get to the end of the
				-- branch, check the length against that of the other branches.
			from
			until
				stop
			loop
				op := byte_code.opcode_item (cc)
				if op > op_bra then
					op := op_bra
				end
				inspect op
				when op_bra, op_once, op_cond then
					d := find_fixed_code_length (cc)
					if d < 0 then
						Result := -1
						stop := True
					else
						branchlength := branchlength + d
						from
							cc := cc + byte_code.integer_item (cc + 1).to_integer_32
						until
							byte_code.opcode_item (cc) /= op_alt
						loop
							cc := cc + byte_code.integer_item (cc + 1).to_integer_32
						end
							-- Skip the opcode and the length of the
							-- branch stored in the byte code.
						cc := cc + 2
					end
				when op_alt, op_ket, op_ketrmax, op_ketrmin, op_end then
						-- Reached end of a branch; if it's a ket it is the end of a nested
						-- call. If it's ALT it is an alternation in a nested call. If it is
						-- END it's the end of the outer call. All can be handled by the same code.
					if Result < 0 then
						Result := branchlength
					elseif Result /= branchlength then
						Result := -1
						stop := True
					end
					if not stop then
						if op /= op_alt then
							stop := True
						else
								-- Skip the opcode and the length of the
								-- branch stored in the byte code.
							cc := cc + 2
							branchlength := 0
						end
					end
				when op_assert, op_assert_not, op_assertback, op_assertback_not then
						-- Skip over assertive subpatterns.
					from
						cc := cc + byte_code.integer_item (cc + 1).to_integer_32
					until
						byte_code.opcode_item (cc) /= op_alt
					loop
						cc := cc + byte_code.integer_item (cc + 1).to_integer_32
					end
						-- Skip the opcode and the length of the
						-- branch stored in the byte code.
					cc := cc + 2
				when op_reverse then
						-- Skip over things that don't match chars.
					cc := cc + 2
				when op_cref, op_opt then
						-- Skip over things that don't match chars.
					cc := cc + 2
				when op_sod, op_eod, op_eodn, op_circ, op_doll, op_not_word_boundary, op_word_boundary then
						-- Skip over things that don't match chars.
					cc := cc + 1
				when op_chars then
						-- Handle char strings.
					cc := cc + 1
					d := byte_code.integer_item (cc).to_integer_32
					branchlength := branchlength + d
					cc := cc + d + 1
				when op_exact, op_typeexact then
						-- Handle exact repetitions.
					branchlength := branchlength + byte_code.integer_item (cc + 1).to_integer_32
						-- Skip the opcode, the number of matches and the
						-- repeated opcode stored in the byte code.
					cc := cc + 3
				when op_not_digit, op_digit, op_not_whitespace, op_whitespace, op_not_wordchar, op_wordchar, op_any then
						-- Handle single-char matchers
					branchlength := branchlength + 1
					cc := cc + 1
				when op_class then
						-- TODO: maybe add op_ref
						-- Check a class for variable quantification.
						-- First skip the opcode and the reference id (`op_ref')
						-- or the class set offset (`op_class').
					cc := cc + 2
					inspect byte_code.opcode_item (cc)
					when op_crstar, op_crminstar, op_crquery, op_crminquery then
						Result := -1
						stop := True
					when op_crrange, op_crminrange then
						d := byte_code.integer_item (cc + 1).to_integer_32
						if d /= byte_code.integer_item (cc + 2).to_integer_32 then
							Result := -1
							stop := True
						else
							branchlength := branchlength + d
							cc := cc + 3
						end
					else
						branchlength := branchlength + 1
					end
				else
						-- Anything else is variable length.
					Result := -1
					stop := True
				end
			end
		end

feature {NONE} -- Compilation

	compile_regexp (a_changed_options: NATURAL_32; a_in_group, a_lookbehind: BOOLEAN; a_condref: INTEGER_64)
			-- On entry, `pattern_position' is pointing past the bracket character, but on
			-- return it points to the closing bracket, or vertical bar, or end of string.
			-- The `op_bra' opcode has already been appended to the byte code, but the following
			-- integer in the byte code (corresponding to the length of the branch) has not
			-- been appended yet. If the ims options are changed at the start (for a (?ims: group)
			-- or during any branch, we need to insert an `op_opt' opcode at the start of every
			-- following branch to ensure they get set correctly at run-time, and also pass
			-- the new options into every subsequent branch compilation.
			-- `a_lookbehind'is True if this is a lookbehind assertion.
			-- `a_condref' >= 0 for `opt_cref' setting at start of conditional group.
		local
			last_branch: INTEGER
			start_bracket: INTEGER
			reverse_count: INTEGER
			saved_reqchar: INTEGER_64
			saved_countlits: INTEGER
			length: INTEGER
			changed_options: NATURAL_32
			old_options: NATURAL_32
			stop: BOOLEAN
		do
			changed_options := a_changed_options
			old_options := ims_options
			last_branch := byte_code.count - 1
			start_bracket := last_branch
			required_character := -1
			regexp_countlits := infinity
				-- Save space for the branch length.
			byte_code.append_integer (0)
				-- At the start of a reference-based conditional group,
				-- insert the reference number as an `op_cref' item.
			if a_condref >= 0 then
				byte_code.append_opcode (op_cref)
				byte_code.append_integer (a_condref.to_natural_32)
			end
				-- Loop for each alternative branch.
			from
			until
				stop
			loop
					-- Handle change of options.
				if not is_option_undef (changed_options) then
					byte_code.append_opcode (op_opt)
					byte_code.append_integer (changed_options)
					set_ims_options (changed_options)
				end
				if a_lookbehind then
						-- Set up dummy `op_reverse' if lookbehind assertion.
					byte_code.append_opcode (op_reverse)
					reverse_count := byte_code.count
					byte_code.append_integer (0)
				end
					-- Save some vars.
				saved_reqchar := required_character
				saved_countlits := regexp_countlits
					-- Set for compilation.
				optchanged := changed_options
					-- Now compile the branch.
				compile_branch (a_in_group)
				changed_options := optchanged
				if error_message = err_msg_99 then
						-- Fill in the length of the last branch.
					length := byte_code.count - last_branch
					byte_code.put_integer (length.to_natural_32, last_branch + 1)
						-- Save the last required character if all branches have
						-- the same; a current value of -1 means unset, while -2
						-- means "previous branch had no last required char".
					if saved_reqchar /= -2 then
						if required_character >= 0 then
							if saved_reqchar = -1 then
								saved_reqchar := required_character
							elseif saved_reqchar /= required_character then
								saved_reqchar := -2
							end
						else
							saved_reqchar := -2
						end
					end
						-- Keep the shortest literal count.
					if regexp_countlits < saved_countlits then
						saved_countlits := regexp_countlits
					end
					required_character := saved_reqchar
					regexp_countlits := saved_countlits
						-- If lookbehind, check that this branch matches a fixed-length
						-- string, and put the length into the `op_reverse' item.
						-- Temporarily mark the end of the branch with `op_end'.
					if a_lookbehind then
						byte_code.append_opcode (op_end)
						length := find_fixed_code_length (last_branch)
						byte_code.set_count (byte_code.count - 1)
						if length < 0 then
							set_error (err_msg_25, 25, pattern_position)
						else
							byte_code.put_integer (length.to_natural_32, reverse_count)
						end
					end
						-- Reached end of expression, either ')' or end of pattern. Insert a
						-- terminating ket and the length of the whole bracketed item, and return,
						-- leaving the pointer at the terminating char. If any of the ims options
						-- were changed inside the group, compile a resetting opcode following.
					if pattern_buffer.code (pattern_position) /= Bar_code then
						length := byte_code.count - start_bracket
						byte_code.append_opcode (op_ket)
						byte_code.append_integer (length.to_natural_32)
						if a_in_group and then not is_option_undef (changed_options) then
							byte_code.append_opcode (op_opt)
							byte_code.append_integer (old_options)
						end
						stop := True
					else
							-- Another branch follows; insert an "or" node and advance the pointer.
						last_branch := byte_code.count
						byte_code.append_opcode (op_alt)
						byte_code.append_integer (0)
						pattern_position := pattern_position + 1
					end
				else
					stop := True
				end
			end
		end

	compile_branch (a_in_group: BOOLEAN)
			-- Scan the pattern, compiling it into the byte code.
		local
			bravalue: NATURAL_32
			l_bravalue_set: BOOLEAN
			length: INTEGER
			val: INTEGER_64
			condcount: INTEGER
			previous: INTEGER
			tempcode, tc: INTEGER
			condref: INTEGER_64
			sub_countlits: INTEGER
			sub_reqchar, prevreqchar, saved_reqchar: INTEGER_64
			saved_countlits: INTEGER
			newoptions, opt: NATURAL_32
			old_options: NATURAL_32
			old_extended, old_greedy: BOOLEAN
			c: NATURAL_32
			stop, flag: BOOLEAN
		do
				-- Initialize no required char, and count of literals.
			required_character := -1
			regexp_countlits := 0
			prevreqchar := -1
			old_options := ims_options
			old_extended := is_extended
			old_greedy := is_greedy
				-- Switch on next character until the end of the branch.
			from
				if is_extended then
					scan_comment
				end
			until
				stop or else pattern_position > pattern_count or else error_message /= err_msg_99
			loop
				c := pattern_buffer.code (pattern_position)
				if c = Left_brace_code and then compile_counted_repeats (previous, prevreqchar, sub_countlits) then
					previous := 0
				else
					inspect c
					when Bar_code, Right_parenthesis_code then
							-- The branch terminates at end of string, |, or ).
						pattern_position := pattern_position - 1
						stop := True
					when Caret_code then
							-- Handle single-character metacharacters.
						previous := 0
						byte_code.append_opcode (op_circ)
					when Dollar_code then
						previous := 0
						byte_code.append_opcode (op_doll)
					when Dot_code then
						previous := byte_code.count
						byte_code.append_opcode (op_any)
					when Left_bracket_code then
							-- Character class. These always build a map of the permitted characters,
							-- except in the special case where there is only one character.
							-- For negated classes, we build the map as usual, then invert it at the end.
						previous := byte_code.count
						compile_character_class
					when Star_code then
						compile_repeats (0, -1, previous, prevreqchar, sub_countlits)
						previous := 0
					when Plus_code then
						compile_repeats (1, -1, previous, prevreqchar, sub_countlits)
						previous := 0
					when Question_mark_code then
						compile_repeats (0, 1, previous, prevreqchar, sub_countlits)
						previous := 0
					when Left_parenthesis_code then
							-- Start of nested bracket sub-expression, or comment or lookahead or
							-- lookbehind or option setting or condition. First deal with special things
							-- that can come after a bracket all are introduced by ?, and the appearance
							-- of any of them means that this is not a referencing group. They were
							-- checked for validity in the first pass over the string, so we don't have to
							-- check for syntax errors here.
						opt := ims_options
						newoptions := opt
						condref := -1
						l_bravalue_set := False
						pattern_position := pattern_position + 1
						check
								-- The last character read was '(', and there is at
								-- least the character '%U' at the end of `pattern_buffer'.
							valid_position: pattern_position <= pattern_buffer.count
						end
						if pattern_buffer.code (pattern_position) = Question_mark_code then
							pattern_position := pattern_position + 1
							check
									-- The last character read was '?', and there is at
									-- least the character '%U' at the end of `pattern_buffer'.
								valid_position: pattern_position <= pattern_buffer.count
							end
							inspect pattern_buffer.code (pattern_position)
							when Pound_code then
									-- Comment skip to ket.
								from
									tc := pattern_position + 1
								until
									tc > pattern_count or else pattern_buffer.code (tc) = Right_parenthesis_code
								loop
									tc := tc + 1
								end
								if tc > pattern_count then
										-- Unexpeceted end of pattern.
									pattern_position := tc - 1
									set_error (err_msg_18, 18, tc)
								else
									pattern_position := tc
								end
							when Colon_code then
									-- Non-extracting bracket.
								bravalue := op_bra
								l_bravalue_set := True
								pattern_position := pattern_position + 1
							when Left_parenthesis_code then
									-- Conditional group.
								bravalue := op_cond
								l_bravalue_set := True
								pattern_position := pattern_position + 1
								check
										-- The last character read was '(', and there is at
										-- least the character '%U' at the end of `pattern_buffer'.
									valid_position: pattern_position <= pattern_buffer.count
								end
								inspect pattern_buffer.code (pattern_position)
								when Zero_code .. Nine_code then
									condref := scan_decimal_number (10).to_integer_32
									check
											-- `scan_decimal_number' put `pattern_position' at the
											-- first position that was not a digit, and there is at
											-- least the character '%U' at the end of `pattern_buffer'.
										valid_position: pattern_position <= pattern_buffer.count
									end
									if pattern_buffer.code (pattern_position) /= Right_parenthesis_code then
										set_error (err_msg_26, 26, pattern_position)
									end
									if condref = 0 then
										set_error (err_msg_35, 35, pattern_position)
									else
										pattern_position := pattern_position + 1
									end
								else
									tc := pattern_position
									if pattern_buffer.code (tc) /= Question_mark_code then
										set_error (err_msg_28, 28, pattern_position)
									else
										check
												-- The last character read was '?', and there is at
												-- least the character '%U' at the end of `pattern_buffer'.
											valid_position: pattern_position <= pattern_buffer.count
										end
										inspect pattern_buffer.code (tc + 1)
										when Equal_code, Exclamation_code, Less_than_code then
												-- Do nothing.
										else
											set_error (err_msg_28, 28, pattern_position)
										end
									end
									pattern_position := tc - 1
								end
							when Equal_code then
									-- Positive lookahead.
								bravalue := op_assert
								l_bravalue_set := True
								pattern_position := pattern_position + 1
							when Exclamation_code then
									-- Negative lookahead.
								bravalue := op_assert_not
								l_bravalue_set := True
								pattern_position := pattern_position + 1
							when Less_than_code then
									-- Lookbehinds.
								pattern_position := pattern_position + 1
								check
										-- The last character read was '<', and there is at
										-- least the character '%U' at the end of `pattern_buffer'.
									valid_position: pattern_position <= pattern_buffer.count
								end
								inspect pattern_buffer.code (pattern_position)
								when Equal_code then
										-- Positive lookbehind.
									bravalue := op_assertback
									l_bravalue_set := True
									pattern_position := pattern_position + 1
								when Exclamation_code then
										-- Negative lookbehind.
									bravalue := op_assertback_not
									l_bravalue_set := True
									pattern_position := pattern_position + 1
								else
										-- Syntax error.
									set_error (err_msg_24, 24, pattern_position - 3)
								end
							when Greater_than_code then
									-- One-time brackets.
								bravalue := op_once
								l_bravalue_set := True
								pattern_position := pattern_position + 1
							when Upper_r_code then
									-- Pattern recursion.
								byte_code.append_opcode (op_recurse)
								pattern_position := pattern_position + 1
							else
									-- Option setting.
								from
									c := pattern_buffer.code (pattern_position)
									flag := True
								until
									c = Right_parenthesis_code or else c = Colon_code or else error_message /= err_msg_99
								loop
										-- Set up the changed option bits, but don't change anything yet.
									inspect c
									when Minus_code then
										flag := not flag
									when Lower_i_code then
										if flag then
											newoptions := set_option_caseless (newoptions)
										else
											newoptions := unset_option_caseless (newoptions)
										end
									when Lower_m_code then
										if flag then
											newoptions := set_option_multiline (newoptions)
										else
											newoptions := unset_option_multiline (newoptions)
										end
									when Lower_s_code then
										if flag then
											newoptions := set_option_dotall (newoptions)
										else
											newoptions := unset_option_dotall (newoptions)
										end
									when Lower_x_code then
										is_extended := flag
									when Upper_x_code then
										is_strict := flag
									when Upper_u_code then
										is_greedy := not flag
									else
										set_error (err_msg_12, 12, pattern_position)
									end
									if error_message /= err_msg_99 then
										c := 0
									else
										pattern_position := pattern_position + 1
										check
												-- The last character read was not '%U', and there is at
												-- least the character '%U' at the end of `pattern_buffer'.
											valid_position: pattern_position <= pattern_buffer.count
										end
										c := pattern_buffer.code (pattern_position)
									end
								end
								if c = Right_parenthesis_code then
										-- If the options ended with ')' this is not the start of a nested
										-- group with option changes, so the options change at this level. At top
										-- level there is nothing else to be done (the options will in fact have
										-- been set from the start of compiling as a result of the first pass) but
										-- at an inner level we must compile code to change the ims options if
										-- necessary, and pass the new setting back so that it can be put at the
										-- start of any following branches, and when this group ends, a resetting
										-- item can be compiled.
									if a_in_group then
										check
												-- Only ims bits have been changed since
												-- `newoptions' has been set from an ims.
											newoptions_ims: is_option_ims (newoptions)
										end
										if is_caseless /= is_option_caseless (newoptions) then
											set_ichanged (True)
										end
										if to_option_ims (opt) /= newoptions then
											optchanged := newoptions
											byte_code.append_opcode (op_opt)
											byte_code.append_integer (optchanged)
										end
									else
											-- We are on the top-level - all options are global.
										old_greedy := is_greedy
										old_extended := is_extended
										old_options := newoptions
									end
										-- Change options at this level.
									set_ims_options (newoptions)
										-- This item can't be repeated.
									previous := 0
								else
										-- If the options ended with ':' we are heading into a nested group
										-- with possible change of options. Such groups are non-capturing and are
										-- not assertions of any kind. All we need to do is skip over the ':'
										-- the newoptions value is handled below.
									bravalue := op_bra
									l_bravalue_set := True
									pattern_position := pattern_position + 1
									if is_caseless /= is_option_caseless (newoptions) then
										set_ichanged (True)
									end
								end
							end
						else
								-- Else we have a referencing group adjust the opcode.
							subexpression_count := subexpression_count + 1
							if subexpression_count > extract_max then
								set_error (err_msg_13, 13, pattern_position)
							else
								bravalue := op_bra + subexpression_count.to_natural_32
								l_bravalue_set := True
							end
						end
						if l_bravalue_set then
								-- Process nested bracketed re. Assertions may not be repeated, but other
								-- kinds can be. We copy code into a non-register variable in order to be able
								-- to pass its address because some compilers complain otherwise. Pass in a
								-- new setting for the ims options if they have changed.
							if bravalue >= op_once then
								previous := byte_code.count
							else
								previous := 0
							end
							tempcode := byte_code.count
							byte_code.append_opcode (bravalue)
								-- Save reqchar and countlits for later use.
								-- `compile_regexp' changes these values.
							saved_reqchar := required_character
							saved_countlits := regexp_countlits
							check
									-- Only ims bits have been changed since
									-- `newoptions' has been set from an ims.
								newoptions_ims: is_option_ims (newoptions)
							end
							if to_option_ims (opt) = newoptions then
								opt := undef_mask
							else
								opt := newoptions
							end
								-- Call `compile_regexp' with following arguments:
								-- . pass ims options if changed
								-- . set for all nested groups
								-- . True is back assert
								-- . condition reference numer
							compile_regexp (opt, True, bravalue = op_assertback or else bravalue = op_assertback_not, condref)
							sub_countlits := regexp_countlits
							sub_reqchar := required_character
							regexp_countlits := saved_countlits
							required_character := saved_reqchar
							if error_message = err_msg_99 then
									-- At the end of compiling, code is still pointing to the start of the
									-- group, while tempcode has been updated to point past the end of the group
									-- and any option resetting that may follow it. The pattern pointer (ptr)
									-- is on the bracket.
								if bravalue = op_cond then
										-- If this is a conditional bracket, check that there are no more than
										-- two branches in the group.
									from
										condcount := 1
										tc := tempcode + byte_code.integer_item (tempcode + 1).to_integer_32
									until
										byte_code.opcode_item (tc) = op_ket
									loop
										condcount := condcount + 1
										tc := tc + byte_code.integer_item (tc + 1).to_integer_32
									end
									if condcount > 2 then
										set_error (err_msg_27, 27, pattern_position)
									end
								end
									-- Handle updating of the required character. If the subpattern didn't
									-- set one, leave it as it was. Otherwise, update it for normal brackets of
									-- all kinds, forward assertions, and conditions with two branches. Don't
									-- update the literal count for forward assertions, however. If the bracket
									-- is followed by a quantifier with zero repeat, we have to back off. Hence
									-- the definition of prevreqchar and subcountlits outside the main loop so
									-- that they can be accessed for the back off.
								if
									sub_reqchar > 0 and then
									(bravalue >= op_bra or else
									bravalue = op_once or else
									bravalue = op_assert or else
									(bravalue = op_cond and then condcount = 2))
								then
									prevreqchar := required_character
									required_character := sub_reqchar
									if bravalue /= op_assert then
										regexp_countlits := regexp_countlits + sub_countlits
									end
								end
								if pattern_buffer.code (pattern_position) /= Right_parenthesis_code then
										-- Error if hit end of pattern.
									set_error (err_msg_14, 14, pattern_position)
								end
							end
						end
					else
							-- Handle a run of data characters until a metacharacter is encountered.
							-- The first character is guaranteed not to be whitespace or # when the
							-- extended flag is set.
							-- May overriden by metacharacterhandling
						previous := byte_code.count
						byte_code.append_opcode (op_chars)
							-- Used later to store the count of char.
						tempcode := byte_code.count
							-- Save space to store number of characters.
						byte_code.append_integer (0)
						length := 0
						c := pattern_buffer.code (pattern_position)
						from
							flag := False
						until
							flag
						loop
								-- Backslash may introduce a data char or a metacharacter. Escaped items
								-- are checked for validity in the pre-compiling pass. Stop the string
								-- before a metaitem.
							if c = Backslash_code then
									-- Check \ for being a real metacharacter if not, fall through and handle
									-- it as a data character at the start of a string. Escape items are checked
									-- for validity in the pre-compiling pass.
								val := scan_escape (subexpression_count, False)
								if val < 0 then
										-- Handle metacharacters introduced by \. For ones like \d, the ESC_ values
										-- are arranged to be the negation of the corresponding op_values. For the
										-- back references, the values are esc_ref plus the reference number. Only
										-- back references and those types that consume a character may be repeated.
										-- We can test for values between esc_b and esc_z for the latter; this may
										-- have to change if any new ones are ever created.
									if length = 0 then
											-- No characters emited for `op_chars', so reset.
										byte_code.set_count (previous)
									else
										previous := byte_code.count
									end
									if -val >= esc_ref then
										byte_code.append_opcode (op_ref)
										byte_code.append_integer ((-val - esc_ref).to_natural_32)
									else
										if -val <= esc_lcb or else -val >= esc_ucz then
											previous := 0
										end
										byte_code.append_opcode ((-val).to_natural_32)
									end
									pattern_position := pattern_position + 1
									flag := True
								else
									c := val.to_natural_32
									byte_code.append_character (c)
									length := length + 1
									flag := (error_message /= err_msg_99)
								end
							else
								if {UC_UNICODE_ROUTINES}.valid_non_surrogate_natural_32_code (c) then
									byte_code.append_character (c)
									length := length + 1
								else
									set_error (err_msg_61, 61, pattern_position)
									flag := True
								end
							end
							if not flag then
								pattern_position := pattern_position + 1
								if is_extended then
									scan_comment
								end
								if pattern_position > pattern_count or length >= maxlit then
									flag := True
								else
									c := pattern_buffer.code (pattern_position)
									flag := meta_set.has (c)
								end
							end
						end
						if length > 0 then
								-- Update the last character and the count of literals.
							if length > 1 then
								prevreqchar := byte_code.character_item (tempcode + length - 1).to_integer_64
							else
								prevreqchar := required_character
							end
							required_character := byte_code.character_item (tempcode + length)
							regexp_countlits := regexp_countlits + length
								-- Compute the length and set it in the byte code,
								-- and advance to the next state.
							byte_code.put_integer (length.to_natural_32, tempcode)
						end
						if length <= maxlit then
							pattern_position := pattern_position - 1
						end
					end
				end
				pattern_position := pattern_position + 1
				if is_extended then
					scan_comment
				end
			end
			set_ims_options (old_options)
			is_extended := old_extended
			is_greedy := old_greedy
		end

	compile_character_class
			-- Compile character class.
		require
			pattern_position_small_enough: pattern_position <= pattern_count
			is_character_class: pattern_buffer.code (pattern_position) = Left_bracket_code
		local
			class_set: RX_CHARACTER_SET
			tmp_pat_index: INTEGER
			posix_class: INTEGER
			val: INTEGER_64
			class_charcount: NATURAL_32
			class_lastchar: INTEGER_64
			c: NATURAL_32
			range_end: NATURAL_32
			negate_class: BOOLEAN
			local_negate: BOOLEAN
		do
			create class_set.make_empty
			pattern_position := pattern_position + 1
			check
					-- The last character read was '[', and there is at
					-- least the character '%U' at the end of `pattern_buffer'.
				valid_position: pattern_position <= pattern_buffer.count
			end
			c := pattern_buffer.code (pattern_position)
			if c = Caret_code then
					-- If the first character is '^', set the negation flag and skip it.
				negate_class := True
				pattern_position := pattern_position + 1
				check
						-- The last character read was '^', and there is at
						-- least the character '%U' at the end of `pattern_buffer'.
					valid_position: pattern_position <= pattern_buffer.count
				end
				c := pattern_buffer.code (pattern_position)
			end
			from
					-- Keep a count of chars so that we can optimize
					-- the case of just a single character.
				class_charcount := 0
			until
					-- Process characters until ] is reached. By checking the class_charcount,
					-- greater 1 a possible initial ] is taken as a data character.
				(class_charcount > 0 and then c = Right_bracket_code) or else error_message /= err_msg_99
			loop
				if pattern_position > pattern_count then
					set_error (err_msg_6, 6, pattern_position)
				else
					tmp_pat_index := 0
					if c = Left_bracket_code then
						check
								-- The last character read was '[', and there is at
								-- least the character '%U' at the end of `pattern_buffer'.
							valid_position: pattern_position <= pattern_buffer.count
						end
						inspect pattern_buffer.code (pattern_position + 1)
						when Colon_code, Dot_code, Equal_code then
							tmp_pat_index := check_posix_syntax (pattern_position)
						else
								-- Do nothing.
						end
					end
					if tmp_pat_index > 0 then
							-- Handle POSIX class names. Perl allows a negation extension of the
							-- form [:^name]. A square bracket that doesn't match the syntax is
							-- treated as a literal. We also recognize the POSIX constructions
							-- [.ch.] and [=ch=] ("collating elements") and fault them, as Perl
							-- 5.6 does.
						local_negate := False
						if pattern_buffer.code (pattern_position + 1) /= Colon_code then
							set_error (err_msg_31, 31, pattern_position)
						else
							pattern_position := pattern_position + 2
							if pattern_buffer.code (pattern_position) = Caret_code then
								pattern_position := pattern_position + 1
								local_negate := True
							end
							posix_class := check_posix_name (pattern_position, tmp_pat_index - pattern_position)
							if posix_class < 0 then
								set_error (err_msg_30, 30, pattern_position)
							else
								if posix_class <= 3 and then is_caseless then
										-- If matching is caseless, upper and lower are converted to
										-- alpha. This relies on the fact that the class table starts with
										-- alpha, lower, upper as the first 3 entries.
									posix_class := 1
								end
								if local_negate then
									class_set.add_negated_set (class_sets.item (posix_class))
								else
									class_set.add_set (class_sets.item (posix_class))
								end
								pattern_position := tmp_pat_index + 1
									-- Set `class_charcount' > 1;
									-- Assumes more than 1 character per class.
								class_charcount := 10
							end
						end
					else
						val := 0
						if c = Backslash_code then
								-- Backslash may introduce a single character, or it may introduce one
								-- of the specials, which just set a flag. Escaped items are checked for
								-- validity in the pre-compiling pass. The sequence \b is a special case.
								-- Inside a class (and only there) it is treated as backspace. Elsewhere
								-- it marks a word boundary. Other escapes have preset maps ready to
								-- or into the one we are building. We assume they have more than one
								-- character in them, so set `class_charcount' bigger than one.
							val := scan_escape (subexpression_count, True)
							if -val = esc_lcb then
								c := Back_space_code
								val := c.to_integer_64
							elseif val < 0 then
								class_charcount := class_charcount + 1
								class_lastchar := val
								inspect -val
								when esc_lcd then
									class_set.add_set (digit_set)
								when esc_ucd then
									class_set.add_negated_set (digit_set)
								when esc_lcw then
									class_set.add_set (word_set)
								when esc_ucw then
									class_set.add_negated_set (word_set)
								when esc_lcs then
									class_set.add_set (space_set)
								when esc_ucs then
									class_set.add_negated_set (space_set)
								else
									set_error (err_msg_7, 7, pattern_position)
								end
							else
								c := val.to_natural_32
							end
						elseif not {UC_UNICODE_ROUTINES}.valid_non_surrogate_natural_32_code (c) then
							set_error (err_msg_61, 61, pattern_position)
							c := 0
						end
						if val >= 0 then
							if pattern_buffer.code (pattern_position + 1) = Minus_code and then pattern_buffer.code (pattern_position + 2) /= Right_bracket_code then
									-- A single character may be followed by '-' to form a range. However,
									-- Perl does not permit ']' to be the end of the range. A '-' character
									-- here is treated as a literal.
								pattern_position := pattern_position + 2
								if pattern_position > pattern_count then
									set_error (err_msg_6, 6, pattern_position)
								else
									range_end := pattern_buffer.code (pattern_position)
									tmp_pat_index := pattern_position
									if range_end = Backslash_code then
											-- The second part of a range can be a single-character escape, but
											-- not any of the other escapes. Perl 5.6 treats a hyphen as a literal
											-- in such circumstances.
										val := scan_escape (subexpression_count, True)
										if val < 0 then
												-- \b is backspace; any other special means the '-' was literal.
											if val = -esc_lcb then
												range_end := Back_space_code
											else
												pattern_position := tmp_pat_index - 2
												range_end := c
											end
										else
											range_end := val.to_natural_32
										end
									elseif not {UC_UNICODE_ROUTINES}.valid_non_surrogate_natural_32_code (range_end) then
										set_error (err_msg_61, 61, pattern_position)
										range_end := c
									end
									if range_end < c then
										set_error (err_msg_8, 8, pattern_position)
									else
										from
												-- In case a one-char range.
											class_charcount := class_charcount + range_end - c + 1
											class_lastchar := range_end.to_integer_64
										until
											c > range_end
										loop
											if {UC_UNICODE_ROUTINES}.valid_non_surrogate_natural_32_code (c) then
													-- Do not add surrogate characters included
													-- within the range.
												class_set.add_character (c)
												if is_caseless then
													class_set.add_character (character_case_mapping.flip_case (c))
												end
											end
												-- Note that `range_end' is less than {NATURAL_32}.max_value
												-- (otherwise it would not be a valid Unicode character).
												-- So there is not risk of overflow below when increasing `c'.
											c := c + 1
										end
									end
								end
							else
									-- Handle a lone single character - we can get here for a normal
									-- non-escape char, or after \ that introduces a single character.
								class_set.add_character (c)
								if is_caseless then
									class_set.add_character (character_case_mapping.flip_case (c))
								end
								class_charcount := class_charcount + 1
								class_lastchar := c.to_integer_64
							end
						end
					end
				end
				if error_message = err_msg_99 then
					pattern_position := pattern_position + 1
					c := pattern_buffer.code (pattern_position)
				end
			end
			if class_charcount = 1 then
				if class_lastchar < 0 then
					if negate_class then
						if (-class_lastchar) \\ 2 = 0 then
							byte_code.append_opcode ((-class_lastchar + 1).to_natural_32)
						else
							byte_code.append_opcode ((-class_lastchar - 1).to_natural_32)
						end
					else
						byte_code.append_opcode ((-class_lastchar).to_natural_32)
					end
				else
						-- If `class_charcount' is 1 and `class_lastchar' is not negative, we saw
						-- precisely one character. This doesn't need the whole character map.
						-- We turn it into a 1-character `op_chars' if it's positive, or `op_not'
						-- if it's negative.
					if negate_class then
						byte_code.append_opcode (op_not)
					else
						byte_code.append_opcode (op_chars)
						byte_code.append_integer (1)
					end
					byte_code.append_character (class_lastchar.to_natural_32)
				end
			else
					-- Otherwise, negate the character map if necessary, and copy it into
					-- the byte code.
				class_set.set_negated (negate_class)
				byte_code.append_opcode (op_class)
				byte_code.append_character_set (class_set)
			end
		end

	compile_repeats (a_min, a_max: INTEGER_32; a_previous: INTEGER; a_prevreqchar: INTEGER_64; a_subcountlits: INTEGER)
		require
			a_min_not_negative: a_min >= 0
			a_max_not_negative_or_minus_one: a_max >= -1
		local
			repeat_type: NATURAL_32
			op_type: NATURAL_32
			repeat_min, repeat_max: INTEGER_32
			op: NATURAL_32
			i, len: INTEGER
			previous, ketoffset: INTEGER
			offset, oldlinkoffset: INTEGER
			bralink: INTEGER
			c: NATURAL_32
			greedy_default, greedy_non_default: BOOLEAN
		do
				-- Set up the default and non-default settings for greediness.
			greedy_default := not is_greedy
			greedy_non_default := not greedy_default
			repeat_min := a_min
			repeat_max := a_max
			previous := a_previous
			if previous = 0 then
				set_error (err_msg_9, 9, pattern_position)
			else
					-- If the next character is '?' this is a minimizing repeat, by default,
					-- but if PCRE_UNGREEDY is set, it works the other way round. Advance to the
					-- next character.
				if pattern_buffer.code (pattern_position + 1) = Question_mark_code then
					if greedy_non_default then
						repeat_type := 1
					else
						repeat_type := 0
					end
					pattern_position := pattern_position + 1
				else
					if greedy_default then
						repeat_type := 1
					else
						repeat_type := 0
					end
				end
					-- If previous was a string of characters, chop off the last one and use it
					-- as the subject of the repeat. If there was only one character, we can
					-- abolish the previous item altogether. A repeat with a zero minimum wipes
					-- out any reqchar setting, backing up to the previous value. We must also
					-- adjust the countlits value.
				op := byte_code.opcode_item (previous)
				if op = op_chars then
					len := byte_code.integer_item (previous + 1).to_integer_32
					if repeat_min = 0 then
						required_character := a_prevreqchar
					end
					regexp_countlits := regexp_countlits + repeat_min - 1
					if len = 1 then
						c := byte_code.character_item (previous + 2)
						byte_code.set_count (previous)
					else
						c := byte_code.character_item (previous + len + 1)
						byte_code.put_integer (byte_code.integer_item (previous + 1) - 1, previous + 1)
						byte_code.set_count (byte_code.count - 1)
					end
						-- Use single-char op codes.
					op_type := 0
					if repeat_max /= 0 then
						compile_single_repeat (c, previous, repeat_min, repeat_max, op_type, repeat_type)
					end
				elseif op = op_not then
						-- If previous was a single negated character ([^a] or similar), we use
						-- one of the special opcodes, replacing it. The code is shared with single-
						-- character repeats by adding a suitable offset into repeat_type.
						-- Use "not" opcodes.
					op_type := op_notstar - op_star
					c := byte_code.character_item (previous + 1)
					byte_code.set_count (previous)
					if repeat_max /= 0 then
						compile_single_repeat (c, previous, repeat_min, repeat_max, op_type, repeat_type)
					end
				elseif op < op_eodn or else op = op_any then
						-- If previous was a character type match (\d or similar), abolish it and
						-- create a suitable repeat item. The code is shared with single-character
						-- repeats by adding a suitable offset into repeat_type.
						-- Use type opcodes.
					op_type := op_typestar - op_star
					c := byte_code.character_item (previous)
					byte_code.set_count (previous)
					if repeat_max /= 0 then
						compile_single_repeat (c, previous, repeat_min, repeat_max, op_type, repeat_type)
					end
				elseif op = op_class or else op = op_ref then
						-- If previous was a character class or a back reference, we put the repeat
						-- stuff after it, but just skip the item if the repeat was {0,0}.
					if repeat_max = 0 then
						byte_code.set_count (previous)
					else
						if repeat_min = 0 and then repeat_max = -1 then
							byte_code.append_opcode (op_crstar + repeat_type)
						elseif repeat_min = 1 and then repeat_max = -1 then
							byte_code.append_opcode (op_crplus + repeat_type)
						elseif repeat_min = 0 and then repeat_max = 1 then
							byte_code.append_opcode (op_crquery + repeat_type)
						else
							byte_code.append_opcode (op_crrange + repeat_type)
							byte_code.append_integer (repeat_min.to_natural_32)
							if repeat_max = -1 then
								repeat_max := 0
								byte_code.append_integer (0)
							else
								byte_code.append_integer (repeat_max.to_natural_32)
							end
						end
					end
				elseif op >= op_bra or else op = op_once or else op = op_cond then
						-- If previous was a bracket group, we may have to replicate it in certain
						-- cases.
					len := byte_code.count - previous
					if repeat_max = -1 then
							-- If the maximum repeat count is unlimited, find the end of the bracket
							-- by scanning through from the start, and compute the offset back to it
							-- from the current code pointer. There may be an `op_opt' setting following
							-- the final KET, so we can't find the end just by going back from the code
							-- pointer.
						from
							i := previous
						until
							op = op_ket
						loop
							i := i + byte_code.integer_item (i + 1).to_integer_32
							op := byte_code.opcode_item (i)
						end
						ketoffset := byte_code.count - i
					end
					if repeat_min = 0 then
							-- The case of a zero minimum is special because of the need to stick
							-- op_brazero in front of it, and because the group appears once in the
							-- data, whereas in other cases it appears the minimum number of times. For
							-- this reason, it is simplest to treat this case separately, as otherwise
							-- the code gets far too mess. There are several special subcases when the
							-- minimum is zero.
						if a_subcountlits > 0 then
								-- If we set up a required char from the bracket, we must back off
								-- to the previous value and reset the countlits value too.
							required_character := a_prevreqchar
							regexp_countlits := regexp_countlits - a_subcountlits
						end
						if repeat_max = 0 then
								-- If the maximum is also zero, we just omit the group from the output
								-- altogether.
							byte_code.set_count (previous)
						else
							if repeat_max <= 1 then
									-- If the maximum is 1 or unlimited, we just have to stick in the
									-- BRAZERO and do no more at this point.
								byte_code.move_right (previous, 1)
								byte_code.put_opcode (op_brazero + repeat_type, previous)
								previous := previous + 1
							else
									-- If the maximum is greater than 1 and limited, we have to replicate
									-- in a nested fashion, sticking `op_brazero' before each set of brackets.
									-- The first one has to be handled carefully because it's the original
									-- copy, which has to be moved up. The remainder can be handled by code
									-- that is common with the non-zero minimum case below. We just have to
									-- adjust the value or `repeat_max', since one less copy is required.
								byte_code.move_right (previous, 3)
								byte_code.put_opcode (op_brazero + repeat_type, previous)
								byte_code.put_opcode (op_bra, previous + 1)
								previous := previous + 2
									-- We chain together the bracket offset fields that have to be
									-- filled in later when the ends of the brackets are reached.
								if bralink = 0 then
									byte_code.put_integer (0, previous)
								else
									byte_code.put_integer ((previous - bralink).to_natural_32, previous)
								end
								bralink := previous
								previous := previous + 1
							end
							repeat_max := repeat_max - 1
						end
					else
							-- If the minimum is greater than zero, replicate the group as many
							-- times as necessary, and adjust the maximum to the number of subsequent
							-- copies that we need.
						from
							i := 1
						until
							i >= repeat_min
						loop
							byte_code.append_subcopy (previous, len)
							i := i + 1
						end
						if repeat_max > 0 then
							repeat_max := repeat_max - repeat_min
						end
					end
					if repeat_max >= 0 then
							-- This code is common to both the zero and non-zero minimum cases. If
							-- the maximum is limited, it replicates the group in a nested fashion,
							-- remembering the bracket starts on a stack. In the case of a zero minimum,
							-- the first one was set up above. In all cases the `repeat_max' now specifies
							-- the number of additional copies needed.
						from
							i := repeat_max - 1
						until
							i < 0
						loop
							byte_code.append_opcode (op_brazero + repeat_type)
							if i /= 0 then
									-- All but the final copy start a new nesting, maintaining the
									-- chain of brackets outstanding.
								byte_code.append_opcode (op_bra)
								if bralink = 0 then
									bralink := byte_code.count
									byte_code.append_integer (0)
								else
									offset := byte_code.count - bralink
									bralink := byte_code.count
									byte_code.append_integer (offset.to_natural_32)
								end
							end
							byte_code.append_subcopy (previous, len)
							i := i - 1
						end
							-- Now chain through the pending brackets, and fill in their length
							-- fields (which are holding the chain links pro tem).
						from
						until
							bralink = 0
						loop
							offset := byte_code.count - bralink + 1
							i := byte_code.count - offset + 1
							check
								op_bra: byte_code.opcode_item (i - 1) = op_bra
							end
							oldlinkoffset := byte_code.integer_item (i).to_integer_32
							if oldlinkoffset = 0 then
								bralink := 0
							else
								bralink := bralink - oldlinkoffset
							end
							byte_code.append_opcode (op_ket)
							byte_code.append_integer (offset.to_natural_32)
							byte_code.put_integer (offset.to_natural_32, i)
						end
					else
							-- If the maximum is unlimited, set a repeater in the final copy. We
							-- can't just offset backwards from the current code point, because we
							-- don't know if there's been an options resetting after the ket. The
							-- correct offset was computed above.
						byte_code.put_opcode (op_ketrmax + repeat_type, byte_code.count - ketoffset)
					end
				else
						-- Else there's some kind of shambles.
					set_error (err_msg_11, 11, pattern_position)
				end
			end
		end

	compile_single_repeat (a_ch: NATURAL_32; a_previous: INTEGER; a_min, a_max: INTEGER_32; a_op_type, a_repeat_type: NATURAL_32)
		require
			a_min_not_negative: a_min >= 0
			a_max_not_negative_or_minus_one: a_max >= -1
		local
			repeat_type: NATURAL_32
			byte_code_count: INTEGER
		do
				-- Combine the op_type with the `repeat_type'.
			repeat_type := a_repeat_type + a_op_type
			if a_min = 0 then
					-- A minimum of zero is handled either as the special case * or ?, or as
					-- an UPTO, with the maximum given.
				if a_max = -1 then
					byte_code.append_opcode (op_star + repeat_type)
				elseif a_max = 1 then
					byte_code.append_opcode (op_query + repeat_type)
				else
					byte_code.append_opcode (op_upto + repeat_type)
					byte_code.append_integer (a_max.to_natural_32)
				end
			elseif a_min = 1 and then a_max = -1 then
					-- The case {1,} is handled as the special case +.
				byte_code.append_opcode (op_plus + repeat_type)
			else
					-- The case {n,n} is just an EXACT, while the general case {n,m} is
					-- handled as an EXACT followed by an UPTO. An EXACT of 1 is optimized.
				if a_min /= 1 then
						-- NB EXACT doesn't have `repeat_type'.
					byte_code.append_opcode (op_exact + a_op_type)
					byte_code.append_integer (a_min.to_natural_32)
				else
					byte_code_count := byte_code.count
					byte_code.set_count (a_previous + 1)
					inspect byte_code.opcode_item (a_previous)
					when op_chars then
							-- If the mininum is 1 and the previous item was a character string,
							-- we either have to put back the item that got cancelled if the string
							-- length was 1, or add the character back onto the end of a longer
							-- string. For a character type nothing need be done; it will just get
							-- put back naturally. Note that the final character is always going to
							-- get added below.
						if byte_code_count = a_previous then
							byte_code.set_count (byte_code_count + 2)
						else
							byte_code.set_count (byte_code_count)
							byte_code.put_integer (byte_code.integer_item (a_previous + 1) + 1, a_previous + 1)
						end
					when op_not then
							-- For a single negated character we also have to put back the
							-- item that got cancelled.
						byte_code.set_count (byte_code_count + 1)
					else
						byte_code.set_count (byte_code_count)
					end
				end
				if a_max < 0 then
						-- If the maximum is unlimited, insert an `op_star'.
					byte_code.append_character (a_ch)
					byte_code.append_opcode (op_star + repeat_type)
				elseif a_max /= a_min then
						-- Else insert an UPTO if the max is greater than the min.
					byte_code.append_character (a_ch)
					byte_code.append_opcode (op_upto + repeat_type)
					byte_code.append_integer ((a_max - a_min).to_natural_32)
				end
			end
			byte_code.append_character (a_ch)
		end

	compile_counted_repeats (a_previous: INTEGER; a_prevreqchar: INTEGER_64; a_subcountlits: INTEGER): BOOLEAN
			-- Read an item of the form {n,m}. This is called only after is_counted_repeat() has
			-- confirmed that a repeat-count quantifier exists, so the syntax is guaranteed to be
			-- correct, but we need to check the values and then call `compile_repeats' feature.
		local
			min: INTEGER_32
			max: INTEGER_32
			i: INTEGER
			c: NATURAL_32
		do
			min := 0
				-- Unlimited.
			max := -1
			from
				i := pattern_position + 1
				c := pattern_buffer.code (i)
			until
				c < Zero_code or c > Nine_code or min > {NATURAL_16}.max_value
			loop
				min := min * 10 + (c - Zero_code).to_integer_32
				i := i + 1
				c := pattern_buffer.code (i)
			end
			if min > {NATURAL_16}.max_value then
					-- Limitation tested in PCRE test suite.
				set_error (err_msg_5, 5, i)
			elseif i - pattern_position > 1 then
					-- One or more digits seen.
				if c = Right_brace_code then
					max := min
					Result := True
				elseif c = Comma_code then
					i := i + 1
					c := pattern_buffer.code (i)
					if c /= Right_brace_code then
						from
							max := 0
						until
							c < Zero_code or c > Nine_code or max > {NATURAL_16}.max_value
						loop
							max := max * 10 + (c - Zero_code).to_integer_32
							i := i + 1
							c := pattern_buffer.code (i)
						end
					end
					if c = Right_brace_code then
						if max > {NATURAL_16}.max_value then
								-- Limitation tested in PCRE test suite.
							set_error (err_msg_5, 5, i)
						elseif max >= 0 and then min > max then
							set_error (err_msg_4, 4, i)
						else
							Result := True
						end
					end
				end
			end
			if Result then
				pattern_position := i
				compile_repeats (min, max, a_previous, a_prevreqchar, a_subcountlits)
			end
		end

feature {NONE} -- Posix character classes

	check_posix_syntax (a_pattern_position: INTEGER): INTEGER
			-- This function is called when the sequence "[:" or "[." or "[=" is
			-- encountered in a character class. It checks whether this is followed by an
			-- optional ^ and then a sequence of letters, terminated by a matching ":]" or
			-- ".]" or "=]".
		local
			set: RX_CHARACTER_SET
			i: INTEGER
			terminator: NATURAL_32
		do
			from
				set := alpha_set
				i := a_pattern_position
				terminator := pattern_buffer.code (i + 1)
				if pattern_buffer.code (i + 2) = Caret_code then
					i := i + 3
				else
					i := i + 2
				end
			until
				not set.has (pattern_buffer.code (i))
			loop
				i := i + 1
			end
			if pattern_buffer.code (i) = terminator and then pattern_buffer.code (i + 1) = Right_bracket_code then
				Result := i
			else
				Result := -1
			end
		ensure
			valid_position: Result /= -1 implies pattern_buffer.valid_index (Result)
		end

	check_posix_name (a_pattern_position, a_len: INTEGER): INTEGER
			-- This function is called to check the name given in a POSIX-style class entry
			-- such as [:alnum:].
			-- `a_pattern_position' points to the first letter in `pattern'.
			-- `a_len' is the length of the name. Return a value representing
			-- the name-index, or -1 if unknown.
		local
			i, j, k, nb: INTEGER
			a_name: STRING
		do
			from
				i := 1
				nb := class_names.count
				Result := -1
			until
				i > nb
			loop
				a_name := class_names.item (i)
				if a_len = a_name.count then
					Result := i
					k := a_pattern_position
					from
						j := 1
					until
						j > a_len
					loop
						if a_name.code (j) /= pattern_buffer.code (k) then
							Result := -1
								-- Jump out of the loop.
							j := a_len + 1
						else
							j := j + 1
							k := k + 1
						end
					end
				end
				if Result /= -1 then
						-- Jump out of the loop.
					i := nb + 1
				else
					i := i + 1
				end
			end
		ensure
			valid_set: Result /= -1 implies class_sets.valid_index (Result)
		end

feature {NONE} -- Pattern scanning

	scan_decimal_number (a_max_len: INTEGER): NATURAL_32
			-- The actual pattern-character is the one after the digit sequence
		local
			c: NATURAL_32
			stop: INTEGER
			l_max_value: NATURAL_32
		do
			stop := pattern_position + a_max_len
			l_max_value := {INTEGER_32}.max_value.to_natural_32
			from
				c := pattern_buffer.code (pattern_position)
			until
				c > Nine_code or else c < Zero_code or else pattern_position >= stop or else Result > l_max_value
			loop
				Result := Result * 10 + c - Zero_code
				pattern_position := pattern_position + 1
				c := pattern_buffer.code (pattern_position)
			end
			if Result > l_max_value then
				set_error (err_msg_65, 65, pattern_position)
				Result := l_max_value
			end
		ensure
			decimal_is_integer_32: Result <= {INTEGER_32}.max_value.to_natural_32
			new_pattern_position: pattern_position <= old pattern_position + a_max_len
		end

	scan_octal_number (a_max_len: INTEGER): NATURAL_32
			-- The actual pattern-character is the one after the digit sequence
		require
			a_max_len_smal_enough: a_max_len <= 3
		local
			c: NATURAL_32
			stop: INTEGER
		do
			stop := pattern_position + a_max_len
			from
				c := pattern_buffer.code (pattern_position)
			until
				c > Seven_code or else c < Zero_code or else pattern_position >= stop
			loop
				Result := Result * 8 + c - Zero_code
				pattern_position := pattern_position + 1
				c := pattern_buffer.code (pattern_position)
			end
		ensure
			new_pattern_position: pattern_position <= old pattern_position + a_max_len
		end

	scan_hex_number (a_max_len: INTEGER): NATURAL_32
			-- The actual pattern-character is the one after the digit sequence.
		require
			a_max_len_smal_enough: a_max_len <= 6
		local
			c: NATURAL_32
			stop: INTEGER
		do
			stop := pattern_position + a_max_len
			from
				c := pattern_buffer.code (pattern_position)
			until
				not xdigit_set.has (c) or else pattern_position >= stop
			loop
				if c < Upper_a_code then
					Result := Result * 16 + c - Zero_code
				elseif c < Lower_a_code then
					Result := Result * 16 + c - Upper_a_code + 10
				else
					Result := Result * 16 + c - Lower_a_code + 10
				end
				pattern_position := pattern_position + 1
				c := pattern_buffer.code (pattern_position)
			end
		ensure
			new_pattern_position: pattern_position <= old pattern_position + a_max_len
		end

	scan_comment
			-- Skip comment.
		local
			i, j: INTEGER
		do
			j := pattern_position
			from
				i := j - 1
			until
				i = j
			loop
				i := j
				from
				until
					not space_set.has (pattern_buffer.code (j))
				loop
					j := j + 1
				end
				if pattern_buffer.code (j) = Pound_code then
					from
						j := j + 1
					until
						j > pattern_count or else pattern_buffer.code (j) = New_line_code
					loop
						j := j + 1
					end
				end
			end
			pattern_position := j
		end

	scan_escape (a_bra_count: INTEGER; a_isclass: BOOLEAN): INTEGER_64
			-- This function is called when a \ has been encountered. It either returns a
			-- positive value for a simple escape such as \n, or a negative value which
			-- encodes one of the more complicated things such as \d. When unicode is enabled,
			-- a positive value greater than 255 may be returned. On entry, `pattern_position'
			-- is pointing at the \. On exit, it is on the final character of the escape
			-- sequence.
			-- `a_bra_count' is number of previous extracting `subexpression_count'.
			-- `a_isclass' is True if we are inside a character class.
			-- Return zero or positive => a data character, negative => a special
			-- escape sequence. On error, `error_message' is set.
		local
			old_pattern_index: INTEGER
			c: NATURAL_32
			l_escape_character: INTEGER_64
		do
			pattern_position := pattern_position + 1
			check
					-- The last character read was '/', and there is at
					-- least the character '%U' at the end of `pattern_buffer'.
				valid_position: pattern_position <= pattern_buffer.count
			end
			c := pattern_buffer.code (pattern_position)
			if pattern_position > pattern_count then
					-- If backslash is at the end of the pattern, it's an error.
				set_error (err_msg_1, 1, pattern_position)
			elseif c < Zero_code or c > Lower_z_code then
					-- Digits or letters may have special meaning;
					-- all others are literals.
				if {UC_UNICODE_ROUTINES}.valid_non_surrogate_natural_32_code (c) then
					Result := c.to_integer_64
				else
					set_error (err_msg_61, 61, pattern_position)
				end
			else
					-- Do an initial lookup in a table. A non-zero result is something that can be
					-- returned immediately. Otherwise further processing may be required.
				l_escape_character := escape_character (c)
				if l_escape_character > 0 then
					if {UC_UNICODE_ROUTINES}.valid_non_surrogate_natural_32_code (l_escape_character.to_natural_32) then
						Result := l_escape_character
					else
						set_error (err_msg_61, 61, pattern_position)
					end
				elseif l_escape_character < 0 then
					Result := l_escape_character
				else
						-- Escapes that need further processing, or are illegal.
					inspect c
					when One_code .. Nine_code then
							-- The handling of escape sequences consisting of a string of digits
							-- starting with one that is not zero is not straightforward. By experiment,
							-- the way Perl works seems to be as follows:
						if not a_isclass then
								-- Outside a character class, the digits are read as a decimal number. If the
								-- number is less than 10, or if there are that many previous extracting
								-- left brackets, then it is a back reference. Otherwise, up to three octal
								-- digits are read to form an escaped byte. Thus \123 is likely to be octal
								-- 123 (cf \0123, which is octal 012 followed by the literal 3). If the octal
								-- value is greater than 377, the least significant 8 bits are taken. Inside a
								-- character class, \ followed by a digit is always an octal number.
							old_pattern_index := pattern_position
							Result := scan_decimal_number (10).to_integer_64
							if Result < 10 or else Result <= a_bra_count then
								if Result > maxbackrefs then
									maxbackrefs := Result.to_integer_32
								end
								Result := -(esc_ref + Result)
							else
									-- Put the pointer back.
								pattern_position := old_pattern_index
								if c >= Eight_code then
									Result := 0
								else
									Result := (scan_octal_number (3) \\ 256).to_integer_64
								end
							end
						elseif c >= Eight_code then
								-- Handle an octal number following \. If the first digit is 8 or 9, Perl
								-- generates a binary zero byte and treats the digit as a following literal.
								-- Thus we have to pull back the pointer by one.
							Result := 0
						else
							Result := (scan_octal_number (3) \\ 256).to_integer_64
						end
						pattern_position := pattern_position - 1
					when Zero_code then
						Result := (scan_octal_number (3) \\ 256).to_integer_64
						pattern_position := pattern_position - 1
					when Lower_x_code then
							-- Read just a hex char.
						pattern_position := pattern_position + 1
						if pattern_buffer.code (pattern_position) = Left_brace_code then
							pattern_position := pattern_position + 1
							c := scan_hex_number (6)
							if pattern_buffer.code (pattern_position) /= Right_brace_code then
								set_error (err_msg_63, 63, pattern_position)
							elseif {UC_UNICODE_ROUTINES}.valid_non_surrogate_natural_32_code (c) then
								Result := c.to_integer_64
							else
								set_error (err_msg_61, 61, pattern_position)
							end
						else
							c := scan_hex_number (2)
							pattern_position := pattern_position - 1
							if {UC_UNICODE_ROUTINES}.valid_non_surrogate_natural_32_code (c) then
								Result := c.to_integer_64
							else
								set_error (err_msg_61, 61, pattern_position)
							end
						end
					when Lower_u_code then
							-- Read just a hex char.
						pattern_position := pattern_position + 1
						if pattern_buffer.code (pattern_position) = Left_brace_code then
							pattern_position := pattern_position + 1
							c := scan_hex_number (6)
							if pattern_buffer.code (pattern_position) /= Right_brace_code then
								set_error (err_msg_64, 64, pattern_position)
							elseif {UC_UNICODE_ROUTINES}.valid_non_surrogate_natural_32_code (c) then
								Result := c.to_integer_64
							else
								set_error (err_msg_61, 61, pattern_position)
							end
						else
							pattern_position := pattern_position - 1
							if is_strict then
								set_error (err_msg_3, 3, pattern_position)
							elseif {UC_UNICODE_ROUTINES}.valid_non_surrogate_natural_32_code (c) then
								Result := c.to_integer_64
							else
								set_error (err_msg_61, 61, pattern_position)
							end
						end
					when Lower_c_code then
							-- Make following character a control-character.
						pattern_position := pattern_position + 1
						check
								-- The last character read was 'c', and there is at
								-- least the character '%U' at the end of `pattern_buffer'.
							valid_position: pattern_position <= pattern_buffer.count
						end
						c := pattern_buffer.code (pattern_position)
						if pattern_position > pattern_count then
							set_error (err_msg_2, 2, pattern_position)
							Result := 0
						else
							if Lower_a_code <= c and c <= Lower_z_code then
								c := character_case_mapping.flip_case (c)
							end
							if c < At_code then
								Result := (c + At_code).to_integer_64
							elseif c <= 127 then
								Result := (c - At_code).to_integer_64
							else
								set_error (err_msg_62, 62, pattern_position)
							end
						end
					else
						if is_strict then
							set_error (err_msg_3, 3, pattern_position)
						elseif {UC_UNICODE_ROUTINES}.valid_non_surrogate_natural_32_code (c) then
							Result := c.to_integer_64
						else
							set_error (err_msg_61, 61, pattern_position)
						end
					end
				end
			end
		ensure
			valid_non_surrogate_unicode_if_positive: Result >= 0 implies {UC_UNICODE_ROUTINES}.valid_non_surrogate_natural_32_code (Result.to_natural_32)
		end

feature {NONE} -- Implementation

	first_significant_code (a_options, a_optbit: NATURAL_32; a_optstop: BOOLEAN): NATURAL_32
			-- This is called by several functions that scan a compiled expression looking
			-- for a fixed first character, or an anchoring opcode etc. It skips over things
			-- that do not influence this. For one application, a change of caseless option is
			-- important. `a_options' are the external options. `a_optbit' is the option bit
			-- whose changing is significant (either `caseless_mask' or `multiline_mask',
			-- or zero if none are. `a_optstop is True to return on option change, otherwise
			-- change the options value and continue.
			-- Side-effect: `code_index' is the position in the byte code where to start
			-- scanning, and is left on the last opcode read on exit.
		require
			code_index_large_enough: code_index >= 0
			code_index_small_enough: code_index < byte_code.count
		local
			icode: INTEGER
			op: NATURAL_32
			stop: BOOLEAN
			an_opt: NATURAL_32
		do
			from
				Result := a_options
				icode := code_index
			until
				stop
			loop
				inspect byte_code.opcode_item (icode)
				when op_opt then
					inspect a_optbit
					when caseless_mask then
						an_opt := byte_code.integer_item (icode + 1)
						if is_option_caseless (an_opt) /= is_option_caseless (Result) then
							if a_optstop then
								stop := True
							else
								Result := an_opt
									-- Skip the opcode and the encoded option.
								icode := icode + 2
							end
						else
								-- Skip the opcode and the encoded option.
							icode := icode + 2
						end
					when multiline_mask then
						an_opt := byte_code.integer_item (icode + 1)
						if is_option_multiline (an_opt) /= is_option_multiline (Result) then
							if a_optstop then
								stop := True
							else
								Result := an_opt
									-- Skip the opcode and the encoded option.
								icode := icode + 2
							end
						else
								-- Skip the opcode and the encoded option.
							icode := icode + 2
						end
					else
							-- Skip the opcode and the encoded option.
						icode := icode + 2
					end
				when op_cref then
						-- Skip the opcode and the reference number.
					icode := icode + 2
				when op_word_boundary, op_not_word_boundary then
					icode := icode + 1
				when op_assert_not, op_assertback, op_assertback_not then
					from
						op := op_alt
					until
						op /= op_alt
					loop
						icode := icode + byte_code.integer_item (icode + 1).to_integer_32
						op := byte_code.opcode_item (icode)
					end
						-- Skip the opcode and the length of the branch.
					icode := icode + 2
				else
					stop := True
				end
			end
			code_index := icode
		ensure
			code_index_large_enough: code_index >= 0
			code_index_small_enough: code_index < byte_code.count
		end

	find_firstchar (a_options: NATURAL_32): NATURAL_32
			-- Try to find out if there is a fixed first character. This is called for
			-- unanchored expressions, as it speeds up their processing quite considerably.
			-- Consider each alternative branch. If they all start with the same char, or with
			-- a bracket all of whose alternatives start with the same char (recurse ad lib),
			-- then we set first_character to that char, otherwise to `has_first_character' to False.
			-- `a_options' are used to check casing changes. Return options.
			-- Side-effect: `code_index' is the position in the byte code where to start
			-- scanning, and is left on the last opcode read on exit.
		require
			code_index_large_enough: code_index >= 0
			code_index_small_enough: code_index < byte_code.count + 2
		local
			icode: INTEGER
			op: NATURAL_32
			c: INTEGER_64
			stop: BOOLEAN
		do
			from
				icode := code_index
				Result := a_options
				first_character := -1
				op := op_alt
			until
				op /= op_alt or else stop
			loop
					-- Skip the opcode and the length of the branch.
				code_index := icode + 2
				Result := first_significant_code (Result, caseless_mask, True)
				op := byte_code.opcode_item (code_index)
				if op >= op_bra then
					op := op_bra
				end
				inspect op
				when op_bra, op_assert, op_once, op_cond then
					c := first_character
					Result := find_firstchar (Result)
					if first_character < 0 then
						stop := True
					elseif c < 0 then
							-- New first_character found.
					elseif c /= first_character then
						first_character := -1
						stop := True
					end
				when op_exact, op_chars, op_plus, op_minplus then
					if op = op_exact then
						code_index := code_index + 1
					elseif op = op_chars then
						code_index := code_index + 1
					end
					if first_character < 0 then
						first_character := byte_code.character_item (code_index + 1).to_integer_64
					elseif first_character.to_natural_32 /= byte_code.character_item (code_index + 1) then
						first_character := -1
						stop := True
					end
				else
					first_character := -1
					stop := True
				end
				if not stop then
					icode := icode + byte_code.integer_item (icode + 1).to_integer_32
					op := byte_code.opcode_item (icode)
				end
			end
		end

	can_anchored (a_options: NATURAL_32): BOOLEAN
			-- Try to find out if this is an anchored regular expression. Consider each
			-- alternative branch. If they all start with `op_sod' or `op_circ', or with a bracket
			-- all of whose alternatives start with `op_sod' or `op_circ' (recurse ad lib), then
			-- it's anchored. However, if this is a multiline pattern, then only `op_sod'
			-- counts, since `op_circ' can match in the middle.
			-- A branch is also implicitly anchored if it starts with .* and DOTALL is set,
			-- because that will try the rest of the pattern at all possible matching points,
			-- so there is no point trying them again.
			-- Side-effect: `code_index' is the position in the byte code where to start
			-- scanning, and is left on the last opcode read on exit.
		require
			code_index_large_enough: code_index >= 0
			code_index_small_enough: code_index < byte_code.count + 2
		local
			icode: INTEGER
			op: NATURAL_32
			opt: NATURAL_32
		do
			from
				opt := a_options
				icode := code_index
				Result := True
				op := op_alt
			until
				op /= op_alt or else not Result
			loop
					-- Skip the opcode and the length of the branch.
				code_index := icode + 2
				opt := first_significant_code (opt, multiline_mask, False)
				op := byte_code.opcode_item (code_index)
				if op >= op_bra or else op = op_assert or else op = op_once or else op = op_cond then
					Result := can_anchored (opt)
				elseif (op = op_typestar or else op = op_typeminstar) and then is_option_dotall (opt) then
					Result := byte_code.opcode_item (code_index + 1) = op_any
				else
					Result := op = op_sod or else (op = op_circ and then not is_option_multiline (opt))
				end
				if Result then
					icode := icode + byte_code.integer_item (icode + 1).to_integer_32
					op := byte_code.opcode_item (icode)
				end
			end
		end

	has_startline: BOOLEAN
			-- This is called to find out if every branch starts with ^ or .* so that
			-- "first char" processing can be done to speed things up in multiline
			-- matching and for non-DOTALL patterns that start with .* (which must start at
			-- the beginning or after \n).
			-- Side-effect: `code_index' is the position in the byte code where to start
			-- scanning, and is left on the last opcode read on exit.
		require
			code_index_large_enough: code_index >= 0
			code_index_small_enough: code_index < byte_code.count + 2
		local
			icode: INTEGER
			op: NATURAL_32
			opt: NATURAL_32
		do
			from
				icode := code_index
				Result := True
				op := op_alt
			until
				op /= op_alt or else not Result
			loop
					-- Skip the opcode and the length of the branch.
				code_index := icode + 2
				opt := first_significant_code (opt, 0, False)
				op := byte_code.opcode_item (code_index)
				if op >= op_bra or else op = op_assert or else op = op_once or else op = op_cond then
					Result := has_startline
				elseif op = op_typestar or else op = op_typeminstar then
					Result := byte_code.opcode_item (code_index + 1) = op_any
				else
					Result := op = op_circ
				end
				if Result then
					icode := icode + byte_code.integer_item (icode + 1).to_integer_32
					op := byte_code.opcode_item (icode)
				end
			end
		end

	set_start_bits (a_code_index: INTEGER; a_caseless: BOOLEAN)
			-- Create bitmap of starting characters.
			-- This routine scans a compiled unanchored expression and
			-- attempts to build a bitmap of the set of initial characters.
			-- If it can't, it sets `start_bits' to Void.
			-- `a_code_index' points to an expression and `a_caseless'
			-- is the current state of the caseless flag.
		local
			i: NATURAL_32
			nb: INTEGER
			icode: INTEGER
			tcode: INTEGER
			op: NATURAL_32
			ch: NATURAL_32
			set: INTEGER
			stop: BOOLEAN
			caseless: BOOLEAN
			success: BOOLEAN
		do
			from
				success := True
				caseless := a_caseless
				op := op_alt
				icode := a_code_index
				nb := byte_code.count - 1
			until
				op /= op_alt or else tcode > nb
			loop
				tcode := icode + 2
				from
					stop := False
				until
					stop
				loop
					stop := True
					op := byte_code.opcode_item (tcode)
						-- If a branch starts with a bracket or a positive lookahead assertion,
						-- recurse to set bits from within them. That's all for this branch.
					if op >= op_bra or else op = op_assert then
						set_start_bits (tcode, caseless)
						if start_bits = Void then
								-- Return without success.
							success := False
							check
								exit: stop = True and op /= op_alt
							end
						else
								-- Try the next alternative.
						end
					else
						inspect op
						when op_assert_not, op_assertback, op_assertback_not then
							stop := False
								-- Skip over lookbehind and negative lookahead assertions.
							from
								op := op_alt
							until
								op /= op_alt
							loop
								tcode := tcode + byte_code.integer_item (tcode + 1).to_integer_32
								op := byte_code.integer_item (tcode)
							end
							tcode := tcode + 2
						when op_opt then
							stop := False
								-- Skip over an option setting, changing the caseless flag.
							caseless := is_option_caseless (byte_code.integer_item (tcode + 1))
							tcode := tcode + 2
						when op_brazero, op_braminzero then
								-- BRAZERO does the bracket, but carries on.
							tcode := tcode + 1
							set_start_bits (tcode, caseless)
							if start_bits = Void then
									-- Return without success.
								success := False
								check
									exit: stop = True and op /= op_alt
								end
							else
								stop := False
								from
									op := op_alt
								until
									op /= op_alt
								loop
									tcode := tcode + byte_code.integer_item (tcode + 1).to_integer_32
									op := byte_code.integer_item (tcode)
								end
								tcode := tcode + 2
							end
						when op_star, op_minstar, op_query, op_minquery then
								-- Single-char * or ? sets the bit and tries the next item.
							ch := byte_code.integer_item (tcode + 1)
							internal_start_bits.add_character (ch)
							if caseless then
								internal_start_bits.add_character (character_case_mapping.flip_case (ch))
							end
							tcode := tcode + 2
							stop := False
						when op_upto, op_minupto then
								-- Single-char upto sets the bit and tries the next.
							ch := byte_code.integer_item (tcode + 2)
							internal_start_bits.add_character (ch)
							if caseless then
								internal_start_bits.add_character (character_case_mapping.flip_case (ch))
							end
							tcode := tcode + 3
							stop := False
						when op_exact, op_chars then
								-- At least one single char sets the bit and stops.
							ch := byte_code.integer_item (tcode + 2)
							internal_start_bits.add_character (ch)
							if caseless then
								internal_start_bits.add_character (character_case_mapping.flip_case (ch))
							end
							check
								stop = True and op /= op_alt
							end
						when op_plus, op_minplus then
								-- At least one single char sets the bit and stops.
							ch := byte_code.integer_item (tcode + 1)
							internal_start_bits.add_character (ch)
							if caseless then
								internal_start_bits.add_character (character_case_mapping.flip_case (ch))
							end
							check
								exit: stop = True and op /= op_alt
							end
						when op_not_digit then
								-- Single character type sets the bits and stops.
							internal_start_bits.add_negated_set (digit_set)
							check
								exit: stop = True and op /= op_alt
							end
						when op_digit then
								-- Single character type sets the bits and stops.
							internal_start_bits.add_set (digit_set)
							check
								exit: stop = True and op /= op_alt
							end
						when op_not_whitespace then
								-- Single character type sets the bits and stops.
							internal_start_bits.add_negated_set (space_set)
							check
								exit: stop = True and op /= op_alt
							end
						when op_whitespace then
								-- Single character type sets the bits and stops.
							internal_start_bits.add_set (space_set)
							check
								exit: stop = True and op /= op_alt
							end
						when op_not_wordchar then
								-- Single character type sets the bits and stops.
							internal_start_bits.add_negated_set (word_set)
							check
								exit: stop = True and op /= op_alt
							end
						when op_wordchar then
								-- Single character type sets the bits and stops.
							internal_start_bits.add_set (word_set)
							check
								stop = True and op /= op_alt
							end
						when op_typeplus, op_typeminplus then
								-- One or more character type fudges the pointer and restarts,
								-- knowing it will hit a single character type and stop there.
							tcode := tcode + 1
							stop := False
						when op_typeexact then
								-- One or more character type fudges the pointer and restarts,
								-- knowing it will hit a single character type and stop there.
							tcode := tcode + 2
							stop := False
						when op_typeupto, op_typeminupto then
								-- Zero or more repeats of character types set the bits and then
								-- try again.
							inspect byte_code.integer_item (tcode + 2)
							when op_not_digit then
									-- Single character type sets the bits and stops.
								internal_start_bits.add_negated_set (digit_set)
							when op_digit then
									-- Single character type sets the bits and stops.
								internal_start_bits.add_set (digit_set)
							when op_not_whitespace then
									-- Single character type sets the bits and stops.
								internal_start_bits.add_negated_set (space_set)
							when op_whitespace then
									-- Single character type sets the bits and stops.
								internal_start_bits.add_set (space_set)
							when op_not_wordchar then
									-- Single character type sets the bits and stops.
								internal_start_bits.add_negated_set (word_set)
							when op_wordchar then
									-- Single character type sets the bits and stops.
								internal_start_bits.add_set (word_set)
							else
									-- Do nothing.
							end
							tcode := tcode + 3
							stop := False
						when op_typestar, op_typeminstar, op_typequery, op_typeminquery then
								-- Zero or more repeats of character types set the bits and then
								-- try again.
							inspect byte_code.integer_item (tcode + 1)
							when op_not_digit then
									-- Single character type sets the bits and stops.
								internal_start_bits.add_negated_set (digit_set)
							when op_digit then
									-- Single character type sets the bits and stops.
								internal_start_bits.add_set (digit_set)
							when op_not_whitespace then
									-- Single character type sets the bits and stops.
								internal_start_bits.add_negated_set (space_set)
							when op_whitespace then
									-- Single character type sets the bits and stops.
								internal_start_bits.add_set (space_set)
							when op_not_wordchar then
									-- Single character type sets the bits and stops.
								internal_start_bits.add_negated_set (word_set)
							when op_wordchar then
									-- Single character type sets the bits and stops.
								internal_start_bits.add_set (word_set)
							else
									-- Do nothing.
							end
							tcode := tcode + 2
							stop := False
						when op_class then
								-- Character class: set the bits and either carry on or not,
								-- according to the repeat count.
							set := byte_code.integer_item (tcode + 1).to_integer_32
							from
								i := 0
							until
								i > 255
							loop
								if byte_code.character_set_has (set, i) then
									internal_start_bits.add_character (i)
								end
								i := i + 1
							end
							inspect byte_code.integer_item (tcode + 2)
							when op_crstar, op_crminstar, op_crquery, op_crminquery then
								tcode := tcode + 3
								stop := False
							when op_crrange, op_crminrange then
								if byte_code.integer_item (tcode + 3) = 0 then
									tcode := tcode + 5
									stop := False
								else
									tcode := tcode + 2
								end
							else
								tcode := tcode + 2
							end
						when op_alt then
								-- Return without success.
							op := op_end
							success := False
							check
								exit: stop = True and op /= op_alt
							end
						else
								-- Return without success.
							success := False
							check
								exit: stop = True and op /= op_alt
							end
						end
					end
				end
				if success then
						-- Advance to next branch.
					icode := icode + byte_code.integer_item (icode + 1).to_integer_32
					op := byte_code.opcode_item (icode)
				end
			end
			if success then
				start_bits := internal_start_bits
			else
				start_bits := Void
			end
		end

feature {NONE} -- Constants

	empty_pattern_buffer: STRING
			-- Dummy empty pattern buffer
		once
			Result := "T"
			Result.put ('%U', 1)
		ensure
			empty_pattern_buffer_not_void: Result /= Void
			empty_pattern_buffer_not_empty: Result.count > 0
			end_of_pattern_buffer: Result.item (Result.count) = '%U'
		end

	infinity: INTEGER
			-- Positive infinity
		once
			Result := Platform.Maximum_integer
		end

	maxlit: INTEGER
			-- Maximum number of characters supported in a literal character string
		once
			Result := Platform.Maximum_integer
		ensure
			maxlit_non_negative: Result >= 1
		end

invariant

	byte_code_not_void: byte_code /= Void
	character_case_mapping_not_void: character_case_mapping /= Void
	word_set_not_void: word_set /= Void
	word_set_not_empty: not word_set.is_empty
	error_message_not_void: error_message /= Void
	pattern_buffer_not_void: pattern_buffer /= Void
	pattern_count_definition: pattern_count = pattern_buffer.count - 1
	pattern_count_positive: pattern_count >= 0
	end_of_pattern: pattern_buffer.item (pattern_buffer.count) = '%U'
	valid_first_character: -1 <= first_character
	valid_required_character: -2 <= required_character
	internal_start_bits_not_void: internal_start_bits /= Void

end
