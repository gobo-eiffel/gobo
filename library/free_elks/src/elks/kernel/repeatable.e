note
	description: "Object that may iterate over its own states."
	library: "Free implementation of ELKS library"
	status: "See notice at end of class."
	legal: "See notice at end of class."
	date: "$Date$"
	revision: "$Revision$"

deferred class REPEATABLE

inherit

	ITERATION_CURSOR [REPEATABLE]
		redefine
			item
		end

feature -- Access

	item: like Current
	    		-- Current object on that iteration is performed.
		do
			Result := Current
		end

feature -- Iteration

	act
			-- Do one action at the current step of iteration.
		require
			not after
		do
		end

	repeat
			-- Repeat `act' until `after'.
		do
				-- The following loop can be replaced with `do_all (agent act)'
				-- when {ITERATION_CURSOR} supports agent-based iteration features.
			from
			until
				after
			loop
				act
				forth
			end
		end

note
	copyright: "Copyright (c) 2012, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
