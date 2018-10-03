note
	description: "Cursors for hash table traversal"
	library: "Free implementation of ELKS library"
	legal: "See notice at end of class."
	status: "See notice at end of class."
	names: linked_list_cursor, cursor;
	contents: generic;
	date: "$Date$"
	revision: "$Revision$"

class HASH_TABLE_CURSOR inherit

	CURSOR

create
	make

feature {NONE} -- Initialization

	make (pos: INTEGER)
			-- Create a new cursor.
		do
			position := pos
		ensure
			position_set: position = pos
		end

feature {HASH_TABLE} -- Access

	position: INTEGER;
			-- Cursor position

note
	copyright: "Copyright (c) 1984-2012, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
