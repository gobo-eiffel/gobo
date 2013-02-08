note
	description: "[
		Values that may be hashed into an integer index, 
		for use as keys in hash tables
		]"
	library: "Free implementation of ELKS library"
	copyright: "Copyright (c) 1986-2004, Eiffel Software and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date: 2008-12-29 20:36:38 +0100 (Mon, 29 Dec 2008) $"
	revision: "$Revision: 254 $"

deferred class
	HASHABLE

feature -- Access

	hash_code: INTEGER
			-- Hash code value
		deferred
		ensure
			good_hash_value: Result >= 0
		end

feature -- Status report

	is_hashable: BOOLEAN
			-- May current object be hashed?
			-- (True by default.)
		do
			Result := True
		end

end
