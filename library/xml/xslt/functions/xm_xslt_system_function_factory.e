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
			has, system_function
		end

feature -- Access

	has (a_function_name: STRING; an_arity: INTEGER): BOOLEAN is
			-- Does `a_function_name' represent a known system function?
			-- If `an_arity' = -1, then ignore `an_arity' (any match for `a_function_name' will do)
		do
			if STRING_.same_string (a_function_name, "current") then
				Result := an_arity = -1 or else an_arity = 0
			elseif STRING_.same_string (a_function_name, "current-group") then
				Result := an_arity = -1 or else an_arity = 0
			elseif STRING_.same_string (a_function_name, "document") then
				Result := an_arity = -1 or else an_arity = 1 or else an_arity = 2
			elseif STRING_.same_string (a_function_name, "format-number") then
				Result := an_arity = -1 or else an_arity = 2 or else an_arity = 3
			elseif STRING_.same_string (a_function_name, "function-available") then
				Result := an_arity = -1 or else an_arity = 1 or else an_arity = 2				
			elseif STRING_.same_string (a_function_name, "generate-id") then
				Result := an_arity = -1 or else an_arity = 0 or else an_arity = 1
			elseif STRING_.same_string (a_function_name, "key") then
				Result := an_arity = -1 or else an_arity = 2
			elseif STRING_.same_string (a_function_name, "system-property") then
				Result := an_arity = -1 or else an_arity = 1
			elseif STRING_.same_string (a_function_name, "unparsed-entity-uri") then
				Result := an_arity = -1 or else an_arity = 1
			else
				Result := Precursor (a_function_name, an_arity)
			end
		end
	
	system_function (a_function_name: STRING): XM_XPATH_SYSTEM_FUNCTION is
			--  XM_XPATH_FUNCTION_CALL object for `a_function_name'
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
			elseif STRING_.same_string (a_function_name, "system-property") then
				create {XM_XSLT_SYSTEM_PROPERTY} Result.make
			elseif STRING_.same_string (a_function_name, "unparsed-entity-uri") then
				create {XM_XSLT_UNPARSED_ENTITY_URI} Result.make
			else
				Result := Precursor (a_function_name)
			end
		end

end
	
