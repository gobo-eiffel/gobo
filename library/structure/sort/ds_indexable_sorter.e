indexing

	description:

		"Indexable data structure sorters"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class DS_INDEXABLE_SORTER [G -> COMPARABLE]

inherit

	DS_SORTER [G]

feature -- Status report

	sorted (a_container: DS_INDEXABLE [G]): BOOLEAN is
			-- Is `a_container' sorted in increasing order?
		do
			Result := a_container.is_empty or else
				subsorted (a_container, 1, a_container.count)
		end

	subsorted (a_container: DS_INDEXABLE [G]; lower, upper: INTEGER): BOOLEAN is
			-- Is `a_container' sorted in increasing order
			-- within bounds `lower'..`upper'?
		require
			a_container_not_void: a_container /= Void
			valid_lower: 1 <= lower and lower <= a_container.count
			valid_upper: 1 <= upper and upper <= a_container.count
			valid_bounds: lower <= upper
		local
			i: INTEGER
		do
			from
				i := lower
				Result := True
			until
				not Result or i >= upper
			loop
				Result := a_container.item (i) <= a_container.item (i + 1)
				i := i + 1
			end
		end

feature -- Sort

	sort (a_container: DS_INDEXABLE [G]) is
			-- Sort `a_container' in increasing order?
		do
			if not a_container.is_empty then
				subsort (a_container, 1, a_container.count)
			end
		end
		
	subsort (a_container: DS_INDEXABLE [G]; lower, upper: INTEGER) is
			-- Sort `a_container' in increasing order
			-- within bounds `lower'..`upper'?
		require
			a_container_not_void: a_container /= Void
			valid_lower: 1 <= lower and lower <= a_container.count
			valid_upper: 1 <= upper and upper <= a_container.count
			valid_bounds: lower <= upper
		deferred
		ensure
			subsorted: subsorted (a_container, lower, upper)
		end

end -- class DS_INDEXABLE_SORTER
