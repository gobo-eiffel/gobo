indexing

	description:
		"Sets whose items may be compared according to a total order relation"
	legal: "See notice at end of class."

	status: "See notice at end of class."
	names: comparable_set, comparable_struct;
	access: membership, min, max;
	contents: generic;
	date: "$Date$"
	revision: "$Revision$"

deferred class COMPARABLE_SET [G -> COMPARABLE] inherit

	SUBSET [G]
		undefine
			disjoint, symdif
		end

	COMPARABLE_STRUCT [G]
		rename
			min as cs_min,
			max as cs_max
		export
			{NONE}
				all
		undefine
			changeable_comparison_criterion
		end

feature -- Measurement

	min: G is
			-- Minimum item
		require
			not_empty: not is_empty
		do
			Result := cs_min
		ensure
			-- smallest: For every item `it' in set, `Result' <= `it'
		end

	max: G is
			-- Maximum item
		require
			not_empty: not is_empty
		do
			Result := cs_max
		ensure
			-- largest: For every item `it' in set, `element' <= `it'
		end

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







end -- class COMPARABLE_SET



