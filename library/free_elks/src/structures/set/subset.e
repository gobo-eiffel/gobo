note
	description: "[
		Subsets with the associated operations,
		without commitment to a particular representation
		]"
	library: "Free implementation of ELKS library"
	legal: "See notice at end of class."
	status: "See notice at end of class."
	names: subset, set;
	access: membership;
	contents: generic;
	date: "$Date: 2012-07-23 23:02:19 +0200 (Mon, 23 Jul 2012) $"
	revision: "$Revision: 567 $"

deferred class SUBSET [G] inherit

	SET [G]

feature -- Comparison

	is_subset (other: SUBSET [G]): BOOLEAN
			-- Is current set a subset of `other'?
		require
			set_exists: other /= Void
			same_rule: object_comparison = other.object_comparison
		deferred
		end

	is_superset (other: SUBSET [G]): BOOLEAN
			-- Is current set a superset of `other'?
		require
			set_exists: other /= Void
			same_rule: object_comparison = other.object_comparison
		do
			Result := other.is_subset (Current)
		end

	disjoint (other: SUBSET [G]): BOOLEAN
			-- Do current set and `other' have no items in common?
			-- (This feature is redefined in all descendants. The default
			-- implementation given here is only to stay backward-compatible
			-- with older versions of EiffelBase.)
		require
			set_exists: other /= Void
			same_rule: object_comparison = other.object_comparison
		local
			temp: like Current
		do
			if not is_empty then
				temp := duplicate (count)	
				temp.intersect (other)
				Result := temp.is_empty
			else
				Result := True
			end
		end

feature -- Element change

	merge (other: CONTAINER [G])
			-- Add all items of `other'.
		require
			set_exists: other /= Void
 			same_rule: object_comparison = other.object_comparison
		deferred
		end

feature -- Duplication

	duplicate (n: INTEGER): like Current
			-- New structure containing min (`n', `count')
			-- items from current structure
		require
			non_negative: n >= 0
		deferred
		ensure
			correct_count_1: n <= count implies Result.count = n
			correct_count_2: n >= count implies Result.count = count
		end

feature -- Basic operations

	intersect (other: SUBSET [G])
			-- Remove all items not in `other'.
		require
			set_exists: other /= Void
			same_rule: object_comparison = other.object_comparison
		deferred
		ensure
			is_subset_other: is_subset (other)
		end

	subtract (other: SUBSET [G])
			-- Remove all items also in `other'.
		require
			set_exists: other /= Void
			same_rule: object_comparison = other.object_comparison
		deferred
		ensure
			is_disjoint: disjoint (other)
		end

	symdif (other: SUBSET [G])
			-- Remove all items also in `other', and add all
			-- items of `other' not already present.
			-- (This feature is redefined in all descendants. The default
			-- implementation given here is only to stay backward-compatible
			-- with older versions of EiffelBase.)
		require
			set_exists: other /= Void
			same_rule: object_comparison = other.object_comparison
		local
			temp: like Current
		do
			temp := duplicate (count)	
			temp.intersect (other)
			merge (other)
			subtract (temp)
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
