note

	description:

		"Routines that ought to be in class DOUBLE"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2003-2018, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class KL_DOUBLE_ROUTINES

inherit

	DOUBLE_MATH
		rename
			log as old_log,
			log10 as old_log10,
			exp as old_exp
		export
			{NONE} all
		end

	KL_SHARED_PLATFORM

feature -- Logarithms

	log (d: DOUBLE): DOUBLE
			-- Natural logarithm of `d'
		require
			d_positive: d > 0.0
		do
			Result := old_log (d)
		ensure
			instance_free: class
		end

	log2 (d: DOUBLE): DOUBLE
			-- Base 2 logarithm of `d'
		require
			d_positive: d > 0.0
		do
			Result := log_2 (d)
		ensure
			instance_free: class
		end

	log10 (d: DOUBLE): DOUBLE
			-- Base 10 logarithm of `d'
		require
			d_positive: d > 0.0
		do
			Result := old_log10 (d)
		ensure
			instance_free: class
		end

feature -- Exponent

	exp (d: DOUBLE): DOUBLE
			-- Inverse of the natural logarithm
		do
			Result := old_exp (d)
		ensure
			instance_free: class
		end

	nth_root (d, n: DOUBLE): DOUBLE
			-- `n'-th root of `d'
		require
			divisible: (1.0).divisible (n)
		do
			Result := d ^ (1.0 / n)
		ensure
			instance_free: class
		end

feature -- Conversion

	truncated_to_integer (d: DOUBLE): INTEGER
			-- Integer part (Same sign, largest absolute
			-- value no greater than current object's)
		require
			d_large_enough: d >= Platform.Minimum_integer
			d_small_enough: d <= Platform.Maximum_integer
		do
			Result := d.truncated_to_integer
		ensure
			instance_free: class
		end

	rounded_to_integer (d: DOUBLE): INTEGER
			-- Rounded integral value
		require
			d_large_enough: (d.abs + 0.5) >= Platform.Minimum_integer
			d_small_enough: (d.abs + 0.5) < (Platform.Maximum_integer + 1.0)
		do
			Result := d.rounded
		ensure
			instance_free: class
			definition: Result = d.sign * floor_to_integer (d.abs + 0.5)
		end

	floor_to_integer (d: DOUBLE): INTEGER
			-- INTEGER floor
		require
			d_large_enough: d >= Platform.Minimum_integer
			d_small_enough: d < (Platform.Maximum_integer + 1.0)
		do
			Result := d.truncated_to_integer
			if d.floor /= Result then
				Result := Result - 1
			end
		ensure
			instance_free: class
			definition: Result = d.floor
		end

feature -- NaN

	is_nan (d: DOUBLE): BOOLEAN
			-- Does `d' correspond to a Not-A-Number?
		do
			Result := d.is_nan
		ensure
			instance_free: class
		end

feature -- Infinity

	is_plus_infinity (d: DOUBLE): BOOLEAN
			-- Does `d' correspond to positive infinity?
		do
			Result := d.is_positive_infinity
		ensure
			instance_free: class
		end

	is_minus_infinity (d: DOUBLE): BOOLEAN
			-- Does `d' correspond to minus infinity?
		do
			Result := d.is_negative_infinity
		ensure
			instance_free: class
		end

	plus_infinity: DOUBLE
			-- Positive infinity
		local
			p: MANAGED_POINTER
		once
				-- Binary representation of IEEE 754 '+infinity'.
				-- See: http://en.wikipedia.org/wiki/IEEE_754
			create p.make (8)
			p.put_natural_8 (0, 0)
			p.put_natural_8 (0, 1)
			p.put_natural_8 (0, 2)
			p.put_natural_8 (0, 3)
			p.put_natural_8 (0, 4)
			p.put_natural_8 (0, 5)
			p.put_natural_8 (240, 6)
			p.put_natural_8 (127, 7)
			Result := p.read_real_64 (0)
		ensure
			instance_free: class
			positive: Result > 0
		end

	minus_infinity: DOUBLE
			-- Negative infinity
		local
			p: MANAGED_POINTER
		once
				-- Binary representation of IEEE 754 '-infinity'.
				-- See: http://en.wikipedia.org/wiki/IEEE_754
			create p.make (8)
			p.put_natural_8 (0, 0)
			p.put_natural_8 (0, 1)
			p.put_natural_8 (0, 2)
			p.put_natural_8 (0, 3)
			p.put_natural_8 (0, 4)
			p.put_natural_8 (0, 5)
			p.put_natural_8 (240, 6)
			p.put_natural_8 (255, 7)
			Result := p.read_real_64 (0)
		ensure
			instance_free: class
			negative: Result < 0
		end

end
