note

	description:

		"Sets implemented with multi-arrays. Items are hashed %
		%using `hash_code' from HASHABLE by default."

	storable_version: "20130823"
	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 1999-2013, Eric Bezault and others"
	license: "MIT License"

class DS_MULTIARRAYED_HASH_SET [G -> HASHABLE]

inherit

	DS_MULTIARRAYED_SPARSE_SET [G]
		redefine
			new_cursor
		end

create

	make,
	make_equal,
	make_default,
	make_with_chunk_size,
	make_equal_with_chunk_size

feature -- Access

	new_cursor: DS_MULTIARRAYED_HASH_SET_CURSOR [G]
			-- New external cursor for traversal
		do
			create Result.make (Current)
		end

feature -- Hashing

	hash_function: detachable KL_HASH_FUNCTION [G]
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

	hash_position (v: G): INTEGER
			-- Hash position of `v' in `slots';
			-- Use `hash_function' as hashing function
			-- if not Void, `v.hash_code' otherwise.
		do
			if v /= Void then
				if attached hash_function as l_hash_function then
					Result := l_hash_function.hash_code (v) \\ modulus
				else
					Result := v.hash_code \\ modulus
				end
			else
				Result := modulus
			end
		end

end
