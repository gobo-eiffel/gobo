indexing

	description:

		"Cursors for data structure traversals"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class DS_CURSOR [G]

inherit

	ANY
		redefine
			copy, is_equal
		end

feature -- Access

	item: G is
			-- Item at cursor position
		require
			not_off: not off
		deferred
		end

	container: DS_TRAVERSABLE [G] is
			-- Data structure traversed
		deferred
		end

feature -- Status report

	off: BOOLEAN is
			-- Is there no item at cursor position?
		deferred
		end

	same_position (other: like Current): BOOLEAN is
			-- Is current cursor at same position as `other'?
		require
			other_not_void: other /= Void
		deferred
		end

	is_valid: BOOLEAN is
			-- Is cursor valid?
		obsolete
			"Backward compatibility with Gobo 1.4"
		do
			Result := True
		ensure
			definition: Result = True
		end

feature -- Cursor movement

	go_to (other: like Current) is
			-- Move cursor to `other''s position.
		require
			other_not_void: other /= Void
			valid_cursor: container.valid_cursor (other)
		deferred
		ensure
			same_position: same_position (other)
		end

feature -- Duplication

	copy (other: like Current) is
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

	is_equal (other: like Current): BOOLEAN is
			-- Are `other' and current cursor at the same position?
		do
			Result := same_position (other)
		end

feature {DS_TRAVERSABLE} -- Implementation

	next_cursor: like Current
			-- Next cursor
			-- (Used by `container' to keep track of traversing
			-- cursors (i.e. cursors associated with `container'
			-- and which are not currently `off').)

	set_next_cursor (a_cursor: like Current) is
			-- Set `next_cursor' to `a_cursor'.
		do
			next_cursor := a_cursor
		ensure
			next_cursor_set: next_cursor = a_cursor
		end

invariant

	container_not_void: container /= Void

-- The following assertion are commented out because
-- some Eiffel compilers check invariants even when the
-- execution of the creation procedure is not completed.
-- (In this case, this is `container' which is not fully
-- created yet, breaking its invariant.)

--	empty_constraint: container.is_empty implies off

end -- class DS_CURSOR
