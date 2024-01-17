note

	description:

		"Topological sorters of hashable items"

	remark: "[
		Use the algorithm described by D. Knuth in 'The Art of
		Computer Programming', Vol.1 3rd ed. p.265. The detection
		of cycles is described in exercise 23 p.271 and p.548.
	]"
	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 2001, Eric Bezault and others"
	license: "MIT License"

class DS_HASH_TOPOLOGICAL_SORTER [G -> HASHABLE]

inherit

	DS_TOPOLOGICAL_SORTER [G]
		redefine
			make,
			has,
			index_of,
			put,
			force,
			wipe_out,
			set_equality_tester,
			remove
		end

create

	make,
	make_default

feature {NONE} -- Initialization

	make (nb: INTEGER)
			-- Create a new topological sorter.
			-- Set initial capacity to `nb'.
		do
			create items.make (nb)
			create indexes.make_map (nb)
			create counts.make (nb)
			create successors.make (nb)
		end

feature -- Access

	index_of (v: G): INTEGER
			-- Index of `v' in the list of items to be sorted;
			-- Return 'count + 1' if `v' is not in the list yet
		do
			indexes.search (v)
			if indexes.found then
				Result := indexes.found_item
			else
				Result := count + 1
			end
		end

feature -- Status report

	has (v: G): BOOLEAN
			-- Is `v' included in the list of items to be sorted?
		do
			Result := indexes.has (v)
		end

feature -- Setting

	set_equality_tester (a_tester: like equality_tester)
			-- Set `equality_tester' to `a_tester'.
			-- A void equality tester means that `='
			-- will be used as comparison criterion.
		do
			items.set_equality_tester (a_tester)
			indexes.set_key_equality_tester (a_tester)
		end

feature -- Element change

	put (v: G)
			-- Add `v' to the list of items to be sorted.
		do
			items.put_last (v)
			indexes.put_new (count, v)
			counts.put_last (0)
			successors.put_last (Void)
		end

	force (v: G)
			-- Add `v' to the list of items to be sorted.
			-- Resize the list of items if needed.
		local
			nb: INTEGER
		do
			if count >= capacity then
				nb := count + 10
				items.resize (nb)
				indexes.resize (nb)
				counts.resize (nb)
				successors.resize (nb)
			end
			put (v)
		end

feature -- Removal

	remove (v: G)
			-- Remove `v' to the list of items to be sorted.
			-- Keep the order relation for the sorting though.
		local
			k, j: INTEGER
			a_cursor: DS_HASH_TABLE_CURSOR [INTEGER, G]
		do
			precursor (v)
			k := indexes.item (v)
			indexes.remove (v)
			a_cursor := indexes.new_cursor
			from
				a_cursor.start
			until
				a_cursor.after
			loop
				j := a_cursor.item
				if j > k then
					a_cursor.replace (j - 1)
				end
				a_cursor.forth
			end
		end

	wipe_out
			-- Wipe out items.
		do
			reset
			items.wipe_out
			indexes.wipe_out
			counts.wipe_out
			successors.wipe_out
		end

feature {NONE} -- Implementation

	indexes: DS_HASH_TABLE [INTEGER, G]
			-- Indexes of items to be sorted

invariant

	indexes_not_void: indexes /= Void
	indexes_count: indexes.count = items.count
	indexes_capacity: indexes.capacity = items.capacity

end
