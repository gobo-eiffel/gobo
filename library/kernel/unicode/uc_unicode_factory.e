indexing

	description:

		"Unicode factories"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2001, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class UC_UNICODE_FACTORY

inherit

	UC_IMPORTED_UTF8_ROUTINES

feature -- Access

	new_unicode_string (a_string: STRING): UC_STRING is
			-- New unicode string made up of the characters from `a_string'
		require
			a_string_not_void: a_string /= Void
		do
			!UC_UTF8_STRING! Result.make_from_string (a_string)
		ensure
			new_string_not_void: Result /= Void
		end

	new_unicode_string_from_utf8 (a_string: STRING): UC_STRING is
			-- New unicode string made up of the characters
			-- from `a_string' encoded in UTF-8
		require
			a_string_not_void: a_string /= Void
			valid_utf8: utf8.valid_utf8 (a_string)
		do
			!UC_UTF8_STRING! Result.make_from_utf8 (a_string)
		ensure
			new_string_not_void: Result /= Void
		end

	new_unicode_character (a_char: CHARACTER): UC_CHARACTER is
			-- New unicode character from Latin-1 character `a_char'
		do
			!! Result.make_from_character (a_char)
		ensure
			new_character_not_void: Result /= Void
			code_set: Result.code = a_char.code
		end

end
