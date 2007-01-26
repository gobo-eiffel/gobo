indexing

	description:

		"Objects that implement the XPath timezone-from-dateTime() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_TIMEZONE_FROM_DATETIME

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
			name := "timezone-from-dateTime"
			namespace_uri := Xpath_standard_functions_uri
			fingerprint := Timezone_from_datetime_function_type_code
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
			Result := type_factory.day_time_duration_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

feature -- Status report

	required_type (argument_number: INTEGER): XM_XPATH_SEQUENCE_TYPE is
			-- Type of argument number `argument_number'
		do
			create Result.make_optional_date_time
		end

feature -- Evaluation

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a single item
		local
			a_date_time_value: XM_XPATH_DATE_TIME_VALUE
			a_dt_duration: DT_DATE_TIME_DURATION
			a_date_duration: DT_DATE_DURATION
		do
			arguments.item (1).evaluate_item (a_context)
			last_evaluated_item := arguments.item (1).last_evaluated_item
			if last_evaluated_item /= Void and then not last_evaluated_item.is_error then
				a_date_time_value := last_evaluated_item.as_atomic_value.as_date_time_value
				if a_date_time_value.zoned then
					create a_date_duration.make (0, 0, 0)
					create a_dt_duration.make_from_date_time_duration (a_date_duration, a_date_time_value.zoned_date_time.time_zone.fixed_offset)
					create {XM_XPATH_SECONDS_DURATION_VALUE} last_evaluated_item.make_from_duration (a_dt_duration)
				else
					last_evaluated_item := Void
				end
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

end
	
