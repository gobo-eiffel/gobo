indexing

	description:

		"Windows-like text output files"

	library:    "Gobo Eiffel Kernel Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class KL_WINDOWS_OUTPUT_FILE

inherit

	KI_OUTPUT_FILE

	KL_BINARY_OUTPUT_FILE
		export {NONE} all end

creation

	make

feature -- Access

	eol: STRING is "%R%N"
			-- Line separator

end -- class KL_WINDOWS_OUTPUT_FILE
