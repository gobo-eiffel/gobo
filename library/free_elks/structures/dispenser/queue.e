indexing

	description: "[
		Queues (first-in, first-out dispensers), without commitment 
		to a particular representation
		]"
	legal: "See notice at end of class."

	status: "See notice at end of class."
	names: queue, dispenser;
	access: fixed, fifo, membership;
	contents: generic;
	date: "$Date$"
	revision: "$Revision$"

deferred class QUEUE [G] inherit

	DISPENSER [G]
		export
			{NONE} prune, prune_all
		end

feature -- Element change

	 force (v: like item) is
			-- Add `v' as newest item.
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







end -- class QUEUE



