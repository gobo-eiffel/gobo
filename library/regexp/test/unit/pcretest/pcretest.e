note

	description:

		"Tester for features of PCRE regexps"

	library: "Gobo Eiffel Regexp Library"
	copyright: "Copyright (c) 2002-2018, Harald Erdbrügger and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class PCRETEST

inherit

	ANY

	KL_SHARED_ARGUMENTS
	KL_SHARED_STANDARD_FILES
	KL_SHARED_FILE_SYSTEM
	KL_SHARED_EXECUTION_ENVIRONMENT
	KL_SHARED_PLATFORM
	KL_IMPORTED_INTEGER_ROUTINES

	UT_CHARACTER_CODES
		export {NONE} all end

create

	make, make_tester

feature {NONE} -- Initialization

	make_tester
			-- Create a new PCRE tester.
		do
			create error_handler.make_standard
			create copy_string_mask.make_filled (False, 1, 32)
			create get_string_mask.make_filled (False, 1, 32)
		end

	make
			-- Create a new PCRE tester and execute it.
		do
			Arguments.set_program_name ("pcretest")
			make_tester
			if Arguments.argument_count = 0 then
				execute_test (testinput1_filename, "out1", False) -- 100% fits
				execute_test (testinput2_filename, "out2", True)  -- 100% fits
				execute_test (testinput3_filename, "out3", False) -- 100% fits
				execute_test (testinput4_filename, "out4", False) -- missing locale support
				execute_test (testinput5_filename, "out5", False) -- utf8 not supported
				execute_test (testinput6_filename, "out6", False) -- utf8 and memory tests not supported
			elseif Arguments.argument_count = 1 then
				execute_test (Arguments.argument (1), Void, False)
			else
				execute_test (Arguments.argument (1), Arguments.argument (2), False)
			end
		end

feature -- Access

	error_handler: UT_ERROR_HANDLER
			-- Error handler

feature -- Execution

	execute_test (an_input_filename, an_output_filename: detachable STRING; a_show_info: BOOLEAN)
			-- Process `an_input_filename', execute the corresponding test
			-- and put the result in `an_output_filename'. Use standard input
			-- file if `an_input_filename ' is Void and standard output file
			-- if `an_output_filename' is Void.
		local
			infile: KL_TEXT_INPUT_FILE
			inf: KI_TEXT_INPUT_STREAM
			outfile: KL_TEXT_OUTPUT_FILE
			outf: KI_TEXT_OUTPUT_STREAM
			cannot_read: UT_CANNOT_READ_FILE_ERROR
			cannot_write: UT_CANNOT_WRITE_TO_FILE_ERROR
		do
			if an_input_filename = Void then
				inf := std.input
			else
				create infile.make (an_input_filename)
				infile.open_read
				if not infile.is_open_read then
					create cannot_read.make (an_input_filename)
					error_handler.report_error (cannot_read)
					infile := Void
				end
				inf := infile
			end
			if inf /= Void then
				if an_output_filename = Void then
					outf := std.output
				else
					create outfile.make (an_output_filename)
					outfile.open_write
					if not outfile.is_open_write then
						create cannot_write.make (an_output_filename)
						error_handler.report_error (cannot_write)
						outfile := Void
					end
					outf := outfile
				end
			end
			if inf /= Void and outf /= Void then
				outf.put_line ("PCRE version 3.4 22-Aug-2000")
				outf.put_new_line
				process_input_file (inf, outf, a_show_info)
				if outfile /= Void then
					outfile.close
				end
				if infile /= Void then
					infile.close
				end
			end
		end

feature {NONE} -- Processing

	process_input_file (an_input_file: KI_TEXT_INPUT_STREAM; an_output_file: KI_TEXT_OUTPUT_STREAM; a_show_info: BOOLEAN)
			-- Process the input file of regexp patterns and related subjects.
			-- Put the results in the output file.
		require
			an_input_file_not_void: an_input_file /= Void
			an_input_file_open_read: an_input_file.is_open_read
			an_output_file_not_void: an_output_file /= Void
			an_output_file_open_write: an_output_file.is_open_write
		local
				-- Buffer to track all input characters, so we can produce
				-- an exact copy of the input file to the output file.
			text: STRING
			pattern: STRING
			subject: STRING
			pattern_count: INTEGER
			subject_count: INTEGER
			subject_start: INTEGER
			count_matches: INTEGER
			is_subject_anchored: BOOLEAN
			is_subject_empty_allowed: BOOLEAN
			a_regexp: RX_PCRE_REGULAR_EXPRESSION
		do
			from
				create a_regexp.make
				create text.make (0)
				create pattern.make (0)
				create subject.make (0)
				an_input_file.read_character
			until
				an_input_file.end_of_input
			loop
					-- Next regular expression.
				text.wipe_out
				pattern.wipe_out
				read_pattern (an_input_file, text, pattern)
				pattern_count := pattern_count + 1
				a_regexp.reset
				read_pattern_options (an_input_file, a_regexp, text, pattern)
				an_output_file.put_string (text)
					-- Workaround to match a kind of option setting, which is not supported with
					-- Gobo PCRE by now, because the original PCRE uses a two pass compiler against
					-- the one pass compiler in Gobo PCRE.
				if
					pattern.count > 4 and then
					pattern.item (pattern.count) = ')' and then
					pattern.item (pattern.count - 1) = 'U' and then
					pattern.item (pattern.count - 2) = '?' and then
					pattern.item (pattern.count - 3) = '('
				then
					a_regexp.set_greedy (False)
				end
				a_regexp.compile (pattern)
				if a_regexp.is_compiled then
					a_regexp.optimize
					if not is_posix and (a_show_info or is_show_info) then
						print_pattern_info (a_regexp, an_output_file)
					end
						-- Loop througth the subjects.
					from
						text.wipe_out
						subject.wipe_out
						save_options (a_regexp)
						read_subject (an_input_file, a_regexp, text, subject)
					until
						not has_subject
					loop
						an_output_file.put_string (text)
						subject_count := subject_count + 1
						is_subject_anchored := a_regexp.is_anchored
						is_subject_empty_allowed := a_regexp.is_empty_allowed

						a_regexp.match (subject)
						count_matches := 0

						if is_do_lower_g or is_do_upper_g then
								-- We simulate repeated matches.
							from
								subject_start := 1
							until
								subject_start > subject.count or else
								(not a_regexp.has_matched and then a_regexp.is_empty_allowed)
							loop
								if a_regexp.has_matched then
									print_matches (a_regexp, an_output_file)
									count_matches := count_matches + 1
									if a_regexp.captured_start_position (0) <= a_regexp.captured_end_position (0) then
										a_regexp.set_empty_allowed (is_subject_empty_allowed)
										a_regexp.set_anchored (is_subject_anchored)
									else
										a_regexp.set_empty_allowed (False)
										a_regexp.set_anchored (True)
									end
									subject_start := a_regexp.captured_end_position (0) + 1
								elseif a_regexp.is_empty_allowed then
										-- Jump out of the loop.
									subject_start := subject.count + 1
								else
									subject_start := subject_start + 1
									a_regexp.set_empty_allowed (is_subject_empty_allowed)
									a_regexp.set_anchored (is_subject_anchored)
								end
								if subject_start > 1 and is_do_lower_g then
									a_regexp.next_match
								else
									a_regexp.match_substring (subject, subject_start, subject.count)
								end
							end
						end
						if a_regexp.has_matched then
							print_matches (a_regexp, an_output_file)
						elseif count_matches = 0 then
							if is_posix then
								an_output_file.put_line ("No match: POSIX code 17: match failed")
							else
								an_output_file.put_line ("No match")
							end
						end
						a_regexp.wipe_out
						text.wipe_out
						subject.wipe_out
						restore_options (a_regexp)
						read_subject (an_input_file, a_regexp, text, subject)
					end
					an_output_file.put_string (text)
				else
					print_error (a_regexp, an_output_file)
					text.wipe_out
					skip_after_blank_lines (an_input_file, text)
					an_output_file.put_string (text)
				end
			end
			an_output_file.put_new_line
		end

feature {NONE} -- Output

	print_matches (a_regexp: RX_PCRE_REGULAR_EXPRESSION; an_output_file: KI_TEXT_OUTPUT_STREAM)
			-- Print matched (sub-)expression(s) and extra information
			-- needed to fit a given output format. Note, that the restrictions
			-- suggested by this messages are not really limitations in the
			-- eiffel library
		require
			a_regexp_not_void: a_regexp /= Void
			an_output_file_not_void: an_output_file /= Void
			an_output_file_open_write: an_output_file.is_open_write
		local
			s: STRING
			i: INTEGER
		do
			if not is_posix and then a_regexp.match_count > maximum_subexpressions then
				an_output_file.put_line ("Matched, but too many substrings")
			end
			from
				i := 0
			until
				i >= a_regexp.match_count
			loop
				if i >= maximum_subexpressions then
						-- Jump out of the loop.
					i := a_regexp.match_count
				else
					if not is_posix or else a_regexp.captured_start_position (i) /= 0 then
						if i < 10 then
							an_output_file.put_character (' ')
						end
						an_output_file.put_integer (i)
						an_output_file.put_string (": ")
						if a_regexp.is_captured_substring_defined (i) then
							s := a_regexp.captured_substring (i)
							print_substring (s, 1, s.count, False, an_output_file)
							an_output_file.put_new_line
						else
							an_output_file.put_line ("<unset>")
						end
					end
					if is_show_rest then
						if i < 10 then
							an_output_file.put_character (' ')
						end
						an_output_file.put_integer (i)
						an_output_file.put_string ("+ ")
						print_substring (a_regexp.subject, a_regexp.captured_end_position (0) + 1, a_regexp.subject_end, False, an_output_file)
						an_output_file.put_new_line
					end
					i := i + 1
				end
			end
			from i := 0 until i >= 32 loop
				if copy_string_mask.item (i + 1) then
					if i < a_regexp.match_count then
						s := a_regexp.captured_substring (i)
						if s.count >= 16 then
							an_output_file.put_string ("copy substring ")
							an_output_file.put_integer (i)
							an_output_file.put_line (" failed -6")
						else
							if i < 10 then
								an_output_file.put_character (' ')
							end
							an_output_file.put_integer (i)
							an_output_file.put_string ("C ")
							print_substring (s, 1, s.count, True, an_output_file)
							an_output_file.put_string (" (")
							an_output_file.put_integer (s.count)
							an_output_file.put_character (')')
							an_output_file.put_new_line
						end
					else
						an_output_file.put_string ("copy substring ")
						an_output_file.put_integer (i)
						an_output_file.put_line (" failed -7")
					end
				end
				i := i + 1
			end
			from i := 0 until i >= 32 loop
				if get_string_mask.item (i + 1) then
					if i < a_regexp.match_count then
						s := a_regexp.captured_substring (i)
						if i < 10 then
							an_output_file.put_character (' ')
						end
						an_output_file.put_integer (i)
						an_output_file.put_string ("G ")
						print_substring (s, 1, s.count, True, an_output_file)
						an_output_file.put_string (" (")
						an_output_file.put_integer (s.count)
						an_output_file.put_character (')')
						an_output_file.put_new_line
					else
						an_output_file.put_string ("get substring ")
						an_output_file.put_integer (i)
						an_output_file.put_line (" failed -7")
					end
				end
				i := i + 1
			end
			if is_get_list then
				from
					i := 0
				until
					i >= a_regexp.match_count
				loop
					s := a_regexp.captured_substring (i)
					if i < 10 then
						an_output_file.put_character (' ')
					end
					an_output_file.put_integer (i)
					an_output_file.put_string ("L ")
					print_substring (s, 1, s.count, True, an_output_file)
					an_output_file.put_new_line
					i := i + 1
				end
			end
		end

	print_pattern_info (a_regexp: RX_PCRE_REGULAR_EXPRESSION; an_output_file: KI_TEXT_OUTPUT_STREAM)
			-- Print all wanted info from a given regular expression
			-- to the output character stream.
		require
			a_regexp_not_void: a_regexp /= Void
			an_output_file_not_void: an_output_file /= Void
			an_output_file_open_write: an_output_file.is_open_write
		do
			if is_debug then
				a_regexp.print_compiled_pattern_code (an_output_file, False)
			end
			if is_show_codespace then
					-- This is a dummy value by now.
				an_output_file.put_line ("Memory allocation (code space): 428")
			end
			a_regexp.print_compiled_pattern_info (an_output_file)
			if is_show_start_bits then
				a_regexp.print_start_bits (an_output_file)
			end
		end

	print_error (a_regexp: RX_PCRE_REGULAR_EXPRESSION; an_output_file: KI_TEXT_OUTPUT_STREAM)
			-- Print a readable error message, the native one or
			-- else a POSIX conformant one.
		require
			a_regexp_not_void: a_regexp /= Void
			an_output_file_not_void: an_output_file /= Void
			an_output_file_open_write: an_output_file.is_open_write
		do
			an_output_file.put_string ("Failed: ")
			if is_posix then
					-- Map internal regexp error code to the POSIX one.
				an_output_file.put_string ("POSIX code ")
				inspect a_regexp.error_code
				when 11, 23 then
						-- REG_ASSERT
					an_output_file.put_integer (1)
					an_output_file.put_string (": internal error")
				when 4, 5 then
						-- BADBR
					an_output_file.put_integer (2)
					an_output_file.put_string (": invalid repeat counts in {}")
				when 12, 24, 25, 26,27, 28, 29, 31, 33, 34, 35 then
						-- BADPAT
					an_output_file.put_integer (3)
					an_output_file.put_string (": pattern error")
				when 9, 10 then
						-- BADRPT
					an_output_file.put_integer (4)
					an_output_file.put_string (": ? * + invalid")
--				when then
						-- EBRACE
--					an_output_file.put_integer (5)
--					an_output_file.put_string (": unbalanced {}")
				when 6 then
						-- EBRACK
					an_output_file.put_integer (6)
					an_output_file.put_string (": unbalanced []")
--				when then
						-- ECOLLATE
--					an_output_file.put_integer (7)
--					an_output_file.put_string (": collation error - not relevant")
				when 7, 30 then
						-- ECTYPE
					an_output_file.put_integer (8)
					an_output_file.put_string (": bad class")
				when 1, 2, 3 then
						-- EESCAPE
					an_output_file.put_integer (9)
					an_output_file.put_string (": bad escape sequence")
--				when then
						-- EMPTY
--					an_output_file.put_integer (10)
--					an_output_file.put_string (": empty expression")
				when 14, 18, 22 then
						-- EPAREN
					an_output_file.put_integer (11)
					an_output_file.put_string (": unbalanced ()")
				when 8 then
						-- ERANGE
					an_output_file.put_integer (12)
					an_output_file.put_string (": bad range inside []")
				when 13, 19, 20 then
						-- ESIZE
					an_output_file.put_integer (13)
					an_output_file.put_string (": expression too big")
				when 21 then
						-- ESPACE
					an_output_file.put_integer (14)
					an_output_file.put_string (": failed to get memory")
				when 15 then
						-- ESUBREG
					an_output_file.put_integer (15)
					an_output_file.put_string (": bad back reference")
				when 16, 17, 32 then
						-- INVARG
					an_output_file.put_integer (16)
					an_output_file.put_string (": bad argument")
--				when then
						-- NOMATCH
--					an_output_file.put_integer (17)
--					an_output_file.put_string (": match failed")
				else
					an_output_file.put_integer (a_regexp.error_code)
				end
			else
				an_output_file.put_string (a_regexp.error_message)
			end
			an_output_file.put_string (" at offset ")
			an_output_file.put_integer (a_regexp.error_position - 1)
			if is_posix then
					-- Trailing blanks from POSIX messages.
				an_output_file.put_string ("     ")
			end
			an_output_file.put_new_line
		end

	print_substring (a_string: STRING; a_from, a_to: INTEGER; a_stop_at_binary_null: BOOLEAN; an_output_file: KI_TEXT_OUTPUT_STREAM)
			-- Print substring of `a_str' between positions `a_from'
			-- and `a_to' to `a_file'.
		require
			a_string_not_void: a_string /= Void
			a_from_large_enough: a_from >= 1
			a_to_small_enough: a_to <= a_string.count
			valid_bound: a_from <= a_to + 1
			an_output_file_not_void: an_output_file /= Void
			an_output_file_open_write: an_output_file.is_open_write
		local
			i: INTEGER
			s: STRING
		do
			from i := a_from until i > a_to loop
				if a_string.item (i) >= '%/32/' and a_string.item (i) <= '%/126/' then
					an_output_file.put_character (a_string.item (i))
				elseif a_stop_at_binary_null and then a_string.item (i) = '%/0/' then
						-- Jump out of the loop.
					i := a_to
				else
					s := INTEGER_.to_hexadecimal (a_string.item_code (i), False)
					if s.count = 1 then
						an_output_file.put_string ("\x0")
					else
						an_output_file.put_string ("\x")
					end
					an_output_file.put_string (s)
				end
				i := i + 1
			end
		end

feature {NONE} -- Input

	read_pattern (a_file: KI_TEXT_INPUT_STREAM; a_text, a_pattern: STRING)
			-- Read a pattern enclosed in the first character
			-- read. Read until behind the last delimiter.
		require
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
			a_text_not_void: a_text /= Void
			a_pattern_not_void: a_pattern /= Void
		local
			delimiter: CHARACTER
			last: CHARACTER
		do
			skip_non_printable (a_file, a_text)
				-- Most of the time the delimiter is '/'.
			delimiter := a_file.last_character
			a_text.append_character (delimiter)
			from
				a_file.read_character
			until
				a_file.end_of_input or else
				(last /= '\' and then a_file.last_character = delimiter)
			loop
				last := a_file.last_character
				a_text.append_character (last)
				a_pattern.append_character (last)
				a_file.read_character
			end
			if last = delimiter then
				a_file.read_character
			end
		end

	read_pattern_options (a_file: KI_TEXT_INPUT_STREAM; a_regexp: RX_PCRE_REGULAR_EXPRESSION; a_text, a_pattern: STRING)
			-- Read the optional options after the pattern.
			-- Read behind the eol.
		require
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
			a_regexp_not_void: a_regexp /= Void
			a_text_not_void: a_text /= Void
			a_pattern_not_void: a_pattern /= Void
		do
			from
				is_debug := False
				is_show_info := False
				is_show_start_bits := False
				is_do_lower_g := False
				is_do_upper_g := False
				is_show_rest := False
				is_posix := False
				is_show_codespace := False
				a_regexp.set_default_options
			until
				a_file.end_of_input or else
				a_file.last_character = '%N'
			loop
				a_text.append_character (a_file.last_character)
				inspect a_file.last_character
				when '\' then
					a_pattern.append_character ('\')
				when 'i' then
					a_regexp.set_caseless (True)
				when 'm' then
					a_regexp.set_multiline (True)
				when 's' then
					a_regexp.set_dotall (True)
				when 'x' then
					a_regexp.set_extended (True)
				when '+' then
					is_show_rest := True
				when 'A' then
					a_regexp.set_anchored (True)
				when 'D' then
					is_debug := True
					is_show_info := True
				when 'E' then
					a_regexp.set_dollar_endonly (True)
				when 'G' then
					is_do_upper_g := True
				when 'g' then
					is_do_lower_g := True
				when 'U' then
					a_regexp.set_greedy (False)
				when 'M' then
					is_show_codespace := True
				when 'S' then
					is_show_start_bits := True
				when 'X' then
					a_regexp.set_strict (True)
--				when 'L' then
					-- set locale.
				when 'P' then
					is_posix := True
				when 'I' then
					is_show_info := True
				else
				end
				a_file.read_character
			end
			if a_file.last_character = '%N' then
				a_text.append_character (a_file.last_character)
				a_file.read_character
			end
		end

	read_subject (a_file: KI_TEXT_INPUT_STREAM; a_regexp: RX_PCRE_REGULAR_EXPRESSION; a_text, a_subject: STRING)
			-- Read a subject string from the file.
			-- Read behind eol.
		require
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
			a_regexp_not_void: a_regexp /= Void
			a_text_not_void: a_text /= Void
			a_subject_not_void: a_subject /= Void
		local
			cnt, v: INTEGER
			c: CHARACTER
			not_empty: BOOLEAN
			stop: BOOLEAN
		do
			from
				has_subject := False
				maximum_subexpressions := Platform.Maximum_integer
				copy_string_mask.clear_all
				get_string_mask.clear_all
				is_get_list := False
				skip_spaces (a_file, a_text)
			until
				stop or else
				a_file.end_of_input or else
				a_file.last_character = '%N' or else
				a_file.last_character = '%R'
			loop
				c := a_file.last_character
				a_text.append_character (c)
				if c = '\' then
						-- Process escaped characters.
					not_empty := True
					a_file.read_character
					if not a_file.end_of_input then
						c := a_file.last_character
						a_text.append_character (c)
						a_file.read_character
						inspect c
						when 'a' then
							a_subject.append_character ('%/7/')
						when 'b' then
							a_subject.append_character ('%B')
						when 'e' then
							a_subject.append_character ('%/27/')
						when 'f' then
							a_subject.append_character ('%F')
						when 'n' then
							a_subject.append_character ('%N')
						when 'r' then
							a_subject.append_character ('%R')
						when 't' then
							a_subject.append_character ('%T')
						when 'v' then
							a_subject.append_character ('%/11/')
						when '0'..'7' then
								-- Read at least three octal digits.
							from
								v := c.code - Zero_code
								cnt := 1
							until
								cnt > 2 or else
								a_file.end_of_input or else
								not is_octal (a_file.last_character)
							loop
								a_text.append_character (a_file.last_character)
								v := v * 8 + a_file.last_character.code - Zero_code
								a_file.read_character
								cnt := cnt + 1
							end
							a_subject.append_character (INTEGER_.to_character (v \\ 256))
						when 'x' then
								-- Read at least two hexadecimal digits.
							from
								cnt := 0
								v := 0
							until
								cnt > 1 or else
								a_file.end_of_input or else
								not is_hex (a_file.last_character)
							loop
								a_text.append_character (a_file.last_character)
								inspect a_file.last_character
								when '0'..'9' then
									v := v * 16 + a_file.last_character.code - Zero_code
								when 'a'..'f' then
									v := v * 16 + a_file.last_character.code - Lower_a_code + 10
								when 'A'..'F' then
									v := v * 16 + a_file.last_character.code - Upper_a_code + 10
								end
								a_file.read_character
								cnt := cnt + 1
							end
							a_subject.append_character (INTEGER_.to_character (v \\ 256))
						when 'A' then
							a_regexp.set_anchored (True)
						when 'B' then
							a_regexp.set_bol (False)
						when 'C' then
							copy_string_mask.put (True, read_decimal_integer (a_file, a_text) + 1)
						when 'G' then
							get_string_mask.put (True, read_decimal_integer (a_file, a_text) + 1)
						when 'L' then
							is_get_list := True
						when 'N' then
							a_regexp.set_empty_allowed (False)
						when 'O' then
							maximum_subexpressions := read_decimal_integer(a_file, a_text)
							if not is_posix then
								maximum_subexpressions := maximum_subexpressions // 3
							end
						when 'Z' then
							a_regexp.set_eol (False)
						when '%N', '%R' then
							stop := True
						else
								-- Unknown escaped character 'as-is'.
							a_subject.append_character (c)
						end
					else
						stop := True
					end
				else
						-- Normal character.
					a_subject.append_character (c)
					a_file.read_character
				end
			end
				-- Remove all 'real' trailing spaces.
			from
				cnt := a_text.count
			until
				cnt = 0 or else
				not is_space (a_text.item (cnt)) or else
				a_subject.count = 0
			loop
				a_subject.remove (a_subject.count)
				cnt := cnt - 1
			end
			if not a_file.end_of_input and then a_file.last_character = '%R' then
				a_text.append_character ('%R')
				a_file.read_character
			end
			if not a_file.end_of_input and then a_file.last_character = '%N' then
				a_text.append_character ('%N')
				a_file.read_character
			end
			has_subject := stop or else not_empty or else a_subject.count > 0
		ensure
			not_has_subject: not has_subject implies a_subject.count = 0
		end

	read_decimal_integer (a_file: KI_TEXT_INPUT_STREAM; a_text: STRING): INTEGER
			-- Read a decimal integer from `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
			a_text_not_void: a_text /= Void
		do
			from
				Result := 0
			until
				a_file.end_of_input or else
				(a_file.last_character < '0' or a_file.last_character > '9')
			loop
				a_text.append_character (a_file.last_character)
				Result := Result * 10 + a_file.last_character.code - Zero_code
				a_file.read_character
			end
		end

	skip_spaces (a_file: KI_TEXT_INPUT_STREAM; a_text: STRING)
			-- Skip space characters in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
			a_text_not_void: a_text /= Void
		do
			from
			until
				a_file.end_of_input or else
				not is_space (a_file.last_character)
			loop
				a_text.append_character (a_file.last_character)
				a_file.read_character
			end
		end

	skip_non_printable (a_file: KI_TEXT_INPUT_STREAM; a_text: STRING)
			-- Skip non-printable characters in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
			a_text_not_void: a_text /= Void
		do
			from
			until
				a_file.end_of_input or else
				(a_file.last_character >= '%/33/' and a_file.last_character <= '%/255/')
			loop
				a_text.append_character (a_file.last_character)
				a_file.read_character
			end
		end

	skip_after_blank_lines (a_file: KI_TEXT_INPUT_STREAM; a_text: STRING)
			-- Skip to end of line and following blank lines in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
			a_text_not_void: a_text /= Void
		local
			count: INTEGER
			empty_found: BOOLEAN
		do
			from
				count := 0
			until
				a_file.end_of_input or else
				(count > 0 and then empty_found)
			loop
				a_text.append_character (a_file.last_character)
				inspect a_file.last_character
				when '%N' then
					if not empty_found then
						empty_found := count = 0
					end
					count := 0
					a_file.read_character
				when '%R', '%T', ' ' then
						-- Do not count spaces.
					a_file.read_character
				else
					count := count + 1
					if not empty_found then
						a_file.read_character
					else
						a_text.remove (a_text.count)
					end
				end
			end
		end

feature {NONE} -- Status report

	is_space (a_ch: CHARACTER): BOOLEAN
			-- Is `a_ch' a space character?
		do
			Result := a_ch = '%/9/' or else a_ch = ' '
		end

	is_octal (a_ch: CHARACTER): BOOLEAN
			-- Is `a_ch' an octal digit?
		do
			Result := a_ch >= '0' and then a_ch <= '7'
		end

	is_hex (a_ch: CHARACTER): BOOLEAN
			-- Is `a_ch' an hexadecimal digit?
		do
			inspect a_ch
			when '0'..'9','a'..'f','A'..'F' then
				Result := True
			else
				-- Result := False
			end
		end

	has_subject: BOOLEAN
			-- Sometimes a subject can be empty. To be able to distiguish
			-- from an non existing subject we need this flag

feature {NONE} -- Options set at runtime from the input file while reading pattern and/or subjects

	is_debug: BOOLEAN
			-- Show the generated code in a readable form

	is_show_info: BOOLEAN
			-- Show general info about the compiled regular expression

	is_show_rest: BOOLEAN
			-- Show the rest of unmatched subject

	is_show_start_bits: BOOLEAN
			-- Show the starting character set of a regular expression (if any)

	is_show_codespace: BOOLEAN
			-- Show the amount of memory used for the compiled code

	is_do_lower_g: BOOLEAN
			-- Simulate a repeated match over a given subject. The main difference with
			-- `is_do_upper_g' is visible in anchored expression which will not match
			-- on the next match circle

	is_do_upper_g: BOOLEAN
			-- Simulate a repeated match over a given subject. The main difference with
			-- `is_do_lower_g' is visible in anchored expression which may match
			-- on the next match circle too

	maximum_subexpressions: INTEGER
			-- Print out an error if the result of a match exeeds this limit of subexpressions

	is_posix: BOOLEAN
			-- Error messages POSIX conform (what ever this means)

	copy_string_mask: ARRAY [BOOLEAN]
			-- Show the related match subexpression (if any)

	get_string_mask: ARRAY [BOOLEAN]
			-- Show the related match subexpression (if any)

	is_get_list: BOOLEAN
			-- Show all matched subexpressions (if any)

feature {NONE} -- Save temporarily the options of a regular expression

	saved_is_multiline: BOOLEAN
	saved_is_dotall: BOOLEAN
	saved_is_empty_allowed: BOOLEAN
	saved_is_dollar_endonly: BOOLEAN
	saved_is_bol: BOOLEAN
	saved_is_eol: BOOLEAN
	saved_is_anchored: BOOLEAN

	save_options (a_regexp: RX_PCRE_REGULAR_EXPRESSION)
			-- Save temporarily the options of `a_regexp'.
		require
			need_regexp: a_regexp /= Void
		do
			saved_is_multiline := a_regexp.is_multiline
			saved_is_dotall := a_regexp.is_dotall
			saved_is_empty_allowed := a_regexp.is_empty_allowed
			saved_is_dollar_endonly := a_regexp.is_dollar_endonly
			saved_is_bol := a_regexp.is_bol
			saved_is_eol := a_regexp.is_eol
			saved_is_anchored := a_regexp.is_anchored
		end

	restore_options(a_regexp: RX_PCRE_REGULAR_EXPRESSION)
			-- Restore the options to `a_regexp'.
		require
			need_regexp: a_regexp /= Void
		do
			a_regexp.set_multiline (saved_is_multiline)
			a_regexp.set_dotall (saved_is_dotall)
			a_regexp.set_empty_allowed (saved_is_empty_allowed)
			a_regexp.set_dollar_endonly (saved_is_dollar_endonly)
			a_regexp.set_bol (saved_is_bol)
			a_regexp.set_eol (saved_is_eol)
			a_regexp.set_anchored (saved_is_anchored)
		end

feature {NONE} -- Filenames

	data_dirname: STRING
			-- Name of directory containing input files
		do
				-- Bug in ISE 5.6 for .NET: use a do-function rather than
				-- a once-function, otherwise ${GOBO} is not replaced by
				-- its value in `interpreted_string'.
			Result := file_system.nested_pathname ("${GOBO}", <<"library", "regexp", "test", "unit", "pcretest", "data">>)
			Result := Execution_environment.interpreted_string (Result)
		ensure
			data_dirname_not_void: Result /= Void
			data_dirname_not_empty: Result.count > 0
		end

	testinput1_filename: STRING
			-- Name of first test input file
		once
			Result := file_system.pathname (data_dirname, "testinput1")
		ensure
			testinput1_filename_not_void: Result /= Void
			testinput1_filename_not_empty: Result.count > 0
		end

	testinput2_filename: STRING
			-- Name of second test input file
		once
			Result := file_system.pathname (data_dirname, "testinput2")
		ensure
			testinput2_filename_not_void: Result /= Void
			testinput2_filename_not_empty: Result.count > 0
		end

	testinput3_filename: STRING
			-- Name of third test input file
		once
			Result := file_system.pathname (data_dirname, "testinput3")
		ensure
			testinput3_filename_not_void: Result /= Void
			testinput3_filename_not_empty: Result.count > 0
		end

	testinput4_filename: STRING
			-- Name of forth test input file
		once
			Result := file_system.pathname (data_dirname, "testinput4")
		ensure
			testinput4_filename_not_void: Result /= Void
			testinput4_filename_not_empty: Result.count > 0
		end

	testinput5_filename: STRING
			-- Name of fifth test input file
		once
			Result := file_system.pathname (data_dirname, "testinput5")
		ensure
			testinput5_filename_not_void: Result /= Void
			testinput5_filename_not_empty: Result.count > 0
		end

	testinput6_filename: STRING
			-- Name of sixth test input file
		once
			Result := file_system.pathname (data_dirname, "testinput6")
		ensure
			testinput6_filename_not_void: Result /= Void
			testinput6_filename_not_empty: Result.count > 0
		end

invariant

	error_handler_not_void: error_handler /= Void
	copy_string_mask_not_void: copy_string_mask /= Void
	copy_string_mask_lower: copy_string_mask.lower = 1
	copy_string_mask_upper: copy_string_mask.upper = 32
	get_string_mask_not_void: get_string_mask /= Void
	get_string_mask_lower: get_string_mask.lower = 1
	get_string_mask_upper: get_string_mask.upper = 32

end
