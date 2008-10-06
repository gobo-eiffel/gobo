indexing

	description:
	"[
		Routines for formatting dates and times using XSLT-defined picture strings
		See See http://www.w3.org/TR/xslt20/#format-date for a detailed description of the rules.
		See ST_TEST_DATE_TIME_ROUTINES for examples of usage.
	]"

	library: "Gobo Eiffel String Library"
	copyright: "Copyright (c) 2008, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ST_DATE_TIME_ROUTINES

feature -- Access

	xslt_formatted_date (a_date: DT_DATE; a_zone: DT_FIXED_OFFSET_TIME_ZONE; a_picture, a_language, a_calendar, a_country: STRING): ST_FORMAT_DATE_TIME_RESULT is
			-- `a_date' formatted according to XSLT's format-date() function;
			-- Passing `Void' for `a_language' defaults to "en".
			-- Passing `Void' for `a_calendar' defaults to "CE".
			-- Passing `Void' for `a_country' defaults to "US".
		require
			a_date_not_void: a_date /= Void
			a_picture_not_void: a_picture /= Void
		local
			l_value: ST_XPATH_DATE_VALUE
			l_zone: DT_FIXED_OFFSET_ZONED_DATE
			l_language, l_calendar, l_country: STRING
			l_formatter: ST_XSLT_FORMAT_DATE_TIME
			l_result: DS_CELL [ST_FORMAT_DATE_TIME_RESULT]
		do
			if a_zone = Void then
				create l_value.make_from_date (a_date)
			else
				create l_zone.make (a_date, a_zone)
				create l_value.make_from_zoned_date (l_zone)
			end
			create l_formatter
			if a_language = Void then
				l_language := l_formatter.Default_language
			else
				l_language := a_language
			end
			if a_calendar = Void then
				l_calendar := l_formatter.Default_calendar
			else
				l_calendar := a_calendar
			end
			if a_country = Void then
				l_country := l_formatter.Default_country
			else
				l_country := a_country
			end
			create l_result.make (Void)
			l_formatter.format_date_time (l_result, l_value, a_picture, l_language, l_calendar, l_country)
			Result := l_result.item
		ensure
			xslt_formatted_date_not_void: Result /= Void
		end

	xslt_formatted_time (a_time: DT_TIME; a_zone: DT_FIXED_OFFSET_TIME_ZONE; a_picture, a_language, a_calendar, a_country: STRING): ST_FORMAT_DATE_TIME_RESULT is
			-- `a_time' formatted according to XSLT's format-time() function;
			-- Passing `Void' for `a_language' defaults to "en".
			-- Passing `Void' for `a_calendar' defaults to "CE".
			-- Passing `Void' for `a_country' defaults to "US".
		require
			a_picture_not_void: a_picture /= Void
			a_time_not_void: a_time /= Void
		local
			l_value: ST_XPATH_TIME_VALUE
			l_zone: DT_FIXED_OFFSET_ZONED_TIME
			l_language, l_calendar, l_country: STRING
			l_formatter: ST_XSLT_FORMAT_DATE_TIME
			l_result: DS_CELL [ST_FORMAT_DATE_TIME_RESULT]
		do
			if a_zone = Void then
				create l_value.make_from_time (a_time)
			else
				create l_zone.make (a_time, a_zone)
				create l_value.make_from_zoned_time (l_zone)
			end
			create l_formatter
			if a_language = Void then
				l_language := l_formatter.Default_language
			else
				l_language := a_language
			end
			if a_calendar = Void then
				l_calendar := l_formatter.Default_calendar
			else
				l_calendar := a_calendar
			end
			if a_country = Void then
				l_country := l_formatter.Default_country
			else
				l_country := a_country
			end
			create l_result.make (Void)
			l_formatter.format_date_time (l_result, l_value, a_picture, l_language, l_calendar, l_country)
			Result := l_result.item
		ensure
			xslt_formatted_time_not_void: Result /= Void
		end

	xslt_formatted_date_time (a_date_time: DT_DATE_TIME; a_zone: DT_FIXED_OFFSET_TIME_ZONE;
		a_picture, a_language, a_calendar, a_country: STRING): ST_FORMAT_DATE_TIME_RESULT is
			-- `a_date_time' formatted according to XSLT's format-date-time() function;
			-- Passing `Void' for `a_language' defaults to "en".
			-- Passing `Void' for `a_calendar' defaults to "CE".
			-- Passing `Void' for `a_country' defaults to "US".
		require
			a_picture_not_void: a_picture /= Void
			a_date_time_not_void: a_date_time /= Void
		local
			l_value: ST_XPATH_DATE_TIME_VALUE
			l_zone: DT_FIXED_OFFSET_ZONED_DATE_TIME
			l_language, l_calendar, l_country: STRING
			l_formatter: ST_XSLT_FORMAT_DATE_TIME
			l_result: DS_CELL [ST_FORMAT_DATE_TIME_RESULT]
		do
			if a_zone = Void then
				create l_value.make_from_date_time (a_date_time)
			else
				create l_zone.make (a_date_time, a_zone)
				create l_value.make_from_zoned_date_time (l_zone)
			end
			create l_formatter
			if a_language = Void then
				l_language := l_formatter.Default_language
			else
				l_language := a_language
			end
			if a_calendar = Void then
				l_calendar := l_formatter.Default_calendar
			else
				l_calendar := a_calendar
			end
			if a_country = Void then
				l_country := l_formatter.Default_country
			else
				l_country := a_country
			end
			create l_result.make (Void)
			l_formatter.format_date_time (l_result, l_value, a_picture, l_language, l_calendar, l_country)
			Result := l_result.item
		ensure
			xslt_formatted_date_time_not_void: Result /= Void
		end

end
	
