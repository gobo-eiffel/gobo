indexing

	description:

		"Routines that ought to be in class DOUBLE"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2003-2006, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class KL_DOUBLE_ROUTINES

inherit























	KL_SHARED_PLATFORM

feature -- Logarithms

	log (d: DOUBLE): DOUBLE is
			-- Natural logarithm of `d'
		require
			d_positive: d > 0.0
		do

			Result := d.log







		end

	log2 (d: DOUBLE): DOUBLE is
			-- Base 2 logarithm of `d'
		require
			d_positive: d > 0.0

		local


			a: DOUBLE




		do




			a := 2.0


			Result := d.log / a.log




		end

	log10 (d: DOUBLE): DOUBLE is
			-- Base 10 logarithm of `d'
		require
			d_positive: d > 0.0
		do

			Result := d.log10







		end

feature -- Exponent

	exp (d: DOUBLE): DOUBLE is
			-- Inverse of the natural logarithm
		do

			Result := d.exp







		end

	nth_root (d, n: DOUBLE): DOUBLE is
			-- `n'-th root of `d'
		require



			divisible: (1.0).divisible (n)

		do




			Result := d.pow (1.0 / n)

		end

feature -- Conversion

	truncated_to_integer (d: DOUBLE): INTEGER is
			-- Integer part (Same sign, largest absolute
			-- value no greater than current object's)
		require
			d_large_enough: d >= Platform.Minimum_integer
			d_small_enough: d <= Platform.Maximum_integer
		do
			Result := d.truncated_to_integer
		end

	rounded_to_integer (d: DOUBLE): INTEGER is
			-- Rounded integral value
		require
			d_large_enough: (d.abs + 0.5) >= Platform.Minimum_integer
			d_small_enough: (d.abs + 0.5) < (Platform.Maximum_integer + 1.0)
		do



			Result := d.sign * floor_to_integer (d.abs + 0.5)

		ensure
			definition: Result = d.sign * floor_to_integer (d.abs + 0.5)
		end

	floor_to_integer (d: DOUBLE): INTEGER is
			-- INTEGER floor
			-- (floor returns integer in ELKS, but a floating point value with SE2)
		require
			d_large_enough: d >= Platform.Minimum_integer
			d_small_enough: d < (Platform.Maximum_integer + 1.0)
		do
			Result := d.truncated_to_integer
			if d.floor /= Result then
				Result := Result - 1
			end
		ensure
			definition: Result = d.floor
		end

feature -- NaN

	is_nan (d: DOUBLE): BOOLEAN is
			-- Does `d' correspond to a Not-A-Number?


























		local
			d1: DOUBLE
		do
			d1 := d
			Result := (d /= d1)

		end

feature -- Infinity

	is_plus_infinity (d: DOUBLE): BOOLEAN is
			-- Does `d' correspond to positive infinity?












		do
			Result := (d = plus_infinity)

		end

	is_minus_infinity (d: DOUBLE): BOOLEAN is
			-- Does `d' correspond to minus infinity?












		do
			Result := (d = minus_infinity)

		end

	plus_infinity: DOUBLE is
			-- Positive infinity

































		local
			d1: DOUBLE
			large_number: DOUBLE
		once
				-- Overflow on purpose. Note that Borland bcc 5.5.1 raises
				-- an exception when there is an overflow.
			large_number := 2.0e300
				-- Bug in SE 1.2r7: make sure that this once-function is
				-- not precomputed otherwise MSVC 7.1 complains about a
				-- division by zero at compilation time.
			-- Result := large_number * large_number
			d1 := large_number
			Result := d1 * d1


		ensure
			positive: Result > 0
		end

	minus_infinity: DOUBLE is
			-- Negative infinity

































		local
			d1, d2: DOUBLE
			large_number: DOUBLE
			large_negative_number: DOUBLE
		once
				-- Overflow on purpose. Note that Borland bcc 5.5.1 raises
				-- an exception when there is an overflow.
			large_number := 2.0e300
			large_negative_number := -2.0e300
				-- Bug in SE 1.2r7: make sure that this once-function is
				-- not precomputed otherwise MSVC 7.1 complains about a
				-- division by zero at compilation time.
			-- Result := large_number * large_negative_number
			d1 := large_number
			d2 := large_negative_number
			Result := d1 * d2


		ensure
			negative: Result < 0
		end

end
