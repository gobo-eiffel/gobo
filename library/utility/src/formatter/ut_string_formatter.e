note

	description:

		"String formatters"

	library: "Gobo Eiffel Utility Library"
	copyright: "Copyright (c) 1999-2018, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class UT_STRING_FORMATTER

inherit

	ANY -- Export features of ANY.

	KL_IMPORTED_STRING_ROUTINES
	KL_IMPORTED_INTEGER_ROUTINES
	KL_IMPORTED_ANY_ROUTINES
	UT_IMPORTED_FORMATTERS

feature -- Access

	eiffel_string_out (a_string: STRING): STRING
			-- Formatted version of `a_string', where all
			-- non-printable characters are replaced by their
			-- escaped character sequence as described in
			-- ETL, section 25.15, page 422;
			-- Return a new string at each call.
			-- Regexp: ([ !#$&(-~]|%[BFNRTU%'"]|%/[0-9]+/)*
		require
			a_string_not_void: a_string /= Void
		do
			create Result.make (a_string.count)
			append_eiffel_string (Result, a_string)
		ensure
			instance_free: class
			eiffel_string_out_not_void: Result /= Void
		end

	quoted_eiffel_string_out (a_string: STRING): STRING
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
			create Result.make (a_string.count + 2)
			append_quoted_eiffel_string (Result, a_string)
		ensure
			instance_free: class
			quoted_eiffel_string_out_not_void: Result /= Void
		end

	left_padded_string_out (a_string: STRING; a_length: INTEGER; c: CHARACTER): STRING
			-- Clone of `a_string', padded on the left with `c' characters
			-- if `a_string' is less than `a_length' characters long;
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
			Result := STRING_.new_empty_string (a_string, nb)
			append_left_padded_string (Result, a_string, a_length, c)
		ensure
			instance_free: class
			left_padded_string_out_not_void: Result /= Void
		end

feature -- String handling

	append_eiffel_string (a_target: STRING; a_string: STRING)
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
					a_target.append_character ('%%')
					a_target.append_character ('B')
				when '%F' then
					a_target.append_character ('%%')
					a_target.append_character ('F')
				when '%N' then
					a_target.append_character ('%%')
					a_target.append_character ('N')
				when '%R' then
					a_target.append_character ('%%')
					a_target.append_character ('R')
				when '%T' then
					a_target.append_character ('%%')
					a_target.append_character ('T')
				when '%U' then
					a_target.append_character ('%%')
					a_target.append_character ('U')
				when '%%' then
					a_target.append_character ('%%')
					a_target.append_character ('%%')
				when '%'' then
					a_target.append_character ('%%')
					a_target.append_character ('%'')
				when '%"' then
					a_target.append_character ('%%')
					a_target.append_character ('%"')
				else
					a_target.append_character ('%%')
					a_target.append_character ('/')
					INTEGER_.append_decimal_integer (a_string.item_code (i), a_target)
					a_target.append_character ('/')
				end
				i := i + 1
			end
		ensure
			instance_free: class
		end

	append_quoted_eiffel_string (a_target: STRING; a_string: STRING)
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
		ensure
			instance_free: class
		end

	append_left_padded_string (a_target: STRING; a_string: STRING; a_length: INTEGER; c: CHARACTER)
			-- Append `a_string' to `a_target', padded on the
			-- left with `c' characters if `a_string' is less
			-- than `a_length' character long.
		require
			a_target_not_void: a_target /= Void
			a_string_not_void: a_string /= Void
			same_type: ANY_.same_types (a_string, a_target)
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
		ensure
			instance_free: class
		end

feature -- File handling

	put_eiffel_string (a_file: KI_CHARACTER_OUTPUT_STREAM; a_string: STRING)
			-- Write `a_string' to `a_file', where all
			-- non-printable characters are replaced by their
			-- escaped character sequence as described in
			-- ETL, section 25.15, page 422.
		require
			a_file_not_void: a_file /= Void
			a_file_is_open_write: a_file.is_open_write
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
					INTEGER_FORMATTER_.put_decimal_integer (a_file, a_string.item_code (i))
					a_file.put_character ('/')
				end
				i := i + 1
			end
		ensure
			instance_free: class
		end

	put_quoted_eiffel_string (a_file: KI_CHARACTER_OUTPUT_STREAM; a_string: STRING)
			-- Write `a_string', surrounded by double quotes, to
			-- `a_file', where all non-printable characters are
			-- replaced by their escaped character sequence as
			-- described in ETL, section 25.15, page 422.
		require
			a_file_not_void: a_file /= Void
			a_file_is_open_write: a_file.is_open_write
			a_string_not_void: a_string /= Void
		do
			a_file.put_character ('%"')
			put_eiffel_string (a_file, a_string)
			a_file.put_character ('%"')
		ensure
			instance_free: class
		end

	put_left_padded_string (a_file: KI_CHARACTER_OUTPUT_STREAM; a_string: STRING; a_length: INTEGER; c: CHARACTER)
			-- Write `a_string' to `a_file', padded on the left with `c'
			-- characters if `a_string' is less than `a_length' characters long.
			-- Note: If `a_string' is a UC_STRING or descendant, then
			-- write the bytes of its associated UTF unicode encoding,
			-- and pad them on the left with `c' characters.
		require
			a_file_not_void: a_file /= Void
			a_file_is_open_write: a_file.is_open_write
			a_string_not_void: a_string /= Void
			a_length_positive: a_length >= 0
		local
			i, nb: INTEGER
			a_string_string: STRING
		do
			a_string_string := STRING_.as_string (a_string)
			nb := a_length - a_string_string.count
			from i := 1 until i > nb loop
				a_file.put_character (c)
				i := i + 1
			end
			a_file.put_string (a_string_string)
		ensure
			instance_free: class
		end

end
