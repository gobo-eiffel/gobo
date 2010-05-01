note

	description:

		"Objects for interpreting the validation attribute"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_VALIDATION

inherit

	KL_IMPORTED_STRING_ROUTINES

feature -- Access

	Report_always: INTEGER is 1
	Report_unless_forwards_comptible: INTEGER is 2
	Report_if_instantiated: INTEGER is 3
			-- Validation reporting definitions

	Validation_invalid: INTEGER is -1
	Validation_strict: INTEGER is 1
	Validation_lax: INTEGER is 2
	Validation_preserve: INTEGER is 3
	Validation_strip: INTEGER is 4

	validation_code (a_string: STRING): INTEGER is
			-- Validation code from `a_string'
		require
			string_not_void: a_string /= Void
		do
			if STRING_.same_string (a_string, "strip") then
				Result := Validation_strip
			elseif STRING_.same_string (a_string, "lax") then
				Result := Validation_lax
			elseif STRING_.same_string (a_string, "preserve") then
				Result := Validation_preserve
			elseif STRING_.same_string (a_string, "strict") then
				Result := Validation_strict
			else
				Result := Validation_invalid
			end
		ensure
			validation_code_in_range: Result = Validation_invalid or else 
			(Result >= Validation_strict  and then Validation_strip >= Result)
		end

end
	
