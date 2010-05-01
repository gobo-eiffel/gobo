note

	description:

		"Cursors for keys of sparse tables, viewed as linear containers."

	remark: "[
		Ideally the sparse tables should be descendants of both
		DS_LINEAR [G] and DS_LINEAR [K], but this does not work
		in Eiffel.
	]"
	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class DS_SPARSE_TABLE_KEYS_CURSOR [G, K]

inherit

	DS_BILINEAR_CURSOR [K]
		redefine
			next_cursor
		end

create {DS_SPARSE_TABLE_KEYS}

	make

feature {NONE} -- Initialization

	make (a_container: like container) is
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

feature -- Access

	container: DS_SPARSE_TABLE_KEYS [G, K]
			-- Container traversed

feature {DS_SPARSE_TABLE_KEYS} -- Implementation

	table_cursor: DS_SPARSE_TABLE_CURSOR [G, K]
			-- Cursor for the table to which the keys belong

	next_cursor: DS_SPARSE_TABLE_KEYS_CURSOR [G, K]
			-- Next cursor
			-- (Used by `container' to keep track of traversing
			-- cursors (i.e. cursors associated with `container'
			-- and which are not currently `off').)

invariant

	table_cursor_not_void: table_cursor /= Void

end
