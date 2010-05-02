note

	description:

		"Routines that ought to be in class HASHABLE"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 1999-2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class KL_HASHABLE_ROUTINES

feature -- Access

	hash_value (an_any: ANY): INTEGER
			-- Hash code value
		require
			an_any_not_void: an_any /= Void
		local
			hashable: detachable HASHABLE
		do
			hashable ?= an_any
			if hashable /= Void then
				Result := hashable.hash_code
			else
				Result := an_any.generating_type.hash_code
			end
		ensure
			hash_value_not_negative: Result >= 0
		end

end
