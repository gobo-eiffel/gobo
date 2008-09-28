indexing

	description:

		"Indexable data structure sorters"

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 2000, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class DS_INDEXABLE_SORTER [G]

inherit

	DS_SORTER [G]

feature {NONE} -- Initialization

	make (a_comparator: like comparator) is
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

	sorted (a_container: DS_INDEXABLE [G]): BOOLEAN is
			-- Is `a_container' sorted in increasing order?
		do
			Result := sorted_with_comparator (a_container, comparator)
		end

	reverse_sorted (a_container: DS_INDEXABLE [G]): BOOLEAN is
			-- Is `a_container' sorted in decreasing order?
		local
			a_comparator: KL_REVERSE_PART_COMPARATOR [G]
		do
			if a_container.is_empty then
				Result := True
			else
				create a_comparator.make (comparator)
				Result := sorted_with_comparator (a_container, a_comparator)
			end
		end

	sorted_with_comparator (a_container: DS_INDEXABLE [G]; a_comparator: KL_PART_COMPARATOR [G]): BOOLEAN is
			-- Is `a_container' sorted according to
			-- `a_comparator''s comparison criterion?
		do
			Result := a_container.is_empty or else subsorted_with_comparator (a_container, a_comparator, 1, a_container.count)
		end

	subsorted (a_container: DS_INDEXABLE [G]; lower, upper: INTEGER): BOOLEAN is
			-- Is `a_container' sorted in increasing order
			-- within bounds `lower'..`upper'?
		require
			a_container_not_void: a_container /= Void
			valid_lower: 1 <= lower and lower <= a_container.count
			valid_upper: 1 <= upper and upper <= a_container.count
			valid_bounds: lower <= upper
		do
			Result := subsorted_with_comparator (a_container, comparator, lower, upper)
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
			a_comparator: KL_REVERSE_PART_COMPARATOR [G]
		do
			create a_comparator.make (comparator)
			Result := subsorted_with_comparator (a_container, a_comparator, lower, upper)
		end

	subsorted_with_comparator (a_container: DS_INDEXABLE [G]; a_comparator: KL_PART_COMPARATOR [G]; lower, upper: INTEGER): BOOLEAN is
			-- Is `a_container' sorted according to `a_comparator''s
			-- comparison criterion within bounds `lower'..`upper'?
		require
			a_container_not_void: a_container /= Void
			a_comparator_not_void: a_comparator /= Void
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

	sort (a_container: DS_INDEXABLE [G]) is
			-- Sort `a_container' in increasing order.
		do
			sort_with_comparator (a_container, comparator)
		end

	reverse_sort (a_container: DS_INDEXABLE [G]) is
			-- Sort `a_container' in decreasing order.
		local
			a_comparator: KL_REVERSE_PART_COMPARATOR [G]
		do
			if not a_container.is_empty then
				create a_comparator.make (comparator)
				sort_with_comparator (a_container, a_comparator)
			end
		end

	sort_with_comparator (a_container: DS_INDEXABLE [G]; a_comparator: KL_PART_COMPARATOR [G]) is
			-- Sort `a_container' according to
			-- `a_comparator''s comparison criterion?
		do
			if not a_container.is_empty then
				subsort_with_comparator (a_container, a_comparator, 1, a_container.count)
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
		do
			subsort_with_comparator (a_container, comparator, lower, upper)
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
		local
			a_comparator: KL_REVERSE_PART_COMPARATOR [G]
		do
			create a_comparator.make (comparator)
			subsort_with_comparator (a_container, a_comparator, lower, upper)
		ensure
			subsorted: reverse_subsorted (a_container, lower, upper)
		end

	subsort_with_comparator (a_container: DS_INDEXABLE [G]; a_comparator: KL_PART_COMPARATOR [G]; lower, upper: INTEGER) is
			-- Sort `a_container' according to `a_comparator''s
			-- comparison criterion within bounds `lower'..`upper'?
		require
			a_container_not_void: a_container /= Void
			a_comparator_not_void: a_comparator /= Void
			valid_lower: 1 <= lower and lower <= a_container.count
			valid_upper: 1 <= upper and upper <= a_container.count
			valid_bounds: lower <= upper
		deferred
		ensure
			subsorted: subsorted_with_comparator (a_container, a_comparator, lower, upper)
		end

invariant

	comparator_not_void: comparator /= Void

end
