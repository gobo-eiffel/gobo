indexing

	description:

		"Objects that implement the XPath zero-or-one() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_ZERO_OR_ONE

inherit

	XM_XPATH_SYSTEM_FUNCTION
		redefine
			evaluate_item, create_iterator
		end

create

	make

feature {NONE} -- Initialization

	make is
			-- Establish invariant
		do
			name := "zero-or-one"; namespace_uri := Xpath_standard_functions_uri
			fingerprint := Zero_or_one_function_type_code
			minimum_argument_count := 1
			maximum_argument_count := 1
			create arguments.make (1)
			arguments.set_equality_tester (expression_tester)
			set_argument_error_code ("FORG0003")
			initialized := True
		end

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, where known
		do
			Result := arguments.item (1).item_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

feature -- Status report

	required_type (argument_number: INTEGER): XM_XPATH_SEQUENCE_TYPE is
			-- Type of argument number `argument_number'
		do
			create Result.make_optional_item
		end

feature -- Evaluation

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a single item
		do
			arguments.item (1).evaluate_item (a_context)
			last_evaluated_item := arguments.item (1).last_evaluated_item
		end

	create_iterator (a_context: XM_XPATH_CONTEXT) is
			-- An iterator over the values of a sequence
		do
			arguments.item (1).create_iterator (a_context)
			last_iterator := arguments.item (1).last_iterator
		end

	create_node_iterator (a_context: XM_XPATH_CONTEXT) is
			-- Create an iterator over a node sequence
		do
			arguments.item (1).create_node_iterator (a_context)
			last_node_iterator := arguments.item (1).last_node_iterator
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_optional
		end

end
	
