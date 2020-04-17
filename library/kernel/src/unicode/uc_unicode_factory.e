note

	description:

		"Unicode factories"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2001-2020, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class UC_UNICODE_FACTORY

inherit

	UC_IMPORTED_UTF8_ROUTINES

	UC_IMPORTED_UTF16_ROUTINES

	UC_IMPORTED_UNICODE_ROUTINES

	KL_IMPORTED_ANY_ROUTINES

feature -- Access

	new_unicode_string (a_string: READABLE_STRING_GENERAL): UC_STRING
			-- New unicode string made up of the characters from `a_string'
		require
			a_string_not_void: a_string /= Void
		do
			create {UC_UTF8_STRING} Result.make_from_string_general (a_string)
		ensure
			instance_free: class
			new_string_not_void: Result /= Void
			count_set: Result.count = a_string.count
		end

	new_unicode_string_from_utf8 (a_string: STRING_8): UC_STRING
			-- New unicode string made up of the characters
			-- from `a_string' encoded in UTF-8
		require
			a_string_not_void: a_string /= Void
			a_string_is_string: ANY_.same_types (a_string, {STRING_8} "")
			valid_utf8: utf8.valid_utf8 (a_string)
		do
			create {UC_UTF8_STRING} Result.make_from_utf8 (a_string)
		ensure
			instance_free: class
			new_string_not_void: Result /= Void
		end

	new_unicode_string_from_utf16 (a_string: STRING_8): UC_STRING
			-- New unicode string made up of the characters
			-- from `a_string' encoded in UTF-16
		require
			a_string_not_void: a_string /= Void
			a_string_is_string: ANY_.same_types (a_string, {STRING_8} "")
			valid_utf16: utf16.valid_utf16 (a_string)
		do
			create {UC_UTF8_STRING} Result.make_from_utf16 (a_string)
		ensure
			instance_free: class
			new_string_not_void: Result /= Void
		end

	new_unicode_string_with_capacity (suggested_capacity: INTEGER): UC_STRING
			-- New empty unicode string
		require
			non_negative_suggested_capacity: suggested_capacity >= 0
		do
			create {UC_UTF8_STRING} Result.make (suggested_capacity)
		ensure
			instance_free: class
			new_string_not_void: Result /= Void
			empty: Result.count = 0
			byte_capacity_set: Result.byte_capacity >= suggested_capacity
		end

	new_unicode_string_empty: UC_STRING
			-- New empty unicode string
		do
			create {UC_UTF8_STRING} Result.make_empty
		ensure
			instance_free: class
			new_string_not_void: Result /= Void
			empty: Result.count = 0
		end

	new_unicode_string_from_substring (a_string: READABLE_STRING_GENERAL; start_index, end_index: INTEGER): UC_STRING
			-- New unicode string made up of the character sequence of
			-- `a_string' between `start_index' and `end_index' inclusive
		require
			a_string_not_void: a_string /= Void
			valid_start_index: 1 <= start_index
			valid_end_index: end_index <= a_string.count
			meaningful_interval: start_index <= end_index + 1
		do
			create {UC_UTF8_STRING} Result.make_from_substring_general (a_string, start_index, end_index)
		ensure
			instance_free: class
			new_string_not_void: Result /= Void
			count_set: Result.count = (end_index - start_index + 1)
		end

	new_unicode_string_filled (c: CHARACTER_8; n: INTEGER): UC_STRING
			-- New unicode string of length `n' filled with character `c'
		require
			valid_count: n >= 0
		do
			create {UC_UTF8_STRING} Result.make_filled (c, n)
		ensure
			instance_free: class
			new_string_not_void: Result /= Void
			count_set: Result.count = n
			occurrences: Result.occurrences (c) = n
		end

	new_unicode_string_filled_unicode (c: UC_CHARACTER; n: INTEGER): UC_STRING
			-- New unicode string of length `n' filled with unicode character `c'
		require
			c_not_void: c /= Void
			valid_count: n >= 0
		do
			create {UC_UTF8_STRING} Result.make_filled_unicode (c, n)
		ensure
			instance_free: class
			new_string_not_void: Result /= Void
			count_set: Result.count = n
			occurrences: Result.unicode_occurrences (c) = n
		end

	new_unicode_string_filled_code (a_code: INTEGER; n: INTEGER): UC_STRING
			-- New unicode string of length `n' filled with unicode
			-- character of code `a_code'
		require
			valid_code: unicode.valid_code (a_code)
			valid_count: n >= 0
		do
			create {UC_UTF8_STRING} Result.make_filled_code (a_code, n)
		ensure
			instance_free: class
			new_string_not_void: Result /= Void
			count_set: Result.count = n
			occurrences: Result.code_occurrences (a_code) = n
		end

	new_unicode_character (a_char: CHARACTER_8): UC_CHARACTER
			-- New unicode character from Latin-1 character `a_char'
		do
			create Result.make_from_character (a_char)
		ensure
			instance_free: class
			new_character_not_void: Result /= Void
			code_set: Result.code = a_char.code
		end

end
