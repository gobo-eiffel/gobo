note

	description:

		"Hash-code functions"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class KL_HASH_FUNCTION [G]

feature -- Access

	hash_code (v: G): INTEGER
			-- Hash code for `v'
		require
			v_not_void: v /= Void
		deferred
		ensure
			hash_code_not_negative: Result >= 0
		end

end
