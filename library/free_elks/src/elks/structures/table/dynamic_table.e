note
	description: "Dynamically modifiable table."
	library: "Free implementation of ELKS library"
	names: dynamic_table
	access: cursor, key, membership
	contents: generic
	date: "$Date$"
	revision: "$Revision$"

deferred class DYNAMIC_TABLE [G, H] inherit

	TABLE [G, H]

feature -- Status report

	prunable: BOOLEAN
			-- May items be removed? (Answer: yes.)
		do
			Result := True
		end

feature -- Removal

	remove (k: H)
			-- Remove item at key `k'.
		require
			prunable: prunable
			valid_key: valid_key (k)
		deferred
		end

note
	copyright: "Copyright (c) 1984-2019, Eiffel Software and others"
	license: "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
