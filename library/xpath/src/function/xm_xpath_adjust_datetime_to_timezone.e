﻿note

	description:

		"Objects that implement the XPath adjust-dateTime-to-timezone() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005-2015, Colin Adams and others"
	license: "MIT License"

class XM_XPATH_ADJUST_DATETIME_TO_TIMEZONE

inherit

	XM_XPATH_SYSTEM_FUNCTION
		redefine
			evaluate_item, simplify, pre_evaluate
		end

create

	make

feature {NONE} -- Initialization

	make
			-- Establish invariant
		do
			name := "adjust-dateTime-to-timezone"
			namespace_uri := Xpath_standard_functions_uri
			fingerprint := Adjust_datetime_to_timezone_function_type_code
			minimum_argument_count := 1
			maximum_argument_count := 2
			create arguments.make (2)
			arguments.set_equality_tester (expression_tester)
			initialized := True
		end

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE
			-- Data type of the expression, where known
		do
			Result := type_factory.date_time_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

feature -- Status report

	required_type (argument_number: INTEGER): XM_XPATH_SEQUENCE_TYPE
			-- Type of argument number `argument_number'
		do
			if argument_number = 1 then
				create Result.make_optional_date_time
			else
				create Result.make_optional_day_time_duration
			end
		end

feature -- Optimization

	simplify (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION])
			-- Perform context-independent static optimizations
		do
			if arguments.count = 1 then
				set_intrinsically_depends_upon_implicit_timezone
				reset_dependencies
			end
			Precursor (a_replacement)
		end

feature -- Evaluation

	evaluate_item (a_result: DS_CELL [detachable XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT)
			-- Evaluate as a single item to `a_result'.
		local
			l_date_time_value: XM_XPATH_DATE_TIME_VALUE
			l_zone: DT_FIXED_OFFSET_TIME_ZONE
			l_duration: DT_DATE_TIME_DURATION
			l_duration_value: detachable XM_XPATH_SECONDS_DURATION_VALUE
			l_zero_duration: DT_DATE_DURATION
			l_finished: BOOLEAN
		do
			arguments.item (1).evaluate_item (a_result, a_context)
			if attached a_result.item as a_result_item_1 and then not a_result_item_1.is_error then
				l_date_time_value := a_result_item_1.as_atomic_value.as_date_time_value
				if arguments.count = 1 then
					l_zone := a_context.implicit_timezone
					create l_zero_duration.make (0, 0, 0)
					create l_duration.make_from_date_time_duration (l_zero_duration, l_zone.fixed_offset)
					create l_duration_value.make_from_duration (l_duration)
				else
					a_result.put (Void)
					arguments.item (2).evaluate_item (a_result, a_context)
					if not attached a_result.item as a_result_item_2 then
						a_result.put (l_date_time_value.as_zoneless)
						l_finished := True
					elseif a_result_item_2.is_error then
						l_finished := True
					else
						l_duration_value := a_result_item_2.as_atomic_value.as_seconds_duration
						if not l_duration_value.is_valid_time_zone then
							a_result.put (create {XM_XPATH_INVALID_ITEM}.make_from_string ("Time zone has bad values", Xpath_errors_uri, "FODT0003", Dynamic_error))
							l_finished := True
						end
					end
				end
				if not l_finished then
					check attached l_duration_value then
						a_result.put (l_date_time_value.to_another_time_zone (l_duration_value))
					end
				end
			end
		end

	pre_evaluate (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT)
			-- Pre-evaluate `Current' at compile time.
		do
			a_replacement.put (Current)
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality
			-- Compute cardinality.
		do
			set_cardinality_optional
		end

end

