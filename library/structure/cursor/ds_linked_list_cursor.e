indexing

	description:

		"Cursors for linked list traversals"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class DS_LINKED_LIST_CURSOR [G]

inherit

	DS_LIST_CURSOR [G]
		redefine
			off
		end

creation

	make

feature {NONE} -- Initialization

	make (a_list: like container) is
			-- Create a new cursor for `a_list'.
		require
			a_list_not_void: a_list /= Void
		do
			container := a_list
			before := True
		ensure
			container_set: container = a_list
			before: before
		end

feature -- Access

	item: G is
			-- Item at cursor position
			-- (Performance: O(1).)
		do
			Result := current_cell.item
		end

	index: INTEGER is
			-- Index of current position
			-- (Performance: O(container.count).)
		local
			a_cell: like current_cell
		do
			if after then
				Result := container.count + 1
			elseif not before then
				from
					a_cell := container.first_cell
					Result := 1
				until
					a_cell = current_cell
				loop
					a_cell := a_cell.right
					Result := Result + 1
				end
			end
		end

	container: DS_LINKED_LIST [G]
			-- List traversed

feature -- Status report

	after: BOOLEAN
			-- Is there no valid position to right of cursor?

	before: BOOLEAN
			-- Is there no valid position to left of cursor?

	is_first: BOOLEAN is
			-- Is cursor on the first item?
		do
			Result := current_cell /= Void and
				current_cell = container.first_cell
		end

	is_last: BOOLEAN is
			-- Is cursor on the last item?
		do
			Result := current_cell /= Void and
				current_cell = container.last_cell
		end

	off: BOOLEAN is
			-- Is there no item at cursor position?
		do
			Result := current_cell = Void
		end

	same_position (other: like Current): BOOLEAN is
			-- Is current cursor at same position as `other'?
		do
			Result := current_cell = other.current_cell and
				before = other.before and after = other.after
		end

feature -- Cursor movement

	start is
			-- Move cursor to first position.
			-- (Performance: O(1).)
		local
			was_off: BOOLEAN
		do
			was_off := off
			current_cell := container.first_cell
			before := False
			after := (current_cell = Void)
			if not after and was_off then
				container.add_traversing_cursor (Current)
			end
		end

	finish is
			-- Move cursor to last position.
			-- (Performance: O(1).)
		local
			was_off: BOOLEAN
		do
			was_off := off
			current_cell := container.last_cell
			after := False
			before := (current_cell = Void)
			if not before and was_off then
				container.add_traversing_cursor (Current)
			end
		end

	forth is
			-- Move cursor to next position.
			-- (Performance: O(1).)
		local
			was_off: BOOLEAN
		do
			if before then
				was_off := True
				current_cell := container.first_cell
				before := False
			else
				current_cell := current_cell.right
			end
			after := (current_cell = Void)
			if after then
				if not was_off then
					container.remove_traversing_cursor (Current)
				end
			elseif was_off then
				container.add_traversing_cursor (Current)
			end
		end

	back is
			-- Move cursor to previous position.
			-- (Performance: O(index).)
		local
			a_cell: like current_cell
			was_off: BOOLEAN
		do
			if after then
				was_off := True
				current_cell := container.last_cell
				after := False
			elseif is_first then
				before := True
				current_cell := Void
			else
				from
					a_cell := container.first_cell
				until
					a_cell.right = current_cell
				loop
					a_cell := a_cell.right
				end
				current_cell := a_cell
			end
			before := (current_cell = Void)
			if before then
				if not was_off then
					container.remove_traversing_cursor (Current)
				end
			elseif was_off then
				container.add_traversing_cursor (Current)
			end
		end

	search_forth (v: G) is
			-- Move to first position at or after current
			-- position where `item' and `v' are equal.
			-- (Use `equality_tester''s criterion from `container'
			-- if not void, use `=' criterion otherwise.)
			-- Move `after' if not found.
		local
			a_cell: like current_cell
			a_tester: DS_EQUALITY_TESTER [G]
			was_off: BOOLEAN
		do
			was_off := off
			a_cell := current_cell
			a_tester := container.equality_tester
			if a_tester /= Void then
				from until
					a_cell = Void or else a_tester.test (a_cell.item, v)
				loop
					a_cell := a_cell.right
				end
			else
					-- Use `=' as comparison criterion.
				from until
					a_cell = Void or else a_cell.item = v
				loop
					a_cell := a_cell.right
				end
			end
			current_cell := a_cell
			after := (a_cell = Void)
			if after then
				if not was_off then
					container.remove_traversing_cursor (Current)
				end
			elseif was_off then
				container.add_traversing_cursor (Current)
			end
		end

	search_back (v: G) is
			-- Move to first position at or before current
			-- position where `item' and `v' are equal.
			-- (Use `equality_tester''s criterion from `container'
			-- if not void, use `=' criterion otherwise.)
			-- Move `before' if not found.
			-- (Performance: O(index).)
		local
			a_cell, cursor_cell, new_cell: like current_cell
			a_tester: DS_EQUALITY_TESTER [G]
			was_off: BOOLEAN
		do
			was_off := off
			cursor_cell := current_cell
			a_tester := container.equality_tester
			if a_tester /= Void then
				if cursor_cell /= Void and a_tester.test (cursor_cell.item, v) then
					from
						a_cell := container.first_cell
					until
						a_cell = cursor_cell
					loop
						if a_tester.test (a_cell.item, v) then
							new_cell := a_cell
						end
						a_cell := a_cell.right
					end
					current_cell := new_cell
					before := (new_cell = Void)
				end
			else
					-- Use `=' as comparison criterion.
				if cursor_cell /= Void and cursor_cell.item = v then
					from
						a_cell := container.first_cell
					until
						a_cell = cursor_cell
					loop
						if a_cell.item = v then
							new_cell := a_cell
						end
						a_cell := a_cell.right
					end
					current_cell := new_cell
					before := (new_cell = Void)
				end
			end
			if before then
				if not was_off then
					container.remove_traversing_cursor (Current)
				end
			elseif was_off then
				container.add_traversing_cursor (Current)
			end
		end

	go_after is
			-- Move cursor to `after' position.
			-- (Performance: O(1).)
		local
			was_off: BOOLEAN
		do
			was_off := off
			after := True
			before := False
			current_cell := Void
			if not was_off then
				container.remove_traversing_cursor (Current)
			end
		end

	go_before is
			-- Move cursor to `before' position.
			-- (Performance: O(1).)
		local
			was_off: BOOLEAN
		do
			was_off := off
			after := False
			before := True
			current_cell := Void
			if not was_off then
				container.remove_traversing_cursor (Current)
			end
		end

	go_to (other: like Current) is
			-- Move cursor to `other''s position.
			-- (Performance: O(1).)
		local
			was_off: BOOLEAN
		do
			was_off := off
			current_cell := other.current_cell
			before := other.before
			after := other.after
			if not off then
				if was_off then
					container.add_traversing_cursor (Current)
				end
			elseif not was_off then
				container.remove_traversing_cursor (Current)
			end
		end

	go_i_th (i: INTEGER) is
			-- Move cursor to `i'-th position.
			-- (Performance: O(i).)
		local
			j: INTEGER
			a_cell: like current_cell
			was_off: BOOLEAN
		do
			was_off := off
			if i = 0 then
				before := True
				after := False
				current_cell := Void
			elseif i = container.count + 1 then
				after := True
				before := False
				current_cell := Void
			else
				after := False
				before := False
				if i = 1 then
					current_cell := container.first_cell
				elseif i = container.count then
					current_cell := container.last_cell
				else
					a_cell := container.first_cell
					from j := 1 until j = i loop
						a_cell := a_cell.right
						j := j + 1
					end
					current_cell := a_cell
				end
			end
			if off then
				if not was_off then
					container.remove_traversing_cursor (Current)
				end
			elseif was_off then
				container.add_traversing_cursor (Current)
			end
		end

feature -- Element change

	replace (v: G) is
			-- Replace item at cursor position by `v'.
			-- (Performance: O(1).)
		do
			current_cell.put (v)
		end

feature {DS_LINKED_LIST, DS_LINKED_LIST_CURSOR} -- Implementation

	current_cell: DS_LINKABLE [G]
			-- Cell at cursor position

feature {DS_LINKED_LIST} -- Implementation

	set_current_cell (a_cell: like current_cell) is
			-- Set `current_cell' to `a_cell'.
			-- Do not change `after' or `before'.
		require
			not_off: current_cell /= Void
			a_cell_not_void: a_cell /= Void
		do
			current_cell := a_cell
		ensure
			current_cell_set: current_cell = a_cell
		end

	set_after is
			-- Set position to after position.
		do
			current_cell := Void
			before := False
			after := True
		ensure
			after: after
		end

	set (a_cell: like current_cell; b, a: BOOLEAN) is
			-- Set cursor.
		require
			consistent: (a_cell = Void) implies (a or b)
			not_both: not (a and b)
		do
			current_cell := a_cell
			before := b
			after := a
		ensure
			current_cell_set: current_cell = a_cell
			before_set: before = b
			after_set: after = a
		end

invariant

	off_definition: off = (current_cell = Void)

end -- class DS_LINKED_LIST_CURSOR
