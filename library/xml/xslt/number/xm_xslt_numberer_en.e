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

	MA_DECIMAL_MATH

	XM_XPATH_DEBUGGING_ROUTINES
	
feature -- Access

	formatted_string (a_number: MA_DECIMAL; a_picture: STRING; a_group_size: MA_DECIMAL;
		a_group_separator, a_letter, an_ordinal: STRING): STRING is
			-- Formated number string
		do
			if a_number < zero then
				Result := a_number.to_scientific_string 
			elseif a_picture.count = 0 then
				Result := a_number.to_scientific_string 
			else
				create Result.make (0)
				
				todo ("formatted_string", True)				
			end
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

