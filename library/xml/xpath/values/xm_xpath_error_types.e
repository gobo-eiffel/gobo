indexing

	description:

		"XPath error value types and codes"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_ERROR_TYPES

feature -- Access

	Static_error, Type_error, Dynamic_error: INTEGER is unique

feature -- Status report

	is_valid_error_code (an_error_code: INTEGER): BOOLEAN is
			-- Is `an_error_code' valid?
		do
			Result := an_error_code >= 0
		end
	
end
	
