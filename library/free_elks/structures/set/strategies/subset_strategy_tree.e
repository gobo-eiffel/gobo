note
	description:
		"[
		Strategies for calculating several features for subsets represented
		by binary search trees. Contained items have to be COMPARABLE
		]"
	library: "Free implementation of ELKS library"
	legal: "See notice at end of class."
	status: "See notice at end of class."
	date: "$Date: 2012-07-23 23:02:19 +0200 (Mon, 23 Jul 2012) $"
	revision: "$Revision: 567 $"

class SUBSET_STRATEGY_TREE [G -> COMPARABLE] inherit

	SUBSET_STRATEGY [G]

feature -- Comparison

	disjoint (set1, set2: BINARY_SEARCH_TREE_SET [G]): BOOLEAN
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

	symdif (set1, set2: BINARY_SEARCH_TREE_SET [G])
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
