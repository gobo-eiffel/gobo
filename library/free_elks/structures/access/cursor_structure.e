indexing

	description: "[
		Active structures, which always have a current position
		accessible through a cursor.
		]"

	status: "See notice at end of class"
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

	library: "[
			EiffelBase: Library of reusable components for Eiffel.
			]"

	status: "[
			Copyright 1986-2001 Interactive Software Engineering (ISE).
			For ISE customers the original versions are an ISE product
			covered by the ISE Eiffel license and support agreements.
			]"

	license: "[
			EiffelBase may now be used by anyone as FREE SOFTWARE to
			develop any product, public-domain or commercial, without
			payment to ISE, under the terms of the ISE Free Eiffel Library
			License (IFELL) at http://eiffel.com/products/base/license.html.
			]"

	source: "[
			Interactive Software Engineering Inc.
			ISE Building
			360 Storke Road, Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Electronic mail <info@eiffel.com>
			Customer support http://support.eiffel.com
			]"

	info: "[
			For latest info see award-winning pages: http://eiffel.com
			]"

end -- class CURSOR_STRUCTURE



