indexing

	description:

		"PCRE regexp compilers"

	library: "Gobo Eiffel Regexp Library"
	copyright: "Copyright (c) 2001-2002, Harald Erdbruegger and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class RX_PCRE_COMPILER

inherit

	RX_PCRE_BYTE_CODE_CONSTANTS
		export {NONE} all end

	RX_PCRE_ERROR_CONSTANTS
		export {NONE} all end

	RX_PCRE_ESCAPE_CONSTANTS
		export {NONE} all end

	RX_PCRE_OPTION_ROUTINES
		export {NONE} all end

	RX_PCRE_SHARED_CHARACTER_SETS
		export {NONE} all end

	UT_CHARACTER_CODES
		export {NONE} all end

	KL_IMPORTED_STRING_ROUTINES

	KL_IMPORTED_CHARACTER_ROUTINES

	KL_IMPORTED_INTEGER_ROUTINES

	KL_SHARED_STANDARD_FILES

	KL_SHARED_PLATFORM

creation

	make

feature {NONE} -- Initialization

	make is
			-- Create new regexp compiler.
		do
			!! byte_code.make (1024)
			set_character_case_mapping (default_character_case_mapping)
			set_word_set (default_word_set)
			pattern := clone (empty_pattern)
			reset
		ensure
			not_compiled: not is_compiled
		end

feature -- Status report

	is_compiled: BOOLEAN is
			-- Was last compilation successful?
		do
			Result := (error_message = err_msg_0)
		end

	is_caseless: BOOLEAN
			-- Do letters in the pattern match both upper- and lower-case letters?
			-- This option cannot be changed after compilation.
			-- (It is equivalent to Perl's /i option.)

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

feature -- Access

	byte_code: RX_BYTE_CODE
			-- Byte code built during compilation

	character_case_mapping: RX_CASE_MAPPING
			-- Character lowe- and upper-case mapping

	word_set: RX_CHARACTER_SET
			-- Set of characters making up words

feature -- Status setting

	set_default_options is
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
		end

	set_caseless (b: BOOLEAN) is
			-- Set `is_caseless' to `b'.
		require
			not_compiled: not is_compiled
		do
			is_caseless := b
		ensure
			caseless_set: is_caseless = b
		end

	set_extended (b: BOOLEAN) is
			-- Set `is_extended' to `b'.
		require
			not_compiled: not is_compiled
		do
			is_extended := b
		ensure
			extended_set: is_extended = b
		end

	set_greedy (b: BOOLEAN) is
			-- Set `is_greedy' to `b'.
		require
			not_compiled: not is_compiled
		do
			is_greedy := b
		ensure
			greedy_set: is_greedy = b
		end

	set_multiline (b: BOOLEAN) is
			-- Set `is_multiline' to `b'.
		do
			is_multiline := b
		ensure
			multiline_set: is_multiline = b
		end

	set_dotall (b: BOOLEAN) is
			-- Set `is_dotall' to `b'.
		do
			is_dotall := b
		ensure
			dotall_set: is_dotall = b
		end

	set_empty_allowed (b: BOOLEAN) is
			-- Set `is_empty_allowed' to `b'.
		do
			is_empty_allowed := b
		ensure
			empty_allowed_set: is_empty_allowed = b
		end

	set_dollar_endonly (b: BOOLEAN) is
			-- Set `is_dollar_endonly' to `b'.
		do
			is_dollar_endonly := b
		ensure
			dollar_endonly_set: is_dollar_endonly = b
		end

	set_bol (b: BOOLEAN) is
			-- Set `is_bol' to `b'.
		do
			is_bol := b
		ensure
			bol_set: is_bol = b
		end

	set_eol (b: BOOLEAN) is
			-- Set `is_eol' to `b'.
		do
			is_eol := b
		ensure
			eol_set: is_eol = b
		end

	set_anchored (b: BOOLEAN) is
			-- Set `is_anchored' to `b'.
		do
			is_anchored := b
		ensure
			anchored_set: is_anchored = b
		end

feature {RX_PCRE_MATCHER} -- Status setting

	set_ims_options (an_option: INTEGER) is
			-- Set `is_caseless', `is_multiline' and `is_dotall'
			-- from values encoded in `an_option'.
		do
			is_caseless := is_option_caseless (an_option)
			is_multiline := is_option_multiline (an_option)
			is_dotall := is_option_dotall (an_option)
		ensure
			caseless_set: is_caseless = is_option_caseless (an_option)
			multiline_set:is_multiline = is_option_multiline (an_option)
			dotall_set: is_dotall = is_option_dotall (an_option)
		end

feature -- Setting

	set_character_case_mapping (a_mapping: like character_case_mapping) is
			-- Set `character_case_mapping' to `a_mapping'.
		require
			not_compiled: not is_compiled
			a_mapping_not_void: a_mapping /= Void
		do
			character_case_mapping := a_mapping
		ensure
			character_case_mapping_set: character_case_mapping = a_mapping
		end

	set_word_set (a_set: like word_set) is
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

	compile (a_pattern: STRING) is
			-- Compile regular expression `a_pattern'.
			-- The compilation is driven by the various option flags.
			-- Set `is_compiled' to true if the pattern has been
			-- successfully compiled, otherwise the compilation error
			-- is described in `error_message' and `error_position'.
		require
			a_pattern_not_void: a_pattern /= Void
		local
			an_option: INTEGER
		do
			STRING_.wipe_out (pattern)
			pattern.append_string (a_pattern)
			pattern.append_character ('%U')
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
			error_message := err_msg_99
			error_position := pattern_position
			debug ("REGEXP")
				std.output.put_string ("COMPILING PATTERN: ")
				std.output.put_line (a_pattern)
				print_options (std.output)
			end
				-- Enclose the whole pattern in a bracket.
			byte_code.append_opcode (op_bra)
			compile_regexp (optchanged, False, False, -1)

			if error_message = err_msg_99 and then pattern_position <= pattern_count then
					-- If not reached end of pattern on success, there's an excess bracket.
				error_message := err_msg_22
			elseif maxbackrefs > subexpression_count then
					-- Give an error if there's back reference to a non-existent
					-- capturing subpattern.
				error_message := err_msg_15
			end
			if error_message = err_msg_99 then
				error_message := err_msg_0
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
			else
				error_position := pattern_position
			end
			debug ("REGEXP")
				if (not is_compiled) then
					std.output.put_string ("COMPILER ERROR: ")
					std.output.put_string (error_message)
					std.output.put_string (" at ")
					std.output.put_integer (error_position)
					std.output.put_string (" character: ")
					if 1 <= error_position and error_position <= pattern_count then
						std.output.put_character (pattern.item (error_position))
					end
				end
				print_compiled_pattern (std.output)
			end
		end

feature -- Error report

	error_message: STRING
			-- State of last compilation

	error_position: INTEGER
			-- Position in pattern where an error was detected;
			-- Result <= 0 implies no valid position was found

feature -- Reset

	reset is
			-- Reset compiler.
		do
			error_message := err_msg_99
			pattern.put ('%U', 1)
			pattern_count := 0
		ensure
			not_compiled: not is_compiled
		end

feature -- Debugging

	print_options (a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print options to `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			a_file.put_string ("Options:")
			if is_anchored then
				a_file.put_string (" anchored")
			end
			if is_caseless then
				a_file.put_string (" caseless")
			end
			if is_ichanged then
				a_file.put_string (" ichanged")
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
				a_file.put_string (" endonly")
			end
			if not is_greedy then
				a_file.put_string (" ungreedy")
			end
			a_file.put_new_line
		end

	print_compiled_pattern (a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print compiled pattern (options and byte code) to `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			i, nb: INTEGER
			j, k: INTEGER
			len: INTEGER
			an_op: INTEGER
			a_code: INTEGER
			a_min, a_max: INTEGER
			a_set: INTEGER
		do
			a_file.put_string ("Length = ")
			a_file.put_integer (byte_code.count)
			a_file.put_new_line
			a_file.put_string ("Subexpressions = ")
			a_file.put_integer (subexpression_count)
			a_file.put_new_line
			a_file.put_string ("Max Backrefs = ")
			a_file.put_integer (maxbackrefs)
			a_file.put_new_line
			print_options (a_file)
			if first_character >= 0 then
				a_file.put_string ("%Tfirst_character: ")
				if first_character < 256 and then print_set.has (first_character) then
					a_file.put_character (INTEGER_.to_character (first_character))
				else
					a_file.put_string ("\x")
					a_file.put_string (INTEGER_.to_hexadecimal (first_character, True))
				end
				a_file.put_new_line
			end
			if required_character >= 0 then
				a_file.put_string ("%Trequired_character: ")
				if required_character < 256 and then print_set.has (required_character) then
					a_file.put_character (INTEGER_.to_character (required_character))
				else
					a_file.put_string ("\x")
					a_file.put_string (INTEGER_.to_hexadecimal (required_character, True))
				end
				a_file.put_new_line
			end
			nb := byte_code.count - 1
			from i := 0 until i > nb loop
				a_file.put_string ("Pos:%T")
				a_file.put_integer (i)
				a_file.put_string ("%T%T")
				an_op := byte_code.opcode_item (i)
				if an_op >= op_bra then
					if i + 1 <= nb then
						a_file.put_integer (byte_code.integer_item (i + 1))
						i := i + 1
					else
						a_file.put_string ("end-of-byte-code")
					end
					a_file.put_string ("%TBra%T")
					a_file.put_integer (an_op - op_bra)
				else
					inspect an_op
					when
						op_opt, op_cond, op_cref, op_ketrmax, op_ketrmin, op_alt, op_ket,
						op_assert, op_assert_not, op_assertback, op_assertback_not, op_once,
						op_reverse
					then
						if i + 1 <= nb then
							a_file.put_integer (byte_code.integer_item (i + 1))
							i := i + 1
						else
							a_file.put_string ("end-of-byte-code")
						end
						a_file.put_character ('%T')
						a_file.put_string (op_name (an_op))
					when op_chars then
						if i + 1 <= nb then
							len := byte_code.integer_item (i + 1)
							a_file.put_integer (len)
							a_file.put_character ('%T')
							i := i + 1
							if i + len <= nb then
								i := i + 1
								from until len <= 0 loop
									a_code := byte_code.character_item (i)
									if a_code < 256 and then print_set.has (a_code) then
										a_file.put_character (INTEGER_.to_character (a_code))
									else
										a_file.put_string ("\x")
										a_file.put_string (INTEGER_.to_hexadecimal (a_code, True))
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
							if a_code < 256 and then print_set.has (a_code) then
								a_file.put_character (INTEGER_.to_character (a_code))
							else
								a_file.put_string ("\x")
								a_file.put_string (INTEGER_.to_hexadecimal (a_code, True))
							end
						else
							a_file.put_string ("end-of-byte-code")
						end
						a_file.put_character ('%T')
						a_file.put_string (op_name (an_op))
					when op_typestar, op_typeminstar, op_typeplus, op_typeminplus, op_typequery, op_typeminquery then
						if i + 1 <= nb then
							a_file.put_string (op_name (byte_code.opcode_item (i + 1)))
							i := i + 1
						else
							a_file.put_string ("end-of-byte-code")
						end
						a_file.put_character ('%T')
						a_file.put_string (op_name (an_op))
					when op_exact, op_upto, op_minupto then
						if i + 2 <= nb then
							a_code := byte_code.character_item (i + 2)
							if a_code < 256 and then print_set.has (a_code) then
								a_file.put_character (INTEGER_.to_character (a_code))
							else
								a_file.put_string ("\x")
								a_file.put_string (INTEGER_.to_hexadecimal (a_code, True))
							end
							a_file.put_character ('{')
							if an_op /= op_exact then
								a_file.put_string ("0,")
							end
							a_file.put_integer (byte_code.integer_item (i + 1))
							if an_op = op_minupto then
								a_file.put_character ('?')
							end
							a_file.put_character ('}')
						else
							a_file.put_string ("end-of-byte-code")
							a_file.put_character ('%T')
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
							a_file.put_integer (byte_code.integer_item (i + 1))
							a_file.put_character (')')
							if an_op = op_typeminupto then
								a_file.put_character ('?')
							end
						else
							a_file.put_string ("end-of-byte-code")
							a_file.put_character ('%T')
							a_file.put_string (op_name (an_op))
						end
						i := i + 2
					when op_not then
						a_file.put_string ("[^")
						if i + 1 <= nb then
							a_code := byte_code.character_item (i + 1)
							if a_code < 256 and then print_set.has (a_code) then
								a_file.put_character (INTEGER_.to_character (a_code))
							else
								a_file.put_string ("\x")
								a_file.put_string (INTEGER_.to_hexadecimal (a_code, True))
							end
							i := i + 1
						else
							a_file.put_string ("end-of-byte-code")
						end
						a_file.put_character (']')
					when op_notstar, op_notminstar, op_notplus, op_notminplus, op_notquery, op_notminquery then
						a_file.put_string ("[^")
						if i + 1 <= nb then
							a_code := byte_code.character_item (i + 1)
							if a_code < 256 and then print_set.has (a_code) then
								a_file.put_character (INTEGER_.to_character (a_code))
							else
								a_file.put_string ("\x")
								a_file.put_string (INTEGER_.to_hexadecimal (a_code, True))
							end
							i := i + 1
						else
							a_file.put_string ("end-of-byte-code")
						end
						a_file.put_character (']')
						a_file.put_string (op_name (an_op))
					when op_notexact, op_notupto, op_notminupto then
						a_file.put_string ("[^")
						if i + 2 <= nb then
							a_code := byte_code.character_item (i + 2)
							if a_code < 256 and then print_set.has (a_code) then
								a_file.put_character (INTEGER_.to_character (a_code))
							else
								a_file.put_string ("\x")
								a_file.put_string (INTEGER_.to_hexadecimal (a_code, True))
							end
							a_file.put_string ("](")
							if an_op /= op_notexact then
								a_file.put_character (',')
							end
							a_file.put_integer (byte_code.integer_item (i + 1))
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
								a_file.put_integer (byte_code.integer_item (i + 1))
								i := i + 1
							end
						else
							check op_class: an_op = op_class end
							a_file.put_character ('[')
							if i + 1 <= nb then
								a_set := byte_code.integer_item (i + 1)
								if byte_code.valid_character_set (a_set) then
									from j := 0 until j > 255 loop
										if byte_code.character_set_has (a_set, j) then
											from
												k := j + 1
											until
												k > 255 or else
												not byte_code.character_set_has (a_set, k)
											loop
												k := k + 1
											end
											if not alnum_set.has (j) then
												a_file.put_character ('\')
											end
											if print_set.has (j) then
												a_file.put_character (INTEGER_.to_character (j))
											else
												a_file.put_character ('x')
												a_file.put_string (INTEGER_.to_hexadecimal (j, True))
											end
											k := k - 1
											if k > j then
												a_file.put_character ('-')
												if not alnum_set.has (k) then
													a_file.put_character ('\')
												end
												if print_set.has (k) then
													a_file.put_character (INTEGER_.to_character (k))
												else
													a_file.put_character ('x')
													a_file.put_string (INTEGER_.to_hexadecimal (k, True))
												end
											end
											j := k
										end
										j := j + 1
									end
								else
									a_file.put_string ("invalid character set: ")
									a_file.put_integer (a_set)
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
									a_file.put_integer (a_min)
									a_file.put_character (',')
									if a_max /= 0 then
										a_file.put_integer (a_max)
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
						a_file.put_string (op_name (an_op))
					end 
				end
				i := i + 1
				a_file.put_new_line
			end
		end

feature {NONE} -- Status report

	is_startline: BOOLEAN

	is_ichanged: BOOLEAN

	optchanged: INTEGER

	ims_options: INTEGER is
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

	set_default_internal_options is
			-- Set default internal options.
		do
			set_startline (False)
			set_ichanged (False)
		ensure
			startline_set: is_startline = False
			ichanged_set: is_ichanged = False
		end

	set_startline (b: BOOLEAN) is
			-- Set `startline' to `b'.
		do
			is_startline := b
		ensure
			startline_set: is_startline = b
		end

	set_ichanged (b: BOOLEAN) is
			-- Set `ichanged' to `b'.
		do
			is_ichanged := b
		ensure
			ichanged_set: is_ichanged = b
		end

feature {NONE} -- Access

	pattern: STRING
			-- Regular expression pattern being compiled

	pattern_position: INTEGER
			-- Current position in `pattern'

	pattern_count: INTEGER
			-- Number of characters in `pattern'

	subexpression_count: INTEGER
			-- Number of used brackets

	maxbackrefs: INTEGER
			-- Maximum number of back references

	first_character: INTEGER
			-- First character in regular expression
			-- if any; -1 otherwise

	required_character: INTEGER
			-- Required character in regular expression
			-- if any, -1 or -2 otherwise

	regexp_countlits: INTEGER
			-- Mandatory number of characters in literal

	find_fixed_code_length (a_position: INTEGER): INTEGER is
			-- Scan the byte code and compute the fixed length of input string that will match it,
			-- if the length is fixed. This is needed for dealing with backward assertions.
			-- `a_position' is the position of the `op_bra' opcode in the byte code.
			-- Return the fixed length, or non-positive if there is no fixed length.
		require
			a_position_large_enough: a_position >= 0
			a_position_small_enough: a_position < byte_code.count - 2
			is_bra: byte_code.opcode_item (a_position) >= op_bra or 
				byte_code.opcode_item (a_position) = op_once or 
				byte_code.opcode_item (a_position) = op_cond
		local
			cc, d, op: INTEGER
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
							cc := cc + byte_code.integer_item (cc + 1)
						until
							byte_code.opcode_item (cc) /= op_alt
						loop
							cc := cc + byte_code.integer_item (cc + 1)
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
							stop := true
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
						cc := cc + byte_code.integer_item (cc + 1)
					until
						byte_code.opcode_item (cc) /= op_alt
					loop
						cc := cc + byte_code.integer_item (cc + 1)
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
					d := byte_code.integer_item (cc)
					branchlength := branchlength + d
					cc := cc + d + 1
				when op_exact, op_typeexact then
						-- Handle exact repetitions.
					branchlength := branchlength + byte_code.integer_item (cc + 1)
						-- Skip the opcode, the number of matches and the
						-- repeated opcode stored in the byte code.
					cc := cc + 3
				when op_not_digit, op_digit, op_not_whitespace, op_whitespace, op_not_wordchar, op_wordchar, op_any then
						-- Handle single-char matchers
						branchlength := branchlength + 1
					cc := cc + 1
				when op_class then -- TODO: maybe add op_ref
						-- Check a class for variable quantification.
						-- First skip the opcode and the reference id (`op_ref')
						-- or the class set offset (`op_class').
					cc := cc + 2
					inspect byte_code.opcode_item (cc)
					when op_crstar, op_crminstar, op_crquery, op_crminquery then
						Result := -1
						stop := True
					when op_crrange, op_crminrange then
						d := byte_code.integer_item (cc + 1)
						if d /= byte_code.integer_item (cc + 2) then
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

	compile_regexp (a_changed_options: INTEGER; a_in_group, a_lookbehind: BOOLEAN; a_condref: INTEGER) is
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
			saved_reqchar, saved_countlits: INTEGER
			length: INTEGER
			changed_options: INTEGER
			old_options: INTEGER
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
				byte_code.append_integer (a_condref)
			end
				-- Loop for each alternative branch.
			from until stop loop
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
					byte_code.put_integer (length, last_branch + 1)
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
							error_message := err_msg_25
						else
							byte_code.put_integer (length, reverse_count)
						end
					end
						-- Reached end of expression, either ')' or end of pattern. Insert a
						-- terminating ket and the length of the whole bracketed item, and return,
						-- leaving the pointer at the terminating char. If any of the ims options
						-- were changed inside the group, compile a resetting opcode following.
					if pattern.item_code (pattern_position) /= Bar_code then
						length := byte_code.count - start_bracket
						byte_code.append_opcode (op_ket)
						byte_code.append_integer (length)
						if not is_option_undef (changed_options) then
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

	compile_branch (a_in_group: BOOLEAN) is
			-- Scan the pattern, compiling it into the byte code.
		local
			bravalue, length, val: INTEGER
			condcount: INTEGER
			previous: INTEGER
			tempcode, tc: INTEGER
			condref: INTEGER
			sub_countlits, sub_reqchar: INTEGER
			prevreqchar: INTEGER
			saved_countlits, saved_reqchar: INTEGER
			newoptions, opt: INTEGER
			old_options: INTEGER
			old_extended, old_greedy: BOOLEAN
			c: INTEGER
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
				stop or else
				pattern_position > pattern_count or else
				error_message /= err_msg_99
			loop
				c := pattern.item_code (pattern_position)
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
						bravalue := -1

						pattern_position := pattern_position + 1
						check
								-- The last character read was '(', and there is at
								-- least the character '%U' and the end of `pattern'.
							valid_position: pattern_position <= pattern.count
						end
						if pattern.item_code (pattern_position) = Question_mark_code then
							pattern_position := pattern_position + 1
							check
									-- The last character read was '?', and there is at
									-- least the character '%U' and the end of `pattern'.
								valid_position: pattern_position <= pattern.count
							end
							inspect pattern.item_code (pattern_position)
							when Pound_code then
									-- Comment skip to ket.
								from
									tc := pattern_position + 1
								until
									tc > pattern_count or else
									pattern.item_code (tc) = Right_parenthesis_code
								loop
									tc := tc + 1
								end
								if tc > pattern_count then
										-- Unexpeceted end of pattern.
									pattern_position := tc - 1
								else
									pattern_position := tc
								end
							when Colon_code then
									-- Non-extracting bracket.
								bravalue := op_bra
								pattern_position := pattern_position + 1
							when Left_parenthesis_code then
									-- Conditional group.
								bravalue := op_cond
								pattern_position := pattern_position + 1
								check
										-- The last character read was '(', and there is at
										-- least the character '%U' and the end of `pattern'.
									valid_position: pattern_position <= pattern.count
								end
								inspect pattern.item_code (pattern_position)
								when  Zero_code .. Nine_code then
									condref := scan_decimal_number (10)
									check
											-- `scan_decimal_number' put `pattern_position' at the
											-- first position that was not a digit, and there is at
											-- least the character '%U' and the end of `pattern'.
										valid_position: pattern_position <= pattern.count
									end
									if pattern.item_code (pattern_position) /= Right_parenthesis_code then
										error_message := err_msg_26
									end
									if condref = 0 then
										error_message := err_msg_35
									else
										pattern_position := pattern_position + 1
									end
								else
									tc := pattern_position
									if pattern.item_code (tc) /= Question_mark_code then
										error_message := err_msg_28
									else
										check
												-- The last character read was '?', and there is at
												-- least the character '%U' and the end of `pattern'.
											valid_position: pattern_position <= pattern.count
										end
										inspect pattern.item_code (tc + 1)
										when Equal_code, Exclamation_code, Less_than_code then
											-- Do nothing.
										else
											error_message := err_msg_28
										end
									end
									pattern_position := tc - 1
								end
							when Equal_code then
									-- Positive lookahead.
								bravalue := op_assert
								pattern_position := pattern_position + 1
							when Exclamation_code then
									-- Negative lookahead.
								bravalue := op_assert_not
								pattern_position := pattern_position + 1
							when Less_than_code then
									-- Lookbehinds.
								pattern_position := pattern_position + 1
								check
										-- The last character read was '<', and there is at
										-- least the character '%U' and the end of `pattern'.
									valid_position: pattern_position <= pattern.count
								end
								inspect pattern.item_code (pattern_position)
								when Equal_code then
										-- Positive lookbehind.
									bravalue := op_assertback
									pattern_position := pattern_position + 1
								when Exclamation_code then
										-- Negative lookbehind.
									bravalue := op_assertback_not
									pattern_position := pattern_position + 1
								else
										-- Syntax error.
									error_message := err_msg_24
								end
							when Greater_than_code then
									-- One-time brackets.
								bravalue := op_once
								pattern_position := pattern_position + 1
							when Upper_r_code then
									-- Pattern recursion.
								byte_code.append_opcode (op_recurse)
								pattern_position := pattern_position + 1
							else
									-- Option setting.
								from
									c := pattern.item_code (pattern_position)
									flag := True
								until
									c = Right_parenthesis_code or else
									c = Colon_code or else
									error_message /= err_msg_99
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
									when Upper_u_code then
										is_greedy := not flag
									else
										error_message := err_msg_12
									end
									if error_message /= err_msg_99 then
										c := 0
									else
										pattern_position := pattern_position + 1
										check
												-- The last character read was not '%U', and there is at
												-- least the character '%U' and the end of `pattern'.
											valid_position: pattern_position <= pattern.count
										end
										c := pattern.item_code (pattern_position)
									end
								end
								if is_caseless /= is_option_caseless (newoptions) then
									set_ichanged (True)
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
									pattern_position := pattern_position + 1
								end
							end
						else
								-- Else we have a referencing group adjust the opcode.
							subexpression_count := subexpression_count + 1
							if subexpression_count > extract_max then
								error_message := err_msg_13
							else
								bravalue := op_bra + subexpression_count
							end
						end
						if bravalue >= 0 then
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
										tc := tempcode + byte_code.integer_item (tempcode + 1)
									until
										byte_code.opcode_item (tc) = op_ket
									loop
										condcount := condcount + 1
										tc := tc + byte_code.integer_item (tc + 1)
									end
									if condcount > 2 then
										error_message := err_msg_27
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
								if pattern.item_code (pattern_position) /= Right_parenthesis_code then
										-- Error if hit end of pattern.
									error_message := err_msg_14
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
						c := pattern.item_code (pattern_position)
						from flag := False until flag loop
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
										byte_code.append_integer (-val - esc_ref)
									else
										if -val <= esc_lcb or else -val >= esc_ucz then
											previous := 0
										end
										byte_code.append_opcode (-val)
									end
									pattern_position := pattern_position + 1
									flag := True
								else
									c := val
									byte_code.append_character (c)
									length := length + 1
									flag := (error_message /= err_msg_99)
								end
							else
								byte_code.append_character (c)
								length := length + 1
							end
							if not flag then
								pattern_position := pattern_position + 1
								if is_extended then
									scan_comment
								end
								if pattern_position > pattern_count or length >= maxlit then
									flag := True
								else
									c := pattern.item_code (pattern_position)
									flag := meta_set.has (c)
								end
							end
						end
						if length > 0 then
								-- Update the last character and the count of literals.
							if length > 1 then
								prevreqchar := byte_code.character_item (tempcode + length - 1)
							else
								prevreqchar := required_character
							end
							required_character := byte_code.character_item (tempcode + length)
							regexp_countlits := regexp_countlits + length
								-- Compute the length and set it in the byte code,
								-- and advance to the next state.
							byte_code.put_integer (length, tempcode)
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

	compile_character_class is
			-- Compile character class.
		require
			pattern_position_small_enough: pattern_position <= pattern_count
			is_character_class: pattern.item_code (pattern_position) = Left_bracket_code
		local
				-- We have to build a temporary character-map in case the
				-- class contains only 1 character, because in that
				-- case the compiled code doesn't use a character class.
			class_set: RX_CHARACTER_SET
			tmp_pat_index: INTEGER
			posix_class, val: INTEGER
			class_charcount: INTEGER
			class_lastchar: INTEGER
			c, range_end: INTEGER
			negate_class: BOOLEAN
			local_negate: BOOLEAN
		do
			class_set := actual_set
			class_set.wipe_out
			pattern_position := pattern_position + 1
			check
					-- The last character read was '[', and there is at
					-- least the character '%U' and the end of `pattern'.
				valid_position: pattern_position <= pattern.count
			end
			c := pattern.item_code (pattern_position)
			if c = Caret_code then
					-- If the first character is '^', set the negation flag and skip it.
				negate_class := True
				pattern_position := pattern_position + 1
				check
						-- The last character read was '^', and there is at
						-- least the character '%U' and the end of `pattern'.
					valid_position: pattern_position <= pattern.count
				end
				c := pattern.item_code (pattern_position)
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
					error_message := err_msg_6
				else
					tmp_pat_index := 0
					if c = Left_bracket_code then
						check
								-- The last character read was '[', and there is at
								-- least the character '%U' and the end of `pattern'.
							valid_position: pattern_position <= pattern.count
						end
						inspect pattern.item_code (pattern_position + 1)
						when Colon_code, Dot_code, Equal_code then
							tmp_pat_index := check_posix_syntax (class_set, pattern_position)
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
						if pattern.item_code (pattern_position + 1) /= Colon_code then
							error_message := err_msg_31
						else
							pattern_position := pattern_position + 2
							if pattern.item_code (pattern_position) = Caret_code then
								pattern_position := pattern_position + 1
								local_negate := True
							end
							posix_class := check_posix_name (pattern_position, tmp_pat_index - pattern_position)
							if posix_class < 0 then
								error_message := err_msg_30
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
								val := c
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
									error_message := err_msg_7
								end
							else
								c := val
							end
						end
						if val >= 0 then
							if
								pattern.item_code (pattern_position + 1) = Minus_code and then
								pattern.item_code (pattern_position + 2) /= Right_bracket_code
							then
								-- A single character may be followed by '-' to form a range. However,
								-- Perl does not permit ']' to be the end of the range. A '-' character
								-- here is treated as a literal.
								pattern_position := pattern_position + 2
								if pattern_position > pattern_count then
									error_message := err_msg_6
								else
									range_end := pattern.item_code (pattern_position)
									tmp_pat_index := pattern_position
									if range_end = Backslash_code then
											-- The second part of a range can be a single-character escape, but
											-- not any of the other escapes. Perl 5.6 treats a hyphen as a literal
											-- in such circumstances.
										val := scan_escape (subexpression_count, True)
										if val < 0 then
												-- \b is backslash; any other special means the '-' was literal.
											if val = -esc_lcb then
												range_end := Back_space_code
											else
												pattern_position := tmp_pat_index - 2
												range_end := c
											end
										else
											range_end := val
										end
									end
									if range_end < c then
										error_message := err_msg_8
									else
										from
												-- To make it for the `range_end' avoids endless loop.
											class_set.add_character (range_end)
											if is_caseless then
												class_set.add_character (character_case_mapping.flip_case (range_end))
											end
												-- In case a one-char range.
											class_charcount := class_charcount + range_end - c + 1
											class_lastchar := range_end
										until
											c >= range_end
										loop
											class_set.add_character (c)
											if is_caseless then
												class_set.add_character (character_case_mapping.flip_case (c))
											end
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
								class_lastchar := c
							end
						end
					end
				end
				if error_message = err_msg_99 then
					pattern_position := pattern_position + 1
					c := pattern.item_code (pattern_position)
				end
			end
			if class_charcount = 1 then
				if class_lastchar < 0 then
					if negate_class then
						if (-class_lastchar) \\ 2 = 0 then
							byte_code.append_opcode (-class_lastchar + 1)
						else
							byte_code.append_opcode (-class_lastchar - 1)
						end
					else
						byte_code.append_opcode (-class_lastchar)
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
					byte_code.append_character (class_lastchar)
				end
			else
					-- Otherwise, negate the character map if necessary, and copy it into
					-- the byte code.
				byte_code.append_opcode (op_class)
				byte_code.append_character_set (class_set, negate_class)
			end
		end

	compile_repeats (a_min, a_max, a_previous, a_prevreqchar, a_subcountlits: INTEGER) is
		local
			repeat_type, op_type: INTEGER
			repeat_min, repeat_max: INTEGER
			op, i, len: INTEGER
			previous, ketoffset: INTEGER
			offset, oldlinkoffset: INTEGER
			bralink: INTEGER
			c: INTEGER
			greedy_default, greedy_non_default: BOOLEAN
		do
				-- Set up the default and non-default settings for greediness.
			greedy_default := not is_greedy
			greedy_non_default := not greedy_default

			repeat_min := a_min
			repeat_max := a_max
			previous := a_previous
			if previous = 0 then
				error_message := err_msg_9
			else
					-- If the next character is '?' this is a minimizing repeat, by default,
					-- but if PCRE_UNGREEDY is set, it works the other way round. Advance to the
					-- next character.
				if pattern.item_code (pattern_position + 1) = Question_mark_code then
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
					len := byte_code.integer_item (previous + 1)
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
							byte_code.append_integer (repeat_min)
							if repeat_max = -1 then
								repeat_max := 0
								byte_code.append_integer (0)
							else
								byte_code.append_integer (repeat_max)
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
						from i := previous until op = op_ket loop
							i := i + byte_code.integer_item (i + 1)
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
									byte_code.put_integer (previous - bralink, previous)
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
						from i := 1 until i >= repeat_min loop
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
						from i := repeat_max - 1 until i < 0 loop
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
									byte_code.append_integer (offset)
								end
							end
							byte_code.append_subcopy (previous, len)
							i := i - 1
						end
							-- Now chain through the pending brackets, and fill in their length
							-- fields (which are holding the chain links pro tem).
						from until bralink = 0 loop
							offset := byte_code.count - bralink + 1
							i := byte_code.count - offset + 1
							check op_bra: byte_code.opcode_item (i - 1) = op_bra end
							oldlinkoffset := byte_code.integer_item (i)
							if oldlinkoffset = 0 then
								bralink := 0
							else
								bralink := bralink - oldlinkoffset
							end
							byte_code.append_opcode (op_ket)
							byte_code.append_integer (offset)
							byte_code.put_integer (offset, i)
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
					error_message := err_msg_11
				end
			end
		end

	compile_single_repeat (a_ch: INTEGER; a_previous, a_min, a_max, a_op_type, a_repeat_type: INTEGER) is
		local
			repeat_type: INTEGER
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
					byte_code.append_integer (a_max)
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
					byte_code.append_integer (a_min)
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
					byte_code.append_integer (a_max - a_min)
				end
			end
			byte_code.append_character (a_ch)
		end

	compile_counted_repeats (a_previous, a_prevreqchar, a_subcountlits: INTEGER): BOOLEAN is
			-- Read an item of the form {n,m}. This is called only after is_counted_repeat() has
			-- confirmed that a repeat-count quantifier exists, so the syntax is guaranteed to be
			-- correct, but we need to check the values and then call `compile_repeats' feature.
		local
			min: INTEGER
			max: INTEGER
			i: INTEGER
			c: INTEGER
		do
			min := 0
				-- Unlimited.
			max := -1
			from
				i := pattern_position + 1
				c := pattern.item_code (i)
			until
				c < Zero_code or c > Nine_code
			loop
				min := min * 10 + c - Zero_code
				i := i + 1
				c := pattern.item_code (i)
			end
			if min > 65535 then
-- TODO: no such limitation anymore.
				error_message := err_msg_5
			elseif i - pattern_position > 1 then
					-- One or more digits seen.
				if c = Right_brace_code then
					max := min
					Result := True
				elseif c = Comma_code then
					i := i + 1
					c := pattern.item_code (i)
					if c /= Right_brace_code then
						from
							max := 0
						until
							c < Zero_code or c > Nine_code
						loop
							max := max * 10 + c - Zero_code
							i := i + 1
							c := pattern.item_code (i)
						end
					end
					if c = Right_brace_code then
						if max > 65535 then
-- TODO: no such limitation anymore.
							error_message := err_msg_5
						elseif max >= 0 and then min > max then
							error_message := err_msg_4
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

	check_posix_syntax (a_set: RX_CHARACTER_SET; a_pattern_position: INTEGER): INTEGER is
			-- This function is called when the sequence "[:" or "[." or "[=" is
			-- encountered in a character class. It checks whether this is followed by an
			-- optional ^ and then a sequence of letters, terminated by a matching ":]" or
			-- ".]" or "=]".
		require
			a_set_not_void: a_set /= Void
		local
			i: INTEGER
			terminator: INTEGER
		do
			from
				i := a_pattern_position
				terminator := pattern.item_code (i + 1)
				if pattern.item_code (i + 2) = Caret_code then
					i := i + 3
				else
					i := i + 2
				end
			until
				not a_set.has (pattern.item_code (i))
			loop
				i := i + 1
			end
			if pattern.item_code (i) = terminator and then pattern.item_code (i + 1) = Right_bracket_code then
				Result := i
			else
				Result := -1
			end
		ensure
			valid_position: Result /= -1 implies pattern.valid_index (Result)
		end

	check_posix_name (a_pattern_position, a_len: INTEGER): INTEGER is
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
					from j := 1 until j > a_len loop
						if a_name.item_code (j) /= pattern.item_code (k) then
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

	scan_decimal_number (a_max_len: INTEGER): INTEGER is
			-- The actual pattern-character is the one after the digit sequence
		local
			c: INTEGER
			stop: INTEGER
		do
			stop := pattern_position + a_max_len
			from
				c := pattern.item_code (pattern_position)
			until
				c > Nine_code or else c < Zero_code or else pattern_position >= stop
			loop
				Result := Result * 10 + c - Zero_code
				pattern_position := pattern_position + 1
				c := pattern.item_code (pattern_position)
			end
		ensure
			decimal_positive: Result >= 0
			new_pattern_position: pattern_position <= old pattern_position + a_max_len
		end

	scan_octal_number (a_max_len: INTEGER): INTEGER is
			-- The actual pattern-character is the one after the digit sequence
		local
			c: INTEGER
			stop: INTEGER
		do
			stop := pattern_position + a_max_len
			from
				c := pattern.item_code (pattern_position)
			until
				c > Seven_code or else c < Zero_code or else pattern_position >= stop
			loop
				Result := Result * 8 + c - Zero_code
				pattern_position := pattern_position + 1
				c := pattern.item_code (pattern_position)
			end
		ensure
			octal_position: Result >= 0
			new_pattern_position: pattern_position <= old pattern_position + a_max_len
		end

	scan_hex_number (a_max_len: INTEGER): INTEGER is
			-- The actual pattern-character is the one after the digit sequence.
		local
			c: INTEGER
			stop: INTEGER
		do
			stop := pattern_position + a_max_len
			from
				c := pattern.item_code (pattern_position)
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
				c := pattern.item_code (pattern_position)
			end
		ensure
			hex_number_positive: Result >= 0
			new_pattern_position: pattern_position <= old pattern_position + a_max_len
		end

	scan_comment is
			-- Skip comment.
		local
			i, j: INTEGER
		do
			j := pattern_position
			from i := j - 1 until i = j loop
				i := j
				from until
					not space_set.has (pattern.item_code (j))
				loop
					j := j + 1
				end
				if pattern.item_code (j) = Pound_code then
					from
						j := j + 1
					until
						j > pattern_count or else pattern.item_code (j) = New_line_code
					loop
						j := j + 1
					end
				end
			end
			pattern_position := j
		end

	scan_escape (a_bra_count: INTEGER; a_isclass: BOOLEAN): INTEGER is
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
			c: INTEGER
		do
			pattern_position := pattern_position + 1
			check
					-- The last character read was '/', and there is at
					-- least the character '%U' and the end of `pattern'.
				valid_position: pattern_position <= pattern.count
			end
			c := pattern.item_code (pattern_position)
			if pattern_position > pattern_count then
					-- If backslash is at the end of the pattern, it's an error.
				error_message := err_msg_1
			elseif c < Zero_code or c > Lower_z_code then
					-- Digits or letters may have special meaning;
					-- all others are literals.
				Result := c
			else
					-- Do an initial lookup in a table. A non-zero result is something that can be
					-- returned immediately. Otherwise further processing may be required.
				Result := escape_character (c)
				if Result = 0 then
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
							Result := scan_decimal_number (10)
							if Result < 10 or else Result <= a_bra_count then
								if Result > maxbackrefs then
									maxbackrefs := Result
								end
								Result := -(esc_ref + Result)
							else
									-- Put the pointer back.
								pattern_position := old_pattern_index
								if c >= Eight_code then
									Result := 0
								else
									Result := scan_octal_number (3)
								end
							end
						elseif c >= Eight_code then
								-- Handle an octal number following \. If the first digit is 8 or 9, Perl
								-- generates a binary zero byte and treats the digit as a following literal.
								-- Thus we have to pull back the pointer by one.
							Result := 0
						else
							Result := scan_octal_number (3)
						end
						pattern_position := pattern_position - 1
					when Zero_code then
						Result := scan_octal_number (3)
						Result := Result \\ 256
						pattern_position := pattern_position - 1
					when Lower_x_code then
							-- Read just a single hex char.
						pattern_position := pattern_position + 1
						Result := scan_hex_number (2)
						pattern_position := pattern_position - 1
					when Lower_c_code then
							-- Make following character an control-character.
						pattern_position := pattern_position + 1
						check
								-- The last character read was 'c', and there is at
								-- least the character '%U' and the end of `pattern'.
							valid_position: pattern_position <= pattern.count
						end
						c := pattern.item_code (pattern_position)
						if pattern_position > pattern_count then
							error_message := err_msg_2
							Result := 0
						else
							if Lower_a_code <= c and c <= Lower_z_code then
								c := character_case_mapping.flip_case (c)
							end
							if c < At_code then
								Result := c + At_code
							elseif c <= 127 then
								Result := c - At_code
							else
-- TODO: invalid control character.
								-- error_message := ...
								Result := c
							end
						end
					else
						error_message := err_msg_3
						Result := c
					end
				end
			end
		end

feature {NONE} -- Implementation

	first_significant_code (a_options, a_optbit: INTEGER; a_optstop: BOOLEAN): INTEGER is
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
			icode, op: INTEGER
			stop: BOOLEAN
			an_opt: INTEGER
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
					from op := op_alt until op /= op_alt loop
						icode := icode + byte_code.integer_item (icode + 1)
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

	find_firstchar (a_options: INTEGER): INTEGER is
			-- Try to find out if there is a fixed first character. This is called for
			-- unanchored expressions, as it speeds up their processing quite considerably.
			-- Consider each alternative branch. If they all start with the same char, or with
			-- a bracket all of whose alternatives start with the same char (recurse ad lib),
			-- then we set first_character to that char, otherwise to -1.
			-- `a_options' are used to check casing changes. Return options.
			-- Side-effect: `code_index' is the position in the byte code where to start
			-- scanning, and is left on the last opcode read on exit.
		require
			code_index_large_enough: code_index >= 0
			code_index_small_enough: code_index < byte_code.count + 2
		local
			icode: INTEGER
			op, c: INTEGER
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
						code_index := code_index + 2
					elseif op = op_chars then
						code_index := code_index + 1
					end
					if first_character < 0 then
						first_character := byte_code.character_item (code_index + 1)
					elseif first_character /= byte_code.character_item (code_index + 1) then
						first_character := -1
						stop := True
					end
				else
					first_character := -1
					stop := True
				end
				if not stop then
					icode := icode + byte_code.integer_item (icode + 1)
					op := byte_code.opcode_item (icode)
				end
			end
		end

	can_anchored (a_options: INTEGER): BOOLEAN is
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
			op: INTEGER
			opt: INTEGER
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
					icode := icode + byte_code.integer_item (icode + 1)
					op := byte_code.opcode_item (icode)
				end
			end
		end

	has_startline: BOOLEAN is
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
			op: INTEGER
			opt: INTEGER
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
					icode := icode + byte_code.integer_item (icode + 1)
					op := byte_code.opcode_item (icode)
				end
			end
		end

	code_index: INTEGER
			-- Position in byte code

feature {NONE} -- Constants

	empty_pattern: STRING is
			-- Dummy empty pattern
		once
			Result := "T"
			Result.put ('%U', 1)
		ensure
			empty_pattern_not_void: Result /= Void
			empty_pattern_not_empty: Result.count > 0
			end_of_pattern: Result.item (Result.count) = '%U'
		end

	actual_set: RX_CHARACTER_SET is
			-- Shared buffer for charater set
		once
			!! Result.make_empty
		ensure
			actual_set_not_void: Result /= Void
		end

	infinity: INTEGER is
			-- Positive infinity
		once
			Result := Platform.Maximum_integer
		end

	maxlit: INTEGER is
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
	pattern_not_void: pattern /= Void
	pattern_count_definition: pattern_count = pattern.count - 1
	pattern_count_positive: pattern_count >= 0
	end_of_pattern: pattern.item (pattern.count) = '%U'
	valid_first_character: -1 <= first_character
	valid_required_character: -2 <= required_character

end
