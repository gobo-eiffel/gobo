indexing

	description:

		"Objects that implement the XPath string-length() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_STRING_LENGTH

inherit

	XM_XPATH_SYSTEM_FUNCTION
		redefine
			simplify, evaluate_item
		end

creation

	make

feature {NONE} -- Initialization

	make is
			-- Establish invariant
		do
			name := "string-length"
			minimum_argument_count := 0
			maximum_argument_count := 1
			create arguments.make (1)
			compute_cardinality
		end

feature -- Access

	item_type: INTEGER is
			-- Determine the data type of the expression, if possible
		do
			Result := Integer_type
		end

feature -- Status report

	required_type (argument_number: INTEGER): XM_XPATH_SEQUENCE_TYPE is
			-- Type of argument number `argument_number'
		do
			-- TODO - a sequence of zero or more items
		end

	is_test_for_zero: BOOLEAN
			-- If this is set we return 0 for a zero length string, 1 for any other;
			-- Set by the optimizer.

feature -- Status setting

	set_test_for_zero is
			-- Set `is_test_for_zero'.
		do
			is_test_for_zero := True
		ensure
			is_test_for_zero = True
		end

feature -- Optimization

		simplify: XM_XPATH_EXPRESSION is
			-- Simplify `Current';
			-- This default implementation does nothing.
		do
			-- TODO
		end

feature -- Evaluation

	evaluate_item (a_context: XM_XPATH_CONTEXT): XM_XPATH_ITEM is
			-- Evaluate as a single item
		do
			-- TODO count the number of items in the sole argument sequence
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_exactly_one
		end

end
	
