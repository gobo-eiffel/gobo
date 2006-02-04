indexing
	description:
		"[
		Strategies for calculating several features for subsets represented
		by binary search trees. Contained items have to be COMPARABLE
		]"

	status:	"See notice at end of class"
	date: "$Date$"
	revision: "$Revision$"

class SUBSET_STRATEGY_TREE [G -> COMPARABLE] inherit

	SUBSET_STRATEGY [G]

feature -- Comparison

	disjoint (set1, set2: BINARY_SEARCH_TREE_SET [G]): BOOLEAN is
			-- Are `set1' and `set2' disjoint?
		do
			from
				Result := True
				set1.start
			until
				not Result or else set1.after
			loop
				Result := not set2.has (set1.item)
				set1.forth
			end
			if Result then
				from
					set2.start
				until
					not Result or else set2.after
				loop
					Result := not set1.has (set2.item)
					set2.forth
				end
			end
		end
	
feature -- Basic operations

	symdif (set1, set2: BINARY_SEARCH_TREE_SET [G]) is
			-- Remove all items of `set1' that are also in `set2', and add all
			-- items of `set2' not already present in `set1'.
		do
			from set2.start until set2.after loop
				if set1.has (set2.item) then
					set1.prune (set2.item)
				else
					set1.extend (set2.item)
				end
				set2.forth
			end
		end
	
indexing

	library: "[
			EiffelBase: Library of reusable components for Eiffel.
			]"

	status: "[
			Copyright 1986-2001 Interactive Software Engineering (ISE).
			For ISE customers the original versions are an ISE product
			covered by the ISE Eiffel license and support agreements.
			]"

	license: "[
			EiffelBase may now be used by anyone as FREE SOFTWARE to
			develop any product, public-domain or commercial, without
			payment to ISE, under the terms of the ISE Free Eiffel Library
			License (IFELL) at http://eiffel.com/products/base/license.html.
			]"

	source: "[
			Interactive Software Engineering Inc.
			ISE Building
			360 Storke Road, Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Electronic mail <info@eiffel.com>
			Customer support http://support.eiffel.com
			]"

	info: "[
			For latest info see award-winning pages: http://eiffel.com
			]"

end -- class SUBSET_STRATEGY_TREE
