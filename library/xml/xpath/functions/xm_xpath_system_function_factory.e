indexing

	description:

		"Objects that create XPath system functions"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_SYSTEM_FUNCTION_FACTORY

inherit

	XM_UNICODE_CHARACTERS_1_1

	KL_IMPORTED_STRING_ROUTINES

feature -- Creation
	
	make_system_function (a_function_name: STRING): XM_XPATH_SYSTEM_FUNCTION is
			--  Create an XM_XPATH_FUNCTION_CALL object for `a_function_name
		require
			valid_function_name: a_function_name /= Void and then is_ncname (a_function_name)
		do
			if STRING_.same_string (a_function_name, "last") then
				create {XM_XPATH_LAST} Result.make
			elseif STRING_.same_string (a_function_name, "position") then
				create {XM_XPATH_POSITION} Result.make
			elseif STRING_.same_string (a_function_name, "normalize-space") then
				create {XM_XPATH_POSITION} Result.make
			end
		ensure
			Void_or_correct_function: Result /= Void implies STRING_.same_string (Result.name, a_function_name)
		end

end
	
