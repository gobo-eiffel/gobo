indexing

	description:

		"String creation policy for a source of unicode strings"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2001, Andreas Leitner and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_STRING_MODE

inherit

	KL_IMPORTED_BOOLEAN_ROUTINES
		export
			{NONE} all
		end

feature -- Status report

	is_string_mode_ascii: BOOLEAN is
			-- Is string mode set to ascii only?
			-- This means that all strings issued by this source
			-- will be of dynamic type STRING.
		do
			Result := string_mode = String_mode_ascii
		end

	is_string_mode_mixed: BOOLEAN is
			-- Is string mode set to polymorphic strings?
			-- This means that strings issued by this source will
			-- be of dynamic type STRING for ascii, and dynamic
			-- type UC_STRING or descendant when characters >127
			-- are present in that string.
		do
			Result := string_mode = String_mode_mixed
		end

	is_string_mode_unicode: BOOLEAN is
			-- Is string mode set to UC_STRING only?
			-- This means that all strings issued by this source
			-- will be of a dynamic type UC_STRING or descendant.
		do
			Result := string_mode = String_mode_unicode
		end

feature -- Status setting

	set_string_mode_ascii is
			-- Set all strings issued by this source to be ascii
			-- (all characters <127) to be of dynamic type STRING.
			-- The source will be in an error state if it has
			-- characters that do not fit in a STRING.
		do
			string_mode := String_mode_ascii
		ensure
			string_mode_set: is_string_mode_ascii
		end

	set_string_mode_mixed is
			-- Set all strings issued by this source to be either of
			-- type UC_STRING or descendant if they contain characters
			-- >127 or of dynamic type STRING otherwise.
			-- The client receiving these strings will have to
			-- be careful about polymorphically unsafe features
			-- of STRING, like append_string.
		do
			string_mode := String_mode_mixed
		ensure
			string_mode_set: is_string_mode_mixed
		end

	set_string_mode_unicode is
			-- Set all strings issued by this source to be of
			-- dynamic type UC_STRING or descendant.
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
