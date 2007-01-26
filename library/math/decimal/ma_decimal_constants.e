indexing

	description:

		"Access to decimal math constants and shared context"

	library: "Gobo Eiffel Decimal Arithmetic Library"
	copyright: "Copyright (c) 2004, Paul G. Crismer and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class MA_DECIMAL_CONSTANTS

inherit

	MA_SHARED_DECIMAL_CONTEXT

	KL_SHARED_PLATFORM
		export {NONE} all end

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

	minimum_integer: MA_DECIMAL is
			-- Minimum value convertible to integer
		local
			ctx: MA_DECIMAL_CONTEXT
		once
			create ctx.make_double_extended
			create Result.make_from_string_ctx (Platform.Minimum_integer.out, ctx)
		ensure
			minimum_integer_not_void: Result /= Void
		end

	maximum_integer: MA_DECIMAL is
			-- Maximum value convertible to integer
		local
			ctx: MA_DECIMAL_CONTEXT
		once
			create ctx.make_double_extended
			create Result.make_from_string_ctx (Platform.Maximum_integer.out, ctx)
		ensure
			maximum_integer_not_void: Result /= Void
		end

end
