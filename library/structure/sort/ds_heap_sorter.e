indexing

	description:

		"Indexable data structure sorters using heap sort algorithm"

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 2000, Eric Bezault and others"
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
			-- Sort `a_container' according to `a_comparator''s comparison criterion within bounds `lower'..`upper'?
			-- Build a heap into container, where lower is the root, then iterate k from upper to lower,
			-- swapping root element with `k'-th, and maintaining the heap property of [lower..k-1] 
		local
			i: INTEGER;
			count : INTEGER
		do
			count := upper - lower + 1
			build_heap(a_container, a_comparator, lower, upper);
			from 
				i := count 
			variant
				i
			until 
				i <= lower 
			loop
				a_container.swap (lower, i);
				add_root(a_container, a_comparator, lower, i - 1);
				check
					is_semi_complete_heap (a_container, a_comparator, lower, i - 1)
				end
				i := i - 1
			end;
		end;

feature {NONE} -- Implementation

	add_root(a_container: DS_INDEXABLE [G]; a_comparator: KL_PART_COMPARATOR [G]; root, upper: INTEGER) is
			-- Make element `root' the root of a heap, by arranging and swapping values so that
			-- value at `root' is larger than the value of its leaves and of the leaves of its leaves...
			-- Leaves of node k are located at 2*k and 2*k+1 
		require
			a_container_not_void: a_container /= Void
			a_comparator_not_void: a_comparator /= Void
			valid_root: 1 <= root and root <= a_container.count
			valid_upper: 1 <= upper and upper <= a_container.count
			valid_bounds: root <= upper
		local
			left_leave_index: INTEGER;
		do
			left_leave_index := 2 * root;
			if left_leave_index <= upper then
				if left_leave_index < upper then
					if a_comparator.less_than (a_container.item(left_leave_index),a_container.item(left_leave_index+1)) then
							left_leave_index := left_leave_index + 1
					end
				end;
				if a_comparator.less_than (a_container.item(root), a_container.item(left_leave_index))
				then
					a_container.swap (root, left_leave_index);
					add_root(a_container, a_comparator, left_leave_index, upper)
				end;
			end
		ensure
			is_semi_complete_heap: is_semi_complete_heap (a_container, a_comparator, root, upper)
		end

	build_heap(a_container: DS_INDEXABLE [G]; a_comparator: KL_PART_COMPARATOR [G]; lower, upper: INTEGER) is
			-- Arrange elements of `a_container[lower..upper]' into a heap.
			-- i.e. each node in [lower..upper//2] is greater than the values of its leaves;
			-- Leaves of a node k are located at 2*k, 2*k+1 
		require
			a_container_not_void: a_container /= Void
			a_comparator_not_void: a_comparator /= Void
			valid_lower: 1 <= lower and lower <= a_container.count
			valid_upper: 1 <= upper and upper <= a_container.count
			valid_bounds: lower <= upper
		local
			i: INTEGER;
		do
			from 
				i := upper // 2 
			until 
				i < lower 
			loop
				add_root(a_container, a_comparator, i, upper);
				i := i - 1
			end
		ensure
			is_complete_heap: is_complete_heap (a_container, a_comparator, lower, upper)
		end
		
	is_complete_heap (a_container: DS_INDEXABLE [G]; a_comparator: KL_PART_COMPARATOR [G]; lower, upper: INTEGER) : BOOLEAN is
			-- Is `a_container[lower..upper]' a complete heap ?
			-- A complete heap is a semi complete heap where
			-- Left leaf is less or equal to right leaf
		require
			a_container_not_void: a_container /= Void
			a_comparator_not_void: a_comparator /= Void
			valid_lower: 1 <= lower and lower <= a_container.count
			valid_upper: 1 <= upper and upper <= a_container.count
			valid_bounds: lower <= upper
		local
			left_leaf_index : INTEGER
		do
			Result := test_heap (a_container, a_comparator, lower, upper, True)
		ensure
			is_semi_complete_heap: is_semi_complete_heap (a_container, a_comparator, lower, upper)
			left_leaf_not_greater_right_leaf: (lower < upper //2) implies not a_comparator.greater_than (a_container.item (2*lower), a_container.item (2*lower+1))
		end
		
	is_semi_complete_heap (a_container: DS_INDEXABLE [G]; a_comparator: KL_PART_COMPARATOR [G]; lower, upper: INTEGER) : BOOLEAN is
			-- Is `a_container[lower..upper]' a semi_complete heap ?
			-- `lower'-th value is a root, i.e. its leaves are lower
			-- [Left leaf..upper] is a heap and [right leaf..upper] is a heap
			-- Leaves of a node k are located at 2*k, 2*k+1 
		require
			a_container_not_void: a_container /= Void
			a_comparator_not_void: a_comparator /= Void
			valid_lower: 1 <= lower and lower <= a_container.count
			valid_upper: 1 <= upper and upper <= a_container.count
			valid_bounds: lower <= upper
		local
			left_leaf_index : INTEGER
		do
			Result := test_heap (a_container, a_comparator, lower, upper, False)
		ensure
			root_not_less_left_leaf: (lower <= upper //2) implies not a_comparator.less_than (a_container.item (lower), a_container.item (2*lower))
			root_not_less_right_leaf: (lower < upper //2) implies not a_comparator.less_than (a_container.item (lower), a_container.item (2*lower+1))		
			left_leaf_is_semi_complete_heap: (lower <= upper //2) implies is_semi_complete_heap (a_container,a_comparator, 2*lower, upper)
			right_leaf_is_semi_complete_heap: (lower < upper //2) implies is_semi_complete_heap (a_container,a_comparator, 2*lower+1, upper)
		end
		
	test_heap (a_container: DS_INDEXABLE [G]; a_comparator: KL_PART_COMPARATOR [G]; lower, upper: INTEGER; complete : BOOLEAN) : BOOLEAN is
			-- is `a_container'[lower..upper] a semi or complete heap ?
		require
			a_container_not_void: a_container /= Void
			a_comparator_not_void: a_comparator /= Void
			valid_lower: 1 <= lower and lower <= a_container.count
			valid_upper: 1 <= upper and upper <= a_container.count
			valid_bounds: lower <= upper
		local
			left_leaf_index : INTEGER
		do
			left_leaf_index := lower * 2
			if left_leaf_index <= upper then
				Result := not a_comparator.less_than (a_container.item (lower), a_container.item (left_leaf_index))
				Result := Result and test_heap (a_container, a_comparator, left_leaf_index, upper, complete)
				if left_leaf_index < upper then
					if complete then
						Result := Result and not a_comparator.greater_than (a_container.item (left_leaf_index), a_container.item (left_leaf_index+1))
					end
					Result := Result and test_heap (a_container, a_comparator, left_leaf_index+1, upper, complete)
				end				
			else
				Result := True
			end
		end
end
