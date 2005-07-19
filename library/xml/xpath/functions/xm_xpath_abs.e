indexing

	description:

		"Objects that implement the XPath abs() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_ABS

inherit

	XM_XPATH_SYSTEM_FUNCTION
		redefine
			evaluate_item
		end

	MA_DECIMAL_MATH
		export {NONE} all end

	XM_XPATH_TOKENS
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make is
			-- Establish invariant
		do
			name := "abs"
			namespace_uri := Xpath_standard_functions_uri
			minimum_argument_count := 1
			maximum_argument_count := 1
			create arguments.make (1)
			arguments.set_equality_tester (expression_tester)
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
			create Result.make_optional_number
		end

feature -- Evaluation

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a single item
		local
			an_item: XM_XPATH_ITEM
			a_numeric_value: XM_XPATH_NUMERIC_VALUE
			a_zero: XM_XPATH_INTEGER_VALUE
		do
			arguments.item (1).evaluate_item (a_context)
			last_evaluated_item := arguments.item (1).last_evaluated_item
			if last_evaluated_item /= Void and then not last_evaluated_item.is_error then
				an_item := last_evaluated_item
				check
					is_atomic: an_item.is_atomic_value
					is_numeric: an_item.as_atomic_value.primitive_value.is_numeric_value
					-- static typing
				end
				a_numeric_value := an_item.as_atomic_value.primitive_value.as_numeric_value
				if a_numeric_value.is_zero then
					create a_zero.make (zero)
					last_evaluated_item := a_numeric_value.arithmetic (Plus_token, a_zero)
				elseif a_numeric_value.is_negative then
					last_evaluated_item := a_numeric_value.negated_value
				else
					last_evaluated_item := a_numeric_value
				end
			end
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_optional
		end

end
	
