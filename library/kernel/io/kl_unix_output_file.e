indexing

	description:

		"Unix-like text output files"

	library:    "Gobo Eiffel Kernel Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class KL_UNIX_OUTPUT_FILE

inherit

	KI_TEXT_OUTPUT_FILE
		undefine
				-- Needed for VE.
			copy
		end

	KL_BINARY_OUTPUT_FILE
		export {NONE} all end

creation

	make

feature -- Access

	eol: STRING is "%N"
			-- Line separator

end -- class KL_UNIX_OUTPUT_FILE
