indexing

	description:

		"Cursors for structure traversals"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class DS_CURSOR [G]

feature -- Access

	item: G is
			-- Item at cursor position
		require
			valid_cursor: is_valid
			not_off: not off
		deferred
		end

	container: DS_TRAVERSABLE [G] is
			-- Structure traversed
		deferred
		end

feature -- Status report

	off: BOOLEAN is
			-- Is there no item at cursor position?
		require
			valid_cursor: is_valid
		deferred
		end

	is_valid: BOOLEAN is
			-- Is cursor valid?
			-- (A cursor might become invalid if `container'
			-- has been modified during traversal.)
		deferred
		end

invariant

	container_not_void: container /= Void
	empty_constraint: container.is_empty implies off

end -- class DS_CURSOR
