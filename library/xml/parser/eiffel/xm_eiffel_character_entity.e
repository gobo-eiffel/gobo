indexing

	description:

		"Handler for character references/entities"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_EIFFEL_CHARACTER_ENTITY

inherit

	KL_IMPORTED_INTEGER_ROUTINES
	KL_IMPORTED_STRING_ROUTINES
	KL_IMPORTED_ANY_ROUTINES
	KL_SHARED_PLATFORM
	UC_IMPORTED_UTF8_ROUTINES
	UC_IMPORTED_UNICODE_ROUTINES

create

	make

feature {NONE} -- Initialization

	make is
			-- Create a new character entity.
		do
		end

feature -- Initialization

	from_decimal (a_string: STRING) is
			-- Set entity from decimal representation.
		require
			a_string_not_void: a_string /= Void
			a_string_is_decimal: STRING_.is_decimal (a_string)
		do
			code := a_string.to_integer
		end

	from_hexadecimal (a_string: STRING) is
			-- Set entity from hexadecimal representation.
		require
			a_string_not_void: a_string /= Void
			a_string_is_hexadecimal: STRING_.is_hexadecimal (a_string)
		do
			code := STRING_.hexadecimal_to_integer (a_string)
		end

	from_code (a_code: INTEGER) is
			-- Set entity from integer code.
		require
			a_code_positive: a_code >= 0
		do
			code := a_code
		ensure
			code_set: code = a_code
		end

feature -- Access

	code: INTEGER
			-- Character code for current entity

feature -- Status report

	is_valid: BOOLEAN is
			-- Is this entity representing a valid XML character?
		do
			if unicode.valid_non_surrogate_code (code) then
					-- Non conforming: excluded >32 unicode character:
				Result := (code = 9) or -- tab
					(code = 10) or (code = 13) or -- cr/lf
					(code >= 32 and
						(code /= 65279) and -- #xFEFF
						(code /= 65535) -- #xFFFF
					)
			end
		ensure
			valid_unicode: Result implies unicode.valid_code (code)
		end

	is_ascii: BOOLEAN is
			-- Is this entity representing an ASCII character?
		do
			Result := code <= 127
		ensure
			definition: Result = (code <= 127)
		end

feature -- Conversion

	to_character: CHARACTER is
			-- Character represented by entity
		require
			is_valid: is_valid
			small_enough: code <= Platform.Maximum_character_code
		do
			Result := INTEGER_.to_character (code)
		ensure
			same_code: Result.code = code
		end

	to_utf8: STRING is
			-- UTF-8 string from character code
		require
			valid: is_valid
		do
			create Result.make (6)
			utf8.append_code_to_utf8 (Result, code)
		ensure
			to_utf8_not_void: Result /= Void
			string_type: ANY_.same_types (Result, "")
			valid_utf8: utf8.valid_utf8 (Result)
		end

feature -- Obsolete

	as_character: CHARACTER is
			-- Character represented by entity
		obsolete
			"[020814] Use `to_character' instead."
		require
			is_valid: is_valid
			small_enough: code <= Platform.Maximum_character_code
		do
			Result := to_character
		ensure
			same_code: Result.code = code
		end

	as_string: STRING is
			-- UTF-8 string from character code
		obsolete
			"[020814] Use `to_utf8' instead."
		require
			valid: is_valid
		do
			Result := to_utf8
		ensure
			to_utf8_not_void: Result /= Void
			string_type: ANY_.same_types (Result, "")
			valid_utf8: utf8.valid_utf8 (Result)
		end

invariant

	code_positive: code >= 0

end
