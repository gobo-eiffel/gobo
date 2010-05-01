note

	description:

		"XSLT format-number() sub-pictures"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_SUB_PICTURE

inherit

	XM_XPATH_ERROR_TYPES

	XM_XPATH_TOKENS
		export {NONE} all end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

	KL_IMPORTED_INTEGER_ROUTINES
		export {NONE} all end

	UC_IMPORTED_UNICODE_ROUTINES
		export {NONE} all end

	XM_XPATH_SHARED_DECIMAL_CONTEXTS
		export {NONE} all end

	XM_XPATH_STANDARD_NAMESPACES
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_picture: STRING; a_format: XM_XSLT_DECIMAL_FORMAT_ENTRY) is
			-- Establish invariant.
		require
			picture_string_not_void: a_picture /= Void
			decimal_format_not_void: a_format /= Void
		do
			create integral_part_positions.make (3)
			create fractional_part_positions.make (3)
			prefix_string := ""
			suffix_string := ""
			scan_picture_string (a_picture, a_format)
			if not is_error then
				calculate_grouping_positions
			end
		end

feature -- Access

	prefix_string: STRING
			-- Leading passive characters

	suffix_string: STRING
			-- Trailing passive characters

	maximum_integral_part_size: INTEGER
			-- Maximum number of characters in integral part

	minimum_integral_part_size: INTEGER
			-- Number of digit signs and zero-digit signs in integral part

	maximum_fractional_part_size: INTEGER
			-- Maximum number of characters in fractional part

	minimum_fractional_part_size: INTEGER
			-- Minimum number of characters in fractional part

	integral_part_positions: DS_ARRAYED_LIST [INTEGER]
			-- Positions of grouping separators in integral part

	integral_grouping_separator_positions: ARRAY [INTEGER]
			-- Positions of grouping separators

	fractional_part_positions: DS_ARRAYED_LIST [INTEGER]
			-- Positions of grouping separators in fractional part

	fractional_grouping_separator_positions: ARRAY [INTEGER]
			-- Positions of grouping separators

	formatted_number (a_value: XM_XPATH_NUMERIC_VALUE; a_decimal_format: XM_XSLT_DECIMAL_FORMAT_ENTRY; a_possible_minus: STRING): STRING is
			-- Formatted version of `a_value'
		require
			positive_number: a_value /= Void and then not a_value.is_error and then not a_value.is_negative
			decimal_format_not_void: a_decimal_format /= Void
			prefix_not_void: a_possible_minus /= Void
		local
			a_multiplier: INTEGER
			a_number: XM_XPATH_NUMERIC_VALUE
			an_integer_value: XM_XPATH_INTEGER_VALUE
		do
			if a_value.is_nan then
				Result := STRING_.concat (prefix_string, a_decimal_format.nan)
				Result := STRING_.appended_string (Result, suffix_string)
			elseif a_value.is_infinite then
				Result := STRING_.concat (prefix_string, a_possible_minus)
				Result := STRING_.appended_string (Result, a_decimal_format.infinity)
				Result := STRING_.appended_string (Result, suffix_string)
			else
				a_multiplier := 1
				if is_percent then
					a_multiplier := 100
				elseif is_per_mille then
					a_multiplier := 1000
				end
				if a_multiplier = 1 then
					a_number := a_value
				else
					create an_integer_value.make_from_integer (a_multiplier)
					a_number := a_value.arithmetic (Multiply_token, an_integer_value)
				end
				if a_number.is_double_value  then
					Result := formatted_double (a_number.as_double) -- this will also be used for float in future
				elseif a_number.is_machine_integer_value then
					Result := formatted_integer (a_number.as_machine_integer_value)
				else
					check
						decimal: a_number.is_decimal_value
						-- TODO: This will fail when we introduce float, and other integer types
					end
					Result := formatted_decimal (a_number.as_decimal_value)
				end
				Result := mapped_formatted_number (Result, a_decimal_format)
				Result := grouped_formatted_number (Result, a_decimal_format)
				Result := fractional_grouped_formatted_number (Result, a_decimal_format)
				Result := STRING_.concat (prefix_string, Result)
				Result := STRING_.concat (a_possible_minus, Result)
				Result := STRING_.appended_string (Result, suffix_string)
			end
		ensure
			result_not_void: Result /= Void
		end

feature -- Status report

	is_percent: BOOLEAN
			-- Is there a % within the sub-picture?

	is_per_mille: BOOLEAN
			-- Is there a per-mille within the sub-picture?

	is_digit: BOOLEAN
			-- Has a digit or zero-digit sign been seen?

	is_error: BOOLEAN
			-- Is `Current' in error?

	error_value: XM_XPATH_ERROR_VALUE
			-- Error value

	phase: INTEGER
			-- `phase' = 0 -> passive characters at start;
			-- `phase' = 1 -> digit signs in integral part;
			-- `phase' = 2 -> zero-digit signs in integral part;
			-- `phase' = 3 -> zero-digit signs in fractional part;
			-- `phase' = 4 -> digit signs in fractional part;
			-- `phase' = 5 -> passive characters at end;

feature -- Status setting

	set_last_error_from_string (a_message, a_namespace_uri, a_code: STRING; an_error_type: INTEGER) is
			-- Set `error_value'.
		require
			valid_error_type: an_error_type = Static_error or an_error_type = Type_error or an_error_type = Dynamic_error
			message_not_void: a_message /= Void and then a_message.count > 0
			valid_code: a_code /= Void
			namespace_uri_not_void: a_namespace_uri /= Void
			not_in_error: not is_error
		do
			create error_value.make_from_string (a_message, a_namespace_uri, a_code, an_error_type)
			is_error := True
		ensure
			valid_error: error_value /= Void
				and then STRING_.same_string (error_value.code, a_code)
			in_error: is_error
		end

feature {NONE} -- Implementation

	scan_picture_string (a_picture: STRING; a_format: XM_XSLT_DECIMAL_FORMAT_ENTRY) is
			-- Scan picture string.
		require
			picture_string_not_void: a_picture /= Void
			decimal_format_not_void: a_format /= Void
		local
			l_index: INTEGER
			l_per_mille, l_percent, l_decimal_separator, l_grouping_separator, l_digit_sign, l_zero_digit_sign: INTEGER
			a_character: INTEGER
		do
			l_per_mille := a_format.per_mille.item_code (1); l_percent := a_format.percent.item_code (1)
			l_decimal_separator := a_format.decimal_separator.item_code (1);  l_grouping_separator := a_format.grouping_separator.item_code (1)
			l_digit_sign := a_format.digit_sign.item_code (1); l_zero_digit_sign := a_format.zero_digit.item_code (1)
			from
				l_index := 1
			until
				is_error or l_index > a_picture.count
			loop
				a_character := a_picture.item_code (l_index)
				if a_character = l_per_mille or else a_character = l_percent then
					if is_percent or else is_per_mille then
						set_last_error_from_string ("Cannot have more than one percent or per-mille character in a sub-picture",
															 Xpath_errors_uri, "XTDE1310", Dynamic_error)
					end
					is_percent := a_character = l_percent
					is_per_mille := a_character = l_per_mille
					inspect
						phase
					when 0 then
						prefix_string := STRING_.appended_string (prefix_string, a_picture.substring (l_index, l_index))
					when 1, 2, 3, 4, 5 then
						phase := 5; suffix_string := STRING_.appended_string (suffix_string, a_picture.substring (l_index, l_index))
					end
				elseif a_character = l_digit_sign then
					is_digit := True
					inspect
						phase
					when 0, 1 then
						phase := 1; maximum_integral_part_size := maximum_integral_part_size + 1
					when 2 then
						set_last_error_from_string  ("Digit sign must not appear after a zero-digit sign in the integer part of a sub-picture",
															  Xpath_errors_uri, "XTDE1310", Dynamic_error)
					when 3, 4 then
						phase := 4; maximum_fractional_part_size := maximum_fractional_part_size + 1
					when 5 then
						set_last_error_from_string  ("Passive character must not appear between active characters in a sub-picture",
															  Xpath_errors_uri, "XTDE1310", Dynamic_error)
					end
				elseif a_character = l_zero_digit_sign then
					is_digit := True
					inspect
						phase
					when 0, 1, 2 then
						phase := 2; maximum_integral_part_size := maximum_integral_part_size + 1; minimum_integral_part_size := minimum_integral_part_size + 1
					when 3 then
						maximum_fractional_part_size := maximum_fractional_part_size + 1; minimum_fractional_part_size := minimum_fractional_part_size + 1
					when 4 then
						set_last_error_from_string  ("Zero digit sign must not appear after a digit sign in the fractional part of a sub-picture",
															  Xpath_errors_uri, "XTDE1310", Dynamic_error)
					when 5 then
						set_last_error_from_string  ("Passive character must not appear between active characters in a sub-picture",
															  Xpath_errors_uri, "XTDE1310", Dynamic_error)
					end
				elseif a_character = l_decimal_separator then
					inspect
						phase
					when 0, 1, 2 then
						phase := 3
					when 3, 4, 5 then
						set_last_error_from_string  ("There must only be one decimal separator in a sub-picture",
															  Xpath_errors_uri, "XTDE1310", Dynamic_error)
					end
				elseif a_character = l_grouping_separator then
					inspect
						phase
					when 0, 1, 2 then
						integral_part_positions.force_last (maximum_integral_part_size)
					when 3, 4 then
						if maximum_fractional_part_size = 0 then
							set_last_error_from_string  ("Grouping separator cannot be adjacent to decimal separator",
																  Xpath_errors_uri, "XTDE1310", Dynamic_error)
						else
							fractional_part_positions.force_last (maximum_fractional_part_size)
						end
					when 5 then
						set_last_error_from_string  ("Grouping separator found in suffix of sub-picture",
															  Xpath_errors_uri, "XTDE1310", Dynamic_error)
					end
				else -- passive character
					inspect
						phase
					when 0 then
						prefix_string := STRING_.appended_string (prefix_string, a_picture.substring (l_index, l_index))
					when 1, 2, 3, 4, 5 then
						phase := 5; suffix_string := STRING_.appended_string (suffix_string, a_picture.substring (l_index, l_index))
					end
				end
				l_index := l_index + 1
			variant
				a_picture.count + 1 - l_index
			end
			if not is_error and not is_digit then
				set_last_error_from_string ("Sub-picture must contain at least one digit sign or zero digit sign?",
													 Xpath_errors_uri, "XTDE1310", Dynamic_error)
			end
		end

	calculate_grouping_positions is
			-- Sort out the grouping positions.
		local
			a_count, l_index, a_first_value: INTEGER
			is_regular: BOOLEAN
		do
			a_count := integral_part_positions.count
			if a_count > 0 then

				-- Convert to positions relative to the decimal separator.

				from
					create integral_grouping_separator_positions.make (1, a_count)
					l_index := 1
				until
					l_index > a_count
				loop
					integral_grouping_separator_positions.put (maximum_integral_part_size - integral_part_positions.item (a_count - l_index + 1), l_index)
					l_index := l_index + 1
				variant
					a_count + 1 - l_index
				end
				if a_count > 1 then
					is_regular := True
					a_first_value := integral_grouping_separator_positions.item (1)
					from
						l_index := 2
					until
						not is_regular or else l_index > a_count
					loop
						if integral_grouping_separator_positions.item (l_index) /= a_first_value * l_index then
							is_regular := False
						end
						l_index := l_index + 1
					variant
						a_count + 1 - l_index
					end
					if is_regular then
						create integral_grouping_separator_positions.make (1, 1)
						integral_grouping_separator_positions.put (a_first_value, 1)
					end
				end
				if integral_grouping_separator_positions.item (1) = 0 then
					set_last_error_from_string  ("Grouping separator cannot be adjacent to decimal separator",
						Xpath_errors_uri, "XTDE1310", Dynamic_error)
				end
			end
			a_count := fractional_part_positions.count
			if a_count > 0 then
				from
					create fractional_grouping_separator_positions.make (1, a_count)
					l_index := 1
				until
					l_index > fractional_grouping_separator_positions.count
				loop
					fractional_grouping_separator_positions.put (fractional_part_positions.item (l_index), l_index)
					l_index := l_index + 1
				variant
					fractional_grouping_separator_positions.count + 1 - l_index
				end
			end
		end

	formatted_decimal (a_value: XM_XPATH_DECIMAL_VALUE): STRING is
			-- Formatted version of `a_value'
		require
			value_not_void: a_value /= Void
		local
			a_decimal_value: XM_XPATH_DECIMAL_VALUE
			a_zero_count, a_point: INTEGER
			zeros: STRING
		do
			a_decimal_value := a_value.rounded_half_even (maximum_fractional_part_size)
			Result := a_decimal_value.string_value
			a_point := Result.index_of ('.', 1)
			if a_point = 0 then
				a_zero_count := minimum_integral_part_size - Result.count
			else
				a_zero_count := minimum_integral_part_size - a_point + 1
			end
			if a_zero_count > 0 then
				create zeros.make_filled ('0', a_zero_count)
				Result := zeros + Result
				a_point := Result.index_of ('.', 1)
			end
			if a_point > 0 then
				a_zero_count := minimum_fractional_part_size - (Result.count - a_point)
			else
				Result := Result + "."
				a_zero_count := minimum_fractional_part_size
			end
			if a_zero_count > 0 then
				create zeros.make_filled ('0', a_zero_count)
				Result := Result + zeros
			end
		ensure
			result_not_void: Result /= Void
		end

	formatted_integer (a_value: XM_XPATH_MACHINE_INTEGER_VALUE): STRING is
			-- Formatted version of `a_value'
		require
			value_not_void: a_value /= Void
		local
			a_zero_count: INTEGER
			zeros: STRING
		do
			Result := a_value.string_value
			a_zero_count := minimum_integral_part_size - Result.count
			if a_zero_count > 0 then
				create zeros.make_filled ('0', a_zero_count)
				Result := zeros + Result
			end
			create zeros.make_filled ('0', minimum_fractional_part_size)
			Result := Result + "." + zeros
		ensure
			result_not_void: Result /= Void
		end

	formatted_double (a_value: DOUBLE): STRING is
			-- Formatted version of `a_value'
		require
			value_is_finite: True
		local
			l_decimal: MA_DECIMAL
			l_decimal_value: XM_XPATH_DECIMAL_VALUE
			l_zero_count, l_point: INTEGER
			l_zeros: STRING
		do
			create l_decimal.make_from_string (a_value.out)
			create l_decimal_value.make (l_decimal.rescale (0 - maximum_fractional_part_size, shared_half_even_context))
			Result := l_decimal_value.string_value
			l_point := Result.index_of ('.', 1)
			if l_point = 0 then
				l_zero_count := minimum_integral_part_size - Result.count
			else
				l_zero_count := minimum_integral_part_size - l_point + 1
			end
			if l_zero_count > 0 then
				create l_zeros.make_filled ('0', l_zero_count)
				Result := Result + l_zeros
			end
			if l_point > 0 then
				l_zero_count := minimum_fractional_part_size - Result.count + l_point
			else
				Result := Result + "."
				l_zero_count := minimum_fractional_part_size
			end
			if l_zero_count > 0 then
				create l_zeros.make_filled ('0', l_zero_count)
				Result := Result + l_zeros
			end
		ensure
			result_not_void: Result /= Void
		end

	mapped_formatted_number (a_value: STRING; a_decimal_format: XM_XSLT_DECIMAL_FORMAT_ENTRY): STRING is
			-- Number with numerals and decimal point substituted
		require
			value_not_void: a_value /= Void
			decimal_point_present: a_value.index_of ('.', 1) > 0
			decimal_format_not_void: a_decimal_format /= Void
		local
			a_point, l_index, a_code, a_zero_code: INTEGER
			a_string: STRING
			a_digit: CHARACTER
		do
			a_point := a_value.index_of ('.', 1)
			if maximum_fractional_part_size = 0 then
				Result := a_value.substring (1, a_point - 1)
			else
				Result := a_value
			end
			if not STRING_.same_string (a_decimal_format.decimal_separator, ".") then
				if a_point <= Result.count then
					Result := STRING_.replaced_substring (Result, a_decimal_format.decimal_separator, a_point, a_point)
				end
			end
			if not STRING_.same_string (a_decimal_format.zero_digit, "0") then
				from
					l_index := 1
					a_string := ""
					a_zero_code := a_decimal_format.zero_digit.item_code (1)
				until
					l_index > Result.count
				loop
					a_digit := Result.item (l_index)
					a_code := a_digit.code
					if a_code >= 48 and then a_code <= 57 then -- 0-9
						a_code := a_zero_code + (a_code - 48)
						a_string := STRING_.appended_string (a_string, unicode.code_to_string (a_code))
					else
						a_string := STRING_.appended_string (a_string, Result.substring (l_index, l_index))
					end
					l_index := l_index + 1
				end
				Result := a_string
			end
			if Result.item (Result.count) = a_decimal_format.decimal_separator.item (1) then
				Result.remove_tail (1)
			end
		ensure
			result_not_void: Result /= Void
		end

	grouped_formatted_number (a_value: STRING; a_decimal_format: XM_XSLT_DECIMAL_FORMAT_ENTRY): STRING is
			-- Number with grouping separators added
		require
			a_value_not_void: a_value /= Void
			a_decimal_format_not_void: a_decimal_format /= Void
		local
			l_index, l_point, l_grouping_index, l_grouping_position, l_whole_characters: INTEGER
			l_string: STRING
		do
			l_point := a_value.index_of (a_decimal_format.decimal_separator.item (1), 1)
			if l_point = 0 then
				l_point := a_value.count + 1
			end
			if integral_grouping_separator_positions /= Void then
				if integral_grouping_separator_positions.count = 1 then

					-- regular positions

					from
						l_index := 1; l_grouping_index := integral_grouping_separator_positions.item (1)
						l_string := ""
					until
						l_index > a_value.count
					loop
						if l_index > 1 and l_index < l_point and l_grouping_index > 0 and INTEGER_.mod (l_point - l_index, l_grouping_index) = 0 then
							l_string := STRING_.appended_string (l_string, a_decimal_format.grouping_separator)
						end
						l_string := STRING_.appended_string (l_string, a_value.substring (l_index, l_index))
						if l_index < l_point then
							l_whole_characters := l_whole_characters + 1
						end
						l_index := l_index + 1
					end
					Result := l_string
				else

					-- tabulated positions

					from
						l_index := 1
						l_grouping_index := integral_grouping_separator_positions.count
						l_string := ""
					until
						l_index > a_value.count
					loop
						if l_grouping_index > 0 then
							l_grouping_position := integral_grouping_separator_positions.item (l_grouping_index)
						else
							l_grouping_position := 0
						end
						if l_index < l_point and l_point - l_index = l_grouping_position then
							l_string := STRING_.appended_string (l_string, a_decimal_format.grouping_separator)
							l_grouping_position := l_grouping_position + 1
							if l_grouping_index > 0 then
								l_grouping_index := l_grouping_index - 1
							end
						end
						if l_index < l_point then
							l_whole_characters := l_whole_characters + 1
						end
						l_string := STRING_.appended_string (l_string, a_value.substring (l_index, l_index))
						l_index := l_index + 1
					end
					Result := l_string
				end
			else
				l_whole_characters := a_value.count - l_point
				Result := a_value
			end
			if l_whole_characters > maximum_integral_part_size then
				Result := truncated_leading_zeros (Result, l_whole_characters, a_decimal_format)
			end
		ensure
			result_not_void: Result /= Void
		end

	truncated_leading_zeros (a_value: STRING; a_whole_characters: INTEGER; a_decimal_format: XM_XSLT_DECIMAL_FORMAT_ENTRY): STRING is
			-- `a_value' without leading zeros
		require
			a_value_not_void: a_value /= Void
			strictly_positive_a_whole_characters: a_whole_characters > 0
			a_whole_characters_small_enough: a_whole_characters /= a_value.count
			a_decimal_format_not_void: a_decimal_format /= Void
		local
			l_index, l_max_truncation, l_zero_code: INTEGER
		do
			l_zero_code := a_decimal_format.zero_digit.item_code (1)
			create Result.make (a_value.count)
			l_max_truncation := a_whole_characters - maximum_integral_part_size
			from
				l_index := 1
			until
				l_index > a_value.count
			loop
				if l_index = l_max_truncation + 1 and a_value.item_code (l_index) = a_decimal_format.grouping_separator.item_code (1) then
					-- skip it
				elseif l_index > l_max_truncation then
					Result := STRING_.appended_string (Result, a_value.substring (l_index, l_index))
				elseif a_value.item_code (l_index) = l_zero_code then
					-- skip it
				elseif a_value.item_code (l_index) = a_decimal_format.grouping_separator.item_code (1) then
					-- skip surplus grouping separators
					l_max_truncation := l_max_truncation + 1
				else
					Result := STRING_.appended_string (Result, a_value.substring (l_index, l_index))
					-- once we have seen a good character, skip no more
					l_max_truncation := 0
				end
				l_index := l_index + 1
			end
		ensure
			truncated_leading_zeros_not_void: Result /= Void
		end

	fractional_grouped_formatted_number (a_value: STRING; a_decimal_format: XM_XSLT_DECIMAL_FORMAT_ENTRY): STRING is
			-- Number with grouping separators added to fractional part
		require
			value_not_void: a_value /= Void
			decimal_format_not_void: a_decimal_format /= Void
		local
			l_index, l_point, l_grouping_index, l_grouping_position: INTEGER
			l_string: STRING
		do
			l_point := a_value.index_of (a_decimal_format.decimal_separator.item (1), 1)
			if fractional_grouping_separator_positions /= Void then
				from
					l_index := 1; l_grouping_index := 1
					l_string := ""
				until
					l_index > a_value.count
				loop
					l_grouping_position := fractional_grouping_separator_positions.item (l_grouping_index) + l_point
					if l_index = l_grouping_position then
						l_string := STRING_.appended_string (l_string, a_decimal_format.grouping_separator)
						l_grouping_position := l_grouping_position + 1
					end
					l_string := STRING_.appended_string (l_string, a_value.substring (l_index, l_index))
					l_index := l_index + 1
				end
				Result := l_string
			else
				Result := a_value
			end
		ensure
			result_not_void: Result /= Void
		end

invariant

	error: is_error implies error_value /= Void
	no_error: not is_error implies error_value = Void
	percent_or_per_mill: not is_error implies not (is_per_mille and then is_percent)
	prefix_string_not_void: prefix_string /= Void
	integral_part_positions_not_void: integral_part_positions /= Void
	fractional_part_positions_not_void: fractional_part_positions /= Void

end

