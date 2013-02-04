note
	description: "Tables whose keys are integers in a contiguous interval"
	legal: "See notice at end of class."
	status: "See notice at end of class."
	names: indexable, access;
	access: index, membership;
	contents: generic;
	date: "$Date: 2011-05-18 01:25:55 +0200 (Wed, 18 May 2011) $"
	revision: "$Revision: 510 $"

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
	library:	"EiffelBase: Library of reusable components for Eiffel."
	copyright:	"Copyright (c) 1984-2011, Eiffel Software and others"
	license:	"Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end



