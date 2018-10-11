note

	description:

		"Character formatters"

	library: "Gobo Eiffel Utility Library"
	copyright: "Copyright (c) 1999-2018, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class UT_CHARACTER_FORMATTER

inherit

	ANY -- Export features from ANY.

	UT_IMPORTED_FORMATTERS
	KL_IMPORTED_INTEGER_ROUTINES

feature -- Access

	eiffel_character_out (c: CHARACTER): STRING
			-- Formatted version of `c'; if `c' is not
			-- printable, it is replaced by its escaped
			-- character sequence as described in ETL,
			-- section 25.15, page 422;
			-- Return a new string at each call.
			-- Regexp: [ !#$&(-~]|%[BFNRTU%'"]|%/[0-9]+/
		do
			create Result.make (1)
			append_eiffel_character (Result, c)
		ensure
			instance_free: class
			eiffel_character_out_not_void: Result /= Void
		end

	quoted_eiffel_character_out (c: CHARACTER): STRING
			-- Formatted version of `c' surrounded by single
			-- quotes; if `c' is not printable, it is replaced
			-- by its escaped character sequence as described
			-- in ETL, section 25.15, page 422;
			-- Return a new string at each call.
			-- Regexp: \'([ !#$&(-~]|%[BFNRTU%'"]|%/[0-9]+/)\'
		do
			create Result.make (3)
			append_quoted_eiffel_character (Result, c)
		ensure
			instance_free: class
			quoted_eiffel_character_out_not_void: Result /= Void
		end

feature -- String handling

	append_eiffel_character (a_string: STRING; c: CHARACTER)
			-- Append `c' to `a_string'; if `c' is not printable,
			-- it is replaced by its escaped character sequence
			-- as described in ETL, section 25.15, page 422.
		require
			a_string_not_void: a_string /= Void
		do
			inspect c
			when ' ', '!', '#', '$', '&', '('..'~' then
				a_string.append_character (c)
			when '%B' then
				a_string.append_character ('%%')
				a_string.append_character ('B')
			when '%F' then
				a_string.append_character ('%%')
				a_string.append_character ('F')
			when '%N' then
				a_string.append_character ('%%')
				a_string.append_character ('N')
			when '%R' then
				a_string.append_character ('%%')
				a_string.append_character ('R')
			when '%T' then
				a_string.append_character ('%%')
				a_string.append_character ('T')
			when '%U' then
				a_string.append_character ('%%')
				a_string.append_character ('U')
			when '%%' then
				a_string.append_character ('%%')
				a_string.append_character ('%%')
			when '%'' then
				a_string.append_character ('%%')
				a_string.append_character ('%'')
			when '%"' then
				a_string.append_character ('%%')
				a_string.append_character ('%"')
			else
				a_string.append_character ('%%')
				a_string.append_character ('/')
				INTEGER_.append_decimal_integer (c.code, a_string)
				a_string.append_character ('/')
			end
		ensure
			instance_free: class
		end

	append_quoted_eiffel_character (a_string: STRING; c: CHARACTER)
			-- Append `c' surrounded by single quotes to `a_string';
			-- if `c' is not printable, it is replaced by its
			-- escaped character sequence as described in ETL,
			-- section 25.15, page 422.
		require
			a_string_not_void: a_string /= Void
		do
			a_string.append_character ('%'')
			append_eiffel_character (a_string, c)
			a_string.append_character ('%'')
		ensure
			instance_free: class
		end

feature -- File handling

	put_eiffel_character (a_file: KI_CHARACTER_OUTPUT_STREAM; c: CHARACTER)
			-- Write `c' to `a_file'; if `c' is not printable,
			-- it is replaced by its escaped character sequence
			-- as described in ETL, section 25.15, page 422.
		require
			a_file_not_void: a_file /= Void
			a_file_is_open_write: a_file.is_open_write
		do
			inspect c
			when ' ', '!', '#', '$', '&', '('..'~' then
				a_file.put_character (c)
			when '%B' then
				a_file.put_string ("%%B")
			when '%F' then
				a_file.put_string ("%%F")
			when '%N' then
				a_file.put_string ("%%N")
			when '%R' then
				a_file.put_string ("%%R")
			when '%T' then
				a_file.put_string ("%%T")
			when '%U' then
				a_file.put_string ("%%U")
			when '%%' then
				a_file.put_string ("%%%%")
			when '%'' then
				a_file.put_string ("%%%'")
			when '%"' then
				a_file.put_string ("%%%"")
			else
				a_file.put_string ("%%/")
				INTEGER_FORMATTER_.put_decimal_integer (a_file, c.code)
				a_file.put_character ('/')
			end
		ensure
			instance_free: class
		end

	put_quoted_eiffel_character (a_file: KI_CHARACTER_OUTPUT_STREAM; c: CHARACTER)
			-- Write `c' surrounded by single quotes to `a_string';
			-- if `c' is not printable, it is replaced by its
			-- escaped character sequence as described in ETL,
			-- section 25.15, page 422.
		require
			a_file_not_void: a_file /= Void
			a_file_is_open_write: a_file.is_open_write
		do
			a_file.put_character ('%'')
			put_eiffel_character (a_file, c)
			a_file.put_character ('%'')
		ensure
			instance_free: class
		end

end
