indexing

	description:

		"Objects that format dates and times"

	library: "Gobo Eiffel String Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date: 2007-01-26 18:55:25 +0000 (Fri, 26 Jan 2007) $"
	revision: "$Revision: 5877 $"

deferred class ST_DATE_TIME_FORMAT

inherit

	ST_DATE_TIME_PARSER

feature -- Conversion

	date_to_string (a_date: DT_DATE): STRING is
			-- Formatted date
		require
			date_not_void: a_date /= Void
		deferred
		ensure
			date_string_not_void: Result /= Void
			valid_date_string: is_date (Result)
		end

	zoned_date_to_string (a_date: DT_FIXED_OFFSET_ZONED_DATE): STRING is
			-- Formatted date with time zone
		require
			zoned_date_not_void: a_date /= Void
		deferred
		ensure
			zoned_date_string_not_void: Result /= Void
			valid_zoned_date_string: is_zoned_date (Result)
		end

	date_time_to_string (a_date_time: DT_DATE_TIME): STRING is
			-- Formatted date-time
		require
			date_time_not_void: a_date_time /= Void
		deferred
		ensure
			date_time_string_not_void: Result /= Void
			valid_date_time_string: is_date_time (Result)
		end

	zoned_date_time_to_string (a_date_time: DT_ZONED_DATE_TIME): STRING is
			-- Formatted date-time with time zone
		require
			zoned_date_time_not_void: a_date_time /= Void
		deferred
		ensure
			zoned_date_time_string_not_void: Result /= Void
			valid_zoned_date_time_string: is_zoned_date_time (Result)
		end

	time_to_string (a_time: DT_TIME): STRING is
			-- Formatted time
		require
			time_not_void: a_time /= Void
		deferred
		ensure
			time_string_not_void: Result /= Void
			valid_time_string: is_time (Result)
		end

	zoned_time_to_string (a_time: DT_FIXED_OFFSET_ZONED_TIME): STRING is
			-- Formatted time with time zone
		require
			zoned_time_not_void: a_time /= Void
		deferred
		ensure
			zoned_time_string_not_void: Result /= Void
			valid_zoned_time_string: is_zoned_time (Result)
		end

end
