indexing

	description: "Objects that support number formatting."

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XSLT_NUMBERER

feature -- Access

	formatted_string (a_number: MA_DECIMAL; a_picture: STRING; a_group_size: INTEGER;
		a_group_separator, a_letter_value, an_ordinal: STRING): STRING is
			-- Formated number string
		require
			-- TODO
		deferred
		end

	month_name (a_month, a_minimum_width, a_maximum_width: INTEGER): STRING is
			-- Month name or abbreviation
		require
			valid_month: a_month >= 1 and then a_month <= 12 -- January = 1
		deferred
		ensure
			valid_month_name: Result /= Void
		end

	day_name (a_day, a_minimum_width, a_maximum_width: INTEGER): STRING is
			-- Name of day of week
		require
			valid_day: a_day >= 1 and then a_day <= 7 -- Monday = 1
		deferred
		ensure
			valid_day_name: Result /= Void
		end
		

	half_day_name (a_minute, a_minimum_width, a_maximum_width: INTEGER): STRING is
			-- A.M./P.M indicator
		require
			valid_minutes: a_minute >= 0 and then a_minute < 1440
		deferred
		ensure
			valid_half_day_name: Result /= Void			
		end
		
end

