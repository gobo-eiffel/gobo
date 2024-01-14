note

	description:

		"Hash-code functions for HASHABLE objects, using their `hash_code' feature"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2007, Eric Bezault and others"
	license: "MIT License"

class KL_HASHABLE_HASH_FUNCTION [G -> HASHABLE]

inherit

	KL_HASH_FUNCTION [G]

feature -- Access

	hash_code (v: G): INTEGER
			-- Hash code for `v'
		do
			Result := v.hash_code
		end

end
