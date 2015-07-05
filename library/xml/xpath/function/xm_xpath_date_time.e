note

	description:

		"Objects that implement the XPath dateTime() constructor function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005-2015, Colin Adams and others"
	license: "MIT License"
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

	make
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
				create Result.make_single_date
			else
				create Result.make_single_time
			end
		end

feature -- Evaluation

	evaluate_item (a_result: DS_CELL [detachable XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT)
			-- Evaluate as a single item to `a_result'.
		local
			l_date_value: XM_XPATH_DATE_VALUE
			l_time_value: XM_XPATH_TIME_VALUE
			l_date_time: DT_DATE_TIME
			l_date_zoned, l_time_zoned: BOOLEAN
			l_zoned_date_time: DT_FIXED_OFFSET_ZONED_DATE_TIME
		do
			arguments.item (1).evaluate_item (a_result, a_context)
			check attached a_result.item as a_result_item then
				if a_result_item.is_error then
					-- nothing to do
				else
					l_date_value := a_result_item.as_atomic_value.as_date_value
					a_result.put (Void)
					arguments.item (2).evaluate_item (a_result, a_context)
					check attached a_result.item as a_result_item_2 then
						if a_result_item_2.is_error then
							-- nothing to do
						else
							l_time_value := a_result_item_2.as_atomic_value.as_time_value
							l_date_zoned := l_date_value.zoned
							l_time_zoned := l_time_value.zoned
							if not l_date_zoned and not l_time_zoned then
								check attached l_date_value.local_date as l_local_date and attached l_time_value.local_time as l_local_time then
									create l_date_time.make_from_date_time (l_local_date, l_local_time)
									a_result.put (create {XM_XPATH_DATE_TIME_VALUE}.make_from_date_time (l_date_time))
								end
							elseif not l_date_zoned then
								check attached l_date_value.local_date as l_local_date and attached l_time_value.zoned_time as l_zoned_time then
									create l_date_time.make_from_date_time (l_local_date, l_zoned_time.time)
									create l_zoned_date_time.make (l_date_time, l_zoned_time.time_zone)
									a_result.put (create {XM_XPATH_DATE_TIME_VALUE}.make_from_zoned_date_time (l_zoned_date_time))
								end
							elseif not l_time_zoned then
								check attached l_date_value.zoned_date as l_zoned_date and attached l_time_value.local_time as l_local_time then
									create l_date_time.make_from_date_time (l_zoned_date.date, l_local_time)
									create l_zoned_date_time.make (l_date_time, l_zoned_date.time_zone)
									a_result.put (create {XM_XPATH_DATE_TIME_VALUE}.make_from_zoned_date_time (l_zoned_date_time))
								end
							else
								a_result.put (Void)
								evaluate_both_zoned (a_result, l_date_value, l_time_value, a_context)
							end
						end
					end
				end
			end
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality
			-- Compute cardinality.
		do
			set_cardinality_exactly_one
		end

feature {NONE} -- Implementation

	evaluate_both_zoned (a_result: DS_CELL [detachable XM_XPATH_ITEM]; a_date_value: XM_XPATH_DATE_VALUE; a_time_value: XM_XPATH_TIME_VALUE; a_context: XM_XPATH_CONTEXT)
			-- Evaluate with both operands zoned.
		require
			a_result_not_void: a_result /= Void
			a_result_empty: a_result.item = Void
			date_not_void: a_date_value /= Void
			date_zoned: a_date_value.zoned
			time_not_void: a_time_value /= Void
			time_zoned: a_time_value.zoned
			context_not_void: a_context /= Void
		local
			l_date_time: DT_DATE_TIME
			l_time_zone: DT_FIXED_OFFSET_TIME_ZONE
			l_zoned_date_time: DT_FIXED_OFFSET_ZONED_DATE_TIME
		do
			check
				precondition_date_zoned: attached a_date_value.zoned_date as l_zoned_date
				precondition_time_zoned: attached a_time_value.zoned_time as l_zoned_time
			then
				l_time_zone := l_zoned_date.time_zone
				if l_time_zone.fixed_offset.same_time_duration (l_zoned_time.time_zone.fixed_offset) then
					create l_date_time.make_from_date_time (l_zoned_date.date, l_zoned_time.time)
					create l_zoned_date_time.make (l_date_time, l_time_zone)
					a_result.put (create {XM_XPATH_DATE_TIME_VALUE}.make_from_zoned_date_time (l_zoned_date_time))
				else
					a_result.put (create {XM_XPATH_INVALID_ITEM}.make_from_string ("Date and time are in different time zones",
						Xpath_errors_uri, "FORG0008", Dynamic_error))
				end
			end
		end

end

