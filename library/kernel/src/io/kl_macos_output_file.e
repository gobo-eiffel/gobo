note

	description:

		"MacOS-like text output files containing extended ASCII %
		%characters (8-bit code between 0 and 255)"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2001, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class KL_MACOS_OUTPUT_FILE

inherit

	KI_TEXT_OUTPUT_FILE

	KL_BINARY_OUTPUT_FILE
		export
				-- Needed for flat Degree 3 with ISE.
			{KL_BINARY_OUTPUT_FILE} all
--			{NONE} all
		end

create

	make

feature -- Access

	eol: STRING = "%R"
			-- Line separator

end
