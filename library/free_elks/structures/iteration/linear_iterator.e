indexing

	description:
		"Objects that are able to iterate over linear structures"
	legal: "See notice at end of class."

	status: "See notice at end of class."
	names: iterators, iteration, linear_iterators,
			linear_iteration;
	date: "$Date$"
	revision: "$Revision$"

class LINEAR_ITERATOR [G] inherit

	ITERATOR [G]
		redefine
			target, set
		end
		
create
	set
	
feature -- Initialization

	set (s: like target) is
			-- Make `s' the new target of iterations.
		do
			Precursor (s)
			create internal_item_tuple
		end

feature -- Access

	item: G is
			-- The item at cursor position in `target'
		require
			traversable_exists: target /= Void
		do
			Result := target.item
		end
		
	item_tuple: TUPLE [G] is
			-- Tuple containing a single element,
			-- the item at cursor position in `target'''
		do
			internal_item_tuple.put (target.item, 1)
			Result := internal_item_tuple			
		end
	
		
	target: LINEAR [G]
			-- The structure to which iteration features will apply.
	
feature -- Cursor movement

	start is
			-- Move to first position of `target'.
		do
			target.start
		end

	forth is
			-- Move to next position of `target'.
		do
			target.forth
		end

	off: BOOLEAN is
			-- Is position of `target' off?
		do
			Result := target.off
		end

	exhausted: BOOLEAN is
			-- Is `target' exhausted?
		do
			Result := target.exhausted
		end

feature -- Iteration

	do_while (action: PROCEDURE [ANY, TUPLE [G]]; test: FUNCTION [ANY, TUPLE [G], BOOLEAN]) is
			-- Apply `action' to every item of `target' up to
			-- and including first one not satisfying `test'.
			-- (from the `start' of `target')
		do
			start
			continue_while (action, test)
		ensure then
			finished: not exhausted implies not test.item (item_tuple)
		end

	continue_while (action: PROCEDURE [ANY, TUPLE [G]]; test: FUNCTION [ANY, TUPLE [G], BOOLEAN]) is
			-- Apply `action' to every item of `target' up to
			-- and including first one not satisfying `test'
			-- (from the current position of `target').
		require else
			invariant_satisfied: invariant_value
		do
			from
				if not exhausted then action.call (item_tuple) end
			invariant
				invariant_value
			until
				exhausted or else not test.item (item_tuple)
			loop
				forth
				if not exhausted then action.call (item_tuple) end
			end
		ensure then
			finished: not exhausted implies not test.item (item_tuple)
		end

	while_do (action: PROCEDURE [ANY, TUPLE [G]]; test: FUNCTION [ANY, TUPLE [G], BOOLEAN]) is
			-- Apply `action' to every item of `target' up to
			-- but excluding first one not satisfying `test'.
			-- (Apply to full list if all items satisfy `test'.)
		do
			start
			while_continue (action, test)
		ensure then
			finished: not exhausted implies not test.item (item_tuple)
		end

	while_continue (action: PROCEDURE [ANY, TUPLE [G]]; test: FUNCTION [ANY, TUPLE [G], BOOLEAN]) is
			-- Apply `action' to every item of `target' up to
			-- but excluding first one not satisfying `test'.
		do
			from
			invariant
				invariant_value
			until
				exhausted or else not test.item (item_tuple)
			loop
				action.call (item_tuple)
				forth
			end
		ensure
			finished: not exhausted implies not test.item (item_tuple)
		end

	until_do (action: PROCEDURE [ANY, TUPLE [G]]; test: FUNCTION [ANY, TUPLE [G], BOOLEAN]) is
			-- Apply `action' to every item of `target' up to
			-- but excluding first one satisfying `test'.
			-- (Apply to full list if no item satisfies `test'.)
		do
			start
			until_continue (action, test)
		ensure then
			achieved: not exhausted implies test.item (item_tuple)
		end

	until_continue (action: PROCEDURE [ANY, TUPLE [G]]; test: FUNCTION [ANY, TUPLE [G], BOOLEAN]) is
			-- Apply `action' to every item of `target' from current
			-- position, up to but excluding first one satisfying `test'.
		require
			invariant_satisfied: invariant_value
		do
			from
			invariant
				invariant_value
			until
				exhausted or else test.item (item_tuple)
			loop
				action.call ([item])
				forth
			end
		ensure
			achieved: exhausted or else test.item (item_tuple)
			invariant_satisfied: invariant_value
		end

	do_until (action: PROCEDURE [ANY, TUPLE [G]]; test: FUNCTION [ANY, TUPLE [G], BOOLEAN]) is
			-- Apply `action' to every item of `target' up to
			-- and including first one satisfying `test'.
		do
			start
			continue_until (action, test)
		ensure then
			achieved: not exhausted implies test.item (item_tuple)
		end

	continue_until (action: PROCEDURE [ANY, TUPLE [G]]; test: FUNCTION [ANY, TUPLE [G], BOOLEAN])is
			-- Apply `action' to every item of `target' up to
			-- and including first one satisfying `test'.
			-- (from the current position of `target').
		require
			invariant_satisfied: invariant_value
		do
			from
				if not exhausted then action.call (item_tuple) end
			invariant
				invariant_value
			until
				exhausted or else test.item (item_tuple)
			loop
				forth 
				if not exhausted then action.call (item_tuple) end
			end
		ensure then
			achieved: not exhausted implies test.item (item_tuple)
		end

	search (test: FUNCTION [ANY, TUPLE [G], BOOLEAN]; b: BOOLEAN) is
			-- Search the first item of `target' for which `test'
			-- has the same value as `b' (both true or both false).
		do
			start
			continue_search (test, b)
		end

	continue_search (test: FUNCTION [ANY, TUPLE [G], BOOLEAN]; b: BOOLEAN) is
			-- Search the first item of `target'
			-- satisfying: `test' equals to `b'
			-- (from the current position of `target').
		do
			from
			invariant
				invariant_value
			until
				exhausted or else (b = test.item (item_tuple))
			loop
				forth
			end
		ensure then
			found: not exhausted = (b = test.item (item_tuple))
		end

	do_for (action: PROCEDURE [ANY, TUPLE [G]]; i, n, k: INTEGER) is
			-- Apply `action' to every `k'-th item,
			-- `n' times if possible, starting from `i'-th.
		require
			valid_start: i >= 1
			valid_repetition: n >= 0
			valid_skip: k >= 1
		local
			j: INTEGER
		do
			from
				start
				j := 1
			invariant
				j >= 1 and j <= i
			variant
				i - j
			until
				exhausted or else j = i
			loop
				forth
				j := j + 1
			end
			continue_for (action, n, k)
		end

	continue_for (action: PROCEDURE [ANY, TUPLE [G]]; n, k: INTEGER) is
			-- Apply `action' to every `k'-th item,
			-- `n' times if possible.
		require
			valid_repetition: n >= 0
			valid_skip: k >= 1
		local
			i, j: INTEGER
		do
			from
			invariant
				i >= 0 and i <= n
			variant
				n - i
			until
				exhausted or else i = n
			loop
				action.call (item_tuple)
				i := i + 1
				from
					j := 0
				invariant
					j >= 0 and j <= k
				variant
					k - j
				until
					exhausted or else j = k
				loop
					forth 
					j := j + 1
				end
			end
		end

	for_all (test: FUNCTION [ANY, TUPLE [G], BOOLEAN]): BOOLEAN is
			-- Does `test' return true for
			-- all items of `target'?
		do
			search (test, False)
			Result := exhausted
		end

	there_exists (test: FUNCTION [ANY, TUPLE [G], BOOLEAN]): BOOLEAN is
			-- Does `test' return true for
			-- at least one item of `target'?
		do
			search (test, True)
			Result := not exhausted
		end
		
feature -- Implementation

	internal_item_tuple: TUPLE [G]
			-- Field holding the last item of `target'

invariant

	target_exists: target /= Void
	item_tuple_exists: item_tuple /= Void
	internal_item_tuple_exists: internal_item_tuple /= Void

indexing
	library:	"EiffelBase: Library of reusable components for Eiffel."
	copyright:	"Copyright (c) 1984-2006, Eiffel Software and others"
	license:	"Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			 Eiffel Software
			 356 Storke Road, Goleta, CA 93117 USA
			 Telephone 805-685-1006, Fax 805-685-6869
			 Website http://www.eiffel.com
			 Customer support http://support.eiffel.com
		]"






end -- LINEAR_ITERATOR
