indexing

	description:

		"Hash table searchers"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class DS_HASH_TABLE_SEARCHER [G, K -> HASHABLE]

inherit

	DS_BILINEAR_SEARCHER [G]
		redefine
			container, cursor
		end

feature -- Search

	hash_position (a_container: like container; k: K): INTEGER is
			-- Position in `a_container' where key is equal to `k'
			-- or first possible insertion position otherwise
		require
			container_not_void: a_container /= Void
			valid_key: a_container.valid_key (k)
		local
			dead_found, stop: BOOLEAN
			i, nb, index: INTEGER
			dead_cell, current_cell: DS_PAIR [G, K]
			storage: ARRAY [DS_PAIR [G, K]]
		do
			Result := a_container.position
			storage := a_container.storage
			current_cell := storage.item (Result)
			if
				not a_container.valid_cell (current_cell) or else
				not k.is_equal (current_cell.second)
			then
				from
					i := 1
					nb := a_container.capacity + 1
					index := k.hash_code \\ nb
					dead_cell := a_container.dead_cell
				until
					stop or i > nb
				loop
					current_cell := storage.item (index)
					if current_cell = Void then
						if not dead_found then
							Result := index
						end
						stop := True
					elseif current_cell = dead_cell then
						if not dead_found then
							Result := index
							dead_found := True
						end
						index := (index + 1) \\ nb
						i := i + 1
					elseif k.is_equal (current_cell.second) then
						Result := index
						stop := True
					else
						index := (index + 1) \\ nb
						i := i + 1
					end
				end
			end
		end

feature {NONE} -- Anchor types

	container: DS_HASH_TABLE [G, K] is do end
	cursor: DS_HASH_TABLE_CURSOR [G, K] is do end
			-- Anchor types

end -- class DS_HASH_TABLE_SEARCHER
