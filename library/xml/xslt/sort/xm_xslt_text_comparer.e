indexing

	description:

		"Objects that compare text strings"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_TEXT_COMPARER

inherit
	
	KL_COMPARATOR [XM_XPATH_ITEM]

	XM_XPATH_DEBUGGING_ROUTINES

creation

	make, make_from_collator

feature {NONE} -- Initialiaztion

	make (a_comparer: KL_COMPARATOR [XM_XPATH_ITEM]) is
			-- Establish invariant.
		do
			todo ("make", False)
		end
	
	make_from_collator (a_collator: ST_COLLATOR) is
			-- Establish invariant.
		do
			todo ("make", False)
		end
	
feature -- Comparison

	less_than (u, v: XM_XPATH_ITEM): BOOLEAN is
			-- Is `u' considered less than `v'?
		do
			todo ("less_than", False)
		end

feature {NONE} -- Implementation
	
end
