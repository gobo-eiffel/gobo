note
	description: "[
		Queues (first-in, first-out dispensers), without commitment 
		to a particular representation
		]"
	library: "Free implementation of ELKS library"
	legal: "See notice at end of class."
	status: "See notice at end of class."
	names: queue, dispenser;
	access: fixed, fifo, membership;
	contents: generic;
	date: "$Date$"
	revision: "$Revision$"

deferred class QUEUE [G]

inherit
	DISPENSER [G]

feature -- Element change

	 force (v: like item)
			-- Add `v' as newest item.
		deferred
		end

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
