indexing

	description:

		"Objects that implement the XPath seconds-from-time() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
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

	make is
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

	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, where known
		do
			Result := type_factory.decimal_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

feature -- Status report

	required_type (argument_number: INTEGER): XM_XPATH_SEQUENCE_TYPE is
			-- Type of argument number `argument_number'
		do
			create Result.make_optional_time
		end

feature -- Evaluation

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a single item
		local
			a_time_value: XM_XPATH_TIME_VALUE
			a_millisecond: INTEGER
			a_decimal_value: XM_XPATH_DECIMAL_VALUE
			a_decimal: MA_DECIMAL
		do
			arguments.item (1).evaluate_item (a_context)
			last_evaluated_item := arguments.item (1).last_evaluated_item
			if last_evaluated_item /= Void and then not last_evaluated_item.is_error then
				a_time_value := last_evaluated_item.as_atomic_value.as_time_value
				create a_decimal_value.make_from_integer (a_time_value.time.second)
				a_millisecond := a_time_value.time.millisecond
				if a_millisecond /= 0 then
					create a_decimal.make_from_integer (a_millisecond)
					a_decimal := a_decimal / one_thousand
					create a_decimal_value.make (a_decimal_value.value + a_decimal)
				end
				last_evaluated_item := a_decimal_value
			end
		end

	create_node_iterator (a_context: XM_XPATH_CONTEXT) is
			-- Create an iterator over a node sequence
		do
			-- pre-condition is never met
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_optional
		end

feature {NONE} -- Implementation

	one_thousand: MA_DECIMAL is
			-- Number of millseconds in a second
		once
			create Result.make_from_integer (1000)
		ensure
			result_not_void: Result /= Void
		end

end
	
