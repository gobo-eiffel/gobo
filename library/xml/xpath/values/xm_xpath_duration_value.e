indexing

	description:

		"Objects that represent XPath duration values"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_DURATION_VALUE

inherit

	XM_XPATH_ATOMIC_VALUE
		redefine
			is_duration_value, as_duration_value, hash_code
		end

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
			is_normal := duration.month < 12 and then duration.hour < 24
				and then duration.minute < 60 and then duration.second < 60
				and then duration.millisecond < 1000
		end

	make_from_duration (a_duration: like duration) is
			-- Create from duration.
		require
			duration_exists: a_duration /= Void
		do
			make_atomic_value
			duration := a_duration
			is_normal := duration.month < 12 and then duration.hour < 24
				and then duration.minute < 60 and then duration.second < 60
				and then duration.millisecond < 1000
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
			--Value of the item as a string
		local
			a_string: STRING
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
				if duration.year /= 0 then Result := Result + duration.year.out + "Y" end
				if duration.month /= 0 then Result := Result + duration.month.out + "M" end
				if duration.day /= 0 then Result := Result + duration.day.out + "D" end
				if duration.hour /= 0 or else duration.minute /= 0 
					or else duration.second /= 0 or else duration.millisecond /= 0 then
					Result := Result + "T"
				end
				if duration.hour /= 0 then Result := Result + duration.hour.out + "H" end
				if duration.minute /= 0 then Result := Result + duration.minute.out + "M" end
				if duration.second /= 0 or else duration.millisecond /= 0 then
					Result := Result + duration.second.out
					if duration.millisecond /= 0 then
						Result := Result + "."
						a_string := duration.millisecond.out
						from  until a_string.count = 3 loop
							a_string.insert_character ('0', 1)
						end
						Result := Result + a_string
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

	duration: DT_DATE_TIME_DURATION
			-- Duration

feature -- Comparison

	same_expression (other: XM_XPATH_EXPRESSION): BOOLEAN is
			-- Are `Current' and `other' the same expression?
		local
			a_duration: like duration
		do
			if other.is_duration_value then
				a_duration := other.as_duration_value.duration

				-- XML Schema says two xs:durations are equal iff all their components are equal

				Result := duration.year = a_duration.year
					and then duration.month = a_duration.month
					and then duration.day = a_duration.day
					and then duration.hour = a_duration.hour
					and then duration.minute = a_duration.minute
					and then duration.second = a_duration.second
					and then duration.millisecond = a_duration.millisecond
			end
		end
	
	three_way_comparison (other: XM_XPATH_ATOMIC_VALUE; a_context: XM_XPATH_CONTEXT): INTEGER is
			-- Comparison of `Current' to `other'
		local
			a_duration: like duration
		do
			a_duration := other.as_duration_value.duration
			if duration < a_duration then
				Result := -1
			elseif duration > a_duration then
				Result := 1
			end
		end

feature -- Status report

	is_normal: BOOLEAN
			-- Is `duration' in normal form?

	is_negative: BOOLEAN is
			-- Is `Current' a negative duration?
		do
			Result := duration.year < 0 or else duration.month < 0
				or else duration.day < 0 or else duration.hour < 0
				or else duration.minute < 0 or else duration.second < 0
				or else duration.millisecond < 0
		end

	is_duration (a_duration: STRING): BOOLEAN is
			-- Is `a_duration' a valid duration?
		require
			lexical_duration_exists: a_duration /= Void
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
			Result := other.is_duration_value
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
			a_string: STRING
		do
			a_string := STRING_.appended_string (indentation (a_level), "duration (")
			a_string := STRING_.appended_string (a_string, string_value)
			a_string := STRING_.appended_string (a_string, ")")
			std.error.put_string (a_string)
			std.error.put_new_line
		end

feature -- Conversions

	as_duration_value: XM_XPATH_DURATION_VALUE is
			-- `Current' seen as an xs:duration value
		do
			Result := Current
		end

	convert_to_type (a_required_type: XM_XPATH_ITEM_TYPE): XM_XPATH_ATOMIC_VALUE is
			-- Convert `Current' to `a_required_type'
		local
			a_duration: like duration
		do
			if	a_required_type = any_item or else a_required_type = type_factory.any_atomic_type
				or else a_required_type = type_factory.duration_type then
				Result := Current
			elseif a_required_type = type_factory.string_type then
				create {XM_XPATH_STRING_VALUE} Result.make (string_value)
			elseif a_required_type = type_factory.untyped_atomic_type then
				create {XM_XPATH_UNTYPED_ATOMIC_VALUE} Result.make (string_value)
			elseif a_required_type = type_factory.year_month_duration_type then
				create a_duration.make (duration.year, duration.month, 0, 0, 0, 0)
				create {XM_XPATH_MONTHS_DURATION_VALUE} Result.make_from_duration (a_duration)
			elseif a_required_type = type_factory.day_time_duration_type then
				create a_duration.make_precise (0, 0, duration.day, duration.hour, duration.minute, duration.second, duration.millisecond)
				create {XM_XPATH_SECONDS_DURATION_VALUE} Result.make_from_duration (a_duration)
			end
		end

feature {NONE} -- Implementation

	normalized_duration: like Current is
			-- Normal form of `duration'
		local
			a_year, a_month, a_day, an_hour: INTEGER
			a_minute, a_second, a_millisecond: INTEGER
			total_months, total_hours, total_minutes: INTEGER
			a_duration: like duration
		do
			total_months := duration.year * 12 + duration.month
			a_year := total_months // 12
			a_month := total_months \\ 12
			a_second := duration.second_count \\ 60
			a_millisecond := duration.millisecond_count \\ 1000
			total_minutes := duration.second_count // 60
			a_minute := total_minutes \\ 60
			total_hours := total_minutes // 60
			an_hour := total_hours \\ 24
			a_day :=  total_hours // 24
			if is_negative then
				create a_duration.make_precise (-a_year, -a_month, -a_day, -an_hour, -a_minute, -a_second, -a_millisecond)
			else
				create a_duration.make_precise (a_year, a_month, a_day, an_hour, a_minute, a_second, a_millisecond)
			end
			create Result.make_from_duration (a_duration)
		ensure
			normal_duration_of_same_sign: Result /= Void and then Result.is_normal and then Result.is_negative = is_negative
		end

invariant

	duration_exists: duration /= Void

end
