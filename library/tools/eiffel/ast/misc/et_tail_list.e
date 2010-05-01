note

	description:

		"Eiffel AST lists where insertions to and removals from the tail are optimized"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004-2010, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_TAIL_LIST [G]

feature {NONE} -- Initialization

	make is
			-- Create a new empty list.
		do
			count := 0
			storage := Void
		ensure
			is_empty: is_empty
			capacity_set: capacity = 0
		end

	make_with_capacity (nb: INTEGER) is
			-- Create a new empty list with capacity `nb'.
		require
			nb_not_negative: nb >= 0
		do
			count := 0
			if nb > 0 then
				storage := fixed_array.make (nb + 1)
			else
				storage := Void
			end
		ensure
			is_empty: is_empty
			capacity_set: capacity = nb
		end

feature -- Access

	item (i: INTEGER): G is
			-- Item at index `i' in list
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		do
			Result := storage.item (i)
		ensure
			item_not_void: Result /= Void
		end

	first: like item is
			-- First item
		require
			not_empty: not is_empty
		do
			Result := storage.item (1)
		ensure
			first_not_void: Result /= Void
			definition: Result = item (1)
		end

	last: like item is
			-- Last item
		require
			not_empty: not is_empty
		do
			Result := storage.item (count)
		ensure
			last_not_void: Result /= Void
			definition: Result = item (count)
		end

	index_of (an_item: like item): INTEGER is
			-- Index of first occurrence of `an_item' if any, 0 otherwise
			-- (Use `=' as comparison criterion.)
		require
			an_item_not_void: an_item /= Void
		local
			i, nb: INTEGER
		do
			nb := count
			from i := 1 until i > nb loop
				if storage.item (i) = an_item then
					Result := i
					i := nb + 1 -- Jump out of the loop.
				else
					i := i + 1
				end
			end
		ensure
			index_large_enough: Result >= 0
			index_small_enough: Result <= count
		end

feature -- Measurement

	count: INTEGER
			-- Number of items in list

	capacity: INTEGER is
			-- Maximum number of items in list
		do
			if storage /= Void then
				Result := storage.count - 1
			end
		end

feature -- Status report

	is_empty: BOOLEAN is
			-- Is there no item in list?
		do
			Result := (count = 0)
		ensure
			definition: Result = (count = 0)
		end

	has (an_item: like item): BOOLEAN is
			-- Does list contain `an_item'?
			-- (Use `=' as comparison criterion.)
		require
			an_item_not_void: an_item /= Void
		do
			Result := index_of (an_item) /= 0
		end

	valid_index (i: INTEGER): BOOLEAN is
			-- Is there an item at index `i'?
		do
			Result := (1 <= i and i <= count)
		ensure
			definition: Result = (1 <= i and i <= count)
		end

feature -- Element change

	put_last (an_item: like item) is
			-- Put `an_item' at last position in list.
		require
			an_item_not_void: an_item /= Void
			not_full: count < capacity
		do
			count := count + 1
			storage.put (an_item, count)
		ensure
			one_more: count = old count + 1
			last_set: last = an_item
		end

	force_last (an_item: like item) is
			-- Put `an_item' at last position in list.
			-- Resize list if necessary.
		require
			an_item_not_void: an_item /= Void
		do
			if count >= capacity then
				resize (new_capacity (count + 1))
			end
			count := count + 1
			storage.put (an_item, count)
		ensure
			one_more: count = old count + 1
			last_set: last = an_item
		end

	append_last (other: ET_TAIL_LIST [like item]) is
			-- Add items of `other' to the end of list.
			-- Keep items of `other' in the same order.
			-- Resize list if necessary.
		require
			other_not_void: other /= Void
		local
			i, nb: INTEGER
			j: INTEGER
		do
			nb := other.count
			if count + nb > capacity then
				resize (new_capacity (count + nb))
			end
			j := count
			from i := 1 until i > nb loop
				j := j + 1
				storage.put (other.item (i), j)
				i := i + 1
			end
			count := j
		ensure
			new_more: count = old (count + other.count)
		end

	put (an_item: like item; i: INTEGER) is
			-- Put `an_item' at index `i' in list.
		require
			an_item_not_void: an_item /= Void
			i_large_enough: i >= 1
			i_small_enough: i <= count
		do
			storage.put (an_item, i)
		ensure
			same_count: count = old count
			inserted: item (i) = an_item
		end

feature -- Removal

	remove_last is
			-- Remove last item.
		require
			not_empty: not is_empty
		local
			dead_item: like item
		do
			storage.put (dead_item, count)
			count := count - 1
		ensure
			one_less: count = old count - 1
		end

	remove (i: INTEGER) is
			-- Remove item at index `i'.
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		local
			j, nb: INTEGER
			dead_item: like item
		do
			j := i
			nb := count - 1
			from until j > nb loop
				storage.put (storage.item (j + 1), j)
				j := j + 1
			end
			storage.put (dead_item, j)
			count := count - 1
		ensure
			one_less: count = old count - 1
		end

	wipe_out is
			-- Remove all items.
		local
			i: INTEGER
			dead_item: like item
		do
			from i := count until i < 1 loop
				storage.put (dead_item, i)
				i := i - 1
			end
			count := 0
		ensure
			wiped_out: is_empty
		end

feature -- Resizing

	resize (nb: INTEGER) is
			-- Resize to accommodate at least `nb' items.
		require
			nb_not_negative: nb >= 0
		do
			if nb > capacity then
				if storage = Void then
					storage := fixed_array.make (nb + 1)
				else
					storage := fixed_array.resize (storage, nb + 1)
				end
			end
		ensure
			resized: capacity >= nb
		end

feature -- Iteration

	do_all (an_action: PROCEDURE [ANY, TUPLE [like item]]) is
			-- Apply `an_action' to every item, from first to last.
			-- (Semantics not guaranteed if `an_action' changes the list.)
		require
			an_action_not_void: an_action /= Void
		local
			i, nb: INTEGER
		do
			nb := count
			from i := 1 until i > nb loop
				an_action.call ([storage.item (i)])
				i := i + 1
			end
		end

	do_if (an_action: PROCEDURE [ANY, TUPLE [like item]]; a_test: FUNCTION [ANY, TUPLE [like item], BOOLEAN]) is
			-- Apply `an_action' to every item that satisfies `a_test', from first to last.
			-- (Semantics not guaranteed if `an_action' or `a_test' change the list.)
		require
			an_action_not_void: an_action /= Void
			a_test_not_void: a_test /= Void
		local
			i, nb: INTEGER
			l_item: like item
		do
			nb := count
			from i := 1 until i > nb loop
				l_item := storage.item (i)
				if a_test.item ([l_item]) then
					an_action.call ([l_item])
				end
				i := i + 1
			end
		end

	there_exists (a_test: FUNCTION [ANY, TUPLE [like item], BOOLEAN]): BOOLEAN is
			-- Is `a_test' true for at least one item?
			-- (Semantics not guaranteed if `a_test' changes the list.)
		local
			i, nb: INTEGER
		do
			nb := count
			from i := 1 until i > nb loop
				if a_test.item ([storage.item (i)]) then
					Result := True
						-- Jump out of the loop.
					i := nb + 1
				else
					i := i + 1
				end
			end
		end

	for_all (a_test: FUNCTION [ANY, TUPLE [like item], BOOLEAN]): BOOLEAN is
			-- Is `a_test' true for all items?
			-- (Semantics not guaranteed if `a_test' changes the list.)
		local
			i, nb: INTEGER
		do
			Result := True
			nb := count
			from i := 1 until i > nb loop
				if not a_test.item ([storage.item (i)]) then
					Result := False
						-- Jump out of the loop.
					i := nb + 1
				else
					i := i + 1
				end
			end
		end

feature {NONE} -- Configuration

	new_capacity (n: INTEGER): INTEGER is
			-- New capacity which could accommodate at least
			-- `n' items (Used as argument of `resize'.)
		require
			n_large_enough: n > capacity
		do
			Result := 2 * n
		ensure
			definition: Result >= n
		end

feature {NONE} -- Implementation

	storage: SPECIAL [like item]
			-- Internal storage

	fixed_array: KL_SPECIAL_ROUTINES [G] is
			-- Fixed array routines
		deferred
		ensure
			fixed_array_not_void: Result /= Void
		end

invariant

	count_not_negative: count >= 0
	consistent_count: count <= capacity
	storage_not_void: capacity > 0 implies storage /= Void

end
