indexing

	description:

		"Date-time values consistent with XPath 2.0"

	library: "Gobo Eiffel String Library"
	copyright: "Copyright (c) 2007, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ST_XPATH_DATE_TIME_VALUE

inherit

	ST_XPATH_CALENDAR_VALUE
		redefine
			is_xpath_date_time, as_xpath_date_time
		end

create

	make, make_from_date_time, make_from_zoned_date_time, make_from_date, make_from_zoned_date

feature {NONE} -- Initialization

	make (a_lexical_date_time: STRING) is
			-- Create from lexical xs:dateTime.
		require
			lexical_date_time: a_lexical_date_time /= Void and then is_date_time (a_lexical_date_time)
		local
			l_date_time_parser: ST_XSD_DATE_TIME_PARSER
		do
			create l_date_time_parser.make_1_1
			if l_date_time_parser.is_zoned_date_time (a_lexical_date_time) then
				zoned := True
				zoned_date_time := l_date_time_parser.string_to_zoned_date_time (a_lexical_date_time)
			else
				local_date_time := l_date_time_parser.string_to_date_time (a_lexical_date_time)
			end
		end

	make_from_date_time (a_date_time: DT_DATE_TIME) is
			-- Create from date_time object.
		require
			date_time_not_void: a_date_time /= Void
		do
			local_date_time := a_date_time.twin
		end

	make_from_zoned_date_time (a_date_time: DT_FIXED_OFFSET_ZONED_DATE_TIME) is
			-- Create from date_time object.
		require
			date_time_not_void: a_date_time /= Void
		do
			zoned_date_time := a_date_time.twin
			zoned := True
		end

	make_from_date (a_date: DT_DATE) is
			-- Create from date object.
		require
			date_not_void: a_date /= Void
		do
			create local_date_time.make_from_date (a_date)
		end

	make_from_zoned_date (a_date: DT_FIXED_OFFSET_ZONED_DATE) is
			-- Create from zoned date object.
		require
			date_not_void: a_date /= Void
		do
			create zoned_date_time.make_from_zoned_date (a_date)
			zoned := True
		end

feature -- Access

	zoned_date_time: DT_FIXED_OFFSET_ZONED_DATE_TIME
			-- Zoned date_time value

	local_date_time: DT_DATE_TIME
			-- Date_Time value without zone

	date: DT_DATE is
			-- Date component, ignoring time zone
		do
			if zoned then
				Result := zoned_date_time.zoned_date.date
			else
				Result := local_date_time.date
			end
		ensure
			result_not_void: Result /= Void
		end

	time: DT_TIME is
			-- Time component, ignoring time zone
		do
			if zoned then
				Result := zoned_date_time.zoned_time.time
			else
				Result := local_date_time.time
			end
		ensure
			result_not_void: Result /= Void
		end

feature -- Status report

	is_xpath_date_time: BOOLEAN is
			-- Does `Current' have both a time component and a date component?
		do
			Result := True
		end

	is_date_time (a_lexical_date_time: STRING): BOOLEAN is
			-- Is `a_lexical_date_time' a valid xs:dateTime?
		require
			lexical_date_time_not_void: a_lexical_date_time /= Void
		local
			l_date_time_parser: ST_XSD_DATE_TIME_PARSER
		do
			create l_date_time_parser.make_1_1
			Result := l_date_time_parser.is_zoned_date_time (a_lexical_date_time) or l_date_time_parser.is_date_time (a_lexical_date_time)
		end

feature -- Conversion

	as_xpath_date_time: ST_XPATH_DATE_TIME_VALUE is
			-- `Current' seen as a date-time value
		do
			Result := Current
		end
		
end
