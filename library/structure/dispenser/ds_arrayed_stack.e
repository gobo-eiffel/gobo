note

	description:

		"Stacks (Last-In, First-Out) implemented with arrays"

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 1999-2012, Eric Bezault and others"
	license: "MIT License"
	date: "$Date: 2010/10/06 $"
	revision: "$Revision: #10 $"

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
			storage := special_routines.make (n + 1)
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
			a_tester: like equality_tester
		do
			a_tester := equality_tester
			if a_tester /= Void then
				from
					i := count
				until
					i < 1
				loop
					if a_tester.test (storage.item (i), v) then
						Result := True
							-- Jump out of the loop.
						i := 0
					else
						i := i - 1
					end
				end
			else
					-- Use `=' as comparison criterion.
				from
					i := count
				until
					i < 1
				loop
					if storage.item (i) = v then
						Result := True
							-- Jump out of the loop.
						i := 0
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
			Result := storage.item (count)
		end

	i_th (i: INTEGER): G
			-- Item at index `i'
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		do
			Result := storage.item (i)
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
			a_tester: like equality_tester
		do
			a_tester := equality_tester
			if a_tester /= Void then
				from
					i := count
				until
					i < 1
				loop
					if a_tester.test (storage.item (i), v) then
						Result := Result + 1
					end
					i := i - 1
				end
			else
					-- Use `=' as comparison criterion.
				from
					i := count
				until
					i < 1
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
				storage := storage.twin
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

	put (v: G)
			-- Push `v' on stack.
		do
			if count = 0 then
					-- Take care of the dummy item at position 0 in `storage'.
				special_routines.force (storage, v, 0)
			end
			count := count + 1
			special_routines.force (storage, v, count)
		end

	force (v: G)
			-- Push `v' on stack.
			-- Resize stack if needed.
		do
			if not extendible (1) then
				resize (new_capacity (count + 1))
			end
			if count = 0 then
					-- Take care of the dummy item at position 0 in `storage'.
				special_routines.force (storage, v, 0)
			end
			count := count + 1
			special_routines.force (storage, v, count)
		end

	replace (v: G)
			-- Replace top item by `v'.
		do
			if count = 1 then
					-- Take care of the dummy item at position 0 in `storage'.
				storage.put (v, 0)
			end
			storage.put (v, count)
		end

	extend (other: DS_LINEAR [G])
			-- Add items of `other' to stack.
			-- Add `other.first' first, etc.
		local
			i: INTEGER
			other_cursor: DS_LINEAR_CURSOR [G]
		do
			if count = 0 and other.count > 0 then
					-- Take care of the dummy item at position 0 in `storage'.
				special_routines.force (storage, other.first, 0)
			end
			i := count + 1
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
			clear_items (count, count)
			count := count - 1
		end

	prune (n: INTEGER)
			-- Remove `n' items from stack.
		do
			clear_items (count - n + 1, count)
			count := count - n
		end

	keep (n: INTEGER)
			-- Keep `n' items in stack.
		do
			clear_items (n + 1, count)
			count := n
		end

	wipe_out
			-- Remove all items from stack.
		do
			clear_items (1, count)
			count := 0
		end

feature -- Resizing

	resize (n: INTEGER)
			-- Resize stack so that it can contain
			-- at least `n' items. Do not lose any item.
		do
			storage := special_routines.resize (storage, n + 1)
			capacity := n
		end

feature -- Iteration

	do_all (an_action: PROCEDURE [ANY, TUPLE [G]])
			-- Apply `an_action' to every item, from last to first inserted.
			-- (Semantics not guaranteed if `an_action' changes the structure.)
		local
			i: INTEGER
		do
			from
				i := count
			until
				i < 1
			loop
				an_action.call ([storage.item (i)])
				i := i - 1
			end
		end

	do_if (an_action: PROCEDURE [ANY, TUPLE [G]]; a_test: FUNCTION [ANY, TUPLE [G], BOOLEAN])
			-- Apply `an_action' to every item that satisfies `a_test', from last to first inserted.
			-- (Semantics not guaranteed if `an_action' or `a_test' change the structure.)
		local
			i: INTEGER
			l_item: G
		do
			from
				i := count
			until
				i < 1
			loop
				l_item := storage.item (i)
				if a_test.item ([l_item]) then
					an_action.call ([l_item])
				end
				i := i - 1
			end
		end

	do_until (an_action: PROCEDURE [ANY, TUPLE [G]]; a_condition: FUNCTION [ANY, TUPLE [G], BOOLEAN])
			-- Apply `an_action' to every item, from last to first inserted.
			-- (Semantics not guaranteed if `an_action' changes the structure.)
			--
			-- The iteration will be interrupted if `a_condition' starts returning True.
		local
			i: INTEGER
			l_item: G
		do
			from
				i := count
			invariant
				i_large_enough: i >= 0
				i_small_enough: i <= count
			until
				i < 1
			loop
				l_item := storage.item (i)
				if a_condition.item ([l_item]) then
						-- Stop.
					i := 1
				else
					an_action.call ([l_item])
				end
				i := i - 1
			variant
				index: i
			end
		end

	do_if_until (an_action: PROCEDURE [ANY, TUPLE [G]]; a_test: FUNCTION [ANY, TUPLE [G], BOOLEAN]; a_condition: FUNCTION [ANY, TUPLE [G], BOOLEAN])
			-- Apply `an_action' to every item that satisfies `a_test', from last to first inserted.
			-- (Semantics not guaranteed if `an_action' or `a_test' change the structure.)
			--
			-- The iteration will be interrupted if `a_condition' starts returning True.
		local
			i: INTEGER
			l_item: G
		do
			from
				i := count
			invariant
				i_large_enough: i >= 0
				i_small_enough: i <= count
			until
				i < 1
			loop
				l_item := storage.item (i)
				if a_condition.item ([l_item]) then
						-- Stop.
					i := 1
				elseif a_test.item ([l_item]) then
					an_action.call ([l_item])
				end
				i := i - 1
			variant
				index: i
			end
		end

	there_exists (a_test: FUNCTION [ANY, TUPLE [G], BOOLEAN]): BOOLEAN
			-- Is `a_test' true for at least one item?
			-- (Semantics not guaranteed if `a_test' changes the structure.)
		local
			i: INTEGER
		do
			from
				i := count
			until
				i < 1
			loop
				if a_test.item ([storage.item (i)]) then
					Result := True
						-- Jump out of the loop.
					i := 0
				else
					i := i - 1
				end
			end
		end

	for_all (a_test: FUNCTION [ANY, TUPLE [G], BOOLEAN]): BOOLEAN
			-- Is `a_test' true for all items?
			-- (Semantics not guaranteed if `a_test' changes the structure.)
		local
			i: INTEGER
		do
			Result := True
			from
				i := count
			until
				i < 1
			loop
				if not a_test.item ([storage.item (i)]) then
					Result := False
						-- Jump out of the loop.
					i := 0
				else
					i := i - 1
				end
			end
		end

feature {DS_ARRAYED_STACK} -- Implementation

	storage: SPECIAL [G]
			-- Storage for items of the stack

feature {NONE} -- Implementation

	clear_items (s, e: INTEGER)
			-- Clear items in `storage' within bounds `s'..`e'.
		require
			s_large_enough: s >= 1
			e_small_enough: e <= capacity
			valid_bound: s <= e + 1
		do
			if e = 0 then
				-- Nothing to be done.
			elseif s = 1 then
					-- Take care of the dummy item at position 0 in `storage'.
				special_routines.keep_head (storage, 0, e + 1)
			else
				special_routines.keep_head (storage, s, e + 1)
			end
		end

	special_routines: KL_SPECIAL_ROUTINES [G]
			-- Routines that ought to be in SPECIAL

invariant

	storage_not_void: storage /= Void
	capacity_definition: capacity = storage.capacity - 1
	special_routines_not_void: special_routines /= Void

end
