note

	description:

		"User selectable parameters and rules which govern the results of decimal arithmetic operations"

	library: "Gobo Eiffel Decimal Arithmetic Library"
	copyright: "Copyright (c) 2004, Paul G. Crismer and others"
	license: "MIT License"

class MA_DECIMAL_CONTEXT

inherit

	ANY
		redefine
			out,
			copy,
			is_equal
		end

	KL_CLONABLE
		undefine
			out,
			copy,
			is_equal
		end

	MA_DECIMAL_CONTEXT_CONSTANTS
		undefine
			out,
			copy,
			is_equal
		end

	KL_SHARED_EXCEPTIONS
		undefine
			out,
			copy,
			is_equal
		end

	KL_IMPORTED_STRING_ROUTINES
		undefine
			out,
			copy,
			is_equal
		end

	KL_IMPORTED_ARRAY_ROUTINES
		undefine
			out,
			copy,
			is_equal
		end

create

	make_default,
	make_double,
	make_extended,
	make_double_extended,
	make

feature {NONE} -- Initialization

	make_default
			-- Create a new default context for general purpose arithmetic (IEEE 854), single precision.
		local
			index: INTEGER
		do
			make (Default_digits, Default_rounding_mode)
			from
				index := Default_traps.lower
			until
				index > Default_traps.upper
			loop
				enable_trap (Default_traps.item (index))
				index := index + 1
			end
		ensure
			default_digits: digits = Default_digits
			default_rounding_mode: rounding_mode = Default_rounding_mode
			trap_division_by_zero: is_trapped (Signal_division_by_zero)
			trap_invalid_operation: is_trapped (Signal_invalid_operation)
			trap_overflow: is_trapped (Signal_overflow)
			trap_underflow: is_trapped (Signal_underflow)
		end

	make_double
			-- Create a new double precision context.
		do
			make_default
			digits := 2 * Default_digits + 1
		ensure
			default_digits: digits = 2 * Default_digits + 1
			default_rounding_mode: rounding_mode = Default_rounding_mode
			trap_division_by_zero: is_trapped (Signal_division_by_zero)
			trap_invalid_operation: is_trapped (Signal_invalid_operation)
			trap_overflow: is_trapped (Signal_overflow)
			trap_underflow: is_trapped (Signal_underflow)
		end

	make_extended
			-- Create a new extended default context (IEEE 854), single precision.
		do
			make (Default_digits, Round_half_even)
			is_extended := True
		ensure
			default_digits: digits = Default_digits
			default_rounding_mode: rounding_mode = Round_half_even
		end

	make_double_extended
			-- Create a new extented default context, double precision.
		do
			make_extended
			digits := 2 * Default_digits + 1
		ensure
			default_digits: digits = 2 * Default_digits + 1
			default_rounding_mode: rounding_mode = Round_half_even
		end

	make (a_digits, a_rounding_mode: INTEGER)
			-- Create a new math context.
		require
			a_digits_valid: a_digits >= Minimum_digits and a_digits <= Maximum_digits
			a_rounding_mode_valid: INTEGER_ARRAY_.has (Rounds, a_rounding_mode)
		do
			digits := a_digits
			rounding_mode := a_rounding_mode
			create traps.make_filled (False, Signal_division_by_zero, Signal_subnormal)
			create flags.make_filled (False, Signal_division_by_zero, Signal_subnormal)
			exponent_limit := Maximum_exponent
		ensure
			digits_set: digits = a_digits
			rounding_mode_set: rounding_mode = a_rounding_mode
			exponent_limit: exponent_limit = Maximum_exponent
		end

feature -- Access

	digits: INTEGER
			-- Number of digits (precision) to be used for an operation.
			-- The DECIMAL operators use this value to determine the precision of results.
			-- Note that leading zeros (in the integer part of a number) are never significant.

	precision: INTEGER
			-- Synonym for 'digits'
		do
			Result := digits
		ensure
			synonym_of_digits: Result = digits
		end

	rounding_mode: INTEGER
			-- Rounding algorithm to be used for an operation when non-zero digits have to
			-- be discarded in order to reduce the precision of a result

	reason: detachable STRING
			-- Reason of latest raised signal

	exponent_limit: INTEGER
			-- Exponent limit;
			-- Exponents can range from -exponent_limit through +exponent_limit

	e_tiny: INTEGER
			-- Minimum value of the exponent for subnormal numbers
		do
			Result := (-exponent_limit) - (digits - 1)
		end

feature -- Access

	default_context: MA_DECIMAL_CONTEXT
			-- Default context for general purpose arithmetic
		obsolete
			"Use MA_SHARED_DECIMAL_CONTEXT instead. [2005-09-11]"
		once
			create Result.make_default
		ensure
			default_context_not_void: Result /= Void
		end

feature -- Status report

	is_flagged (a_signal: INTEGER): BOOLEAN
			-- Is `a_signal' flagged?
		require
			valid_signal: valid_signal (a_signal)
		do
			Result := flags.item (a_signal)
		end

	is_trapped (a_signal: INTEGER): BOOLEAN
			-- Is `a_signal' trapped?
		require
			valid_signal: valid_signal (a_signal)
		do
			Result := traps.item (a_signal)
		end

	valid_signal (a_signal: INTEGER): BOOLEAN
			-- Is `a_signal' a valid one?
		do
			Result := INTEGER_ARRAY_.has (signals, a_signal)
		end

	is_extended: BOOLEAN
			-- Is current context extended?

	exception_on_trap: BOOLEAN
			-- Should an exception be raised when trap occurs?

feature -- Element change

	set_digits (some_digits: INTEGER)
			-- Set `digits' to `some_digits'.
		require
			some_digits_valid: some_digits >= Minimum_digits and some_digits <= Maximum_digits
		do
			digits := some_digits
		ensure
			digits_set: digits = some_digits
		end

	set_exponent_limit (a_limit: INTEGER)
			-- Set `exponent_limit' to `a_limit'.
		require
			limit_positive: a_limit >= 0
		do
			exponent_limit := a_limit
		ensure
			limit_set: exponent_limit = a_limit
		end

	enable_exception_on_trap
			-- Enable exception when trap occurs.
		do
			exception_on_trap := True
		end

	disable_exception_on_trap
			-- Disable exception when trap occurs.
		do
			exception_on_trap := False
		end

	enable_trap (a_signal: INTEGER)
			-- Enable trapping of `a_signal'.
		require
			valid_signal: valid_signal (a_signal)
		do
			traps.put (True, a_signal)
		ensure
			trapped_signal: is_trapped (a_signal)
		end

	disable_trap (a_signal: INTEGER)
			-- Enable trapping of `a_signal'.
		require
			valid_signal: valid_signal (a_signal)
		do
			traps.put (False, a_signal)
		ensure
			not_trapped_signal: not is_trapped (a_signal)
		end

	set_flag (a_signal: INTEGER)
			-- Flag `a_signal'.
		require
			valid_signal: valid_signal (a_signal)
		do
			flags.put (True, a_signal)
		ensure
			flagged_signal: is_flagged (a_signal)
		end

	reset_flag (a_signal: INTEGER)
			-- Reset `a_signal'.
		require
			valid_signal: valid_signal (a_signal)
		do
			flags.put (False, a_signal)
		ensure
			unflagged_signal: not is_flagged (a_signal)
		end

	reset_flags
			-- Reset all signals to zero.
		local
			i, nb: INTEGER
		do
			from
				i := flags.lower
				nb := flags.upper
			until
				i > nb
			loop
				flags.put (False, i)
				i := i + 1
			end
		end

	set_rounding_mode (a_mode: INTEGER)
			-- Set `rounding_mode' to `a_mode'.
		require
			valid_mode: INTEGER_ARRAY_.has (Rounds, a_mode)
		do
			rounding_mode := a_mode
		ensure
			rounding_mode_set: rounding_mode = a_mode
		end

	set_extended
			-- Set `is_extended' to True.
		do
			is_extended := True
		ensure
			extended: is_extended
		end

	set_normal
			-- Set `is_extended' to False.
		do
			is_extended := False
		ensure
			normal: not is_extended
		end

feature -- Conversion

	out: STRING
			-- Printable representation
		do
			create Result.make (30)
			Result.append_string ("digits=")
			Result.append_string (digits.out)
			Result.append_string (" rounding_mode=")
			Result.append_string (Round_words.item (Round_words.lower + rounding_mode))
		end

feature -- Comparison

	is_equal (other: like Current): BOOLEAN
			-- Is `other' equal to Current?
		do
			Result := digits = other.digits
			Result := Result and then exception_on_trap = other.exception_on_trap
			Result := Result and then exponent_limit = other.exponent_limit
			Result := Result and then flags.is_equal (other.flags)
			Result := Result and then is_extended = other.is_extended
			Result := Result and then rounding_mode = other.rounding_mode
			Result := Result and then traps.is_equal (other.traps)
		end

feature -- Basic operations

	signal (a_signal: INTEGER; a_message: STRING)
			-- Raise flag `a_signal' for `a_message' reason.
		require
			valid_signal: valid_signal (a_signal)
			a_message_not_void: a_message /= Void
		local
			exception_message: STRING
		do
			set_flag (a_signal)
			reason := a_message
			if is_trapped (a_signal) and then exception_on_trap then
				exception_message := STRING_.cloned_string (Signal_words.item (a_signal))
				exception_message.append_string (" : ")
				exception_message.append_string (a_message)
				Exceptions.raise (exception_message)
			end
		ensure
			flagged_signal: is_flagged (a_signal)
			reason_set: reason = a_message
		end

feature -- Duplication

	copy (other: like Current)
			-- Copy `other'.
		do
			standard_copy (other)
			flags := BOOLEAN_ARRAY_.cloned_array (other.flags)
			traps := BOOLEAN_ARRAY_.cloned_array (other.traps)
		end

feature {MA_DECIMAL_HANDLER, MA_DECIMAL_CONTEXT} -- Signals

	flags: ARRAY [BOOLEAN]
			-- Signals flagged

	traps: ARRAY [BOOLEAN]
			-- Signals trapped

feature {MA_DECIMAL} -- Implementation

	force_digits (d: INTEGER)
			-- Force digits to `d', just for do_underflow.
		require
			d_positive: d >= 0
		do
			digits := d
		ensure
			digits_set: digits = d
		end

invariant

	positive_digits: digits >= 0
	rounding_mode_valid: rounding_mode = Round_ceiling or rounding_mode = Round_down
		or rounding_mode = Round_floor or rounding_mode = Round_half_down
		or rounding_mode = Round_half_even or rounding_mode = Round_half_up
		or rounding_mode = Round_unnecessary or rounding_mode = Round_up
	flags_not_void: flags /= Void
	flags_lower: flags.lower = Signal_division_by_zero
	flags_upper: flags.upper = Signal_subnormal
	traps_not_void: traps /= Void
	traps_lower: traps.lower = Signal_division_by_zero
	traps_upper: traps.upper = Signal_subnormal

end
