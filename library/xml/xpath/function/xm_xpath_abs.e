note

	description:

		"Objects that implement the XPath abs() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_ABS

inherit

	XM_XPATH_SYSTEM_FUNCTION
		redefine
			evaluate_item
		end

	MA_SHARED_DECIMAL_CONSTANTS
		export {NONE} all end

	XM_XPATH_TOKENS
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make
			-- Establish invariant
		do
			name := "abs"
			namespace_uri := Xpath_standard_functions_uri
			fingerprint := Abs_function_type_code
			minimum_argument_count := 1
			maximum_argument_count := 1
			create arguments.make (1)
			arguments.set_equality_tester (expression_tester)
			initialized := True
		end

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE
			-- Data type of the expression, where known
		do
			Result := arguments.item (1).item_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

feature -- Status report

	required_type (argument_number: INTEGER): XM_XPATH_SEQUENCE_TYPE
			-- Type of argument number `argument_number'
		do
			create Result.make_optional_number
		end

feature -- Evaluation

	evaluate_item (a_result: DS_CELL [XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT)
			-- Evaluate as a single item to `a_result'.
		local
			l_numeric_value: XM_XPATH_NUMERIC_VALUE
			l_zero: XM_XPATH_INTEGER_VALUE
		do
			arguments.item (1).evaluate_item (a_result, a_context)
			if a_result.item /= Void and then not a_result.item.is_error then
				check
					is_atomic: a_result.item.is_atomic_value
					is_numeric: a_result.item.as_atomic_value.primitive_value.is_numeric_value
					-- static typing
				end
				l_numeric_value := a_result.item.as_atomic_value.primitive_value.as_numeric_value
				if l_numeric_value.is_zero then
					create l_zero.make (decimal.zero)
					a_result.put (l_numeric_value.arithmetic (Plus_token, l_zero))
				elseif l_numeric_value.is_negative then
					a_result.put (l_numeric_value.negated_value)
				else
					a_result.put (l_numeric_value)
				end
			end
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality
			-- Compute cardinality.
		do
			set_cardinality_optional
		end

end

