indexing

	description:

		"Interface for text input files"

	library:    "Gobo Eiffel Kernel Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class KI_TEXT_INPUT_FILE

inherit

	KI_INPUT_FILE

	KI_TEXT_INPUT_STREAM
		undefine
			read_to_string
		end

end -- class KI_TEXT_INPUT_FILE
