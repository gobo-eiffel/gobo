note

	description:

		"Objects that compare in descending order"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004-2017, Colin Adams and others"
	license: "MIT License"

class XM_XPATH_DESCENDING_COMPARER

inherit

	KL_PART_COMPARATOR [XM_XPATH_ITEM]
		redefine
			less_than
		end

create

	make

feature {NONE} -- Initialization

	make (a_base_comparer: KL_PART_COMPARATOR [XM_XPATH_ITEM])
			-- Establish invariant.
		require
			base_comparer_not_void: a_base_comparer /= Void
		do
			base_comparer := a_base_comparer
		ensure
			base_comparer_set: base_comparer = a_base_comparer
		end

feature -- Access

	base_comparer: KL_PART_COMPARATOR [XM_XPATH_ITEM]

feature -- Comparison

	less_than, attached_less_than (u, v: XM_XPATH_ITEM): BOOLEAN
			-- Is `u' considered less than `v'?
		do
			Result := base_comparer.less_than (v, u)
		end

invariant

	base_comparer_not_void: base_comparer /= Void

end

