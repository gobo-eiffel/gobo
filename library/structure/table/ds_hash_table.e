indexing

	description:

		"Hash tables, implemented with arrays. Keys are hashed using %
		%`hash_code' from HASHABLE and are compared using `is_equal'"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2000, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class DS_HASH_TABLE [G, K -> HASHABLE]

inherit

	DS_SPARSE_TABLE [G, K]
		redefine
			new_cursor
		end

creation

	make, make_equal

feature -- Access

	new_cursor: DS_HASH_TABLE_CURSOR [G, K] is
			-- New external cursor for traversal
		do
			!! Result.make (Current)
		end

feature {NONE} -- Implementation

	search_position (k: K) is
			-- Search for position where key is equal to `k'.
			-- Use `k.hash_code' as hashing function and
			-- compare keys using `is_equal'.
		local
			i: INTEGER
			prev: INTEGER
		do
			if k = Void then
				position := slots.item (modulus)
				slots_position := modulus
				clashes_previous_position := No_position
			elseif
				position = No_position or else
				not equal (k, keys.item (position))
			then
				from
					slots_position := hash_position (k)
					i := slots.item (slots_position)
					position := No_position
					prev := No_position
				until
					i = No_position
				loop
					if k.is_equal (keys.item (i)) then
						position := i
						i := No_position -- Jump out of the loop.
					else
						prev := i
						i := clashes.item (i)
					end
				end
				clashes_previous_position := prev
			end
		end

	hash_position (k: K): INTEGER is
			-- Hash position of `k' in `slots'
		do
			if k /= Void then
				Result := k.hash_code \\ modulus
			else
				Result := modulus
			end
		end

end -- class DS_HASH_TABLE
