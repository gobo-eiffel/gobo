﻿note

	description:

		"Context constants for the Decimal Arithmetic library"

	library: "Gobo Eiffel Decimal Arithmetic Library"
	copyright: "Copyright (c) 2004-2018, Paul G. Crismer and others"
	license: "MIT License"

class MA_DECIMAL_CONTEXT_CONSTANTS

inherit

	ANY

	KL_SHARED_PLATFORM
		export {NONE} all end

	MA_SHARED_DECIMAL_CONSTANTS
		export {NONE} all end

	KL_IMPORTED_ARRAY_ROUTINES

feature -- Constants: rounding modes

	Round_up: INTEGER = 0
			-- Rounding mode to round away from zero;
			-- If any of the discarded digits are non-zero then the result will be rounded up (away from zero).

	Round_down: INTEGER = 1
			-- Rounding mode to round towards zero;
			-- If any of the discarded digits are non-zero then the result should be rounded towards the next ore negative digit.

	Round_ceiling: INTEGER = 2
			-- Rounding mode to round to a more positive number;
			-- All discarded digits are ignored (truncated). The result is neither incremented nor decremented.

	Round_floor: INTEGER = 3
			-- Rounding mode to round to a more negative number;
			-- If any of the discarded digits are non-zero then the result should be rounded towards the next more negative digit.

	Round_half_up: INTEGER = 4
			-- Rounding mode to round to nearest neighbor, where an equidistant value is rounded up;
			-- If the discarded digits represent greater than or equal to half (0.5 times) the value
			-- of a one in the next position then the result should be rounded up (away from zero).
			-- Otherwise the discarded digits are ignored.

	Round_half_down: INTEGER = 5
			-- Rounding mode to round to nearest neighbor, where an equidistant value is rounded down;
			-- If the discarded digits represent greater than half (0.5 times)
			-- the value of a one in the next position then the result should be
			-- rounded up (away from zero). Otherwise the discarded digits are ignored.

	Round_half_even: INTEGER = 6
			-- Rounding mode to round to nearest neighbor, where an equidistant value is rounded to the nearest even neighbor;
			-- If the discarded digits represent greater than half (0.5 times) the value of a one in the next position then the result should be
			-- rounded up (away from zero).
			-- If they represent less than half, then the result should be rounded down.
			-- Otherwise (they represent exactly half) the result is rounded down if its rightmost digit is even, or rounded up if its
			-- rightmost digit is odd (to make an even digit).

	Round_unnecessary: INTEGER = 7
			-- Rounding mode to assert that no rounding is necessary;
			-- Rounding (potential loss of information) is not permitted.
			-- If any of the discarded digits are non-zero then an 'ArithmeticException'should be thrown.

feature -- Constants: signals

	Signal_division_by_zero: INTEGER = 1
			-- Non Zero dividend is divided by zero

	Signal_inexact: INTEGER = 2
			-- A result is not exact, or overflows or underflows without being trapped

	Signal_invalid_operation: INTEGER = 3
			-- A result would be undefined or impossible

	Signal_lost_digits: INTEGER = 4
			-- Non-zero digits have been discarded before an operation

	Signal_overflow: INTEGER = 5
			-- The exponent of a result is too large to be represented

	Signal_rounded: INTEGER = 6
			-- A result has been rounded, that is, some zero or non-zero digits were discarded

	Signal_underflow: INTEGER = 7
			-- The exponent of a result is too small to be represented

	Signal_subnormal: INTEGER = 8

feature -- Constants: limits

	Minimum_digits: INTEGER = 1

	Maximum_digits: INTEGER = 999_999_999

	Minimum_exponent: INTEGER = -999_999_999
			-- Minimum exponent allowed

	Maximum_exponent: INTEGER = 999_999_999
			-- Maximum exponent allowed

	Minimum_integer_as_decimal: MA_DECIMAL
			-- Minimum value convertible to integer
		obsolete
			"Use MA_DECIMAL_CONSTANTS.minimum_integer instead. [2005-09-11]"
		once
			Result := decimal.minimum_integer
		ensure
			instance_free: class
			minimum_integer_not_void: Result /= Void
		end

	Maximum_integer_as_decimal: MA_DECIMAL
			-- Maximum value convertible to integer
		obsolete
			"Use MA_DECIMAL_CONSTANTS.maximum_integer instead. [2005-09-11]"
		once
			Result := decimal.maximum_integer
		ensure
			instance_free: class
			maximum_integer_not_void: Result /= Void
		end

feature -- Constants: defaults

	Default_digits: INTEGER = 9

	Default_traps: ARRAY [INTEGER]
		once
			Result := <<Signal_division_by_zero, Signal_invalid_operation, Signal_overflow, Signal_underflow>>
		ensure
			instance_free: class
			default_traps_not_void: Result /= Void
			has_division_by_zero: INTEGER_ARRAY_.has (Result, Signal_division_by_zero)
			has_invalid_operation: INTEGER_ARRAY_.has (Result, Signal_invalid_operation)
			has_overflow: INTEGER_ARRAY_.has (Result, Signal_overflow)
			has_underflow: INTEGER_ARRAY_.has (Result, Signal_underflow)
		end

	Default_rounding_mode: INTEGER
			-- Default rounding mode
		once
			Result := Round_half_up
		ensure
			instance_free: class
			definition: Result = Round_half_up
		end

feature -- Constants: special flags

	Special_none: INTEGER = 0

	Special_infinity: INTEGER = 1

	Special_signaling_nan: INTEGER = 2

	Special_quiet_nan: INTEGER = 3

feature -- Constants: support

	Rounds: ARRAY [INTEGER]
			-- Rounding modes
		once
			Result := <<Round_half_up, Round_unnecessary, Round_ceiling, Round_down, Round_floor, Round_half_down, Round_half_even, Round_up>>
		ensure
			instance_free: class
			rounds_not_void: Result /= Void
		end

	Round_words: ARRAY [STRING]
			-- Textual representation of rounding modes
		once
			Result := <<"Round_up", "Round_down", "Round_ceiling", "Round_floor", "Round_half_up",
				"Round_half_down", "Round_half_even", "Round_unnecessary">>
		ensure
			instance_free: class
			round_word_not_void: Result /= Void
			no_void_round_words: not ANY_ARRAY_.has (Result, Void)
		end

	signals: ARRAY [INTEGER]
			-- Signals
		once
			Result := << Signal_division_by_zero, Signal_inexact, Signal_invalid_operation,
				Signal_lost_digits, Signal_overflow, Signal_rounded, Signal_underflow, Signal_subnormal>>
		ensure
			instance_free: class
			signals_not_void: Result /= Void
		end

	Signal_words: ARRAY [STRING]
			-- Textual representation of signals
		once
			Result := << "division_by_zero", "inexact", "invalid_operation",
				"lost_digits", "overflow", "rounded", "underflow", "subnormal">>
		ensure
			instance_free: class
			signal_words_not_void: Result /= Void
			no_void_signal_words: not ANY_ARRAY_.has (Result, Void)
		end

end
