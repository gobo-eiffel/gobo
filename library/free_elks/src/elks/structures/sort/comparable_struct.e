note
	description: "[
		Data structures whose items may be compared
		according to a total order relation
		]"
	library: "Free implementation of ELKS library"
	legal: "See notice at end of class."
	status: "See notice at end of class."
	names: comparable_struct;
	access: min, max;
	contents: generic;
	date: "$Date$"
	revision: "$Revision$"

deferred class COMPARABLE_STRUCT [G -> COMPARABLE] inherit

	BILINEAR [G]

feature -- Measurement

	min: like item
			-- Minimum item
		require
			min_max_available

		do
			from
				start
				Result := item
				forth
			until
				off
			loop
				if item < Result then
					Result := item
				end
				forth
			end
		ensure
		--	smallest: For every item `it' in structure, `Result' <= `it'
		end

	max: like item
			-- Maximum item
		require
			min_max_available

		do
			from
				start
				Result := item
				forth
			until
				off
			loop
				if item > Result then
					Result := item
				end
				forth
			end
		ensure
		--	largest: For every item `it' in structure, `it' <= `Result'
		end

	min_max_available: BOOLEAN
			-- Can min and max be computed?
		do
			Result := not is_empty
		ensure
			Result implies not is_empty
		end

feature {NONE} -- Inapplicable

	index: INTEGER
		do
		end

invariant

	empty_constraint: min_max_available implies not is_empty

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
