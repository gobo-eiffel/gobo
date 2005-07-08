indexing

	description:

		"Objects that implement the XPath not() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_NOT

inherit

	XM_XPATH_SYSTEM_FUNCTION
		redefine
			check_arguments, evaluate_item, calculate_effective_boolean_value,
			is_not_function, as_not_function
		end

creation

	make

feature {NONE} -- Initialization

	make is
			-- Establish invariant
		do
			name := "not"; namespace_uri := Xpath_standard_functions_uri
			minimum_argument_count := 1
			maximum_argument_count := 1
			create arguments.make (1)
			arguments.set_equality_tester (expression_tester)
			initialized := True
		end

feature -- Access

	is_not_function: BOOLEAN is
			-- Is `Current' an XPath not() function?
		do
			Result := True
		end

	as_not_function: XM_XPATH_NOT is
			-- `Current' seen as an XPath not() function
		do
			Result := Current
		end

	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, where known
		do
			Result := type_factory.boolean_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

feature -- Status report

	required_type (argument_number: INTEGER): XM_XPATH_SEQUENCE_TYPE is
			-- Type of argument number `argument_number'
		do
			create Result.make (any_item, Required_cardinality_zero_or_more)
		end

feature -- Evaluation

	calculate_effective_boolean_value (a_context: XM_XPATH_CONTEXT) is
			-- Effective boolean value
		local
			a_boolean_value: XM_XPATH_BOOLEAN_VALUE
		do
			arguments.item (1).calculate_effective_boolean_value (a_context)
			a_boolean_value := arguments.item (1).last_boolean_value
			if a_boolean_value.is_error then
				last_boolean_value := a_boolean_value
			else
				create last_boolean_value.make (not a_boolean_value.value)
			end
		end

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a single item
		do
			calculate_effective_boolean_value (a_context)
			last_evaluated_item := last_boolean_value
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_exactly_one
		end

feature {XM_XPATH_FUNCTION_CALL} -- Local

	check_arguments (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Check arguments during parsing, when all the argument expressions have been read.
			-- Prevent sorting of the argument
		do
			Precursor (a_context)
			arguments.item (1).set_unsorted (False)
			if arguments.item (1).was_expression_replaced then
				arguments.replace (arguments.item (1).replacement_expression, 1)
			end
		end
end
	
