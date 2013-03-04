note
	description: "Tables whose keys are integers in a contiguous interval"
	library: "Free implementation of ELKS library"
	legal: "See notice at end of class."
	status: "See notice at end of class."
	names: indexable, access;
	access: index, membership;
	contents: generic;
	date: "$Date: 2012-05-24 06:13:10 +0200 (Thu, 24 May 2012) $"
	revision: "$Revision: 559 $"

deferred class READABLE_INDEXABLE [G]

inherit
	ITERABLE [G]

feature -- Access

	item alias "[]" (i: INTEGER): G
			-- Entry at position `i'
		require
			valid_index: valid_index (i)
		deferred
		end

	new_cursor: INDEXABLE_ITERATION_CURSOR [G]
			-- <Precursor>
		do
			create Result.make (Current)
			Result.start
		end

feature -- Measurement

	index_set: INTEGER_INTERVAL
			-- Range of acceptable indexes
		deferred
		ensure
			not_void: Result /= Void
		end

feature -- Status report

	valid_index (i: INTEGER): BOOLEAN
			-- Is `i' a valid index?
		deferred
		ensure
			only_if_in_index_set:
				Result implies ((i >= index_set.lower) and (i <= index_set.upper))
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



