indexing

	description:

		"Objects that represent XPath duration values"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_DURATION_VALUE

inherit

	XM_XPATH_ATOMIC_VALUE
		redefine
			is_duration_value, as_duration_value, hash_code
		end

	KL_IMPORTED_INTEGER_ROUTINES
		export {NONE} all end

	KL_IMPORTED_DOUBLE_ROUTINES
		export {NONE} all end

create

	make, make_from_duration

feature {NONE} -- Initialization

	make (a_duration: STRING) is
			-- Create from lexical duration.
		require
			lexical_duration: a_duration /= Void and then is_duration (a_duration)
		local
			a_parser: XM_XPATH_DURATION_PARSER
		do
			make_atomic_value
			create a_parser.make
			duration := a_parser.string_to_duration (a_duration)
		end

	make_from_duration (a_duration: like duration) is
			-- Create from duration.
		require
			duration_not_void: a_duration /= Void
		do
			make_atomic_value
			duration := a_duration
		end

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, where know
		do
			Result := type_factory.duration_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

	string_value: STRING is
			-- Value of the item as a string
		local
			l_string: STRING
		do

			-- XML Schema does not define a canonical representation. We omit all zero components,
			--  unless the duration is zero-length, in which case we output PT0S.

			if duration.year = 0 and then duration.month = 0 and then duration.day = 0
				and then duration.hour = 0 and then duration.minute = 0
				and then duration.second = 0 and then duration.millisecond = 0 then
				Result := "PT0S"
			elseif not is_normal then
				Result := normalized_duration.string_value
			else
				if is_negative then Result := "-P" else Result := "P" end
				if duration.year /= 0 then Result := Result + duration.year.abs.out + "Y" end
				if duration.month /= 0 then Result := Result + duration.month.abs.out + "M" end
				if duration.day /= 0 then Result := Result + duration.day.abs.out + "D" end
				if duration.hour /= 0 or else duration.minute /= 0 
					or else duration.second /= 0 or else duration.millisecond /= 0 then
					Result := Result + "T"
				end
				if duration.hour /= 0 then Result := Result + duration.hour.abs.out + "H" end
				if duration.minute /= 0 then Result := Result + duration.minute.abs.out + "M" end
				if duration.second /= 0 or else duration.millisecond /= 0 then
					Result := Result + duration.second.abs.out
					if duration.millisecond /= 0 then
						Result := Result + "."
						l_string := duration.millisecond.abs.out
						from  until l_string.count = 3 loop
							l_string.insert_character ('0', 1)
						end
						from  until l_string.item (l_string.count) /= '0' loop
							l_string.remove_tail (1)
						end
						Result := Result + l_string
					end
					Result := Result + "S"
				end
			end
		end

	hash_code: INTEGER is
			-- Hash code value
		do
			Result := duration.hash_code
		end


	seconds: MA_DECIMAL is
			-- Seconds component (including milliseconds)
		local
			l_string, l_milliseconds: STRING
		do
			l_string := duration.second.out
			if duration.millisecond /= 0 then
				l_milliseconds := duration.millisecond.abs.out
				from  until l_milliseconds.count = 3 loop
					l_milliseconds.insert_character ('0', 1)
				end
				from  until l_milliseconds.item (l_milliseconds.count) /= '0' loop
					l_milliseconds.remove_tail (1)
				end
				l_string := l_string + "." + l_milliseconds
			end
			create Result.make_from_string (l_string)
		ensure
			result_not_void: Result /= Void
		end

	duration: DT_DATE_TIME_DURATION
			-- Duration

feature -- Comparison

	same_expression (other: XM_XPATH_EXPRESSION): BOOLEAN is
			-- Are `Current' and `other' the same expression?
		local
			l_duration: like duration
		do
			if other.is_duration_value then

				l_duration := other.as_duration_value.duration

				Result := duration.year = l_duration.year
					and then duration.month = l_duration.month
					and then duration.day = l_duration.day
					and then duration.hour = l_duration.hour
					and then duration.minute = l_duration.minute
					and then duration.second = l_duration.second
					and then duration.millisecond = l_duration.millisecond
			end
		end

	equal_duration (a_other: XM_XPATH_DURATION_VALUE): BOOLEAN is
			-- Is `Current' equal to `a_other'?
			-- XPath functions and operators says two xs:durations are equal iff all their seconds count and their months count are equal
		do
			Result := normalized_duration.same_expression (a_other.normalized_duration)
		end

	three_way_comparison (other: XM_XPATH_ATOMIC_VALUE; a_context: XM_XPATH_CONTEXT): INTEGER is
			-- Comparison of `Current' to `other'
		local
			l_duration: like duration
		do
			l_duration := other.as_duration_value.duration
			if duration < l_duration then
				Result := -1
			elseif duration > l_duration then
				Result := 1
			end
		end

feature -- Status report

	is_normal: BOOLEAN is
			-- Is `duration' in normal form?
		do
			Result := duration.month.abs < 12 and then duration.hour.abs < 24
				and then (duration.month < 0 implies  duration.hour <= 0)
				and then (duration.hour < 0 implies duration.month <= 0)
				and then (duration.year < 0 implies duration.hour <= 0)
				and then duration.is_time_canonical
		end

	is_negative: BOOLEAN is
			-- Is `Current' a negative duration?
		require
			in_normal_form: is_normal
		do
			Result := duration.year < 0 or else duration.month < 0
				or else duration.day < 0 or else duration.hour < 0
				or else duration.minute < 0 or else duration.second < 0
				or else duration.millisecond < 0
		end

	is_duration (a_duration: STRING): BOOLEAN is
			-- Is `a_duration' a valid duration?
		require
			lexical_duration_not_void: a_duration /= Void
		local
			a_parser: XM_XPATH_DURATION_PARSER
		do
			create a_parser.make
			Result := a_parser.is_duration (a_duration)
		end

	is_duration_value: BOOLEAN is
			-- Is `Current' an xs:duration value?
		do
			Result := True
		end

	is_comparable (other: XM_XPATH_ATOMIC_VALUE): BOOLEAN is
			-- Is `other' comparable to `Current'?
		do
			Result := False -- xs:duration may only be compared for equality
		end

	is_convertible (a_required_type: XM_XPATH_ITEM_TYPE): BOOLEAN is
			-- Is `Current' convertible to `a_required_type'?
		do
			if	a_required_type = any_item or else a_required_type = type_factory.any_atomic_type
				or else a_required_type = type_factory.duration_type
				or else a_required_type = type_factory.day_time_duration_type
				or else a_required_type = type_factory.year_month_duration_type
				or else a_required_type = type_factory.string_type
				or else a_required_type = type_factory.untyped_atomic_type then
				Result := True
			end
		end

	display (a_level: INTEGER) is
			-- Diagnostic print of expression structure to `std.error'
		local
			l_string: STRING
		do
			l_string := STRING_.appended_string (indentation (a_level), "duration (")
			l_string := STRING_.appended_string (l_string, string_value)
			l_string := STRING_.appended_string (l_string, ")")
			std.error.put_string (l_string)
			std.error.put_new_line
		end

feature -- Conversions

	as_duration_value: XM_XPATH_DURATION_VALUE is
			-- `Current' seen as an xs:duration value
		do
			Result := Current
		end

	convert_to_type (a_required_type: XM_XPATH_ITEM_TYPE) is
			-- Convert `Current' to `a_required_type'
		local
			a_duration: like duration
		do
			if	a_required_type = any_item or else a_required_type = type_factory.any_atomic_type
				or else a_required_type = type_factory.duration_type then
				converted_value := Current
			elseif a_required_type = type_factory.string_type then
				create {XM_XPATH_STRING_VALUE} converted_value.make (string_value)
			elseif a_required_type = type_factory.untyped_atomic_type then
				create {XM_XPATH_STRING_VALUE} converted_value.make_untyped_atomic (string_value)
			elseif a_required_type = type_factory.year_month_duration_type then
				create a_duration.make (duration.year, duration.month, 0, 0, 0, 0)
				create {XM_XPATH_MONTHS_DURATION_VALUE} converted_value.make_from_duration (a_duration)
			elseif a_required_type = type_factory.day_time_duration_type then
				create a_duration.make_precise (0, 0, duration.day, duration.hour, duration.minute, duration.second, duration.millisecond)
				create {XM_XPATH_SECONDS_DURATION_VALUE} converted_value.make_from_duration (a_duration)
			end
		end

feature -- Basic operations

	plus (other: XM_XPATH_DURATION_VALUE): XM_XPATH_ITEM is
			-- Addition of `other' to `Current'
		require
			other_duration_not_void: other /= Void
		do
			create {XM_XPATH_INVALID_ITEM} Result.make_from_string ("Only descendants of xs:duration may be added", Gexslt_eiffel_type_uri, "DURATION-ADDITION", Dynamic_error)
		ensure
			result_may_be_in_error: Result /= Void
		end

	minus (other: XM_XPATH_DURATION_VALUE): XM_XPATH_ITEM is
			-- Subtraction of `other' from `Current'
		require
			other_duration_not_void: other /= Void
		do
			create {XM_XPATH_INVALID_ITEM} Result.make_from_string ("Only descendants of xs:duration may be subtracted", Gexslt_eiffel_type_uri, "DURATION-SUBTRACTION", Dynamic_error)
		ensure
			result_may_be_in_error: Result /= Void
		end
		
	multiply (a_scalar: DOUBLE): XM_XPATH_ITEM is
			-- Multiplication of `Current' by `a_scalar'
		require
			non_zero_double: a_scalar /= 0 -- and then not a_scalar.is_infinity and then not a_scalar.is_nan
		do
			create {XM_XPATH_INVALID_ITEM} Result.make_from_string ("Only descendants of xs:duration may be subtracted", Gexslt_eiffel_type_uri, "DURATION-SUBTRACTION", Dynamic_error)
		ensure
			result_may_be_in_error: Result /= Void
		end
		
	scalar_divide (a_scalar: DOUBLE): XM_XPATH_ITEM is
			-- Division of `Current' by `a_scalar'
		require
			non_zero_double: a_scalar /= 0 -- and then not a_scalar.is_infinity and then not a_scalar.is_nan
		do
			create {XM_XPATH_INVALID_ITEM} Result.make_from_string ("Only descendants of xs:duration may be subtracted", Gexslt_eiffel_type_uri, "DURATION-SUBTRACTION", Dynamic_error)
		ensure
			result_may_be_in_error: Result /= Void
		end
		
	divide (other: XM_XPATH_DURATION_VALUE): XM_XPATH_ITEM is
			-- Division of `other' into `Current'
		require
			other_duration_not_void: other /= Void
		do
			create {XM_XPATH_INVALID_ITEM} Result.make_from_string ("Only descendants of xs:duration may be divided", Gexslt_eiffel_type_uri, "DURATION-DIVISION", Dynamic_error)
		ensure
			result_may_be_in_error: Result /= Void
		end
		
feature {XM_XPATH_DURATION_VALUE} -- Implementation

	normalized_duration: XM_XPATH_DURATION_VALUE is
			-- Normal form of `duration'
		local
			a_year, a_month, a_day, an_hour: INTEGER
			a_minute, a_second, a_millisecond: INTEGER
			total_months, total_hours, total_minutes: INTEGER
			a_duration: like duration
		do
			total_months := duration.year * 12 + duration.month
			a_year := total_months.abs // 12
			a_month := total_months.abs \\ 12
			a_second := duration.second_count.abs \\ 60
			a_millisecond := duration.millisecond_count.abs \\ 1000
			total_minutes := duration.second_count.abs // 60
			a_minute := total_minutes \\ 60
			total_hours := total_minutes // 60
			an_hour := total_hours \\ 24
			a_day :=  duration.day.abs + total_hours // 24
			if total_months < 0 or else duration.millisecond_count < 0 then
				create a_duration.make_precise (-a_year, -a_month, -a_day, -an_hour, -a_minute, -a_second, -a_millisecond)
			else
				create a_duration.make_precise (a_year, a_month, a_day, an_hour, a_minute, a_second, a_millisecond)
			end
			create Result.make_from_duration (a_duration)
		ensure
			normal_duration: Result /= Void and then Result.is_normal
		end

invariant

	duration_not_void: duration /= Void

end
