indexing

	description:

		"Objects that create EXSLT date functions"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_EXSLT_DATE_FUNCTION_FACTORY

inherit

	XM_XPATH_EXTENSION_FUNCTION_FACTORY

	KL_IMPORTED_STRING_ROUTINES

feature -- Access

	has (a_local_name: STRING; an_arity: INTEGER): BOOLEAN is
			-- Does `a_local_name' represent a known extension function?
		do
			if STRING_.same_string (a_local_name, "date-time") then
				if an_arity <= 0 then
					Result := True
				end
			elseif STRING_.same_string (a_local_name, "day-abbreviation") then
				if an_arity <= 1 then
					Result := True
				end
			end
		end

	function (a_local_name: STRING; an_arity: INTEGER): XM_XPATH_FUNCTION_CALL is
			-- Function named `a_local_name' with `an_arity' arguments ;
			-- If `an_arity' = -1, then ignore `an_arity' (any match for `a_uri', `a_local_name' will do)
		do
			if STRING_.same_string (a_local_name, "date-time") then
				if an_arity <= 0 then
					create {XM_XPATH_EXSLT_DATE_DATE_TIME} Result.make
				end
			elseif STRING_.same_string (a_local_name, "day-abbreviation") then
				if an_arity <= 1 then
					create {XM_XPATH_EXSLT_DATE_DAY_ABBREVIATION} Result.make
				end
			end
		end

end
