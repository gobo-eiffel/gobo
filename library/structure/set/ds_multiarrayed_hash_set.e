indexing

	description:

		"Sets implemented with multi-arrays. Items are hashed %
		%using `hash_code' from HASHABLE."

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 1999-2001, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class DS_MULTIARRAYED_HASH_SET [G -> HASHABLE]

inherit

	DS_MULTIARRAYED_SPARSE_SET [G]
		redefine
			new_cursor
		end

create

	make, make_equal, make_default,
	make_with_chunk_size,
	make_equal_with_chunk_size

feature -- Access

	new_cursor: DS_MULTIARRAYED_HASH_SET_CURSOR [G] is
			-- New external cursor for traversal
		do
			create Result.make (Current)
		end

feature {NONE} -- Implementation

	hash_position (v: G): INTEGER is
			-- Hash position of `v' in `slots';
			-- Use `v.hash_code' as hashing function.
		do
			if v /= Void then
				Result := v.hash_code \\ modulus
			else
				Result := modulus
			end
		end

end
