indexing

	description:

		"Hash tables, implemented with arrays";

	note:       "To avoid performance degradation, %
	             %make sure that `count <= capacity * 2 // 3'";
	library:    "Gobo Eiffel Structure Library";
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>";
	copyright:  "Copyright (c) 1997, Eric Bezault";
	date:       "$Date$";
	revision:   "$Revision$"

class DS_HASH_TABLE [G, K -> HASHABLE]

inherit

	DS_TABLE [G, K]
		rename
			put as force,
			valid_entry as has
#ifdef ISE || HACT
		undefine
			consistent, setup
#endif
		select
			copy
		end

	DS_BILINEAR [G]
		rename
			has as has_item
#ifdef ISE || HACT
		undefine
			consistent, setup
#endif
		redefine
			searcher
#ifdef VE
--| Bug in VE (970520a)
		select
			copy
#endif
		end

	DS_RESIZABLE [G]
#ifdef ISE || HACT
		undefine
			consistent, setup
		end
#endif
#ifdef VE
--| Bug in VE (970520a)
		select
			copy
		end
#endif

	DS_ARRAYED [DS_PAIR [G, K]]
		rename
			make as make_array,
			count as array_count,
			resize as array_resize,
			copy as array_copy,
			infix "@" as array_at,
			item as array_item,
			put as array_put,
			force as array_force,
			valid_index as valid_array_index
		export
#ifndef SE
			{NONE} all
			{DS_HASH_TABLE_CURSOR, DS_HASH_TABLE_SEARCHER} array_item
#else
--| SmallEiffel -0.90 bug (960905a)
--|			{NONE} all
--|			{DS_HASH_TABLE_CURSOR, DS_HASH_TABLE_SEARCHER} array_item
#endif
		redefine
			is_equal
		end

creation

	make, make_equal

feature {NONE} -- Initialization

	make (n: INTEGER) is
			-- Create an empty hash table and allocate
			-- memory space for at least `n' items.
			-- Use `=' as comparison criterion.
		require
			positive_n: n >= 0
		local
			dead_item: G
			dead_key: K
			ref_searcher: DS_HASH_TABLE_REFERENCE_SEARCHER [G, K]
		do
			make_array (0, n)
			!! dead_cell.make (dead_item, dead_key)
			!! ref_searcher
			searcher := ref_searcher
		ensure
			empty: is_empty
			capacity_set: capacity = n
		end

	make_equal (n: INTEGER) is
			-- Create an empty hash table and allocate
			-- memory space for at least `n' items.
			-- Use `equal' as comparison criterion.
		require
			positive_n: n >= 0
		local
			dead_item: G
			dead_key: K
			value_searcher: DS_HASH_TABLE_VALUE_SEARCHER [G, K]
		do
			make_array (0, n)
			!! dead_cell.make (dead_item, dead_key)
			!! value_searcher
			searcher := value_searcher
		ensure
			empty: is_empty
			capacity_set: capacity = n
		end

feature -- Access

	infix "@", item (k: K): G is
			-- Item associated with `k'
		do
			search (k)
			check has_k: valid_cell (array_item (position)) end
			Result := array_item (position).first
		end

	first: G is
			-- First item in hash table
		local
			i: INTEGER
		do
			from until
				valid_cell (array_item (i))
			loop
				i := i + 1
			end
			Result := array_item (i).first
		end

	last: G is
			-- Last item in hash table
		local
			i: INTEGER
		do
			from
				i := upper
			until
				valid_cell (array_item (i))
			loop
				i := i - 1
			end
			Result := array_item (i).first
		end

	new_cursor: DS_HASH_TABLE_CURSOR [G, K] is
			-- New cursor for traversal
		do
			!! Result.make (Current)
		end

	searcher: DS_HASH_TABLE_SEARCHER [G, K]
			-- Hash table searcher

feature -- Measurement

	count: INTEGER
			-- Number of items in hash table

	capacity: INTEGER is
			-- Maximum number of items in hash table
		do
			Result := array_count - 1
		end

feature -- Status report

	valid_key (k: K): BOOLEAN is
			-- Is `k' a valid key?
		do
			Result := k /= Void
		ensure then
			key_not_void: Result implies k /= Void
		end

	has (k: K): BOOLEAN is
			-- Is there an item associated with `k'?
		local
			current_cell: like dead_cell
		do
			if valid_key (k) then
				search (k)
				current_cell := array_item (position)
				Result := valid_cell (current_cell)
			end
		end

feature -- Comparison

	is_equal (other: like Current): BOOLEAN is
			-- Is hash table equal to `other'?
		local
			a_cursor: like new_cursor
			a_key: K
		do
			if same_type (other) and count = other.count then
				from
					a_cursor := new_cursor
					a_cursor.start
					Result := True
				until
					a_cursor.after
				loop
					a_key := a_cursor.key
					Result := other.has (a_key) and then
						other.item (a_key) = a_cursor.item
					a_cursor.forth
				end
			end
		end

feature -- Duplication

	copy (other: like Current) is
			-- Copy `other' to current hash table.
		local
			i, nb: INTEGER
			current_cell: like dead_cell
		do
			array_copy (other)
			nb := upper
			from until i > nb loop
				current_cell := array_item (i)
				if valid_cell (current_cell) then
					array_put (clone (current_cell), i)
				end
				i := i + 1
			end
		end

feature -- Element change

	replace (v: G; k: K) is
			-- Replace item associated with `k' by `v'.
		do
			search (k)
			check has_k: valid_cell (array_item (position)) end
			array_item (position).put_first (v)
		end

	put (v: G; k: K) is
			-- Associate `v' with key `k'.
		require
			not_full: not is_full
			valid_key: valid_key (k)
		local
			current_cell: like dead_cell
		do
			search (k)
			current_cell := array_item (position)
			if not valid_cell (current_cell) then
				!! current_cell.make (v, k)
				array_put (current_cell, position)
				count := count + 1
			else
				current_cell.put_first (v)
			end
		ensure
			one_more: (not old has (k)) implies (count = old count + 1)
			inserted: has (k) and then item (k) = v
		end

	force (v: G; k: K) is
			-- Associate `v' with key `k'.
			-- Resize hash table if necessary.
		do
			if count >= capacity * 2 // 3 then
				resize ((capacity + 1) * 3 // 2)
			end
			put (v, k)
		ensure then
			one_more: (not old has (k)) implies (count = old count + 1)
		end

feature -- Removal

	remove (k: K) is
			-- Remove item associated with `k'.
		do
			search (k)
			array_put (dead_cell, position)
			count := count - 1
		ensure then
			removed: not has (k)
		end

	wipe_out is
			-- Remove all items.
		local
			i, nb: INTEGER
		do
			nb := upper
			from until i > nb loop
				array_put (Void, i)
				i := i + 1
			end
			count := 0
		end

feature -- Resizing

	resize (n: INTEGER) is
			-- Resize hash table so that it can contain
			-- at least `n' items. Do not lose any item.
		local
			content: ARRAY [DS_PAIR [G, K]]
			current_cell: like dead_cell
			i, j, nb: INTEGER
		do
			!! content.make (1, count)
			from
				nb := upper
			until
				i > nb
			loop
				current_cell := array_item (i)
				if valid_cell (current_cell) then
					j := j + 1
					content.put (current_cell, j)
				end
				array_put (Void, i)
				i := i + 1
			end
			array_resize (0, n)
			nb := count
			from i := 1 until i > nb loop
				current_cell := content.item (i)
				search (current_cell.second)
				array_put (current_cell, position)
				i := i + 1
			end
		end

feature {DS_HASH_TABLE_SEARCHER, DS_HASH_TABLE_CURSOR} -- Implementation

	valid_cell (cell: like dead_cell): BOOLEAN is
			-- Does `cell' contain an item?
		do
			Result := cell /= Void and cell /= dead_cell
		ensure
			cell_not_void: Result implies cell /= Void
		end

	valid_position (i: INTEGER): BOOLEAN is
			-- Is there a valid cell at position `i'?
		require
			valid_i: 0 <= i and i <= capacity
		do
			Result := valid_cell (array_item (i))
		end

	dead_cell: DS_PAIR [G, K]
			-- Mark for deleted items

	position: INTEGER
			-- Last position found by `search'

feature {NONE} -- Implementation

	search (k: K) is
			-- Search for position where key is equal to `k'
			-- or to possible insertion position otherwise.
		require
			valid_key: valid_key (k)
		do
			position := searcher.hash_position (Current, k)
		end
				
invariant

	dead_cell: dead_cell /= Void
	valid_position: valid_array_index (position)
	capacity_definition: capacity = array_count - 1
	lower_definition: lower = 0

end -- class DS_HASH_TABLE
