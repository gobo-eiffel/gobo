note

	description:

		"Stacks (Last-In, First-Out) implemented with linked cells"

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 1999-2016, Eric Bezault and others"
	license: "MIT License"
	date: "$Date: 2010/10/06 $"
	revision: "$Revision: #10 $"

class DS_LINKED_STACK [G]

inherit

	DS_STACK [G]

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

	make
			-- Create an empty stack.
			-- Use `=' as comparison criterion.
		do
		ensure
			empty: is_empty
		end

	make_equal
			-- Create an empty stack.
			-- Use `equal' as comparison criterion.
		do
			create equality_tester
		ensure
			empty: is_empty
		end

	make_default
			-- Create an empty stack.
			-- Use `=' as comparison criterion.
		do
			make
		end

feature -- Status report

	has (v: G): BOOLEAN
			-- Does stack include `v'?
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
		local
			a_cell: like first_cell
		do
			a_cell := first_cell
			if attached equality_tester as l_tester then
				from
				until
					(a_cell = Void)
				loop
					if l_tester.test (a_cell.item, v) then
						Result := True
							-- Jump out of the loop.
						a_cell := Void
					else
						a_cell := a_cell.right
					end
				end
			else
					-- Use `=' as comparison criterion.
				from
				until
					(a_cell = Void)
				loop
					if a_cell.item = v then
						Result := True
							-- Jump out of the loop.
						a_cell := Void
					else
						a_cell := a_cell.right
					end
				end
			end
		end

	extendible (n: INTEGER): BOOLEAN
			-- May stack be extended with `n' items?
		do
			Result := True
		ensure then
			definition: Result = True
		end

feature -- Access

	item: G
			-- Item at top of stack
		do
			check not_empty: attached first_cell as l_first_cell then
				Result := l_first_cell.item
			end
		end

feature -- Measurement

	count: INTEGER
			-- Number of items in stack

	occurrences (v: G): INTEGER
			-- Number of times `v' appears in stack
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
		local
			a_cell: like first_cell
		do
			a_cell := first_cell
			if attached equality_tester as l_tester then
				from
				until
					(a_cell = Void)
				loop
					if l_tester.test (a_cell.item, v) then
						Result := Result + 1
					end
					a_cell := a_cell.right
				end
			else
					-- Use `=' as comparison criterion.
				from
				until
					(a_cell = Void)
				loop
					if a_cell.item = v then
						Result := Result + 1
					end
					a_cell := a_cell.right
				end
			end
		end

feature -- Duplication

	copy (other: like Current)
			-- Copy `other' to current stack.
		local
			a_cell, new_cell: attached like first_cell
			old_cell: like first_cell
		do
			if other /= Current then
				standard_copy (other)
				old_cell := other.first_cell
				if old_cell /= Void then
					from
						create a_cell.make (old_cell.item)
						first_cell := a_cell
						old_cell := old_cell.right
					until
						old_cell = Void
					loop
						create new_cell.make (old_cell.item)
						a_cell.put_right (new_cell)
						a_cell := new_cell
						old_cell := old_cell.right
					end
				end
			end
		end

feature -- Comparison

	is_equal (other: like Current): BOOLEAN
			-- Is current stack equal to `other'?
		local
			a_cell, other_cell: like first_cell
		do
			if Current = other then
				Result := True
			elseif ANY_.same_types (Current, other) and other.count = count then
				from
					a_cell := first_cell
					other_cell := other.first_cell
					Result := True
				until
					a_cell = Void or other_cell = Void
				loop
					if a_cell.item /= other_cell.item then
						Result := False
							-- Jump out of the loop.
						a_cell := Void
					else
						a_cell := a_cell.right
						other_cell := other_cell.right
					end
				end
			end
		end

feature -- Element change

	put, force (v: G)
			-- Push `v' on stack.
		local
			a_cell: attached like first_cell
		do
			create a_cell.make (v)
			if attached first_cell as l_first_cell then
				a_cell.put_right (l_first_cell)
			end
			first_cell := a_cell
			count := count + 1
		end

	replace (v: G)
			-- Replace top item by `v'.
		do
			check not_empty: attached first_cell as l_first_cell then
				l_first_cell.put (v)
			end
		end

	extend, append (other: DS_LINEAR [G])
			-- Add items of `other' to stack.
			-- Add `other.first' first, etc.
		local
			a_cell, new_first: attached like first_cell
			other_cursor: DS_LINEAR_CURSOR [G]
		do
			if not other.is_empty then
				other_cursor := other.new_cursor
				from
					other_cursor.start
					create a_cell.make (other_cursor.item)
					if attached first_cell as l_first_cell then
						a_cell.put_right (l_first_cell)
					end
					new_first := a_cell
					other_cursor.forth
				until
					other_cursor.after
				loop
					create a_cell.make (other_cursor.item)
					a_cell.put_right (new_first)
					new_first := a_cell
					other_cursor.forth
				end
				first_cell := new_first
				count := count + other.count
			end
		end

feature -- Removal

	remove
			-- Remove top item from stack.
		do
			check not_empty: attached first_cell as l_first_cell then
				first_cell := l_first_cell.right
				count := count - 1
			end
		end

	prune (n: INTEGER)
			-- Remove `n' items from stack.
		local
			i: INTEGER
			a_cell: like first_cell
		do
			if n = count then
				wipe_out
			else
				a_cell := first_cell
				from
					i := 1
				until
					i > n
				loop
					check not_empty: a_cell /= Void then
						a_cell := a_cell.right
					end
					i := i + 1
				end
				first_cell := a_cell
				count := count - n
			end
		end

	keep (n: INTEGER)
			-- Keep `n' items in stack.
		do
			prune (count - n)
		end

	wipe_out
			-- Remove all items from stack.
		do
			first_cell := Void
			count := 0
		end

feature -- Iteration

	do_all (an_action: PROCEDURE [G])
			-- Apply `an_action' to every item, from last to first inserted.
			-- (Semantics not guaranteed if `an_action' changes the structure.)
		local
			a_cell: like first_cell
		do
			a_cell := first_cell
			from
			until
				(a_cell = Void)
			loop
				an_action.call ([a_cell.item])
				a_cell := a_cell.right
			end
		end

	do_if (an_action: PROCEDURE [G]; a_test: FUNCTION [G, BOOLEAN])
			-- Apply `an_action' to every item that satisfies `a_test', from last to first inserted.
			-- (Semantics not guaranteed if `an_action' or `a_test' change the structure.)
		local
			a_cell: like first_cell
			l_item: G
		do
			a_cell := first_cell
			from
			until
				(a_cell = Void)
			loop
				l_item := a_cell.item
				if a_test.item ([l_item]) then
					an_action.call ([l_item])
				end
				a_cell := a_cell.right
			end
		end

	do_until (an_action: PROCEDURE [G]; a_condition: FUNCTION [G, BOOLEAN])
			-- Apply `an_action' to every item, from last to first inserted.
			-- (Semantics not guaranteed if `an_action' changes the structure.)
			--
			-- The iteration will be interrupted if `a_condition' starts returning True.
		local
			l_cell: like first_cell
			l_item: G
		do
			from
				l_cell := first_cell
			until
				l_cell = Void
			loop
				l_item := l_cell.item
				if a_condition.item ([l_item]) then
						-- Stop.
					l_cell := Void
				else
					an_action.call ([l_item])
					l_cell := l_cell.right
				end
			end
		end

	do_if_until (an_action: PROCEDURE [G]; a_test: FUNCTION [G, BOOLEAN]; a_condition: FUNCTION [G, BOOLEAN])
			-- Apply `an_action' to every item that satisfies `a_test', from last to first inserted.
			-- (Semantics not guaranteed if `an_action' or `a_test' change the structure.)
			--
			-- The iteration will be interrupted if `a_condition' starts returning True.
		local
			l_cell: like first_cell
			l_item: G
		do
			from
				l_cell := first_cell
			until
				l_cell = Void
			loop
				l_item := l_cell.item
				if a_condition.item ([l_item]) then
						-- Stop.
					l_cell := Void
				else
					if a_test.item ([l_item]) then
						an_action.call ([l_item])
					end
					l_cell := l_cell.right
				end
			end
		end

	there_exists (a_test: FUNCTION [G, BOOLEAN]): BOOLEAN
			-- Is `a_test' true for at least one item?
			-- (Semantics not guaranteed if `a_test' changes the structure.)
		local
			a_cell: like first_cell
		do
			a_cell := first_cell
			from
			until
				(a_cell = Void)
			loop
				if a_test.item ([a_cell.item]) then
					Result := True
						-- Jump out of the loop.
					a_cell := Void
				else
					a_cell := a_cell.right
				end
			end
		end

	for_all (a_test: FUNCTION [G, BOOLEAN]): BOOLEAN
			-- Is `a_test' true for all items?
			-- (Semantics not guaranteed if `a_test' changes the structure.)
		local
			a_cell: like first_cell
		do
			a_cell := first_cell
			Result := True
			from
			until
				(a_cell = Void)
			loop
				if not a_test.item ([a_cell.item]) then
					Result := False
						-- Jump out of the loop.
					a_cell := Void
				else
					a_cell := a_cell.right
				end
			end
		end

feature {DS_LINKED_STACK} -- Implementation

	first_cell: detachable DS_LINKABLE [G]
			-- First cell in stack

invariant

	first_cell: is_empty = (first_cell = Void)

end
