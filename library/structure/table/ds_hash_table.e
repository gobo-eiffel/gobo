indexing

	description:

		"Hash tables, implemented with arrays. Keys are hashed using %
		%`hash_code' from HASHABLE and are compared using `is_equal'"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class DS_HASH_TABLE [G, K -> HASHABLE]

inherit

	DS_SPARSE_TABLE [G, K]

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
			-- Search for position where key is equal to `k'
			-- or to possible insertion position otherwise.
			-- Use `k.hash_code' as hashing function and
			-- compare keys using `is_equal'.
		local
			dead_found, stop: BOOLEAN
			i, nb, index: INTEGER
			current_cell: DS_PAIR [G, K]
		do
			if k = Void then
				position := slots
			else
				current_cell := storage.item (position)
				if
					position = slots or else
					not valid_cell (current_cell) or else
					not k.is_equal (current_cell.second)
				then
					from
						i := 1
						nb := slots
						index := hash_code (k) \\ nb
					until
						stop or i > nb
					loop
						current_cell := storage.item (index)
						if current_cell = Void then
							if not dead_found then
								position := index
							end
							stop := True
						elseif current_cell = dead_cell then
							if not dead_found then
								position := index
								dead_found := True
							end
							index := (index + 1) \\ nb
							i := i + 1
						elseif k.is_equal (current_cell.second) then
							position := index
							stop := True
						else
							index := (index + 1) \\ nb
							i := i + 1
						end
					end
				end
			end
		end

	hash_code (k: K): INTEGER is
			-- Hash code of key `k'
		require
			valid_key: valid_key (k)
		do
			Result := k.hash_code
		ensure
			hash_code_positive: Result >= 0
		end

end -- class DS_HASH_TABLE
