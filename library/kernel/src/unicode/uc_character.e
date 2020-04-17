note

	description:

		"Unicode characters"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2001-2020, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class UC_CHARACTER

inherit

	KL_COMPARABLE
		redefine
			out
		end

	HASHABLE
		undefine
			is_equal,
			out
		end

	KL_SHARED_PLATFORM
		undefine
			is_equal,
			out
		end

	UC_IMPORTED_UNICODE_ROUTINES
		undefine
			is_equal,
			out
		end

	KL_IMPORTED_INTEGER_ROUTINES
		undefine
			is_equal,
			out
		end

	KL_IMPORTED_STRING_ROUTINES
		undefine
			is_equal,
			out
		end

create

	make_from_character,
	make_from_code

feature {NONE} -- Initialization

	make_from_character (c: CHARACTER_8)
			-- Create a new unicode character from Latin-1 character `c'.
		do
			code := c.code
		ensure
			code_set: code = c.code
		end

	make_from_code (a_code: INTEGER)
			-- Create a new unicode character with code `a_code'.
		require
			valid_code: unicode.valid_code (a_code)
		do
			code := a_code
		ensure
			code_set: code = a_code
		end

feature -- Access

	code: INTEGER
			-- Code of unicode character

	hash_code: INTEGER
			-- Hash code value
		do
			Result := code
		end

feature -- Status report

	is_ascii: BOOLEAN
			-- Is current character an ASCII character?
		do
			Result := (code <= unicode.maximum_ascii_character_code)
		ensure
			definition: Result = unicode.valid_ascii_code (code)
		end

feature -- Comparison

	is_less alias "<" (other: like Current): BOOLEAN
			-- Is current object less than other?
		do
			Result := (code < other.code)
		end

feature -- Conversion

	as_lower, to_lower: like Current
			-- Lowercase value of current character
			-- (Create a new object at each call.)
		do
			create Result.make_from_code (unicode.lower_code (code))
		ensure
			to_lower_not_void: Result /= Void
		end

	as_upper, to_upper: like Current
			-- Uppercase value of current character
			-- (Create a new object at each call.)
		do
			create Result.make_from_code (unicode.upper_code (code))
		ensure
			to_upper_not_void: Result /= Void
		end

	to_character: CHARACTER_8
			-- Character with code `code'
		require
			valid_code: code <= Platform.Maximum_character_code
		do
			Result := INTEGER_.to_character (code)
		ensure
			code_set: Result.code = code
		end

feature -- Output

	out: STRING
			-- New STRING containing terse printable representation
			-- of current character; Non-ascii characters are represented
			-- with the %/code/ convention.
		local
			max_ascii_code: INTEGER
			code_out: STRING
		do
			max_ascii_code := unicode.maximum_ascii_character_code
			if code <= max_ascii_code then
				create Result.make (1)
				Result.append_character (INTEGER_.to_character (code))
			else
				code_out := code.out
				create Result.make (3 + code_out.count)
				Result.append_character ('%%')
				Result.append_character ('/')
				Result.append_string (code_out)
				Result.append_character ('/')
			end
		end

invariant

	valid_code: unicode.valid_code (code)

end
