indexing

	description:

		"Indexable data structure sorters using heap sort algorithm"

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class DS_HEAP_SORTER [G]

inherit

	DS_INDEXABLE_SORTER [G]

creation

	make

feature -- Sort

	subsort_with_comparator (a_container: DS_INDEXABLE [G]; a_comparator: KL_PART_COMPARATOR [G]; lower, upper: INTEGER) is
			-- Sort `a_container' according to `a_comparator''s
			-- comparison criterion within bounds `lower'..`upper'?
		local
			i: INTEGER
			count: INTEGER
		do
			count := upper - lower + 1
			build_heap (a_container, a_comparator, lower, upper)
			from 
				i := count 
			variant
				i
			until 
				i <= lower 
			loop
				a_container.swap (lower, i)
				add_root (a_container, a_comparator, lower, i - 1)
				i := i - 1
			end
		end

feature {NONE} -- Implementation

	add_root (a_container: DS_INDEXABLE [G]; a_comparator: KL_PART_COMPARATOR [G]; lower, upper: INTEGER) is
		require
			a_container_not_void: a_container /= Void
			a_comparator_not_void: a_comparator /= Void
			valid_lower: 1 <= lower and lower <= a_container.count
			valid_upper: 1 <= upper and upper <= a_container.count
			valid_bounds: lower <= upper
		local
			j: INTEGER
		do
			j := 2 * lower
			if j <= upper then
				if j < upper then
					if a_comparator.less_than (a_container.item (j), a_container.item (j + 1)) then
						j := j + 1
					end
				end
				if a_comparator.less_than (a_container.item (lower), a_container.item (j)) then
					a_container.swap (lower, j)
					add_root (a_container, a_comparator, j, upper)
				end
			end
		end

	build_heap (a_container: DS_INDEXABLE [G]; a_comparator: KL_PART_COMPARATOR [G]; lower, upper: INTEGER) is
		require
			a_container_not_void: a_container /= Void
			a_comparator_not_void: a_comparator /= Void
			valid_lower: 1 <= lower and lower <= a_container.count
			valid_upper: 1 <= upper and upper <= a_container.count
			valid_bounds: lower <= upper
		local
			i: INTEGER
		do
			from 
				i := upper // 2 
			until 
				i < lower 
			loop
				add_root (a_container, a_comparator, i, upper)
				i := i - 1
			end
		end

end
