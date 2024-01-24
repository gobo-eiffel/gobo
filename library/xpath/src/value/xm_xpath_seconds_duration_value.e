note

	description:

		"Objects that represent XPath xdt:dayTimeDuration values"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "MIT License"

class XM_XPATH_SECONDS_DURATION_VALUE

inherit

	XM_XPATH_DURATION_VALUE
		rename
			make as make_duration,
			make_from_duration as make_duration_from_duration
		redefine
			is_duration,
			is_seconds_duration, as_seconds_duration,
			same_expression, plus, minus,
			multiply, divide, scalar_divide,
			display, item_type, is_comparable
		end

	KL_SHARED_PLATFORM
		export {NONE} all end

create

	make, make_from_duration

feature {NONE} -- Initialization

	make (a_duration: STRING)
			-- Create from lexical duration.
		local
			a_parser: XM_XPATH_DURATION_PARSER
		do
			make_atomic_value
			create a_parser.make
			duration := a_parser.string_to_seconds_duration (a_duration)
			normalize
		end

	make_from_duration (a_duration: like duration)
			-- Create from duration.
		require
			zero_years_and_months: a_duration.year = 0 and then a_duration.month = 0
		do
			make_atomic_value
			duration := a_duration
			normalize
		end

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE
			-- Data type of the expression, where know
		do
			Result := type_factory.day_time_duration_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

	milliseconds: MA_DECIMAL
			-- Length in milliseconds
		local
			l_milliseconds: MA_DECIMAL
		do
			create Result.make_from_integer (duration.day)
			Result := Result * milliseconds_in_day
			create l_milliseconds.make_from_integer (duration.millisecond_count)
			Result := Result + l_milliseconds
		ensure
			result_not_void: Result /= Void
		end

feature -- Comparison

	same_expression (other: XM_XPATH_EXPRESSION): BOOLEAN
			-- Are `Current' and `other' the same expression?
		local
			a_duration: like duration
		do
			if other.is_seconds_duration then
				a_duration := other.as_duration_value.duration
				Result := duration.is_equal (a_duration)
			end
		end

feature -- Status report

	is_duration (a_duration: STRING): BOOLEAN
			-- Is `a_duration' a valid duration?
		local
			a_parser: XM_XPATH_DURATION_PARSER
		do
			create a_parser.make
			Result := a_parser.is_seconds_duration (a_duration)
		end

	is_seconds_duration: BOOLEAN
			-- Is `Current' an xdt:dayTimeDuration value?
		do
			Result := True
		end

	is_valid_time_zone: BOOLEAN
			-- Is `Current' valid as a fixed-offset time zone?
		local
			an_hour_count: INTEGER
		do

			-- Invalid if less than -PT14H or greater than PT14H
			--  or if does not contain an integral number of minutes.

			Result := duration.second = 0 and then duration.millisecond = 0
			if Result then
				an_hour_count := (duration.day * 24 + duration.hour).abs
				Result := an_hour_count < 14
					or else an_hour_count = 14 and then duration.minute.abs = 0
			end
		end

	is_comparable (other: XM_XPATH_ATOMIC_VALUE): BOOLEAN
			-- Is `other' comparable to `Current'?
		do
			Result := other.is_seconds_duration
		end

	display (a_level: INTEGER)
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indentation (a_level), "dayTimeDuration (")
			a_string := STRING_.appended_string (a_string, string_value)
			a_string := STRING_.appended_string (a_string, ")")
			std.error.put_string (a_string)
			std.error.put_new_line
		end

feature -- Conversions

	as_seconds_duration: XM_XPATH_SECONDS_DURATION_VALUE
			-- `Current' seen as an xdt:dayTimeDuration value
		do
			Result := Current
		end

feature -- Basic operations

	plus (other: XM_XPATH_DURATION_VALUE): XM_XPATH_ITEM
			-- Addition of `other' to `Current'
		do
			if other.is_seconds_duration then
				create {XM_XPATH_SECONDS_DURATION_VALUE} Result.make_from_duration (duration + other.duration)
			else
				create {XM_XPATH_INVALID_ITEM} Result.make_from_string ("Both operands must be the same type for duration addition", Gexslt_eiffel_type_uri, "MIXED-DURATIONS", Dynamic_error)
			end
		end

	minus (other: XM_XPATH_DURATION_VALUE): XM_XPATH_ITEM
			-- Subtraction of `other' from `Current'
		do
			if other.is_seconds_duration then
				create {XM_XPATH_SECONDS_DURATION_VALUE} Result.make_from_duration (duration - other.duration)
			else
				create {XM_XPATH_INVALID_ITEM} Result.make_from_string ("Both operands must be the same type for duration subtraction", Gexslt_eiffel_type_uri, "MIXED-DURATIONS", Dynamic_error)
			end
		end

	multiply (a_scalar: DOUBLE): XM_XPATH_ITEM
			-- Multiplication of `Current' by `a_scalar'
		local
			a_duration: like duration
			a_result: INTEGER
			a_double: DOUBLE
		do
			a_double := milliseconds.to_double * a_scalar
			if a_double.abs + 0.5 < (Platform.Maximum_integer + 1.0) then
				a_result := DOUBLE_.rounded_to_integer (a_double)
				if a_result = Platform.Minimum_integer then
					create {XM_XPATH_INVALID_ITEM} Result.make_from_string ("Arithmetic overflow in duration multiplication", Xpath_errors_uri, "FODT0002", Dynamic_error)
				else
					create a_duration.make_precise (0, 0, 0, 0, 0, 0, a_result)
					create {XM_XPATH_SECONDS_DURATION_VALUE} Result.make_from_duration (a_duration)
				end
			else
				create {XM_XPATH_INVALID_ITEM} Result.make_from_string ("Arithmetic overflow in duration multiplication", Xpath_errors_uri, "FODT0002", Dynamic_error)
			end
		end

	scalar_divide (a_scalar: DOUBLE): XM_XPATH_ITEM
			-- Division of `Current' by `a_scalar'
		do
			Result := multiply (1.0 / a_scalar)
		end

	divide (other: XM_XPATH_DURATION_VALUE): XM_XPATH_ITEM
			-- Division of `other' into `Current'
		local
			a_decimal, another_decimal: MA_DECIMAL
		do
			if other.is_seconds_duration then
				if other.as_seconds_duration.milliseconds.is_zero then
					create {XM_XPATH_INVALID_ITEM} Result.make_from_string ("Division by zero", Xpath_errors_uri, "FOAR0001", Dynamic_error)
				else
					a_decimal := milliseconds
					another_decimal := other.as_seconds_duration.milliseconds
					a_decimal := a_decimal / another_decimal
					create {XM_XPATH_DECIMAL_VALUE} Result.make (a_decimal)
				end
			else
				create {XM_XPATH_INVALID_ITEM} Result.make_from_string ("Both operands must be the same type for duration division", Xpath_errors_uri, "XPTY0004", Dynamic_error)
			end
		end

feature {NONE} -- Implementation

	normalize
			-- Normalize `duration'
		local
			l_day, l_hour: INTEGER
			l_minute, l_second, l_seconds, l_millisecond, l_milliseconds: INTEGER
			l_total_hours, l_total_minutes: INTEGER
		do
			duration.set_time_canonical
			l_total_minutes := INTEGER_.div (duration.second_count, 60)
			l_milliseconds := duration.millisecond_count
			l_day := duration.day * 24
			if l_day > 0 and l_total_minutes < 0 then
				from
				until
					not (l_day > 0 and l_total_minutes < 0)
				loop
					l_day := l_day - 1
					l_total_minutes := l_total_minutes + 1440
				end
			elseif l_day < 0 and l_total_minutes > 0 then
				from
				until
					not (l_day < 0 and l_total_minutes > 0)
				loop
					l_day := l_day + 1
					l_total_minutes := l_total_minutes - 1440
				end
			end
			if l_total_minutes > 0 and l_milliseconds < 0 then
				from
				until
					not (l_total_minutes > 0 and l_milliseconds < 0)
				loop
					l_second := l_second - 1
					l_milliseconds := 1000 + l_milliseconds
				end
			elseif l_total_minutes < 0 and l_milliseconds > 0  then
				from
				until
					not (l_total_minutes < 0 and l_milliseconds > 0)
				loop
					l_second := l_second + 1
					l_milliseconds := l_milliseconds - 1000
				end
			end
			l_seconds := INTEGER_.div (l_milliseconds, 1000)
			l_millisecond := INTEGER_.mod (l_milliseconds, 1000)
			l_second := INTEGER_.mod (l_seconds, 60)
			l_minute := INTEGER_.mod (l_total_minutes, 60)
			l_total_hours := INTEGER_.div (l_total_minutes, 60) + l_day
			l_hour := INTEGER_.mod (l_total_hours, 24)
			l_day := INTEGER_.div (l_total_hours, 24)
			create duration.make_precise (0, 0, l_day, l_hour, l_minute, l_second, l_millisecond)
		ensure
			normal_duration: is_normal
		end

	milliseconds_in_day: MA_DECIMAL
			-- Number of milliseconds in one day
		once
			create Result.make_from_integer (24 * 60 * 60 * 1000)
		ensure
			result_not_void: Result /= Void
		end

invariant

	zero_years_and_months: duration.year = 0 and then duration.month = 0

end
