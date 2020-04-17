note

	description:

		"Unicode routines"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2001-2020, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class UC_UNICODE_ROUTINES

inherit

	ANY
			-- Export features from ANY.

	UC_CTYPE

	KL_IMPORTED_INTEGER_ROUTINES
		export {NONE} all end

	KL_SHARED_PLATFORM
		export {NONE} all end

feature -- Status report

	valid_non_surrogate_code (a_code: INTEGER): BOOLEAN
			-- Is `a_code' a valid non-surrogate unicode?
			-- Include all non-characters.
		do
			Result := (a_code >= minimum_unicode_character_code and a_code < minimum_unicode_surrogate_code)
				or (a_code > maximum_unicode_surrogate_code and a_code <= maximum_unicode_character_code)
		ensure
			instance_free: class
		end

	valid_non_surrogate_natural_32_code (a_code: NATURAL_32): BOOLEAN
			-- Is `a_code' a valid non-surrogate unicode?
			-- Include all non-characters.
		do
			Result := (a_code >= minimum_unicode_character_natural_32_code and a_code < minimum_unicode_surrogate_natural_32_code)
				or (a_code > maximum_unicode_surrogate_natural_32_code and a_code <= maximum_unicode_character_natural_32_code)
		ensure
			instance_free: class
		end

	is_bmp_code (a_code: INTEGER): BOOLEAN
			-- Does `a_code' lie within the BMP?
		do
			Result := a_code >= minimum_unicode_character_code and a_code <= maximum_bmp_character_code
		ensure
			instance_free: class
		end

	valid_ascii_code (a_code: INTEGER): BOOLEAN
			-- Is `a_code' a valid ASCII code?
		do
			Result := (a_code >= minimum_ascii_character_code and a_code <= maximum_ascii_character_code)
		ensure
			instance_free: class
			definition: Result = (a_code >= minimum_ascii_character_code and a_code <= maximum_ascii_character_code)
		end

	is_ascii_string (a_string: READABLE_STRING_GENERAL): BOOLEAN
			-- Does `a_string' contain only ASCII characters?
		require
			a_string_not_void: a_string /= Void
		local
			i, nb: INTEGER
		do
			if attached {UC_STRING} a_string as a_unicode then
				Result := a_unicode.is_ascii
			else
				Result := True
				nb := a_string.count
				from
					i := 1
				until
					i > nb
				loop
					if maximum_ascii_character_natural_32_code < a_string.code (i) then
						Result := False
							-- Jump out of the loop.
						i := nb + 1
					else
						i := i + 1
					end
				end
			end
		ensure
			instance_free: class
		end

	code_to_string (a_code: INTEGER): STRING_8
			-- Return a string with `a_code' as its single character.
			-- (If the character code is bigger than the maximum for
			-- CHARACTER_8, the dynamic type of the result will be UC_STRING
			-- or a descendant.)
		require
			a_code_valid: valid_code (a_code)
		local
			a_unicode: UC_UTF8_STRING
		do
			if a_code <= Platform.Maximum_character_code then
				create Result.make (1)
				Result.append_character (INTEGER_.to_character (a_code))
			else
				create a_unicode.make (1)
				a_unicode.append_item_code (a_code)
				Result := a_unicode
			end
		ensure
			instance_free: class
			string_not_void: Result /= Void
			count_set: Result.count = 1
			code_set: Result.item_code (1) = a_code
		end

end
