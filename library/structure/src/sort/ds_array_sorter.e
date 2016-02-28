note

	description:

		"Array sorters"

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 2001, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class DS_ARRAY_SORTER [G]

feature {NONE} -- Initialization

	make (a_comparator: like comparator)
			-- Create a new sorter.
		require
			a_comparator_not_void: a_comparator /= Void
		do
			comparator := a_comparator
		ensure
			comparator_set: comparator = a_comparator
		end

feature -- Access

	comparator: KL_PART_COMPARATOR [G]
			-- Comparison criterion

feature -- Status report

	sorted (a_container: ARRAY [G]): BOOLEAN
			-- Is `a_container' sorted in increasing order?
		require
			a_container_not_void: a_container /= Void
		do
			Result := sorted_with_comparator (a_container, comparator)
		end

	reverse_sorted (a_container: ARRAY [G]): BOOLEAN
			-- Is `a_container' sorted in decreasing order?
		require
			a_container_not_void: a_container /= Void
		local
			a_comparator: KL_REVERSE_PART_COMPARATOR [G]
		do
			if a_container.count = 0 then
				Result := True
			else
				create a_comparator.make (comparator)
				Result := sorted_with_comparator (a_container, a_comparator)
			end
		end

	sorted_with_comparator (a_container: ARRAY [G]; a_comparator: KL_PART_COMPARATOR [G]): BOOLEAN
			-- Is `a_container' sorted according to
			-- `a_comparator''s comparison criterion?
		require
			a_container_not_void: a_container /= Void
			a_comparator_not_void: a_comparator /= Void
		do
			Result := a_container.count = 0 or else subsorted_with_comparator (a_container, a_comparator, a_container.lower, a_container.upper)
		end

	subsorted (a_container: ARRAY [G]; lower, upper: INTEGER): BOOLEAN
			-- Is `a_container' sorted in increasing order
			-- within bounds `lower'..`upper'?
		require
			a_container_not_void: a_container /= Void
			valid_lower: a_container.lower <= lower and lower <= a_container.upper
			valid_upper: a_container.lower <= upper and upper <= a_container.upper
			valid_bounds: lower <= upper
		do
			Result := subsorted_with_comparator (a_container, comparator, lower, upper)
		end

	reverse_subsorted (a_container: ARRAY [G]; lower, upper: INTEGER): BOOLEAN
			-- Is `a_container' sorted in decreasing order
			-- within bounds `lower'..`upper'?
		require
			a_container_not_void: a_container /= Void
			valid_lower: a_container.lower <= lower and lower <= a_container.upper
			valid_upper: a_container.lower <= upper and upper <= a_container.upper
			valid_bounds: lower <= upper
		local
			a_comparator: KL_REVERSE_PART_COMPARATOR [G]
		do
			create a_comparator.make (comparator)
			Result := subsorted_with_comparator (a_container, a_comparator, lower, upper)
		end

	subsorted_with_comparator (a_container: ARRAY [G]; a_comparator: KL_PART_COMPARATOR [G]; lower, upper: INTEGER): BOOLEAN
			-- Is `a_container' sorted according to `a_comparator''s
			-- comparison criterion within bounds `lower'..`upper'?
		require
			a_container_not_void: a_container /= Void
			a_comparator_not_void: a_comparator /= Void
			valid_lower: a_container.lower <= lower and lower <= a_container.upper
			valid_upper: a_container.lower <= upper and upper <= a_container.upper
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
				if a_comparator.less_than (v2, v1) then
					Result := False
						-- Jump out of the loop.
					i := upper + 1
				else
					i := i + 1
				end
			end
		end

feature -- Sort

	sort (a_container: ARRAY [G])
			-- Sort `a_container' in increasing order.
		require
			a_container_not_void: a_container /= Void
		do
			sort_with_comparator (a_container, comparator)
		ensure
			sorted: sorted (a_container)
		end

	reverse_sort (a_container: ARRAY [G])
			-- Sort `a_container' in decreasing order.
		require
			a_container_not_void: a_container /= Void
		local
			a_comparator: KL_REVERSE_PART_COMPARATOR [G]
		do
			if a_container.count /= 0 then
				create a_comparator.make (comparator)
				sort_with_comparator (a_container, a_comparator)
			end
		ensure
			sorted: reverse_sorted (a_container)
		end

	sort_with_comparator (a_container: ARRAY [G]; a_comparator: KL_PART_COMPARATOR [G])
			-- Sort `a_container' according to
			-- `a_comparator''s comparison criterion?
		require
			a_container_not_void: a_container /= Void
			a_comparator_not_void: a_comparator /= Void
		do
			if a_container.count /= 0 then
				subsort_with_comparator (a_container, a_comparator, a_container.lower, a_container.upper)
			end
		ensure
			sorted: sorted_with_comparator (a_container, a_comparator)
		end

	subsort (a_container: ARRAY [G]; lower, upper: INTEGER)
			-- Sort `a_container' in increasing order
			-- within bounds `lower'..`upper'.
		require
			a_container_not_void: a_container /= Void
			valid_lower: a_container.lower <= lower and lower <= a_container.upper
			valid_upper: a_container.lower <= upper and upper <= a_container.upper
			valid_bounds: lower <= upper
		do
			subsort_with_comparator (a_container, comparator, lower, upper)
		ensure
			subsorted: subsorted (a_container, lower, upper)
		end

	reverse_subsort (a_container: ARRAY [G]; lower, upper: INTEGER)
			-- Sort `a_container' in decreasing order
			-- within bounds `lower'..`upper'.
		require
			a_container_not_void: a_container /= Void
			valid_lower: a_container.lower <= lower and lower <= a_container.upper
			valid_upper: a_container.lower <= upper and upper <= a_container.upper
			valid_bounds: lower <= upper
		local
			a_comparator: KL_REVERSE_PART_COMPARATOR [G]
		do
			create a_comparator.make (comparator)
			subsort_with_comparator (a_container, a_comparator, lower, upper)
		ensure
			subsorted: reverse_subsorted (a_container, lower, upper)
		end

	subsort_with_comparator (a_container: ARRAY [G]; a_comparator: KL_PART_COMPARATOR [G]; lower, upper: INTEGER)
			-- Sort `a_container' according to `a_comparator''s
			-- comparison criterion within bounds `lower'..`upper'?
		require
			a_container_not_void: a_container /= Void
			a_comparator_not_void: a_comparator /= Void
			valid_lower: a_container.lower <= lower and lower <= a_container.upper
			valid_upper: a_container.lower <= upper and upper <= a_container.upper
			valid_bounds: lower <= upper
		deferred
		ensure
			subsorted: subsorted_with_comparator (a_container, a_comparator, lower, upper)
		end

invariant

	comparator_not_void: comparator /= Void

end
