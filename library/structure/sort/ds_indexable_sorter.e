indexing

	description:

		"Indexable data structure sorters"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2000, Eric Bezault and others"
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

	reverse_sorted (a_container: DS_INDEXABLE [G]): BOOLEAN is
			-- Is `a_container' sorted in decreasing order?
		do
			Result := a_container.is_empty or else
				reverse_subsorted (a_container, 1, a_container.count)
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
			v1, v2: G
		do
			from
				Result := True
				v2 := a_container.item (lower)
				i := lower + 1
			until
				i > upper
			loop
				v1 := v2
				v2 := a_container.item (i)
				if v2 < v1 then
					Result := False
					i := upper + 1 -- Jump out of the loop.
				else
					i := i + 1
				end
			end
		end

	reverse_subsorted (a_container: DS_INDEXABLE [G]; lower, upper: INTEGER): BOOLEAN is
			-- Is `a_container' sorted in decreasing order
			-- within bounds `lower'..`upper'?
		require
			a_container_not_void: a_container /= Void
			valid_lower: 1 <= lower and lower <= a_container.count
			valid_upper: 1 <= upper and upper <= a_container.count
			valid_bounds: lower <= upper
		local
			i: INTEGER
			v1, v2: G
		do
			from
				Result := True
				v2 := a_container.item (lower)
				i := lower + 1
			until
				i > upper
			loop
				v1 := v2
				v2 := a_container.item (i)
				if v1 < v2 then
					Result := False
					i := upper + 1 -- Jump out of the loop.
				else
					i := i + 1
				end
			end
		end

feature -- Sort

	sort (a_container: DS_INDEXABLE [G]) is
			-- Sort `a_container' in increasing order.
		do
			if not a_container.is_empty then
				subsort (a_container, 1, a_container.count)
			end
		end

	reverse_sort (a_container: DS_INDEXABLE [G]) is
			-- Sort `a_container' in decreasing order.
		do
			if not a_container.is_empty then
				reverse_subsort (a_container, 1, a_container.count)
			end
		end

	subsort (a_container: DS_INDEXABLE [G]; lower, upper: INTEGER) is
			-- Sort `a_container' in increasing order
			-- within bounds `lower'..`upper'.
		require
			a_container_not_void: a_container /= Void
			valid_lower: 1 <= lower and lower <= a_container.count
			valid_upper: 1 <= upper and upper <= a_container.count
			valid_bounds: lower <= upper
		deferred
		ensure
			subsorted: subsorted (a_container, lower, upper)
		end

	reverse_subsort (a_container: DS_INDEXABLE [G]; lower, upper: INTEGER) is
			-- Sort `a_container' in decreasing order
			-- within bounds `lower'..`upper'.
		require
			a_container_not_void: a_container /= Void
			valid_lower: 1 <= lower and lower <= a_container.count
			valid_upper: 1 <= upper and upper <= a_container.count
			valid_bounds: lower <= upper
		deferred
		ensure
			subsorted: reverse_subsorted (a_container, lower, upper)
		end

end -- class DS_INDEXABLE_SORTER
