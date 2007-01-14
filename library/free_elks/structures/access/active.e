indexing

	description: "[
		``Active'' data structures, which at every stage have
		a possibly undefined ``current item''.
		Basic access and modification operations apply to the current item.
		]"
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

	item: G is
			-- Current item
		require
			readable: readable
		deferred
		end

feature -- Status report

	readable: BOOLEAN is
			-- Is there a current item that may be read?
		deferred
		end

	writable: BOOLEAN is
			-- Is there a current item that may be modified?
		deferred
		end

feature -- Element change

	replace (v: G) is
			-- Replace current item by `v'.
		require
			writable: writable
		deferred
		ensure
			item_replaced: item = v
		end

feature -- Removal

	remove is
			-- Remove current item.
		require
			prunable: prunable
			writable: writable
		deferred
		end

invariant

	writable_constraint: writable implies readable
	empty_constraint: is_empty implies (not readable) and (not writable)

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







end -- class ACTIVE



