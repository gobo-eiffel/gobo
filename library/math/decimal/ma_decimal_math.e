indexing

	description:

		"Access to decimal math constants and shared context"

	library: "Gobo Eiffel Decimal Arithmetic Library"
	copyright: "Copyright (c) 2004, Paul G. Crismer and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"

class MA_DECIMAL_MATH

inherit

	MA_SHARED_DECIMAL_CONTEXT

feature -- Access

	zero: MA_DECIMAL is
			-- Neutral element for "+" and "-"
		once
			create Result.make (1)
			Result := Result.zero
		ensure
			zero_not_void: Result /= Void
		end

	negative_zero: MA_DECIMAL is
			-- Negative zero
		once
			Result := zero.negative_zero
		ensure
			negative_zero_not_void: Result /= Void
		end

	one: MA_DECIMAL is
			-- Neutral element for "*" and "/"
		once
			Result := zero.one
		ensure
			one_not_void: Result /= Void
		end

	minus_one: MA_DECIMAL is
			-- Minus one
		once
			Result := zero.minus_one
		ensure
			minus_not_void: Result /= Void
		end

	infinity: MA_DECIMAL is
			-- Infinity
		once
			Result := zero.infinity
		ensure
			infinity_not_void: Result /= Void
		end

	negative_infinity:  MA_DECIMAL is
			-- Negative infinity
		once
			Result := zero.negative_infinity
		ensure
			negative_infinity_not_void: Result /= Void
		end

	not_a_number: MA_DECIMAL is
			-- Not a Number
		once
			Result := zero.nan
		ensure
			not_a_number: Result /= Void
		end

	signaling_not_a_number: MA_DECIMAL is
			-- Signaling Not a Number
		once
			Result := zero.snan
		ensure
			signaling_not_a_number: Result /= Void
		end

end
