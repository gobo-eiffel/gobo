note

	description:
	
		"XML unicode character classes, shared instances"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
	
class XM_SHARED_UNICODE_CHARACTERS

inherit

	ANY
	
	XM_MARKUP_CONSTANTS
		export {NONE} all end
		
	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

feature -- Access

	is_known_version (a_version: STRING): BOOLEAN is
			-- Is this an XML version string for which the 
			-- character classes are known?
		do
			Result := STRING_.same_string (a_version, Xml_version_1_0) or STRING_.same_string (a_version, Xml_version_1_1)
		ensure
			known_1_0: STRING_.same_string (a_version, Xml_version_1_0) implies Result
			known_1_1: STRING_.same_string (a_version, Xml_version_1_1) implies Result
		end
		
	characters (a_version: STRING): XM_UNICODE_CHARACTERS is
			-- Return character range routines depending on XML version string.
		require
			known_version: is_known_version (a_version)
		do
			if STRING_.same_string (a_version, Xml_version_1_0) then
				Result := characters_1_0
			else
				Result := characters_1_1
			end
		end
			
	characters_1_0: XM_UNICODE_CHARACTERS_1_0 is
			-- 1.0 version of XML unicode character ranges.
		once
			create Result
		ensure
			result_not_void: Result /= Void
		end

	characters_1_1: XM_UNICODE_CHARACTERS_1_1 is
			-- 1.1 version of XML unicode character ranges.
		once
			create Result
		ensure
			result_not_void: Result /= Void
		end

end
