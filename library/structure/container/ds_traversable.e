note

	description:

		"Data structures that can be traversed. Traversable containers %
		%are equipped with an internal cursor and external cursors which %
		%can be used for simultaneous traversals."

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 1999-2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class DS_TRAVERSABLE [G]

inherit

	DS_CONTAINER [G]

feature -- Access

	item_for_iteration: G
			-- Item at internal cursor position
		require
			not_off: not off
		do
			Result := cursor_item (internal_cursor)
		end

	new_cursor: DS_CURSOR [G]
			-- New external cursor for traversal
		deferred
		ensure
			cursor_not_void: Result /= Void
			valid_cursor: valid_cursor (Result)
		end

feature -- Status report

	off: BOOLEAN
			-- Is there no item at internal cursor position?
		do
			Result := cursor_off (internal_cursor)
		end

	same_position (a_cursor: like new_cursor): BOOLEAN
			-- Is internal cursor at same position as `a_cursor'?
		require
			a_cursor_not_void: a_cursor /= Void
		do
			Result := cursor_same_position (internal_cursor, a_cursor)
		end

	valid_cursor (a_cursor: DS_CURSOR [G]): BOOLEAN
			-- Is `a_cursor' a valid cursor?
		require
			a_cursor_not_void: a_cursor /= Void
		do
			Result := a_cursor.container = Current
		end

feature -- Cursor movement

	go_to (a_cursor: like new_cursor)
			-- Move internal cursor to `a_cursor''s position.
		require
			cursor_not_void: a_cursor /= Void
			valid_cursor: valid_cursor (a_cursor)
		do
			cursor_go_to (internal_cursor, a_cursor)
		ensure
			same_position: same_position (a_cursor)
		end

feature {NONE} -- Cursor implementation

	set_internal_cursor (c: like internal_cursor)
			-- Set `internal_cursor' to `c'.
		deferred
		ensure
			internal_cursor_set: internal_cursor = c
		end

	internal_cursor: like new_cursor
			-- Internal cursor
		deferred
		end

feature {DS_CURSOR} -- Cursor implementation

	cursor_item (a_cursor: like new_cursor): G
			-- Item at `a_cursor' position
		require
			a_cursor_not_void: a_cursor /= Void
			a_cursor_valid: valid_cursor (a_cursor)
			a_cursor_not_off: not cursor_off (a_cursor)
		deferred
		end

	cursor_off (a_cursor: like new_cursor): BOOLEAN
			-- Is there no item at `a_cursor' position?
		require
			a_cursor_not_void: a_cursor /= Void
			a_cursor_valid: valid_cursor (a_cursor)
		deferred
		end

	cursor_same_position (a_cursor, other: like new_cursor): BOOLEAN
			-- Is `a_cursor' at same position as `other'?
		require
			a_cursor_not_void: a_cursor /= Void
			a_cursor_valid: valid_cursor (a_cursor)
			other_not_void: other /= Void
		deferred
		end

	cursor_go_to (a_cursor, other: like new_cursor)
			-- Move `a_cursor' to `other''s position.
		require
			cursor_not_void: a_cursor /= Void
			a_cursor_valid: valid_cursor (a_cursor)
			other_not_void: other /= Void
			other_valid: valid_cursor (other)
		deferred
		ensure
			same_position: cursor_same_position (a_cursor, other)
		end

	add_traversing_cursor (a_cursor: like new_cursor)
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

	remove_traversing_cursor (a_cursor: like new_cursor)
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
					current_cursor = a_cursor or current_cursor = Void
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

feature {NONE} -- Implementation

	initialized: BOOLEAN
			-- Some Eiffel compilers check invariants even when the
			-- execution of the creation procedure is not completed.
			-- (In this case, checking the assertions of the being
			-- created `internal_cursor' triggers the invariants
			-- on the current container. So these invariants need
			-- to be protected.)
		do
			Result := (internal_cursor /= Void)
		end

invariant

	empty_constraint: initialized implies (is_empty implies off)
	internal_cursor_not_void: initialized implies (internal_cursor /= Void)
	valid_internal_cursor: initialized implies valid_cursor (internal_cursor)

end
