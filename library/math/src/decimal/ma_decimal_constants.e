note

	description:

		"Access to decimal math constants and shared context"

	library: "Gobo Eiffel Decimal Arithmetic Library"
	copyright: "Copyright (c) 2004-2018, Paul G. Crismer and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class MA_DECIMAL_CONSTANTS

inherit

	MA_SHARED_DECIMAL_CONTEXT

	KL_SHARED_PLATFORM
		export {NONE} all end

feature -- Access

	zero: MA_DECIMAL
			-- Neutral element for "+" and "-"
		once
			create Result.make (1)
			Result := Result.zero
		ensure
			instance_free: class
			zero_not_void: Result /= Void
		end

	negative_zero: MA_DECIMAL
			-- Negative zero
		once
			Result := zero.negative_zero
		ensure
			instance_free: class
			negative_zero_not_void: Result /= Void
		end

	one: MA_DECIMAL
			-- Neutral element for "*" and "/"
		once
			Result := zero.one
		ensure
			instance_free: class
			one_not_void: Result /= Void
		end

	minus_one: MA_DECIMAL
			-- Minus one
		once
			Result := zero.minus_one
		ensure
			instance_free: class
			minus_not_void: Result /= Void
		end

	infinity: MA_DECIMAL
			-- Infinity
		once
			Result := zero.infinity
		ensure
			instance_free: class
			infinity_not_void: Result /= Void
		end

	negative_infinity: MA_DECIMAL
			-- Negative infinity
		once
			Result := zero.negative_infinity
		ensure
			instance_free: class
			negative_infinity_not_void: Result /= Void
		end

	not_a_number: MA_DECIMAL
			-- Not a Number
		once
			Result := zero.nan
		ensure
			instance_free: class
			not_a_number: Result /= Void
		end

	signaling_not_a_number: MA_DECIMAL
			-- Signaling Not a Number
		once
			Result := zero.snan
		ensure
			instance_free: class
			signaling_not_a_number: Result /= Void
		end

	minimum_integer: MA_DECIMAL
			-- Minimum value convertible to integer
		local
			ctx: MA_DECIMAL_CONTEXT
		once
			create ctx.make_double_extended
			create Result.make_from_string_ctx (Platform.Minimum_integer.out, ctx)
		ensure
			instance_free: class
			minimum_integer_not_void: Result /= Void
		end

	maximum_integer: MA_DECIMAL
			-- Maximum value convertible to integer
		local
			ctx: MA_DECIMAL_CONTEXT
		once
			create ctx.make_double_extended
			create Result.make_from_string_ctx (Platform.Maximum_integer.out, ctx)
		ensure
			instance_free: class
			maximum_integer_not_void: Result /= Void
		end

end
