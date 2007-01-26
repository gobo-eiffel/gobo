indexing
	description: "[
		Values that may be hashed into an integer index, 
		for use as keys in hash tables
		]"
	library: "Free implementation of ELKS library"
	copyright: "Copyright (c) 1986-2004, Eiffel Software and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class
	HASHABLE

feature -- Access

	hash_code: INTEGER is
			-- Hash code value
		deferred
		ensure
			good_hash_value: Result >= 0
		end

feature -- Status report

	is_hashable: BOOLEAN is
			-- May current object be hashed?
			-- (True if it is not its type's default.)
		do
			Result := (Current /= default)
		ensure
			ok_if_not_default: Result implies (Current /= default)
		end

end
