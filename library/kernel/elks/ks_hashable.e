indexing

	description:

		"Portable interface for class HASHABLE"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2001, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class KS_HASHABLE

inherit

	ANY -- Needed for SE 2.1b1

feature -- Access

	hash_code: INTEGER is
			-- Hash code value
			-- (ELKS 95 HASHABLE)
		deferred
		ensure
			good_hash_value: Result >= 0
		end

end
