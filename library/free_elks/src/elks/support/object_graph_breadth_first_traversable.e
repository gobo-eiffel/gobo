note
	description: "Objects that traverse object graphs starting at the root object in a breadth first manner."
	library: "Free implementation of ELKS library"
	legal: "See notice at end of class."
	status: "See notice at end of class."
	author: "Stephanie Balzer"
	date: "$Date: 2013-03-27 00:34:50 -0700 (Wed, 27 Mar 2013) $"
	revision: "$Revision: 92359 $"

class
	OBJECT_GRAPH_BREADTH_FIRST_TRAVERSABLE

inherit
	OBJECT_GRAPH_TRAVERSABLE

feature {NONE} -- Implementation

	new_dispenser: ARRAYED_QUEUE [separate ANY]
			-- Create the dispenser to use for storing visited objects.
		do
			create Result.make (default_size)
		end

note
	copyright: "Copyright (c) 1984-2013, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"







end
