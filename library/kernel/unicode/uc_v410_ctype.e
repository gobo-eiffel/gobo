indexing

	description:

		"Routines for cased variants of Unicode 4.1.0 characters"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class UC_V410_CTYPE

inherit

	UC_V410_CTYPE_LOWERCASE
		export {NONE} all end

	UC_V410_CTYPE_UPPERCASE
		export
			{NONE} all
		undefine
			major_version,
			minor_version,
			update_version
		end

	UC_V410_CTYPE_TITLECASE
		export
			{NONE} all
		undefine
			major_version,
			minor_version,
			update_version
		end

	UC_UNICODE_CONSTANTS

feature -- Status report

	valid_code (a_code: INTEGER): BOOLEAN is
			-- Is `a_code' a valid unicode?
		do
			Result := (a_code >= minimum_unicode_character_code and a_code <= maximum_unicode_character_code)
		ensure
			definition: Result = (a_code >= minimum_unicode_character_code and a_code <= maximum_unicode_character_code)
		end

feature -- Access

	lower_code (a_code_point: INTEGER): INTEGER is
			-- Code of lower-case character of character with code `a_code_point'
		require
			valid_code: valid_code (a_code_point)
		local
			i, j, k, a_rem: INTEGER
		do
			i := a_code_point // (65536)
			a_rem := a_code_point \\ (65536)
			j := a_rem // 256
			k := a_rem \\ 256
			Result := lower_codes.item (i).item (j).item (k + 1)
			if Result = -1 then
				Result := a_code_point
			end
		ensure
			valid_lower_code: valid_code (Result)
		end

	upper_code (a_code_point: INTEGER): INTEGER is
			-- Code of upper-case character of character with code `a_code_point'
		require
			valid_code: valid_code (a_code_point)
		local
			i, j, k, a_rem: INTEGER
		do
			i := a_code_point // (65536)
			a_rem := a_code_point \\ (65536)
			j := a_rem // 256
			k := a_rem \\ 256
			Result := upper_codes.item (i).item (j).item (k + 1)
			if Result = -1 then
				Result := a_code_point
			end
		ensure
			valid_upper_code: valid_code (Result)
		end

	title_code (a_code_point: INTEGER): INTEGER is
			-- Code of title-case character of character with code `a_code_point'
		require
			valid_code: valid_code (a_code_point)
		local
			i, j, k, a_rem: INTEGER
		do
			i := a_code_point // (65536)
			a_rem := a_code_point \\ (65536)
			j := a_rem // 256
			k := a_rem \\ 256
			Result := title_codes.item (i).item (j).item (k + 1)
			if Result = -1 then
				Result := a_code_point
			end
		ensure
			valid_title_code: valid_code (Result)
		end

end
