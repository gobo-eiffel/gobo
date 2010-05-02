note

	description:

		"Hash tables implemented with multi-arrays. %
		%Keys are hashed using `hash_code' from HASHABLE by default."

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 2001-2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class DS_MULTIARRAYED_HASH_TABLE [G, K -> HASHABLE]

inherit

	DS_MULTIARRAYED_SPARSE_TABLE [G, K]
		redefine
			new_cursor
		end

create

	make,
	make_equal,
	make_default,
	make_with_chunk_size,
	make_equal_with_chunk_size,
	make_map,
	make_map_equal,
	make_map_default,
	make_map_with_chunk_size,
	make_map_equal_with_chunk_size,
	make_with_equality_testers,
	make_with_chunk_size_and_equality_testers

feature -- Access

	new_cursor: DS_MULTIARRAYED_HASH_TABLE_CURSOR [G, K]
			-- New external cursor for traversal
		do
			create Result.make (Current)
		end

feature -- Hashing

	hash_function: KL_HASH_FUNCTION [K]
			-- Hash function to compute position in the container

	set_hash_function (a_hash_function: like hash_function)
			-- Set `hash_function' to `a_hash_function'.
		require
			empty: is_empty
		do
			hash_function := a_hash_function
		ensure
			hash_function_set: hash_function = a_hash_function
		end

feature {NONE} -- Implementation

	hash_position (k: K): INTEGER
			-- Hash position of `k' in `slots';
			-- Use `hash_function' as hashing function
			-- if not Void, `k.hash_code' otherwise.
		do
			if k /= Void then
				if hash_function /= Void then
					Result := hash_function.hash_code (k) \\ modulus
				else
					Result := k.hash_code \\ modulus
				end
			else
				Result := modulus
			end
		end

end
