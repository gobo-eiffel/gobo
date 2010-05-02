note

	description:

		"Cursors for bilinear tables"

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 2008, Daniel Tuser and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class DS_BILINEAR_TABLE_CURSOR [G, K]

inherit

	DS_BILINEAR_CURSOR [G]
		redefine
			container,
			next_cursor
		end

feature -- Access

	key: K
			-- Key at cursor position
		require
			not_off: not off
		deferred
		end

	container: DS_BILINEAR_TABLE [G, K]
			-- Bilinear table traversed
		deferred
		end

feature {DS_BILINEAR_TABLE} -- Implementation

	next_cursor: DS_BILINEAR_TABLE_CURSOR [G, K]
			-- Next cursor
			-- (Used by `container' to keep track of traversing
			-- cursors (i.e. cursors associated with `container'
			-- and which are not currently `off').)

end
