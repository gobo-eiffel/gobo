indexing

	description:

		"Topological sorters of hashable items"

	note:

		"Use the algorithm described by D. Knuth in 'The Art of %
		%Computer Programming', Vol.1 3rd ed. p.265. The detection %
		%of cycles is described in exercise 23 p.271 and p.548."

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 2001, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class DS_HASH_TOPOLOGICAL_SORTER [G -> HASHABLE]

inherit

	DS_TOPOLOGICAL_SORTER [G]
		redefine
			make, has, index_of,
			put, force, wipe_out
		end

creation

	make, make_default

feature {NONE} -- Initialization

	make (nb: INTEGER) is
			-- Create a new topological sorter.
			-- Set initial capacity to `nb'.
		do
			!! items.make (nb)
			!! indexes.make_map (nb)
			!! counts.make (nb)
			!! successors.make (nb)
		end

feature -- Access

	index_of (v: G): INTEGER is
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

	has (v: G): BOOLEAN is
			-- Is `v' included in the list of items to be sorted?
		do
			Result := indexes.has (v)
		end

feature -- Element change

	put (v: G) is
			-- Add `v' to the list of items to be sorted.
		do
			items.put_last (v)
			indexes.put (count, v)
			counts.put_last (0)
			successors.put_last (Void)
		end

	force (v: G) is
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

	wipe_out is
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

end -- class DS_HASH_TOPOLOGICAL_SORTER
