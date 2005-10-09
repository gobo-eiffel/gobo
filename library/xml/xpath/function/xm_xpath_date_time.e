indexing

	description:

		"Objects that implement the XPath dateTime() constructor function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_DATE_TIME

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
			name := "dateTime"
			namespace_uri := Xpath_standard_functions_uri
			fingerprint := Datetime_function_type_code
			minimum_argument_count := 2
			maximum_argument_count := 2
			create arguments.make (2)
			arguments.set_equality_tester (expression_tester)
			initialized := True
		end

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, where known
		do
			Result := type_factory.date_time_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

feature -- Status report

	required_type (argument_number: INTEGER): XM_XPATH_SEQUENCE_TYPE is
			-- Type of argument number `argument_number'
		do
			if argument_number = 1 then
				create Result.make_single_date
			else
				create Result.make_single_time
			end
		end

feature -- Evaluation

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a single item
		local
			a_date_value: XM_XPATH_DATE_VALUE
			a_time_value: XM_XPATH_TIME_VALUE
			a_date_time: DT_DATE_TIME
			date_zoned, time_zoned: BOOLEAN
			a_zoned_date_time: DT_FIXED_OFFSET_ZONED_DATE_TIME
		do
			arguments.item (1).evaluate_item (a_context)
			if arguments.item (1).last_evaluated_item.is_error then
				last_evaluated_item := arguments.item (1).last_evaluated_item
			else
				arguments.item (2).evaluate_item (a_context)
				if arguments.item (2).last_evaluated_item.is_error then
					last_evaluated_item := arguments.item (2).last_evaluated_item
				else
					a_date_value := arguments.item (1).last_evaluated_item.as_atomic_value.as_date_value
					a_time_value := arguments.item (2).last_evaluated_item.as_atomic_value.as_time_value
					date_zoned := a_date_value.zoned; time_zoned := a_time_value.zoned
					if not date_zoned and then not time_zoned then
						create a_date_time.make_from_date_time (a_date_value.local_date, a_time_value.local_time)
						create {XM_XPATH_DATE_TIME_VALUE} last_evaluated_item.make_from_date_time (a_date_time)
					elseif not date_zoned then
						create a_date_time.make_from_date_time (a_date_value.local_date, a_time_value.zoned_time.time)
						create a_zoned_date_time.make (a_date_time, a_time_value.zoned_time.time_zone)
						create {XM_XPATH_DATE_TIME_VALUE} last_evaluated_item.make_from_zoned_date_time (a_zoned_date_time)
					elseif not time_zoned then
						create a_date_time.make_from_date_time (a_date_value.zoned_date.date, a_time_value.local_time)
						create a_zoned_date_time.make (a_date_time, a_date_value.zoned_date.time_zone)
						create {XM_XPATH_DATE_TIME_VALUE} last_evaluated_item.make_from_zoned_date_time (a_zoned_date_time)
					else
						evaluate_both_zoned (a_date_value, a_time_value, a_context)
					end
				end
			end
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_exactly_one
		end

feature {NONE} -- Implementation

	evaluate_both_zoned (a_date_value: XM_XPATH_DATE_VALUE; a_time_value: XM_XPATH_TIME_VALUE; a_context: XM_XPATH_CONTEXT) is
			-- Evaluate with both operands zoned.
		require
			date_exists: a_date_value /= Void
			time_exists: a_time_value /= Void
			context_exists: a_context /= Void
		local
			a_date_time: DT_DATE_TIME
			a_time_zone: DT_FIXED_OFFSET_TIME_ZONE
			a_zoned_date_time: DT_FIXED_OFFSET_ZONED_DATE_TIME
		do
			a_time_zone := a_date_value.zoned_date.time_zone
			if a_time_zone.fixed_offset.same_time_duration (a_time_value.zoned_time.time_zone.fixed_offset) then
				create a_date_time.make_from_date_time (a_date_value.zoned_date.date, a_time_value.zoned_time.time)
				create a_zoned_date_time.make (a_date_time, a_time_zone)
				create {XM_XPATH_DATE_TIME_VALUE} last_evaluated_item.make_from_zoned_date_time (a_zoned_date_time)
			else
				create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make_from_string ("Date and time are in different time zones",
																											Xpath_errors_uri, "FORG0008", Dynamic_error)
			end
		end
	
end
	
