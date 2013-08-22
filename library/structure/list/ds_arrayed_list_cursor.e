note

	description:

		"Cursors for arrayed list traversals"

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 1999-2013, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class DS_ARRAYED_LIST_CURSOR [G]

inherit

	DS_LIST_CURSOR [G]
		redefine
			next_cursor,
			before
		end

create

	make

feature {NONE} -- Initialization

	make (a_list: like container)
			-- Create a new cursor for `a_list'.
		require
			a_list_not_void: a_list /= Void
		do
			container := a_list
			position := 0
		ensure
			container_set: container = a_list
			before: before
		end

feature -- Access

	container: DS_ARRAYED_LIST [G]
			-- List traversed

feature -- Status report

	after: BOOLEAN
			-- Is there no valid position to right of cursor?
		do
			Result := (position = after_position)
		end

	before: BOOLEAN
			-- Is there no valid position to left of cursor?
		do
			Result := (position = 0)
		end

feature -- Element change

	replace (v: G)
			-- Replace item at cursor position by `v'.
			-- (Performance: O(1).)
		do
			container.replace (v, position)
		end

feature {DS_ARRAYED_LIST, DS_ARRAYED_LIST_CURSOR} -- Implementation

	position: INTEGER
			-- Internal position in list

feature {DS_ARRAYED_LIST} -- Implementation

	set_position (i: INTEGER)
			-- Set `position' to `i'.
		require
			valid_i: valid_position (i)
		do
			position := i
		ensure
			position_set: position = i
		end

	set_after
			-- Set `position' to after position.
		do
			position := after_position
		ensure
			after: after
		end

	set_before
			-- Set `position' to before position.
		do
			position := 0
		ensure
			before: before
		end

	valid_position (p: INTEGER): BOOLEAN
			-- Is `p' a valid value for `position'?
		do
			Result := p = after_position or (0 <= p and p <= container.count)
		ensure
			not_off: (1 <= p and p <= container.count) implies Result
			before: (p = 0) implies Result
			after: (p = after_position) implies Result
		end

	after_position: INTEGER = -1
			-- Special value for after cursor position

feature {DS_ARRAYED_LIST} -- Implementation

	next_cursor: detachable DS_ARRAYED_LIST_CURSOR [G]
			-- Next cursor
			-- (Used by `container' to keep track of traversing
			-- cursors (i.e. cursors associated with `container'
			-- and which are not currently `off').)

invariant

		-- The following assertion is commented out because
		-- some Eiffel compilers check invariants even when the
		-- execution of the creation procedure is not completed.
		-- (In this case, this is `container' which is not fully
		-- created yet, breaking its invariant.)
--	valid_position: valid_position (position)

end
