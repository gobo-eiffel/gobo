indexing

	description:

		"Objects that implement the XPath number() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_NUMBER

inherit

	XM_XPATH_SYSTEM_FUNCTION
		redefine
			simplified_expression, evaluate_item
		end

	XM_XPATH_NUMERIC_ROUTINES

creation

	make

feature {NONE} -- Initialization

	make is
			-- Establish invariant
		do
			name := "number"
			minimum_argument_count := 0
			maximum_argument_count := 1
			create arguments.make (1)
			arguments.set_equality_tester (expression_tester)
			compute_static_properties
		end

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, where known
		do
			Result := type_factory.double_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

feature -- Status report

	required_type (argument_number: INTEGER): XM_XPATH_SEQUENCE_TYPE is
			-- Type of argument number `argument_number'
		do
			create Result.make (any_item, Required_cardinality_optional)
		end

feature -- Optimization

	simplified_expression: XM_XPATH_EXPRESSION is
			-- Simplified expression as a result of context-independent static optimizations
		local
			result_expression: XM_XPATH_NUMBER
			a_simplifier: XM_XPATH_ARGUMENT_SIMPLIFIER			
		do
			result_expression := clone (Current)
			result_expression.use_context_item_as_default
			create a_simplifier
			a_simplifier.simplify_arguments (arguments)
			if not a_simplifier.is_error then
				result_expression.set_arguments (a_simplifier.simplified_arguments)
			else
				result_expression.set_last_error (a_simplifier.error_value)
			end
			Result := result_expression
		end

feature -- Evaluation

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a single item
		do
			arguments.item (1).evaluate_item (a_context)
			last_evaluated_item := item_to_double (arguments.item (1).last_evaluated_item)
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_exactly_one
		end

end
