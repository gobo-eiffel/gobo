indexing

	description:

		"Sets implemented with arrays. Items are hashed using %
		%`hash_code' from HASHABLE."

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class DS_HASH_SET [G -> HASHABLE]

inherit

	DS_SPARSE_SET [G]

creation

	make, make_equal

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
			dead_found, stop: BOOLEAN
			i, nb, index: INTEGER
			current_cell: DS_CELL [G]
			a_tester: like equality_tester
		do
			if v = Void then
				position := slots
			elseif equality_tester /= Void then
				a_tester := equality_tester
				current_cell := storage.item (position)
				if
					position = slots or else
					not valid_cell (current_cell) or else
					not a_tester.test (v, current_cell.item)
				then
					from
						i := 1
						nb := slots
						index := hash_code (v) \\ nb
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
						elseif a_tester.test (v, current_cell.item) then
							position := index
							stop := True
						else
							index := (index + 1) \\ nb
							i := i + 1
						end
					end
				end
			else
				current_cell := storage.item (position)
				if
					position = slots or else
					not valid_cell (current_cell) or else
					v /= current_cell.item
				then
					from
						i := 1
						nb := slots
						index := hash_code (v) \\ nb
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
						elseif v = current_cell.item then
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

	hash_code (v: G): INTEGER is
			-- Hash code of item `v'
		require
			v_not_void: v /= Void
		do
			Result := v.hash_code
		ensure
			hash_code_positive: Result >= 0
		end

end -- class DS_HASH_SET
