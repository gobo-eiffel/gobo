indexing

	description:

		"Objects that parse dates and times"

	library: "Gobo Eiffel Time Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class DT_DATE_TIME_PARSER

feature -- Access

	is_valid_date (a_formatted_date: STRING): BOOLEAN is
			-- Is `a_formatted_date' a valid date?
		deferred
		end

	is_valid_date_time (a_formatted_date_time: STRING): BOOLEAN is
			-- Is `a_formatted_date_time' a valid date-time?
		deferred
		end

	is_valid_time (a_formatted_time: STRING): BOOLEAN is
			-- Is `a_formatted_time' a valid time?
		deferred
		end

feature -- Conversion

	string_to_date (a_formatted_date: STRING): DT_DATE is
			-- Parsed date from `a_formatted_date'
		require
			valid_date_string: is_valid_date (a_formatted_date)
		deferred
		ensure
			date_not_void: Result /= Void
		end

	string_to_date_time (a_formatted_date_time: STRING): DT_DATE_TIME is
			-- Parsed date-time from `a_formatted_date_time'
		require
			valid_date_time_string: is_valid_date_time (a_formatted_date_time)
		deferred
		ensure
			date_time_not_void: Result /= Void
		end

	string_to_time (a_formatted_time: STRING): DT_TIME is
			-- Parsed time from `a_formatted_time'
		require
			valid_time_string: is_valid_time (a_formatted_time)
		deferred
		ensure
			time_not_void: Result /= Void
		end

end

