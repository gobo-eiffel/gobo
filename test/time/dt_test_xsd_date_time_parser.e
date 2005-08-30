indexing

	description:

		"Test features of class DT_XSD_DATE_TIME_PARSER and DT_XSD_DATE_TIME_FORMAT"

	library: "Gobo Eiffel Time Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class DT_TEST_XSD_DATE_TIME_PARSER

inherit

	TS_TEST_CASE

	DT_GREGORIAN_CALENDAR

feature -- Test

	test_string_to_date is
			-- Test is_date and string_to_date.
		local
			d1: DT_DATE
			a_parser: DT_XSD_DATE_TIME_PARSER
		do
			create a_parser.make
			assert ("24th March 2000", a_parser.is_date ("2000-03-24"))
			d1 := a_parser.string_to_date ("2000-03-24")
			assert ("Date is 24th March 2000", d1.year = 2000 and then d1.month = March and then d1.day = 24)
			assert ("15th May 7 BCE", a_parser.is_date ("-0007-05-15"))
			d1 := a_parser.string_to_date ("-0007-05-15")
			assert ("Date is 15th May 7 BCE", d1.year = -6 and then d1.month = May and then d1.day = 15)
			assert ("31st December 21000 BCE", a_parser.is_date ("-21000-12-31"))
			d1 := a_parser.string_to_date ("-21000-12-31")
			assert ("Date is 31st December 21000 BCE", d1.year = -20999 and then d1.month = December and then d1.day = 31)
			assert ("1st January 21000 CE", a_parser.is_date ("21000-01-01"))
			d1 := a_parser.string_to_date ("21000-01-01")
			assert ("Date is 1st January 21000 CE", d1.year = 21000 and then d1.month = January and then d1.day = 1)
			assert ("29th February 2004 CE", a_parser.is_date ("2004-02-29"))
			d1 := a_parser.string_to_date ("2004-02-29")
			assert ("Date is 29th February 2004 CE", d1.year = 2004 and then d1.month = February and then d1.day = 29)
			assert ("Missing zero in month", not a_parser.is_date ("2004-2-29"))
			assert ("Leading zero in month", not a_parser.is_date ("2004-002-29"))
			assert ("Leading zero in day", not a_parser.is_date ("2004-02-029"))
			assert ("Day too high", not a_parser.is_date ("2004-02-30"))
			assert ("Leading zero in year", not a_parser.is_date ("02004-02-29"))
			assert ("Plus sign in year", not a_parser.is_date ("+2004-02-29"))
			assert ("Plus sign in month", not a_parser.is_date ("2004-+02-29"))
			assert ("Plus sign in day", not a_parser.is_date ("2004-02-+29"))
			assert ("Extra hyphen", not a_parser.is_date ("2004--02-29"))
			assert ("time zone not allowed", not a_parser.is_date ("2004-02-29Z"))
			assert ("Alphabetic month", not a_parser.is_date ("2004-a2-29"))
			assert ("space", not a_parser.is_date ("2004- 02-29"))
		end

	test_string_to_zoned_date is
			-- Test is_zoned_date and string_to_zoned_date.
		local
			d1: DT_FIXED_OFFSET_ZONED_DATE
			a_parser: DT_XSD_DATE_TIME_PARSER
			a_time_zone: DT_FIXED_OFFSET_TIME_ZONE
		do
			create a_parser.make
			assert ("24th March 2000 UTC", a_parser.is_zoned_date ("2000-03-24Z"))
			d1 := a_parser.string_to_zoned_date ("2000-03-24Z")
			assert ("Date is 24th March 2000 UTC", d1.date.year = 2000 and then d1.date.month = March and then d1.date.day = 24
					  and then STRING_.same_string (d1.time_zone.name, "Z"))
			assert ("24th March 2000 +00:00 is UTC", a_parser.is_zoned_date ("2000-03-24+00:00"))
			d1 := a_parser.string_to_zoned_date ("2000-03-24+00:00")
			assert ("Date is 24th March 2000 UTC 2", d1.date.year = 2000 and then d1.date.month = March and then d1.date.day = 24)
			a_time_zone ?= d1.time_zone
			assert ("Time zone is fixed offset", a_time_zone /= Void)
			assert ("+00:00 is UTC", a_time_zone.fixed_offset.hour = 0)
			assert ("24th March 2000 -00:00 is UTC", a_parser.is_zoned_date ("2000-03-24-00:00"))
			d1 := a_parser.string_to_zoned_date ("2000-03-24-00:00")
			assert ("Date is 24th March 2000 UTC 3", d1.date.year = 2000 and then d1.date.month = March and then d1.date.day = 24)
			a_time_zone ?= d1.time_zone
			assert ("Time zone is fixed offset 2", a_time_zone /= Void)
			assert ("-00:00 is UTC", a_time_zone.fixed_offset.hour = 0)
			assert ("24th March 2000 -01:30", a_parser.is_zoned_date ("2000-03-24-01:30"))
			d1 := a_parser.string_to_zoned_date ("2000-03-24-01:30")
			assert ("Date is 24th March - 1.5 hours", d1.date.year = 2000 and then d1.date.month = March and then d1.date.day = 24)
			a_time_zone ?= d1.time_zone
			assert ("Time zone is fixed offset 3", a_time_zone /= Void)
			assert ("-01:30", a_time_zone.fixed_offset.hour = -1 and then a_time_zone.fixed_offset.minute = -30)			
			assert ("Duplicate time zone", not a_parser.is_zoned_date ("2000-03-24+00:00Z"))
			assert ("Space before time zone", not a_parser.is_zoned_date ("2000-03-24 +00:00"))
		end

	test_string_to_time is
			-- Test is_time and string_to_time.
		local
			t1, t2: DT_TIME
			a_parser: DT_XSD_DATE_TIME_PARSER
			a_time_string, another_time_string: STRING
		do
			create a_parser.make
			a_time_string := "13:26:57.45634"
			assert ("13:26:57.45634", a_parser.is_time (a_time_string))
			t1 := a_parser.string_to_time (a_time_string)
			assert ("456 milliseconds", t1.hour = 13 and then t1.minute = 26 and then t1.second = 57 and then t1.millisecond = 456)
			a_time_string := "13:26:57.45654"
			assert ("13:26:57.45654", a_parser.is_time (a_time_string))
			t1 := a_parser.string_to_time (a_time_string)
			assert ("457 milliseconds", t1.hour = 13 and then t1.minute = 26 and then t1.second = 57 and then t1.millisecond = 457)
			a_time_string := "24:00:00"
			assert ("Non-canonical midnight", a_parser.is_time (a_time_string))
			t1 := a_parser.string_to_time (a_time_string)
			another_time_string := "00:00:00"
			assert ("Canonical midnight", a_parser.is_time (another_time_string))
			t2 := a_parser.string_to_time (another_time_string)
			assert ("Midnights are equal", t1.is_equal (t2))
			assert ("No milliseconds", not a_parser.is_time ("01:54:48."))
			assert ("No leading zero", not a_parser.is_time ("1:54:48"))
			assert ("Leading zero in minutes", not a_parser.is_time ("01:054:48"))
			assert ("Too many seconds", not a_parser.is_time ("01:54:60"))
			assert ("Too many seconds digits", not a_parser.is_time ("01:54:000"))
			assert ("Too many hours digits", not a_parser.is_time ("001:54:00"))
			assert ("Wrong separator", not a_parser.is_time ("01-54:00"))
		end

	test_string_to_zoned_time is
			-- Test is_zoned_time and string_to_zoned_time.
		local
			t1: DT_FIXED_OFFSET_ZONED_TIME
			a_parser: DT_XSD_DATE_TIME_PARSER
			a_time_zone: DT_FIXED_OFFSET_TIME_ZONE
		do
			create a_parser.make
			assert ("01:54 UTC", a_parser.is_zoned_time ("01:54:00Z"))
			t1 := a_parser.string_to_zoned_time ("01:54:00Z")
			assert ("Time is 01:54 UTC", t1.time.hour = 1 and then t1.time.minute = 54 and then t1.time.second = 0
					  and then t1.time.millisecond = 0 and then STRING_.same_string (t1.time_zone.name, "Z"))
			assert ("01:54 +00:00 is UTC", a_parser.is_zoned_time ("01:54:00.00003+00:00"))
			t1 := a_parser.string_to_zoned_time ("01:54:00.00003+00:00")
			assert ("Time is 01:54 UTC 2",t1.time.hour = 1 and then t1.time.minute = 54 and then t1.time.second = 0
					  and then t1.time.millisecond = 0 and then STRING_.same_string (t1.time_zone.name, "Z"))
			a_time_zone ?= t1.time_zone
			assert ("Time zone is fixed offset", a_time_zone /= Void)
			assert ("+00:00 is UTC", a_time_zone.fixed_offset.hour = 0)
			assert ("01:54 -00:00 is UTC", a_parser.is_zoned_time ("01:54:00.00-00:00"))
			t1 := a_parser.string_to_zoned_time ("01:54:00.00-00:00")
			assert ("Time is 01:54 UTC 3",t1.time.hour = 1 and then t1.time.minute = 54 and then t1.time.second = 0
					  and then t1.time.millisecond = 0 and then STRING_.same_string (t1.time_zone.name, "Z"))
			a_time_zone ?= t1.time_zone
			assert ("Time zone is fixed offset", a_time_zone /= Void)
			assert ("-00:00 is UTC", a_time_zone.fixed_offset.hour = 0)
		end

	test_string_to_date_time is
			-- Test is_date_time and string_to_date_time.
		local
			dt1: DT_DATE_TIME
			a_parser: DT_XSD_DATE_TIME_PARSER
			a_date_time: STRING
		do
			create a_parser.make
			a_date_time := "2002-10-10T17:00:00"
			assert ("2002-10-10T17:00:00", a_parser.is_date_time (a_date_time))
			dt1 := a_parser.string_to_date_time (a_date_time)
			assert ("Date-time is 2002-10-10T17:00:00", dt1 /= Void and then dt1.date.year = 2002
					  and then dt1.date.month = 10 and then dt1.date.day = 10
					  and then dt1.time.hour = 17 and then dt1.time.minute = 0
					  and then dt1.time.second = 0 and then dt1.time.millisecond = 0
					  )
			a_date_time := "2002-10-1017:00:00"
			assert ("Missing T separator", not a_parser.is_date_time (a_date_time))
			a_date_time := "+2002-10-1017:00:00"
			assert ("Leading plus sign", not a_parser.is_date_time (a_date_time))
			a_date_time := "2002-10-1017:00:00Z"
			assert ("Zoned", not a_parser.is_date_time (a_date_time))
		end

	test_string_to_zoned_date_time is
			-- Test is_zoned_date_time and string_to_zoned_date_time.
		local
			dt1: DT_FIXED_OFFSET_ZONED_DATE_TIME
			a_parser: DT_XSD_DATE_TIME_PARSER
			a_date_time: STRING
		do
			create a_parser.make
			a_date_time := "2002-10-10T17:00:00-05:15"
			assert ("2002-10-10T17:00:00-05:15", a_parser.is_zoned_date_time (a_date_time))
			dt1 := a_parser.string_to_zoned_date_time (a_date_time)
			assert ("Date-time is 2002-10-10T17:00:00-05:15", dt1 /= Void and then dt1.date_time.date.year = 2002
					  and then dt1.date_time.date.month = 10 and then dt1.date_time.date.day = 10
					  and then dt1.date_time.time.hour = 17 and then dt1.date_time.time.minute = 0
					  and then dt1.date_time.time.second = 0 and then dt1.date_time.time.millisecond = 0
					  and then STRING_.same_string (dt1.time_zone.name, "UTC-05:15")
					  )
			a_date_time := "2002-10-1017:00:00-05:15"
			assert ("Missing T separator", not a_parser.is_zoned_date_time (a_date_time))
			a_date_time := "+2002-10-1017:00:00Z"
			assert ("Leading plus sign", not a_parser.is_zoned_date_time (a_date_time))
			a_date_time := "-2002-10-1017:00:00"
			assert ("No zone", not a_parser.is_zoned_date_time (a_date_time))
		end

	test_date_to_string is
			-- Test date_to_string
		local
			d1: DT_DATE
			a_formatter: DT_XSD_DATE_TIME_FORMAT
		do
			create a_formatter.make
			create d1.make (2000, 3, 24)
			assert ("24th March 2000", STRING_.same_string (a_formatter.date_to_string (d1), "2000-03-24"))
			create d1.make (-6, 5, 15)
			assert ("15th May 7 BCE", STRING_.same_string (a_formatter.date_to_string (d1), "-0007-05-15"))
			create d1.make (-20999, 12, 31)
			assert ("31st December 21000 BCE", STRING_.same_string (a_formatter.date_to_string (d1), "-21000-12-31"))
			create d1.make (21000, 1, 1)
			assert ("1st January 21000 CE", STRING_.same_string (a_formatter.date_to_string (d1), "21000-01-01"))
		end

	test_zoned_date_to_string is
			-- Test date_to_string
		local
			d1: DT_DATE
			tz1: DT_FIXED_OFFSET_TIME_ZONE
			dz1: DT_FIXED_OFFSET_ZONED_DATE
			a_formatter: DT_XSD_DATE_TIME_FORMAT
		do
			create a_formatter.make
			create d1.make (2000, 3, 24); create tz1.make_named_hours_minutes ("Z", 0, 0); create dz1.make (d1, tz1)
			assert ("24th March 2000 UTC", STRING_.same_string (a_formatter.zoned_date_to_string (dz1), "2000-03-24Z"))
			create d1.make (-6, 5, 15); create tz1.make_hours_minutes (-10, -30); create dz1.make (d1, tz1)
			assert ("15th May 7 BCE -10:30", STRING_.same_string (a_formatter.zoned_date_to_string (dz1), "-0007-05-15-10:30"))
			create d1.make (-20999, 12, 31); create tz1.make_hours_minutes (8, 15); create dz1.make (d1, tz1)
			assert ("31st December 21000 BCE +8:15", STRING_.same_string (a_formatter.zoned_date_to_string (dz1), "-21000-12-31+08:15"))
			create d1.make (21000, 1, 1); create tz1.make_hours_minutes (6, 00); create dz1.make (d1, tz1)
			assert ("1st January 21000 CE +06:00", STRING_.same_string (a_formatter.zoned_date_to_string (dz1), "21000-01-01+06:00"))
		end

	test_time_to_string is
			-- Test time_to_string
		local
			t1: DT_TIME
			a_formatter: DT_XSD_DATE_TIME_FORMAT
		do
			create a_formatter.make
			create t1.make (7, 15, 34)
			assert ("07:15:34", STRING_.same_string (a_formatter.time_to_string (t1), "07:15:34"))
			create t1.make (0, 0, 0)
			assert ("Midnight", STRING_.same_string (a_formatter.time_to_string (t1), "00:00:00"))
		end

	test_zoned_time_to_string is
			-- Test time_to_string
		local
			t1: DT_TIME
			tz1: DT_FIXED_OFFSET_TIME_ZONE
			dz1: DT_FIXED_OFFSET_ZONED_TIME
			a_formatter: DT_XSD_DATE_TIME_FORMAT
		do
			create a_formatter.make
			create t1.make (7, 15, 34); create tz1.make_named_hours_minutes ("Z", 0, 0); create dz1.make (t1, tz1)
			assert ("07:15:34 UTC", STRING_.same_string (a_formatter.zoned_time_to_string (dz1), "07:15:34Z"))
			create t1.make (7, 15, 34); create tz1.make_hours_minutes (5, 30); create dz1.make (t1, tz1)
			assert ("07:15:34 +05:30", STRING_.same_string (a_formatter.zoned_time_to_string (dz1), "07:15:34+05:30"))
			create t1.make (7, 15, 34); create tz1.make_hours_minutes (-5, -30); create dz1.make (t1, tz1)
			assert ("07:15:34 -05:30", STRING_.same_string (a_formatter.zoned_time_to_string (dz1), "07:15:34-05:30"))
		end

	test_date_time_to_string is
			-- Test date_time_to_string
		local
			dt1: DT_DATE_TIME
			a_formatter: DT_XSD_DATE_TIME_FORMAT
		do
			create a_formatter.make
			create dt1.make (2000, 3, 24, 7, 15, 34)
			assert ("07:15:34 on 24th March 2000", STRING_.same_string (a_formatter.date_time_to_string (dt1), "2000-03-24T07:15:34"))
			create dt1.make (-6, 5, 15, 7, 15, 34)
			assert ("07:15:34 on 15th May 7 BCE", STRING_.same_string (a_formatter.date_time_to_string (dt1), "-0007-05-15T07:15:34"))
			create dt1.make (-20999, 12, 31, 7, 15, 34)
			assert ("07:15:34 on 31st December 21000 BCE", STRING_.same_string (a_formatter.date_time_to_string (dt1), "-21000-12-31T07:15:34"))
			create dt1.make (21000, 1, 1, 7, 15, 34)
			assert ("07:15:34 on 1st January 21000 CE", STRING_.same_string (a_formatter.date_time_to_string (dt1), "21000-01-01T07:15:34"))
		end

	test_zoned_date_time_to_string is
			-- Test date_time_to_string
		local
			dt1: DT_DATE_TIME
			tz1: DT_FIXED_OFFSET_TIME_ZONE
			dtz1: DT_FIXED_OFFSET_ZONED_DATE_TIME
			a_formatter: DT_XSD_DATE_TIME_FORMAT
		do
			create a_formatter.make
			create dt1.make (2000, 3, 24, 7, 15, 34); create tz1.make_named_hours_minutes ("Z", 0, 0); create dtz1.make (dt1, tz1)
			assert ("07:15:34 on 24th March 2000 UTC", STRING_.same_string (a_formatter.zoned_date_time_to_string (dtz1), "2000-03-24T07:15:34Z"))
			create dt1.make (-6, 5, 15, 7, 15, 34); create tz1.make_hours_minutes (5, 30); create dtz1.make (dt1, tz1)
			assert ("07:15:34 on 15th May 7 BCE +05:30", STRING_.same_string (a_formatter.zoned_date_time_to_string (dtz1), "-0007-05-15T07:15:34+05:30"))
			create dt1.make (-20999, 12, 31, 7, 15, 34); create tz1.make_hours_minutes (-5, -30); create dtz1.make (dt1, tz1)
			assert ("07:15:34  on 31st December 21000 BCE -05:30", STRING_.same_string (a_formatter.zoned_date_time_to_string (dtz1), "-21000-12-31T07:15:34-05:30"))
		end

end
			
