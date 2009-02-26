indexing

	description:

		"Integer formatters"

	library: "Gobo Eiffel Utility Library"
	copyright: "Copyright (c) 1999-2004, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class UT_INTEGER_FORMATTER

inherit

	ANY -- Export features of ANY.

	KL_IMPORTED_INTEGER_ROUTINES

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
			elseif an_int < 0 then
				a_file.put_character ('-')
					-- Avoid overflow.
				k := -(an_int + 1)
				i := k // 10
				inspect k \\ 10
				when 0 then
					if i /= 0 then
						put_decimal_integer (a_file, i)
					end
					a_file.put_character ('1')
				when 1 then
					if i /= 0 then
						put_decimal_integer (a_file, i)
					end
					a_file.put_character ('2')
				when 2 then
					if i /= 0 then
						put_decimal_integer (a_file, i)
					end
					a_file.put_character ('3')
				when 3 then
					if i /= 0 then
						put_decimal_integer (a_file, i)
					end
					a_file.put_character ('4')
				when 4 then
					if i /= 0 then
						put_decimal_integer (a_file, i)
					end
					a_file.put_character ('5')
				when 5 then
					if i /= 0 then
						put_decimal_integer (a_file, i)
					end
					a_file.put_character ('6')
				when 6 then
					if i /= 0 then
						put_decimal_integer (a_file, i)
					end
					a_file.put_character ('7')
				when 7 then
					if i /= 0 then
						put_decimal_integer (a_file, i)
					end
					a_file.put_character ('8')
				when 8 then
					if i /= 0 then
						put_decimal_integer (a_file, i)
					end
					a_file.put_character ('9')
				when 9 then
					put_decimal_integer (a_file, i + 1)
					a_file.put_character ('0')
				end
			else
				k := an_int
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
