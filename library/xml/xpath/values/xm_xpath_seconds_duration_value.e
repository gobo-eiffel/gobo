indexing

	description:

		"Objects that represent XPath xdt:dayTimeDuration values"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_SECONDS_DURATION_VALUE

inherit

	XM_XPATH_DURATION_VALUE
		redefine
			make, make_from_duration, is_duration, string_value,
			is_seconds_duration, as_seconds_duration,
			same_expression, is_convertible,
			display, convert_to_type, item_type
		end

create

	make, make_from_duration

feature {NONE} -- Initialization

	make (a_duration: STRING) is
			-- Create from lexical duration.
		local
			a_parser: XM_XPATH_DURATION_PARSER
		do
			make_atomic_value
			create a_parser.make
			duration := a_parser.string_to_seconds_duration (a_duration)
			normalize
		end

	make_from_duration (a_duration: like duration) is
			-- Create from duration.
		do
			make_atomic_value
			duration := a_duration
			normalize
		end

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, where know
		do
			Result := type_factory.day_time_duration_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

	string_value: STRING is
			--Value of the item as a string
		local
			a_string: STRING
			a_millisecond_count, a_second_count, a_minute_count,
			an_hour_count, a_day_count: INTEGER
		do
			a_millisecond_count := duration.millisecond_count
			if a_millisecond_count = 0 then
				Result := "PT0S"
			else
				if a_millisecond_count < 0 then a_millisecond_count := 0 - a_millisecond_count end
				a_second_count := a_millisecond_count // 1000; a_millisecond_count := a_millisecond_count \\ 1000
				a_minute_count := a_second_count // 60; a_second_count := a_second_count \\ 60
				an_hour_count := a_minute_count // 60; a_minute_count := a_minute_count \\ 60
				a_day_count := an_hour_count // 24; an_hour_count := an_hour_count \\ 24
				if is_negative then Result := "-P" else Result := "P" end
				if a_day_count /= 0 then Result := Result + a_day_count.out + "D" end
				if an_hour_count /= 0 or else a_minute_count /= 0
					or else a_second_count /= 0 or else a_millisecond_count /= 0 then
					Result := Result + "T"
				end
				if an_hour_count /= 0 then Result := Result + an_hour_count.out + "H" end
				if a_minute_count /= 0 then Result := Result + a_minute_count.out + "M" end
				if a_second_count /= 0 or else a_millisecond_count /= 0 then
					Result := Result + a_second_count.out
					if a_millisecond_count /= 0 then
						Result := Result + "."
						a_string := a_millisecond_count.out
						from  until a_string.count = 3 loop
							a_string.insert_character ('0', 1)
						end
						Result := Result + a_string
					end
					Result := Result + "S"
				end
			end
		end

	seconds: MA_DECIMAL is
			-- Seconds component (including milliseconds)
		local
			a_string: STRING
		do
			a_string := duration.second.out
			if duration.millisecond /= 0 then
				a_string := a_string + "." + duration.millisecond.abs.out
			end
			create Result.make_from_string (a_string)
		ensure
			result_not_void: Result /= Void
		end

feature -- Comparison

	same_expression (other: XM_XPATH_EXPRESSION): BOOLEAN is
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

	is_duration (a_duration: STRING): BOOLEAN is
			-- Is `a_duration' a valid duration?
		local
			a_parser: XM_XPATH_DURATION_PARSER
		do
			create a_parser.make
			Result := a_parser.is_seconds_duration (a_duration)
		end

	is_seconds_duration: BOOLEAN is
			-- Is `Current' an xdt:dayTimeDuration value?
		do
			Result := True
		end

	is_convertible (a_required_type: XM_XPATH_ITEM_TYPE): BOOLEAN is
			-- Is `Current' convertible to `a_required_type'?
		do
			if	a_required_type = any_item or else a_required_type = type_factory.any_atomic_type
				or else a_required_type = type_factory.duration_type
				or else a_required_type = type_factory.day_time_duration_type
				or else a_required_type = type_factory.string_type
				or else a_required_type = type_factory.untyped_atomic_type then
				Result := True
			end
		end

	is_valid_time_zone: BOOLEAN is
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
	
	display (a_level: INTEGER) is
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

	as_seconds_duration: XM_XPATH_SECONDS_DURATION_VALUE is
			-- `Current' seen as an xdt:dayTimeDuration value
		do
			Result := Current
		end
	
	convert_to_type (a_required_type: XM_XPATH_ITEM_TYPE): XM_XPATH_ATOMIC_VALUE is
			-- Convert `Current' to `a_required_type'
		local
			a_duration: like duration
		do
			if	a_required_type = any_item or else a_required_type = type_factory.any_atomic_type
				or else a_required_type = type_factory.day_time_duration_type then
				Result := Current
			elseif a_required_type = type_factory.string_type then
				create {XM_XPATH_STRING_VALUE} Result.make (string_value)
			elseif a_required_type = type_factory.untyped_atomic_type then
				create {XM_XPATH_UNTYPED_ATOMIC_VALUE} Result.make (string_value)
			elseif a_required_type = type_factory.duration_type then
				create {XM_XPATH_DURATION_VALUE} Result.make_from_duration (duration)
			end
		end

feature {NONE} -- Implementation

	normalize is
			-- Normalize `duration'
		local
			 a_day, an_hour, a_minute, a_second, a_millisecond: INTEGER
		do
			a_day := duration.day.abs
			an_hour := duration.hour.abs
			a_minute := duration.minute.abs
			a_second := duration.second.abs
			a_millisecond := duration.millisecond.abs
			if a_millisecond > 999 then
				a_second := a_second + a_millisecond // 1000
				a_millisecond := a_millisecond \\ 1000
			end
			if a_second > 59 then
				a_minute := a_minute + a_second // 60
				a_second := a_second \\ 60
			end
			if a_minute > 59 then
				an_hour := an_hour + a_minute // 60
				a_minute := a_minute \\ 60
			end
			if an_hour > 23 then
				a_day := a_day + an_hour // 24
				an_hour := an_hour \\ 24
			end
			if is_negative then
				create duration.make_precise (0, 0, -a_day, -an_hour, -a_minute, -a_second, -a_millisecond)
			else
				create duration.make_precise (0, 0, a_day, an_hour, a_minute, a_second, a_millisecond)
			end
		end

end
