indexing

	description:

		"Integer formatters"

	library:    "Gobo Eiffel Utility Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class UT_INTEGER_FORMATTER

inherit

	KL_IMPORTED_STRING_ROUTINES
	KL_IMPORTED_OUTPUT_STREAM_ROUTINES

feature -- Access

	decimal_integer_out (an_int: INTEGER): STRING is
			-- Decimal representation of `an_int';
			-- Return a new string at each call.
			-- Regexp: -?(0|[1-9][0-9]*)
		do
			Result := STRING_.make (10)
			append_decimal_integer (Result, an_int)
		ensure
			decimal_integer_out_not_void: Result /= Void
		end

	octal_integer_out (an_int: INTEGER): STRING is
			-- Octal representation of `an_int';
			-- Return a new string at each call.
			-- Regexp: 0|[1-7][0-7]*
		require
			an_int_positive: an_int >= 0
		do
			Result := STRING_.make (10)
			append_octal_integer (Result, an_int)
		ensure
			octal_integer_out_not_void: Result /= Void
		end

feature -- String handling

	append_decimal_integer (a_string: STRING; an_int: INTEGER) is
			-- Append decimal representation of `an_int' to `a_string'.
		require
			a_string_not_void: a_string /= Void
		local
			j, k, i, nb: INTEGER
			c: CHARACTER
		do
			if an_int < 0 then
				a_string.append_character ('-')
			end
			if an_int = 0 then
				a_string.append_character ('0')
			else
				from k := an_int until k = 0 loop
					inspect k \\ 10
					when 0 then
						a_string.append_character ('0')
					when 1 then
						a_string.append_character ('1')
					when 2 then
						a_string.append_character ('2')
					when 3 then
						a_string.append_character ('3')
					when 4 then
						a_string.append_character ('4')
					when 5 then
						a_string.append_character ('5')
					when 6 then
						a_string.append_character ('6')
					when 7 then
						a_string.append_character ('7')
					when 8 then
						a_string.append_character ('8')
					when 9 then
						a_string.append_character ('9')
					end
					k := k // 10
					nb := nb + 1
				end
				from
					j := a_string.count
					i := j - nb + 1
				until
					i >= j
				loop
					c := a_string.item (i)
					a_string.put (a_string.item (j), i)
					a_string.put (c, j)
					i := i + 1
					j := j - 1
				end
			end
		end

	append_octal_integer (a_string: STRING; an_int: INTEGER) is
			-- Append octal representation of `an_int' to `a_string'.
		require
			a_string_not_void: a_string /= Void
			an_int_positive: an_int >= 0
		local
			j, k, i, nb: INTEGER
			c: CHARACTER
		do
			if an_int = 0 then
				a_string.append_character ('0')
			else
				from k := an_int until k = 0 loop
					inspect k \\ 8
					when 0 then
						a_string.append_character ('0')
					when 1 then
						a_string.append_character ('1')
					when 2 then
						a_string.append_character ('2')
					when 3 then
						a_string.append_character ('3')
					when 4 then
						a_string.append_character ('4')
					when 5 then
						a_string.append_character ('5')
					when 6 then
						a_string.append_character ('6')
					when 7 then
						a_string.append_character ('7')
					end
					k := k // 8
					nb := nb + 1
				end
				from
					j := a_string.count
					i := j - nb + 1
				until
					i >= j
				loop
					c := a_string.item (i)
					a_string.put (a_string.item (j), i)
					a_string.put (c, j)
					i := i + 1
					j := j - 1
				end
			end
		end

feature -- File handling

	put_decimal_integer (a_file: like OUTPUT_STREAM_TYPE; an_int: INTEGER) is
			-- Write decimal representation of `an_int' to `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_is_open_write: OUTPUT_STREAM_.is_open_write (a_file)
		do
			a_file.put_string (decimal_integer_out (an_int))
		end

	put_octal_integer (a_file: like OUTPUT_STREAM_TYPE; an_int: INTEGER) is
			-- Write octal representation of `an_int' to `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_is_open_write: OUTPUT_STREAM_.is_open_write (a_file)
		do
			a_file.put_string (octal_integer_out (an_int))
		end

end -- class UT_INTEGER_FORMATTER
