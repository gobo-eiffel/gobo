indexing

	description: "[
		Active structures, which always have a current position
		accessible through a cursor.
		]"
	legal: "See notice at end of class."

	status: "See notice at end of class."
	names: cursor_structure, access;
	access: cursor, membership;
	contents: generic;
	date: "$Date$"
	revision: "$Revision$"

deferred class CURSOR_STRUCTURE [G] inherit

	ACTIVE [G]

feature -- Access

	cursor: CURSOR is
			-- Current cursor position
		deferred
		ensure
			cursor_not_void: Result /= Void
		end

feature -- Status report

	valid_cursor (p: CURSOR): BOOLEAN is
			-- Can the cursor be moved to position `p'?
		deferred
		end

feature -- Cursor movement

	go_to (p: CURSOR) is
			-- Move cursor to position `p'.
		require
			cursor_position_valid: valid_cursor (p)
		deferred
		end

indexing
	library:	"EiffelBase: Library of reusable components for Eiffel."
	copyright:	"Copyright (c) 1984-2006, Eiffel Software and others"
	license:	"Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			 Eiffel Software
			 356 Storke Road, Goleta, CA 93117 USA
			 Telephone 805-685-1006, Fax 805-685-6869
			 Website http://www.eiffel.com
			 Customer support http://support.eiffel.com
		]"







end -- class CURSOR_STRUCTURE



