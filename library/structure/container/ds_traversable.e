indexing

	description:

		"Data structures that can be traversed. Traversable containers %
		%are equipped with an internal cursor and external cursors which %
		%can be used for simultaneous traversals."

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class DS_TRAVERSABLE [G]

inherit

	DS_CONTAINER [G]

feature -- Access

	item_for_iteration: G is
			-- Item at internal cursor position
		require
			not_off: not off
		do
			Result := internal_cursor.item
		end

	new_cursor: DS_CURSOR [G] is
			-- New external cursor for traversal
		deferred
		ensure
			cursor_not_void: Result /= Void
			valid_cursor: valid_cursor (Result)
		end

feature -- Status report

	off: BOOLEAN is
			-- Is there no item at internal cursor position?
		do
			Result := internal_cursor.off
		end

	same_position (a_cursor: like new_cursor): BOOLEAN is
			-- Is internal cursor at same position as `a_cursor'?
		require
			a_cursor_not_void: a_cursor /= Void
		do
			Result := internal_cursor.same_position (a_cursor)
		end

	valid_cursor (a_cursor: DS_CURSOR [G]): BOOLEAN is
			-- Is `a_cursor' a valid cursor?
		require
			a_cursor_not_void: a_cursor /= Void
		do
			Result := a_cursor.container = Current
		end

feature -- Cursor movement

	go_to (a_cursor: like new_cursor) is
			-- Move internal cursor to `a_cursor''s position.
		require
			cursor_not_void: a_cursor /= Void
			valid_cursor: valid_cursor (a_cursor)
		do
			internal_cursor.go_to (a_cursor)
		ensure
			same_position: same_position (a_cursor)
		end

feature {NONE} -- Implementation

	internal_cursor: like new_cursor is
			-- Internal cursor
		deferred
		end

feature {DS_CURSOR} -- Implementation

	add_traversing_cursor (a_cursor: like new_cursor) is
			-- Add `a_cursor' to the list of traversing cursors
			-- (i.e. cursors associated with current container
			-- and which are not currently `off').
		require
			a_cursor_not_void: a_cursor /= Void
		do
			if a_cursor /= internal_cursor then
				a_cursor.set_next_cursor (internal_cursor.next_cursor)
				internal_cursor.set_next_cursor (a_cursor)
			end
		end

	remove_traversing_cursor (a_cursor: like new_cursor) is
			-- Remove `a_cursor' from the list of traversing cursors
			-- (i.e. cursors associated with current container
			-- and which are not currently `off').
		require
			a_cursor_not_void: a_cursor /= Void
		local
			current_cursor, previous_cursor: like new_cursor
		do
			if a_cursor /= internal_cursor then
				from
					previous_cursor := internal_cursor
					current_cursor := previous_cursor.next_cursor
				until
					current_cursor = a_cursor or
					current_cursor = Void
				loop
					previous_cursor := current_cursor
					current_cursor := current_cursor.next_cursor
				end
				if current_cursor = a_cursor then
					previous_cursor.set_next_cursor (a_cursor.next_cursor)
					a_cursor.set_next_cursor (Void)
				end
			end
		end

invariant

	empty_constraint: is_empty implies off
	internal_cursor_not_void: internal_cursor /= Void
	valid_internal_cursor: valid_cursor (internal_cursor)

end -- class DS_TRAVERSABLE
