indexing

	description:

		"Output facility switchable between in-memory string and standard output"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_OUTPUT

inherit

	ANY
	
	KL_SHARED_STANDARD_FILES
		export {NONE} all end
		
	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

feature -- Output

	set_output_to_string is
			-- Set output to new string.
		do
			last_output := STRING_.make_empty
		ensure
			last_output_not_void: last_output /= Void
			last_output_empty: last_output.count = 0
		end

	set_output_standard is
			-- Set output to standard output (Default).
		do
			last_output := Void
		end

	set_output_string (a_string: like last_output) is
			-- Set output to given string.
		require
			a_string_not_void: a_string /= Void
		do
			last_output := a_string
		ensure
			definition: last_output = a_string
		end

	last_output: STRING
			-- Last output;
			-- May be void if standard output used.

feature -- Output, interface to descendants

	output (a_string: STRING) is
			-- Output string.
			-- All output from descendants should go through this for
			-- convenient redefinition.
		require
			a_string_not_void: a_string /= Void
		do
			if last_output /= Void then
				last_output := STRING_.appended_string (last_output, a_string)
			else
				std.output.put_string (a_string)
			end
		end

end
