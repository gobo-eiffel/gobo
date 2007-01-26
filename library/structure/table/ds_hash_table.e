indexing

	description:

		"Hash tables, implemented with single arrays. %
		%Keys are hashed using `hash_code' from HASHABLE."

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 2000-2001, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class DS_HASH_TABLE [G, K -> HASHABLE]

inherit

	DS_ARRAYED_SPARSE_TABLE [G, K]
		redefine
			new_cursor
		end

create

	make, make_equal, make_default,
	make_map, make_map_equal, make_map_default,
	make_with_equality_testers

feature -- Access

	new_cursor: DS_HASH_TABLE_CURSOR [G, K] is
			-- New external cursor for traversal
		do
			create Result.make (Current)
		end

feature {NONE} -- Implementation

	hash_position (k: K): INTEGER is
			-- Hash position of `k' in `slots'
			-- Use `k.hash_code' as hashing function.
		do
			if k /= Void then
				Result := k.hash_code \\ modulus
			else
				Result := modulus
			end
		end

end
