indexing

	description:

		"TBA"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_ATOMIC_SORT_COMPARER

inherit

	KL_COMPARATOR  [XM_XPATH_ATOMIC_VALUE]
	
	XM_XPATH_DEBUGGING_ROUTINES

creation

	make

feature {NONE} -- Initialization

	make (a_collator: ST_COLLATOR) is
			-- Establish invariant.
		require
			collator_not_void: a_collator /= Void
		do
			collator := a_collator
		ensure
			collator_set: collator = a_collator
		end

feature -- Access

	collator: ST_COLLATOR
			-- Collator for string comparisons

	comparison_key (a_key: XM_XPATH_ATOMIC_VALUE): XM_XPATH_COMPARISON_KEY is
			-- Comparison key for `a_key'
		require
			key_not_void: a_key /= Void
		do
			todo ("comparison_key", False)
		ensure
			comparison_key_not_void: Result /= Void
		end

feature -- Comparison

	less_than (u, v: XM_XPATH_ATOMIC_VALUE): BOOLEAN is
			-- Is `u' considered less than `v'?
		do
	--TODO		Result := three_way_comparison (u, v) = -1
		end

invariant

	collator_not_void:
	
end
	
