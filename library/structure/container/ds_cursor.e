note

	description:

		"Cursors for data structure traversals"

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 1999-2001, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class DS_CURSOR [G]

inherit

	ANY
		redefine
			copy,
			is_equal
		end

	KL_IMPORTED_ANY_ROUTINES
		undefine
			copy,
			is_equal
		end

feature -- Access

	item: G
			-- Item at cursor position
		require
			not_off: not off
		do
			Result := container.cursor_item (Current)
		end

	container: DS_TRAVERSABLE [G]
			-- Data structure traversed
		deferred
		end

feature -- Status report

	off: BOOLEAN
			-- Is there no item at cursor position?
		do
			Result := container.cursor_off (Current)
		end

	same_position (other: like Current): BOOLEAN
			-- Is current cursor at same position as `other'?
		require
			other_not_void: other /= Void
		do
			Result := container.cursor_same_position (Current, other)
		end

	valid_cursor (other: like Current): BOOLEAN
			-- Is `other' a valid cursor according
			-- to current traversal strategy?
		require
			other_not_void: other /= Void
		do
			Result := container.valid_cursor (other)
		ensure
			Result implies container.valid_cursor (other)
		end

feature -- Cursor movement

	go_to (other: like Current)
			-- Move cursor to `other''s position.
		require
			other_not_void: other /= Void
			other_valid: valid_cursor (other)
		do
			container.cursor_go_to (Current, other)
		ensure
			same_position: same_position (other)
		end

feature -- Duplication

	copy (other: like Current)
			-- Copy `other' to current cursor.
		do
			if container /= Void and then not off then
				container.remove_traversing_cursor (Current)
			end
			standard_copy (other)
			next_cursor := Void
			if not off then
				container.add_traversing_cursor (Current)
			end
		end

feature -- Comparison

	is_equal (other: like Current): BOOLEAN
			-- Are `other' and current cursor at the same position?
		do
			if ANY_.same_types (Current, other) then
				Result := same_position (other)
			end
		end

feature {DS_TRAVERSABLE} -- Implementation

	next_cursor: DS_CURSOR [G]
			-- Next cursor
			-- (Used by `container' to keep track of traversing
			-- cursors (i.e. cursors associated with `container'
			-- and which are not currently `off').)

	set_next_cursor (a_cursor: like next_cursor)
			-- Set `next_cursor' to `a_cursor'.
		do
			next_cursor := a_cursor
		ensure
			next_cursor_set: next_cursor = a_cursor
		end

invariant

	container_not_void: container /= Void
	empty_constraint: container.is_empty implies off

end
