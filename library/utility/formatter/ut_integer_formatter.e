indexing

	description:

		"Integer formatters"

	library: "Gobo Eiffel Utility Library"
	copyright: "Copyright (c) 1999-2001, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class UT_INTEGER_FORMATTER

inherit

	KL_IMPORTED_STRING_ROUTINES
	KL_IMPORTED_INTEGER_ROUTINES

feature -- Access

	decimal_integer_out (an_int: INTEGER): STRING is
			-- Decimal representation of `an_int';
			-- Return a new string at each call.
			-- Regexp: 0|(-?[1-9][0-9]*)
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

	hexadecimal_integer_out (an_int: INTEGER; uppercase: BOOLEAN): STRING is
			-- Hexadecimal representation of `an_int';
			-- Return a new string at each call.
			-- Regexp:
			--    uppercase:      0|[1-9A-F][0-9A-F]*
			--    not uppercase:  0|[1-9a-f][0-9a-f]*
		require
			an_int_positive: an_int >= 0
		do
			Result := INTEGER_.to_hexadecimal (an_int, uppercase)
		ensure
			hexadecimal_integer_out_not_void: Result /= Void
		end

feature -- String handling

	append_decimal_integer (a_string: STRING; an_int: INTEGER) is
			-- Append decimal representation of `an_int' to `a_string'.
			-- Regexp: 0|(-?[1-9][0-9]*)
		require
			a_string_not_void: a_string /= Void
		local
			i, k: INTEGER
		do
			if an_int = 0 then
				a_string.append_character ('0')
			else
				if an_int < 0 then
					a_string.append_character ('-')
					k := -an_int
				else
					k := an_int
				end
				i := k // 10
				if i /= 0 then
					append_decimal_integer (a_string, i)
				end
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
			end
		end

	append_octal_integer (a_string: STRING; an_int: INTEGER) is
			-- Append octal representation of `an_int' to `a_string'.
			-- Regexp: 0|[1-7][0-7]*
		require
			a_string_not_void: a_string /= Void
			an_int_positive: an_int >= 0
		local
			k: INTEGER
		do
			if an_int = 0 then
				a_string.append_character ('0')
			else
				k := an_int // 8
				if k /= 0 then
					append_octal_integer (a_string, k)
				end
				inspect an_int \\ 8
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
			end
		end

	append_hexadecimal_integer (a_string: STRING; an_int: INTEGER; uppercase: BOOLEAN) is
			-- Append hexadecimal representation of `an_int' to `a_string'.
			-- Regexp:
			--    uppercase:      0|[1-9A-F][0-9A-F]*
			--    not uppercase:  0|[1-9a-f][0-9a-f]*
		require
			a_string_not_void: a_string /= Void
			an_int_positive: an_int >= 0
		do
			INTEGER_.append_hexadecimal_integer (a_string, an_int, uppercase)
		end

feature -- File handling

	put_decimal_integer (a_file: KI_CHARACTER_OUTPUT_STREAM; an_int: INTEGER) is
			-- Write decimal representation of `an_int' to `a_file'.
			-- Regexp: 0|(-?[1-9][0-9]*)
		require
			a_file_not_void: a_file /= Void
			a_file_is_open_write: a_file.is_open_write
		local
			i, k: INTEGER
		do
			if an_int = 0 then
				a_file.put_character ('0')
			else
				if an_int < 0 then
					a_file.put_character ('-')
					k := -an_int
				else
					k := an_int
				end
				i := k // 10
				if i /= 0 then
					put_decimal_integer (a_file, i)
				end
				inspect k \\ 10
				when 0 then
					a_file.put_character ('0')
				when 1 then
					a_file.put_character ('1')
				when 2 then
					a_file.put_character ('2')
				when 3 then
					a_file.put_character ('3')
				when 4 then
					a_file.put_character ('4')
				when 5 then
					a_file.put_character ('5')
				when 6 then
					a_file.put_character ('6')
				when 7 then
					a_file.put_character ('7')
				when 8 then
					a_file.put_character ('8')
				when 9 then
					a_file.put_character ('9')
				end
			end
		end

	put_octal_integer (a_file: KI_CHARACTER_OUTPUT_STREAM; an_int: INTEGER) is
			-- Write octal representation of `an_int' to `a_file'.
			-- Regexp: 0|[1-7][0-7]*
		require
			a_file_not_void: a_file /= Void
			a_file_is_open_write: a_file.is_open_write
			an_int_positive: an_int >= 0
		local
			k: INTEGER
		do
			if an_int = 0 then
				a_file.put_character ('0')
			else
				k := an_int // 8
				if k /= 0 then
					put_octal_integer (a_file, k)
				end
				inspect an_int \\ 8
				when 0 then
					a_file.put_character ('0')
				when 1 then
					a_file.put_character ('1')
				when 2 then
					a_file.put_character ('2')
				when 3 then
					a_file.put_character ('3')
				when 4 then
					a_file.put_character ('4')
				when 5 then
					a_file.put_character ('5')
				when 6 then
					a_file.put_character ('6')
				when 7 then
					a_file.put_character ('7')
				end
			end
		end

	put_hexadecimal_integer (a_file: KI_CHARACTER_OUTPUT_STREAM; an_int: INTEGER; uppercase: BOOLEAN) is
			-- Write hexadecimal representation of `an_int' to `a_file'.
			-- Regexp:
			--    uppercase:      0|[1-9A-F][0-9A-F]*
			--    not uppercase:  0|[1-9a-f][0-9a-f]*
		require
			a_file_not_void: a_file /= Void
			a_file_is_open_write: a_file.is_open_write
			an_int_positive: an_int >= 0
		local
			k: INTEGER
		do
			if an_int = 0 then
				a_file.put_character ('0')
			else
				k := an_int // 16
				if k /= 0 then
					put_hexadecimal_integer (a_file, k, uppercase)
				end
				inspect an_int \\ 16
				when 0 then
					a_file.put_character ('0')
				when 1 then
					a_file.put_character ('1')
				when 2 then
					a_file.put_character ('2')
				when 3 then
					a_file.put_character ('3')
				when 4 then
					a_file.put_character ('4')
				when 5 then
					a_file.put_character ('5')
				when 6 then
					a_file.put_character ('6')
				when 7 then
					a_file.put_character ('7')
				when 8 then
					a_file.put_character ('8')
				when 9 then
					a_file.put_character ('9')
				when 10 then
					if uppercase then
						a_file.put_character ('A')
					else
						a_file.put_character ('a')
					end
				when 11 then
					if uppercase then
						a_file.put_character ('B')
					else
						a_file.put_character ('b')
					end
				when 12 then
					if uppercase then
						a_file.put_character ('C')
					else
						a_file.put_character ('c')
					end
				when 13 then
					if uppercase then
						a_file.put_character ('D')
					else
						a_file.put_character ('d')
					end
				when 14 then
					if uppercase then
						a_file.put_character ('E')
					else
						a_file.put_character ('e')
					end
				when 15 then
					if uppercase then
						a_file.put_character ('F')
					else
						a_file.put_character ('f')
					end
				end
			end
		end

end
