note

	description:

		"Objects that implement the XPath seconds-from-time() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_SECONDS_FROM_TIME

inherit

	XM_XPATH_SYSTEM_FUNCTION
		redefine
			evaluate_item
		end

create

	make

feature {NONE} -- Initialization

	make
			-- Establish invariant
		do
			name := "seconds-from-time"
			namespace_uri := Xpath_standard_functions_uri
			fingerprint := Seconds_from_time_function_type_code
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
			Result := type_factory.decimal_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

feature -- Status report

	required_type (argument_number: INTEGER): XM_XPATH_SEQUENCE_TYPE
			-- Type of argument number `argument_number'
		do
			create Result.make_optional_time
		end

feature -- Evaluation

	evaluate_item (a_result: DS_CELL [XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT)
			-- Evaluate as a single item to `a_result'.
		local
			l_time_value: XM_XPATH_TIME_VALUE
			l_millisecond: INTEGER
			l_decimal_value: XM_XPATH_DECIMAL_VALUE
			l_decimal: MA_DECIMAL
		do
			arguments.item (1).evaluate_item (a_result, a_context)
			if a_result.item /= Void and then not a_result.item.is_error then
				l_time_value := a_result.item.as_atomic_value.as_time_value
				create l_decimal_value.make_from_integer (l_time_value.time.second)
				l_millisecond := l_time_value.time.millisecond
				if l_millisecond /= 0 then
					create l_decimal.make_from_integer (l_millisecond)
					l_decimal := l_decimal / one_thousand
					create l_decimal_value.make (l_decimal_value.value + l_decimal)
				end
				a_result.put (l_decimal_value)
			end
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality
			-- Compute cardinality.
		do
			set_cardinality_optional
		end

feature {NONE} -- Implementation

	one_thousand: MA_DECIMAL
			-- Number of millseconds in a second
		once
			create Result.make_from_integer (1000)
		ensure
			result_not_void: Result /= Void
		end

end

