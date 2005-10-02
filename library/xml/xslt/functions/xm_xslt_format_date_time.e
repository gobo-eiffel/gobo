indexing

	description:

		"Objects that implement the XSLT format-date(), format-dateTime() and format-time() functions"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_FORMAT_DATE_TIME

inherit

	XM_XPATH_SYSTEM_FUNCTION
		redefine
			evaluate_item
		end

	XM_XSLT_NUMBER_ROUTINES

	DT_SHARED_WEEK_DAYS_FROM_MONDAY

	KL_SHARED_PLATFORM

create

	make_date, make_date_time, make_time

feature {NONE} -- Initialization

	make_date is
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

	make_date_time is
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
	
	make_time is
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

	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, where known
		do
			Result := type_factory.string_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

	Default_language: STRING is "en"
	Default_calendar: STRING is "CE"
	Default_country:  STRING is "US"
			-- Implementation-defined defaults

	Ad_Calendar: STRING is "AD"
			-- Anno Domini (Christian Era);
			-- Same as "CE" except for the "E" modifier values

feature -- Status report

	required_type (argument_number: INTEGER): XM_XPATH_SEQUENCE_TYPE is
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

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate `Current' as a single item
		local
			a_calendar_value: XM_XPATH_CALENDAR_VALUE
			a_picture, a_language, a_country, a_calendar: STRING
		do
			arguments.item (1).evaluate_item (a_context)
			if arguments.item (1).last_evaluated_item = Void or else arguments.item (1).last_evaluated_item.is_error then
				last_evaluated_item := arguments.item (1).last_evaluated_item
			else
				a_calendar_value := arguments.item (1).last_evaluated_item.as_atomic_value.as_calendar_value
				arguments.item (2).evaluate_item (a_context)
				if arguments.item (2).last_evaluated_item.is_error then
					last_evaluated_item := arguments.item (2).last_evaluated_item
				else
					a_picture := arguments.item (2).last_evaluated_item.string_value
					if arguments.count > 2 then
						arguments.item (3).evaluate_item (a_context)
						if arguments.item (3).last_evaluated_item = Void then
							a_language := Default_language
						elseif arguments.item (3).last_evaluated_item.is_error then
							last_evaluated_item := arguments.item (3).last_evaluated_item
						else
							a_language := arguments.item (3).last_evaluated_item.string_value
						end
						arguments.item (4).evaluate_item (a_context)
						if arguments.item (4).last_evaluated_item = Void then
							a_calendar := Default_calendar
						elseif arguments.item (4).last_evaluated_item.is_error then
							last_evaluated_item := arguments.item (4).last_evaluated_item
						else
							a_calendar := arguments.item (4).last_evaluated_item.string_value
							-- TODO: check for lexical QName when bug 2319 is resolved by WG
						end
						arguments.item (5).evaluate_item (a_context)
						if arguments.item (5).last_evaluated_item = Void then
							a_country := Default_country
						elseif arguments.item (5).last_evaluated_item.is_error then
							last_evaluated_item := arguments.item (5).last_evaluated_item
						else
							a_country := arguments.item (5).last_evaluated_item.string_value
						end						
					else
						a_language := Default_language
						a_calendar := Default_calendar
						a_country  := Default_country
					end
					if last_evaluated_item = Void then -- no error yet
						format_date_time (a_calendar_value, a_picture, a_language, a_calendar, a_country)
					end
				end
			end
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_optional
		end

feature {NONE} -- Implementation

	is_traditional: BOOLEAN
			-- Does current specifier request traditional numbering?

	is_ordinal: BOOLEAN
			-- Does current specifier request ordinal numbering?

	minimum_width: INTEGER
			-- Minimum width for current variable marker

	maximum_width: INTEGER
			-- Maximum width for current variable marker

	primary_modifier: STRING
			-- Specifier in current variable marker

	format_date_time (a_calendar_value: XM_XPATH_CALENDAR_VALUE; a_picture, a_requested_language, a_requested_calendar, a_country: STRING) is
			-- Format the result.
		require
			calendar_value_exists: a_calendar_value /= Void
			picture_string_exists: a_picture /= Void
			requested_language_exists: a_requested_language /= Void
			requested_calendar_exists: a_requested_calendar /= Void
			country_exists: a_country /= Void
			no_error_yet: last_evaluated_item = Void
		local
			a_result_string, a_language, a_calendar: STRING
		do
			if a_picture.is_empty then
				create {XM_XPATH_STRING_VALUE} last_evaluated_item.make ("")
			else
				create a_result_string.make (32)
				if not is_language_supported (a_requested_language) then
					a_language := language (a_requested_language)
					a_result_string := STRING_.appended_string (a_result_string, language_prefix (a_requested_language))
				else
					a_language := a_requested_language
				end
				if not is_calendar_supported (a_requested_calendar) then
					a_calendar := calendar (a_requested_calendar)
					a_result_string := STRING_.appended_string (a_result_string, calendar_prefix (a_requested_calendar, a_language))
				else
					a_calendar := a_requested_calendar
				end
				parse_picture_string (a_result_string, a_calendar_value, a_picture, a_language, a_calendar, a_country)
			end
		end

	parse_picture_string (a_result_string: STRING; a_calendar_value: XM_XPATH_CALENDAR_VALUE;	a_picture, a_language, a_calendar, a_country: STRING) is
			-- Parse `a_picture' and format output.
		require
			result_string_exists: a_result_string /= Void
			calendar_value_exists: a_calendar_value /= Void
			picture_string_not_empty: a_picture /= Void and then not a_picture.is_empty
			language_not_empty: a_language /= Void and then not a_language.is_empty
			language_is_supported: is_language_supported (a_language)
			calendar_not_empty: a_calendar /= Void and then not a_calendar.is_empty
			country_exists: a_country /= Void
			no_error_yet: last_evaluated_item = Void
		local
			i, a_count, an_open, a_close: INTEGER
			finished, finished_inner: BOOLEAN
		do
			from
				i := 1; a_count := a_picture.count
			until finished loop
				from finished_inner := False until i > a_count or else finished_inner loop
					if a_picture.index_of ('[', i) = i then
						an_open := i
						finished_inner := True
					else
						a_result_string.insert_character (a_picture.item (i), a_result_string.count + 1)
						if a_picture.index_of (']', i) = i then
							i := i + 1
							if a_picture.index_of (']', i) /= i then
								create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make_from_string ("] must be doubled in picture string", Xpath_errors_uri, "XTDE1340", Dynamic_error)
								finished := True; finished_inner := True
							end
						end
					end
					i := i + 1
				end
				if i > a_count then
					finished := True
				elseif not finished then
					if a_picture.index_of ('[', i) = i then
						a_result_string.insert_character ('[', a_result_string.count + 1)
						i := i + 1
					else
						a_close := a_picture.index_of (']', i)
						if a_close = 0 then
							create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make_from_string ("] not found after [ in picture string", Xpath_errors_uri, "XTDE1340", Dynamic_error)
							finished := True
						else
							format_marker (a_result_string, a_calendar_value, a_picture.substring (an_open + 1, a_close - 1), a_language, a_calendar, a_country)
							if last_evaluated_item /= Void then
								finished := True
							else
								i := a_close + 1
							end
						end
					end
				end
			end
			if last_evaluated_item = Void then -- no error
				create {XM_XPATH_STRING_VALUE} last_evaluated_item.make (a_result_string)
			end
		end

	format_marker (a_result_string: STRING; a_calendar_value: XM_XPATH_CALENDAR_VALUE; a_marker, a_language, a_calendar, a_country: STRING) is
			-- Parse `a_marker' and format output by appending to `a_result_string'.
		require
			marker_exists: a_marker /= Void
			result_string_exists: a_result_string /= Void
			calendar_value_exists: a_calendar_value /= Void
			language_not_empty: a_language /= Void and then not a_language.is_empty
			language_is_supported: is_language_supported (a_language)
			calendar_not_empty: a_calendar /= Void and then not a_calendar.is_empty
			country_exists: a_country /= Void
			no_error_yet: last_evaluated_item = Void
		local
			a_matcher: RX_PCRE_REGULAR_EXPRESSION
			a_specifier: CHARACTER
			some_modifiers: STRING
			a_match_count, a_count: INTEGER
		do
			a_matcher := pattern_matcher (a_marker)
			if not a_matcher.has_matched then
				create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make_from_string (STRING_.concat ("The picture string has an invalid variable marker: ", a_marker),
				Xpath_errors_uri, "XTDE1340", Dynamic_error)
			else
				a_match_count := a_matcher.match_count
				if a_match_count = 1 then a_count := 0 else a_count := 1 end
				a_specifier := a_matcher.captured_substring (a_count).item (1)
				if a_match_count = 1 then
					some_modifiers := ""
				else
					some_modifiers := a_matcher.captured_substring (a_match_count - 1)
				end
				parse_and_format_marker (a_result_string, a_calendar_value, a_specifier, some_modifiers, a_language, a_calendar, a_country)
			end
		end

	parse_and_format_marker (a_result_string: STRING; a_calendar_value: XM_XPATH_CALENDAR_VALUE; a_specifier: CHARACTER; some_modifiers, a_language, a_calendar, a_country: STRING) is
			-- Format `a_calendar_value' according to `a_specifier' and `some_modifiers' by appending to `a_result_string'.
		require
			result_string_exists: a_result_string /= Void
			calendar_value_exists: a_calendar_value /= Void
			language_not_empty: a_language /= Void and then not a_language.is_empty
			language_is_supported: is_language_supported (a_language)
			calendar_not_empty: a_calendar /= Void and then not a_calendar.is_empty
			country_exists: a_country /= Void
			valid_specifier: is_valid_specifier (a_specifier)
			modifiers_exist: some_modifiers /= Void
			no_error_yet: last_evaluated_item = Void
		do
			inspect
				a_specifier
			when 'Y' then
				format_year (a_result_string, a_calendar_value, some_modifiers, a_language, a_calendar, a_country)
			when 'M' then
				format_month (a_result_string, a_calendar_value, some_modifiers, a_language, a_calendar, a_country)
			when 'D' then
				format_day_in_month (a_result_string, a_calendar_value, some_modifiers, a_language, a_calendar, a_country)
			when 'd' then
				format_day_in_year (a_result_string, a_calendar_value, some_modifiers, a_language, a_calendar, a_country)
			when 'F' then
				format_day_of_week (a_result_string, a_calendar_value, some_modifiers, a_language, a_calendar, a_country)
			when 'W' then
				format_week_in_year (a_result_string, a_calendar_value, some_modifiers, a_language, a_calendar, a_country)
			when 'w' then
				format_week_in_month (a_result_string, a_calendar_value, some_modifiers, a_language, a_calendar, a_country)
			when 'H' then
				format_hour (a_result_string, a_calendar_value, some_modifiers, a_language, a_calendar, a_country)
			when 'h' then
				format_hour_in_half_day (a_result_string, a_calendar_value, some_modifiers, a_language, a_calendar, a_country)
			when 'P' then
				format_am_pm (a_result_string, a_calendar_value, some_modifiers, a_language, a_calendar, a_country)
			when 'm' then
				format_minute (a_result_string, a_calendar_value, some_modifiers, a_language, a_calendar, a_country)
			when 's' then
				format_second (a_result_string, a_calendar_value, some_modifiers, a_language, a_calendar, a_country)
			when 'f' then
				format_millisecond (a_result_string, a_calendar_value, some_modifiers, a_language, a_calendar, a_country)
			when 'Z' then
				format_time_zone (a_result_string, a_calendar_value, some_modifiers, a_language, a_calendar, a_country)
			when 'z' then
				format_gmt_offset (a_result_string, a_calendar_value, some_modifiers, a_language, a_calendar, a_country)
			when 'C' then
				format_calendar_name (a_result_string, some_modifiers, a_language, a_calendar, a_country)
			when 'E' then
				format_era (a_result_string, a_calendar_value, some_modifiers, a_language, a_calendar, a_country)
			end
		end

	check_not_date_value (a_calendar_value: XM_XPATH_CALENDAR_VALUE; a_message: STRING) is
			-- Check `a_calendar_value' is not an xs:date.
		require
			calendar_value_exists: a_calendar_value /= Void
			message_not_empty: a_message /= Void and then not a_message.is_empty
			no_error_yet: last_evaluated_item = Void
		do
			if a_calendar_value.is_date_value then
				create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make_from_string (a_message, Xpath_errors_uri, "XTDE1350", Dynamic_error)
			end
		end

	check_not_time_value (a_calendar_value: XM_XPATH_CALENDAR_VALUE; a_message: STRING) is
			-- Check `a_calendar_value' is not an xs:time.
		require
			calendar_value_exists: a_calendar_value /= Void
			message_not_empty: a_message /= Void and then not a_message.is_empty
			no_error_yet: last_evaluated_item = Void
		do
			if a_calendar_value.is_time_value then
				create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make_from_string (a_message, Xpath_errors_uri, "XTDE1350", Dynamic_error)
			end
		end


	ordinal_attribute_value: STRING is
			-- Value of xsl:number "ordinal" attribute
		do
			if is_ordinal then
				Result := "yes"
			else
				Result := ""
			end
		ensure
			result_not_void: Result /= Void
		end

	letter_attribute_value: STRING is
			-- Value of xsl:number "letter_value" attribute
		do
			if is_traditional then
				Result := "traditional"
			else
				Result := ""
			end
		ensure
			result_not_void: Result /= Void
		end

	format_year (a_result_string: STRING; a_calendar_value: XM_XPATH_CALENDAR_VALUE; some_modifiers, a_language, a_calendar, a_country: STRING) is
			-- Format year from `a_calendar_value' and append to `a_result_string'.
		require
			result_string_exists: a_result_string /= Void
			calendar_value_exists: a_calendar_value /= Void
			language_not_empty: a_language /= Void and then not a_language.is_empty
			language_is_supported: is_language_supported (a_language)
			calendar_not_empty: a_calendar /= Void and then not a_calendar.is_empty
			country_exists: a_country /= Void
			modifiers_exist: some_modifiers /= Void
			no_error_yet: last_evaluated_item = Void
		local
			a_string: STRING
			a_numberer: XM_XSLT_NUMBERER
			a_number: MA_DECIMAL
		do
			check_not_time_value (a_calendar_value, "Y specifier not allowed for format-time()")
			if last_evaluated_item = Void then
				check_modifiers (some_modifiers, "1", False)
				if last_evaluated_item = Void then
					a_numberer := selected_numberer (a_language)
					create a_number.make_from_integer (a_calendar_value.absolute_year)
					a_string := a_numberer.formatted_string (a_number, primary_modifier, 0, "", letter_attribute_value, ordinal_attribute_value)
					if a_string.count < minimum_width then
						if is_decimal_format then
							a_string := prepended_with_zeros (a_string)
						else
							a_string := appended_with_blanks (a_string)
						end
					elseif a_string.count > maximum_width then
						a_string := a_string.substring (a_string.count - maximum_width, a_string.count)
					end
					STRING_.append_substring_to_string (a_result_string, a_string, 1, a_string.count)
				end
			end
		end

	format_month (a_result_string: STRING; a_calendar_value: XM_XPATH_CALENDAR_VALUE; some_modifiers, a_language, a_calendar, a_country: STRING) is
			-- Format month from `a_calendar_value'.
		require
			result_string_exists: a_result_string /= Void
			calendar_value_exists: a_calendar_value /= Void
			language_not_empty: a_language /= Void and then not a_language.is_empty
			language_is_supported: is_language_supported (a_language)
			calendar_not_empty: a_calendar /= Void and then not a_calendar.is_empty
			country_exists: a_country /= Void
			modifiers_exist: some_modifiers /= Void
			no_error_yet: last_evaluated_item = Void
		local
			a_string: STRING
			a_numberer: XM_XSLT_NUMBERER
			an_integer: INTEGER
			a_number: MA_DECIMAL
		do
			check_not_time_value (a_calendar_value, "M specifier not allowed for format-time()")
			if last_evaluated_item = Void then
				check_modifiers (some_modifiers, "1", True)
				if last_evaluated_item = Void then
					a_numberer := selected_numberer (a_language)
					an_integer := a_calendar_value.month
					if is_name_modifier then
						a_string := correctly_cased_name (a_numberer.month_name (an_integer, minimum_width, maximum_width))
					else
						create a_number.make_from_integer (an_integer)
						a_string := a_numberer.formatted_string (a_number, primary_modifier, 0, "", letter_attribute_value, ordinal_attribute_value)
						if a_string.count < minimum_width then
							if is_decimal_format then
								a_string := prepended_with_zeros (a_string)
							else
								a_string := appended_with_blanks (a_string)
							end
						elseif a_string.count > maximum_width then
							a_string := a_string.substring (a_string.count - maximum_width, a_string.count)
						end
					end
					STRING_.append_substring_to_string (a_result_string, a_string, 1, a_string.count)
				end
			end
		end

	format_day_in_month (a_result_string: STRING; a_calendar_value: XM_XPATH_CALENDAR_VALUE; some_modifiers, a_language, a_calendar, a_country: STRING) is
			-- Format day-in-month from `a_calendar_value'.
		require
			result_string_exists: a_result_string /= Void
			calendar_value_exists: a_calendar_value /= Void
			language_not_empty: a_language /= Void and then not a_language.is_empty
			language_is_supported: is_language_supported (a_language)
			calendar_not_empty: a_calendar /= Void and then not a_calendar.is_empty
			country_exists: a_country /= Void
			modifiers_exist: some_modifiers /= Void
			no_error_yet: last_evaluated_item = Void
		local
			a_string: STRING
			a_numberer: XM_XSLT_NUMBERER
			a_number: MA_DECIMAL
		do
			check_not_time_value (a_calendar_value, "D specifier not allowed for format-time()")
			if last_evaluated_item = Void then
				check_modifiers (some_modifiers, "1", False)
				if last_evaluated_item = Void then
					a_numberer := selected_numberer (a_language)
					create a_number.make_from_integer (a_calendar_value.day_in_month)
					a_string := a_numberer.formatted_string (a_number, primary_modifier, 0, "", letter_attribute_value, ordinal_attribute_value)
					if a_string.count < minimum_width then
						if is_decimal_format then
							a_string := prepended_with_zeros (a_string)
						else
							a_string := appended_with_blanks (a_string)
						end
					elseif a_string.count > maximum_width then
						a_string := a_string.substring (a_string.count - maximum_width, a_string.count)
					end
					STRING_.append_substring_to_string (a_result_string, a_string, 1, a_string.count)
				end
			end
		end

	format_day_in_year (a_result_string: STRING; a_calendar_value: XM_XPATH_CALENDAR_VALUE; some_modifiers, a_language, a_calendar, a_country: STRING) is
			-- Format day-in-year from `a_calendar_value'.
		require
			result_string_exists: a_result_string /= Void
			calendar_value_exists: a_calendar_value /= Void
			language_not_empty: a_language /= Void and then not a_language.is_empty
			language_is_supported: is_language_supported (a_language)
			calendar_not_empty: a_calendar /= Void and then not a_calendar.is_empty
			country_exists: a_country /= Void
			modifiers_exist: some_modifiers /= Void
			no_error_yet: last_evaluated_item = Void
		local
			a_string: STRING
			a_numberer: XM_XSLT_NUMBERER
			a_number: MA_DECIMAL
		do
			check_not_time_value (a_calendar_value, "d specifier not allowed for format-time()")
			if last_evaluated_item = Void then
				check_modifiers (some_modifiers, "1", False)
				if last_evaluated_item = Void then
					a_numberer := selected_numberer (a_language)
					create a_number.make_from_integer (a_calendar_value.day_in_year)
					a_string := a_numberer.formatted_string (a_number, primary_modifier, 0, "", letter_attribute_value, ordinal_attribute_value)
					if a_string.count < minimum_width then
						if is_decimal_format then
							a_string := prepended_with_zeros (a_string)
						else
							a_string := appended_with_blanks (a_string)
						end
					elseif a_string.count > maximum_width then
						a_string := a_string.substring (a_string.count - maximum_width, a_string.count)
					end
				end
				STRING_.append_substring_to_string (a_result_string, a_string, 1, a_string.count)
			end
		end

	format_day_of_week (a_result_string: STRING; a_calendar_value: XM_XPATH_CALENDAR_VALUE; some_modifiers, a_language, a_calendar, a_country: STRING) is
			-- Format day-of-week from `a_calendar_value'.
		require
			result_string_exists: a_result_string /= Void
			calendar_value_exists: a_calendar_value /= Void
			language_not_empty: a_language /= Void and then not a_language.is_empty
			language_is_supported: is_language_supported (a_language)
			calendar_not_empty: a_calendar /= Void and then not a_calendar.is_empty
			country_exists: a_country /= Void
			modifiers_exist: some_modifiers /= Void
			no_error_yet: last_evaluated_item = Void
		local
			a_string: STRING
			a_numberer: XM_XSLT_NUMBERER
			a_number: MA_DECIMAL
			an_iso_day_number: INTEGER
		do
			check_not_time_value (a_calendar_value, "F specifier not allowed for format-time()")
			if last_evaluated_item = Void then
				check_modifiers (some_modifiers, "n", True)
				if last_evaluated_item = Void then
					a_numberer := selected_numberer (a_language)
					an_iso_day_number := a_calendar_value.week_day_number
					if is_name_modifier then
						a_string := correctly_cased_name (a_numberer.day_name (an_iso_day_number, minimum_width, maximum_width))
					else
						create a_number.make_from_integer (week_day_number (an_iso_day_number, a_calendar, a_country))
						a_string := a_numberer.formatted_string (a_number, primary_modifier, 0, "", letter_attribute_value, ordinal_attribute_value)
						if a_string.count < minimum_width then
							if is_decimal_format then
								a_string := prepended_with_zeros (a_string)
							else
								a_string := appended_with_blanks (a_string)
							end
						elseif a_string.count > maximum_width then
							a_string := a_string.substring (a_string.count - maximum_width, a_string.count)
						end
					end
					STRING_.append_substring_to_string (a_result_string, a_string, 1, a_string.count)
				end
			end
		end

	format_week_in_year (a_result_string: STRING; a_calendar_value: XM_XPATH_CALENDAR_VALUE; some_modifiers, a_language, a_calendar, a_country: STRING) is
			-- Format week-in-year from `a_calendar_value'.
		require
			result_string_exists: a_result_string /= Void
			calendar_value_exists: a_calendar_value /= Void
			language_not_empty: a_language /= Void and then not a_language.is_empty
			language_is_supported: is_language_supported (a_language)
			calendar_not_empty: a_calendar /= Void and then not a_calendar.is_empty
			country_exists: a_country /= Void
			modifiers_exist: some_modifiers /= Void
			no_error_yet: last_evaluated_item = Void
		local
			a_string: STRING
			a_numberer: XM_XSLT_NUMBERER
			a_number: MA_DECIMAL
		do
			check_not_time_value (a_calendar_value, "W specifier not allowed for format-time()")
			if last_evaluated_item = Void then
				check_modifiers (some_modifiers, "1", False)
				if last_evaluated_item = Void then
					a_numberer := selected_numberer (a_language)
					create a_number.make_from_integer (a_calendar_value.week_in_year)
					-- TODO: this is result in ISO calendar - adjust for others, if you can find out what they are!
					a_string := a_numberer.formatted_string (a_number, primary_modifier, 0, "", letter_attribute_value, ordinal_attribute_value)
					if a_string.count < minimum_width then
						if is_decimal_format then
							a_string := prepended_with_zeros (a_string)
						else
							a_string := appended_with_blanks (a_string)
						end
					elseif a_string.count > maximum_width then
						a_string := a_string.substring (a_string.count - maximum_width, a_string.count)
					end
				end
				STRING_.append_substring_to_string (a_result_string, a_string, 1, a_string.count)
			end
		end
	
	format_week_in_month (a_result_string: STRING; a_calendar_value: XM_XPATH_CALENDAR_VALUE; some_modifiers, a_language, a_calendar, a_country: STRING) is
			-- Format week-in-month from `a_calendar_value'.
		require
			result_string_exists: a_result_string /= Void
			calendar_value_exists: a_calendar_value /= Void
			language_not_empty: a_language /= Void and then not a_language.is_empty
			language_is_supported: is_language_supported (a_language)
			calendar_not_empty: a_calendar /= Void and then not a_calendar.is_empty
			country_exists: a_country /= Void
			modifiers_exist: some_modifiers /= Void
			no_error_yet: last_evaluated_item = Void
		local
			a_string: STRING
			a_numberer: XM_XSLT_NUMBERER
			a_number: MA_DECIMAL
		do
			check_not_time_value (a_calendar_value, "w specifier not allowed for format-time()")
			if last_evaluated_item = Void then
				check_modifiers (some_modifiers, "1", False)
				if last_evaluated_item = Void then
					a_numberer := selected_numberer (a_language)
					create a_number.make_from_integer (a_calendar_value.week_in_month)
					a_string := a_numberer.formatted_string (a_number, primary_modifier, 0, "", letter_attribute_value, ordinal_attribute_value)
					if a_string.count < minimum_width then
						if is_decimal_format then
							a_string := prepended_with_zeros (a_string)
						else
							a_string := appended_with_blanks (a_string)
						end
					elseif a_string.count > maximum_width then
						a_string := a_string.substring (a_string.count - maximum_width, a_string.count)
					end
				end
				STRING_.append_substring_to_string (a_result_string, a_string, 1, a_string.count)
			end
		end

	format_hour (a_result_string: STRING; a_calendar_value: XM_XPATH_CALENDAR_VALUE; some_modifiers, a_language, a_calendar, a_country: STRING) is
			-- Format hour-in-day from `a_calendar_value' using 24-hour clock.
		require
			result_string_exists: a_result_string /= Void
			calendar_value_exists: a_calendar_value /= Void
			language_not_empty: a_language /= Void and then not a_language.is_empty
			language_is_supported: is_language_supported (a_language)
			calendar_not_empty: a_calendar /= Void and then not a_calendar.is_empty
			country_exists: a_country /= Void
			modifiers_exist: some_modifiers /= Void
			no_error_yet: last_evaluated_item = Void
		local
			a_string: STRING
			a_numberer: XM_XSLT_NUMBERER
			a_number: MA_DECIMAL
		do
			check_not_date_value (a_calendar_value, "H specifier not allowed for format-date()")
			if last_evaluated_item = Void then
				check_modifiers (some_modifiers, "1", False)
				if last_evaluated_item = Void then
					a_numberer := selected_numberer (a_language)
					create a_number.make_from_integer (a_calendar_value.hour)
					a_string := a_numberer.formatted_string (a_number, primary_modifier, 0, "", letter_attribute_value, ordinal_attribute_value)
					if a_string.count < minimum_width then
						if is_decimal_format then
							a_string := prepended_with_zeros (a_string)
						else
							a_string := appended_with_blanks (a_string)
						end
					elseif a_string.count > maximum_width then
						a_string := a_string.substring (a_string.count - maximum_width, a_string.count)
					end
					STRING_.append_substring_to_string (a_result_string, a_string, 1, a_string.count)
				end
			end
		end

	format_hour_in_half_day (a_result_string: STRING; a_calendar_value: XM_XPATH_CALENDAR_VALUE; some_modifiers, a_language, a_calendar, a_country: STRING) is
			-- Format hour-in-half-day from `a_calendar_value' using 12-hour clock.
		require
			result_string_exists: a_result_string /= Void
			calendar_value_exists: a_calendar_value /= Void
			language_not_empty: a_language /= Void and then not a_language.is_empty
			language_is_supported: is_language_supported (a_language)
			calendar_not_empty: a_calendar /= Void and then not a_calendar.is_empty
			country_exists: a_country /= Void
			modifiers_exist: some_modifiers /= Void
			no_error_yet: last_evaluated_item = Void
		local
			a_string: STRING
			a_numberer: XM_XSLT_NUMBERER
			a_number: MA_DECIMAL
		do
			check_not_date_value (a_calendar_value, "h specifier not allowed for format-date()")
			if last_evaluated_item = Void then
				check_modifiers (some_modifiers, "1", False)
				if last_evaluated_item = Void then
					a_numberer := selected_numberer (a_language)
					create a_number.make_from_integer (a_calendar_value.half_day_hour)
					a_string := a_numberer.formatted_string (a_number, primary_modifier, 0, "", letter_attribute_value, ordinal_attribute_value)
					if a_string.count < minimum_width then
						if is_decimal_format then
							a_string := prepended_with_zeros (a_string)
						else
							a_string := appended_with_blanks (a_string)
						end
					elseif a_string.count > maximum_width then
						a_string := a_string.substring (a_string.count - maximum_width, a_string.count)
					end
					STRING_.append_substring_to_string (a_result_string, a_string, 1, a_string.count)
				end
			end
		end

	format_am_pm (a_result_string: STRING; a_calendar_value: XM_XPATH_CALENDAR_VALUE; some_modifiers, a_language, a_calendar, a_country: STRING) is
			-- Format AM/PM marker from `a_calendar_value' using 24-hour clock.
		require
			result_string_exists: a_result_string /= Void
			calendar_value_exists: a_calendar_value /= Void
			language_not_empty: a_language /= Void and then not a_language.is_empty
			language_is_supported: is_language_supported (a_language)
			calendar_not_empty: a_calendar /= Void and then not a_calendar.is_empty
			country_exists: a_country /= Void
			modifiers_exist: some_modifiers /= Void
			no_error_yet: last_evaluated_item = Void
		local
			a_string: STRING
			a_numberer: XM_XSLT_NUMBERER
		do
			check_not_date_value (a_calendar_value, "P specifier not allowed for format-date()")
			if last_evaluated_item = Void then
				check_modifiers (some_modifiers, "n", True)
				if last_evaluated_item = Void then
					if not is_name_modifier then primary_modifier := "n" end
					a_numberer := selected_numberer (a_language)
					a_string := correctly_cased_name (a_numberer.half_day_name (a_calendar_value.minutes_in_day, minimum_width, maximum_width))
					STRING_.append_substring_to_string (a_result_string, a_string, 1, a_string.count)
				end
			end
		end

	format_minute (a_result_string: STRING; a_calendar_value: XM_XPATH_CALENDAR_VALUE; some_modifiers, a_language, a_calendar, a_country: STRING) is
			-- Format minute-in-hour from `a_calendar_value'.
		require
			result_string_exists: a_result_string /= Void
			calendar_value_exists: a_calendar_value /= Void
			language_not_empty: a_language /= Void and then not a_language.is_empty
			language_is_supported: is_language_supported (a_language)
			calendar_not_empty: a_calendar /= Void and then not a_calendar.is_empty
			country_exists: a_country /= Void
			modifiers_exist: some_modifiers /= Void
			no_error_yet: last_evaluated_item = Void
		local
			a_string: STRING
			a_numberer: XM_XSLT_NUMBERER
			a_number: MA_DECIMAL
		do
			check_not_date_value (a_calendar_value, "m specifier not allowed for format-date()")
			if last_evaluated_item = Void then
				check_modifiers (some_modifiers, "01", False)
				if last_evaluated_item = Void then
					a_numberer := selected_numberer (a_language)
					create a_number.make_from_integer (a_calendar_value.minute)
					a_string := a_numberer.formatted_string (a_number, primary_modifier, 0, "", letter_attribute_value, ordinal_attribute_value)
					if a_string.count < minimum_width then
						if is_decimal_format then
							a_string := prepended_with_zeros (a_string)
						else
							a_string := appended_with_blanks (a_string)
						end
					elseif a_string.count > maximum_width then
						a_string := a_string.substring (a_string.count - maximum_width, a_string.count)
					end
					STRING_.append_substring_to_string (a_result_string, a_string, 1, a_string.count)
				end
			end
		end

	format_second (a_result_string: STRING; a_calendar_value: XM_XPATH_CALENDAR_VALUE; some_modifiers, a_language, a_calendar, a_country: STRING) is
			-- Format second-in-hour from `a_calendar_value'.
		require
			result_string_exists: a_result_string /= Void
			calendar_value_exists: a_calendar_value /= Void
			language_not_empty: a_language /= Void and then not a_language.is_empty
			language_is_supported: is_language_supported (a_language)
			calendar_not_empty: a_calendar /= Void and then not a_calendar.is_empty
			country_exists: a_country /= Void
			modifiers_exist: some_modifiers /= Void
			no_error_yet: last_evaluated_item = Void
		local
			a_string: STRING
			a_numberer: XM_XSLT_NUMBERER
			a_number: MA_DECIMAL
		do
			check_not_date_value (a_calendar_value, "s specifier not allowed for format-date()")
			if last_evaluated_item = Void then
				check_modifiers (some_modifiers, "01", False)
				if last_evaluated_item = Void then
					a_numberer := selected_numberer (a_language)
					create a_number.make_from_integer (a_calendar_value.second)
					a_string := a_numberer.formatted_string (a_number, primary_modifier, 0, "", letter_attribute_value, ordinal_attribute_value)
					if a_string.count < minimum_width then
						if is_decimal_format then
							a_string := prepended_with_zeros (a_string)
						else
							a_string := appended_with_blanks (a_string)
						end
					elseif a_string.count > maximum_width then
						a_string := a_string.substring (a_string.count - maximum_width, a_string.count)
					end
					STRING_.append_substring_to_string (a_result_string, a_string, 1, a_string.count)
				end
			end
		end

	format_millisecond (a_result_string: STRING; a_calendar_value: XM_XPATH_CALENDAR_VALUE; some_modifiers, a_language, a_calendar, a_country: STRING) is
			-- Format fractional seconds from `a_calendar_value'.
		require
			result_string_exists: a_result_string /= Void
			calendar_value_exists: a_calendar_value /= Void
			language_not_empty: a_language /= Void and then not a_language.is_empty
			language_is_supported: is_language_supported (a_language)
			calendar_not_empty: a_calendar /= Void and then not a_calendar.is_empty
			country_exists: a_country /= Void
			modifiers_exist: some_modifiers /= Void
			no_error_yet: last_evaluated_item = Void
		local
			a_string: STRING
			a_numberer: XM_XSLT_NUMBERER
			a_number: MA_DECIMAL
		do
			check_not_date_value (a_calendar_value, "f specifier not allowed for format-date()")
			if last_evaluated_item = Void then
				check_modifiers (some_modifiers, "1", False)
				if last_evaluated_item = Void then
					a_numberer := selected_numberer (a_language)
					create a_number.make_from_integer (a_calendar_value.millisecond)
					a_string := a_numberer.formatted_string (a_number, primary_modifier, 0, "", letter_attribute_value, ordinal_attribute_value)
					if a_string.count < minimum_width then
						if is_decimal_format then
							a_string := prepended_with_zeros (a_string)
						else
							a_string := appended_with_blanks (a_string)
						end
					elseif a_string.count > maximum_width then
						a_string := a_string.substring (a_string.count - maximum_width, a_string.count)
					end
					STRING_.append_substring_to_string (a_result_string, a_string, 1, a_string.count)
				end
			end
		end

	format_time_zone (a_result_string: STRING; a_calendar_value: XM_XPATH_CALENDAR_VALUE; some_modifiers, a_language, a_calendar, a_country: STRING) is
			-- Format time zone as an offset from UTC, or as the conventional name from `a_calendar_value'.
		require
			result_string_exists: a_result_string /= Void
			calendar_value_exists: a_calendar_value /= Void
			language_not_empty: a_language /= Void and then not a_language.is_empty
			language_is_supported: is_language_supported (a_language)
			calendar_not_empty: a_calendar /= Void and then not a_calendar.is_empty
			country_exists: a_country /= Void
			modifiers_exist: some_modifiers /= Void
			no_error_yet: last_evaluated_item = Void
		local
			a_string: STRING
		do
			if a_calendar_value.zoned then
				check_modifiers (some_modifiers, "1", True)
				if last_evaluated_item = Void then
					if is_decimal_format then
						a_string := a_calendar_value.time_zone_description
					else
						a_string := "???" -- TODO
					end
					if a_string.count < minimum_width then
						if is_decimal_format then
							a_string := prepended_with_zeros (a_string)
						else
							a_string := appended_with_blanks (a_string)
						end
					elseif a_string.count > maximum_width then
						a_string := a_string.substring (a_string.count - maximum_width, a_string.count)
					end
					STRING_.append_substring_to_string (a_result_string, a_string, 1, a_string.count)
				end
			end
		end

	format_gmt_offset (a_result_string: STRING; a_calendar_value: XM_XPATH_CALENDAR_VALUE; some_modifiers, a_language, a_calendar, a_country: STRING) is
			-- Format time zone as an offset from GMT from `a_calendar_value'.
		require
			result_string_exists: a_result_string /= Void
			calendar_value_exists: a_calendar_value /= Void
			language_not_empty: a_language /= Void and then not a_language.is_empty
			language_is_supported: is_language_supported (a_language)
			calendar_not_empty: a_calendar /= Void and then not a_calendar.is_empty
			country_exists: a_country /= Void
			modifiers_exist: some_modifiers /= Void
			no_error_yet: last_evaluated_item = Void
		local
			a_string: STRING
		do
			if a_calendar_value.zoned then
				check_modifiers (some_modifiers, "1", False)
				if last_evaluated_item = Void then
					a_string := STRING_.concat ("GMT", a_calendar_value.time_zone_description)
					if a_string.count < minimum_width then
						a_string := appended_with_blanks (a_string)
					elseif a_string.count > maximum_width then
						a_string := a_string.substring (a_string.count - maximum_width, a_string.count)
					end
					STRING_.append_substring_to_string (a_result_string, a_string, 1, a_string.count)
				end
			end
		end

	format_calendar_name (a_result_string: STRING; some_modifiers, a_language, a_calendar, a_country: STRING) is
			-- Format calendar name.
		require
			result_string_exists: a_result_string /= Void
			language_not_empty: a_language /= Void and then not a_language.is_empty
			language_is_supported: is_language_supported (a_language)
			calendar_not_empty: a_calendar /= Void and then not a_calendar.is_empty
			country_exists: a_country /= Void
			modifiers_exist: some_modifiers /= Void
			no_error_yet: last_evaluated_item = Void
		local
			a_string: STRING
		do
			check_modifiers (some_modifiers, "n", True)
			if not is_name_modifier then primary_modifier := "n" end
			if last_evaluated_item = Void then
				if maximum_width <= 2 then
					a_string := a_calendar
				else
					a_string := calendar_name (a_calendar)
				end
				a_string := correctly_cased_name (a_string)
				if a_string.count < minimum_width then
					a_string := appended_with_blanks (a_string)
				elseif a_string.count > maximum_width then
					a_string := a_string.substring (a_string.count - maximum_width, a_string.count)
				end
				STRING_.append_substring_to_string (a_result_string, a_string, 1, a_string.count)
			end
		end

	format_era (a_result_string: STRING; a_calendar_value: XM_XPATH_CALENDAR_VALUE; some_modifiers, a_language, a_calendar, a_country: STRING) is
			-- Format time zone as an offset from GMT from `a_calendar_value'.
		require
			result_string_exists: a_result_string /= Void
			calendar_value_exists: a_calendar_value /= Void
			language_not_empty: a_language /= Void and then not a_language.is_empty
			language_is_supported: is_language_supported (a_language)
			calendar_not_empty: a_calendar /= Void and then not a_calendar.is_empty
			country_exists: a_country /= Void
			modifiers_exist: some_modifiers /= Void
			no_error_yet: last_evaluated_item = Void
		local
			a_string: STRING
		do
			check_modifiers (some_modifiers, "n", True)
			if not is_name_modifier then primary_modifier := "n" end
			if last_evaluated_item = Void then
				a_string := era (a_calendar_value, a_language, a_calendar, a_country)
				a_string := correctly_cased_name (a_string)
				if a_string.count < minimum_width then
					a_string := appended_with_blanks (a_string)
				end
				STRING_.append_substring_to_string (a_result_string, a_string, 1, a_string.count)
			end
		end

	is_decimal_format: BOOLEAN is
			-- Does `primary_modifier' indicate a decimal format?
		do
			Result := is_zeros_plus_one (primary_modifier)			
		end

	check_modifiers (some_modifiers, a_default: STRING; use_names: BOOLEAN) is
			-- Check `some_modifiers' for syntax errors.
		require
			modifiers_exist: some_modifiers /= Void
			default_modifier_not_empty: a_default /= Void and then not a_default.is_empty
			no_error_yet: last_evaluated_item = Void
		local
			a_splitter: ST_SPLITTER
			a_modifier, a_message: STRING
			some_components: DS_LIST [STRING]
			an_index: INTEGER
		do
			is_traditional := False
			is_ordinal := False
			minimum_width := 1
			maximum_width := Platform.maximum_integer
			primary_modifier := Void
			if not some_modifiers.is_empty then
				create a_splitter.make_with_separators (",")
				some_components := a_splitter.split_greedy (some_modifiers)
				if some_components.count > 2 then
					a_message := STRING_.concat ("More than one comma present in '", some_modifiers)
					a_message := STRING_.appended_string (a_message, "'")
					create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make_from_string (a_message, Xpath_errors_uri, "XTDE1340", dynamic_error)
				elseif some_components.count = 2 then
					a_modifier := some_components.item (1)
					set_widths (some_components.item (2))
				else
					a_modifier := some_modifiers
					minimum_width := 1
					maximum_width := Platform.maximum_integer
				end
				if last_evaluated_item = Void then
					STRING_.left_adjust (a_modifier)
					STRING_.right_adjust (a_modifier)
					an_index := a_modifier.index_of ('t', 1)
					if an_index > 0 then
						if an_index = a_modifier.count then
							is_traditional := True
						else
							a_message := STRING_.concat ("Misplaced 't' in '", a_modifier)
							a_message := STRING_.appended_string (a_message, "'")
							create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make_from_string (a_message, Xpath_errors_uri, "XTDE1340", dynamic_error)
						end
					end
					an_index := a_modifier.index_of ('o', 1)
					if an_index > 0 then
						if an_index = a_modifier.count then
							is_ordinal := True
						else
							a_message := STRING_.concat ("Misplaced 'o' in '", a_modifier)
							a_message := STRING_.appended_string (a_message, "'")
							create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make_from_string (a_message, Xpath_errors_uri, "XTDE1340", dynamic_error)
						end
					end					
				end
				if last_evaluated_item = Void then
					if is_traditional or else is_ordinal then
						a_modifier := a_modifier.substring (1, a_modifier.count - 1)
					end
					if not a_modifier.is_empty then
						set_primary_modifier (a_modifier, use_names)
					end
				end
			end
			if last_evaluated_item = Void and then primary_modifier = Void then primary_modifier := a_default end
		ensure
			primary_modifier_set: last_evaluated_item = Void implies primary_modifier /= Void and then not primary_modifier.is_empty
		end

	set_primary_modifier (a_modifier: STRING; use_names: BOOLEAN) is
			-- Set `primary_modifier' to `a_modifier' if valid.
		require
			modifier_not_empty: a_modifier /= Void and then not a_modifier.is_empty
			no_error_yet: last_evaluated_item = Void
		do
			primary_modifier := Void
			if is_zeros_plus_one (a_modifier)
				or else STRING_.same_string (a_modifier, "A")
				or else STRING_.same_string (a_modifier, "a")
				or else STRING_.same_string (a_modifier, "I")
				or else STRING_.same_string (a_modifier, "i")
				or else STRING_.same_string (a_modifier, "W")
				or else STRING_.same_string (a_modifier, "w")
				or else STRING_.same_string (a_modifier, "Ww") then
				primary_modifier := a_modifier
			elseif STRING_.same_string (a_modifier, "Nn")
				or else STRING_.same_string (a_modifier, "N")
				or else STRING_.same_string (a_modifier, "n") then
				if use_names then primary_modifier := a_modifier end
			end
		end

	set_widths (a_width: STRING) is
			-- Set widths.
		require
			widths_not_empty: a_width /= Void and then not a_width.is_empty
		local
			a_splitter: ST_SPLITTER
			a_message, a_string: STRING
			some_components: DS_LIST [STRING]
		do
			create a_splitter.make_with_separators ("-")
			if a_width.index_of ('+', 1) > 0 then
				a_message := STRING_.concat ("Plus sign present in '", a_width)
				a_message := STRING_.appended_string (a_message, "'")
				create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make_from_string (a_message, Xpath_errors_uri, "XTDE1340", dynamic_error)
			else
				some_components := a_splitter.split_greedy (a_width)
				if some_components.count > 2 then
					a_message := STRING_.concat ("Two many hyphens in '", a_width)
					a_message := STRING_.appended_string (a_message, "'")
					create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make_from_string (a_message, Xpath_errors_uri, "XTDE1340", dynamic_error)
				elseif some_components.count = 2 then
					a_string := some_components.item (1)
					STRING_.left_adjust (a_string)
					STRING_.right_adjust (a_string)
					if STRING_.same_string (a_string, "*") then
						minimum_width := 1
					elseif a_string.is_integer then
						minimum_width := a_string.to_integer
					end
					a_string := some_components.item (2)
					STRING_.left_adjust (a_string)
					STRING_.right_adjust (a_string)
					if STRING_.same_string (a_string, "*") then
						maximum_width := Platform.maximum_integer
					elseif a_string.is_integer then
						maximum_width := a_string.to_integer
					end
				else
					a_string := a_width
					STRING_.left_adjust (a_string)
					STRING_.right_adjust (a_string)
					if STRING_.same_string (a_string, "*") then
						minimum_width := 1
					elseif a_string.is_integer then
						minimum_width := a_string.to_integer
					end
					maximum_width := Platform.maximum_integer
				end
			end
		end

	is_valid_specifier (a_specifier: CHARACTER): BOOLEAN is
			-- Is `a_specifier' a valid format specifier?
		do
			inspect
				a_specifier
			when
				'Y', 'M', 'D', 'd', 'F', 'W', 'w', 'H', 'h',
				'P', 'm', 's', 'f', 'Z', 'z', 'C', 'E'
			 then
				Result := True
			else
				Result := False
			end
		end

	pattern_matcher (a_marker: STRING): RX_PCRE_REGULAR_EXPRESSION is
			-- Pattern matcher for `a_marker'
		require
			marker_exists: a_marker /= Void
		do
			create Result.make
			Result.compile ("([YMDdWwFHhmsfZzPCE])\s*(.*)")
			Result.match (a_marker)
		ensure
			result_not_void: Result /= Void
			pattern_compiled: Result.is_compiled
			subject_exists: Result.is_matching
		end

	is_language_supported (a_requested_language: STRING): BOOLEAN is
			-- Is `a_requested_language' supported by implementation?
		require
			requested_language_exists: a_requested_language /= Void
		do

			-- TODO: change when multiple languages are supported

			Result := STRING_.same_string (a_requested_language, Default_language)
		end

	language (a_requested_language: STRING): STRING is
			-- Language to be used for output
		require
			requested_language_exists: a_requested_language /= Void
			requested_language_not_supported: not is_language_supported (a_requested_language) 
		do
			Result := Default_language
		ensure
			result_not_empty: Result /= Void and then not Result.is_empty
		end

	language_prefix (a_requested_language: STRING): STRING is
			-- Language prefix to be emitted
		require
			requested_language_exists: a_requested_language /= Void
			requested_language_not_supported: not is_language_supported (a_requested_language) 
		do
			Result := "[Language: en]"
		ensure
			result_not_empty: Result /= Void and then not Result.is_empty
		end

	is_calendar_supported (a_requested_calendar: STRING): BOOLEAN is
			-- Is `a_requested_calendar' supported by implementation?
		require
			requested_calendar_exists: a_requested_calendar /= Void
		do

			-- TODO: change when more calendars are supported

			Result := STRING_.same_string (a_requested_calendar, Default_calendar)
				or else STRING_.same_string (a_requested_calendar, Ad_calendar)
		end

	calendar (a_requested_calendar: STRING): STRING is
			-- Calendar to be used for output
		require
			requested_calendar_exists: a_requested_calendar /= Void
			requested_calendar_not_supported: not is_calendar_supported (a_requested_calendar) 
		do
			Result := Default_calendar
		ensure
			result_not_empty: Result /= Void and then not Result.is_empty
		end

	calendar_prefix (a_requested_calendar, a_language: STRING): STRING is
			-- Calendar prefix to be emitted
		require
			requested_calendar_exists: a_requested_calendar /= Void
			requested_calendar_not_supported: not is_calendar_supported (a_requested_calendar)
			language_exists: a_language /= Void
			language_is_supported: is_language_supported (a_language) 
		do

			-- TODO: change when additional languages are supported

			Result := "[Calendar: CE]"
		ensure
			result_not_empty: Result /= Void and then not Result.is_empty
		end

	
	calendar_name (a_calendar: STRING): STRING is
			-- Full name for `a_calendar'
		require
			calendar_not_empty: a_calendar /= Void and then not a_calendar.is_empty
			is_calendar_supported: is_calendar_supported (a_calendar)
		do
			if STRING_.same_string (a_calendar, Default_calendar) then
				Result := "Common Era"
			elseif STRING_.same_string (a_calendar, Ad_calendar) then
				Result := "Christian Era"
			end
		ensure
			result_not_empty: Result /= Void and then not Result.is_empty
		end

	week_day_number (a_day: INTEGER; a_calendar, a_country: STRING): INTEGER is
			-- Number of day in week for `a_calendar' in `a_country'
		require
			valid_iso_day_number: a_day >= 1 and then a_day <= 7 -- Monday = 1
			calendar_not_empty: a_calendar /= Void and then not a_calendar.is_empty
			country_exists: a_country /= Void
		do

			-- For now, assuming Sunday =1, Saturday = 7, for all calendars and countries
			-- TODO: correct this

			Result := week_days_from_monday.week_day_from_code (a_day).as_week_day_from_sunday.code
		end

	is_name_modifier: BOOLEAN is
			-- Is `primary_modifier' a name request?
		do
			if STRING_.same_string (primary_modifier, "n")
				or else STRING_.same_string (primary_modifier, "N")
				or else STRING_.same_string (primary_modifier, "Nn")
			 then
				Result := True
			end
		end

	correctly_cased_name (a_name: STRING): STRING is
			-- `a_name' cased according to `primary_modifier'
		require
			name_exists: a_name /= Void
			is_capitalized: True -- First letter upper-case, others in lower-case
			valid_name_modifier: is_name_modifier
		do

			-- TODO: correct this for Unicode captialization
	
			if STRING_.same_string (primary_modifier, "n") then
				Result := a_name.as_lower
			elseif STRING_.same_string (primary_modifier, "N") then
				Result := a_name.as_upper
			else
				check
					capitalized: STRING_.same_string (primary_modifier, "Nn")
					-- from pre-condition `valid_name_modifier'
				end
				Result := a_name
			end
		end

	era (a_calendar_value: XM_XPATH_CALENDAR_VALUE; a_language, a_calendar, a_country: STRING): STRING is
			-- Era
		require
			calendar_value_exists: a_calendar_value /= Void
			calendar_not_empty: a_calendar /= Void and then not a_calendar.is_empty
			country_exists: a_country /= Void
			language_not_empty: a_language /= Void and then not a_language.is_empty
			language_is_supported: is_language_supported (a_language)
		local
			a_year: INTEGER
		do

			-- TODO: other calendars and countries, and language

			a_year := a_calendar_value.year
			if STRING_.same_string (a_calendar, Default_Calendar) then
				if a_year > 0 then
					if maximum_width >= 10 then
						Result := "Common Era"
					else
						Result := "CE"
					end
				else
					if maximum_width >= 17 then
						Result := "Before Common Era"
					else
						Result := "BCE"
					end
				end
			elseif  STRING_.same_string (a_calendar, Ad_Calendar) then
							if a_year > 0 then
					if maximum_width >= 11 then
						Result := "Anno Domini"
					else
						Result := "AD"
					end
				else
					if maximum_width >= 13 then
						Result := "Before Christ"
					else
						Result := "BC"
					end
				end
			else
				Result := "Unknown"
			end
		ensure
			not_empty: Result /= Void and then not Result.is_empty
		end

	prepended_with_zeros (a_string: STRING): STRING is
			-- Left-padded version of `a_string'
		require
			string_exists: a_string /= Void
			short_string: a_string.count < minimum_width
		do
			create Result.make_filled ('0', a_string.count - minimum_width)
			Result := STRING_.appended_string (Result, a_string)
		ensure
			minimum_width: Result.count = minimum_width
		end

	appended_with_blanks (a_string: STRING): STRING is
			-- Right-padded version of `a_string'
		require
			string_exists: a_string /= Void
			short_string: a_string.count < minimum_width
		do
			create Result.make_filled (' ', a_string.count - minimum_width)
			Result := STRING_.concat (a_string, Result)
		ensure
			minimum_width: Result.count = minimum_width
		end

end
	
