indexing

	description:

		"Output facility switchable between in-memory string and standard output"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_OUTPUT

feature -- Output

	set_output_to_string is
			-- Set output to new string.
		do
			-- UC_STRING because of concatenation
			!UC_STRING! last_output.make (0)
		ensure
			last_output: last_output /= Void
			last_output_empty: last_output.count = 0
		end

	set_output_standard is
			-- Set output to standard output (Default).
		do
			last_output := Void
		end

	set_output_string (a: like last_output) is
			-- Set output to given string.
		require
			not_void: a /= Void
		do
			last_output := a
		ensure
			definition: last_output = a
		end

	last_output: UC_STRING
			-- Last output.
			-- may be void if standard output used.

feature -- Output, interface to descendants

	output (s: UC_STRING) is
			-- Output string.
			-- All output from descendants should go through this for 
			-- convenient redefinition.
		require
			not_void: s /= Void
		do
			if last_output /= Void then	
				last_output.append_uc_string (s)
			else
				io.put_string (s.to_utf8)
			end
		end

end
