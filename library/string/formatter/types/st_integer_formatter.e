indexing

	description:

		"Format integers, ?i."

	conversion_rules:
		"Precision, if not -1, gives the minimum of digits that must appear;%
		%if the converted value requires fewer digits, it is padded on the%
		%left with zeros. The default precision is 1. When 0 is printed with%
		%an explicit precision 0, the output is empty."

	library: "Gobo Eiffel Formatter Library"
	origins: "Based on code from Object Tools."
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ST_INTEGER_FORMATTER

inherit

	ST_UNSIGNED_DECIMAL_INTEGER_FORMATTER
		redefine
			is_valid_value,
			output,
			reset_options
		end

creation

	make

feature -- State

	output_sign: BOOLEAN is
			-- Should there be a `sign' in the output?
		do
			Result := sign_always or else value.item < 0
		end

	reset_options is
			-- Reset any flags/options to their default values.
		do
			precursor
			set_sign_always (False)
		end

	sign: CHARACTER is
			-- The sign to output
		do
			if value.item < 0 then
				Result := '-'
			else
				Result := '+'
			end
		end

feature -- Value

	is_valid_value (a_value: like value): BOOLEAN is
			-- Is `a_value' not void?
		do
			Result := a_value /= Void
		end

feature -- Output

	output: STRING is
			-- Formatted `value'
		do
			if (not is_precision_given) and then (value.item = 0) then
				Result := ""
			else
				Result := get_plain_number_image (value.item.abs)
				if is_precision_given then
					left_pad (Result, '0', precision)
				end
				inspect alignment
				when align_left then
					if output_sign then
						Result.insert_character (sign, 1)
					end
					right_pad (Result, align_char, width)
				when align_right then
					if align_char = '0' then
						if output_sign then
							left_pad (Result, align_char, width-1)
							Result.append_character (sign)
						else
							left_pad (Result, align_char, width)
						end
					else -- align right with ' '
						if output_sign then
							Result.insert_character (sign, 1)
						end
						left_pad (Result, align_char, width)
					end
				when align_center then
					if output_sign then
						Result.insert_character (sign, 1)
					end
					center_pad (Result,  ' ', width)
				end
			end
		end

end
