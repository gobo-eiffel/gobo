note

	description:

		"Objects that support number formatting."

	library: "Gobo Eiffel String Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ST_XSLT_NUMBERER

inherit

	ST_XSLT_NUMBER_ROUTINES

feature -- Access

	formatted_string (a_number: MA_DECIMAL; a_picture: STRING; a_group_size: INTEGER; a_group_separator, a_letter, an_ordinal: STRING): STRING is
			-- Formated number string
		require
			number_is_positive: a_number /= Void and then a_number.is_positive
			picture_not_void: a_picture /= Void
			group_size_positive: a_group_size >= 0
			group_separator_one_character: a_group_separator /= Void and then a_group_separator.count = 1 or else a_group_separator.count = 0
			letter_not_void: a_letter /= Void
			ordinal_not_void: an_ordinal /= Void
		deferred
		ensure
			formatted_string_not_void: Result /= Void
		end

	month_name (a_month, a_minimum_width, a_maximum_width: INTEGER): STRING is
			-- Month name or abbreviation
		require
				-- January = 1
			valid_month: a_month >= 1 and then a_month <= 12
		deferred
		ensure
			valid_month_name: Result /= Void
--			is_capitalized: First letter upper-case, others in lower-case
		end

	day_name (a_day, a_minimum_width, a_maximum_width: INTEGER): STRING is
			-- Name of day of week
		require
				-- Monday = 1
			valid_iso_day: a_day >= 1 and then a_day <= 7
		deferred
		ensure
			valid_day_name: Result /= Void
--			is_capitalized: First letter upper-case, others in lower-case
		end

	half_day_name (a_minute, a_minimum_width, a_maximum_width: INTEGER): STRING is
			-- A.M./P.M indicator
		require
			valid_minutes: a_minute >= 0 and then a_minute < 1440
		deferred
		ensure
			valid_half_day_name: Result /= Void
--			is_capitalized: First letter upper-case, others in lower-case
		end

end
