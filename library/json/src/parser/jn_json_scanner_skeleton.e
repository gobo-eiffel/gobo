note

	description:

		"Scanner skeletons for JSON parsers"

	library: "Gobo Eiffel JSON Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

deferred class JN_JSON_SCANNER_SKELETON

inherit

	YY_COMPRESSED_SCANNER_SKELETON
		rename
			make as make_compressed_scanner_skeleton
		redefine
			text,
			utf8_text,
			text_substring,
			utf8_text_substring,
			fatal_error,
			report_invalid_unicode_character_error
		end

	JN_JSON_TOKENS
		export {NONE} all end
		
	KL_IMPORTED_STRING_ROUTINES
	KL_SHARED_STRING_EQUALITY_TESTER

feature {NONE} -- Initialization

	make
			-- Create a new JSON scanner.
		local
			l_handler: like error_handler
		do
			create l_handler.make_standard
			make_with_error_handler (l_handler)
		end

	make_with_error_handler (a_handler: like error_handler)
			-- Create a new JSON scanner.
		require
			a_handler_not_void: a_handler /= Void
		do
			error_handler := a_handler
			make_with_buffer (Empty_buffer)
		ensure
			error_handler_set: error_handler = a_handler
		end

feature -- Error handling

	error_handler: JN_ERROR_HANDLER
			-- Error handler

	set_error_handler (a_handler: like error_handler)
			-- Set `error_handler` to `a_handler`.
		require
			a_handler_not_void: a_handler /= Void
		do
			error_handler := a_handler
		ensure
			error_handler_set: error_handler = a_handler
		end

	has_error: BOOLEAN
			-- Has an error been found?

	fatal_error (a_message: STRING_8)
			-- A fatal error occurred.
			-- Print error message.
		do
			report_syntax_error (line, column)
		end

	report_invalid_unicode_character_error (a_code: NATURAL_32)
			-- Report that the surrogate or invalid Unicode character
			-- with code `a_code' has been read from the input
			-- buffer and caused the scanner to fail.
		do
			report_syntax_error (line, column)
		end

	report_syntax_error (a_line, a_column: INTEGER)
			-- Report a syntax error at position (`a_line`, `a_column`).
		do
			has_error := True
			error_handler.report_error_message ("syntax error, line " + a_line.out + ", column: " + a_column.out)
		end

feature -- Tokens

	text: STRING
			-- Text of last token read
			-- (Share strings when already scanned.)
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
				create Result.make (a_string.count)
				Result.append_string (a_string)
				strings.force_new (Result)
			end
		end

	utf8_text: STRING_8
			-- UTF-8 representation of last token read
			-- (Share strings when already scanned.)
		local
			a_string: STRING
		do
			a_string := string_buffer
			STRING_.wipe_out (a_string)
			append_utf8_text_to_string (a_string)
			strings.search (a_string)
			if strings.found then
				Result := strings.found_item
			else
				create Result.make (a_string.count)
				Result.append_string (a_string)
				strings.force_new (Result)
			end
		end

	text_substring (s, e: INTEGER): STRING
			-- Substring of last token read
			-- (Share strings when already scanned.)
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
				create Result.make (a_string.count)
				Result.append_string (a_string)
				strings.force_new (Result)
			end
		end

	utf8_text_substring (s, e: INTEGER): STRING_8
			-- UTF-8 representation of substring of last token read
		local
			a_string: STRING
		do
			a_string := string_buffer
			STRING_.wipe_out (a_string)
			append_utf8_text_substring_to_string (s, e, a_string)
			strings.search (a_string)
			if strings.found then
				Result := strings.found_item
			else
				create Result.make (a_string.count)
				Result.append_string (a_string)
				strings.force_new (Result)
			end
		end

feature {NONE} -- String handler

	strings: DS_HASH_SET [STRING_8]
			-- Strings known by the current scanner
		once
			create Result.make (1000)
			Result.set_equality_tester (string_equality_tester)
		ensure
			strings_not_void: Result /= Void
			no_void_string: not Result.has_void
		end

	string_buffer: STRING_8
			-- String buffer
		once
			create Result.make (300)
		ensure
			string_buffer_not_void: Result /= Void
			string_buffer_is_string_8: Result.same_type ({STRING_8} "")
		end

invariant

	error_handler_not_void: error_handler /= Void

end
