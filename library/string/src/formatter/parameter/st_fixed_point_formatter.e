note

	description:

		"Formatters for double parameters, $f"

	formatting_rules: "[
		The double parameter is rounded and converted to decimal
		notation in the style [-]ddd.ddd, where the number of digits
		after the decimal-point character is equal to the precision
		specification. If the precision is missing, it is taken as 6;
		if the precision is explicitly zero, no decimal-point character
		appears. If a decimal point appears, at least one digit
		appears before it.
	]"
	library: "Gobo Eiffel String Library"
	copyright: "Copyright (c) 2004-2005, Object-Tools and others"
	license: "MIT License"

class ST_FIXED_POINT_FORMATTER

inherit

	ST_DOUBLE_FORMATTER

create

	make

feature -- Formatting

	double_format_to (a_parameter: DOUBLE; a_stream: KI_CHARACTER_OUTPUT_STREAM)
			-- Format `a_parameter' to `a_stream'.
		do
			build_integer_and_fractional_parts (a_parameter)
			decimal_formatter.reset_options
			STRING_.wipe_out (double_buffer)
			string_output_stream.set_string (double_buffer)
			inspect alignment
			when align_left then
				decimal_formatter.set_width (1)
				if fsign = -1 and integer_part = 0 then
					string_output_stream.put_character ('-')
				else
					decimal_formatter.set_space_sign_enabled (space_sign_enabled)
					decimal_formatter.set_plus_sign_enabled (plus_sign_enabled)
				end
				decimal_formatter.integer_format_to (integer_part, string_output_stream)
				double_buffer.append_string (fractional_part)
				left_format_to (double_buffer, a_stream)
			when align_right then
				if fsign = -1 and integer_part = 0 then
					decimal_formatter.set_width (1)
					string_output_stream.put_character ('-')
					decimal_formatter.integer_format_to (integer_part, string_output_stream)
					double_buffer.append_string (fractional_part)
					right_format_to (double_buffer, a_stream)
				else
					decimal_formatter.set_space_sign_enabled (space_sign_enabled)
					decimal_formatter.set_plus_sign_enabled (plus_sign_enabled)
					if width - fractional_part.count < 1 then
						decimal_formatter.set_width (1)
					else
						decimal_formatter.set_width (width - fractional_part.count)
					end
					decimal_formatter.set_align_right
					decimal_formatter.integer_format_to (integer_part, a_stream)
					a_stream.put_string (fractional_part)
				end
			when align_center then
				decimal_formatter.set_width (1)
				if fsign = -1 and integer_part = 0 then
					string_output_stream.put_character ('-')
				else
					decimal_formatter.set_space_sign_enabled (space_sign_enabled)
					decimal_formatter.set_plus_sign_enabled (plus_sign_enabled)
				end
				decimal_formatter.integer_format_to (integer_part, string_output_stream)
				double_buffer.append_string (fractional_part)
				center_format_to (double_buffer, a_stream)
			end
		end

end
