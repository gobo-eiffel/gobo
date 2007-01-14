indexing

	description: "[
			Dispensers: containers for which clients have no say
			as to what item they can access at a given time.
			Examples include stacks and queues.
		]"
	legal: "See notice at end of class."

	status: "See notice at end of class."
	names: dispenser, active;
	access: fixed, membership;
	contents: generic;
	date: "$Date$"
	revision: "$Revision$"

deferred class DISPENSER [G] inherit

	ACTIVE [G]

	FINITE [G]

feature -- Status report

	readable: BOOLEAN is
			-- Is there a current item that may be read?
		do
			Result := not is_empty
		end

	writable: BOOLEAN is
			-- Is there a current item that may be modified?
		do
			Result := not is_empty
		end

feature -- Element change

	append (s: SEQUENCE [G]) is
			-- Append a copy of `s'.
			-- (Synonym for `fill')
		do
			fill (s)
		end

	extend, force, put (v: like item) is
			-- Add item `v'.
		deferred
		end

invariant

	readable_definition: readable = not is_empty
	writable_definition: writable = not is_empty

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







end -- class DISPENSER



