indexing

	description:

		"String creation policy for a source of unicode strings"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2001, Andreas Leitner and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_STRING_MODE

inherit

	KL_IMPORTED_BOOLEAN_ROUTINES

feature -- Status report

	is_string_mode_ascii: BOOLEAN is
			-- Is string mode set to ascii only?
		do
			Result := string_mode = String_mode_ascii
		end

	is_string_mode_mixed: BOOLEAN is
			-- Is string mode set to polymorphic strings?
			-- (STRING for ascii, UC_STRING when characters >127 are present)
		do
			Result := string_mode = String_mode_mixed
		end

	is_string_mode_unicode: BOOLEAN is
			-- Is string mode set to UC_STRING only?
		do
			Result := string_mode = String_mode_unicode
		end

feature -- Status setting

	set_string_mode_ascii is
			-- Set all strings to be ascii and of STRING types.
		do
			string_mode := String_mode_ascii
		ensure
			string_mode_set: is_string_mode_ascii
		end

	set_string_mode_mixed is
			-- Set all strings from a unicode source to be 
			-- UC_STRING if they contain characters >127 or
			-- STRING otherwise.
		do
			string_mode := String_mode_mixed
		ensure
			string_mode_set: is_string_mode_mixed
		end

	set_string_mode_unicode is
			-- Set all strings from a unicode source to be 
			-- UC_STRING.
		do
			string_mode := String_mode_unicode
		ensure
			string_mode_set: is_string_mode_unicode
		end

feature {NONE} -- Implementation

	string_mode: INTEGER
			-- STRING/UC_STRING mode

	String_mode_ascii: INTEGER is 0
	String_mode_unicode: INTEGER is 1
	String_mode_mixed: INTEGER is 2
			-- Values

invariant

	mode_set: BOOLEAN_.nxor (<<is_string_mode_ascii, is_string_mode_mixed, is_string_mode_unicode>>)

end
