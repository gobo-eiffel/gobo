indexing

	description:

		"Objects that parse dates and times"

	library: "Gobo Eiffel Time Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class DT_DATE_TIME_PARSER

inherit

	DT_GREGORIAN_CALENDAR
		rename
			Sunday as obsolete_sunday,
			Monday as obsolete_monday,
			Tuesday as obsolete_tuesday,
			Wednesday as obsolete_wednesday,
			Thursday as obsolete_thursday,
			Friday as obsolete_friday,
			Saturday as obsolete_saturday
		end

feature -- Access

	is_date (a_formatted_date: STRING): BOOLEAN is
			-- Is `a_formatted_date' a valid date?
		require
			formatted_date_not_void: a_formatted_date /= Void
			zoneless: not is_zoned_date (a_formatted_date)
		deferred
		end

	is_zoned_date (a_formatted_date: STRING): BOOLEAN is
			-- Is `a_formatted_date' a valid zoned date?
		require
			formatted_date_not_void: a_formatted_date /= Void
		deferred
		end

	is_date_time (a_formatted_date_time: STRING): BOOLEAN is
			-- Is `a_formatted_date_time' a valid date-time?
		require
			formatted_date_time_not_void: a_formatted_date_time /= Void
			zoneless: not is_zoned_date_time (a_formatted_date_time)
		deferred
		end

	is_zoned_date_time (a_formatted_date_time: STRING): BOOLEAN is
			-- Is `a_formatted_date_time' a valid zoned date-time?
		require
			formatted_date_time_not_void: a_formatted_date_time /= Void
		deferred
		end

	is_time (a_formatted_time: STRING): BOOLEAN is
			-- Is `a_formatted_time' a valid time?
		require
			formatted_time_not_void: a_formatted_time /= Void
			zonesless: not is_zoned_time (a_formatted_time)
		deferred
		end

	is_zoned_time (a_formatted_time: STRING): BOOLEAN is
			-- Is `a_formatted_time' a valid zoned time?
		require
			formatted_time_not_void: a_formatted_time /= Void
		deferred
		end

feature -- Conversion

	string_to_date (a_formatted_date: STRING): DT_DATE is
			-- Parsed date from `a_formatted_date'
		require
			formatted_date_not_void: a_formatted_date /= Void
			valid_date_string: is_date (a_formatted_date)
		deferred
		ensure
			date_not_void: Result /= Void
		end

	string_to_zoned_date (a_formatted_date: STRING): DT_ZONED_DATE is
			-- Parsed date from `a_formatted_date'
		require
			formatted_date_not_void: a_formatted_date /= Void
			valid_zoned_date_string: is_zoned_date (a_formatted_date)
		deferred
		ensure
			zoned_date_not_void: Result /= Void
		end

	string_to_date_time (a_formatted_date_time: STRING): DT_DATE_TIME is
			-- Parsed date-time from `a_formatted_date_time'
		require
			formatted_date_time_not_void: a_formatted_date_time /= Void
			valid_date_time_string: is_date_time (a_formatted_date_time)
		deferred
		ensure
			date_time_not_void: Result /= Void
		end

	string_to_zoned_date_time (a_formatted_date_time: STRING): DT_ZONED_DATE_TIME is
			-- Parsed date-time from `a_formatted_date_time'
		require
			formatted_date_time_not_void: a_formatted_date_time /= Void
			valid_zoned_date_time_string: is_zoned_date_time (a_formatted_date_time)
		deferred
		ensure
			zoned_date_time_not_void: Result /= Void
		end

	string_to_time (a_formatted_time: STRING): DT_TIME is
			-- Parsed time from `a_formatted_time'
		require
			formatted_time_not_void: a_formatted_time /= Void
			valid_time_string: is_time (a_formatted_time)
		deferred
		ensure
			time_not_void: Result /= Void
		end

	string_to_zoned_time (a_formatted_time: STRING): DT_ZONED_TIME is
			-- Parsed time from `a_formatted_time'
		require
			formatted_time_not_void: a_formatted_time /= Void
			valid_time_string: is_zoned_time (a_formatted_time)
		deferred
		ensure
			zoned_time_not_void: Result /= Void
		end

end
