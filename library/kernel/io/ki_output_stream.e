indexing

	description:

		"Interface for output streams"

	library:    "Gobo Eiffel Kernel Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class KI_OUTPUT_STREAM [G]

feature -- Output

	put (v: G) is
			-- Write `v' to output stream.
		require
			is_writable: is_writable
		deferred
		end

feature -- Status report

	is_writable: BOOLEAN is
			-- Can items be written to output stream?
		deferred
		end

feature -- Access

	name: STRING is
			-- Name of output stream
		deferred
		ensure
			name_not_void: Result /= Void
			name_not_empty: Result.count > 0
		end

end -- class KI_OUTPUT_STREAM
