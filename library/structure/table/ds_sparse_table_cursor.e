indexing

	description:

		"Cursors for sparse table traversals"

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 2000-2001, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class DS_SPARSE_TABLE_CURSOR [G, K]

inherit

	DS_BILINEAR_CURSOR [G]
		redefine
			next_cursor
		end

	DS_DYNAMIC_CURSOR [G]
		redefine
			next_cursor
		end

creation

	make

feature {NONE} -- Initialization

	make (a_table: like container) is
			-- Create a new cursor for `a_table'.
		require
			a_table_not_void: a_table /= Void
		do
			container := a_table
			position := container.before_position
		ensure
			container_set: container = a_table
			before: before
		end

feature -- Access

	key: K is
			-- Key at cursor position
		require
			not_off: not off
		do
			Result := container.cursor_key (Current)
		end

	container: DS_SPARSE_TABLE [G, K]
			-- Table traversed

feature -- Element change

	replace (v: G) is
			-- Replace item at cursor position by `v'.
		do
			container.items_put (v, position)
		end

feature {DS_SPARSE_TABLE, DS_SPARSE_TABLE_CURSOR} -- Implementation

	position: INTEGER
			-- Internal position in table

feature {DS_SPARSE_TABLE} -- Implementation

	set_position (p: INTEGER) is
			-- Set `position' to `p'.
		require
			valid_p: valid_position (p)
		do
			position := p
		ensure
			position_set: position = p
		end

	set_after is
			-- Set `position' to after position
		do
			position := container.after_position
		ensure
			after: after
		end

	set_before is
			-- Set `position' to before position
		do
			position := container.before_position
		ensure
			before: before
		end

	valid_position (p: INTEGER): BOOLEAN is
			-- Is `p' a valid value for `position'?
		do
			Result := (p = container.before_position or p = container.after_position) or
				(container.valid_position (p) and then container.valid_slot (p))
		ensure
			not_off: (container.valid_position (p) and then container.valid_slot (p)) implies Result
			before: (p = container.before_position) implies Result
			after: (p = container.after_position) implies Result
			valid_slot: (Result and container.valid_position (p)) implies container.valid_slot (p)
		end

feature {DS_SPARSE_TABLE} -- Implementation

	next_cursor: DS_SPARSE_TABLE_CURSOR [G, K]
			-- Next cursor
			-- (Used by `container' to keep track of traversing
			-- cursors (i.e. cursors associated with `container'
			-- and which are not currently `off').)

invariant

-- The following assertion are commented out because
-- some Eiffel compilers check invariants even when the
-- execution of the creation procedure is not completed.
-- (In this case, this is `container' which is not fully
-- created yet, breaking its invariant.)

--	valid_position: valid_position (position)

end
