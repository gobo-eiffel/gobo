indexing

	description:

		"String formatters"

	library:    "Gobo Eiffel Utility Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class UT_STRING_FORMATTER

inherit

	KL_IMPORTED_STRING_ROUTINES
	KL_IMPORTED_OUTPUT_STREAM_ROUTINES
	UT_IMPORTED_FORMATTERS

feature -- Access

	eiffel_string_out (a_string: STRING): STRING is
			-- Formatted version of `a_string', where all
			-- non-printable characters are replaced by their
			-- escaped character sequence as described in
			-- ETL, section 25.15, page 422;
			-- Return a new string at each call.
			-- Regexp: ([ !#$&(-~]|%[BFNRTU%'"]|%/[0-9]+/)*
		require
			a_string_not_void: a_string /= Void
		do
			Result := STRING_.make (a_string.count)
			append_eiffel_string (Result, a_string)
		ensure
			eiffel_string_out_not_void: Result /= Void
		end

	quoted_eiffel_string_out (a_string: STRING): STRING is
			-- Formatted version of `a_string', surrounded
			-- by double quotes, where all non-printable
			-- characters are replaced by their escaped
			-- character sequence as described in ETL,
			-- section 25.15, page 422;
			-- Return a new string at each call.
			-- Regexp: \"([ !#$&(-~]|%[BFNRTU%'"]|%/[0-9]+/)*\"
		require
			a_string_not_void: a_string /= Void
		do
			Result := STRING_.make (a_string.count + 2)
			append_quoted_eiffel_string (Result, a_string)
		ensure
			quoted_eiffel_string_out_not_void: Result /= Void
		end

	left_padded_string_out (a_string: STRING; a_length: INTEGER; c: CHARACTER): STRING is
			-- Clone of `a_string', padded on the left with
			-- `c' characters if `a_string' is less than 
			-- `a_length' character long;
			-- Return a new string at each call.
			-- Regexp: `c'{`(a_length-a_string.count).max (0)'}`a_string'
		require
			a_string_not_void: a_string /= Void
			a_length_positive: a_length >= 0
		local
			nb: INTEGER
		do
			nb := a_string.count
			if a_length >= nb then
				nb := a_length
			end
			Result := STRING_.make (nb)
			append_left_padded_string (Result, a_string, a_length, c)
		ensure
			left_padded_string_out_not_void: Result /= Void
		end

feature -- String handling

	append_eiffel_string (a_target: STRING; a_string: STRING) is
			-- Append `a_string' to `a_target', where all
			-- non-printable characters are replaced by their
			-- escaped character sequence as described in
			-- ETL, section 25.15, page 422.
		require
			a_target_not_void: a_target /= Void
			a_string_not_void: a_string /= Void
		local
			i, nb: INTEGER
			c: CHARACTER
		do
			nb := a_string.count
			from i := 1 until i > nb loop
				c := a_string.item (i)
				inspect c
				when ' ', '!', '#', '$', '&', '('..'~' then
					a_target.append_character (c)
				when '%B' then
					a_target.append_string ("%%B")
				when '%F' then
					a_target.append_string ("%%F")
				when '%N' then
					a_target.append_string ("%%N")
				when '%R' then
					a_target.append_string ("%%R")
				when '%T' then
					a_target.append_string ("%%T")
				when '%U' then
					a_target.append_string ("%%U")
				when '%%' then
					a_target.append_string ("%%%%")
				when '%'' then
					a_target.append_string ("%%%'")
				when '%"' then
					a_target.append_string ("%%%"")
				else
					a_target.append_string ("%%/")
					INTEGER_FORMATTER_.append_decimal_integer (a_string, c.code)
					a_target.append_character ('/')
				end
				i := i + 1
			end
		end

	append_quoted_eiffel_string (a_target: STRING; a_string: STRING) is
			-- Append `a_string', surrounded by double quotes, to
			-- `a_target', where all non-printable characters are
			-- replaced by their escaped character sequence as
			-- described in ETL, section 25.15, page 422.
		require
			a_target_not_void: a_target /= Void
			a_string_not_void: a_string /= Void
		do
			a_target.append_character ('%"')
			append_eiffel_string (a_target, a_string)
			a_target.append_character ('%"')
		end

	append_left_padded_string (a_target: STRING; a_string: STRING; a_length: INTEGER; c: CHARACTER) is
			-- Append `a_string' to `a_target', padded on the
			-- left with `c' characters if `a_string' is less
			-- than `a_length' character long.
		require
			a_target_not_void: a_target /= Void
			a_string_not_void: a_string /= Void
			a_length_positive: a_length >= 0
		local
			i, nb: INTEGER
		do
			nb := a_length - a_string.count
			from i := 1 until i > nb loop
				a_target.append_character (c)
				i := i + 1
			end
			a_target.append_string (a_string)
		end

feature -- File handling

	put_eiffel_string (a_file: like OUTPUT_STREAM_TYPE; a_string: STRING) is
			-- Write `a_string' to `a_file', where all
			-- non-printable characters are replaced by their
			-- escaped character sequence as described in
			-- ETL, section 25.15, page 422.
		require
			a_file_not_void: a_file /= Void
			a_file_is_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			a_string_not_void: a_string /= Void
		local
			i, nb: INTEGER
			c: CHARACTER
		do
			nb := a_string.count
			from i := 1 until i > nb loop
				c := a_string.item (i)
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
				i := i + 1
			end
		end

	put_quoted_eiffel_string (a_file: like OUTPUT_STREAM_TYPE; a_string: STRING) is
			-- Write `a_string', surrounded by double quotes, to
			-- `a_file', where all non-printable characters are
			-- replaced by their escaped character sequence as
			-- described in ETL, section 25.15, page 422.
		require
			a_file_not_void: a_file /= Void
			a_file_is_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			a_string_not_void: a_string /= Void
		do
			a_file.put_character ('%"')
			put_quoted_eiffel_string (a_file, a_string)
			a_file.put_character ('%"')
		end

	put_left_padded_string (a_file: like OUTPUT_STREAM_TYPE; a_string: STRING; a_length: INTEGER; c: CHARACTER) is
			-- Write `a_string' to `a_file', padded on the
			-- left with `c' characters if `a_string' is less
			-- than `a_length' character long.
		require
			a_file_not_void: a_file /= Void
			a_file_is_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			a_string_not_void: a_string /= Void
			a_length_positive: a_length >= 0
		local
			i, nb: INTEGER
		do
			nb := a_length - a_string.count
			from i := 1 until i > nb loop
				a_file.put_character (c)
				i := i + 1
			end
			a_file.put_string (a_string)
		end

end -- class UT_STRING_FORMATTER
