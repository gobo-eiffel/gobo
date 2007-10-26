indexing

	description:

		"Data structures that can be traversed and %
		%modified through integer access"

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 1999-2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

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
			put_last, force_last,
			extend_last, append_last
		end

feature -- Access

	infix "@", item (i: INTEGER): G is
			-- Item at index `i'
		require
			valid_index: 1 <= i and i <= count
		deferred
		end

	first: G is
			-- First item in container
		require
			not_empty: not is_empty
		deferred
		ensure
			definition: Result = item (1)
		end

	last: G is
			-- Last item in container
		require
			not_empty: not is_empty
		deferred
		ensure
			definition: Result = item (count)
		end

feature -- Element change

	put_first (v: G) is
			-- Add `v' to beginning of container.
		require
			extendible: extendible (1)
		deferred
		ensure
			one_more: count = old count + 1
			inserted: first = v
		end

	put_last (v: G) is
			-- Add `v' to end of container.
		deferred
		ensure then
			one_more: count = old count + 1
			inserted: last = v
		end

	put (v: G; i: INTEGER) is
			-- Add `v' at `i'-th position.
		require
			extendible: extendible (1)
			valid_index: 1 <= i and i <= (count + 1)
		deferred
		ensure
			one_more: count = old count + 1
			inserted: item (i) = v
		end

	force_first (v: G) is
			-- Add `v' to beginning of container.
		deferred
		ensure
			one_more: count = old count + 1
			inserted: first = v
		end

	force_last (v: G) is
			-- Add `v' to end of container.
		deferred
		ensure then
			one_more: count = old count + 1
			inserted: last = v
		end

	force (v: G; i: INTEGER) is
			-- Add `v' at `i'-th position.
		require
			valid_index: 1 <= i and i <= (count + 1)
		deferred
		ensure
			one_more: count = old count + 1
			inserted: item (i) = v
		end

	replace (v: G; i: INTEGER) is
			-- Replace item at `i'-th position by `v'.
		require
			valid_index: 1 <= i and i <= count
		deferred
		ensure
			same_count: count = old count
			replaced: item (i) = v
		end

	swap (i, j: INTEGER) is
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

	extend_first (other: DS_LINEAR [G]) is
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

	extend_last (other: DS_LINEAR [G]) is
			-- Add items of `other' to end of container.
			-- Keep items of `other' in the same order.
		deferred
		ensure then
			new_count: count = old count + other.count
			same_order: (not other.is_empty) implies (item (old count + 1) = other.first)
		end

	extend (other: DS_LINEAR [G]; i: INTEGER) is
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

	append_first (other: DS_LINEAR [G]) is
			-- Add items of `other' to beginning of container.
			-- Keep items of `other' in the same order.
		require
			other_not_void: other /= Void
		deferred
		ensure
			new_count: count = old count + other.count
			same_order: (not other.is_empty) implies (first = other.first)
		end

	append_last (other: DS_LINEAR [G]) is
			-- Add items of `other' to end of container.
			-- Keep items of `other' in the same order.
		deferred
		ensure then
			new_count: count = old count + other.count
			same_order: (not other.is_empty) implies (item (old count + 1) = other.first)
		end

	append (other: DS_LINEAR [G]; i: INTEGER) is
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

	remove_first is
			-- Remove first item from container.
		require
			not_empty: not is_empty
		deferred
		ensure
			one_less: count = old count - 1
		end

	remove_last is
			-- Remove last item from container.
		require
			not_empty: not is_empty
		deferred
		ensure
			one_less: count = old count - 1
		end

	remove (i: INTEGER) is
			-- Remove item at `i'-th position.
		require
			not_empty: not is_empty
			valid_index: 1 <= i and i <= count
		deferred
		ensure
			one_less: count = old count - 1
		end

	prune_first (n: INTEGER) is
			-- Remove `n' first items from container.
		require
			valid_n: 0 <= n and n <= count
		deferred
		ensure
			new_count: count = old count - n
		end

	prune_last (n: INTEGER) is
			-- Remove `n' last items from container.
		require
			valid_n: 0 <= n and n <= count
		deferred
		ensure
			new_count: count = old count - n
		end

	prune (n: INTEGER; i: INTEGER) is
			-- Remove `n' items at and after `i'-th position.
		require
			valid_index: 1 <= i and i <= count
			valid_n: 0 <= n and n <= (count - i + 1)
		deferred
		ensure
			new_count: count = old count - n
		end

	keep_first (n: INTEGER) is
			-- Keep `n' first items in container.
		require
			valid_n: 0 <= n and n <= count
		deferred
		ensure
			new_count: count = n
		end

	keep_last (n: INTEGER) is
			-- Keep `n' last items in container.
		require
			valid_n: 0 <= n and n <= count
		deferred
		ensure
			new_count: count = n
		end

feature -- Iteration

	do_all (an_action: PROCEDURE [ANY, TUPLE [G]]) is
			-- Apply `an_action' to every item, from first to last.
			-- (Semantics not guaranteed if `an_action' changes the structure.)
		require
			an_action_not_void: an_action /= Void
		local
			i: INTEGER
		do
			from i := 1 until i > count loop
				an_action.call ([item (i)])
				i := i + 1
			end
		end

	do_all_with_index (an_action: PROCEDURE [ANY, TUPLE [G, INTEGER]]) is
			-- Apply `an_action' to every item, from first to last.
			-- `an_action' receives the item and its index.
			-- (Semantics not guaranteed if `an_action' changes the structure.)
		require
			an_action_not_void: an_action /= Void
		local
			i: INTEGER
		do
			from i := 1 until i > count loop
				an_action.call ([item (i), i])
				i := i + 1
			end
		end

	do_if (an_action: PROCEDURE [ANY, TUPLE [G]]; a_test: FUNCTION [ANY, TUPLE [G], BOOLEAN]) is
			-- Apply `an_action' to every item that satisfies `a_test', from first to last.
			-- (Semantics not guaranteed if `an_action' or `a_test' change the structure.)
		require
			an_action_not_void: an_action /= Void
			a_test_not_void: a_test /= Void
		local
			i: INTEGER
			l_item: G
		do
			from i := 1 until i > count loop
				l_item := item (i)
				if a_test.item ([l_item]) then
					an_action.call ([l_item])
				end
				i := i + 1
			end
		end

	do_if_with_index (an_action: PROCEDURE [ANY, TUPLE [G, INTEGER]]; a_test: FUNCTION [ANY, TUPLE [G, INTEGER], BOOLEAN]) is
			-- Apply `an_action' to every item that satisfies `a_test', from first to last.
			-- `an_action' and `a_test' receive the item and its index.
			-- (Semantics not guaranteed if `an_action' or `a_test' change the structure.)
		require
			an_action_not_void: an_action /= Void
			a_test_not_void: a_test /= Void
		local
			i: INTEGER
			l_item: G
		do
			from i := 1 until i > count loop
				l_item := item (i)
				if a_test.item ([l_item, i]) then
					an_action.call ([l_item, i])
				end
				i := i + 1
			end
		end

	there_exists (a_test: FUNCTION [ANY, TUPLE [G], BOOLEAN]): BOOLEAN is
			-- Is `a_test' true for at least one item?
			-- (Semantics not guaranteed if `a_test' changes the structure.)
		require
			a_test_not_void: a_test /= Void
		local
			i: INTEGER
		do
			from i := 1 until i > count loop
				if a_test.item ([item (i)]) then
					Result := True
					i := count + 1 -- Jump out of the loop.
				else
					i := i + 1
				end
			end
		end

	for_all (a_test: FUNCTION [ANY, TUPLE [G], BOOLEAN]): BOOLEAN is
			-- Is `a_test' true for all items?
			-- (Semantics not guaranteed if `a_test' changes the structure.)
		require
			a_test_not_void: a_test /= Void
		local
			i: INTEGER
		do
			Result := True
			from i := 1 until i > count loop
				if not a_test.item ([item (i)]) then
					Result := False
					i := count + 1 -- Jump out of the loop.
				else
					i := i + 1
				end
			end
		end

end
