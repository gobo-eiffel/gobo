note
	description: "Cursors for circular lists"
	library: "Free implementation of ELKS library"
	legal: "See notice at end of class."
	status: "See notice at end of class."
	names: circular_cursor, cursor;
	contents: generic;
	date: "$Date: 2012-07-23 23:02:19 +0200 (Mon, 23 Jul 2012) $"
	revision: "$Revision: 567 $"

class CIRCULAR_CURSOR

 inherit
	CURSOR

create
	make

feature {NONE} -- Initialization

	make (curs: like cursor; int: BOOLEAN; start: INTEGER)
			-- Create a cursor and set it up on `active_element'.
		do
			cursor := curs
			internal_exhausted := int
			starter := start
		end

feature {CIRCULAR} -- Implementation

	cursor: CURSOR
			-- Current element in implementation

	internal_exhausted: BOOLEAN
			-- Has traversal passsed the start?

	starter: INTEGER;
			-- Index of start position

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
