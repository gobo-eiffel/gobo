indexing

	description:

		"Objects that enumerate a nodeset that is the intersection of two other nodesets."

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_INTERSECTION_ENUMERATION

inherit

	XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]


creation

	make

feature {NONE} -- Initialization

	make (an_iterator, another_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]; a_comparer: XM_XPATH_GLOBAL_ORDER_COMPARER) is
		do
			todo ("make", False)
		end

feature -- Access
	
	item: XM_XPATH_ITEM is
			-- Value or node at the current position
		do
			todo ("item", False)
		end

feature -- Status report

	after: BOOLEAN is
			-- Are there any more items in the sequence?
		do
			todo ("after", False)
		end

feature -- Cursor movement

	forth is
			-- Move to next position
		do
			todo ("forth", False)
		end

feature -- Duplication

	another: like Current is
			-- Another iterator that iterates over the same items as the original
		do
			todo ("another", False)
		end

feature {NONE} -- Implementation


invariant


end
