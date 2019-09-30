note

	description:

		"Scanner skeletons for parser generators such as 'geyacc'"

	library: "Gobo Eiffel Parse Library"
	copyright: "Copyright (c) 1999-2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class PR_YACC_SCANNER_SKELETON

inherit

	YY_COMPRESSED_SCANNER_SKELETON
		rename
			make as make_compressed_scanner_skeleton,
			reset as reset_compressed_scanner_skeleton
		end

	PR_YACC_TOKENS
		export {NONE} all end

	UT_CHARACTER_CODES
		export {NONE} all end

	KL_IMPORTED_STRING_ROUTINES

feature {NONE} -- Initialization

	make (handler: like error_handler)
			-- Create a new grammar description scanner.
		require
			handler_not_void: handler /= Void
		do
			make_with_buffer (Empty_buffer)
			last_string_value := ""
			last_string_32_value := {STRING_32} ""
			error_handler := handler
			create action_buffer.make (Init_buffer_size)
			successful := True
			line_nb := 1
			eiffel_verbatim_marker := eiffel_no_verbatim_marker
		ensure
			error_handler_set: error_handler = handler
		end

feature -- Initialization

	reset
			-- Reset scanner before scanning next input.
		do
			reset_compressed_scanner_skeleton
			last_string_value := ""
			last_string_32_value := {STRING_32} ""
			successful := True
			action_buffer.wipe_out
			nb_open_brackets := 0
			line_nb := 1
		end

feature -- Status report

	successful: BOOLEAN
			-- Has no fatal error been detected?

feature -- Access

	error_handler: UT_ERROR_HANDLER
			-- Error handler

	line_nb: INTEGER
			-- Current line number

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

	action_buffer: STRING_8
			-- Buffer for semanic action text

	nb_open_brackets: INTEGER
			-- Number of characters { not-yet-balanced
			-- in semantic actions

	last_error: INTEGER
			-- Index of last %error read

	rule: detachable PR_RULE
			-- Rule being parsed

	process_dollar_n (n: INTEGER; max: INTEGER; a_rule: PR_RULE)
			-- Process $`n' in semantic actions where at most
			-- `max' symbols on the right-hand-side can be accessed.
		require
			a_rule_not_void: a_rule /= Void
		local
			rhs: DS_ARRAYED_LIST [PR_SYMBOL]
			a_type: PR_TYPE
		do
			rhs := a_rule.rhs
			if n <= 0 or n > max then
				report_invalid_dollar_n_error (n)
			else
				a_type := rhs.item (n).type
				a_type.append_dollar_n_to_string (n, max, a_rule, action_buffer)
			end
		end

	process_dollar_dollar (a_rule: PR_RULE)
			-- Process $$ in semantic actions.
		require
			a_rule_not_void: a_rule /= Void
		local
			a_type: PR_TYPE
		do
			a_type := a_rule.lhs.type
			a_type.append_dollar_dollar_to_string (action_buffer)
		end

	cloned_string (a_string: STRING): STRING
			-- Cloned version of `a_string'
		require
			a_string /= Void
		do
			create Result.make (a_string.count)
			Result.append_string (a_string)
		ensure
			cloned_string_not_void: Result /= Void
			is_equal: Result.is_equal (a_string)
			not_same: Result /= a_string
		end

feature {NONE} -- Error handling

	report_missing_characters_error (chars: STRING)
			-- Report that `chars' is missing.
		require
			chars_not_void: chars /= Void
		local
			an_error: PR_MISSING_CHARACTERS_ERROR
		do
			create an_error.make (filename, line_nb, chars)
			error_handler.report_error (an_error)
			successful := False
		ensure
			not_successful: not successful
		end

	report_null_integer_error
			-- Report that the integer just read
			-- cannot be null.
		local
			an_error: PR_NULL_INTEGER_ERROR
		do
			create an_error.make (filename, line_nb)
			error_handler.report_error (an_error)
			successful := False
		ensure
			not_successful: not successful
		end

	report_invalid_dollar_n_error (n: INTEGER)
			-- Report that $`n' has been used in a semantic
			-- action but `n' is not a valid index for the
			-- rhs of the corresponding rule.
		local
			an_error: PR_INVALID_DOLLAR_N_ERROR
		do
			create an_error.make (filename, line_nb, n)
			error_handler.report_error (an_error)
			successful := False
		ensure
			not_successful: not successful
		end

	report_invalid_dollar_dollar_error
			-- Report that $$ has been used in an error action.
		local
			an_error: PR_INVALID_DOLLAR_DOLLAR_ERROR
		do
			create an_error.make (filename, line_nb)
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
			an_error: PR_INTEGER_TOO_LARGE_ERROR
		do
			create an_error.make (filename, line_nb, an_int)
			error_handler.report_error (an_error)
			successful := False
		ensure
			not_successful: not successful
		end

	report_invalid_string_token_error (a_string: STRING)
			-- Report that a literal string token must
			-- have at least two characters.
		require
			a_string_not_void: a_string /= Void
		local
			an_error: PR_INVALID_STRING_TOKEN_ERROR
		do
			create an_error.make (filename, line_nb, a_string)
			error_handler.report_error (an_error)
			successful := False
		ensure
			not_successful: not successful
		end

feature {NONE} -- Constants

	Init_buffer_size: INTEGER = 256
			-- Initial size for `action_buffer'

invariant

	error_handler_not_void: error_handler /= Void
	action_buffer_not_void: action_buffer /= Void
	eiffel_verbatim_marker_not_void: eiffel_verbatim_marker /= Void

end
