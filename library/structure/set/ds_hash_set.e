indexing

	description:

		"Sets implemented with arrays. Items are hashed using %
		%`hash_code' from HASHABLE."

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999-2000, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class DS_HASH_SET [G -> HASHABLE]

inherit

	DS_SPARSE_SET [G]
		redefine
			new_cursor
		end

creation

	make, make_equal, make_default

feature -- Access

	new_cursor: DS_HASH_SET_CURSOR [G] is
			-- New external cursor for traversal
		do
			!! Result.make (Current)
		end

feature {NONE} -- Implementation

	search_position (v: G) is
			-- Search for position where item is equal to `v'
			-- or to possible insertion position otherwise.
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
			-- Use `v.hash_code' as hashing function.
		local
			i: INTEGER
			prev: INTEGER
			a_tester: like equality_tester
		do
			if v = Void then
				position := slots.item (modulus)
				slots_position := modulus
				clashes_previous_position := No_position
			else
				a_tester := equality_tester
				if a_tester /= Void then
					if
						position = No_position or else
						not a_tester.test (v, items.item (position))
					then
						from
							slots_position := hash_position (v)
							i := slots.item (slots_position)
							position := No_position
							prev := No_position
						until
							i = No_position
						loop
							if a_tester.test (v, items.item (i)) then
								position := i
								i := No_position -- Jump out of the loop.
							else
								prev := i
								i := clashes.item (i)
							end
						end
						clashes_previous_position := prev
					end
				else
					if
						position = No_position or else
						v /= items.item (position)
					then
						from
							slots_position := hash_position (v)
							i := slots.item (slots_position)
							position := No_position
							prev := No_position
						until
							i = No_position
						loop
							if v = items.item (i) then
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
			end
		end

	hash_position (v: G): INTEGER is
			-- Hash position of `v' in `slots'
		do
			if v /= Void then
				Result := v.hash_code \\ modulus
			else
				Result := modulus
			end
		end

end -- class DS_HASH_SET
