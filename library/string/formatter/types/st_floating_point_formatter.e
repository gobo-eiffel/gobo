indexing

	description:

		"Format floating point values, ?e or ?E."

	conversion_rules:

		"The double argument is rounded and converted in the style%
		%[-]d.ddde±dd where there is one digit before the decimal-point%
		%character and the number of digits after it is equal to the%
		%precision; if the precision is missing, it is taken as 6; if%
		%the precision is zero, no decimal-point character appears. An E%
		%conversion uses the letter E (rather than e) to introduce the%
		%exponent. The exponent always contains at least two digits; if%
		%the value is zero, the exponent is 00."

	library: "Gobo Eiffel Formatter Library"
	origins: "Based on code from Object Tools."
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"


class

	ST_FLOATING_POINT_FORMATTER


inherit

	ST_FIXED_POINT_FORMATTER
		rename
			make as make_fixed_point
		redefine
			output
		end

	KL_DOUBLE_ROUTINES
		export
			{NONE} all
		end


creation

	make


feature {NONE} -- Initialization

	make (a_use_uppercase_digit: BOOLEAN) is
		-- Initialize.
		do
			make_fixed_point
			use_uppercase_digit := a_use_uppercase_digit
		end


feature -- Access

	use_uppercase_digit: BOOLEAN
			-- Should output an 'E' instead of an 'e'?


feature -- Output

	output: STRING is
			-- The double argument is rounded and converted in the style
			-- [-]d.ddde±dd where there is one digit before the
			-- decimal-point character and the number of digits after it
			-- is equal to the precision; if the precision is missing, it
			-- is taken as 6; if the precision is zero, no decimal-point
			-- character appears. The exponent always contains at least
			-- two digits; if the value is zero, the exponent is 00.
		local
			fa, mantissa: DOUBLE
			exponent: INTEGER
			fixed_part: DOUBLE
			before_dot,
			dot_and_after_dot,
			after_exponent: STRING
		do
			fa := value.item.abs
			fsign := double_sign (value.item)
			if value.item /= 0 then
				exponent := (log10 (fa)).floor
			else
				exponent := 0
			end
			mantissa := fa / ten_power (exponent)
			fixed_part := fsign * mantissa
			fa := fixed_part.abs
			integer_part := fa.floor
			fractional_part := fa - integer_part

			dot_and_after_dot := make_fract_part
			integer_formatter.reset_options
			integer_formatter.set_value (integer_part)
			before_dot := integer_formatter.output
			integer_formatter.reset_options
			integer_formatter.set_value (exponent)
			integer_formatter.set_precision (2)
			integer_formatter.set_sign_always (True)
			after_exponent := integer_formatter.output

			Result := before_dot
			Result.append_string (dot_and_after_dot)
			if use_uppercase_digit then
				Result.append_character ('E')
			else
				Result.append_character ('e')
			end
			Result.append_string (after_exponent)
			justify (Result)
		end


feature {NONE} -- Implementation

	ten_power (x: INTEGER): DOUBLE is
			-- Do 10^x.
		do
			if x < 0 then
				Result := 1.0 / (10.0^(-x));
			else
				Result := 10.0^x
			end
		end

end
