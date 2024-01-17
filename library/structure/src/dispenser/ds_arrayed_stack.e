note

	description:

		"Stacks (Last-In, First-Out) implemented with arrays"

	storable_version: "20130823"
	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 1999-2016, Eric Bezault and others"
	license: "MIT License"

class DS_ARRAYED_STACK [G]

inherit

	DS_STACK [G]

	DS_RESIZABLE [G]

	KL_IMPORTED_ANY_ROUTINES
		export
			{NONE} all
		redefine
			copy,
			is_equal
		end

	MISMATCH_CORRECTOR
		export
			{NONE} all
		undefine
			copy, is_equal
		redefine
			correct_mismatch
		end

create

	make,
	make_equal,
	make_default

feature {NONE} -- Initialization

	make (n: INTEGER)
			-- Create an empty stack and allocate
			-- memory space for at least `n' items.
			-- Use `=' as comparison criterion.
		require
			positive_n: n >= 0
		do
			create special_routines
			storage := special_routines.make (n)
			capacity := n
		ensure
			empty: is_empty
			capacity_set: capacity = n
		end

	make_equal (n: INTEGER)
			-- Create an empty stack and allocate
			-- memory space for at least `n' items.
			-- Use `equal' as comparison criterion.
		require
			positive_n: n >= 0
		do
			make (n)
			create equality_tester
		ensure
			empty: is_empty
			capacity_set: capacity = n
		end

	make_default
			-- Create an empty stack and allocate memory
			-- space for at least `default_capacity' items.
			-- Use `=' as comparison criterion.
		do
			make (default_capacity)
		end

feature -- Status report

	has (v: G): BOOLEAN
			-- Does stack include `v'?
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
		local
			i: INTEGER
		do
			if attached equality_tester as l_tester then
				from
					i := count - 1
				until
					i < 0
				loop
					if l_tester.test (storage.item (i), v) then
						Result := True
							-- Jump out of the loop.
						i := -1
					else
						i := i - 1
					end
				end
			else
					-- Use `=' as comparison criterion.
				from
					i := count - 1
				until
					i < 0
				loop
					if storage.item (i) = v then
						Result := True
							-- Jump out of the loop.
						i := -1
					else
						i := i - 1
					end
				end
			end
		end

	extendible (n: INTEGER): BOOLEAN
			-- May stack be extended with `n' items?
		do
			Result := capacity >= count + n
		ensure then
			enough_space: Result implies capacity >= count + n
		end

feature -- Access

	item: G
			-- Item at top of stack
		do
			Result := storage.item (count - 1)
		end

	i_th (i: INTEGER): G
			-- Item at index `i'
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		do
			Result := storage.item (i - 1)
		end

feature -- Measurement

	count: INTEGER
			-- Number of items in stack

	capacity: INTEGER
			-- Maximum number of items in stack

	occurrences (v: G): INTEGER
			-- Number of times `v' appears in stack
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
		local
			i: INTEGER
		do
			if attached equality_tester as l_tester then
				from
					i := count - 1
				until
					i < 0
				loop
					if l_tester.test (storage.item (i), v) then
						Result := Result + 1
					end
					i := i - 1
				end
			else
					-- Use `=' as comparison criterion.
				from
					i := count - 1
				until
					i < 0
				loop
					if storage.item (i) = v then
						Result := Result + 1
					end
					i := i - 1
				end
			end
		end

feature -- Duplication

	copy (other: like Current)
			-- Copy `other' to current stack.
		do
			if other /= Current then
				standard_copy (other)
					-- Note: do not use `storage.twin' because SPECIAL.copy may
					-- shrink the 'capacity' down to 'count'.
				storage := storage.resized_area (storage.capacity)
			end
		end

feature -- Comparison

	is_equal (other: like Current): BOOLEAN
			-- Is current stack equal to `other'?
		local
			i, nb: INTEGER
			other_storage: like storage
		do
			if Current = other then
				Result := True
			elseif ANY_.same_types (Current, other) and other.count = count then
				other_storage := other.storage
				from
					i := 0
					nb := count - 1
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

	put (v: G)
			-- Push `v' on stack.
		do
			special_routines.force (storage, v, count)
			count := count + 1
		end

	force (v: G)
			-- Push `v' on stack.
			-- Resize stack if needed.
		do
			if not extendible (1) then
				resize (new_capacity (count + 1))
			end
			special_routines.force (storage, v, count)
			count := count + 1
		end

	replace (v: G)
			-- Replace top item by `v'.
		do
			storage.put (v, count - 1)
		end

	extend (other: DS_LINEAR [G])
			-- Add items of `other' to stack.
			-- Add `other.first' first, etc.
		local
			i: INTEGER
			other_cursor: DS_LINEAR_CURSOR [G]
		do
			i := count
			other_cursor := other.new_cursor
			from
				other_cursor.start
			until
				other_cursor.after
			loop
				special_routines.force (storage, other_cursor.item, i)
				i := i + 1
				other_cursor.forth
			end
			count := count + other.count
		end

	append (other: DS_LINEAR [G])
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

	remove
			-- Remove top item from stack.
		do
			count := count - 1
			storage.keep_head (count)
		end

	prune (n: INTEGER)
			-- Remove `n' items from stack.
		do
			count := count - n
			storage.keep_head (count)
		end

	keep (n: INTEGER)
			-- Keep `n' items in stack.
		do
			count := n
			storage.keep_head (count)
		end

	wipe_out
			-- Remove all items from stack.
		do
			storage.keep_head (0)
			count := 0
		end

feature -- Resizing

	resize (n: INTEGER)
			-- Resize stack so that it can contain
			-- at least `n' items. Do not lose any item.
		do
			storage := special_routines.aliased_resized_area (storage, n)
			capacity := n
		end

feature -- Iteration

	do_all (an_action: PROCEDURE [G])
			-- Apply `an_action' to every item, from last to first inserted.
			-- (Semantics not guaranteed if `an_action' changes the structure.)
		local
			i: INTEGER
		do
			from
				i := count - 1
			until
				i < 0
			loop
				an_action.call ([storage.item (i)])
				i := i - 1
			end
		end

	do_if (an_action: PROCEDURE [G]; a_test: FUNCTION [G, BOOLEAN])
			-- Apply `an_action' to every item that satisfies `a_test', from last to first inserted.
			-- (Semantics not guaranteed if `an_action' or `a_test' change the structure.)
		local
			i: INTEGER
			l_item: G
		do
			from
				i := count - 1
			until
				i < 0
			loop
				l_item := storage.item (i)
				if a_test.item ([l_item]) then
					an_action.call ([l_item])
				end
				i := i - 1
			end
		end

	do_until (an_action: PROCEDURE [G]; a_condition: FUNCTION [G, BOOLEAN])
			-- Apply `an_action' to every item, from last to first inserted.
			-- (Semantics not guaranteed if `an_action' changes the structure.)
			--
			-- The iteration will be interrupted if `a_condition' starts returning True.
		local
			i: INTEGER
			l_item: G
		do
			from
				i := count - 1
			invariant
				i_large_enough: i >= -1
				i_small_enough: i < count
			until
				i < 0
			loop
				l_item := storage.item (i)
				if a_condition.item ([l_item]) then
						-- Stop.
					i := 0
				else
					an_action.call ([l_item])
				end
				i := i - 1
			variant
				index: i
			end
		end

	do_if_until (an_action: PROCEDURE [G]; a_test: FUNCTION [G, BOOLEAN]; a_condition: FUNCTION [G, BOOLEAN])
			-- Apply `an_action' to every item that satisfies `a_test', from last to first inserted.
			-- (Semantics not guaranteed if `an_action' or `a_test' change the structure.)
			--
			-- The iteration will be interrupted if `a_condition' starts returning True.
		local
			i: INTEGER
			l_item: G
		do
			from
				i := count - 1
			invariant
				i_large_enough: i >= -1
				i_small_enough: i < count
			until
				i < 0
			loop
				l_item := storage.item (i)
				if a_condition.item ([l_item]) then
						-- Stop.
					i := 0
				elseif a_test.item ([l_item]) then
					an_action.call ([l_item])
				end
				i := i - 1
			variant
				index: i
			end
		end

	there_exists (a_test: FUNCTION [G, BOOLEAN]): BOOLEAN
			-- Is `a_test' true for at least one item?
			-- (Semantics not guaranteed if `a_test' changes the structure.)
		local
			i: INTEGER
		do
			from
				i := count - 1
			until
				i < 0
			loop
				if a_test.item ([storage.item (i)]) then
					Result := True
						-- Jump out of the loop.
					i := -1
				else
					i := i - 1
				end
			end
		end

	for_all (a_test: FUNCTION [G, BOOLEAN]): BOOLEAN
			-- Is `a_test' true for all items?
			-- (Semantics not guaranteed if `a_test' changes the structure.)
		local
			i: INTEGER
		do
			Result := True
			from
				i := count - 1
			until
				i < 0
			loop
				if not a_test.item ([storage.item (i)]) then
					Result := False
						-- Jump out of the loop.
					i := -1
				else
					i := i - 1
				end
			end
		end

feature {DS_ARRAYED_STACK} -- Implementation

	storage: SPECIAL [G]
			-- Storage for items of the stack

feature {NONE} -- Implementation

	special_routines: KL_SPECIAL_ROUTINES [G]
			-- Routines that ought to be in SPECIAL

feature {NONE} -- Storable mismatch

	correct_mismatch
			-- Attempt to correct object mismatch using `mismatch_information'.
		local
			l_stored_version_number: INTEGER
		do
			if not attached mismatch_information.stored_version as l_stored_version or else l_stored_version.is_empty then
				correct_mismatch_20130823
			elseif l_stored_version.is_integer then
				l_stored_version_number := l_stored_version.to_integer
				if l_stored_version_number < 20130823 then
					correct_mismatch_20130823
				else
					precursor
				end
			else
				precursor
			end
		end

	correct_mismatch_20130823
			-- Correct storable mismatch introducted in version "20130823".
		do
			storage.move_data (1, 0, count)
			storage.keep_head (count)
			capacity := storage.capacity
		end

invariant

	storage_not_void: storage /= Void
	capacity_definition: capacity = storage.capacity
	special_routines_not_void: special_routines /= Void

end
