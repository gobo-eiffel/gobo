indexing

	description:

		"Boolean formatters"

	library: "Gobo Eiffel Utility Library"
	copyright: "Copyright (c) 1999, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class UT_BOOLEAN_FORMATTER

inherit

	KL_IMPORTED_STRING_ROUTINES

feature -- Access

	eiffel_boolean_out (b: BOOLEAN): STRING is
			-- Formatted version of `b';
			-- Return a new string at each call.
			-- Regexp: true|false
		do
			Result := STRING_.make (5)
			append_eiffel_boolean (Result, b)
		ensure
			eiffel_boolean_out_not_void: Result /= Void
		end

feature -- String handling

	append_eiffel_boolean (a_string: STRING; b: BOOLEAN) is
			-- Append formatted version of `b' to `a_string'.
		require
			a_string_not_void: a_string /= Void
		do
			if b then
				a_string.append_string (True_string)
			else
				a_string.append_string (False_string)
			end
		end

feature -- File handling

	put_eiffel_boolean (a_file: KI_CHARACTER_OUTPUT_STREAM; b: BOOLEAN) is
			-- Write formatted version of `b' to `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_is_open_write: a_file.is_open_write
		do
			if b then
				a_file.put_string (True_string)
			else
				a_file.put_string (False_string)
			end
		end

feature {NONE} -- Constants

	True_string: STRING is "true"
	False_string: STRING is "false"

end
