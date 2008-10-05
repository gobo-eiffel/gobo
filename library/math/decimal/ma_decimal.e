indexing

	description:

		"DECIMAL numbers. Following the 'General Decimal Arithmetic Specification'."

	library: "Gobo Eiffel Decimal Arithmetic Library"
	copyright: "Copyright (c) 2004, Paul G. Crismer and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class MA_DECIMAL

inherit

	KL_NUMERIC
		redefine
			out,
			is_equal,
			copy
		end

	HASHABLE
		undefine
			out,
			is_equal,
			copy
		end

	KL_PART_COMPARABLE
		undefine
			out,
			is_equal,
			copy
		end

	MA_SHARED_DECIMAL_CONTEXT
		undefine
			out,
			is_equal,
			copy
		end

	MA_SHARED_DECIMAL_CONSTANTS
		undefine
			out,
			is_equal,
			copy
		end

	MA_DECIMAL_CONTEXT_CONSTANTS
		export
			{NONE} all
		undefine
			out,
			is_equal,
			copy
		end

	KL_IMPORTED_INTEGER_ROUTINES
		export
			{NONE} all
		undefine
			out,
			is_equal,
			copy
		end

	KL_IMPORTED_DOUBLE_ROUTINES
		export
			{NONE} all
		undefine
			out,
			is_equal,
			copy
		end

	KL_IMPORTED_STRING_ROUTINES
		export
			{NONE} all
		undefine
			out,
			is_equal,
			copy
		end

	KL_SHARED_PLATFORM
		export
			{NONE} all
		undefine
			out,
			is_equal,
			copy
		end

create

	make_from_integer,
	make_from_string,
	make_from_string_ctx,
	make_copy,
	make_zero,
	make_one,
	make

create {MA_DECIMAL}

	make_infinity,
	make_nan,
	make_snan,
	make_special

create {MA_DECIMAL_TEXT_PARSER}

	make_from_parser

feature {NONE} -- Initialization

	make (a_precision: INTEGER) is
			-- Create a new decimal using `a_precision' digits.
		require
			a_precision_positive: a_precision > 0
		do
			create {MA_DECIMAL_COEFFICIENT_IMP} coefficient.make (a_precision)
			set_positive
			coefficient.put (0, 0)
		ensure
			zero: is_zero
		end

	make_copy (other: like Current) is
			-- Make a copy of `other'.
		require
			other_not_void: other /= Void
		do
			if not other.is_special then
				make (other.count)
				copy (other)
			else
				make_special (other.special)
				is_negative := other.is_negative
			end
		ensure
			special_copy: special = other.special
			coefficient_copy: coefficient.is_equal (other.coefficient)
			sign_copy: sign = other.sign
			exponent_copy: exponent = other.exponent
		end

	make_zero is
			-- Make zero.
		do
			coefficient := special_coefficient
		ensure
			zero: is_zero
		end

	make_one is
			-- Make one.
		do
			make (1)
			coefficient.put (1, 0)
		ensure
			is_one: is_one
			positive: not is_negative
		end

	make_from_integer (a_value: INTEGER) is
			-- Make a new decimal from integer `a_value'.
		local
			temp_value, v, index, ten_exponent: INTEGER
		do
				-- Sign handling.
			temp_value := a_value
			if a_value >= 0 then
				set_positive
				temp_value := -temp_value
			else
				set_negative
			end
			v := temp_value
				-- Calculate size of coefficient.
			from
				ten_exponent := 0
			until
				v = 0
			loop
				v := INTEGER_.div (v, 10)
				if v /= 0 then
					ten_exponent := ten_exponent + 1
				end
			end
				-- Create coefficient.
			create {MA_DECIMAL_COEFFICIENT_IMP} coefficient.make (ten_exponent + 1)
				-- Fill it, from least significant digit (lower index) to most significant (upper index) digit.
			if temp_value = 0 then
				coefficient.put (0, 0)
			else
				from
						-- ten_exponent
					index := 0
					v := temp_value
				until
					v = 0
				loop
					coefficient.put (-INTEGER_.mod (v, 10), index)
					v := INTEGER_.div (v, 10)
					if v /= 0 then
						index := index + 1
					end
				end
			end
		ensure
			equal_to_value: to_integer = a_value
		end

	make_from_string_ctx (value_string: STRING; ctx: MA_DECIMAL_CONTEXT) is
			-- Make a new decimal from `value_string' relative to `ctx'.
		require
			value_string_not_void: value_string /= Void
			context_not_void: ctx /= Void
		local
			l_parser: like parser
		do
			l_parser := parser
			l_parser.decimal_parse (value_string)
			make_from_parser (l_parser, ctx)
		end

	make_from_parser (a_decimal_parser: MA_DECIMAL_TEXT_PARSER; a_context: MA_DECIMAL_CONTEXT) is
			-- Make from `a_decimal_parser', relative to `a_context'.
		require
			a_decimal_parser_not_void: a_decimal_parser /= Void
			a_context_not_void: a_context /= Void
		do
			if a_decimal_parser.error then
				if a_context.is_extended then
					make_nan
				else
					make_snan
				end
			else
				if a_decimal_parser.is_infinity then
					make_infinity (parser.sign)
				elseif a_decimal_parser.is_snan then
					make_snan
				elseif a_decimal_parser.is_nan then
					make_nan
				else
					if a_decimal_parser.sign < 0 then
						set_negative
					else
						set_positive
					end
					if a_decimal_parser.has_exponent then
						if a_decimal_parser.exponent_as_double > Platform.Maximum_integer then
							exponent := a_context.Maximum_exponent + a_context.digits + a_decimal_parser.exponent_count + 2
						else
							exponent := DOUBLE_.truncated_to_integer (a_decimal_parser.exponent_as_double)
						end
						if parser.exponent_sign < 0 then
							exponent := -exponent
						end
					else
						exponent := 0
					end
					if a_decimal_parser.has_point then
						exponent := exponent - a_decimal_parser.fractional_part_count
					end
					create {MA_DECIMAL_COEFFICIENT_IMP} coefficient.make ((a_context.digits + 1).max (a_decimal_parser.coefficient_count))
					coefficient.set_from_substring (a_decimal_parser.last_parsed, a_decimal_parser.coefficient_begin, a_decimal_parser.coefficient_end)
					clean_up (a_context)
				end
			end
		end

	make_from_string (value_string: STRING) is
			-- Make a new decimal from string `value_string' relative to `shared_decimal_context'.
		require
			value_string_not_void: value_string /= Void
		do
			make_from_string_ctx (value_string, shared_decimal_context)
		end

	make_special (code_special: INTEGER) is
			-- Make special from code.
		require
			valid_code_special: code_special = Special_infinity or else code_special = Special_quiet_nan
				or else code_special = Special_signaling_nan
		do
			coefficient := special_coefficient
			special := code_special
			exponent := 0
		ensure
			is_special: is_special
			exponent_zero: exponent = 0
		end

	make_nan is
			-- Make quiet 'Not a Number'.
		do
			make_special (Special_quiet_nan)
		ensure
			is_nan: is_quiet_nan
		end

	make_snan is
			-- Make Signaling 'Not a Number'.
		do
			make_special (Special_signaling_nan)
		ensure
			is_snan: is_signaling_nan
		end

	make_infinity (a_sign: INTEGER) is
			-- Make Infinity.
		require
			a_sign_valid: a_sign = -1 or else a_sign = 1
		do
			make_special (Special_infinity)
			is_negative := a_sign < 0
		ensure
			is_infinity: is_infinity
			sign_set: sign = a_sign
		end

feature -- Access

	sign: INTEGER is
			-- Sign: positive = 1; negative = -1
		do
			if is_negative then
				Result := -1
			else
				Result := 1
			end
		ensure
			definition1: Result = -1 implies is_negative
			definition2: Result = 1 implies is_positive
		end

	exponent: INTEGER
			-- Current exponent

	hash_code: INTEGER is
			-- Hash code value
		local
			i: INTEGER
			l_exponent, l_coefficient_lsd, l_coefficient_msd: INTEGER
			l_is_zero: BOOLEAN
		do
				-- 'One-at-a-Time Hash' from http://burtleburtle.net/bob/hash/doobs.html.
			l_is_zero := is_zero
			Result := special
			Result := Result + INTEGER_.bit_shift_left (Result, 10)
			Result := INTEGER_.bit_xor (Result, INTEGER_.bit_shift_right (Result, 6))
			if not l_is_zero then
				Result := Result + sign
			end
			Result := Result + INTEGER_.bit_shift_left (Result, 10)
			Result := INTEGER_.bit_xor (Result, INTEGER_.bit_shift_right (Result, 6))
			if not is_special then
					-- Adjust `l_exponent' and `l_coefficient_lsd'.
				from
					l_coefficient_msd := coefficient.msd_index
					l_coefficient_lsd := coefficient.lower
					l_exponent := exponent
				until
					l_coefficient_lsd > l_coefficient_msd or else coefficient.item (l_coefficient_lsd) /= 0
				loop
					l_coefficient_lsd := l_coefficient_lsd + 1
					l_exponent := l_exponent + 1
				end
					-- Exponent.
				if not l_is_zero then
					Result := Result + l_exponent
				end
				Result := Result + INTEGER_.bit_shift_left (Result, 10)
				Result := INTEGER_.bit_xor (Result, INTEGER_.bit_shift_right (Result, 6))
					-- Significant digits of exponent.
				from
					i := l_coefficient_lsd
				until
					i > l_coefficient_msd
				loop
					Result := Result + coefficient.item (i)
					Result := Result + INTEGER_.bit_shift_left (Result, 10)
					Result := INTEGER_.bit_xor (Result, INTEGER_.bit_shift_right (Result, 6))
					i := i + 1
				end
			end
			Result := Result + INTEGER_.bit_shift_left (Result, 3)
			Result := INTEGER_.bit_xor (Result, INTEGER_.bit_shift_right (Result, 11))
			Result := Result + INTEGER_.bit_shift_left (Result, 15)
			Result := INTEGER_.bit_and (Result, Platform.Maximum_integer)
		end

feature -- Constants

	one: like Current is
			-- Neutral element for "*" and "/"
		do
			Result := once_one
		ensure then
			one_is_one: Result.is_one
			one_is_positive: not Result.is_negative
		end

	minus_one: MA_DECIMAL is
			-- Minus one
		once
			create Result.make_copy (one)
			Result.set_negative
		ensure
			minus_one_not_void: Result /= Void
			is_minus_one: Result.is_one and then Result.is_negative
		end

	zero: like Current is
			-- Neutral element for "+" and "-"
		do
			Result := once_zero
		ensure then
			is_zero: Result.is_zero
		end

	negative_zero: MA_DECIMAL is
			-- Negative zero
		once
			create Result.make_zero
			Result.set_negative
		ensure
			negative_zero_not_void: Result /= Void
			is_zero: Result.is_zero
			is_negative: Result.is_negative
		end

	nan: MA_DECIMAL is
			-- Not a Number
		once
			create Result.make_nan
		ensure
			nan_not_void: Result /= Void
			is_nan: Result.is_nan
		end

	snan: MA_DECIMAL is
			-- Signaling Not a Number
		once
			create Result.make_snan
		ensure
			snan_not_void: Result /= Void
			is_snan: Result.is_signaling_nan
		end

	infinity: MA_DECIMAL is
			-- Infinity
		once
			create Result.make_infinity (1)
		ensure
			infinity_not_void: Result /= Void
			is_infinity: Result.is_infinity
			is_positive: Result.is_positive
		end

	negative_infinity: MA_DECIMAL is
			-- Negative infinity
		once
			create Result.make_infinity (-1)
		ensure
			negative_infinity_not_void: Result /= Void
			is_infinity: Result.is_infinity
			is_negative: Result.is_negative
		end

feature {MA_DECIMAL} -- Access

	adjusted_exponent: INTEGER is
			-- Exponent of the most significant digit; see SDAS page 5
		do
			Result := exponent + count - 1
		ensure
			definition: Result = (exponent + count - 1)
		end

feature {MA_DECIMAL, MA_DECIMAL_PARSER, MA_DECIMAL_HANDLER} -- Access

	coefficient: MA_DECIMAL_COEFFICIENT
			-- Storage for digits

feature -- Status report

	is_integer: BOOLEAN is
			-- Is this an integer?
			-- (i.e no fractional part other than all zeroes)
		local
			fractional_count, index: INTEGER
		do
			if is_zero then
				Result := True
			elseif exponent < 0 then
				if adjusted_exponent >= 0 then
					fractional_count := -exponent
					from
						index := fractional_count.min (count)
					variant
						index
					until
						index <= 0 or else coefficient.item (index - 1) /= 0
					loop
						index := index - 1
					end
					Result := index = 0
				else
					Result := False
				end
			else
				Result := True
			end
		end

	is_double: BOOLEAN is
			-- Is this a double?
		local
			str: STRING
		do
			str := to_scientific_string
			Result := str.is_double
		end

	divisible (other: like Current): BOOLEAN is
			-- May current object be divided by `other'?
		do
			Result := not other.is_zero
		ensure then
			definition: Result = not other.is_zero
		end

	exponentiable (other: NUMERIC): BOOLEAN is
			-- May current object be elevated to the power `other'?
		do
			--| TODO
		end

	is_negative: BOOLEAN
			-- Is the number negative?

	is_positive: BOOLEAN is
			-- Is the number positive?
		do
			Result := not is_negative
		ensure
			definition: Result = not is_negative
		end

	is_nan: BOOLEAN is
			-- Is this "Not a Number" (NaN)?
		do
			Result := is_signaling_nan or is_quiet_nan
		ensure
			definition: Result = (is_signaling_nan or is_quiet_nan)
		end

	is_special: BOOLEAN is
			-- Is this a special value?
		do
			Result := (special /= Special_none)
		ensure
			definition: Result = (is_nan or else is_infinity)
		end

	is_signaling_nan: BOOLEAN is
			-- Is this a "Signaling NaN"?
		do
			Result := (special = Special_signaling_nan)
		end

	is_quiet_nan: BOOLEAN is
			-- Is this a "Quiet NaN"?
		do
			Result := (special = Special_quiet_nan)
		end

	is_infinity: BOOLEAN is
			-- Is this an Infinity?
		do
			Result := (special = Special_infinity)
		end

	is_zero: BOOLEAN is
			-- Is this a Zero value?
		do
			if not is_special and then coefficient.is_zero then
				Result := True
			end
		ensure
			definition: Result = (not is_special and then coefficient.is_zero)
		end

	is_one: BOOLEAN is
			-- Is this a One ?
		do
			if not is_special and then exponent = 0 and then coefficient.is_one then
				Result := True
			end
		ensure
			definition: Result = (not is_special and then exponent = 0 and then coefficient.is_one)
		end

feature -- Basic operations

	infix "*" (other: like Current): like Current is
			-- Product by `other'
		do
			Result := multiply (other, shared_decimal_context)
		ensure then
			product_not_void: Result /= Void
		end

	prefix "+": like Current is
			-- Unary plus
		do
			Result := plus (shared_decimal_context)
		ensure then
			unary_plus_not_void: Result /= Void
		end

	infix "+" (other: like Current): like Current is
			-- Sum with `other' (commutative)
		do
			Result := add (other, shared_decimal_context)
		ensure then
			sum_not_void: Result /= Void
		end

	prefix "-": like Current is
			-- Unary minus
		do
			Result := minus (shared_decimal_context)
		ensure then
			unary_minus_not_void: Result /= Void
		end

	infix "-" (other: like Current): like Current is
			-- Result of subtracting `other'
		do
			Result := subtract (other, shared_decimal_context)
		ensure then
			subtract_not_void: Result /= Void
		end

	infix "/" (other: like Current): like Current is
			-- Division by `other'
		do
			Result := divide (other, shared_decimal_context)
		ensure then
			division_not_void: Result /= Void
		end

	infix "\\" (other: like Current): like Current is
			-- Remainder of integer division
		do
			Result := remainder (other, shared_decimal_context)
		ensure
			remainder_not_void: Result /= Void
		end

	infix "//" (other: like Current): like Current is
			-- Integer division
		do
			Result := divide_integer (other, shared_decimal_context)
		ensure
			integer_division_not_void: Result /= Void
		end

	infix "^" (other: NUMERIC): MA_DECIMAL is
			-- Current decimal to the power `other'
		do
			--| TODO
		end

	infix "<" (other: like Current): BOOLEAN is
			-- Is current decimal less than `other'?
		local
			res: MA_DECIMAL
		do
			res := compare (other, shared_decimal_context)
			if res.is_negative then
				Result := True
			end
		end

feature -- Measurement

	count: INTEGER is
			-- Count of significant digits
		do
			if is_special then
				Result := 0
			else
				Result := coefficient.count
			end
		ensure
			zero_when_special: is_special implies Result = 0
		end

feature -- Comparison

	is_equal (other: like Current): BOOLEAN is
			-- Are `Current' and `other' considered equal?
		local
			comparison_result: like Current
		do
			if is_nan and then other.is_nan then
				if is_quiet_nan then
					Result := other.is_quiet_nan
				elseif is_signaling_nan then
					Result := other.is_signaling_nan
				end
			elseif is_infinity and then other.is_infinity then
				Result := (sign = other.sign)
			else
				comparison_result := compare (other, shared_decimal_context)
				if comparison_result.is_zero then
					Result := True
				end
			end
		end

feature -- Conversion

	out: STRING is
			-- Printable representation
		do
			create Result.make (0)
			Result.append_string ("[")
				-- Sign.
			if is_negative then
				Result.append_string ("1")
			else
				Result.append_string ("0")
			end
				-- Coefficient.
			Result.append_string (",")
			if is_infinity then
				Result.append_string ("inf")
			elseif is_signaling_nan then
				Result.append_string ("sNaN")
			elseif is_quiet_nan then
				Result.append_string ("qNaN")
			else
				Result.append_string (coefficient.out)
					-- Exponent.
				Result.append_string (",")
				Result.append_string (exponent.out)
			end
			Result.append_string ("]")
		end

	to_double: DOUBLE is
			-- `Current' as a DOUBLE
		require
			is_double: is_double
		local
			str: STRING
		do
			str := to_scientific_string
			Result := str.to_double
		end

	to_integer: INTEGER is
			-- `Current' as an INTEGER
		require
			is_integer: is_integer
			large_enough: Current >= decimal.minimum_integer
			small_enough: Current <= decimal.maximum_integer
		local
			ctx: MA_DECIMAL_CONTEXT
		do
			create ctx.make_double
			Result := to_integer_ctx (ctx)
		end

	to_integer_ctx (ctx: MA_DECIMAL_CONTEXT): INTEGER is
			-- `Current' as an INTEGER wrt `ctx'
		require
			is_integer: is_integer
			large_enough: Current >= decimal.minimum_integer
			small_enough: Current <= decimal.maximum_integer
		local
			temp: like Current
			index: INTEGER
		do
			temp := round_to_integer (ctx)
			from
				index := temp.count - 1
				Result := 0
			variant
				index + 1
			until
				index < 0
			loop
				Result := Result * 10 + temp.coefficient.item (index)
				index := index - 1
			end
			if is_negative then
				Result := -Result
			end
		end

	to_engineering_string: STRING is
			-- `Current' as a number in engineering notation
		do
			Result := to_string_general (True)
		ensure
			to_string_not_void: Result /= Void
		end

	to_scientific_string: STRING is
			-- `Current' as a sting expressed in scientific notation
		do
			Result := to_string_general (False)
		ensure
			to_string_not_void: Result /= Void
		end

feature -- Duplication

	copy (other: like Current) is
			-- Copy `other' to current decimal.
		do
			if other /= Current then
				if coefficient = Void or else coefficient = special_coefficient then
					coefficient := other.coefficient.to_twin
				else
					coefficient.copy (other.coefficient)
				end
				exponent := other.exponent
				is_negative := other.is_negative
				special := other.special
			end
		end

feature -- Basic operations

	add (other: like Current; ctx: MA_DECIMAL_CONTEXT): like Current is
			-- Add `other' with respect to the `ctx' context
		require
			other_not_void: other /= Void
			ctx_not_void: ctx /= Void
		local
			operand_a, operand_b: like Current
		do
				-- Special values are handled in a special way.
			if is_special or else other.is_special then
				Result := add_special (other, ctx)
			else
					-- Addition of non-special values.
					-- Instantiate "registers" for destructive operations: operand_a and operand_b.
				create operand_a.make (ctx.digits + 1)
				operand_a.copy (Current)
				create operand_b.make (ctx.digits + 1)
				operand_b.copy (other)
					-- Go.
				if is_negative and then other.is_positive then
						-- -a + b = (b-a)
					operand_b.unsigned_subtract (operand_a, ctx)
					Result := operand_b
				elseif is_negative and then other.is_negative then
						-- -a + -b = - (a+b)
					operand_a.unsigned_add (operand_b, ctx)
					Result := operand_a
					Result.set_negative
				elseif is_positive and then other.is_negative then
						-- a + -b = (a-b)
					operand_a.unsigned_subtract (operand_b, ctx)
					Result := operand_a
				else
						-- a + b = (a+b)
					operand_a.unsigned_add (operand_b, ctx)
					Result := operand_a
				end
				if Result.is_zero then
					if (is_negative and then other.is_negative) or else (ctx.rounding_mode = Round_floor and then sign /= other.sign) then
						Result.set_negative
					else
						Result.set_positive
					end
				end
				Result.clean_up (ctx)
			end
		ensure
			add_not_void: Result /= Void
		end

	subtract (other: like Current; ctx: MA_DECIMAL_CONTEXT): like Current is
			-- Subtract `other' with respect to the `ctx' context
		require
			other_not_void: other /= Void
			ctx_not_void: ctx /= Void
		local
			operand_b: like Current
		do
				-- Special values are handled in a special way.
			if is_special or else other.is_special then
				Result := subtract_special (other, ctx)
			else
					-- a + b = a + (-b)
				create operand_b.make_copy (other)
				if operand_b.is_positive then
					operand_b.set_negative
				else
					operand_b.set_positive
				end
				Result := add (operand_b, ctx)
			end
		ensure
			subtract_not_void: Result /= Void
		end

	multiply (other: like Current; ctx: MA_DECIMAL_CONTEXT): like Current is
			-- Multiply `other' with respect to `ctx'
		require
			other_not_void: other /= Void
			ctx_not_void: ctx /= Void
		local
			operand_a, operand_b: like Current
		do
				-- Specials.
			if is_special or else other.is_special then
					-- sNan
				if is_nan or else other.is_nan then
					if is_signaling_nan or else other.is_signaling_nan then
						ctx.signal (Signal_invalid_operation, "sNan in multiply")
					end
					Result := nan
				elseif is_infinity or else other.is_infinity then
					if is_zero or else other.is_zero then
						ctx.signal (Signal_invalid_operation, "0 * Inf")
						Result := nan
					else
						if sign = other.sign then
							Result := infinity
						else
							Result := negative_infinity
						end
					end
				end
			else
				if is_zero or else other.is_zero then
					create Result.make (ctx.digits)
					Result.set_exponent (exponent + other.exponent)
					if sign = other.sign then
						Result.set_positive
					else
						Result.set_negative
					end
				else
					operand_a := Current
					operand_b := other
					create Result.make (operand_a.count + operand_b.count + 2)
					Result.coefficient.integer_multiply (operand_a.coefficient, operand_b.coefficient)
					Result.set_exponent (operand_a.exponent + operand_b.exponent)
					if sign = other.sign then
						Result.set_positive
					else
						Result.set_negative
					end
					Result.clean_up (ctx)
				end
			end
		ensure
			multiply_not_void: Result /= Void
		end

	divide (other: like Current; ctx: MA_DECIMAL_CONTEXT): like Current is
			-- Divide `Current' by `other' whith respect to `ctx'
		require
			other_not_void: other /= Void
			ctx_not_void: ctx /= Void
		do
				-- a E m / b E n = a/b E m-n
			Result := do_divide (other, ctx, division_standard)
		ensure
			divide_not_void: Result /= Void
		end

	divide_integer (other: like Current; ctx: MA_DECIMAL_CONTEXT): like Current is
			-- Integer division of `Current' by `other' whith respect to `ctx'
		require
			other_not_void: other /= Void
			ctx_not_void: ctx /= Void
		do
			Result := do_divide (other, ctx, division_integer)
		ensure
			divide_integer_not_void: Result /= Void
		end

	remainder (other: like Current; ctx: MA_DECIMAL_CONTEXT): like Current is
			-- Remainder of integer division of `Current' by `other' whith respect to `ctx'
		require
			other_not_void: other /= Void
			ctx_not_void: ctx /= Void
		do
			if is_special or else other.is_special then
					-- sNan
				if is_nan or else other.is_nan then
					if is_signaling_nan or else other.is_signaling_nan then
						ctx.signal (Signal_invalid_operation, "sNan in remainder")
					end
					Result := nan
				elseif is_infinity then
					ctx.signal (Signal_invalid_operation, "[+-] Inf dividend in remainder")
					Result := nan
				elseif other.is_infinity then
					create Result.make_copy (Current)
					if is_negative then
						Result.set_negative
					end
				end
			else
				if other.is_zero then
					ctx.signal (Signal_invalid_operation, "Zero divisor in remainder")
					Result := nan
				elseif is_zero then
					create Result.make_zero
					if exponent < 0 then
						Result.set_exponent (exponent)
					else
						Result.set_exponent (0)
					end
					if is_negative then
						Result.set_negative
					end
				else
					Result := internal_divide (other, ctx, division_remainder)
					if is_negative then
						Result.set_negative
					end
					Result.clean_up (ctx)
				end
			end
		ensure
			remainder_not_void: Result /= Void
		end

	rescale (new_exponent: INTEGER; ctx: MA_DECIMAL_CONTEXT): like Current is
			-- Decimal from `Current' rescaled to `new_exponent'
		require
			ctx_not_void: ctx /= Void
		local
			shared_digits, digits_upto_new_exponent, exponent_delta: INTEGER
			saved_exponent_limit, result_count: INTEGER
		do
			if not (new_exponent <= ctx.exponent_limit and then new_exponent >= ctx.e_tiny) then
				ctx.signal (Signal_invalid_operation, "new exponent is not within limits [Etiny..Emax]")
				Result := nan
			else
					-- Rescale to new_exponent.
				if is_special then
					create Result.make_copy (Current)
					Result.do_rescale_special (ctx)
				elseif exponent < new_exponent then
						-- Same as underflowing to e_tiny where e_tiny = new_exponent.
					if not is_zero then
						shared_digits := adjusted_exponent - new_exponent + 1
						if shared_digits < 0 then
								-- Impossible to share any digit with new_exponent.
							result_count := ctx.digits + count + 1
						elseif shared_digits = 0 then
								-- msd at new_exponent - 1. See if rounding shall carry some new_exponent digit.
							result_count := ctx.digits + count
						else
								-- shared_digits > 0 (and shared_digits <= ctx.digits).
							result_count := ctx.digits + (count - shared_digits)
						end
						create Result.make (result_count)
						Result.copy (Current)
						Result.coefficient.set_count (result_count)
						Result.round (ctx)
						Result.strip_leading_zeroes
						if Result.is_underflow (ctx) then
							Result.do_underflow (ctx)
						end
						if ctx.is_flagged (Signal_subnormal) and then ctx.is_flagged (Signal_inexact) then
							ctx.signal (Signal_underflow, "Underflow when rescaling")
						end
						if Result.is_overflow (ctx) then
							Result.do_overflow (ctx)
						end
						if exponent > new_exponent then
							Result.shift_left (exponent - new_exponent)
						end
					else
						create Result.make_copy (Current)
					end
					Result.set_exponent (new_exponent)
				elseif exponent > new_exponent then
					if not is_zero then
						digits_upto_new_exponent := adjusted_exponent - new_exponent + 1
						if digits_upto_new_exponent > ctx.digits then
								-- There should be an overflow.
							create Result.make (count + 1)
							Result.copy (Current)
							Result.shift_left (1)
							saved_exponent_limit := ctx.exponent_limit
								-- Make sure overflow can be called.
							ctx.set_exponent_limit (count - 1)
--							Result.set_exponent (adjusted_exponent.abs - 1)
							Result.set_exponent (1)
							Result.do_overflow (ctx)
							if not Result.is_special then
								Result.set_exponent (new_exponent)
							end
							ctx.set_exponent_limit (saved_exponent_limit)
						else
							exponent_delta := exponent - new_exponent
							create Result.make (count + exponent_delta)
							Result.copy (Current)
							Result.shift_left (exponent_delta)
						end
					else
							-- is_zero
						if new_exponent < 0 and then exponent < 0 and then count > 1 then
								-- "decimal places" have some importance
							digits_upto_new_exponent := -new_exponent + 1
						else
							digits_upto_new_exponent := 1
						end
						if digits_upto_new_exponent > ctx.digits then
								-- There should be an overflow.
							create Result.make (count + 1)
							Result.copy (Current)
							Result.shift_left (1)
							saved_exponent_limit := ctx.exponent_limit
							ctx.set_exponent_limit (Result.adjusted_exponent - 1)
							Result.do_overflow (ctx)
							ctx.set_exponent_limit (saved_exponent_limit)
						else
								-- No overflow.
							if digits_upto_new_exponent > 1 then
									-- By definition exponent < 0 and count > 1.
								exponent_delta := exponent - new_exponent
								create Result.make (count + exponent_delta)
								Result.copy (Current)
								Result.shift_left (exponent_delta)
							else
								create Result.make_copy (Current)
							end
							Result.set_exponent (new_exponent)
						end
					end
					Result.clean_up (ctx)
				else
						-- new_exponent = exponent
						-- Still detect conditions.
					create Result.make_copy (Current)
					Result.clean_up (ctx)
				end
			end
		ensure
			rescale_not_void: Result /= Void
		end

	rescale_decimal (new_exponent: like Current; ctx: MA_DECIMAL_CONTEXT): like Current is
			-- Rescale using decimal `new_exponent'
		require
			new_exponent_not_void: new_exponent /= Void
			ctx_not_void: ctx /= Void
		local
			e_max, e_min: MA_DECIMAL
			new_integer_exponent: INTEGER
			temp_ctx: MA_DECIMAL_CONTEXT
		do
			if new_exponent.is_special or else is_special then
				if new_exponent.is_signaling_nan or else is_signaling_nan then
					ctx.signal (Signal_invalid_operation, "sNaN as new exponent in 'rescale_decimal'")
					Result := nan
				elseif new_exponent.is_quiet_nan then
					Result := nan
				elseif new_exponent.is_infinity then
					ctx.signal (Signal_invalid_operation, "Inf as new exponent in 'rescale_decimal'")
					Result := nan
				else
					create Result.make_copy (Current)
					Result.do_rescale_special (ctx)
				end
			else
				create e_max.make_from_integer (ctx.exponent_limit)
				create e_min.make_from_integer (ctx.e_tiny)
				if new_exponent <= e_max and then new_exponent >= e_min then
					create temp_ctx.make_double
					if new_exponent.is_integer then
						new_integer_exponent := new_exponent.to_integer_ctx (temp_ctx)
						if new_integer_exponent <= ctx.exponent_limit and then new_integer_exponent >= ctx.e_tiny then
							Result := rescale (new_integer_exponent, ctx)
						else
							ctx.signal (Signal_invalid_operation, "new exponent is not within limits [Etiny..Emax]")
							Result := nan
						end
					else
						ctx.signal (Signal_invalid_operation, "new exponent has fractional part in 'rescale_decimal'")
						Result := nan
					end
				else
					ctx.signal (Signal_invalid_operation, "new exponent if not within limits [Etiny..Emax]")
					Result := nan
				end
			end
		ensure
			rescale_decimal_not_void: Result /= Void
		end

	round_to_integer (ctx: MA_DECIMAL_CONTEXT): like Current is
			-- Round to an integer with exponent 0
		require
			ctx_not_void: ctx /= Void
		do
			Result := rescale (0, ctx)
		ensure
			round_to_integer_not_void: Result /= Void
			definition: not Result.is_special implies Result.exponent = 0
		end

	plus (ctx: MA_DECIMAL_CONTEXT): like Current is
			-- Prefix "+" with respect to the `ctx' context
		require
			ctx_not_void: ctx /= Void
		local
			l_zero: like Current
		do
			create l_zero.make (ctx.digits + 1)
			l_zero.set_exponent (exponent)
			Result := l_zero.add (Current, ctx)
		ensure
			plus_not_void: Result /= Void
		end

	normalize: like Current is
			-- Normalized version of current decimal
		local
			l_count, trailing_zeroes: INTEGER
		do
			Result := plus (shared_decimal_context)
			if Result.is_zero then
				Result.coefficient.keep_head (1)
				Result.set_exponent (0)
			elseif not Result.is_special then
				from
					trailing_zeroes := 0
					l_count := Result.count
				until
					trailing_zeroes >= count or else Result.coefficient.item (trailing_zeroes) /= 0
				loop
					trailing_zeroes := trailing_zeroes + 1
				end
				if trailing_zeroes > 0 then
					Result.shift_right (trailing_zeroes)
					Result.coefficient.keep_head (Result.coefficient.msd_index + 1)
				end
			end
			if is_negative then
				Result.set_negative
			else
				Result.set_positive
			end
		ensure
			normalize_not_void: Result /= Void
		end

	minus (ctx: MA_DECIMAL_CONTEXT): like Current is
			-- Prefix "-" with respect to the `ctx' context
		require
			ctx_not_void: ctx /= Void
		local
			l_zero: like Current
		do
			create l_zero.make (ctx.digits + 1)
			l_zero.set_exponent (exponent)
			Result := l_zero.subtract (Current, ctx)
		ensure
			minus_not_void: Result /= Void
		end

	abs: like Current is
			-- Absolute value of `Current'
		do
			Result := abs_ctx (shared_decimal_context)
		ensure
			abs_not_void: Result /= Void
		end

	abs_ctx (ctx: MA_DECIMAL_CONTEXT): like Current is
			-- Absolute value of `Current' relative to `ctx'
		require
			ctx_not_void: ctx /= Void
		do
			if is_negative then
				Result := minus (ctx)
			else
				Result := plus (ctx)
			end
		ensure
			abs_ctx_not_void: Result /= Void
			definition: Result.sign >= 0
		end

	max_ctx (other: like Current; ctx: MA_DECIMAL_CONTEXT): like Current is
			-- Max between `Current' and `other' relative to `ctx'
		require
			other_not_void: other /= Void
			ctx_not_void: ctx /= Void
		local
			comparison_result: MA_DECIMAL
		do
			if is_nan or else other.is_nan then
				if is_signaling_nan or else other.is_signaling_nan then
					ctx.signal (Signal_invalid_operation, "sNan in max")
				end
				Result := nan
			else
				comparison_result := compare (other, ctx)
				if comparison_result.is_negative then
					Result := other
				else
					Result := Current
				end
				Result.clean_up (ctx)
			end
		ensure
			max_ctx_not_void: Result /= Void
		end

	min_ctx (other: like Current; ctx: MA_DECIMAL_CONTEXT): like Current is
			-- Min between `Current' and `other' relative to `ctx'
		require
			other_not_void: other /= Void
			ctx_not_void: ctx /= Void
		local
			comparison_result: MA_DECIMAL
		do
			if is_nan or else other.is_nan then
				if is_signaling_nan or else other.is_signaling_nan then
					ctx.signal (Signal_invalid_operation, "sNan in max")
				end
				Result := nan
			else
				comparison_result := compare (other, ctx)
				if comparison_result.is_negative or comparison_result.is_zero then
					Result := Current
				else
					Result := other
				end
				Result.clean_up (ctx)
			end
		ensure
			min_ctx_not_void: Result /= Void
		end

	compare (other: like Current; ctx: MA_DECIMAL_CONTEXT): like Current is
			-- Compare value of `Current' and `other';
			-- Result = 0 if Current = other,
			-- Result = -1 if Current < other,
			-- Result = +1 if Current > other.
		require
			other_not_void: other /= Void
			ctx_not_void: ctx /= Void
		local
			operand_a, operand_b: like Current
			temp_ctx: MA_DECIMAL_CONTEXT
		do
			if is_special or else other.is_special then
				if is_nan or else other.is_nan then
					Result := nan
					if is_signaling_nan or else other.is_signaling_nan then
						ctx.signal (Signal_invalid_operation, "sNaN in 'compare'")
					end
				elseif is_infinity then
					if other.is_infinity and then is_negative = other.is_negative then
							-- compare (Inf,Inf) or compare (-Inf,-Inf)
						Result := zero
					elseif is_negative then
							-- compare (-Inf, x) : -Inf < x
						Result := minus_one
					else
						Result := one
					end
				elseif other.is_infinity then
					if is_infinity and then is_negative = other.is_negative then
							-- compare (Inf,Inf) or compare (-Inf,-Inf)
						Result := zero
					elseif other.is_negative then
							-- compare ( x, -Inf) : x > -Inf
						Result := one
					else
							-- compare (x, +inf) : x < Inf
						Result := minus_one
					end
				end
			else
				create operand_a.make_copy (Current)
				create operand_b.make_copy (other)
					-- Avoid over/underflow during comparison.
				if is_negative /= other.is_negative then
						-- Signs are different.
					if is_zero then
						create operand_a.make_zero
					else
						create operand_a.make_one
						if is_negative then
							operand_a.set_negative
						end
					end
					if other.is_zero then
						create operand_b.make_zero
					else
						create operand_b.make_one
						if other.is_negative then
							operand_b.set_negative
						end
					end
				end
				temp_ctx := ctx.cloned_object
				temp_ctx.reset_flags
				Result := operand_a.subtract (operand_b, temp_ctx)
				if Result.is_zero and then not temp_ctx.is_flagged (Signal_subnormal) then
						-- Avoid considering equal, numbers whose difference is an epsilon.
					Result := zero
				else
					if Result.is_negative then
						Result := minus_one
					else
						Result := one
					end
				end
			end
		ensure
			compare_not_void: Result /= Void
		end

feature {MA_DECIMAL, MA_DECIMAL_PARSER} -- Element change

	set_exponent (e: like exponent) is
			-- Set `exponent' to `e'.
		do
			exponent := e
		ensure
			exponent_set: exponent = e
		end

	set_negative is
			-- Set negative.
		do
			is_negative := True
		ensure
			negative: is_negative
		end

	set_positive is
			-- Set positive.
		do
			is_negative := False
		ensure
			positive: is_positive
		end

feature {NONE} -- Constants

	Align_hint_current: INTEGER is 1

	Align_hint_other: INTEGER is 2

	Align_hint_both: INTEGER is 3

	Align_hint_current_zero: INTEGER is 4

	Align_hint_other_zero: INTEGER is 5

feature {MA_DECIMAL} -- Status setting

	special: INTEGER
			-- Special status

	set_quiet_nan is
			-- Set to qNaN.
		do
			make_nan
		ensure
			qnan: is_quiet_nan
		end

feature {MA_DECIMAL} -- Basic operations

	add_special (other: like Current; ctx: MA_DECIMAL_CONTEXT): like Current is
			-- Add special numbers.
		require
			other_not_void: other /= Void
			special: is_special or else other.is_special
			ctx_not_void: ctx /= Void
		do
				-- Prepare result.
				-- Set its value.
			if is_nan or else other.is_nan then
				if is_signaling_nan or else other.is_signaling_nan then
					ctx.signal (Signal_invalid_operation, "sNaN operand in add")
				end
				Result := nan
			elseif is_infinity and then other.is_infinity then
				if sign /= other.sign then
					ctx.signal (Signal_invalid_operation, "+Inf and -Inf operands in add")
					Result := nan
				else
					if is_negative then
						Result := negative_infinity
					else
						Result := infinity
					end
				end
			elseif is_infinity or else other.is_infinity then
				if is_infinity then
					if is_negative then
						Result := negative_infinity
					else
						Result := infinity
					end
				else
						-- `other' is Inf
					if other.is_negative then
						Result := negative_infinity
					else
						Result := infinity
					end
				end
			end
		ensure
			add_special_not_void: Result /= Void
		end

	subtract_special (other: like Current; ctx: MA_DECIMAL_CONTEXT): like Current is
			-- Subtract special numbers.
		require
			other_not_void: other /= Void
			special: is_special or else other.is_special
			ctx_not_void: ctx /= Void
		do
				-- Prepare result.
				-- Set its value.
			if is_nan or else other.is_nan then
				if is_signaling_nan or else other.is_signaling_nan then
					ctx.signal (Signal_invalid_operation, "sNaN operand in subtract")
				end
				Result := nan
			elseif is_infinity and then other.is_infinity then
				if sign = other.sign then
					ctx.signal (Signal_invalid_operation, "Inf and Inf operands in subtract")
					Result := nan
				else
					if is_negative then
						Result := negative_infinity
					else
						Result := infinity
					end
				end
			elseif is_infinity or else other.is_infinity then
				Result := infinity
				if is_infinity then
					if is_negative then
							-- -Inf - x = -Inf
						Result := negative_infinity
					end
				else
						-- `other' is Inf
					if other.is_positive then
							-- x - +Inf = -Inf
						Result := negative_infinity
					else
							-- x - -Inf = +Inf
						Result := infinity
					end
				end
			end
		ensure
			subtract_special_not_void: Result /= Void
		end

	unsigned_add (other: like Current; ctx: MA_DECIMAL_CONTEXT) is
			-- Add `other' to `Current'.
			-- Note: this will alter `other' and `Current'.
		require
			other_not_void: other /= Void
			ctx_not_void: ctx /= Void
		local
			align_hint: INTEGER
			msd: INTEGER
		do
				-- Avoid costly operations.
				-- Align.
			align_hint := align_and_hint (other, ctx.digits)
			if align_hint = Align_hint_current then
					-- Keep `Current'.
				shift_left (ctx.digits + 2 - count)
				coefficient.put (other.coefficient.item (other.coefficient.msd_index), 0)
				ctx.signal (Signal_inexact, "")
			elseif align_hint = Align_hint_other then
					-- Copy `other'.
				msd := coefficient.item (coefficient.msd_index)
				copy (other)
				shift_left (ctx.digits + 2 - count)
				coefficient.put (msd, 0)
				ctx.signal (Signal_inexact, "")
			elseif align_hint = Align_hint_other_zero then
				copy (other)
			elseif align_hint = Align_hint_current_zero then
				-- Keep `Current'.
			else
				coefficient.integer_add (other.coefficient)
				exponent := exponent.min (other.exponent)
			end
		end

	unsigned_subtract (other: like Current; ctx: MA_DECIMAL_CONTEXT) is
			-- Subtract `other' without taking the sign into account.
		require
			other_not_void: other /= Void
			ctx_not_void: ctx /= Void
		local
			test, align_hint: INTEGER
		do
				-- Avoid costly operations.
				-- Align.
			align_hint := align_and_hint (other, ctx.digits)
			if align_hint = Align_hint_current then
					-- Keep `Current', but subtract -1E-precision
				shift_left (ctx.digits + 2 - count)
				coefficient.integer_quick_subtract_msd (1, coefficient.count)
			elseif align_hint = Align_hint_other then
					-- Copy `other'.
				copy (other)
				shift_left (ctx.digits + 2 - count)
				coefficient.integer_quick_subtract_msd (1, coefficient.count)
				set_negative
			elseif align_hint = Align_hint_current_zero then
				-- Keep `Current'.
			elseif align_hint = Align_hint_other_zero then
					-- Copy `other'.
				copy (other)
				set_negative
			else
				test := coefficient.three_way_comparison (other.coefficient)
				if test = 0 then
					coefficient.keep_head (1)
					coefficient.put (0, 0)
				elseif test > 0 then
					coefficient.integer_subtract (other.coefficient)
				else
						-- other > Current
					other.coefficient.integer_subtract (coefficient)
					coefficient.copy (other.coefficient)
					set_negative
				end
				exponent := exponent.min (other.exponent)
			end
		end

	round (ctx: MA_DECIMAL_CONTEXT) is
			-- Round `Current' according to ctx.rounding_mode.
		require
			not_special: not is_special
			roundable: ctx.digits > 0 and then count > ctx.digits
		do
			if is_special then
				if is_signaling_nan then
					ctx.signal (Signal_invalid_operation, "sNaN in 'round'")
				end
			elseif count > ctx.digits then
				ctx.signal (Signal_rounded, "Argument rounded")
				if lost_digits (ctx) then
					ctx.signal (Signal_inexact, "Inexact when rouding")
				end
				inspect ctx.rounding_mode
				when Round_up then
					do_round_up (ctx)
				when Round_down then
					do_round_down (ctx)
				when Round_ceiling then
					do_round_ceiling (ctx)
				when Round_floor then
					do_round_floor (ctx)
				when Round_half_up then
					do_round_half_up (ctx)
				when Round_half_down then
					do_round_half_down (ctx)
				when Round_half_even then
					do_round_half_even (ctx)
				else
					-- Do nothing.
				end
			end
		ensure
			rounded: count <= ctx.digits
		end

	align_and_hint (other: like Current; precision: INTEGER): INTEGER is
			-- Align `Current' and `other' with respect to `precision'
			-- and give hint for further operations
		local
			new_count, new_exponent: INTEGER
			limited_precision: BOOLEAN
			shift_count: INTEGER
		do
			limited_precision := (precision > 0)
			if exponent = other.exponent then
					-- Adjust each other's count?
				new_count := count.max (other.count)
				if new_count > count then
					grow (new_count)
				end
				if new_count > other.count then
					other.grow (new_count)
				end
				Result := Align_hint_both
			elseif exponent > other.exponent then
					-- Need to pad `Current' so that exponent = other.exponent.
					-- Examine if `other' would NOT affect `Current'
					-- i.e. if `Current' would be longer than `other' by digits + 1 or more
					-- we only need to pad up to a length of `precision' + 1
					--
					-- except when `Current' is Zero. In this case `other' is returned, unchanged.
				new_exponent := exponent.min (adjusted_exponent - (precision + 1))
				if new_exponent > other.adjusted_exponent then
						-- `other' shall not affect `Current'.
					if is_zero then
						Result := Align_hint_other_zero
					else
						if limited_precision then
							if other.is_zero then
									-- Avoid unnecessary rounding.
								Result := Align_hint_current_zero
							else
								Result := Align_hint_current
							end
							shift_count := precision + 1 - count
							if shift_count > 0 then
								shift_left (shift_count)
							end
						end
					end
				else
					if limited_precision then
						align_overlapped (other, precision)
					else
						align_unlimited (other)
					end
					Result := Align_hint_both
				end
			else
					-- exponent < other.exponent
					-- Need to pad other so that other.exponent = exponent
				new_exponent := other.exponent.min (other.adjusted_exponent - (precision + 1))
				if new_exponent > adjusted_exponent then
						-- `Current' shall not affect `other',
						-- except when `other' is Zero. In this case `Current' is returned, unchanged.
					if other.is_zero then
						Result := Align_hint_current_zero
					else
						if limited_precision then
							if is_zero then
								Result := Align_hint_other_zero
							else
								Result := Align_hint_other
							end
							shift_count := precision + 1 - other.count
							if shift_count > 0 then
								other.shift_left (shift_count)
							end
						end
					end
				else
					if limited_precision then
						other.align_overlapped (Current, precision)
					else
						other.align_unlimited (Current)
					end
					Result := Align_hint_both
				end
			end
		ensure
			hint_both_is_same_count: Result = Align_hint_both implies count = other.count
			hint_both_is_same_exponent: Result = Align_hint_both implies exponent = other.exponent
		end

	align_overlapped (other: like Current; precision: INTEGER) is
			-- Align overlapping numbers.
		require
			other_not_void: other /= Void
			exponent_greater: exponent > other.exponent
		local
			exponent_delta, new_digits: INTEGER
		do
				-- Adjust exponents.
			exponent_delta := exponent - other.exponent
			if exponent_delta > 0 then
				shift_left (exponent_delta)
			end
			new_digits := count.max (other.count)
				-- Adjust `count' to be `precision'.
			if new_digits > other.count then
				other.grow (new_digits)
			end
			if new_digits > count then
				grow (new_digits)
			end
		ensure
			same_count: count = other.count
			same_exponent: exponent = other.exponent
		end

	align_unlimited (other: like Current) is
			-- Align unlimited.
		require
			other_not_void: other /= Void
			exponent_greater: exponent > other.exponent
		local
			count_alignment: INTEGER
		do
				-- Adjust `Current'.
			shift_left (exponent - other.exponent)
			count_alignment := count - other.count
			if count_alignment > 0 then
					-- Must grow `other'.
				other.grow (count)
			elseif count_alignment < 0 then
				grow (other.count)
			else
				-- Do nothing.
			end
		ensure
			same_count: count = other.count
			same_exponent: exponent = other.exponent
		end

	shift_left (a_count: INTEGER) is
			-- Shift the coefficient left `a_count' position and adjust `exponent'.
			-- value still must be the same as with the original `exponent'.
		require
			not_special: not is_special
			a_count_positive: a_count > 0
		do
			coefficient.shift_left (a_count)
			exponent := exponent - a_count
		ensure
			count_adapted: count = old count + a_count
			exponent_adapted: exponent = old exponent - a_count
		end

	shift_right (a_count: INTEGER) is
			-- Shift the coefficient right `a_count' position and adjust `exponent'.
			-- Digits are lost.
		require
			not_special: not is_special
			a_count_positive: a_count > 0
		do
			coefficient.shift_right (a_count)
			exponent := exponent + a_count
		ensure
			exponent_adapted: exponent = old exponent + a_count
		end

	grow (a_count: INTEGER) is
			-- Grow `coefficient' so that it can accommodate `a_count' digits.
		require
			not_special: not is_special
			a_count_greater_zero: a_count > 0
			a_count_less_10_000: a_count < 10_000
		do
			coefficient.grow (a_count)
		ensure
			count_set: count = a_count
		end

	do_round_up (ctx: MA_DECIMAL_CONTEXT) is
			-- Round away from zero.
		require
			ctx_not_void: ctx /= Void
		local
			old_count, exponent_increment: INTEGER
		do
			if lost_digits (ctx) then
				old_count := count
				coefficient.integer_quick_add_msd (1, ctx.digits)
				exponent_increment := old_count - ctx.digits
				exponent := exponent + exponent_increment
			end
			if count > ctx.digits then
				shift_right (count - ctx.digits)
				coefficient.keep_head (ctx.digits)
			end
		end

	do_round_down (ctx: MA_DECIMAL_CONTEXT) is
			-- Round towards zero.
		require
			ctx_not_void: ctx /= Void
			positive_precision: ctx.digits >= 1
		local
			exponent_increment: INTEGER
			l_count: INTEGER
		do
			l_count := count - ctx.digits
			coefficient.shift_right (l_count)
			exponent_increment := l_count
			exponent := exponent + exponent_increment
			coefficient.keep_head (ctx.digits)
		end

	do_round_ceiling (ctx: MA_DECIMAL_CONTEXT) is
			-- Round to a more positive number.
		require
			ctx_not_void: ctx /= Void
		do
			if is_negative or else not lost_digits (ctx) then
				do_round_down (ctx)
			else
				do_round_up (ctx)
			end
		end

	do_round_floor (ctx: MA_DECIMAL_CONTEXT) is
			-- Round to a more negative number.
		require
			ctx_not_void: ctx /= Void
		do
			if is_positive or else not lost_digits (ctx) then
				do_round_down (ctx)
			else
				do_round_up (ctx)
			end
		end

	do_round_half_up (ctx: MA_DECIMAL_CONTEXT) is
			-- Round to nearest neighbor, where an equidistant value is rounded up.
			-- If the discarded digits represent greater than or equal to half (0.5 times) the value
			-- of a one in the next position then the result should be rounded up (away from zero).
			-- Otherwise the discarded digits are ignored.
		require
			ctx_not_void: ctx /= Void
		do
			inspect three_way_compare_discarded_to_half (ctx)
			when 1, 0 then
					-- Greater, equal.
				do_round_up (ctx)
			else
					-- Less.
				do_round_down (ctx)
			end
		end

	do_round_half_down (ctx: MA_DECIMAL_CONTEXT) is
			-- Round to nearest neighbor, where an equidistant value is rounded down.
			-- If the discarded digits represent greater than half (0.5 times)
			-- the value of a one in the next position then the result should be
			-- rounded up (away from zero). Otherwise the discarded digits are ignored.
		require
			ctx_not_void: ctx /= Void
		do
			inspect three_way_compare_discarded_to_half (ctx)
			when -1 then
					-- Less.
				do_round_down (ctx)
			when 1 then
					-- Greater.
				do_round_up (ctx)
			else
					-- Equal.
				do_round_down (ctx)
			end
		end

	three_way_compare_discarded_to_half (ctx: MA_DECIMAL_CONTEXT): INTEGER is
			-- Compare discarded digits greater than 0.5
		require
			ctx_not_void: ctx /= Void
		local
			digit, index: INTEGER
		do
			digit := coefficient.item (count - ctx.digits - 1)
			if digit > 5 then
				Result := 1
			elseif digit < 5 then
				Result := -1
			else
				index := count - ctx.digits - 2
					-- Search for non zero digit to the right.
				from
				until
					index < 0 or else coefficient.item (index) /= 0
				loop
					index := index - 1
				end
				if index >= 0 then
						-- More than half.
					Result := 1
				else
						-- Exactly half.
					Result := 0
				end
			end
		ensure
			definition: Result >= -1 and then Result <= 1
		end

	do_round_half_even (ctx: MA_DECIMAL_CONTEXT) is
			-- Round to nearest neighbor, where an equidistant value is rounded to the nearest even neighbor.
			-- If the discarded digits represent greater than half (0.5 times) the value of a one in the
			-- next position then the result should be rounded up (away from zero).
			-- If they represent less than half, then the result should be rounded down.
			-- Otherwise (they represent exactly half) the result is rounded down if its rightmost digit
			-- is even, or rounded up if its rightmost digit is odd (to make an even digit).
		require
			ctx_not_void: ctx /= Void
		do
			inspect three_way_compare_discarded_to_half (ctx)
			when -1 then
					-- Less.
				do_round_down (ctx)
			when 1 then
					-- Greater.
				do_round_up (ctx)
			else
					-- Equal.
				if (coefficient.item (count - ctx.digits) \\ 2 = 0) then
					do_round_down (ctx)
				else
					do_round_up (ctx)
				end
			end
		end

	lost_digits (ctx: MA_DECIMAL_CONTEXT): BOOLEAN is
			-- Should Current loose digits if rounded wrt `ctx'?
		require
			ctx_not_void: ctx /= Void
		local
			index: INTEGER
		do
			from
				index := count - ctx.digits - 1
			until
				index < 0 or else coefficient.item (index) /= 0
			loop
				index := index - 1
			end
				-- True if found non-zero digits in [0..count-ctx.digits-1].
			Result := index >= 0
		ensure
			definition1: (count - ctx.digits - 1) >= 0 implies Result = (coefficient.subcoefficient (0, count - ctx.digits - 1)).is_significant
			definition2: (count - ctx.digits - 1) < 0 implies not Result
		end

	is_overflow (ctx: MA_DECIMAL_CONTEXT): BOOLEAN is
			-- Is there an overflow condition wrt `ctx'?
		require
			ctx_not_void: ctx /= Void
		do
			Result := adjusted_exponent > ctx.exponent_limit
		ensure
			definition: Result = (adjusted_exponent > ctx.exponent_limit)
		end

	is_underflow (ctx: MA_DECIMAL_CONTEXT): BOOLEAN is
			-- Is there an underflow condition wrt `ctx'?
		require
			ctx_not_void: ctx /= Void
		do
			Result := adjusted_exponent < -ctx.exponent_limit
		ensure
			definition: Result = (adjusted_exponent < -ctx.exponent_limit)
		end

	clean_up (ctx: MA_DECIMAL_CONTEXT) is
			-- Clean up Current wrt `ctx', rounding it if necessary.
		require
			ctx_not_void: ctx /= Void
		local
			lost_digits_trap, lost_digits_flag: BOOLEAN
		do
			if not is_special then
				lost_digits_trap := ctx.is_trapped (Signal_lost_digits)
				lost_digits_flag := ctx.is_flagged (Signal_lost_digits)
					-- Round as if no lost_digits trap existed.
				ctx.disable_trap (Signal_lost_digits)
				ctx.reset_flag (Signal_lost_digits)
					-- Avoid losing significant digits in msd.
				strip_leading_zeroes
				if is_underflow (ctx) then
					do_underflow (ctx)
				else
					if ctx.digits > 0 and then count > ctx.digits then
						round (ctx)
					end
					if is_overflow (ctx) then
						do_overflow (ctx)
					end
				end
					-- Restore flags and traps.
				if lost_digits_trap then
					ctx.enable_trap (Signal_lost_digits)
				end
				if lost_digits_flag or else ctx.is_flagged (Signal_lost_digits) then
					ctx.set_flag (Signal_lost_digits)
				else
					ctx.reset_flag (Signal_lost_digits)
				end
			end
		end

	strip_leading_zeroes is
			-- Strip leading zeroes.
		require
			not_special: not is_special
		do
			coefficient.strip_leading_zeroes
		end

	set_largest (ctx: MA_DECIMAL_CONTEXT) is
			-- Set to largest finite number that can be represented with ctx.precision.
		require
			ctx_not_void: ctx /= Void
		local
			index: INTEGER
		do
			if count < ctx.digits then
				grow (ctx.digits)
			end
			from
				index := 0
			until
				index >= count
			loop
				coefficient.put (9, index)
				index := index + 1
			end
			coefficient.keep_head (ctx.digits)
			if exponent < 0 then
				exponent := -ctx.exponent_limit + (count - 1)
			else
				exponent := ctx.exponent_limit - (count - 1)
			end
		end

	promote_to_infinity (a_sign: INTEGER) is
			-- Promote to infinity.
		do
			make_infinity (a_sign)
		ensure
			infinity: is_infinity
			sign_set: sign = a_sign
		end

	do_overflow (ctx: MA_DECIMAL_CONTEXT) is
			-- Do overflow.
		require
			ctx_not_void: ctx /= Void
			overflow: is_overflow (ctx)
		do
			if not is_zero then
				ctx.signal (Signal_overflow, "")
				inspect ctx.rounding_mode
				when Round_half_up, Round_half_even, Round_half_down, Round_up then
					promote_to_infinity (sign)
				when Round_down then
					set_largest (ctx)
				when Round_ceiling then
					if is_negative then
						set_largest (ctx)
					else
						promote_to_infinity (sign)
					end
				when Round_floor then
					if is_positive then
						set_largest (ctx)
					else
						promote_to_infinity (sign)
					end
				end
				ctx.signal (Signal_inexact, "do_overflow")
				ctx.signal (Signal_rounded, "do_overflow")
			else
				set_exponent (ctx.exponent_limit)
			end
		end

	do_underflow (ctx: MA_DECIMAL_CONTEXT) is
			-- Do underflow.
		require
			ctx_not_void: ctx /= Void
			underflow: is_underflow (ctx)
		local
			e_tiny, shared_digits, subnormal_count, count_upto_elimit, saved_digits: INTEGER
			l_is_zero, l_was_rounded: BOOLEAN
			value: INTEGER
		do
			l_is_zero := is_zero
			if not l_is_zero then
				ctx.signal (Signal_subnormal, "")
			else
				l_was_rounded := ctx.is_flagged (Signal_rounded)
			end
				-- Rescale to `e_tiny'.
			e_tiny := ctx.e_tiny
			if exponent < e_tiny then
				saved_digits := ctx.digits
				shared_digits := adjusted_exponent - e_tiny + 1
				if shared_digits < 0 then
						-- Impossible to share any digit with `e_tiny'.
					saved_digits := ctx.digits
					ctx.force_digits (coefficient.count - 1)
					value := 0
					inspect ctx.rounding_mode
					when Round_up then
						value := 1
					when Round_ceiling then
						if is_positive and then lost_digits (ctx) then
							value := 1
						end
					when Round_floor then
						if is_positive or else not lost_digits (ctx) then
							value := 0
						else
							value := 1
						end
					else
						value := 0
					end
					ctx.set_digits (saved_digits)
					coefficient.put (value, 0)
					coefficient.keep_head (1)
					exponent := e_tiny
					ctx.signal (Signal_inexact, "Rescaling to e_tiny")
					ctx.signal (Signal_rounded, "Rescaling to e_tiny")
					ctx.signal (Signal_underflow, "Rescaling to e_tiny")
				else
					if shared_digits = 0 then
							-- msd at e_tiny - 1. See if rounding shall carry some e_tiny digit.
						ctx.set_digits (1)
						grow (count + 1)
					else
						check
--							shared_digits > 0 and shared_digits <= ctx.digits
						end
						count_upto_elimit := -ctx.exponent_limit - exponent + 1
						if count < count_upto_elimit then
							grow (count_upto_elimit)
						end
						subnormal_count := -ctx.exponent_limit - e_tiny + 1
						ctx.set_digits (subnormal_count)
					end
					round (ctx)
					ctx.set_digits (saved_digits)
					strip_leading_zeroes
					if ctx.is_flagged (Signal_subnormal) and then ctx.is_flagged (Signal_inexact) then
						ctx.signal (Signal_underflow, "Underflow when rescaling")
					end
					if is_overflow (ctx) then
						do_overflow (ctx)
					end
				end
				exponent := e_tiny
				if l_is_zero then
					if l_was_rounded then
						ctx.signal (Signal_rounded, ctx.reason)
					else
						ctx.reset_flag (Signal_rounded)
					end
				end
			end
		end

	division_standard: INTEGER is 1

	division_integer: INTEGER is 2

	division_remainder: INTEGER is 3
			-- Division types

	do_divide (other: like Current; ctx: MA_DECIMAL_CONTEXT; division_type: INTEGER): like Current is
			-- Do a `division_type' of `Current' by `other'
		require
			other_not_void: other /= Void
			ctx_not_void: ctx /= Void
		local
			integer_division: BOOLEAN
		do
			integer_division := (division_type = division_integer) or else (division_type = division_remainder)
			if is_special or else other.is_special then
					-- sNan.
				if is_nan or else other.is_nan then
					if is_signaling_nan or else other.is_signaling_nan then
						ctx.signal (Signal_invalid_operation, "sNan in divide")
					end
					Result := nan
				elseif is_infinity and then other.is_infinity then
					ctx.signal (Signal_invalid_operation, "[+-] Inf / [+-] Inf")
					Result := nan
				elseif is_infinity then
					if sign = other.sign then
						Result := infinity
					else
						Result := negative_infinity
					end
					if other.is_zero then
						ctx.signal (Signal_division_by_zero, "[+-] Inf / [+-] 0")
					end
				elseif other.is_infinity then
					if sign = other.sign then
						Result := zero
					else
						Result := negative_zero
					end
				end
			else
				if other.is_zero then
					if is_zero then
						ctx.signal (Signal_invalid_operation, "Division Undefined : O/O")
						Result := nan
					else
						ctx.signal (Signal_division_by_zero, "Division by zero")
						if sign = other.sign then
							Result := infinity
						else
							Result := negative_infinity
						end
					end
				elseif is_zero then
					create Result.make_zero
					if integer_division then
						Result.set_exponent (0)
					else
						Result.set_exponent (exponent - other.adjusted_exponent)
					end
					if sign = other.sign then
						Result.set_positive
					else
						Result.set_negative
					end
					Result.clean_up (ctx)
				else
					Result := internal_divide (other, ctx, division_type)
					if sign = other.sign then
						Result.set_positive
					else
						Result.set_negative
					end
					Result.clean_up (ctx)
				end
			end
		ensure
			divide_not_void: Result /= Void
		end

	internal_divide (other: like Current; ctx: MA_DECIMAL_CONTEXT; division_type: INTEGER): like Current is
			-- Divide `Current' by `other' whith respect to `ctx'
		require
			other_not_void: other /= Void
			ctx_not_void: ctx /= Void
		local
			dividend, divisor, local_remainder: like Current
			adjust, divisor_adjust, dividend_adjust, current_digit_exponent, new_exponent: INTEGER
			original_dividend_exponent, original_divisor_exponent, bias: INTEGER
			done, integer_division, impossible, is_negative_exponent, dividend_is_zero: BOOLEAN
		do
			integer_division := (division_type /= division_standard)
			create dividend.make_copy (Current)
			create divisor.make_copy (other)
				--
			original_divisor_exponent := divisor.exponent
			original_dividend_exponent := dividend.exponent
			if dividend.is_zero then
				dividend_is_zero := True
			end
				-- Prepare result.
			create Result.make (ctx.digits + 1)
			adjust := 0
			divisor_adjust := 0
			dividend_adjust := 0
				-- Adjust coefficients so that
				-- 1. divisor.coefficient <= dividend.coefficient
				-- 2. dividend.coefficient < 10 * divisor.coefficient
			from
				-- While coefficient of dividend is less than coefficient of divisor
				-- multiply coefficient of divident by 10.
			until
				dividend.coefficient >= divisor.coefficient
			loop
				dividend.shift_left (1)
				adjust := adjust + 1
				dividend_adjust := dividend_adjust + 1
			end
			check
				dividend.coefficient >= divisor.coefficient
			end
			from
					-- While coefficient of divisor >= 10 * coefficient of dividend,
					-- Until dividend.coefficient / 10 < divisor.coefficient,
					-- Multiply divisor by 10.
					--
					-- Init: compute 10 * coefficient of dividend
				divisor.shift_left (1)
					-- Adjust coefficient sizes.
			until
				dividend.coefficient < divisor.coefficient
			loop
				adjust := adjust - 1
				divisor.shift_left (1)
				divisor_adjust := divisor_adjust + 1
			end
				-- Divide by 10.
			check
				dividend.coefficient < divisor.coefficient
			end
				-- Get back to divisor: undo 'init'.
			divisor.shift_right (1)
			divisor.coefficient.keep_head (divisor.coefficient.count - 1)
				-- Do divide.
			from
				if integer_division then
						-- Determine if division is possible.
					current_digit_exponent := (original_dividend_exponent - (original_divisor_exponent + adjust))
					impossible := (current_digit_exponent >= ctx.digits)
					is_negative_exponent := (current_digit_exponent) < 0
					done := is_negative_exponent or else impossible
				else
					impossible := False
					done := False
				end
				if not done then
						-- Prepare `Result' so that it can accomodate ctx.digits + 1 digits.
					Result.coefficient.grow (ctx.digits + 1)
					Result.coefficient.keep_head (1)
				end
			until
				done
			loop
					-- Compute digit of rank 'current_digit_exponent' by repeatedly subtracting divisor from dividend.
				from
				until
					divisor.coefficient > dividend.coefficient
				loop
					dividend.coefficient.integer_subtract (divisor.coefficient)
					Result.coefficient.integer_quick_add_msd (1, Result.count)
				end
					-- Determine if division is done.
				inspect division_type
				when division_standard then
					if (dividend.is_zero and then adjust >= 0) or else (Result.count = ctx.digits) then
						done := True
					end
				else
					if current_digit_exponent = 0 then
						done := True
					end
				end
					-- Prepare processing of next digit.
				if not done then
					Result.coefficient.shift_left (1)
					dividend.coefficient.shift_left (1)
					adjust := adjust + 1
					current_digit_exponent := current_digit_exponent - 1
				end
			end
			if impossible then
				Result.set_quiet_nan
				ctx.signal (Signal_invalid_operation, "Division impossible")
			else
				local_remainder := dividend
				inspect division_type
				when division_standard then
						-- Give some indications for rounding.
					if local_remainder.is_zero then
						if adjust < 0 then
								-- `Result' has been artificially rounded.
							ctx.signal (Signal_rounded, "Artificial rounding in division where remainder is zero")
						end
					else
						Result.coefficient.shift_left (1)
						adjust := adjust + 1
						divisor.coefficient.integer_subtract (local_remainder.coefficient)
						inspect divisor.coefficient.three_way_comparison (local_remainder.coefficient)
						when 0 then
								-- Half way: divisor - remainder = remainder <=> 2 * remainder = divisor
							Result.coefficient.put (5, 0)
						when 1 then
								-- Half way down: divisor - remainder > remainder <=> 2 * remainder < divisor
							Result.coefficient.put (4, 0)
						else
								-- Half way up: divisor - remainder < remainder <=> 2 remainder > divisor
							Result.coefficient.put (6, 0)
						end
					end
						-- Compute `exponent'.
					if dividend.is_zero then
						Result.set_exponent (original_dividend_exponent - (original_divisor_exponent + adjust))
					else
						Result.set_exponent (exponent - (original_divisor_exponent + adjust))
					end
				when division_integer then
					Result.set_exponent (0)
				else
					Result := local_remainder
						-- Correct value if necessary.
					if is_negative_exponent then
							-- Correct left_shift bias introduced in steps preparing division.
							-- Division has not occurred.
						create Result.make_copy (Current)
					else
						new_exponent := original_dividend_exponent.min (original_divisor_exponent)
						bias := new_exponent - (dividend.exponent.min (divisor.exponent))
						if Result.is_zero then
							if dividend_is_zero then
								new_exponent := original_dividend_exponent
							elseif new_exponent >= 0 then
								new_exponent := 0
							else
								new_exponent := exponent - (original_divisor_exponent + adjust)
							end
--						elseif divisor.adjusted_exponent >= 0 then
						else
								-- Real division.
							if bias /= 0 then
								Result.coefficient.shift_right (bias.abs)
							end
						end
						Result.set_exponent (new_exponent)
					end
				end
			end
		ensure
			divide_not_void: Result /= Void
		end

	do_rescale_special (ctx: MA_DECIMAL_CONTEXT) is
			-- Rescale special numbers.
		require
			is_special: is_special
			not_constant_infinity: Current /= infinity
			not_constant_negative_infinity: Current /= negative_infinity
			not_constant_nan: Current /= nan
			not_constant_snan: Current /= snan
		do
			if is_quiet_nan then
				-- Do nothing.
			elseif is_signaling_nan then
				ctx.signal (Signal_invalid_operation, "sNaN as operand in rescale")
				set_quiet_nan
			elseif is_infinity then
				-- Do nothing.
			end
		end

	to_string_general (is_engineering: BOOLEAN): STRING is
			-- `Current' as a number in engineering notation if `is_engineering'
			-- is True, in scientific notation otherwise.
		local
			str_coefficient: STRING
			str_zero_pad: STRING
			index, after_point_count, the_exponent, printed_exponent, exponent_difference: INTEGER
			digits_before_point: INTEGER
			exponential: BOOLEAN
		do
			create Result.make (0)
			if is_special then
				if is_quiet_nan then
					Result.append_string ("NaN")
				elseif is_signaling_nan then
					Result.append_string ("sNaN")
				else
					if is_negative then
						Result.append_string ("-")
					end
					Result.append_string ("Infinity")
				end
			else
					-- Coefficient conversion.
				if is_negative then
					Result.append_string ("-")
				end
				create str_coefficient.make (count)
				from
					index := count - 1
				until
					index < 0
				loop
					str_coefficient.append_character (INTEGER_.to_character (('0').code + coefficient.item (index)))
					index := index - 1
				end
					-- Determine if exponential notation shall be used.
				the_exponent := adjusted_exponent
				exponential := not (exponent <= 0 and then adjusted_exponent >= -6)
				if exponential then
					printed_exponent := the_exponent
					if is_engineering then
						from
						until
							printed_exponent \\ 3 = 0
						loop
							printed_exponent := printed_exponent - 1
						end
						exponent_difference := the_exponent - printed_exponent
						if not is_zero then
							digits_before_point := 1 + exponent_difference
							from
							until
								str_coefficient.count >= digits_before_point
							loop
								str_coefficient.append_character ('0')
							end
						else
							digits_before_point := 1
						end
					else
						digits_before_point := 1
					end
					if str_coefficient.count > digits_before_point then
						Result.append_string (str_coefficient.substring (1, digits_before_point))
						Result.append_character ('.')
						Result.append_string (str_coefficient.substring (digits_before_point + 1, str_coefficient.count))
					else
						Result.append_string (str_coefficient)
					end
					if printed_exponent /= 0 then
						Result.append_character ('E')
						if the_exponent < 0 then
							Result.append_character ('-')
						else
							Result.append_character ('+')
						end
						Result.append_string ((printed_exponent.abs).out)
					end
				else
					if exponent < 0 then
						after_point_count := exponent.abs
						if after_point_count > str_coefficient.count then
							create str_zero_pad.make_filled ('0', after_point_count - str_coefficient.count)
							Result.append_string ("0.")
							Result.append_string (str_zero_pad)
							Result.append_string (str_coefficient)
						elseif after_point_count = str_coefficient.count then
							Result.append_string ("0.")
							Result.append_string (str_coefficient)
						else
							Result.append_string (str_coefficient.substring (1, str_coefficient.count - after_point_count))
							Result.append_string (".")
							Result.append_string (str_coefficient.substring (str_coefficient.count - after_point_count + 1, str_coefficient.count))
						end
					else
						Result.append_string (str_coefficient)
					end
				end
			end
		ensure
			to_string_not_void: Result /= Void
		end

feature {NONE} -- Implementation

	parser: MA_DECIMAL_TEXT_PARSER is
			-- Decimal text parser
		once
			create Result.make
		ensure
			parser_not_void: Result /= Void
		end

	once_zero: MA_DECIMAL is
			-- Shared Zero
		once
			create Result.make_zero
		ensure
			zero_not_void: Result /= Void
			is_zero: Result.is_zero
		end

	once_one: MA_DECIMAL is
			-- Shared One
		once
			create Result.make_one
		ensure
			one_not_void: Result /= Void
			is_one: Result.is_one
		end

	special_coefficient: MA_DECIMAL_COEFFICIENT is
		once
			create {MA_DECIMAL_COEFFICIENT_IMP} Result.make (1)
			Result.put (0, 0)
		ensure
			special_coefficient_not_void: Result /= Void
			zero: Result.is_zero
		end

invariant

	special_values: special >= Special_none and then special <= Special_quiet_nan
	coefficient_not_void: coefficient /= Void
	special_share_coefficient: is_special implies coefficient = special_coefficient
	special_has_exponent_zero: is_special implies exponent = 0
	special_coefficient_is_zero: special_coefficient.is_zero

end
