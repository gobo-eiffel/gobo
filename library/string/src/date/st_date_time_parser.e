note

	description:

		"Objects that parse dates and times"

	library: "Gobo Eiffel String Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ST_DATE_TIME_PARSER

inherit

	DT_GREGORIAN_CALENDAR

feature -- Access

	is_date (a_formatted_date: STRING): BOOLEAN
			-- Is `a_formatted_date' a valid date?
		require
			formatted_date_not_void: a_formatted_date /= Void
		deferred
		ensure
			zoneless: Result implies not is_zoned_date (a_formatted_date)
		end

	is_zoned_date (a_formatted_date: STRING): BOOLEAN
			-- Is `a_formatted_date' a valid zoned date?
		require
			formatted_date_not_void: a_formatted_date /= Void
		deferred
		end

	is_date_time (a_formatted_date_time: STRING): BOOLEAN
			-- Is `a_formatted_date_time' a valid date-time?
		require
			formatted_date_time_not_void: a_formatted_date_time /= Void
		deferred
		ensure
			zoneless: Result implies not is_zoned_date_time (a_formatted_date_time)
		end

	is_zoned_date_time (a_formatted_date_time: STRING): BOOLEAN
			-- Is `a_formatted_date_time' a valid zoned date-time?
		require
			formatted_date_time_not_void: a_formatted_date_time /= Void
		deferred
		end

	is_time (a_formatted_time: STRING): BOOLEAN
			-- Is `a_formatted_time' a valid time?
		require
			formatted_time_not_void: a_formatted_time /= Void
		deferred
		ensure
			zoneless: Result implies not is_zoned_time (a_formatted_time)
		end

	is_zoned_time (a_formatted_time: STRING): BOOLEAN
			-- Is `a_formatted_time' a valid zoned time?
		require
			formatted_time_not_void: a_formatted_time /= Void
		deferred
		end

feature -- Conversion

	string_to_date (a_formatted_date: STRING): DT_DATE
			-- Parsed date from `a_formatted_date'
		require
			formatted_date_not_void: a_formatted_date /= Void
			valid_date_string: is_date (a_formatted_date)
			date_string_not_altered_since_call_to_is_date: True
		deferred
		ensure
			date_not_void: Result /= Void
		end

	string_to_zoned_date (a_formatted_date: STRING): DT_FIXED_OFFSET_ZONED_DATE
			-- Parsed date from `a_formatted_date'
		require
			formatted_date_not_void: a_formatted_date /= Void
			valid_zoned_date_string: is_zoned_date (a_formatted_date)
			date_string_not_altered_since_call_to_is_zoned_date: True
		deferred
		ensure
			zoned_date_not_void: Result /= Void
		end

	string_to_date_time (a_formatted_date_time: STRING): DT_DATE_TIME
			-- Parsed date-time from `a_formatted_date_time'
		require
			formatted_date_time_not_void: a_formatted_date_time /= Void
			valid_date_time_string: is_date_time (a_formatted_date_time)
			date_string_not_altered_since_call_to_is_date_time: True
		deferred
		ensure
			date_time_not_void: Result /= Void
		end

	string_to_zoned_date_time (a_formatted_date_time: STRING): DT_ZONED_DATE_TIME
			-- Parsed date-time from `a_formatted_date_time'
		require
			formatted_date_time_not_void: a_formatted_date_time /= Void
			valid_zoned_date_time_string: is_zoned_date_time (a_formatted_date_time)
			date_string_not_altered_since_call_to_is_zoned_date_time: True
		deferred
		ensure
			zoned_date_time_not_void: Result /= Void
		end

	string_to_time (a_formatted_time: STRING): DT_TIME
			-- Parsed time from `a_formatted_time'
		require
			formatted_time_not_void: a_formatted_time /= Void
			valid_time_string: is_time (a_formatted_time)
			date_string_not_altered_since_call_to_is_time: True
		deferred
		ensure
			time_not_void: Result /= Void
		end

	string_to_zoned_time (a_formatted_time: STRING): DT_FIXED_OFFSET_ZONED_TIME
			-- Parsed time from `a_formatted_time'
		require
			formatted_time_not_void: a_formatted_time /= Void
			valid_time_string: is_zoned_time (a_formatted_time)
			date_string_not_altered_since_call_to_is_zoned_time: True
		deferred
		ensure
			zoned_time_not_void: Result /= Void
		end

end
