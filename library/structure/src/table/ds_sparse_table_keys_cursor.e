note

	description:

		"Cursors for keys of sparse tables, viewed as linear containers."

	remark: "[
		Ideally the sparse tables should be descendants of both
		DS_LINEAR [G] and DS_LINEAR [K], but this does not work
		in Eiffel.
	]"
	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 2006-2013, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class DS_SPARSE_TABLE_KEYS_CURSOR [G, K]

inherit

	DS_BILINEAR_CURSOR [K]
		redefine
			next_cursor,
			before
		end

create {DS_SPARSE_TABLE_KEYS}

	make, make_with_table_cursor

feature {NONE} -- Initialization

	make (a_container: like container)
			-- Create a new cursor for `a_container'.
		require
			a_container_not_void: a_container /= Void
		do
			container := a_container
			table_cursor := container.table.new_cursor
		ensure
			container_set: container = a_container
			before: before
		end

	make_with_table_cursor (a_container: like container; a_table_cursor: like table_cursor)
			-- Create a new cursor for `a_container'.
			-- `a_table_cursor' is a cursor for `a_container.table'.
			--
			-- This routine is to make the void-safe compiler happy,
			-- with no qualified calls on `a_container'.
		require
			a_container_not_void: a_container /= Void
			a_table_cursor_not_void: a_table_cursor /= Void
		do
			container := a_container
			table_cursor := a_table_cursor
		ensure
			container_set: container = a_container
			table_cursor_set: table_cursor = a_table_cursor
-- The following precondition is commented out because
-- ISE 7.3 in void-safe mode does not accept qualified calls
-- here (and there is a qualified call in `before').
--			before: before
		end

feature -- Access

	container: DS_SPARSE_TABLE_KEYS [G, K]
			-- Container traversed

feature -- Status report

	after: BOOLEAN
			-- Is there no valid position to right of cursor?
		do
			Result := table_cursor.after
		end

	before: BOOLEAN
			-- Is there no valid position to left of cursor?
		do
			Result := table_cursor.before
		end

feature {DS_SPARSE_TABLE_KEYS} -- Implementation

	table_cursor: like container.table.new_cursor
			-- Cursor for the table to which the keys belong

	next_cursor: detachable DS_SPARSE_TABLE_KEYS_CURSOR [G, K]
			-- Next cursor
			-- (Used by `container' to keep track of traversing
			-- cursors (i.e. cursors associated with `container'
			-- and which are not currently `off').)

invariant

	table_cursor_not_void: table_cursor /= Void

end
