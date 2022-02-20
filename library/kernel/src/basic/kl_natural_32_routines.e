note

	description:

		"Routines that ought to be in class NATURAL_32"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2019-2022, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class KL_NATURAL_32_ROUTINES

inherit

	KL_IMPORTED_ANY_ROUTINES

feature -- Conversion

	to_hexadecimal (an_int: NATURAL_32; uppercase: BOOLEAN): STRING
			-- Hexadecimal representation of `an_int';
			-- Return a new string at each call.
		do
				-- Max 8 hexadecimal digits for 32-bits.
			create Result.make (8)
			append_hexadecimal_integer (an_int, Result, uppercase)
		ensure
			instance_free: class
			hexadecimal_not_void: Result /= Void
			is_string: ANY_.same_types (Result, "")
--			regexp_uppercase: uppercase implies (0|[1-9A-F][0-9A-F]*).recognizes (Result)
--			regexp_lowercase: not uppercase implies (0|[1-9a-f][0-9a-f]*).recognizes (Result)
		end

feature -- Output

	append_decimal_integer (an_int: NATURAL_32; a_string: STRING_GENERAL)
			-- Append decimal representation of `an_int' to `a_string'.
			-- Note: works even when `a_string' is a UC_STRING.
		require
			a_string_not_void: a_string /= Void
		local
			i, k: NATURAL_32
		do
			if an_int = 0 then
				a_string.append_code ({UC_CHARACTER_CODES}.zero_code)
			else
				k := an_int
				i := k // 10
				if i /= 0 then
					append_decimal_integer (i, a_string)
				end
				inspect k \\ 10
				when 0 then
					a_string.append_code ({UC_CHARACTER_CODES}.zero_code)
				when 1 then
					a_string.append_code ({UC_CHARACTER_CODES}.one_code)
				when 2 then
					a_string.append_code ({UC_CHARACTER_CODES}.two_code)
				when 3 then
					a_string.append_code ({UC_CHARACTER_CODES}.three_code)
				when 4 then
					a_string.append_code ({UC_CHARACTER_CODES}.four_code)
				when 5 then
					a_string.append_code ({UC_CHARACTER_CODES}.five_code)
				when 6 then
					a_string.append_code ({UC_CHARACTER_CODES}.six_code)
				when 7 then
					a_string.append_code ({UC_CHARACTER_CODES}.seven_code)
				when 8 then
					a_string.append_code ({UC_CHARACTER_CODES}.eight_code)
				when 9 then
					a_string.append_code ({UC_CHARACTER_CODES}.nine_code)
				end
			end
		ensure
			instance_free: class
--			regexp: (0|([1-9][0-9]*)).recognizes (a_string.substring (old a_string.count + 1, a_string.count))
		end

	append_hexadecimal_integer (an_int: NATURAL_32; a_string: STRING; uppercase: BOOLEAN)
			-- Append a hexadecimal representation of `an_int' to `a_string'.
			-- Note: works even when `a_string' is a UC_STRING.
		require
			a_string_not_void: a_string /= Void
		local
			k: NATURAL_32
		do
			if an_int = 0 then
				a_string.append_character ('0')
			else
				k := an_int // 16
				if k /= 0 then
					append_hexadecimal_integer (k, a_string, uppercase)
				end
				inspect an_int \\ 16
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
				when 10 then
					if uppercase then
						a_string.append_character ('A')
					else
						a_string.append_character ('a')
					end
				when 11 then
					if uppercase then
						a_string.append_character ('B')
					else
						a_string.append_character ('b')
					end
				when 12 then
					if uppercase then
						a_string.append_character ('C')
					else
						a_string.append_character ('c')
					end
				when 13 then
					if uppercase then
						a_string.append_character ('D')
					else
						a_string.append_character ('d')
					end
				when 14 then
					if uppercase then
						a_string.append_character ('E')
					else
						a_string.append_character ('e')
					end
				when 15 then
					if uppercase then
						a_string.append_character ('F')
					else
						a_string.append_character ('f')
					end
				end
			end
		ensure
			instance_free: class
--			regexp_uppercase: uppercase implies (0|[1-9A-F][0-9A-F]*).recognizes (a_string.substring (old a_string.count + 1, a_string.count))
--			regexp_lowercase: not uppercase implies (0|[1-9a-f][0-9a-f]*).recognizes (a_string.substring (old a_string.count + 1, a_string.count))
		end

end
