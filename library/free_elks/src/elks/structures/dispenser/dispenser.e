note
	description: "[
			Dispensers: containers for which clients have no say
			as to what item they can access at a given time.
			Examples include stacks and queues.
		]"
	library: "Free implementation of ELKS library"
	legal: "See notice at end of class."
	status: "See notice at end of class."
	names: dispenser, active;
	access: fixed, membership;
	contents: generic;
	date: "$Date: 2012-07-23 23:02:19 +0200 (Mon, 23 Jul 2012) $"
	revision: "$Revision: 567 $"

deferred class DISPENSER [G] inherit

	ACTIVE [G]

	FINITE [G]

feature -- Status report

	readable: BOOLEAN
			-- Is there a current item that may be read?
		do
			Result := not is_empty
		end

	writable: BOOLEAN
			-- Is there a current item that may be modified?
		do
			Result := not is_empty
		end

feature -- Element change

	append (s: SEQUENCE [G])
			-- Append a copy of `s'.
			-- (Synonym for `fill')
		require
			s_not_void: s /= Void
			extendible: extendible
		do
			fill (s)
		end

	force (v: like item)
			-- Add item `v'.
		require
			extendible: extendible
		deferred
		ensure
			item_inserted: is_inserted (v)
		end

	extend, put (v: like item)
			-- Add item `v'.
		deferred
		end

invariant

	readable_definition: readable = not is_empty
	writable_definition: writable = not is_empty

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
