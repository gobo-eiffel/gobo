indexing

	description:

		"Shared Eiffel file input buffer"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_SHARED_EIFFEL_BUFFER

inherit

	KL_SHARED_STANDARD_FILES

feature -- Access

	Eiffel_buffer: YY_FILE_BUFFER is
			-- Eiffel file input buffer
		once
			create Result.make (std.input)
		ensure
			eiffel_buffer_not_void: Result /= Void
		end

end
