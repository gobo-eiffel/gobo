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
			if STRING_.same_string (a_function_name, "current") then
				create {XM_XSLT_CURRENT} Result.make
			elseif STRING_.same_string (a_function_name, "current-group") then
				create {XM_XSLT_CURRENT_GROUP} Result.make
			elseif STRING_.same_string (a_function_name, "document") then
				create {XM_XSLT_DOCUMENT} Result.make
			elseif STRING_.same_string (a_function_name, "format-number") then
				create {XM_XSLT_FORMAT_NUMBER} Result.make
			elseif STRING_.same_string (a_function_name, "function-available") then
				create {XM_XSLT_FUNCTION_AVAILABLE} Result.make				
			elseif STRING_.same_string (a_function_name, "generate-id") then
				create {XM_XSLT_GENERATE_ID} Result.make
			elseif STRING_.same_string (a_function_name, "key") then
				create {XM_XSLT_KEY_FUNCTION} Result.make
			elseif STRING_.same_string (a_function_name, "key") then
				create {XM_XSLT_SYSTEM_PROPERTY} Result.make
			elseif STRING_.same_string (a_function_name, "system-property") then
				create {XM_XSLT_UNPARSED_ENTITY_URI} Result.make
			else
				Result := Precursor (a_function_name)
			end
		end

end
	
