indexing

	description:

		"Interface for output files"

	library:    "Gobo Eiffel Kernel Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class KI_OUTPUT_FILE

inherit

	KI_FILE
		rename
			open as open_write,
			is_open as is_open_write
		end

	KI_CHARACTER_OUTPUT_STREAM

end -- class KI_OUTPUT_FILE
