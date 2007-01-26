indexing

	description:

		"Objects that compare in descending order"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_DESCENDING_COMPARER

inherit
	
	KL_COMPARATOR [XM_XPATH_ITEM]

create

	make

feature {NONE} -- Initialization

	make (a_base_comparer: KL_COMPARATOR [XM_XPATH_ITEM]) is
			-- Establish invariant.
		require
			base_comparer_not_void: a_base_comparer /= Void
		do
			base_comparer := a_base_comparer
		ensure
			base_comparer_set: base_comparer = a_base_comparer
		end
			
feature -- Comparison

	less_than (u, v: XM_XPATH_ITEM): BOOLEAN is
			-- Is `u' considered less than `v'?
		do
			Result := base_comparer.less_than (v, u)
		end

feature {NONE} -- Implementation

	base_comparer: KL_COMPARATOR [XM_XPATH_ITEM]

invariant

	base_comparer_not_void: base_comparer /= Void

end
	
