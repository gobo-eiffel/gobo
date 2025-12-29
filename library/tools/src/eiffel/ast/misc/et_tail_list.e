note

	description:

		"Eiffel AST lists where insertions to and removals from the tail are optimized"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004-2019, Eric Bezault and others"
	license: "MIT License"

deferred class ET_TAIL_LIST [G]

feature {NONE} -- Initialization

	make
			-- Create a new empty list.
		do
			count := 0
			storage := fixed_array.make (1)
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
			storage := fixed_array.make (nb + 1)
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
			Result := storage.item (i)
		ensure
			item_not_void: Result /= Void
		end

	first: like item
			-- First item
		require
			not_empty: not is_empty
		do
			Result := storage.item (1)
		ensure
			first_not_void: Result /= Void
			definition: Result = item (1)
		end

	last: like item
			-- Last item
		require
			not_empty: not is_empty
		do
			Result := storage.item (count)
		ensure
			last_not_void: Result /= Void
			definition: Result = item (count)
		end

	index_of (an_item: like item): INTEGER
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

	capacity: INTEGER
			-- Maximum number of items in list
		do
			Result := storage.capacity - 1
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
		do
			Result := index_of (an_item) /= 0
		end

	valid_index (i: INTEGER): BOOLEAN
			-- Is there an item at index `i'?
		do
			Result := (1 <= i and i <= count)
		ensure
			definition: Result = (1 <= i and i <= count)
		end

feature -- Element change

	put_last (an_item: like item)
			-- Put `an_item' at last position in list.
		require
			an_item_not_void: an_item /= Void
			not_full: count < capacity
		do
			if count = 0 then
					-- Take care of the dummy item at position 0 in `storage'.
				fixed_array.force (storage, an_item, 0)
			end
			count := count + 1
			fixed_array.force (storage, an_item, count)
		ensure
			one_more: count = old count + 1
			last_set: last = an_item
		end

	force_last (an_item: like item)
			-- Put `an_item' at last position in list.
			-- Resize list if necessary.
		require
			an_item_not_void: an_item /= Void
		do
			if count >= capacity then
				resize (new_capacity (count + 1))
			end
			if count = 0 then
					-- Take care of the dummy item at position 0 in `storage'.
				fixed_array.force (storage, an_item, 0)
			end
			count := count + 1
			fixed_array.force (storage, an_item, count)
		ensure
			one_more: count = old count + 1
			last_set: last = an_item
		end

	append_last (other: ET_TAIL_LIST [like item])
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
			if count = 0 and other.count > 0 then
					-- Take care of the dummy item at position 0 in `storage'.
				fixed_array.force (storage, other.first, 0)
			end
			j := count
			from i := 1 until i > nb loop
				j := j + 1
				fixed_array.force (storage, other.item (i), j)
				i := i + 1
			end
			count := j
		ensure
			new_count: count = old (count + other.count)
			new_last: last = old other.last
		end

	put (an_item: like item; i: INTEGER)
			-- Put `an_item' at index `i' in list.
		require
			an_item_not_void: an_item /= Void
			i_large_enough: i >= 1
			i_small_enough: i <= count
		do
			if i = 1 then
					-- Take care of the dummy item at position 0 in `storage'.
				storage.put (an_item, 0)
			end
			storage.put (an_item, i)
		ensure
			same_count: count = old count
			inserted: item (i) = an_item
		end

feature -- Removal

	remove_last
			-- Remove last item.
		require
			not_empty: not is_empty
		do
			if count = 1 then
					-- Take care of the dummy item at position 0 in `storage'.
				fixed_array.keep_head (storage, 0, count + 1)
			else
				fixed_array.keep_head (storage, count, count + 1)
			end
			count := count - 1
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
			j := i
			nb := count - 1
			from until j > nb loop
				storage.put (storage.item (j + 1), j)
				j := j + 1
			end
			if count = 1 then
					-- Take care of the dummy item at position 0 in `storage'.
				fixed_array.keep_head (storage, 0, count + 1)
			else
				fixed_array.keep_head (storage, count, count + 1)
			end
			count := count - 1
		ensure
			one_less: count = old count - 1
		end

	keep_first (n: INTEGER_32)
			-- Keep `n` first items in list.
		require
			valid_n: 0 <= n and n <= count
		do
			if n = 0 then
					-- Take care of the dummy item at position 0 in `storage'.
				fixed_array.keep_head (storage, 0, count + 1)
			else
				fixed_array.keep_head (storage, n + 1, count + 1)
			end
			count := n
		ensure
			new_count: count = n
		end

	wipe_out
			-- Remove all items.
		do
			if count > 0 then
				fixed_array.keep_head (storage, 0, count + 1)
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
				storage := fixed_array.aliased_resized_area (storage, nb + 1)
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
			i, nb: INTEGER
		do
			nb := count
			from i := 1 until i > nb loop
				an_action.call ([storage.item (i)])
				i := i + 1
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
			i, nb: INTEGER
		do
			if a_stop_request = Void then
				do_all (an_action)
			elseif not a_stop_request.item ([]) then
				nb := count
				from i := 1 until i > nb loop
					if a_stop_request.item ([]) then
						i := nb + 1
					else
						an_action.call ([storage.item (i)])
						i := i + 1
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
			i, nb: INTEGER
			l_item: like item
		do
			if a_stop_request = Void then
				do_if (an_action, a_test)
			elseif not a_stop_request.item ([]) then
				nb := count
				from i := 1 until i > nb loop
					if a_stop_request.item ([]) then
						i := nb + 1
					else
						l_item := storage.item (i)
						if a_test.item ([l_item]) then
							an_action.call ([l_item])
						end
						i := i + 1
					end
				end
			end
		end

	there_exists (a_test: FUNCTION [like item, BOOLEAN]): BOOLEAN
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

	for_all (a_test: FUNCTION [like item, BOOLEAN]): BOOLEAN
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
