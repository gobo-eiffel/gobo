indexing

	description:

		"Cursors for arrayed list traversals"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class DS_ARRAYED_LIST_CURSOR [G]

inherit

	DS_LIST_CURSOR [G]

creation

	make

feature {NONE} -- Initialization

	make (a_list: like container) is
			-- Create a new cursor for `a_list'.
		require
			a_list_not_void: a_list /= Void
		do
			container := a_list
			-- position := 0
		ensure
			container_set: container = a_list
			before: before
		end

feature -- Access

	item: G is
			-- Item at cursor position
			-- (Performance: O(1).)
		do
			Result := container.item (position)
		end

	index: INTEGER is
			-- Current cursor position
			-- (Performance: O(1).)
		do
			Result := position
			if Result = After_position then
				Result := container.count + 1
			end
		end

	container: DS_ARRAYED_LIST [G]
			-- List traversed

feature -- Status report

	after: BOOLEAN is
			-- Is there no valid position to right of cursor?
		do
			Result := position = After_position
		end

	before: BOOLEAN is
			-- Is there no valid position to left of cursor?
		do
			Result := position = 0
		end

	is_first: BOOLEAN is
			-- Is cursor on the first item?
		do
			Result := not container.is_empty and position = 1
		end

	is_last: BOOLEAN is
			-- Is cursor on the last item?
		do
			Result := not container.is_empty and position = container.count
		end

	same_position (other: like Current): BOOLEAN is
			-- Is current cursor at same position as `other'?
		do
			Result := (position = other.position)
		end

feature -- Cursor movement

	start is
			-- Move cursor to first position.
			-- (Performance: O(1).)
		local
			was_off: BOOLEAN
		do
			was_off := off
			if container.is_empty then
				position := After_position
			else
				position := 1
				if was_off then
					container.add_traversing_cursor (Current)
				end
			end
		end

	finish is
			-- Move cursor to last position.
			-- (Performance: O(1).)
		local
			was_off: BOOLEAN
		do
			was_off := off
			position := container.count
			if position /= 0 and was_off then
				container.add_traversing_cursor (Current)
			end
		end

	forth is
			-- Move cursor to next position.
			-- (Performance: O(1).)
		local
			was_off: BOOLEAN
		do
			was_off := before
			position := position + 1
			if position > container.count then
				position := After_position
				if not was_off then
					container.remove_traversing_cursor (Current)
				end
			elseif was_off then
				container.add_traversing_cursor (Current)
			end
		end

	back is
			-- Move cursor to previous position.
			-- (Performance: O(1).)
		local
			was_off: BOOLEAN
		do
			if position = After_position then
				was_off := True
				position := container.count
			else
				position := position - 1
			end
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
			i, nb: INTEGER
			list: like container
			a_tester: DS_EQUALITY_TESTER [G]
			was_off: BOOLEAN
		do
			was_off := off
			i := index
			list := container
			nb := list.count
			a_tester := list.equality_tester
			if a_tester /= Void then
				from until
					i > nb or else a_tester.test (list.item (i), v)
				loop
					i := i + 1
				end
			else
					-- Use `=' as comparison criterion.
				from until
					i > nb or else list.item (i) = v
				loop
					i := i + 1
				end
			end
			if i > nb then
				position := After_position
				if not was_off then
					container.remove_traversing_cursor (Current)
				end
			else
				position := i
				if was_off then
					container.add_traversing_cursor (Current)
				end
			end
		end

	search_back (v: G) is
			-- Move to first position at or before current
			-- position where `item' and `v' are equal.
			-- (Use `equality_tester''s criterion from `container'
			-- if not void, use `=' criterion otherwise.)
			-- Move `before' if not found.
		local
			i: INTEGER
			list: like container
			a_tester: DS_EQUALITY_TESTER [G]
			was_off: BOOLEAN
		do
			was_off := off
			i := position
			list := container
			a_tester := list.equality_tester
			if a_tester /= Void then
				from until
					i < 1 or else a_tester.test (list.item (i), v)
				loop
					i := i - 1
				end
			else
					-- Use `=' as comparison criterion.
				from until
					i < 1 or else list.item (i) = v
				loop
					i := i - 1
				end
			end
			position := i
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
			position := After_position
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
			position := 0
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
			position := other.position
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
			-- (Performance: O(1).)
		local
			was_off: BOOLEAN
		do
			was_off := off
			if i > container.count then
				position := After_position
				if not was_off then
					container.remove_traversing_cursor (Current)
				end
			else
				position := i
				if before then
					if not was_off then
						container.remove_traversing_cursor (Current)
					end
				elseif was_off then
					container.add_traversing_cursor (Current)
				end
			end
		end

feature -- Element change

	replace (v: G) is
			-- Replace item at cursor position by `v'.
			-- (Performance: O(1).)
		do
			container.replace (v, position)
		end

feature {DS_ARRAYED_LIST, DS_ARRAYED_LIST_CURSOR} -- Implementation

	position: INTEGER
			-- Internal position in list

feature {DS_ARRAYED_LIST} -- Implementation

	set_position (i: INTEGER) is
			-- Set `position' to `i'.
		require
			valid_i: valid_position (i)
		do
			position := i
		ensure
			position_set: position = i
		end

	set_after is
			-- Set `position' to after position.
		do
			position := After_position
		ensure
			after: after
		end

	valid_position (p: INTEGER): BOOLEAN is
			-- Is `p' a valid value for `position'?
		do
			Result := p = After_position or
				(0 <= p and p <= container.count)
		ensure
			not_off: (1 <= p and p <= container.count) implies Result
			before: (p = 0) implies Result
			after: (p = After_position) implies Result
		end
feature {NONE} -- Implementation

	After_position: INTEGER is -1
			-- Special value for after position

invariant

-- The following assertion are commented out because
-- some Eiffel compilers check invariants even when the
-- execution of the creation procedure is not completed.
-- (In this case, this is `container' which is not fully
-- created yet, breaking its invariant.)

--	valid_position: valid_position (position)

end -- class DS_ARRAYED_LIST_CURSOR
