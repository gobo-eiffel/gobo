indexing

	description:

		"Validation routines for strings according to XML unicode character classes" 
		
	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_UNICODE_STRING_ROUTINES

obsolete "Use XM_UNICODE_CHARACTERS and descendant classes"

inherit

	ANY
	
	XM_SHARED_UNICODE_CHARACTERS
		export {NONE} all end


feature -- Status

	is_xml_string (a_string: STRING): BOOLEAN is
			-- Is `a_string' a string containing no invalid XML characters?
		require
			a_string_not_void: a_string /= Void
		do
			Result := characters_1_0.is_string (a_string)
		ensure
			definition: Result = characters_1_0.is_string (a_string)
		end

	is_xml_name (a_name: STRING): BOOLEAN is
			-- Is `a_name' a valid XML name?
		require
			a_name_not_void: a_name /= Void
		do
			Result := characters_1_0.is_name (a_name)
		ensure
			definition: Result = characters_1_0.is_name (a_name)
		end

end
