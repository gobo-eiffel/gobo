indexing

	description:

		"Stacks (Last-In, First-Out) implemented with arrays"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class DS_ARRAYED_STACK [G]

inherit

	DS_STACK [G]

	DS_RESIZABLE [G]

	KL_IMPORTED_FIXED_ARRAY_TYPE [G]
		undefine
			is_equal, copy
		end

creation

	make, make_equal

feature {NONE} -- Initialization

	make (n: INTEGER) is
			-- Create an empty stack and allocate
			-- memory space for at least `n' items.
			-- Use `=' as comparison criterion.
		require
			positive_n: n >= 0
		do
			!! FIXED_ARRAY_
			storage := FIXED_ARRAY_.make (n + 1)
			capacity := n
		ensure
			empty: is_empty
			capacity_set: capacity = n
		end

	make_equal (n: INTEGER) is
			-- Create an empty stack and allocate
			-- memory space for at least `n' items.
			-- Use `equal' as comparison criterion.
		require
			positive_n: n >= 0
		do
			make (n)
			!! equality_tester
		ensure
			empty: is_empty
			capacity_set: capacity = n
		end

feature -- Status report

	has (v: G): BOOLEAN is
			-- Does stack include `v'?
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
		local
			i: INTEGER
			a_tester: like equality_tester
		do
			i := count
			a_tester := equality_tester
			if a_tester /= Void then
				from  until i < 1 loop
					if a_tester.test (storage.item (i), v) then
						Result := True
						i := 0 -- Jump out of the loop.
					else
						i := i - 1
					end
				end
			else
					-- Use `=' as comparison criterion.
				from  until i < 1 loop
					if storage.item (i) = v then
						Result := True
						i := 0 -- Jump out of the loop.
					else
						i := i - 1
					end
				end
			end
		end

	extendible (n: INTEGER): BOOLEAN is
			-- May stack be extended with `n' items?
		do
			Result := capacity >= count + n
		ensure then
			enough_space: Result implies capacity >= count + n
		end

feature -- Access

	item: G is
			-- Item at top of stack
		do
			Result := storage.item (count)
		end

feature -- Measurement

	count: INTEGER
			-- Number of items in stack

	capacity: INTEGER
			-- Maximum number of items in stack

	occurrences (v: G): INTEGER is
			-- Number of times `v' appears in stack
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
		local
			i: INTEGER
			a_tester: like equality_tester
		do
			i := count
			a_tester := equality_tester
			if a_tester /= Void then
				from  until i < 1 loop
					if a_tester.test (storage.item (i), v) then
						Result := Result + 1
					end
					i := i - 1
				end
			else
					-- Use `=' as comparison criterion.
				from  until i < 1 loop
					if storage.item (i) = v then
						Result := Result + 1
					end
					i := i - 1
				end
			end
		end

feature -- Duplication

	copy (other: like Current) is
			-- Copy `other' to current stack.
		do
			if other /= Current then
				standard_copy (other)
				storage := clone (storage)
			end
		end

feature -- Comparison

	is_equal (other: like Current): BOOLEAN is
			-- Is current stack equal to `other'?
		local
			i, nb: INTEGER
			other_storage: like storage
		do
			if Current = other then
				Result := True
			elseif same_type (other) and other.count = count then
				other_storage := other.storage
				from
					i := 1
					nb := count
					Result := True
				until
					not Result or i > nb
				loop
					Result := storage.item (i) = other_storage.item (i)
					i := i + 1
				end
			end
		end

feature -- Element change

	put (v: G) is
			-- Push `v' on stack.
		do
			count := count + 1
			storage.put (v, count)
		end

	force (v: G) is
			-- Push `v' on stack.
			-- Resize stack if needed.
		do
			if not extendible (1) then
				resize (new_capacity (count + 1))
			end
			count := count + 1
			storage.put (v, count)
		end

	replace (v: G) is
			-- Replace top item by `v'.
		do
			storage.put (v, count)
		end

	extend (other: DS_LINEAR [G]) is
			-- Add items of `other' to stack.
			-- Add `other.first' first, etc.
		local
			i: INTEGER
			other_cursor: DS_LINEAR_CURSOR [G]
		do
			i := count + 1
			other_cursor := other.new_cursor
			from other_cursor.start until other_cursor.after loop
				storage.put (other_cursor.item, i)
				i := i + 1
				other_cursor.forth
			end
			count := count + other.count
		end

	append (other: DS_LINEAR [G]) is
			-- Add items of `other' to stack.
			-- Add `other.first' first, etc.
			-- Resize stack if needed.
		local
			nb: INTEGER
		do
			nb := other.count
			if not extendible (nb) then
				resize (new_capacity (count + nb))
			end
			extend (other)
		end

feature -- Removal

	remove is
			-- Remove top item from stack.
		local
			dead_item: G
		do
			storage.put (dead_item, count)
			count := count - 1
		end

	prune (n: INTEGER) is
			-- Remove `n' items from stack.
		do
			clear_items (count - n + 1, count)
			count := count - n
		end

	keep (n: INTEGER) is
			-- Keep `n' items in stack.
		do
			clear_items (n + 1, count)
			count := n
		end

	wipe_out is
			-- Remove all items from stack.
		do
			clear_items (1, count)
			count := 0
		end

feature -- Resizing

	resize (n: INTEGER) is
			-- Resize stack so that it can contain
			-- at least `n' items. Do not lose any item.
		do
			storage := FIXED_ARRAY_.resize (storage, n + 1)
			capacity := n
		end

feature {DS_ARRAYED_STACK} -- Implementation

	storage: like FIXED_ARRAY_TYPE
			-- Storage for items of the stack

feature {NONE} -- Implementation

	clear_items (s, e: INTEGER) is
			-- Clear items in `storage' within bounds `s'..`e'.
		require
			s_large_enough: s >= 1
			e_small_enough: e <= capacity
			valid_bound: s <= e + 1
		local
			dead_item: G
			i: INTEGER
		do
			from i := s until i > e loop
				storage.put (dead_item, i)
				i := i + 1
			end
		end

	FIXED_ARRAY_: KL_FIXED_ARRAY_ROUTINES [G]
			-- Routines that ought to be in FIXED_ARRAY

invariant

	storage_not_void: storage /= Void
	capacity_definition: capacity = storage.count - 1
	fixed_array_routines_not_void: FIXED_ARRAY_ /= Void

end -- class DS_ARRAYED_STACK
