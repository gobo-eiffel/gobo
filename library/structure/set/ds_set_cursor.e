note

	description:

		"Cursors for set traversals"

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 2001, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class DS_SET_CURSOR [G]

inherit

	DS_LINEAR_CURSOR [G]
		redefine
			container,
			next_cursor
		end

feature -- Access

	container: DS_SET [G]
			-- Set traversed
		deferred
		end

feature {DS_SET} -- Implementation

	next_cursor: DS_SET_CURSOR [G]
			-- Next cursor
			-- (Used by `container' to keep track of traversing
			-- cursors (i.e. cursors associated with `container'
			-- and which are not currently `off').)

end
