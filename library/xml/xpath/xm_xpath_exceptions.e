indexing

	description:

		"XPath Exceptions, representing dynamic errors."

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_EXCEPTIONS

inherit
	
	KL_SHARED_EXCEPTIONS

feature -- Access

	Xpath_dynamic_error_prefix: STRING is "XPath Dynamic Error: "
			-- XPath dynamic error

end
