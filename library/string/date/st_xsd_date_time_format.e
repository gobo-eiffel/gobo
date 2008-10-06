indexing

	description:

		"Objects that format XML Schema dates and times"

	library: "Gobo Eiffel String Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ST_XSD_DATE_TIME_FORMAT

inherit

	ST_DATE_TIME_FORMAT

	ST_XSD_DATE_TIME_PARSER

	KL_IMPORTED_INTEGER_ROUTINES

create

	make_1_0,
	make_1_1

feature -- Conversion

	date_to_string (a_date: DT_DATE): STRING is
			-- Formatted date
		do
			Result := year_string (a_date)
			Result.append_character ('-')
			Result.append_string (month_string (a_date))
			Result.append_character ('-')
			Result.append_string (day_string (a_date))
		end

	zoned_date_to_string (a_date: DT_FIXED_OFFSET_ZONED_DATE): STRING is
			-- Formatted date with time zone
		do
			Result := date_to_string (a_date.date)
			Result := Result + zone (a_date.time_zone)
		end

	date_time_to_string (a_date_time: DT_DATE_TIME): STRING is
			-- Formatted date-time
		do
			Result := date_to_string (a_date_time.date) + "T" + time_to_string (a_date_time.time)
		end

	zoned_date_time_to_string (a_date_time: DT_FIXED_OFFSET_ZONED_DATE_TIME): STRING is
			-- Formatted date-time with time zone
		do
			Result := date_time_to_string (a_date_time.date_time) + zone (a_date_time.time_zone)
		end

	time_to_string (a_time: DT_TIME): STRING is
			-- Formatted time
		local
			l_millisecond: STRING
		do
			Result := time_part_to_string (a_time.hour)
			Result.append_character (':')
			Result := Result + time_part_to_string (a_time.minute)
			Result.append_character (':')
			Result := Result + time_part_to_string (a_time.second)
			if a_time.millisecond > 0 then
				Result.append_character ('.')
				l_millisecond := a_time.millisecond.out
				from
				until
					l_millisecond.count = 3
				loop
					l_millisecond.insert_character ('0', 1)
				end
				from
				until
					l_millisecond.item (l_millisecond.count) /= '0'
				loop
					l_millisecond.remove_tail (1)
				end
				Result.append_string (l_millisecond)
			end
		end

	zoned_time_to_string (a_time: DT_FIXED_OFFSET_ZONED_TIME): STRING is
			-- Formatted time with time zone
		do
			Result := time_to_string (a_time.time)
			Result := Result + zone (a_time.time_zone)
		end

	year_month_to_string (a_date: DT_DATE): STRING is
			-- Date formatted as gYearMonth 
		require
			a_date_not_void: a_date /= Void
		do
			Result := year_string (a_date)
			Result.append_character ('-')
			Result.append_string (month_string (a_date))
		ensure
			date_string_not_void: Result /= Void
			valid_date_string: is_year_month (Result)
		end

	zoned_year_month_to_string (a_date: DT_FIXED_OFFSET_ZONED_DATE): STRING is
			-- Date formatted as gYearMonth with time zone
		require
			a_date_not_void: a_date /= Void
		do
			Result := year_month_to_string (a_date.date)
			Result := Result + zone (a_date.time_zone)
		ensure
			zoned_date_string_not_void: Result /= Void
			valid_date_string: is_zoned_year_month (Result)
		end

	year_to_string (a_date: DT_DATE): STRING is
			-- Date formatted as gYear
		require
			a_date_not_void: a_date /= Void
		do
			Result := year_string (a_date)
		ensure
			date_string_not_void: Result /= Void
			valid_date_string: is_year (Result)
		end

	zoned_year_to_string (a_date: DT_FIXED_OFFSET_ZONED_DATE): STRING is
			-- Date formatted as gYear with time zone
		require
			a_date_not_void: a_date /= Void
		do
			Result := year_to_string (a_date.date)
			Result := Result + zone (a_date.time_zone)
		ensure
			zoned_date_string_not_void: Result /= Void
			valid_date_string: is_zoned_year (Result)
		end

	month_day_to_string (a_date: DT_DATE): STRING is
			-- Date formatted as gMonthDay
		require
			a_date_not_void: a_date /= Void
		do
			Result := STRING_.concat ("--", month_string (a_date))
			Result.append_character ('-')
			Result.append_string (day_string (a_date))
		ensure
			date_string_not_void: Result /= Void
			valid_date_string: is_month_day (Result)
		end

	zoned_month_day_to_string (a_date: DT_FIXED_OFFSET_ZONED_DATE): STRING is
			-- Date formatted as gMonthDay with time zone
		require
			a_date_not_void: a_date /= Void
		do
			Result := month_day_to_string (a_date.date)
			Result := Result + zone (a_date.time_zone)
		ensure
			zoned_date_string_not_void: Result /= Void
			valid_date_string: is_zoned_month_day (Result)
		end

	day_to_string (a_date: DT_DATE): STRING is
			-- Date formatted as gDay
		require
			a_date_not_void: a_date /= Void
		do
			Result := STRING_.concat ("---", day_string (a_date))
		ensure
			date_string_not_void: Result /= Void
			valid_date_string: is_day (Result)
		end

	zoned_day_to_string (a_date: DT_FIXED_OFFSET_ZONED_DATE): STRING is
			-- Date formatted as gDay with time zone
		require
			a_date_not_void: a_date /= Void
		do
			Result := day_to_string (a_date.date)
			Result := Result + zone (a_date.time_zone)
		ensure
			zoned_date_string_not_void: Result /= Void
			valid_date_string: is_zoned_day (Result)
		end

	month_to_string (a_date: DT_DATE): STRING is
			-- Date formatted as gMonth
		require
			a_date_not_void: a_date /= Void
		do
			Result := STRING_.concat ("--", month_string (a_date))
		ensure
			date_string_not_void: Result /= Void
			valid_date_string: is_month (Result)
		end

	zoned_month_to_string (a_date: DT_FIXED_OFFSET_ZONED_DATE): STRING is
			-- Date formatted as gMonth with time zone
		require
			a_date_not_void: a_date /= Void
		do
			Result := month_to_string (a_date.date)
			Result := Result + zone (a_date.time_zone)
		ensure
			zoned_date_string_not_void: Result /= Void
			valid_date_string: is_zoned_month (Result)
		end

feature {NONE} -- Implementation

	year_string (a_date: DT_DATE): STRING is
			-- New string describing year
		require
			a_date_not_void: a_date /= Void
		local
			yy: INTEGER
		do
			Result := ""
			if a_date.year <= 0 then
				if is_year_zero_valid then
					yy := 0 - a_date.year
				else
					yy := 1 - a_date.year
				end
				INTEGER_.append_decimal_integer (yy, Result)
				from
				until
					Result.count >= 4
				loop
					Result.insert_character ('0', 1)
				end
				Result.insert_character ('-', 1)
			else
				INTEGER_.append_decimal_integer (a_date.year, Result)
				from
				until
					Result.count >= 4
				loop
					Result.insert_character ('0', 1)
				end
			end
		ensure
			year_string_not_void: Result /= Void
			at_least_four_characters: Result.count >= 4
		end

	month_string (a_date: DT_DATE): STRING is
			-- New string describing month
		require
			a_date_not_void: a_date /= Void
		do
			Result := ""
			INTEGER_.append_decimal_integer (a_date.month, Result)
			from
			until
				Result.count = 2
			loop
				Result.insert_character ('0', 1)
			end
		ensure
			month_string_not_void: Result /= Void
			two_characters: Result.count = 2
		end

	day_string (a_date: DT_DATE): STRING is
			-- New string describing day
		require
			a_date_not_void: a_date /= Void
		do
			Result := ""
			INTEGER_.append_decimal_integer (a_date.day, Result)
			from
			until
				Result.count = 2
			loop
				Result.insert_character ('0', 1)
			end
		ensure
			day_string_not_void: Result /= Void
			two_characters: Result.count = 2
		end

	time_part_to_string (a_time_part: INTEGER): STRING is
			-- New string formatting `a_time_part'
		require
			a_time_part_non_negative: a_time_part >= 0
		do
			Result := ""
			INTEGER_.append_decimal_integer (a_time_part, Result)
			from
			until
				Result.count = 2
			loop
				Result.insert_character ('0', 1)
			end
		ensure
			time_part_to_string_not_void: Result /= Void
			two_characters: Result.count = 2
		end

	zone (a_time_zone: DT_FIXED_OFFSET_TIME_ZONE): STRING is
			-- New string describing time zone
		require
			a_time_zone_not_void: a_time_zone /= Void
		local
			an_offset: DT_TIME_DURATION
		do
			an_offset := a_time_zone.fixed_offset
			if an_offset.is_equal (utc_offset) then
				Result := "Z"
			else
				if an_offset.hour < 0 then
					Result := "-"
				else
					Result := "+"
				end
				Result := Result + time_part_to_string (an_offset.hour.abs) + ":" + time_part_to_string (an_offset.minute.abs)
			end
		ensure
			zone_not_void: Result /= Void
			zone_not_empty: not Result.is_empty
		end

	utc_offset: DT_TIME_DURATION is
			-- Offset for UTC
		once
			create Result.make_canonical (0)
		ensure
			utc_offset_not_void: Result /= Void
			offset_is_zero: Result.hour = 0 and then Result.minute = 0 and then Result.second = 0 and then Result.millisecond = 0
		end

end
