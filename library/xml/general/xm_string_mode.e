note

	description:

		"String creation policy for a source of unicode strings"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2001, Andreas Leitner and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_STRING_MODE

inherit

	ANY

	KL_IMPORTED_BOOLEAN_ROUTINES
		export {NONE} all end

feature -- Status report

	is_string_mode_ascii: BOOLEAN
			-- Is string mode set to ascii only?
			-- This means that all strings issued by this source
			-- will be of dynamic type STRING.
		do
			Result := string_mode = String_mode_ascii
		end

	is_string_mode_latin1: BOOLEAN
			-- Is string mode set to latin-1 only?
			-- This means that all strings issued by this source
			-- will be of dynamic type STRING.
		do
			Result := string_mode = String_mode_latin1
		end

	is_string_mode_mixed: BOOLEAN
			-- Is string mode set to polymorphic strings?
			-- This means that strings issued by this source will
			-- be of dynamic type STRING for ascii, and dynamic
			-- type UC_STRING or descendant when characters >127
			-- are present in that string.
		do
			Result := string_mode = String_mode_mixed
		end

	is_string_mode_unicode: BOOLEAN
			-- Is string mode set to UC_STRING only?
			-- This means that all strings issued by this source
			-- will be of a dynamic type UC_STRING or descendant.
		do
			Result := string_mode = String_mode_unicode
		end

feature -- Status setting

	set_string_mode_ascii
			-- Set all strings issued by this source to be ascii
			-- (all characters <= 127) and be of dynamic type STRING.
			-- The source will be in an error state if it has
			-- characters that do not fit in a STRING.
		do
			string_mode := String_mode_ascii
		ensure
			string_mode_set: is_string_mode_ascii
		end

	set_string_mode_latin1
			-- Set all strings issued by this source to be latin-1
			-- (all characters <= 255) and be of dynamic type STRING.
			-- The source will be in an error state if it has
			-- characters that do not fit in a STRING.
		do
			string_mode := String_mode_latin1
		ensure
			string_mode_set: is_string_mode_latin1
		end

	set_string_mode_mixed
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

	set_string_mode_unicode
			-- Set all strings issued by this source to be of
			-- dynamic type UC_STRING or descendant.
		do
			string_mode := String_mode_unicode
		ensure
			string_mode_set: is_string_mode_unicode
		end

feature -- Copy

	copy_string_mode (other: XM_STRING_MODE)
			-- Copy string mode.
		require
			other_not_void: other /= Void
		do
			string_mode := other.string_mode
		ensure
			copied: same_string_mode (other)
		end

feature -- Status report

	same_string_mode (other: XM_STRING_MODE): BOOLEAN
			-- Is `other' with the same string mode?
		require
			other_not_void: other /= Void
		do
			Result := string_mode = other.string_mode
		end

feature {XM_STRING_MODE} -- Implementation

	string_mode: INTEGER
			-- STRING/UC_STRING mode

feature {NONE} -- Implementation

	String_mode_latin1: INTEGER = 0
	String_mode_unicode: INTEGER = 1
	String_mode_mixed: INTEGER = 2
	String_mode_ascii: INTEGER = 3
			-- Values

invariant

	mode_set: BOOLEAN_.nxor (<<is_string_mode_ascii, is_string_mode_mixed, is_string_mode_unicode, is_string_mode_latin1>>)

end
