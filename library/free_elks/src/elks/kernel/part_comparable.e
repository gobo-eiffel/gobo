note
	description: "Objects that may be compared according to a partial order relation"
	library: "Free implementation of ELKS library"
	status: "See notice at end of class."
	legal: "See notice at end of class."
	date: "$Date$"
	revision: "$Revision$"

deferred class
	PART_COMPARABLE

feature -- Comparison

	is_less alias "<" (other: like Current): BOOLEAN
			-- Is current object less than `other'?
		require
			other_exists: other /= Void
		deferred
		end

	is_less_equal alias "<=" alias "≤" (other: like Current): BOOLEAN
			-- Is current object less than or equal to `other'?
		require
			other_exists: other /= Void
		do
			Result := (Current < other) or (Current ~ other)
		end

	is_greater alias ">" (other: like Current): BOOLEAN
			-- Is current object greater than `other'?
		require
			other_exists: other /= Void
		do
			Result := other < Current
		end

	is_greater_equal alias ">=" alias "≥" (other: like Current): BOOLEAN
			-- Is current object greater than or equal to `other'?
		require
			other_exists: other /= Void
		do
			Result := (other < Current) or (Current ~ other)
		end

note
	copyright: "Copyright (c) 1984-2020, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
