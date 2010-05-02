note

	description:

		"Scanner skeletons for parser generators such as 'geyacc'"

	library: "Gobo Eiffel Parse Library"
	copyright: "Copyright (c) 1999, Eric Bezault and others"
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
			error_handler := handler
			create action_buffer.make (Init_buffer_size)
			successful := True
			line_nb := 1
		ensure
			error_handler_set: error_handler = handler
		end

feature -- Initialization

	reset
			-- Reset scanner before scanning next input.
		do
			reset_compressed_scanner_skeleton
			successful := True
			action_buffer.wipe_out
			nb_open_brackets := 0
			line_nb := 1
		end

feature -- Status report

	successful: BOOLEAN
			-- Has no fatal error been detected?

	old_typing: BOOLEAN
			-- Does the generated parser use the old typing mechanism?

feature -- Access

	error_handler: UT_ERROR_HANDLER
			-- Error handler

	line_nb: INTEGER
			-- Current line number

	filename: STRING
			-- Name of file being parsed
		local
			file_buffer: YY_FILE_BUFFER
		do
			file_buffer ?= input_buffer
			if file_buffer /= Void then
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

	set_old_typing (b: BOOLEAN)
			-- Set `old_typing' to `b'.
		do
			old_typing := b
		ensure
			old_typing_set: old_typing = b
		end

feature {NONE} -- Implementation

	action_buffer: STRING
			-- Buffer for semanic action text

	nb_open_brackets: INTEGER
			-- Number of characters { not-yet-balanced
			-- in semantic actions

	last_error: INTEGER
			-- Index of last %error read

	rule: PR_RULE
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
			if n <= 0 then
				if old_typing then
					report_dangerous_dollar_n_warning (n)
				else
					report_invalid_dollar_n_error (n)
				end
			elseif n > max then
				report_invalid_dollar_n_error (n)
			else
				a_type := rhs.item (n).type
				if old_typing then
					a_type.old_append_dollar_n_to_string (n, max, a_rule, action_buffer)
				else
					a_type.append_dollar_n_to_string (n, max, a_rule, action_buffer)
				end
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
			if old_typing then
				a_type.old_append_dollar_dollar_to_string (action_buffer)
			else
				a_type.append_dollar_dollar_to_string (action_buffer)
			end
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

	report_dangerous_dollar_n_warning (n: INTEGER)
			-- Report that $`n' has been used in a semantic
			-- action but `n' is not a valid index for the
			-- rhs of the corresponding rule and therefore
			-- its use is dangerous.
		local
			an_error: PR_DANGEROUS_DOLLAR_N_ERROR
		do
			create an_error.make (filename, line_nb, n)
			error_handler.report_warning (an_error)
		end

feature {NONE} -- Constants

	Init_buffer_size: INTEGER = 256
			-- Initial size for `action_buffer'

invariant

	error_handler_not_void: error_handler /= Void
	action_buffer_not_void: action_buffer /= Void

end
