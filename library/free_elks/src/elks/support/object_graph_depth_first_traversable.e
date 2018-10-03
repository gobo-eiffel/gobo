note
	description: "Objects that traverse object graphs starting at the root object in a depth first manner."
	library: "Free implementation of ELKS library"
	legal: "See notice at end of class."
	status: "See notice at end of class."
	author: "Stephanie Balzer"
	date: "$Date$"
	revision: "$Revision$"

class
	OBJECT_GRAPH_DEPTH_FIRST_TRAVERSABLE
	
inherit
	OBJECT_GRAPH_TRAVERSABLE

feature {NONE} -- Implementation

	new_dispenser: ARRAYED_STACK [separate ANY]
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
