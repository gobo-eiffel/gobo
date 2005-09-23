indexing

	description:

		"Objects that format XML Schema dates and times"

	library: "Gobo Eiffel Time Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class DT_XSD_DATE_TIME_FORMAT

inherit

	DT_DATE_TIME_FORMAT

	DT_XSD_DATE_TIME_PARSER

	KL_IMPORTED_INTEGER_ROUTINES

create

	make

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
		do
			Result := time_part_to_string (a_time.hour)
			Result.append_character (':')
			Result := Result + time_part_to_string (a_time.minute)
			Result.append_character (':')
			Result := Result + time_part_to_string (a_time.second)
			if a_time.millisecond > 0 then
				Result.append_character ('.')
				INTEGER_.append_decimal_integer (a_time.millisecond, Result)
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
			date_not_void: a_date /= Void
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
			zoned_date_not_void: a_date /= Void
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
			date_not_void: a_date /= Void
		do
			Result := year_string (a_date)
		ensure
			date_string_not_void: Result /= Void
			valid_date_string: is_year (Result)
		end
	
	zoned_year_to_string (a_date: DT_FIXED_OFFSET_ZONED_DATE): STRING is
			-- Date formatted as gYear with time zone
		require
			zoned_date_not_void: a_date /= Void
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
			date_not_void: a_date /= Void
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
			zoned_date_not_void: a_date /= Void
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
			date_not_void: a_date /= Void
		do
			Result := STRING_.concat ("---", day_string (a_date))
		ensure
			date_string_not_void: Result /= Void
			valid_date_string: is_day (Result)
		end
	
	zoned_day_to_string (a_date: DT_FIXED_OFFSET_ZONED_DATE): STRING is
			-- Date formatted as gDay with time zone
		require
			zoned_date_not_void: a_date /= Void
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
			date_not_void: a_date /= Void
		do
			Result := STRING_.concat ("--", month_string (a_date))
		ensure
			date_string_not_void: Result /= Void
			valid_date_string: is_month (Result)
		end
	
	zoned_month_to_string (a_date: DT_FIXED_OFFSET_ZONED_DATE): STRING is
			-- Date formatted as gMonth with time zone
		require
			zoned_date_not_void: a_date /= Void
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
			date_exists: a_date /= Void
		local
			yy: INTEGER
		do
			Result := ""
			if a_date.year <= 0 then
				yy := 1 - a_date.year
				INTEGER_.append_decimal_integer (yy, Result)
				from  until  Result.count >= 4 loop
					Result.insert_character ('0', 1)
				end
				Result.insert_character ('-', 1)
			else
				INTEGER_.append_decimal_integer (a_date.year, Result)
				from  until  Result.count >= 4 loop
					Result.insert_character ('0', 1)
				end
			end
		ensure
			at_least_four_characters: Result /= Void and then Result.count >= 4
		end

	month_string (a_date: DT_DATE): STRING is
			-- New string describing month
		require
			date_exists: a_date /= Void
		do
			Result := ""
			INTEGER_.append_decimal_integer (a_date.month, Result)
			from until  Result.count = 2 loop
				Result.insert_character ('0', 1)
			end
		ensure
			two_characters: Result /= Void and then Result.count = 2
		end

	day_string (a_date: DT_DATE): STRING is
			-- New string describing day
		require
			date_exists: a_date /= Void
		do
			Result := ""
			INTEGER_.append_decimal_integer (a_date.day, Result)
			from until  Result.count = 2 loop
				Result.insert_character ('0', 1)
			end
		ensure
			two_characters: Result /= Void and then Result.count = 2
		end

	time_part_to_string (a_time_part: INTEGER): STRING is
			-- New string formatting `a_time_part'
		require
			positive_time_part: a_time_part >= 0
		do
			Result := ""
			INTEGER_.append_decimal_integer (a_time_part, Result)
			from until  Result.count = 2 loop
				Result.insert_character ('0', 1)
			end
		ensure
			two_characters: Result /= Void and then Result.count = 2
		end

	zone (a_time_zone: DT_FIXED_OFFSET_TIME_ZONE): STRING is
			-- New string describing time zone
		require
			time_zone_exists: a_time_zone /= Void
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
				Result := Result + time_part_to_string (an_offset.hour.abs)
					+ ":" + time_part_to_string (an_offset.minute.abs)
			end
		ensure
			result_not_empty: Result /= Void and then not Result.is_empty
		end

	utc_offset: DT_TIME_DURATION is
			-- Offset for UTC
		once
			create Result.make_canonical (0)
		ensure
			offset_is_zero: Result /= Void and then Result.hour = 0
				and then Result.minute = 0 and then Result.second = 0
				and then Result.millisecond = 0
		end

end
