indexing

	description:

		"Formatters for double parameters, $g or $G"

	formatting_rules: "[
		The precision specifies the number of significant digits. If
		the precision is missing, 6 digits are given; if the precision
		is zero, it is treated as 1. Style 'e' is used if the exponent
		from its conversion is less than -4 or greater than or equal to
		the precision. A decimal point appears only if it is
		followed by at least one digit.
	]"
	library: "Gobo Eiffel String Library"
	copyright: "Copyright (c) 2004-2005, Object-Tools and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ST_FIXED_OR_FLOATING_POINT_FORMATTER

inherit

	ST_FIXED_POINT_FORMATTER
		redefine
			double_format_to
		end

	ST_FLOATING_POINT_FORMATTER
		redefine
			double_format_to
		end

create

	make

feature -- Formatting

	double_format_to (a_parameter: DOUBLE; a_stream: KI_CHARACTER_OUTPUT_STREAM) is
			-- Format `a_parameter' to `a_stream'.
		local
			fa: DOUBLE
			exponent: INTEGER
			a_sign: INTEGER
			use_style_e: BOOLEAN
		do
			if precision = 0 then
				precision := 1
			end
			fa := a_parameter.abs
			a_sign := double_sign (a_parameter)
			if a_parameter /= 0 then
				exponent := a_sign * DOUBLE_.floor_to_integer (DOUBLE_.log10 (fa))
			else
				exponent := 0
			end
			use_style_e := (exponent < -4) or else (exponent >= precision)
			if use_style_e then
				precursor {ST_FLOATING_POINT_FORMATTER} (a_parameter, a_stream)
			else
				precursor {ST_FIXED_POINT_FORMATTER} (a_parameter, a_stream)
			end
		end

end
