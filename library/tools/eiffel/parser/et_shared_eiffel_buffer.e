indexing

	description:

		"Shared Eiffel file input buffer"

	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_SHARED_EIFFEL_BUFFER

inherit

	KL_SHARED_STANDARD_FILES

feature -- Access

	Eiffel_buffer: YY_FILE_BUFFER is
			-- Eiffel file input buffer
		once
			!! Result.make (std.input)
		ensure
			eiffel_buffer_not_void: Result /= Void
		end

end -- class ET_SHARED_EIFFEL_BUFFER
