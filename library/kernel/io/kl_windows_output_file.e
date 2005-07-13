indexing

	description:

		"Windows-like text output files containing extended ASCII %
		%characters (8-bit code between 0 and 255)"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2001, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class KL_WINDOWS_OUTPUT_FILE

inherit

	KI_TEXT_OUTPUT_FILE
		undefine
				-- Needed for VE.
			copy
		end

	KL_BINARY_OUTPUT_FILE
		export
			{KL_BINARY_OUTPUT_FILE} all -- Needed for flat Degree 3 with ISE.
			-- {NONE} all
		end

create

	make

feature -- Access

	eol: STRING is "%R%N"
			-- Line separator

end
