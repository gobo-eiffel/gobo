note

	description:

		"Indexable data structure sorters using heap sort algorithm"

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "MIT License"

class DS_HEAP_SORTER [G]

inherit

	DS_INDEXABLE_SORTER [G]

create

	make

feature -- Sort

	subsort_with_comparator (a_container: DS_INDEXABLE [G]; a_comparator: KL_PART_COMPARATOR [G]; lower, upper: INTEGER)
			-- Sort `a_container' according to `a_comparator''s comparison criterion within bounds `lower'..`upper'.
			-- Build a heap into container, where `lower' is the root, then iterate k from `upper' to `lower',
			-- swapping root element with k-th, and maintaining the heap property of [`lower'..k-1] .
		local
			i: INTEGER
			count: INTEGER
		do
			count := upper - lower + 1
			build_heap (a_container, a_comparator, lower, upper)
			from
				i := count
			until
				i <= lower
			loop
				a_container.swap (lower, i)
				add_root (a_container, a_comparator, lower, i - 1)
				i := i - 1
			variant
				i
			end
		end

feature {NONE} -- Implementation

	add_root (a_container: DS_INDEXABLE [G]; a_comparator: KL_PART_COMPARATOR [G]; root, upper: INTEGER)
			-- Make element `root' the root of a heap, by arranging and swapping values so that
			-- value at `root' is larger than the value of its leaves and of the leaves of its leaves...
			-- Leaves of node k are located at 2*k and 2*k+1 .
		require
			a_container_not_void: a_container /= Void
			a_comparator_not_void: a_comparator /= Void
			valid_root: 1 <= root and root <= a_container.count
			valid_upper: 1 <= upper and upper <= a_container.count
			valid_bounds: root <= upper
		local
			left_leave_index: INTEGER
		do
			left_leave_index := 2 * root
			if left_leave_index <= upper then
				if left_leave_index < upper then
					if a_comparator.less_than (a_container.item (left_leave_index), a_container.item (left_leave_index + 1)) then
						left_leave_index := left_leave_index + 1
					end
				end
				if a_comparator.less_than (a_container.item (root), a_container.item (left_leave_index)) then
					a_container.swap (root, left_leave_index)
					add_root (a_container, a_comparator, left_leave_index, upper)
				end
			end
		end

	build_heap (a_container: DS_INDEXABLE [G]; a_comparator: KL_PART_COMPARATOR [G]; lower, upper: INTEGER)
			-- Arrange elements of `a_container[lower..upper]' into a heap.
			-- i.e. each node in [lower..upper//2] is greater than the values of its leaves;
			-- Leaves of a node k are located at 2*k, 2*k+1 .
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
