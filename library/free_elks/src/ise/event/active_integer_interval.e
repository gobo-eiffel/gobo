note
	description: "[
		Contiguous integer interval that calls an action sequence
		when it changes.
	]"
	legal: "See notice at end of class."
	status: "See notice at end of class."
	keywords: "event, action, linked, list"
	date: "$Date: 2017-03-23 19:18:26 +0000 (Thu, 23 Mar 2017) $"
	revision: "$Revision: 100033 $"

class
	ACTIVE_INTEGER_INTERVAL

inherit
	INTEGER_INTERVAL
		redefine
			extend, put,
			resize,
			resize_exactly,
			copy,
			adapt
		end

create
	make

feature -- Initialization

	adapt (other: INTEGER_INTERVAL)
			-- Reset to be the same interval as `other'.
		do
			Precursor (other)
			on_change
		end

feature -- Element change

	extend (v: INTEGER)
			-- Make sure that interval goes all the way
			-- to `v' (up or down).
		do
			put (v)
		end

	put (v: INTEGER)
			-- Make sure that interval goes all the way
			-- to `v' (up or down).
		local
			l_change: BOOLEAN
		do
			l_change := v < lower or else v > upper
			Precursor (v)
			if l_change then
				on_change
			end
		end

feature -- Resizing

	resize (min_index, max_index: INTEGER)
			-- Rearrange interval to go from at most
			-- `min_index' to at least `max_index',
			-- encompassing previous bounds.
		local
			l_change: BOOLEAN
		do
			l_change := lower /= min_index or else upper /= max_index
			Precursor (min_index, max_index)
			if l_change then
				on_change
			end
		end

	resize_exactly (min_index, max_index: INTEGER)
			-- Rearrange interval to go from
			-- `min_index' to `max_index'.
		local
			l_change: BOOLEAN
		do
			l_change := lower /= min_index or else upper /= max_index
			Precursor (min_index, max_index)
			if l_change then
				on_change
			end
		end

feature -- Duplication

	copy (other: like Current)
			-- Reset to be the same interval as `other'.
		do
			if other /= Current then
				Precursor (other)
				on_change
			end
		end

feature -- Event handling

	change_actions: ACTION_SEQUENCE [TUPLE]
			-- Actions performed when interval changes.
		do
			Result := opo_change_actions
			if Result = Void then
				create Result
				opo_change_actions := Result
			end
		ensure
			not_void: Result /= Void
		end

feature {NONE} -- Implementation

	on_change
			-- Called when interval changes.
		do
			if attached opo_change_actions as a then
				a.call
			end
		end

	opo_change_actions: detachable ACTION_SEQUENCE [TUPLE];
			-- Once per object implementation for `change_actions'

note
	library:	"EiffelBase: Library of reusable components for Eiffel."
	copyright:	"Copyright (c) 1984-2017, Eiffel Software and others"
	license:	"Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
