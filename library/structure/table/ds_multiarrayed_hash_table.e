indexing

	description:

		"Hash tables implemented with multi-arrays. %
		%Keys are hashed using `hash_code' from HASHABLE."

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 2001, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class DS_MULTIARRAYED_HASH_TABLE [G, K -> HASHABLE]

inherit

	DS_MULTIARRAYED_SPARSE_TABLE [G, K]
		redefine
			new_cursor
		end

create

	make, make_equal, make_default,
	make_with_chunk_size, make_equal_with_chunk_size,
	make_map, make_map_equal, make_map_default,
	make_map_with_chunk_size, make_map_equal_with_chunk_size,
	make_with_equality_testers, make_with_chunk_size_and_equality_testers

feature -- Access

	new_cursor: DS_MULTIARRAYED_HASH_TABLE_CURSOR [G, K] is
			-- New external cursor for traversal
		do
			create Result.make (Current)
		end

feature {NONE} -- Implementation

	hash_position (k: K): INTEGER is
			-- Hash position of `k' in `slots';
			-- Use `k.hash_code' as hashing function.
		do
			if k /= Void then
				Result := k.hash_code \\ modulus
			else
				Result := modulus
			end
		end

end
