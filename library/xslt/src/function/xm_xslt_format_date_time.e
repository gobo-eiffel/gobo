﻿note

	description:

		"Objects that implement the XSLT format-date(), format-dateTime() and format-time() functions"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2005-2015, Colin Adams and others"
	license: "MIT License"

class XM_XSLT_FORMAT_DATE_TIME

inherit

	XM_XPATH_SYSTEM_FUNCTION
		redefine
			evaluate_item
		end

	ST_XSLT_FORMAT_DATE_TIME
		export {NONE} all end

create

	make_date, make_date_time, make_time

feature {NONE} -- Initialization

	make_date
			-- Create format-date() function.
		do
			name := "format-date"; namespace_uri := Xpath_standard_functions_uri
			fingerprint := Format_date_function_type_code
			minimum_argument_count := 2
			maximum_argument_count := 5
			create arguments.make (5)
			arguments.set_equality_tester (expression_tester)
			initialized := True
		end

	make_date_time
			-- Create format-dateTime() function.
		do
			name := "format-dateTime"; namespace_uri := Xpath_standard_functions_uri
			fingerprint := Format_datetime_function_type_code
			minimum_argument_count := 2
			maximum_argument_count := 5
			create arguments.make (5)
			arguments.set_equality_tester (expression_tester)
			initialized := True
		end

	make_time
			-- Create format-date() function.
		do
			name := "format-time"; namespace_uri := Xpath_standard_functions_uri
			fingerprint := Format_time_function_type_code
			minimum_argument_count := 2
			maximum_argument_count := 5
			create arguments.make (5)
			arguments.set_equality_tester (expression_tester)
			initialized := True
		end

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE
			-- Data type of the expression, where known
		do
			Result := type_factory.string_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

feature -- Status report

	required_type (argument_number: INTEGER): XM_XPATH_SEQUENCE_TYPE
			-- Type of argument number `argument_number'
		do
			inspect
				argument_number
			when 1 then
				inspect
					fingerprint
				when Format_date_function_type_code then
					create Result.make_optional_date
				when Format_datetime_function_type_code then
					create Result.make_optional_date_time
				when Format_time_function_type_code then
					create Result.make_optional_time
				end
			when 2 then
				create Result.make_single_string
			else
				create Result.make_optional_string
			end
		end

feature -- Evaluation

	evaluate_item (a_result: DS_CELL [detachable XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT)
			-- Evaluate as a single item to `a_result'.
		local
			l_calendar_value: XM_XPATH_CALENDAR_VALUE
			l_picture, l_language, l_country, l_calendar: STRING
			l_result: DS_CELL [detachable ST_FORMAT_DATE_TIME_RESULT]
			l_value: ST_FORMAT_DATE_TIME_RESULT
			l_error: XM_XPATH_ERROR_VALUE
		do
			arguments.item (1).evaluate_item (a_result, a_context)
			if attached a_result.item as l_result_item and then not l_result_item.is_error then
				l_calendar_value := l_result_item.as_atomic_value.as_calendar_value
				a_result.put (Void)
				arguments.item (2).evaluate_item (a_result, a_context)
				check attached a_result.item as l_result_item_2 then
					if not l_result_item_2.is_error then
						l_picture := l_result_item_2.string_value
						a_result.put (Void)
						if arguments.count > 2 then
							l_language := Default_language
							l_calendar := Default_calendar
							l_country := Default_country
							arguments.item (3).evaluate_item (a_result, a_context)
							if not attached a_result.item as l_result_item_3 then
								l_language := Default_language
							elseif not l_result_item_3.is_error then
								l_language := l_result_item_3.string_value
								a_result.put (Void)
							end
							if a_result.item = Void then -- no error yet
								arguments.item (4).evaluate_item (a_result, a_context)
								if not attached a_result.item as l_result_item_4 then
									l_calendar := Default_calendar
								elseif not l_result_item_4.is_error then
									l_calendar := l_result_item_4.string_value
									-- TODO: check for lexical QName when bug 2319 is resolved by WG
									a_result.put (Void)
								end
							end
							if a_result.item = Void then -- no error yet
								arguments.item (5).evaluate_item (a_result, a_context)
								if not attached a_result.item as l_result_item_5 then
									l_country := Default_country
								elseif not l_result_item_5.is_error then
									l_country := l_result_item_5.string_value
									a_result.put (Void)
								end
							end
						else
							l_language := Default_language
							l_calendar := Default_calendar
							l_country  := Default_country
						end
						if a_result.item = Void then -- no error yet
							create l_result.make (Void)
							format_date_time (l_result, l_calendar_value, l_picture, l_language, l_calendar, l_country)
							check postcondition_of_format_date_time: attached l_result.item as l_result_item_6 then
							l_value := l_result_item_6
								if l_value.is_error then
									check invariant_of_ST_FORMAT_DATE_TIME_RESULT: attached l_value.message as l_value_message and attached l_value.code as l_value_code then
										create l_error.make_from_string (l_value_message, Xpath_errors_uri, l_value_code, Dynamic_error)
										set_last_error (l_error)
										a_result.put (create {XM_XPATH_INVALID_ITEM}.make (l_error))
									end
								else
									check invariant_of_ST_FORMAT_DATE_TIME_RESULT: attached l_value.value as l_value_value then
										a_result.put (create {XM_XPATH_STRING_VALUE}.make (l_value_value))
									end
								end
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
			set_cardinality_optional
		end

end

