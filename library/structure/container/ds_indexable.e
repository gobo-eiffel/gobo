note

	description:

		"Data structures that can be traversed and %
		%modified through integer access"

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 1999-2010, Eric Bezault and others"
	license: "MIT License"
	date: "$Date: 2010/10/06 $"
	revision: "$Revision: #11 $"

deferred class DS_INDEXABLE [G]

inherit

	DS_SORTABLE [G]

	DS_EXTENDIBLE [G]
		rename
			put as put_last,
			force as force_last,
			extend as extend_last,
			append as append_last
		redefine
			put_last,
			force_last,
			extend_last,
			append_last,
			do_until,
			do_if_until
		end

feature -- Access

	at alias "@", item (i: INTEGER): G
			-- Item at index `i'
		require
			valid_index: 1 <= i and i <= count
		deferred
		end

	first: G
			-- First item in container
		require
			not_empty: not is_empty
		deferred
		ensure
			definition: Result = item (1)
		end

	last: G
			-- Last item in container
		require
			not_empty: not is_empty
		deferred
		ensure
			definition: Result = item (count)
		end

feature -- Element change

	put_first (v: G)
			-- Add `v' to beginning of container.
		require
			extendible: extendible (1)
		deferred
		ensure
			one_more: count = old count + 1
			inserted: first = v
		end

	put_last (v: G)
			-- Add `v' to end of container.
		deferred
		ensure then
			one_more: count = old count + 1
			inserted: last = v
		end

	put (v: G; i: INTEGER)
			-- Add `v' at `i'-th position.
		require
			extendible: extendible (1)
			valid_index: 1 <= i and i <= (count + 1)
		deferred
		ensure
			one_more: count = old count + 1
			inserted: item (i) = v
		end

	force_first (v: G)
			-- Add `v' to beginning of container.
		deferred
		ensure
			one_more: count = old count + 1
			inserted: first = v
		end

	force_last (v: G)
			-- Add `v' to end of container.
		deferred
		ensure then
			one_more: count = old count + 1
			inserted: last = v
		end

	force (v: G; i: INTEGER)
			-- Add `v' at `i'-th position.
		require
			valid_index: 1 <= i and i <= (count + 1)
		deferred
		ensure
			one_more: count = old count + 1
			inserted: item (i) = v
		end

	replace (v: G; i: INTEGER)
			-- Replace item at `i'-th position by `v'.
		require
			valid_index: 1 <= i and i <= count
		deferred
		ensure
			same_count: count = old count
			replaced: item (i) = v
		end

	swap (i, j: INTEGER)
			-- Exchange items at indexes `i' and `j'.
		require
			valid_i: 1 <= i and i <= count
			valid_j: 1 <= j and j <= count
		local
			v: G
		do
			v := item (i)
			replace (item (j), i)
			replace (v, j)
		ensure
			same_count: count = old count
			new_i: item (i) = old item (j)
			new_j: item (j) = old item (i)
		end

	extend_first (other: DS_LINEAR [G])
			-- Add items of `other' to beginning of container.
			-- Keep items of `other' in the same order.
		require
			other_not_void: other /= Void
			extendible: extendible (other.count)
		deferred
		ensure
			new_count: count = old count + other.count
			same_order: (not other.is_empty) implies (first = other.first)
		end

	extend_last (other: DS_LINEAR [G])
			-- Add items of `other' to end of container.
			-- Keep items of `other' in the same order.
		deferred
		ensure then
			new_count: count = old count + other.count
			same_order: (not other.is_empty) implies (item (old count + 1) = other.first)
		end

	extend (other: DS_LINEAR [G]; i: INTEGER)
			-- Add items of `other' at `i'-th position.
			-- Keep items of `other' in the same order.
		require
			other_not_void: other /= Void
			extendible: extendible (other.count)
			valid_index: 1 <= i and i <= (count + 1)
		deferred
		ensure
			new_count: count = old count + other.count
			same_order: (not other.is_empty) implies (item (i) = other.first)
		end

	append_first (other: DS_LINEAR [G])
			-- Add items of `other' to beginning of container.
			-- Keep items of `other' in the same order.
		require
			other_not_void: other /= Void
		deferred
		ensure
			new_count: count = old count + other.count
			same_order: (not other.is_empty) implies (first = other.first)
		end

	append_last (other: DS_LINEAR [G])
			-- Add items of `other' to end of container.
			-- Keep items of `other' in the same order.
		deferred
		ensure then
			new_count: count = old count + other.count
			same_order: (not other.is_empty) implies (item (old count + 1) = other.first)
		end

	append (other: DS_LINEAR [G]; i: INTEGER)
			-- Add items of `other' at `i'-th position.
			-- Keep items of `other' in the same order.
		require
			other_not_void: other /= Void
			valid_index: 1 <= i and i <= (count + 1)
		deferred
		ensure
			new_count: count = old count + other.count
			same_order: (not other.is_empty) implies (item (i) = other.first)
		end

feature -- Removal

	remove_first
			-- Remove first item from container.
		require
			not_empty: not is_empty
		deferred
		ensure
			one_less: count = old count - 1
		end

	remove_last
			-- Remove last item from container.
		require
			not_empty: not is_empty
		deferred
		ensure
			one_less: count = old count - 1
		end

	remove (i: INTEGER)
			-- Remove item at `i'-th position.
		require
			not_empty: not is_empty
			valid_index: 1 <= i and i <= count
		deferred
		ensure
			one_less: count = old count - 1
		end

	prune_first (n: INTEGER)
			-- Remove `n' first items from container.
		require
			valid_n: 0 <= n and n <= count
		deferred
		ensure
			new_count: count = old count - n
		end

	prune_last (n: INTEGER)
			-- Remove `n' last items from container.
		require
			valid_n: 0 <= n and n <= count
		deferred
		ensure
			new_count: count = old count - n
		end

	prune (n: INTEGER; i: INTEGER)
			-- Remove `n' items at and after `i'-th position.
		require
			valid_index: 1 <= i and i <= count
			valid_n: 0 <= n and n <= (count - i + 1)
		deferred
		ensure
			new_count: count = old count - n
		end

	keep_first (n: INTEGER)
			-- Keep `n' first items in container.
		require
			valid_n: 0 <= n and n <= count
		deferred
		ensure
			new_count: count = n
		end

	keep_last (n: INTEGER)
			-- Keep `n' last items in container.
		require
			valid_n: 0 <= n and n <= count
		deferred
		ensure
			new_count: count = n
		end

feature -- Iteration

	do_all (an_action: PROCEDURE [ANY, TUPLE [G]])
			-- Apply `an_action' to every item, from first to last.
			-- (Semantics not guaranteed if `an_action' changes the structure.)
		local
			i: INTEGER
		do
			from
				i := 1
			until
				i > count
			loop
				an_action.call ([item (i)])
				i := i + 1
			end
		end

	do_all_with_index (an_action: PROCEDURE [ANY, TUPLE [G, INTEGER]])
			-- Apply `an_action' to every item, from first to last.
			-- `an_action' receives the item and its index.
			-- (Semantics not guaranteed if `an_action' changes the structure.)
		local
			i: INTEGER
		do
			from
				i := 1
			until
				i > count
			loop
				an_action.call ([item (i), i])
				i := i + 1
			end
		end

	do_if (an_action: PROCEDURE [ANY, TUPLE [G]]; a_test: FUNCTION [ANY, TUPLE [G], BOOLEAN])
			-- Apply `an_action' to every item that satisfies `a_test', from first to last.
			-- (Semantics not guaranteed if `an_action' or `a_test' change the structure.)
		local
			i: INTEGER
			l_item: G
		do
			from
				i := 1
			until
				i > count
			loop
				l_item := item (i)
				if a_test.item ([l_item]) then
					an_action.call ([l_item])
				end
				i := i + 1
			end
		end

	do_if_with_index (an_action: PROCEDURE [ANY, TUPLE [G, INTEGER]]; a_test: FUNCTION [ANY, TUPLE [G, INTEGER], BOOLEAN])
			-- Apply `an_action' to every item that satisfies `a_test', from first to last.
			-- `an_action' and `a_test' receive the item and its index.
			-- (Semantics not guaranteed if `an_action' or `a_test' change the structure.)
		local
			i: INTEGER
			l_item: G
		do
			from
				i := 1
			until
				i > count
			loop
				l_item := item (i)
				if a_test.item ([l_item, i]) then
					an_action.call ([l_item, i])
				end
				i := i + 1
			end
		end

	do_until (an_action: PROCEDURE [ANY, TUPLE [G]]; a_condition: FUNCTION [ANY, TUPLE [G], BOOLEAN])
			-- Apply `an_action' to every item, from first to last.
			-- (Semantics not guaranteed if `an_action' changes the structure.)
			--
			-- The iteration will be interrupted if `a_condition' starts returning True.
		local
			i: INTEGER
			l_item: G
		do
			from
				i := 1
			invariant
				i_large_enough: i >= 1
				i_small_enough: i <= count + 1
			variant
				index: count - i + 1
			until
				i > count
			loop
				l_item := item (i)
				if a_condition.item ([l_item]) then
						-- Stop.
					i := count + 1
				else
					an_action.call ([l_item])
					i := i + 1
				end
			end
		end

	do_if_until (an_action: PROCEDURE [ANY, TUPLE [G]]; a_test: FUNCTION [ANY, TUPLE [G], BOOLEAN]; a_condition: FUNCTION [ANY, TUPLE [G], BOOLEAN])
			-- Apply `an_action' to every item that satisfies `a_test', from first to last.
			-- (Semantics not guaranteed if `an_action' or `a_test' change the structure.)
			--
			-- The iteration will be interrupted if `a_condition' starts returning True.
		local
			i: INTEGER
			l_item: G
		do
			from
				i := 1
			invariant
				i_large_enough: i >= 1
				i_small_enough: i <= count + 1
			variant
				index: count - i + 1
			until
				i > count
			loop
				l_item := item (i)
				if a_condition.item ([l_item]) then
						-- Stop.
					i := count
				elseif a_test.item ([l_item]) then
					an_action.call ([l_item])
				end
				i := i + 1
			end
		end

	there_exists (a_test: FUNCTION [ANY, TUPLE [G], BOOLEAN]): BOOLEAN
			-- Is `a_test' true for at least one item?
			-- (Semantics not guaranteed if `a_test' changes the structure.)
		local
			i: INTEGER
		do
			from
				i := 1
			until
				i > count
			loop
				if a_test.item ([item (i)]) then
					Result := True
						-- Jump out of the loop.
					i := count + 1
				else
					i := i + 1
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
				i := 1
			until
				i > count
			loop
				if not a_test.item ([item (i)]) then
					Result := False
						-- Jump out of the loop.
					i := count + 1
				else
					i := i + 1
				end
			end
		end

end
