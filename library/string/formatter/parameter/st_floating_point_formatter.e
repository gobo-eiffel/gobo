indexing

	description:

		"Formatters for double parameters, $e or $E"

	formatting_rules: "[
		The double parameter is rounded and formatted in the style
		[-]d.ddde±dd where there is one digit before the decimal-point
		character and the number of digits after it is equal to the
		precision; if the precision is missing, it is taken as 6; if
		the precision is zero, no decimal-point character appears. An E
		formatting uses the letter E (rather than e) to introduce the
		exponent. The exponent always contains at least two digits; if
		the value is zero, the exponent is 00.
	]"
	library: "Gobo Eiffel String Library"
	copyright: "Copyright (c) 2004-2005, Object-Tools and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ST_FLOATING_POINT_FORMATTER

inherit

	ST_DOUBLE_FORMATTER

create

	make

feature -- Formatting

	double_format_to (a_parameter: DOUBLE; a_stream: KI_CHARACTER_OUTPUT_STREAM) is
			-- Format `a_parameter' to `a_stream'.
		local
			fa, mantissa: DOUBLE
			exponent: INTEGER
			fixed_part: DOUBLE
		do
			fa := a_parameter.abs
			fsign := double_sign (a_parameter)
			if a_parameter /= 0 then
				exponent := DOUBLE_.floor_to_integer (DOUBLE_.log10 (fa))
			else
				exponent := 0
			end
			mantissa := fa / ten_power (exponent)
			fixed_part := fsign * mantissa
			build_integer_and_fractional_parts (fixed_part)
			STRING_.wipe_out (double_buffer)
			string_output_stream.set_string (double_buffer)
			decimal_formatter.reset_options
			decimal_formatter.set_space_sign_enabled (space_sign_enabled)
			decimal_formatter.set_plus_sign_enabled (plus_sign_enabled)
			decimal_formatter.integer_format_to (integer_part, string_output_stream)
			double_buffer.append_string (fractional_part)
			if is_lowercase then
				double_buffer.append_character ('e')
			else
				double_buffer.append_character ('E')
			end
			decimal_formatter.reset_options
			decimal_formatter.set_precision (2)
			decimal_formatter.set_plus_sign_enabled (True)
			decimal_formatter.integer_format_to (exponent, string_output_stream)
			justify_format_to (double_buffer, a_stream)
		end

feature {NONE} -- Implementation

	ten_power (x: INTEGER): DOUBLE is
			-- 10^x.
		do
			if x < 0 then
				Result := 1.0 / (10.0 ^ (-x))
			else
				Result := 10.0 ^ x
			end
		end

end
