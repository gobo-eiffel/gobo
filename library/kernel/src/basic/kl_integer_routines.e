note

	description:

		"Routines that ought to be in class INTEGER"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 1999-2020, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class KL_INTEGER_ROUTINES

inherit

	KL_SHARED_PLATFORM

	KL_IMPORTED_STRING_ROUTINES

	KL_IMPORTED_ANY_ROUTINES

feature -- Conversion

	to_character (an_int: INTEGER): CHARACTER_8
			-- Character whose code is `an_int'
		require
			an_int_large_enough: an_int >= Platform.Minimum_character_code
			an_int_small_enough: an_int <= Platform.Maximum_character_code
		do
			Result := an_int.to_character_8
		ensure
			instance_free: class
			valid_character_code: Result.code = an_int
		end

	to_hexadecimal (an_int: INTEGER; uppercase: BOOLEAN): STRING_8
			-- Hexadecimal representation of `an_int';
			-- Return a new string at each call.
		require
			an_int_positive: an_int >= 0
		do
				-- Max 8 hexadecimal digits for 32-bits.
			create Result.make (8)
			append_hexadecimal_integer (an_int, Result, uppercase)
		ensure
			instance_free: class
			hexadecimal_not_void: Result /= Void
			is_string: ANY_.same_types (Result, {STRING_8} "")
--			regexp_uppercase: uppercase implies (0|[1-9A-F][0-9A-F]*).recognizes (Result)
--			regexp_lowercase: not uppercase implies (0|[1-9a-f][0-9a-f]*).recognizes (Result)
		end

	to_decimal (an_int: INTEGER): STRING_8
			-- Decimal representation of `an_int';
			-- Return a new string at each call.
		do
			create Result.make (10)
			append_decimal_integer (an_int, Result)
		ensure
			instance_free: class
			decimal_not_void: Result /= Void
			is_string: ANY_.same_types (Result, {STRING_8} "")
--			regexp: (0|(-?[1-9][0-9]*)).recognizes (Result)
		end

	to_octal (an_int: INTEGER): STRING_8
			-- Octal representation of `an_int';
			-- Return a new string at each call.
		require
			an_int_positive: an_int >= 0
		do
			create Result.make (10)
			append_octal_integer (an_int, Result)
		ensure
			instance_free: class
			octal_not_void: Result /= Void
			is_string: ANY_.same_types (Result, {STRING_8} "")
--			regexp: (0|[1-7][0-7]*).recognizes (Result)
		end

	to_integer (an_int: INTEGER): INTEGER
			-- Return `an_int';
			-- This can be used to force integer manifest constants to
			-- be of INTEGER type -- some versions of SmartEiffel use
			-- the smallest possible INTEGER_* type. A manifest array
			-- can thus be forced to be of type ARRAY [INTEGER].
		do
			Result := an_int
		ensure
			instance_free: class
			definition: Result = an_int
		end

	to_integer_8 (an_int: INTEGER): INTEGER_8
			-- Convert to INTEGER_8
		require
			an_int_large_enouh: an_int >= -128
			an_int_small_enouh: an_int <= 127
		do
			Result := an_int.to_integer_8
		ensure
			instance_free: class
		end

feature -- Output

	append_decimal_integer (an_int: INTEGER; a_string: STRING_GENERAL)
			-- Append decimal representation of `an_int' to `a_string'.
			-- Note: works even when `a_string' is a UC_STRING.
		require
			a_string_not_void: a_string /= Void
		local
			i, k: INTEGER
		do
			if an_int = 0 then
				a_string.append_code ({UC_CHARACTER_CODES}.zero_code)
			elseif an_int < 0 then
				a_string.append_code ({UC_CHARACTER_CODES}.minus_code)
					-- Avoid overflow.
				k := -(an_int + 1)
				i := k // 10
				inspect k \\ 10
				when 0 then
					if i /= 0 then
						append_decimal_integer (i, a_string)
					end
					a_string.append_code ({UC_CHARACTER_CODES}.one_code)
				when 1 then
					if i /= 0 then
						append_decimal_integer (i, a_string)
					end
					a_string.append_code ({UC_CHARACTER_CODES}.two_code)
				when 2 then
					if i /= 0 then
						append_decimal_integer (i, a_string)
					end
					a_string.append_code ({UC_CHARACTER_CODES}.three_code)
				when 3 then
					if i /= 0 then
						append_decimal_integer (i, a_string)
					end
					a_string.append_code ({UC_CHARACTER_CODES}.four_code)
				when 4 then
					if i /= 0 then
						append_decimal_integer (i, a_string)
					end
					a_string.append_code ({UC_CHARACTER_CODES}.five_code)
				when 5 then
					if i /= 0 then
						append_decimal_integer (i, a_string)
					end
					a_string.append_code ({UC_CHARACTER_CODES}.six_code)
				when 6 then
					if i /= 0 then
						append_decimal_integer (i, a_string)
					end
					a_string.append_code ({UC_CHARACTER_CODES}.seven_code)
				when 7 then
					if i /= 0 then
						append_decimal_integer (i, a_string)
					end
					a_string.append_code ({UC_CHARACTER_CODES}.eight_code)
				when 8 then
					if i /= 0 then
						append_decimal_integer (i, a_string)
					end
					a_string.append_code ({UC_CHARACTER_CODES}.nine_code)
				when 9 then
					append_decimal_integer (i + 1, a_string)
					a_string.append_code ({UC_CHARACTER_CODES}.zero_code)
				end
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
--			regexp: (0|(-?[1-9][0-9]*)).recognizes (a_string.substring (old a_string.count + 1, a_string.count))
		end

	append_octal_integer (an_int: INTEGER; a_string: STRING_GENERAL)
			-- Append octal representation of `an_int' to `a_string'.
			-- Note: works even when `a_string' is a UC_STRING.
		require
			an_int_positive: an_int >= 0
			a_string_not_void: a_string /= Void
		local
			k: INTEGER
		do
			if an_int = 0 then
				a_string.append_code ({UC_CHARACTER_CODES}.zero_code)
			else
				k := an_int // 8
				if k /= 0 then
					append_octal_integer (k, a_string)
				end
				inspect an_int \\ 8
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
				end
			end
		ensure
			instance_free: class
--			regexp: (0|[1-7][0-7]*).recognizes (a_string.substring (old a_string.count + 1, a_string.count))
		end

	append_hexadecimal_integer (an_int: INTEGER; a_string: STRING_GENERAL; uppercase: BOOLEAN)
			-- Append a hexadecimal representation of `an_int' to `a_string'.
			-- Note: works even when `a_string' is a UC_STRING.
		require
			an_int_positive: an_int >= 0
			a_string_not_void: a_string /= Void
		local
			k: INTEGER
		do
			if an_int = 0 then
				a_string.append_code ({UC_CHARACTER_CODES}.zero_code)
			else
				k := an_int // 16
				if k /= 0 then
					append_hexadecimal_integer (k, a_string, uppercase)
				end
				inspect an_int \\ 16
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
				when 10 then
					if uppercase then
						a_string.append_code ({UC_CHARACTER_CODES}.upper_a_code)
					else
						a_string.append_code ({UC_CHARACTER_CODES}.lower_a_code)
					end
				when 11 then
					if uppercase then
						a_string.append_code ({UC_CHARACTER_CODES}.upper_b_code)
					else
						a_string.append_code ({UC_CHARACTER_CODES}.lower_b_code)
					end
				when 12 then
					if uppercase then
						a_string.append_code ({UC_CHARACTER_CODES}.upper_c_code)
					else
						a_string.append_code ({UC_CHARACTER_CODES}.lower_c_code)
					end
				when 13 then
					if uppercase then
						a_string.append_code ({UC_CHARACTER_CODES}.upper_d_code)
					else
						a_string.append_code ({UC_CHARACTER_CODES}.lower_d_code)
					end
				when 14 then
					if uppercase then
						a_string.append_code ({UC_CHARACTER_CODES}.upper_e_code)
					else
						a_string.append_code ({UC_CHARACTER_CODES}.lower_e_code)
					end
				when 15 then
					if uppercase then
						a_string.append_code ({UC_CHARACTER_CODES}.upper_f_code)
					else
						a_string.append_code ({UC_CHARACTER_CODES}.lower_f_code)
					end
				end
			end
		ensure
			instance_free: class
--			regexp_uppercase: uppercase implies (0|[1-9A-F][0-9A-F]*).recognizes (a_string.substring (old a_string.count + 1, a_string.count))
--			regexp_lowercase: not uppercase implies (0|[1-9a-f][0-9a-f]*).recognizes (a_string.substring (old a_string.count + 1, a_string.count))
		end

feature -- Operation(s)

	div (x, n: INTEGER): INTEGER
			-- Integer division of `x' by `n'
			-- (Use ISO C99 specification)
		require
			divisible: n /= 0
			overflow: x = Platform.Minimum_integer implies n /= -1
		do
			Result := x // n
		ensure
			instance_free: class
			definition: Result * n + mod (x, n) = x
		end

	mod (x, n: INTEGER): INTEGER
			-- Reminder of the integer division of `x' by `n'
			-- (Use ISO C99 specification)
		require
			divisible: n /= 0
		do
			Result := x \\ n
		ensure
			instance_free: class
			definition1: n /= Platform.Minimum_integer implies Result.abs < n.abs
			definition2: n = Platform.Minimum_integer implies Result.abs <= Platform.Maximum_integer
			iso_c99: Result /= 0 implies Result.sign = x.sign
		end

	power (x, n: INTEGER): INTEGER
			-- Integer `x' to the power of `n' (`x' ^ `n')
		require
			positive_n: n >= 0
		do
			if n = 0 then
				Result := 1
			elseif n = 1 then
				Result := x
			elseif x /= 0 then
				if is_even (n) then
						-- x ^ 2N = (x ^ N) ^ 2
					Result := power (x, n // 2)
					Result := Result * Result
				else
					Result := power (x, n - 1) * x
				end
			end
		ensure
			instance_free: class
			zero_power_n: x = 0 and n /= 0 implies Result = 0
			x_power_0: n = 0 implies Result = 1
			recursive_definition: n > 0 implies (Result = x * power (x, n - 1))
		end

	bit_and (m, n: INTEGER): INTEGER
			-- Bitwise 'and' between `m' and `n'
		do
			Result := m.bit_and (n)
		ensure
			instance_free: class
		end

	bit_or (m, n: INTEGER): INTEGER
			-- Bitwise 'or' between `m' and `n'
		do
			Result := m.bit_or (n)
		ensure
			instance_free: class
		end

	bit_xor (m, n: INTEGER): INTEGER
			-- Bitwise 'xor' between `m' and `n'
		do
			Result := m.bit_xor (n)
		ensure
			instance_free: class
		end

	bit_not (n: INTEGER): INTEGER
			-- Bitwise 'not' of `n'
		do
			Result := n.bit_not
		ensure
			instance_free: class
		end

	bit_shift_left (m, n: INTEGER): INTEGER
			-- `m' shifted `n' bits to left;
			-- Note: The new bits added on the right are 0.
		require
			thirty_two_bit_shift: 0 <= n and n < 32
		do
			Result := m.bit_shift_left (n)
		ensure
			instance_free: class
		end

	bit_shift_right (m, n: INTEGER): INTEGER
			-- `m' shifted `n' bits to right;
			-- Note: If the first bit of `m' is set (i.e. the sign bit), then
			-- the new bits added on the left are 1; otherwise they are 0.
		require
			thirty_two_bit_shift: 0 <= n and n < 32
		do
			Result := m.bit_shift_right (n)
		ensure
			instance_free: class
		end

feature -- Status report

	is_even (an_int: INTEGER): BOOLEAN
			-- Is `an_int' an even integer?
		do
			Result := an_int \\ 2 = 0
		ensure
			instance_free: class
			definition: Result = (an_int \\ 2 = 0)
		end

end
