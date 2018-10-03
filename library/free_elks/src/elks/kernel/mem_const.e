note
	description: "[
		Constants used by memory management.
		This class may be used as ancestor by classes needing its facilities.
		]"
	library: "Free implementation of ELKS library"
	status: "See notice at end of class."
	legal: "See notice at end of class."
	date: "$Date$"
	revision: "$Revision$"

class
	MEM_CONST

feature -- Access

	Total_memory: INTEGER = 0
			-- Code for all the memory managed
			-- by the garbage collector

	Eiffel_memory: INTEGER = 1
			-- Code for the Eiffel memory managed
			-- by the garbage collector

	C_memory: INTEGER = 2
			-- Code for the C memory managed
			-- by the garbage collector

	Full_collector: INTEGER = 0
			-- Statistics for full collections

	Incremental_collector: INTEGER = 1;
			-- Statistics for incremental collections

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
