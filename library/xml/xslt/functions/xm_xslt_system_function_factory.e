indexing

	description:

		"Objects that create XSLT or XPath system functions"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_SYSTEM_FUNCTION_FACTORY

inherit

	XM_XPATH_SYSTEM_FUNCTION_FACTORY
		redefine
			make_system_function
		end

feature -- Creation
	
	make_system_function (a_function_name: STRING): XM_XPATH_SYSTEM_FUNCTION is
			--  Create an XM_XPATH_FUNCTION_CALL object for `a_function_name'
		do
			if STRING_.same_string (a_function_name, "key") then
				create {XM_XSLT_KEY_FUNCTION} Result.make
			else
				Result := Precursor (a_function_name)
			end
		end

end
	
