note
	description: "[
			Holder for non-comparable objects used for pseudo-comparison
			with others via the use of a custom comparator.
		]"
	author: ""
	date: "$Date: 2017-03-28 12:36:24 +0000 (Tue, 28 Mar 2017) $"
	revision: "$Revision: 100064 $"

frozen class
	PROXY_COMPARABLE [G]

inherit
	COMPARABLE

create
	make

feature -- Creation

	make (a_item: like item; a_less_than_comparator: PREDICATE [TUPLE [first_item: like item; second_item: like item]])
			-- Make comparable object for `a_item' using '<' comparator agent `a_less_than_comparator'
			-- Comparator predicate returns True if `first_item' is deemed less than `second_item'.
		require
			a_item_not_void: a_item /= Void
			a_less_than_comparator: a_less_than_comparator /= Void
		do
			item := a_item
			less_than_comparator := a_less_than_comparator
		ensure
			item_set: item = a_item
			comparator_set: less_than_comparator = a_less_than_comparator
		end

feature -- Access

	item: G
		-- Item used for comparison.

	less_than_comparator: PREDICATE [TUPLE [first_item: like item; second_item: like item]]
		-- Comparator agent used for '<' comparison of 'item' with other objects of type G
		-- Function returns True of 'first_item' is deemed to be less than 'second_item'.

feature -- Implementation

	is_less alias "<" (other: like Current): BOOLEAN
			-- Is current object less than `other'?
		do
			Result := less_than_comparator.item ([item, other.item])
		end

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
