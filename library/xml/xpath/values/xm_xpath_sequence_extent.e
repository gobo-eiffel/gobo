indexing

	description:

		"Sequence values implemented extensionally (i.e. memory is allocated to each item in the sequence)"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_SEQUENCE_EXTENT

inherit

	XM_XPATH_SEQUENCE_VALUE
		redefine
			item_type, effective_boolean_value
		end

creation

	make

feature {NONE} -- Initialization

	make (an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]) is
			-- TODO
		do
		end

feature -- Access
	
	item_type: INTEGER is
			--Determine the data type of the expression, if possible
		do
			-- TODO
		end

	iterator (a_context: XM_XPATH_CONTEXT): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM] is
			-- An iterator over the values of a sequence
		do
			-- TODO
		end

	item_at (an_index: INTEGER) :XM_XPATH_ITEM is
			-- Item at `an_index'
		require
			strictly_positive_index: an_index > 0
		do
			-- TODO
		end

feature -- Measurement

	count: INTEGER
			-- TODO - probably a routine

feature -- Comparison

	same_expression (other: XM_XPATH_EXPRESSION): BOOLEAN is
			-- Are `Current' and `other' the same expression?
		do
			-- TODO
		end

feature -- Evaluation

		effective_boolean_value (a_context: XM_XPATH_CONTEXT): XM_XPATH_BOOLEAN_VALUE is
			-- Effective boolean value
		do
			-- TODO
		end

end
	
