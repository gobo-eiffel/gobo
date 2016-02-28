note
	description:
		"[
		Strategies for computing several features of subsets. The computing
		strategy is optimized depending on the type of elements contained in
		the set.
		]"
	library: "Free implementation of ELKS library"
	legal: "See notice at end of class."
	status: "See notice at end of class."
	date: "$Date: 2012-07-23 23:02:19 +0200 (Mon, 23 Jul 2012) $"
	revision: "$Revision: 567 $"

deferred class 
	SUBSET_STRATEGY [G]

feature -- Comparison

	disjoint (set1, set2: TRAVERSABLE_SUBSET [G]): BOOLEAN
			-- Are `set1' and `set2' disjoint?
		require
			sets_exist: set1 /= Void and set2 /= Void
			same_rule: set1.object_comparison = set2.object_comparison
		deferred
		end
	
feature -- Basic operations

	symdif (set1, set2: TRAVERSABLE_SUBSET [G])
			-- Remove all items of `set1' that are also in `set2', and add all
			-- items of `set2' not already present in `set1'.
		require
			sets_exist: set1 /= Void and set2 /= Void
			same_rule: set1.object_comparison = set2.object_comparison
		deferred
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
