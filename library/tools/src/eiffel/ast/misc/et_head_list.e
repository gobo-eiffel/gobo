note

	description:

		"Eiffel AST lists where insertions to and removals from the head are optimized"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date: 2010/05/03 $"
	revision: "$Revision: #10 $"

deferred class ET_HEAD_LIST [G]

feature {NONE} -- Initialization

	make
			-- Create a new empty list.
		do
			count := 0
			storage := fixed_array.make (0)
		ensure
			is_empty: is_empty
			capacity_set: capacity = 0
		end

	make_with_capacity (nb: INTEGER)
			-- Create a new empty list with capacity `nb'.
		require
			nb_not_negative: nb >= 0
		do
			count := 0
			storage := fixed_array.make (nb)
		ensure
			is_empty: is_empty
			capacity_set: capacity = nb
		end

feature -- Access

	item (i: INTEGER): G
			-- Item at index `i' in list
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		do
			Result := storage.item (count - i)
		ensure
			item_not_void: Result /= Void
		end

	first: like item
			-- First item
		require
			not_empty: not is_empty
		do
			Result := storage.item (count - 1)
		ensure
			first_not_void: Result /= Void
			definition: Result = item (1)
		end

	last: like item
			-- Last item
		require
			not_empty: not is_empty
		do
			Result := storage.item (0)
		ensure
			last_not_void: Result /= Void
			definition: Result = item (count)
		end

feature -- Measurement

	count: INTEGER
			-- Number of items in list

	capacity: INTEGER
			-- Maximum number of items in list
		do
			Result := storage.capacity
		end

feature -- Status report

	is_empty: BOOLEAN
			-- Is there no item in list?
		do
			Result := (count = 0)
		ensure
			definition: Result = (count = 0)
		end

	has (an_item: like item): BOOLEAN
			-- Does list contain `an_item'?
			-- (Use `=' as comparison criterion.)
		require
			an_item_not_void: an_item /= Void
		local
			i, nb: INTEGER
		do
			nb := count - 1
			from i := 0 until i > nb loop
				if storage.item (i) = an_item then
					Result := True
					i := nb + 1 -- Jump out of the loop.
				else
					i := i + 1
				end
			end
		end

	valid_index (i: INTEGER): BOOLEAN
			-- Is there an item at index `i'?
		do
			Result := (1 <= i and i <= count)
		ensure
			definition: Result = (1 <= i and i <= count)
		end

feature -- Element change

	put_first (an_item: like item)
			-- Put `an_item' at first position in list.
		require
			an_item_not_void: an_item /= Void
			not_full: count < capacity
		do
			fixed_array.force (storage, an_item, count)
			count := count + 1
		ensure
			one_more: count = old count + 1
			first_set: first = an_item
		end

	force_first (an_item: like item)
			-- Put `an_item' at first position in list.
			-- Resize list if necessary.
		require
			an_item_not_void: an_item /= Void
		do
			if count >= capacity then
				resize (new_capacity (count + 1))
			end
			fixed_array.force (storage, an_item, count)
			count := count + 1
		ensure
			one_more: count = old count + 1
			first_set: first = an_item
		end

	put (an_item: like item; i: INTEGER)
			-- Put `an_item' at index `i' in list.
		require
			an_item_not_void: an_item /= Void
			i_large_enough: i >= 1
			i_small_enough: i <= count
		do
			storage.put (an_item, count - i)
		ensure
			same_count: count = old count
			inserted: item (i) = an_item
		end

	extend_first (a_other: ET_HEAD_LIST [like item])
			-- Put all items of `a_other' at first positions in list.
		require
			a_other_not_void: a_other /= Void
			not_full: count + a_other.count <= capacity
		local
			i: INTEGER
			l_new_count: INTEGER
		do
			l_new_count := count
			from i := a_other.count until i < 1 loop
				fixed_array.force (storage, a_other.item (i), l_new_count)
				l_new_count := l_new_count + 1
				i := i - 1
			end
			count := l_new_count
		ensure
			new_first: first = old a_other.first
			same_last: last = old last
		end

	append_first (a_other: ET_HEAD_LIST [like item])
			-- Put all items of `a_other' at first positions in list.
			-- Resize list if necessary.
		require
			a_other_not_void: a_other /= Void
		local
			i: INTEGER
			l_new_count: INTEGER
		do
			if count + a_other.count > capacity then
				resize (new_capacity (count + a_other.count))
			end
			l_new_count := count
			from i := a_other.count until i < 1 loop
				fixed_array.force (storage, a_other.item (i), l_new_count)
				l_new_count := l_new_count + 1
				i := i - 1
			end
			count := l_new_count
		ensure
			new_first: first = old a_other.first
			same_last: last = old last
		end

feature -- Removal

	remove_first
			-- Remove first item.
		require
			not_empty: not is_empty
		do
			count := count - 1
			fixed_array.keep_head (storage, count, count + 1)
		ensure
			one_less: count = old count - 1
		end

	remove (i: INTEGER)
			-- Remove item at index `i'.
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		local
			j, nb: INTEGER
		do
			j := count - i
			nb := count - 2
			from until j > nb loop
				storage.put (storage.item (j + 1), j)
				j := j + 1
			end
			fixed_array.keep_head (storage, count - 1, count)
			count := count - 1
		ensure
			one_less: count = old count - 1
		end

	wipe_out
			-- Remove all items.
		do
			if count > 0 then
				fixed_array.keep_head (storage, 0, count)
				count := 0
			end
		ensure
			wiped_out: is_empty
		end

feature -- Resizing

	resize (nb: INTEGER)
			-- Resize to accommodate at least `nb' items.
		require
			nb_not_negative: nb >= 0
		do
			if nb > capacity then
				storage := fixed_array.aliased_resized_area (storage, nb)
			end
		ensure
			resized: capacity >= nb
		end

feature -- Iteration

	do_all (an_action: PROCEDURE [like item])
			-- Apply `an_action' to every item, from first to last.
			-- (Semantics not guaranteed if `an_action' changes the list.)
		require
			an_action_not_void: an_action /= Void
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

	do_until (an_action: PROCEDURE [like item]; a_stop_request: detachable FUNCTION [BOOLEAN])
			-- Apply `an_action' to every item, from first to last.
			-- (Semantics not guaranteed if `an_action' changes the list.)
			--
			-- The iteration will be interrupted if a stop request is received
			-- i.e. `a_stop_request' starts returning True. No interruption if
			-- `a_stop_request' is Void.
		require
			an_action_not_void: an_action /= Void
		local
			i: INTEGER
		do
			if a_stop_request = Void then
				do_all (an_action)
			elseif not a_stop_request.item ([]) then
				from
					i := count - 1
				until
					i < 0
				loop
					if a_stop_request.item ([]) then
						i := -1
					else
						an_action.call ([storage.item (i)])
						i := i - 1
					end
				end
			end
		end

	do_if (an_action: PROCEDURE [like item]; a_test: FUNCTION [like item, BOOLEAN])
			-- Apply `an_action' to every item that satisfies `a_test', from first to last.
			-- (Semantics not guaranteed if `an_action' or `a_test' change the list.)
		require
			an_action_not_void: an_action /= Void
			a_test_not_void: a_test /= Void
		local
			i: INTEGER
			l_item: like item
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

	do_if_until (an_action: PROCEDURE [like item]; a_test: FUNCTION [like item, BOOLEAN]; a_stop_request: detachable FUNCTION [BOOLEAN])
			-- Apply `an_action' to every item that satisfies `a_test', from first to last.
			-- (Semantics not guaranteed if `an_action' or `a_test' change the list.)
			--
			-- The iteration will be interrupted if a stop request is received
			-- i.e. `a_stop_request' starts returning True. No interruption if
			-- `a_stop_request' is Void.
		require
			an_action_not_void: an_action /= Void
			a_test_not_void: a_test /= Void
		local
			i: INTEGER
			l_item: like item
		do
			if a_stop_request = Void then
				do_if (an_action, a_test)
			elseif not a_stop_request.item ([]) then
				from
					i := count - 1
				until
					i < 0
				loop
					if a_stop_request.item ([]) then
						i := -1
					else
						l_item := storage.item (i)
						if a_test.item ([l_item]) then
							an_action.call ([l_item])
						end
						i := i - 1
					end
				end
			end
		end

	there_exists (a_test: FUNCTION [like item, BOOLEAN]): BOOLEAN
			-- Is `a_test' true for at least one item?
			-- (Semantics not guaranteed if `a_test' changes the list.)
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

	for_all (a_test: FUNCTION [like item, BOOLEAN]): BOOLEAN
			-- Is `a_test' true for all items?
			-- (Semantics not guaranteed if `a_test' changes the list.)
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

feature {NONE} -- Configuration

	new_capacity (n: INTEGER): INTEGER
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

	fixed_array: KL_SPECIAL_ROUTINES [G]
			-- Fixed array routines
		deferred
		ensure
			fixed_array_not_void: Result /= Void
		end

invariant

	count_not_negative: count >= 0
	consistent_count: count <= capacity
	storage_not_void: storage /= Void

end
