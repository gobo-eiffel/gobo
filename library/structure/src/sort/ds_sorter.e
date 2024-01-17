note

	description:

		"Data structure sorters"

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 2000, Eric Bezault and others"
	license: "MIT License"

deferred class DS_SORTER [G]

feature -- Status report

	sorted (a_container: DS_SORTABLE [G]): BOOLEAN
			-- Is `a_container' sorted in increasing order?
		require
			a_container_not_void: a_container /= Void
		deferred
		end

	reverse_sorted (a_container: DS_SORTABLE [G]): BOOLEAN
			-- Is `a_container' sorted in decreasing order?
		require
			a_container_not_void: a_container /= Void
		deferred
		end

	sorted_with_comparator (a_container: DS_SORTABLE [G]; a_comparator: KL_PART_COMPARATOR [G]): BOOLEAN
			-- Is `a_container' sorted according to
			-- `a_comparator''s comparison criterion?
		require
			a_container_not_void: a_container /= Void
			a_comparator_not_void: a_comparator /= Void
		deferred
		end

feature -- Sort

	sort (a_container: DS_SORTABLE [G])
			-- Sort `a_container' in increasing order.
		require
			a_container_not_void: a_container /= Void
		deferred
		ensure
			sorted: sorted (a_container)
		end

	reverse_sort (a_container: DS_SORTABLE [G])
			-- Sort `a_container' in decreasing order.
		require
			a_container_not_void: a_container /= Void
		deferred
		ensure
			sorted: reverse_sorted (a_container)
		end

	sort_with_comparator (a_container: DS_SORTABLE [G]; a_comparator: KL_PART_COMPARATOR [G])
			-- Sort `a_container' according to
			-- `a_comparator''s comparison criterion?
		require
			a_container_not_void: a_container /= Void
			a_comparator_not_void: a_comparator /= Void
		deferred
		ensure
			sorted: sorted_with_comparator (a_container, a_comparator)
		end

end
