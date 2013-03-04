note
	description: "Objects that are able to iterate over linear structures"
	library: "Free implementation of ELKS library"
	legal: "See notice at end of class."
	status: "See notice at end of class."
	names: iterators, iteration, linear_iterators, linear_iteration;
	date: "$Date: 2012-07-23 23:02:19 +0200 (Mon, 23 Jul 2012) $"
	revision: "$Revision: 567 $"

class LINEAR_ITERATOR [G] inherit

	ITERATOR [G]
		redefine
			target, set
		end

create
	set

feature -- Initialization

	set (s: like target)
			-- Make `s' the new target of iterations.
		do
			target := s
		end

feature -- Access

	item: G
			-- The item at cursor position in `target'
		require
			not_off: not target.off
		do
			Result := target.item
		end

	item_tuple: TUPLE [G]
			-- Tuple containing a single element,
			-- the item at cursor position in `target'''
		require
			not_off: not target.off
		do
			Result := [target.item]
		ensure
			item_tuple_attached: Result /= Void
		end

	target: LINEAR [G]
			-- The structure to which iteration features will apply.

feature -- Cursor movement

	start
			-- Move to first position of `target'.
		do
			target.start
		end

	forth
			-- Move to next position of `target'.
		do
			target.forth
		end

	off: BOOLEAN
			-- Is position of `target' off?
		do
			Result := target.off
		end

	exhausted: BOOLEAN
			-- Is `target' exhausted?
		do
			Result := target.exhausted
		end

feature -- Iteration

	do_while (action: PROCEDURE [ANY, TUPLE [G]]; test: FUNCTION [ANY, TUPLE [G], BOOLEAN])
			-- Apply `action' to every item of `target' up to
			-- and including first one not satisfying `test'.
			-- (from the `start' of `target')
		do
			start
			continue_while (action, test)
		ensure then
			finished: not exhausted implies not test.item ([target.item])
		end

	continue_while (action: PROCEDURE [ANY, TUPLE [G]]; test: FUNCTION [ANY, TUPLE [G], BOOLEAN])
			-- Apply `action' to every item of `target' up to
			-- and including first one not satisfying `test'
			-- (from the current position of `target').
		require else
			invariant_satisfied: invariant_value
		do
			from
				if not exhausted then action.call ([target.item]) end
			invariant
				invariant_value
			until
				exhausted or else not test.item ([target.item])
			loop
				forth
				if not exhausted then action.call ([target.item]) end
			end
		ensure then
			finished: not exhausted implies not test.item ([target.item])
		end

	while_do (action: PROCEDURE [ANY, TUPLE [G]]; test: FUNCTION [ANY, TUPLE [G], BOOLEAN])
			-- Apply `action' to every item of `target' up to
			-- but excluding first one not satisfying `test'.
			-- (Apply to full list if all items satisfy `test'.)
		do
			start
			while_continue (action, test)
		ensure then
			finished: not exhausted implies not test.item ([target.item])
		end

	while_continue (action: PROCEDURE [ANY, TUPLE [G]]; test: FUNCTION [ANY, TUPLE [G], BOOLEAN])
			-- Apply `action' to every item of `target' up to
			-- but excluding first one not satisfying `test'.
		do
			from
			invariant
				invariant_value
			until
				exhausted or else not test.item ([target.item])
			loop
				action.call ([target.item])
				forth
			end
		ensure
			finished: not exhausted implies not test.item ([target.item])
		end

	until_do (action: PROCEDURE [ANY, TUPLE [G]]; test: FUNCTION [ANY, TUPLE [G], BOOLEAN])
			-- Apply `action' to every item of `target' up to
			-- but excluding first one satisfying `test'.
			-- (Apply to full list if no item satisfies `test'.)
		do
			start
			until_continue (action, test)
		ensure then
			achieved: not exhausted implies test.item ([target.item])
		end

	until_continue (action: PROCEDURE [ANY, TUPLE [G]]; test: FUNCTION [ANY, TUPLE [G], BOOLEAN])
			-- Apply `action' to every item of `target' from current
			-- position, up to but excluding first one satisfying `test'.
		require
			invariant_satisfied: invariant_value
		do
			from
			invariant
				invariant_value
			until
				exhausted or else test.item ([target.item])
			loop
				action.call ([item])
				forth
			end
		ensure
			achieved: exhausted or else test.item ([target.item])
			invariant_satisfied: invariant_value
		end

	do_until (action: PROCEDURE [ANY, TUPLE [G]]; test: FUNCTION [ANY, TUPLE [G], BOOLEAN])
			-- Apply `action' to every item of `target' up to
			-- and including first one satisfying `test'.
		do
			start
			continue_until (action, test)
		ensure then
			achieved: not exhausted implies test.item ([target.item])
		end

	continue_until (action: PROCEDURE [ANY, TUPLE [G]]; test: FUNCTION [ANY, TUPLE [G], BOOLEAN])
			-- Apply `action' to every item of `target' up to
			-- and including first one satisfying `test'.
			-- (from the current position of `target').
		require
			invariant_satisfied: invariant_value
		do
			from
				if not exhausted then action.call ([target.item]) end
			invariant
				invariant_value
			until
				exhausted or else test.item ([target.item])
			loop
				forth
				if not exhausted then action.call ([target.item]) end
			end
		ensure then
			achieved: not exhausted implies test.item ([target.item])
		end

	search (test: FUNCTION [ANY, TUPLE [G], BOOLEAN]; b: BOOLEAN)
			-- Search the first item of `target' for which `test'
			-- has the same value as `b' (both true or both false).
		do
			start
			continue_search (test, b)
		end

	continue_search (test: FUNCTION [ANY, TUPLE [G], BOOLEAN]; b: BOOLEAN)
			-- Search the first item of `target'
			-- satisfying: `test' equals to `b'
			-- (from the current position of `target').
		do
			from
			invariant
				invariant_value
			until
				exhausted or else (b = test.item ([target.item]))
			loop
				forth
			end
		ensure then
			found: not exhausted = (b = test.item ([target.item]))
		end

	do_for (action: PROCEDURE [ANY, TUPLE [G]]; i, n, k: INTEGER)
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
			until
				exhausted or else j = i
			loop
				forth
				j := j + 1
			variant
				i - j
			end
			continue_for (action, n, k)
		end

	continue_for (action: PROCEDURE [ANY, TUPLE [G]]; n, k: INTEGER)
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
			until
				exhausted or else i = n
			loop
				action.call ([target.item])
				i := i + 1
				from
					j := 0
				invariant
					j >= 0 and j <= k
				until
					exhausted or else j = k
				loop
					forth
					j := j + 1
				variant
					k - j
				end
			variant
				n - i
			end
		end

	for_all (test: FUNCTION [ANY, TUPLE [G], BOOLEAN]): BOOLEAN
			-- Does `test' return true for
			-- all items of `target'?
		do
			search (test, False)
			Result := exhausted
		end

	there_exists (test: FUNCTION [ANY, TUPLE [G], BOOLEAN]): BOOLEAN
			-- Does `test' return true for
			-- at least one item of `target'?
		do
			search (test, True)
			Result := not exhausted
		end

invariant

	target_exists: target /= Void

note
	copyright: "Copyright (c) 1984-2012, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
