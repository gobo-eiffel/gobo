note

	description:

		"Objects that implement the XPath timezone-from-time() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_TIMEZONE_FROM_TIME

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
			name := "timezone-from-time"
			namespace_uri := Xpath_standard_functions_uri
			fingerprint := Timezone_from_time_function_type_code
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
			Result := type_factory.day_time_duration_type
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
			l_dt_duration: DT_DATE_TIME_DURATION
			l_date_duration: DT_DATE_DURATION
		do
			arguments.item (1).evaluate_item (a_result, a_context)
			if a_result.item /= Void and then not a_result.item.is_error then
				l_time_value := a_result.item.as_atomic_value.as_time_value
				if l_time_value.zoned then
					create l_date_duration.make (0, 0, 0)
					create l_dt_duration.make_from_date_time_duration (l_date_duration, l_time_value.zoned_time.time_zone.fixed_offset)
					a_result.put (create {XM_XPATH_SECONDS_DURATION_VALUE}.make_from_duration (l_dt_duration))
				else
					a_result.put (Void)
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

