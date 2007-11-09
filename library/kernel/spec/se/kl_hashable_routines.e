indexing

	description:

		"Routines that ought to be in class HASHABLE"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 1999, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class KL_HASHABLE_ROUTINES

feature -- Access

	hash_value (an_any: ANY): INTEGER is
			-- Hash code value
		require
			an_any_not_void: an_any /= Void











		do
			Result := an_any.generating_type.hash_code

		ensure
			hash_value_positive: Result >= 0
		end

end
