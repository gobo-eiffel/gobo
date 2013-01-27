note
	description: "Structure that can be iterated over using `across...loop...end'."
	library: "Free implementation of ELKS library"
	date: "$Date: 2011-05-18 01:25:55 +0200 (Wed, 18 May 2011) $"
	revision: "$Revision: 510 $"

deferred class
	ITERABLE [G]

feature -- Access

	new_cursor: ITERATION_CURSOR [G]
			-- Fresh cursor associated with current structure
		deferred
		ensure
			result_attached: Result /= Void
		end

note
	copyright: "Copyright (c) 1984-2009, Eiffel Software and others"
	license: "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
