indexing

	description: "Objects that support number formatting for language en."

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_NUMBERER_EN

inherit

	XM_XSLT_NUMBERER

	XM_XPATH_DEBUGGING_ROUTINES
	
feature -- Access

	formatted_string (a_number: MA_DECIMAL; a_picture: STRING; a_group_size: INTEGER;
		a_group_separator, a_letter_value, an_ordinal: STRING): STRING is
			-- Formated number string
		do
			todo ("formatted_string", False)
		end

	month_name (a_month, a_minimum_width, a_maximum_width: INTEGER): STRING is
			-- Month name or abbreviation
		do
			todo ("month_name", False)
		end

	day_name (a_day, a_minimum_width, a_maximum_width: INTEGER): STRING is
			-- Name of day of week
		do
			todo ("day_name", False)
		end
		

	half_day_name (a_minute, a_minimum_width, a_maximum_width: INTEGER): STRING is
			-- A.M./P.M indicator
		do
			todo ("half_day_name", False)
		end
		
end

