indexing

	description:

		"Character formatters"

	library:    "Gobo Eiffel Utility Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class UT_CHARACTER_FORMATTER

inherit

	KL_IMPORTED_STRING_ROUTINES
	KL_IMPORTED_OUTPUT_STREAM_ROUTINES
	UT_IMPORTED_FORMATTERS

feature -- Access

	eiffel_character_out (c: CHARACTER): STRING is
			-- Formatted version of `c'; if `c' is not
			-- printable, it is replaced by its escaped
			-- character sequence as described in ETL,
			-- section 25.15, page 422;
			-- Return a new string at each call.
			-- Regexp: [ !#$&(-~]|%[BFNRTU%'"]|%/[0-9]+/
		do
			Result := STRING_.make (1)
			append_eiffel_character (Result, c)
		ensure
			eiffel_character_out_not_void: Result /= Void
		end

	quoted_eiffel_character_out (c: CHARACTER): STRING is
			-- Formatted version of `c' surrounded by single
			-- quotes; if `c' is not printable, it is replaced
			-- by its escaped character sequence as described
			-- in ETL, section 25.15, page 422;
			-- Return a new string at each call.
			-- Regexp: \'([ !#$&(-~]|%[BFNRTU%'"]|%/[0-9]+/)\'
		do
			Result := STRING_.make (3)
			append_quoted_eiffel_character (Result, c)
		ensure
			quoted_eiffel_character_out_not_void: Result /= Void
		end

feature -- String handling

	append_eiffel_character (a_string: STRING; c: CHARACTER) is
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
				a_string.append_string ("%%B")
			when '%F' then
				a_string.append_string ("%%F")
			when '%N' then
				a_string.append_string ("%%N")
			when '%R' then
				a_string.append_string ("%%R")
			when '%T' then
				a_string.append_string ("%%T")
			when '%U' then
				a_string.append_string ("%%U")
			when '%%' then
				a_string.append_string ("%%%%")
			when '%'' then
				a_string.append_string ("%%%'")
			when '%"' then
				a_string.append_string ("%%%"")
			else
				a_string.append_string ("%%/")
				INTEGER_FORMATTER_.append_decimal_integer (a_string, c.code)
				a_string.append_character ('/')
			end
		end

	append_quoted_eiffel_character (a_string: STRING; c: CHARACTER) is
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
		end

feature -- File handling

	put_eiffel_character (a_file: like OUTPUT_STREAM_TYPE; c: CHARACTER) is
			-- Write `c' to `a_file'; if `c' is not printable,
			-- it is replaced by its escaped character sequence
			-- as described in ETL, section 25.15, page 422.
		require
			a_file_not_void: a_file /= Void
			a_file_is_open_write: OUTPUT_STREAM_.is_open_write (a_file)
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
		end

	put_quoted_eiffel_character (a_file: like OUTPUT_STREAM_TYPE; c: CHARACTER) is
			-- Write `c' surrounded by single quotes to `a_string';
			-- if `c' is not printable, it is replaced by its
			-- escaped character sequence as described in ETL,
			-- section 25.15, page 422.
		require
			a_file_not_void: a_file /= Void
			a_file_is_open_write: OUTPUT_STREAM_.is_open_write (a_file)
		do
			a_file.put_character ('%'')
			put_quoted_eiffel_character (a_file, c)
			a_file.put_character ('%'')
		end

end -- class UT_CHARACTER_FORMATTER
