indexing

	description:

		"Portable interface for class HASHABLE"

	library:    "Gobo Eiffel Kernel Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class KS_HASHABLE

feature -- Access

	hash_code: INTEGER is
			-- Hash code value
			-- (ELKS 95 HASHABLE)
		deferred
		ensure
			good_hash_value: Result >= 0
		end

end -- class KS_HASHABLE
