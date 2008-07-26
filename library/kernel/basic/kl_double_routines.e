indexing

	description:

		"Routines that ought to be in class DOUBLE"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2003-2008, Eric Bezault and others"
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

	log (d: DOUBLE): DOUBLE is
			-- Natural logarithm of `d'
		require
			d_positive: d > 0.0
		do
			Result := old_log (d)
		end

	log2 (d: DOUBLE): DOUBLE is
			-- Base 2 logarithm of `d'
		require
			d_positive: d > 0.0
		do
			Result := log_2 (d)
		end

	log10 (d: DOUBLE): DOUBLE is
			-- Base 10 logarithm of `d'
		require
			d_positive: d > 0.0
		do
			Result := old_log10 (d)
		end

feature -- Exponent

	exp (d: DOUBLE): DOUBLE is
			-- Inverse of the natural logarithm
		do
			Result := old_exp (d)
		end

	nth_root (d, n: DOUBLE): DOUBLE is
			-- `n'-th root of `d'
		require
			divisible: (1.0).divisible (n)
		do
			Result := d ^ (1.0 / n)
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
			Result := d.rounded
		ensure
			definition: Result = d.sign * floor_to_integer (d.abs + 0.5)
		end

	floor_to_integer (d: DOUBLE): INTEGER is
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
			definition: Result = d.floor
		end

feature -- NaN

	is_nan (d: DOUBLE): BOOLEAN is
			-- Does `d' correspond to a Not-A-Number?
		local
			p1: MANAGED_POINTER
			b1, b2, b3, b4, b5, b6, b7, b8: NATURAL_8
		do
			if d /= d then
				Result := True
			else
					-- Comparing `d' with itself directly should return False in case
					-- of NaN as explained in http://en.wikipedia.org/wiki/NaN. But
					-- there is a bug in lcc-win32 when used as back-end C compiler
					-- of gec. Hence this other algorithm.
				create p1.make (8)
				p1.put_real_64 (d, 0)
				b1 := p1.read_natural_8 (0)
				b2 := p1.read_natural_8 (1)
				b3 := p1.read_natural_8 (2)
				b4 := p1.read_natural_8 (3)
				b5 := p1.read_natural_8 (4)
				b6 := p1.read_natural_8 (5)
				b7 := p1.read_natural_8 (6)
				b8 := p1.read_natural_8 (7)
				if b8 = 127 or b8 = 255 then
					if b7 > 240 then
						Result := True
					elseif b7 = 240 then
						Result := b6 /= 0 or b5 /= 0 or b4 /= 0 or b3 /= 0 or b2 /= 0 or b1 /= 0
					end
				end
			end
		end

feature -- Infinity

	is_plus_infinity (d: DOUBLE): BOOLEAN is
			-- Does `d' correspond to positive infinity?
		local
			p1, p2: MANAGED_POINTER
		do
				-- Do not compare `d' with `plus_infinity' directly as a workaround
				-- because of a bug in lcc-win32 when used as back-end C compiler of gec.
			if d /= d then
					-- This is a Nan.
				Result := False
			else
				create p1.make (8)
				p1.put_real_64 (d, 0)
				create p2.make (8)
				p2.put_real_64 (plus_infinity, 0)
				Result := p1.read_natural_64 (0) = p2.read_natural_64 (0)
			end
		end

	is_minus_infinity (d: DOUBLE): BOOLEAN is
			-- Does `d' correspond to minus infinity?
		local
			p1, p2: MANAGED_POINTER
		do
				-- Do not compare `d' with `minus_infinity' directly as a workaround
				-- because of a bug in lcc-win32 when used as back-end C compiler of gec.
			if d /= d then
					-- This is a Nan.
				Result := False
			else
				create p1.make (8)
				p1.put_real_64 (d, 0)
				create p2.make (8)
				p2.put_real_64 (minus_infinity, 0)
				Result := p1.read_natural_64 (0) = p2.read_natural_64 (0)
			end
		end

	plus_infinity: DOUBLE is
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
			positive: Result > 0
		end

	minus_infinity: DOUBLE is
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
			negative: Result < 0
		end

end
