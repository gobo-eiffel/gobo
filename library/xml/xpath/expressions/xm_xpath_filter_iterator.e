indexing

	description:

		"Objects that filter a sequence using a filter expression."

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_FILTER_ITERATOR [G-> XM_XPATH_ITEM]

inherit

	XM_XPATH_SEQUENCE_ITERATOR [G]


		-- This class is not used where the filter is a constant number.
		-- Instead, use XM_XPATH_POSITION_FILTER, as this class does not
		-- optimization for numeric predicates.

creation

	make, make_non_numeric

feature {NONE} -- Initialization

	make (base_iter: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]; a_filter: XM_XPATH_EXPRESSION;a_context: XM_XPATH_CONTEXT) is
			-- TDOD
		do
		end

	make_non_numeric (base_iter: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]; a_filter: XM_XPATH_EXPRESSION;a_context: XM_XPATH_CONTEXT) is
			-- TDOD
		do
		end
		
feature -- Access

	item_for_iteration: G is
			-- Value or node at the current position
		do
			-- TODO
		end

feature -- Status report

	after: BOOLEAN is
			-- Are there any more items in the sequence?
		do
			-- TODO
		end

feature -- Duplication

	another: like Current is
			-- Another iterator that iterates over the same items as the original
		do
			-- TODO
		end

feature -- Cursor movement

	forth is
			-- Move to next position
		do
			-- TODO
		end
	
end
