note
	description: "[
		`Active' data structures, which at every stage have
		a possibly undefined `current item'.
		Basic access and modification operations apply to the current item.
		]"
	library: "Free implementation of ELKS library"
	legal: "See notice at end of class."
	status: "See notice at end of class."
	names: active, access
	access: membership
	contents: generic
	date: "$Date$"
	revision: "$Revision$"

deferred class ACTIVE [G] inherit

	BAG [G]

feature -- Access

	item: G
			-- Current item
		require
			readable: readable
		deferred
		end

feature -- Status report

	readable: BOOLEAN
			-- Is there a current item that may be read?
		deferred
		end

	writable: BOOLEAN
			-- Is there a current item that may be modified?
		deferred
		end

	replaceable: BOOLEAN
			-- Can current item be replaced?
		do
			Result := True
		end

feature -- Element change

	replace (v: G)
			-- Replace current item by `v'.
		require
			writable: writable
			replaceable: replaceable
		deferred
		ensure
			item_replaced: item = v
		end

feature -- Removal

	remove
			-- Remove current item.
		require
			prunable: prunable
			writable: writable
		deferred
		end

invariant

	writable_constraint: writable implies readable
	empty_constraint: is_empty implies (not readable) and (not writable)

note
	copyright: "Copyright (c) 1984-2017, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
