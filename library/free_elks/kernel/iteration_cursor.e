note
	description: "External iteration cursor used by `across...loop...end'."
	library: "Free implementation of ELKS library"
	date: "$Date: 2011-05-18 01:25:55 +0200 (Wed, 18 May 2011) $"
	revision: "$Revision: 510 $"

deferred class
	ITERATION_CURSOR [G]

feature -- Access

	item: G
			-- Item at current cursor position.
		require
			valid_position: not after
		deferred
		end

feature -- Status report	

	after: BOOLEAN
			-- Are there no more items to iterate over?
		deferred
		end

feature -- Cursor movement

	forth
			-- Move to next position.
		require
			valid_position: not after
		deferred
		end

note
	copyright: "Copyright (c) 1984-2011, Eiffel Software and others"
	license: "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
