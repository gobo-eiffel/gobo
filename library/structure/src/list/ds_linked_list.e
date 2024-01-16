note

	description:

		"Lists implemented with linked cells"

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 1999-2016, Eric Bezault and others"
	license: "MIT License"

class DS_LINKED_LIST [G]

inherit

	DS_LIST [G]
		redefine
			has,
			occurrences,
			swap,
			do_all,
			do_if,
			do_all_with_index,
			do_if_with_index,
			do_until,
			do_if_until,
			there_exists,
			for_all
		end

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
	make_from_linear,
	make_from_array,
	make_default

feature {NONE} -- Initialization

	make
			-- Create an empty list.
			-- Use `=' as comparison criterion.
		do
			set_internal_cursor (new_cursor)
		ensure
			empty: is_empty
			before: before
		end

	make_equal
			-- Create an empty list.
			-- Use `equal' as comparison criterion.
		do
			set_internal_cursor (new_cursor)
			create equality_tester
		ensure
			empty: is_empty
			before: before
		end

	make_from_linear (other: DS_LINEAR [G])
			-- Create a new list and fill it with items of `other'.
			-- Use `=' as comparison criterion.
		require
			other_not_void: other /= Void
			not_same: other /= Current
		local
			new_cell, new_last: attached like first_cell
			other_cursor: DS_LINEAR_CURSOR [G]
		do
			make
			if not other.is_empty then
				from
					other_cursor := other.new_cursor
					other_cursor.start
					create new_last.make (other_cursor.item)
					first_cell := new_last
					other_cursor.forth
				until
					other_cursor.after
				loop
					create new_cell.make (other_cursor.item)
					new_last.put_right (new_cell)
					new_last := new_cell
					other_cursor.forth
				end
				last_cell := new_last
				count := other.count
			end
		ensure
			count_set: count = other.count
			before: before
		end

	make_from_array (other: ARRAY [G])
			-- Create a new list and fill it with items of `other'.
			-- Use `=' as comparison criterion.
		require
			other_not_void: other /= Void
		local
			new_cell, new_last: attached like first_cell
			i, nb: INTEGER
		do
			make
			count := other.count
			if count /= 0 then
				from
					i := other.lower
					nb := other.upper
					create new_last.make (other.item (i))
					first_cell := new_last
					i := i + 1
				until
					i > nb
				loop
					create new_cell.make (other.item (i))
					new_last.put_right (new_cell)
					new_last := new_cell
					i := i + 1
				end
				last_cell := new_last
			end
		ensure
			count_set: count = other.count
			before: before
		end

	make_default
			-- Create an empty list.
			-- Use `=' as comparison criterion.
		do
			make
		ensure then
			before: before
		end

feature -- Access

	at alias "@", item (i: INTEGER): G
			-- Item at index `i'
			-- (Performance: O(i).)
		local
			a_cell: like first_cell
			j: INTEGER
		do
			a_cell := first_cell
			from
				j := 1
			until
				j = i
			loop
				check valid_index: a_cell /= Void then
					a_cell := a_cell.right
				end
				j := j + 1
			end
			check valid_index: a_cell /= Void then
				Result := a_cell.item
			end
		end

	first: G
			-- First item in list
			-- (Performance: O(1).)
		do
			check not_empty: attached first_cell as l_first_cell then
				Result := l_first_cell.item
			end
		end

	last: G
			-- Last item in list
			-- (Performance: O(1).)
		do
			check not_empty: attached last_cell as l_last_cell then
				Result := l_last_cell.item
			end
		end

	new_cursor: DS_LINKED_LIST_CURSOR [G]
			-- New external cursor for traversal
		do
			create Result.make (Current)
		end

feature -- Measurement

	count: INTEGER
			-- Number of items in list
			-- (Performance: O(1).)

	occurrences (v: G): INTEGER
			-- Number of times `v' appears in list
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

feature -- Status report

	has (v: G): BOOLEAN
			-- Does list include `v'?
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
			-- May list be extended with `n' items?
		do
			Result := True
		ensure then
			definition: Result = True
		end

feature -- Iteration

	do_all (an_action: PROCEDURE [G])
			-- Apply `an_action' to every item, from first to last.
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

	do_all_with_index (an_action: PROCEDURE [G, INTEGER])
			-- Apply `an_action' to every item, from first to last.
			-- `an_action' receives the item and its index.
			-- (Semantics not guaranteed if `an_action' changes the structure.)
		local
			a_cell: like first_cell
			i: INTEGER
		do
			a_cell := first_cell
			from
			until
				(a_cell = Void)
			loop
				i := i + 1
				an_action.call ([a_cell.item, i])
				a_cell := a_cell.right
			end
		end

	do_if (an_action: PROCEDURE [G]; a_test: FUNCTION [G, BOOLEAN])
			-- Apply `an_action' to every item that satisfies `a_test', from first to last.
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

	do_if_with_index (an_action: PROCEDURE [G, INTEGER]; a_test: FUNCTION [G, INTEGER, BOOLEAN])
			-- Apply `an_action' to every item that satisfies `a_test', from first to last.
			-- `an_action' and `a_test' receive the item and its index.
			-- (Semantics not guaranteed if `an_action' or `a_test' change the structure.)
		local
			a_cell: like first_cell
			i: INTEGER
			l_item: G
		do
			a_cell := first_cell
			from
			until
				(a_cell = Void)
			loop
				i := i + 1
				l_item := a_cell.item
				if a_test.item ([l_item, i]) then
					an_action.call ([l_item, i])
				end
				a_cell := a_cell.right
			end
		end

	do_until (an_action: PROCEDURE [G]; a_condition: FUNCTION [G, BOOLEAN])
			-- Apply `an_action' to every item, from first to last.
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
			-- Apply `an_action' to every item that satisfies `a_test', from first to last.
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

feature -- Duplication

	copy (other: like Current)
			-- Copy `other' to current list.
			-- Move all cursors `off' (unless `other = Current').
			-- (Performance: O(other.count).)
		local
			a_cell: like first_cell
			new_cell, new_last: attached like first_cell
			old_cursor: detachable like new_cursor
		do
			if other /= Current then
				old_cursor := internal_cursor
				move_all_cursors_after
				standard_copy (other)
				if old_cursor /= Void and then valid_cursor (old_cursor) then
					set_internal_cursor (old_cursor)
				else
						-- This may happen when `copy' is called from `clone'
						-- and the target has not been properly initialized.
					set_internal_cursor (new_cursor)
				end
				a_cell := other.first_cell
				if a_cell /= Void then
					from
						create new_last.make (a_cell.item)
						first_cell := new_last
						a_cell := a_cell.right
					until
						a_cell = Void
					loop
						create new_cell.make (a_cell.item)
						new_last.put_right (new_cell)
						new_last := new_cell
						a_cell := a_cell.right
					end
					last_cell := new_last
				end
			end
		end

feature -- Comparison

	is_equal (other: like Current): BOOLEAN
			-- Is list equal to `other'?
			-- Do not take cursor positions nor
			-- `equality_tester' into account.
			-- (Performance: O(count).)
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

	put_first, force_first (v: G)
			-- Add `v' to beginning of list.
			-- Do not move cursors.
			-- (Performance: O(1).)
		local
			l_new_first: attached like first_cell
		do
			if attached first_cell as l_old_first then
				create l_new_first.make (v)
				l_new_first.put_right (l_old_first)
				first_cell := l_new_first
				count := count + 1
			else
				create first_cell.make (v)
				last_cell := first_cell
				count := 1
			end
		end

	put_last, force_last (v: G)
			-- Add `v' to end of list.
			-- Do not move cursors.
			-- (Performance: O(1).)
		local
			l_new_last: like first_cell
		do
			if attached last_cell as l_old_last then
				create l_new_last.make (v)
				l_old_last.put_right (l_new_last)
				last_cell := l_new_last
				count := count + 1
			else
				create first_cell.make (v)
				last_cell := first_cell
				count := 1
			end
		end

	replace (v: G; i: INTEGER)
			-- Replace item at index `i' by `v'.
			-- Do not move cursors.
			-- (Performance: O(i).)
		local
			a_cell: like first_cell
			j: INTEGER
		do
			a_cell := first_cell
			from
				j := 1
			until
				j = i
			loop
				check valid_index: a_cell /= Void then
					a_cell := a_cell.right
				end
				j := j + 1
			end
			check valid_index: a_cell /= Void then
				a_cell.put (v)
			end
		end

	put, force (v: G; i: INTEGER)
			-- Add `v' at `i'-th position.
			-- Do not move cursors.
			-- (Performance: O(i).)
		local
			a_cell: like first_cell
			new_cell: attached like first_cell
			j: INTEGER
		do
			if i = 1 then
				put_first (v)
			elseif i = count + 1 then
				put_last (v)
			else
					-- Go to cell at index `i-1'.
				a_cell := first_cell
				from
					j := 2
				until
					j = i
				loop
					check valid_index: a_cell /= Void then
						a_cell := a_cell.right
					end
					j := j + 1
				end
					-- The cell at index `i-1' exists (because i /= 1)
					-- and has a right neighbor (because i /= count + 1).
					-- Insert a new cell in-between.
				check valid_index: a_cell /= Void and then attached a_cell.right as l_right then
					create new_cell.make (v)
					new_cell.put_right (l_right)
					a_cell.put_right (new_cell)
					count := count + 1
				end
			end
		end

	put_left_cursor, force_left_cursor (v: G; a_cursor: like new_cursor)
			-- Add `v' to left of `a_cursor' position.
			-- Do not move cursors.
			-- (Synonym of `a_cursor.put_left (v)'.)
			-- (Performance: O(1).)
		local
			new_cell: attached like first_cell
			new_right: like first_cell
		do
			if a_cursor.after then
				put_last (v)
			elseif a_cursor.is_first then
				put_first (v)
			else
					-- Add a cell to the right of the current cell
					-- and swap the two items. Do not forget to update
					-- the cursor positions due the swap of items.
				check not_before: attached a_cursor.current_cell as l_current_cell then
					create new_cell.make (l_current_cell.item)
					l_current_cell.put (v)
					new_right := l_current_cell.right
					l_current_cell.put_right (new_cell)
					if new_right = Void then
							-- The cursor was on the last cell. The new cell
							-- becomes the new last cell of the list.
						last_cell := new_cell
					else
						new_cell.put_right (new_right)
					end
					count := count + 1
						-- Update the cursor positions due the swap of items.
					move_all_cursors (l_current_cell, new_cell)
				end
			end
		end

	put_right_cursor, force_right_cursor (v: G; a_cursor: like new_cursor)
			-- Add `v' to right of `a_cursor' position.
			-- Do not move cursors.
			-- (Synonym of `a_cursor.put_right (v)'.)
			-- (Performance: O(1).)
		local
			new_cell: attached like first_cell
		do
			if a_cursor.before then
				put_first (v)
			elseif a_cursor.is_last then
				put_last (v)
			else
				check not_after_and_not_last: attached a_cursor.current_cell as l_current_cell and then attached l_current_cell.right as l_right then
					create new_cell.make (v)
					new_cell.put_right (l_right)
					l_current_cell.put_right (new_cell)
					count := count + 1
				end
			end
		end

	swap (i, j: INTEGER)
			-- Exchange items at indexes i and j.
			-- Do not move cursors.
			-- (Performance: O(max(i,j)).)
		local
			ii, jj, k: INTEGER
			i_cell, j_cell: like first_cell
			v: G
		do
			if i /= j then
				if i < j then
					ii := i
					jj := j
				else
					ii := j
					jj := i
				end
				i_cell := first_cell
				from
					k := 1
				until
					k = ii
				loop
					check valid_i: i_cell /= Void then
						i_cell := i_cell.right
					end
					k := k + 1
				end
				j_cell := i_cell
				from
				until
					k = jj
				loop
					check valid_j: j_cell /= Void then
						j_cell := j_cell.right
					end
					k := k + 1
				end
				check valid_i_and_j: i_cell /= Void and j_cell /= Void then
					v := i_cell.item
					i_cell.put (j_cell.item)
					j_cell.put (v)
				end
			end
		end

	extend_first, append_first (other: DS_LINEAR [G])
			-- Add items of `other' to beginning of list.
			-- Keep items of `other' in the same order.
			-- Do not move cursors.
			-- (Performance: O(other.count).)
		local
			other_cursor: DS_LINEAR_CURSOR [G]
			fcell, lcell, new_cell: attached like first_cell
		do
			if not other.is_empty then
				from
					other_cursor := other.new_cursor
					other_cursor.start
					create fcell.make (other_cursor.item)
					lcell := fcell
					other_cursor.forth
				until
					other_cursor.after
				loop
					create new_cell.make (other_cursor.item)
					lcell.put_right (new_cell)
					lcell := new_cell
					other_cursor.forth
				end
				if attached first_cell as l_first_cell then
					lcell.put_right (l_first_cell)
					first_cell := fcell
				else
					first_cell := fcell
					last_cell := lcell
				end
				count := count + other.count
			end
		end

	extend_last, append_last (other: DS_LINEAR [G])
			-- Add items of `other' to end of list.
			-- Keep items of `other' in the same order.
			-- Do not move cursors.
			-- (Performance: O(other.count).)
		local
			other_cursor: DS_LINEAR_CURSOR [G]
			fcell, lcell, new_cell: attached like first_cell
		do
			if not other.is_empty then
				from
					other_cursor := other.new_cursor
					other_cursor.start
					create fcell.make (other_cursor.item)
					lcell := fcell
					other_cursor.forth
				until
					other_cursor.after
				loop
					create new_cell.make (other_cursor.item)
					lcell.put_right (new_cell)
					lcell := new_cell
					other_cursor.forth
				end
				if attached last_cell as l_last_cell then
					l_last_cell.put_right (fcell)
					last_cell := lcell
				else
					first_cell := fcell
					last_cell := lcell
				end
				count := count + other.count
			end
		end

	extend, append (other: DS_LINEAR [G]; i: INTEGER)
			-- Add items of `other' at `i'-th position.
			-- Keep items of `other' in the same order.
			-- Do not move cursors.
			-- (Performance: O(i+other.count).)
		local
			other_cursor: DS_LINEAR_CURSOR [G]
			a_cell: like first_cell
			fcell, lcell, new_cell: attached like first_cell
			j: INTEGER
		do
			if i = 1 then
				extend_first (other)
			elseif i = count + 1 then
				extend_last (other)
			elseif not other.is_empty then
				from
					other_cursor := other.new_cursor
					other_cursor.start
					create fcell.make (other_cursor.item)
					lcell := fcell
					other_cursor.forth
				until
					other_cursor.after
				loop
					create new_cell.make (other_cursor.item)
					lcell.put_right (new_cell)
					lcell := new_cell
					other_cursor.forth
				end
					-- Go to cell at index `i-1'.
				a_cell := first_cell
				from
					j := 2
				until
					j = i
				loop
					check valid_index: a_cell /= Void then
						a_cell := a_cell.right
					end
					j := j + 1
				end
					-- The cell at index `i-1' exists (because i /= 1)
					-- and has a right neighbor (because i /= count + 1).
					-- Insert the new cells in-between.
				check valid_index: a_cell /= Void and then attached a_cell.right as l_right then
					lcell.put_right (l_right)
					a_cell.put_right (fcell)
					count := count + other.count
				end
			end
		end

	extend_left_cursor, append_left_cursor (other: DS_LINEAR [G]; a_cursor: like new_cursor)
			-- Add items of `other' to left of `a_cursor' position.
			-- Keep items of `other' in the same order.
			-- Do not move cursors.
			-- (Synonym of `a_cursor.extend_left (other)'.)
			-- (Performance: O(other.count).)
		local
			other_cursor: DS_LINEAR_CURSOR [G]
			new_right: like first_cell
			new_cell, fcell, lcell, new_lcell: attached like first_cell
		do
			if a_cursor.after then
				extend_last (other)
			elseif a_cursor.is_first then
				extend_first (other)
			elseif not other.is_empty then
					-- Add `other.count' cells to the right of the current
					-- cell, swap item at current cell with the last cell
					-- added, put the first item of `other' in the current
					-- cell and its remaining items in the subsequent cells.
					-- Do not forget to update the cursor positions due the
					-- swap of items at current cell.
				check not_before: attached a_cursor.current_cell as l_current_cell then
					create new_cell.make (l_current_cell.item)
					if other.count = 1 then
						l_current_cell.put (other.first)
						new_right := l_current_cell.right
						l_current_cell.put_right (new_cell)
						if new_right = Void then
								-- The cursor was on the last cell. The new cell
								-- becomes the new last cell of the list.
							last_cell := new_cell
						else
							new_cell.put_right (new_right)
						end
					else
						from
							other_cursor := other.new_cursor
							other_cursor.start
							create fcell.make (other_cursor.item)
							lcell := fcell
							other_cursor.forth
						until
							other_cursor.after
						loop
							create new_lcell.make (other_cursor.item)
							lcell.put_right (new_lcell)
							lcell := new_lcell
							other_cursor.forth
						end
						l_current_cell.put (fcell.item)
						new_right := l_current_cell.right
						check not_other_empty: attached fcell.right as fcell_right then
							l_current_cell.put_right (fcell_right)
						end
						lcell.put_right (new_cell)
						if new_right = Void then
								-- The cursor was on the last cell. The new cell
								-- becomes the new last cell of the list.
							last_cell := new_cell
						else
							new_cell.put_right (new_right)
						end
					end
					count := count + other.count
						-- Update the cursor positions due the swap of items.
					move_all_cursors (l_current_cell, new_cell)
				end
			end
		end

	extend_right_cursor, append_right_cursor (other: DS_LINEAR [G]; a_cursor: like new_cursor)
			-- Add items of `other' to right of `a_cursor' position.
			-- Keep items of `other' in the same order.
			-- Do not move cursors.
			-- (Synonym of `a_cursor.extend_right (other)'.)
			-- (Performance: O(other.count).)
		local
			other_cursor: DS_LINEAR_CURSOR [G]
			fcell, lcell, new_lcell: attached like first_cell
		do
			if not other.is_empty then
				from
					other_cursor := other.new_cursor
					other_cursor.start
					create fcell.make (other_cursor.item)
					lcell := fcell
					other_cursor.forth
				until
					other_cursor.after
				loop
					create new_lcell.make (other_cursor.item)
					lcell.put_right (new_lcell)
					lcell := new_lcell
					other_cursor.forth
				end
				if is_empty then
					first_cell := fcell
					last_cell := lcell
				elseif a_cursor.before then
					check not_empty: attached first_cell as l_first_cell then
						lcell.put_right (l_first_cell)
						first_cell := fcell
					end
				elseif a_cursor.is_last then
					check not_empty: attached last_cell as l_last_cell then
						l_last_cell.put_right (fcell)
						last_cell := lcell
					end
				else
						-- The current cell exists (because the cursor is
						-- not `before' (see above) and not `after' (see
						-- precondition)) and it has a right neighbor
						-- (because the cursor is not `is_last' (see above)).
						-- Insert new cells in-between.
					check not_off_and_not_last: attached a_cursor.current_cell as l_current_cell and then attached l_current_cell.right as l_right then
						lcell.put_right (l_right)
						l_current_cell.put_right (fcell)
					end
				end
				count := count + other.count
			end
		end

feature -- Removal

	remove_first
			-- Remove item at beginning of list.
			-- Move any cursors at this position `forth'.
			-- (Performance: O(1).)
		do
			if count = 1 then
				wipe_out
			else
				check two_or_more_items: attached first_cell as l_first_cell and then attached l_first_cell.right as l_right then
					move_all_cursors (l_first_cell, l_right)
					set_first_cell (l_right)
					count := count - 1
				end
			end
		end

	remove_last
			-- Remove item at end of list.
			-- Move any cursors at this position `forth'.
			-- (Performance: O(count).)
		local
			a_cell: like first_cell
			i: INTEGER
		do
			if count = 1 then
				wipe_out
			else
				move_last_cursors_after
					-- Go to second to last cell.
				a_cell := first_cell
				from
					i := count
				until
					i = 2
				loop
					check two_or_more_items: a_cell /= Void then
						a_cell := a_cell.right
					end
					i := i - 1
				end
				check two_or_more_items: a_cell /= Void then
					set_last_cell (a_cell)
				end
				count := count - 1
			end
		end

	remove (i: INTEGER)
			-- Remove item at `i'-th position.
			-- Move any cursors at this position `forth'.
			-- (Performance: O(i).)
		local
			a_cell: like first_cell
			j: INTEGER
		do
			if i = 1 then
				remove_first
			elseif i = count then
				remove_last
			else
					-- Go to the cell at index `i-1'.
				a_cell := first_cell
				from
					j := 2
				until
					j = i
				loop
					check valid_index: a_cell /= Void then
						a_cell := a_cell.right
					end
					j := j + 1
				end
					-- The cell at index `i-1' exists (because i /= 1)
					-- and has a right neighbor (because i /= count + 1,
					-- see precondition).  Remove the new cell in-between.
				check valid_index: a_cell /= Void and then attached a_cell.right as l_old_right and then attached l_old_right.right as l_new_right then
					move_all_cursors (l_old_right, l_new_right)
					a_cell.put_right (l_new_right)
					count := count - 1
				end
			end
		end

	remove_at_cursor (a_cursor: like new_cursor)
			-- Remove item at `a_cursor' position.
			-- Move any cursors at this position `forth'.
			-- (Synonym of `a_cursor.remove'.)
			-- (Performance: O(count) if `a_cursor.is_last', O(1) otherwise.)
		do
			if a_cursor.is_first then
				remove_first
			elseif a_cursor.is_last then
				remove_last
			else
					-- Remove the cell to the right of the current cell
					-- and swap the two items. Do not forget to update
					-- the cursor positions due the swap of items.
				check not_off_and_not_last: attached a_cursor.current_cell as l_current_cell and then attached l_current_cell.right as l_right then
					if l_right = last_cell then
							-- The cursor was on the second to last cell.
							-- The cell at cursor position becomes the
							-- new last cell of the list.
						set_last_cell (l_current_cell)
					else
						check before_second_to_last: attached l_right.right as l_right_right then
							l_current_cell.put_right (l_right_right)
						end
					end
					l_current_cell.put (l_right.item)
					count := count - 1
						-- Update the cursor positions due the swap of items.
					move_all_cursors (l_right, l_current_cell)
				end
			end
		end

	remove_left_cursor (a_cursor: like new_cursor)
			-- Remove item to left of `a_cusor' position.
			-- Move any cursors at this position `forth'.
			-- (Synonym of `a_cursor.remove_left'.)
			-- (Performance: O(a_cursor.index).)
		local
			new_left, old_left: attached like first_cell
		do
			if a_cursor.after then
				remove_last
			else
				check not_off: attached a_cursor.current_cell as l_current_cell and attached first_cell as l_first_cell then
					new_left := l_first_cell
					check not_first: attached new_left.right as l_right then
						old_left := l_right
					end
					if old_left = l_current_cell then
							-- The cell to be removed is the first cell
							-- in the list.
						move_all_cursors (new_left, l_current_cell)
						set_first_cell (l_current_cell)
					else
							-- Go to cell to the left of the cell
							-- to be removed.
						from
						until
							old_left.right = l_current_cell
						loop
							new_left := old_left
							check attached new_left.right as l_right then
								old_left := l_right
							end
						end
						move_all_cursors (old_left, l_current_cell)
						new_left.put_right (l_current_cell)
					end
					count := count - 1
				end
			end
		end

	remove_right_cursor (a_cursor: like new_cursor)
			-- Remove item to right of `a_cursor' position.
			-- Move any cursors at this position `forth'.
			-- (Synonym of `a_cursor.remove_right'.)
			-- (Performance: O(1).)
		local
			new_right: like first_cell
		do
			if a_cursor.before then
				remove_first
			else
				check not_off_and_not_last: attached a_cursor.current_cell as l_current_cell and then attached l_current_cell.right as l_old_right then
					new_right := l_old_right.right
					if new_right = Void then
							-- The cell to be removed was the last in the
							-- list. The cell at cursor position becomes
							-- the new last cell.
						move_last_cursors_after
						set_last_cell (l_current_cell)
					else
						move_all_cursors (l_old_right, new_right)
						l_current_cell.put_right (new_right)
					end
					count := count - 1
				end
			end
		end

	prune_first (n: INTEGER)
			-- Remove `n' first items from list.
			-- Move all cursors `off'.
			-- (Performance: O(n).)
		local
			i: INTEGER
			new_first: like first_cell
		do
			if count = n then
				wipe_out
			elseif n /= 0 then
				move_all_cursors_after
				new_first := first_cell
				from
					i := 1
				until
					i > n
				loop
					check valid_n: new_first /= Void then
						new_first := new_first.right
					end
					i := i + 1
				end
				check valid_n: new_first /= Void then
					set_first_cell (new_first)
				end
				count := count - n
			else
				move_all_cursors_after
			end
		end

	prune_last (n: INTEGER)
			-- Remove `n' last items from list.
			-- Move all cursors `off'.
			-- (Performance: O(count-n).)
		do
			keep_first (count - n)
		end

	prune (n: INTEGER; i: INTEGER)
			-- Remove `n' items at and after `i'-th position.
			-- Move all cursors `off'.
			-- (Performance: O(i+n).)
		local
			a_cell, new_right: like first_cell
			j: INTEGER
		do
			if i = 1 then
				prune_first (n)
			elseif n /= 0 then
				move_all_cursors_after
					-- Go to cell at index `i-1'.
				a_cell := first_cell
				from
					j := 2
				until
					j = i
				loop
					check valid_index: a_cell /= Void then
						a_cell := a_cell.right
					end
					j := j + 1
				end
					-- Go to the last cell to be removed.
				check valid_index: a_cell /= Void then
					new_right := a_cell.right
					from
						j := 1
					until
						j = n
					loop
						check valid_n: new_right /= Void then
							new_right := new_right.right
						end
						j := j + 1
					end
					check valid_n: new_right /= Void then
						new_right := new_right.right
					end
					if new_right = Void then
							-- The last cell to be removed is actually
							-- the last cell of the list. The cell at
							-- index `i-1' becomes the new last cell.
						set_last_cell (a_cell)
					else
						a_cell.put_right (new_right)
					end
					count := count - n
				end
			else
				move_all_cursors_after
			end
		end

	prune_left_cursor (n: INTEGER; a_cursor: like new_cursor)
			-- Remove `n' items to left of `a_cursor' position.
			-- Move all cursors `off'.
			-- (Synonym of `a_cursor.prune_left (n)'.)
			-- (Performance: O(2*a_cursor.index-n).)
		local
			i, j: INTEGER
			a_cell: like first_cell
		do
			if a_cursor.after then
				prune_last (n)
			elseif n /= 0 then
					-- Go to the cell to the left of the first
					-- cell to be removed.
				check not_off: attached a_cursor.current_cell as l_current_cell then
					j := a_cursor.index - n - 1
					if j = 0 then
							-- There is no such cell. The cell at cursor
							-- position becomes the new first cell of the list.
						set_first_cell (l_current_cell)
					else
						a_cell := first_cell
						from
							i := 1
						until
							i = j
						loop
							check valid_n: a_cell /= Void then
								a_cell := a_cell.right
							end
							i := i + 1
						end
						check valid_n: a_cell /= Void then
							a_cell.put_right (l_current_cell)
						end
					end
					move_all_cursors_after
					count := count - n
				end
			else
				move_all_cursors_after
			end
		end

	prune_right_cursor (n: INTEGER; a_cursor: like new_cursor)
			-- Remove `n' items to right of `a_cursor' position.
			-- Move all cursors `off'.
			-- (Synonym of `a_cursor.prune_right (n)'.)
			-- (Performance: O(n).)
		local
			i: INTEGER
			new_right: like first_cell
		do
			if a_cursor.before then
				prune_first (n)
			elseif n /= 0 then
				check not_off: attached a_cursor.current_cell as l_current_cell then
					move_all_cursors_after
						-- Go to the cell to the right of the last
						-- cell to be removed.
					new_right := l_current_cell.right
					from
						i := 1
					until
						i > n
					loop
						check valid_n: new_right /= Void then
							new_right := new_right.right
						end
						i := i + 1
					end
					if new_right = Void then
							-- There is no such cell. The cell at cursor
							-- position becomes the new last cell of the list.
						set_last_cell (l_current_cell)
					else
						l_current_cell.put_right (new_right)
					end
					count := count - n
				end
			else
				move_all_cursors_after
			end
		end

	keep_first (n: INTEGER)
			-- Keep `n' first items in list.
			-- Move all cursors `off'.
			-- (Performance: O(n).)
		local
			i: INTEGER
			new_last: like first_cell
		do
			if n = 0 then
				wipe_out
			elseif n = count then
				move_all_cursors_after
			else
				move_all_cursors_after
				new_last := first_cell
				from
					i := 1
				until
					i = n
				loop
					check valid_n: new_last /= Void then
						new_last := new_last.right
					end
					i := i + 1
				end
				check valid_n: new_last /= Void then
					set_last_cell (new_last)
				end
				count := n
			end
		end

	keep_last (n: INTEGER)
			-- Keep `n' last items in list.
			-- Move all cursors `off'.
			-- (Performance: O(count-n).)
		do
			prune_first (count - n)
		end

	delete (v: G)
			-- Remove all occurrences of `v'.
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
			-- Move all cursors `off'.
			-- (Performance: O(count).)
		local
			n: INTEGER
			a_cell, right_cell: like first_cell
		do
			move_all_cursors_after
			if not is_empty then
				if attached equality_tester as l_tester then
						-- Remove all occurrences of `v' at the beginning
						-- of the list.
					from
						a_cell := first_cell
					until
						(a_cell = Void) or else not l_tester.test (a_cell.item, v)
					loop
						a_cell := a_cell.right
						n := n + 1
					end
					if a_cell = Void then
							-- All items were occurrences of `v'.
							-- The list becomes empty.
						first_cell := Void
						last_cell := Void
						count := 0
					else
						if n > 0 then
								-- There was some occurrences of `v' at the
								-- beginning of the list. Set the new first
								-- cell of the list accordingly.
							set_first_cell (a_cell)
						end
							-- Remove subsequent occurrences of `v'.
						right_cell := a_cell.right
						from
						until
							(right_cell = Void)
						loop
							if l_tester.test (right_cell.item, v) then
								right_cell := right_cell.right
								if right_cell /= Void then
									a_cell.put_right (right_cell)
								end
								n := n + 1
							else
								a_cell := right_cell
								right_cell := a_cell.right
							end
						end
						if a_cell /= last_cell then
								-- The last items in the list were occurrences
								-- of `v'. Set the new last cell of the list
								-- accordingly.
							set_last_cell (a_cell)
						end
						count := count - n
					end
				else
						-- Use `=' as comparison criterion.
						-- First, remove all occurrences of `v' at the beginning
						-- of the list.
					from
						a_cell := first_cell
					until
						(a_cell = Void) or else (a_cell.item /= v)
					loop
						a_cell := a_cell.right
						n := n + 1
					end
					if a_cell = Void then
							-- All items were occurrences of `v'.
							-- The list becomes empty.
						first_cell := Void
						last_cell := Void
						count := 0
					else
						if n > 0 then
								-- There was some occurrences of `v' at the
								-- beginning of the list. Set the new first
								-- cell of the list accordingly.
							set_first_cell (a_cell)
						end
							-- Remove subsequent occurrences of `v'.
						right_cell := a_cell.right
						from
						until
							(right_cell = Void)
						loop
							if right_cell.item = v then
								right_cell := right_cell.right
								if right_cell /= Void then
									a_cell.put_right (right_cell)
								end
								n := n + 1
							else
								a_cell := right_cell
								right_cell := a_cell.right
							end
						end
						if a_cell /= last_cell then
								-- The last items in the list were occurrences
								-- of `v'. Set the new last cell of the list
								-- accordingly.
							set_last_cell (a_cell)
						end
						count := count - n
					end
				end
			end
		end

	wipe_out
			-- Remove all items from list.
			-- Move all cursors `off'.
			-- (Performance: O(1).)
		do
			move_all_cursors_after
			first_cell := Void
			last_cell := Void
			count := 0
		end

feature {DS_LINKED_LIST, DS_LINKED_LIST_CURSOR} -- Implementation

	first_cell: detachable DS_LINKABLE [G]
			-- First cell in list

	last_cell: like first_cell
			-- Last cell in list

feature {NONE} -- Implementation

	set_first_cell (a_cell: attached like first_cell)
			-- Set `first_cell' to `a_cell'.
			-- This routine has to be called (instead of
			-- making a direct assignment to `first_cell')
			-- when `a_cell' may have dangling left neighbors
			-- that need to be gotten rid of. There is no need
			-- to call this routine when `a_cell' has just
			-- been created.
		require
			a_cell_not_void: a_cell /= Void
		do
			first_cell := a_cell
		ensure
			first_cell_set: first_cell = a_cell
		end

	set_last_cell (a_cell: attached like first_cell)
			-- Set `last_cell' to `a_cell'.
			-- This routine has to be called (instead of
			-- making a direct assignment to `last_cell')
			-- when `a_cell' may have dangling right neighbors
			-- that need to be gotten rid of. There is no need
			-- to call this routine when `a_cell' has just
			-- been created.
		require
			a_cell_not_void: a_cell /= Void
		do
			a_cell.forget_right
			last_cell := a_cell
		ensure
			last_cell_set: last_cell = a_cell
		end

feature {NONE} -- Implementation

	set_internal_cursor (c: like internal_cursor)
			-- Set `internal_cursor' to `c'.
		do
			internal_cursor := c
		end

	internal_cursor: like new_cursor
			-- Internal cursor

feature {NONE} -- Cursor movement

	move_last_cursors_after
			-- Move `after' all cursors at last position.
		local
			a_cursor, next_cursor: detachable like new_cursor
			previous_cursor: like new_cursor
			old_cell: like first_cell
		do
			a_cursor := internal_cursor
			old_cell := last_cell
			if a_cursor.current_cell = old_cell then
				a_cursor.set_after
			end
			previous_cursor := a_cursor
			a_cursor := a_cursor.next_cursor
			from
			until
				(a_cursor = Void)
			loop
				if a_cursor.current_cell = old_cell then
					a_cursor.set_after
					next_cursor := a_cursor.next_cursor
					previous_cursor.set_next_cursor (next_cursor)
					a_cursor.set_next_cursor (Void)
					a_cursor := next_cursor
				else
					previous_cursor := a_cursor
					a_cursor := a_cursor.next_cursor
				end
			end
		end

	move_all_cursors (old_cell, new_cell: attached like first_cell)
			-- Move all cursors at position `old_cell' to `new_cell'.
		require
			old_cell_not_void: old_cell /= Void
			new_cell_not_void: new_cell /= Void
		local
			a_cursor: detachable like new_cursor
		do
			from
				a_cursor := internal_cursor
			until
				(a_cursor = Void)
			loop
				if a_cursor.current_cell = old_cell then
					a_cursor.set_current_cell (new_cell)
				end
				a_cursor := a_cursor.next_cursor
			end
		end

	move_all_cursors_after
			-- Move `after' all cursors.
		local
			a_cursor, next_cursor: detachable like new_cursor
		do
			from
				a_cursor := internal_cursor
			until
				(a_cursor = Void)
			loop
				a_cursor.set_after
				next_cursor := a_cursor.next_cursor
				a_cursor.set_next_cursor (Void)
				a_cursor := next_cursor
			end
		end

feature {DS_LINKED_LIST_CURSOR} -- Cursor implementation

	cursor_item (a_cursor: like new_cursor): G
			-- Item at `a_cursor' position
			-- (Performance: O(1).)
		do
			check not_off: attached a_cursor.current_cell as l_current_cell then
				Result := l_current_cell.item
			end
		end

	cursor_index (a_cursor: like new_cursor): INTEGER
			-- Index of `a_cursor''s current position
			-- (Performance: O(count).)
		local
			a_cell, current_cell: like first_cell
		do
			if a_cursor.after then
				Result := count + 1
			elseif not a_cursor.before then
				from
					current_cell := a_cursor.current_cell
					a_cell := first_cell
					Result := 1
				until
					a_cell = current_cell
				loop
					check valid_cursor: a_cell /= Void then
						a_cell := a_cell.right
					end
					Result := Result + 1
				end
			end
		end

	cursor_is_first (a_cursor: like new_cursor): BOOLEAN
			-- Is `a_cursor' on first item?
		local
			current_cell: like first_cell
		do
			current_cell := a_cursor.current_cell
			Result := current_cell /= Void and current_cell = first_cell
		end

	cursor_is_last (a_cursor: like new_cursor): BOOLEAN
			-- Is `a_cursor' on last item?
		local
			current_cell: like first_cell
		do
			current_cell := a_cursor.current_cell
			Result := current_cell /= Void and current_cell = last_cell
		end

	cursor_same_position (a_cursor, other: like new_cursor): BOOLEAN
			-- Is `a_cursor' at same position as `other'?
		do
			Result := a_cursor.current_cell = other.current_cell and a_cursor.before = other.before and a_cursor.after = other.after
		end

	cursor_start (a_cursor: like new_cursor)
			-- Move `a_cursor' to first position.
			-- (Performance: O(1).)
		local
			was_off: BOOLEAN
			new_after: BOOLEAN
		do
			was_off := cursor_off (a_cursor)
			new_after := (first_cell = Void)
			a_cursor.set (first_cell, False, new_after)
			if not new_after and was_off then
				add_traversing_cursor (a_cursor)
			end
		end

	cursor_finish (a_cursor: like new_cursor)
			-- Move `a_cursor' to last position.
			-- (Performance: O(1).)
		local
			was_off: BOOLEAN
			new_before: BOOLEAN
		do
			was_off := cursor_off (a_cursor)
			new_before := (last_cell = Void)
			a_cursor.set (last_cell, new_before, False)
			if not new_before and was_off then
				add_traversing_cursor (a_cursor)
			end
		end

	cursor_forth (a_cursor: like new_cursor)
			-- Move `a_cursor' to next position.
			-- (Performance: O(1).)
		local
			was_off: BOOLEAN
			new_after: BOOLEAN
			new_cell: like first_cell
		do
			if attached a_cursor.current_cell as l_current_cell then
				new_cell := l_current_cell.right
			else
					-- `a_cursor.before'.
				was_off := True
				new_cell := first_cell
			end
			new_after := (new_cell = Void)
			a_cursor.set (new_cell, False, new_after)
			if new_after then
				if not was_off then
					remove_traversing_cursor (a_cursor)
				end
			elseif was_off then
				add_traversing_cursor (a_cursor)
			end
		end

	cursor_back (a_cursor: like new_cursor)
			-- Move `a_cursor' to previous position.
			-- (Performance: O(a_cursor.index).)
		local
			current_cell, new_cell: like first_cell
			was_off, new_before: BOOLEAN
		do
			if a_cursor.after then
				was_off := True
				new_cell := last_cell
			elseif a_cursor.is_first then
				new_cell := Void
			else
				from
					current_cell := a_cursor.current_cell
					new_cell := first_cell
				until
					new_cell = Void or else new_cell.right = current_cell
				loop
					new_cell := new_cell.right
				end
			end
			new_before := (new_cell = Void)
			a_cursor.set (new_cell, new_before, False)
			if new_before then
				if not was_off then
					remove_traversing_cursor (a_cursor)
				end
			elseif was_off then
				add_traversing_cursor (a_cursor)
			end
		end

	cursor_search_forth (a_cursor: like new_cursor; v: G)
			-- Move `a_cursor' to first position at or after its current
			-- position where `cursor_item (a_cursor)' and `v' are equal.
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
			-- Move `after' if not found.
		local
			a_cell: like first_cell
			was_off, new_after: BOOLEAN
		do
			a_cell := a_cursor.current_cell
			was_off := (a_cell = Void)
			if attached equality_tester as l_tester then
				from
				until
					a_cell = Void or else l_tester.test (a_cell.item, v)
				loop
					a_cell := a_cell.right
				end
			else
					-- Use `=' as comparison criterion.
				from
				until
					a_cell = Void or else a_cell.item = v
				loop
					a_cell := a_cell.right
				end
			end
			new_after := (a_cell = Void)
			a_cursor.set (a_cell, False, new_after)
			if new_after then
				if not was_off then
					remove_traversing_cursor (a_cursor)
				end
			elseif was_off then
				add_traversing_cursor (a_cursor)
			end
		end

	cursor_search_back (a_cursor: like new_cursor; v: G)
			-- Move `a_cursor' to first position at or before its current
			-- position where `cursor_item (a_cursor)' and `v' are equal.
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
			-- Move `before' if not found.
			-- (Performance: O(a_cursor.index).)
		local
			a_cell, cursor_cell, new_cell: like first_cell
			was_off, new_before: BOOLEAN
		do
			cursor_cell := a_cursor.current_cell
			was_off := (cursor_cell = Void)
			if attached equality_tester as l_tester then
				if cursor_cell /= Void and then l_tester.test (cursor_cell.item, v) then
					from
						a_cell := first_cell
					until
						a_cell = Void or else a_cell = cursor_cell
					loop
						if l_tester.test (a_cell.item, v) then
							new_cell := a_cell
						end
						a_cell := a_cell.right
					end
				end
			else
					-- Use `=' as comparison criterion.
				if cursor_cell /= Void and then cursor_cell.item = v then
					from
						a_cell := first_cell
					until
						a_cell = Void or else a_cell = cursor_cell
					loop
						if a_cell.item = v then
							new_cell := a_cell
						end
						a_cell := a_cell.right
					end
				end
			end
			new_before := (new_cell = Void)
			a_cursor.set (new_cell, new_before, False)
			if new_before then
				if not was_off then
					remove_traversing_cursor (a_cursor)
				end
			elseif was_off then
				add_traversing_cursor (a_cursor)
			end
		end

	cursor_go_after (a_cursor: like new_cursor)
			-- Move `a_cursor' to `after' position.
			-- (Performance: O(1).)
		local
			was_off: BOOLEAN
		do
			was_off := cursor_off (a_cursor)
			a_cursor.set_after
			if not was_off then
				remove_traversing_cursor (a_cursor)
			end
		end

	cursor_go_before (a_cursor: like new_cursor)
			-- Move `a_cursor' to `before' position.
			-- (Performance: O(1).)
		local
			was_off: BOOLEAN
		do
			was_off := cursor_off (a_cursor)
			a_cursor.set_before
			if not was_off then
				remove_traversing_cursor (a_cursor)
			end
		end

	cursor_go_to (a_cursor, other: like new_cursor)
			-- Move `a_cursor' to `other''s position.
			-- (Performance: O(1).)
		local
			was_off: BOOLEAN
		do
			was_off := cursor_off (a_cursor)
			a_cursor.set (other.current_cell, other.before, other.after)
			if not a_cursor.off then
				if was_off then
					add_traversing_cursor (a_cursor)
				end
			elseif not was_off then
				remove_traversing_cursor (a_cursor)
			end
		end

	cursor_go_i_th (a_cursor: like new_cursor; i: INTEGER)
			-- Move `a_cursor' to `i'-th position.
			-- (Performance: O(i).)
		local
			j: INTEGER
			new_cell: like first_cell
			was_off: BOOLEAN
		do
			was_off := cursor_off (a_cursor)
			if i = 0 then
				a_cursor.set_before
			elseif i = count + 1 then
				a_cursor.set_after
			else
				if i = 1 then
					new_cell := first_cell
				elseif i = count then
					new_cell := last_cell
				else
					new_cell := first_cell
					from
						j := 1
					until
						j = i
					loop
						check valid_index: new_cell /= Void then
							new_cell := new_cell.right
						end
						j := j + 1
					end
				end
				a_cursor.set (new_cell, False, False)
			end
			if new_cell = Void then
					-- `a_cursor.off'
				if not was_off then
					remove_traversing_cursor (a_cursor)
				end
			elseif was_off then
				add_traversing_cursor (a_cursor)
			end
		end

invariant

	first_cell: is_empty = (first_cell = Void)
	last_cell: is_empty = (last_cell = Void)
	last_constraint: attached last_cell as l_last_cell implies l_last_cell.right = Void

end
