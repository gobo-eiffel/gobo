indexing

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
				Result := STRING_.appended_string (Result, a_decimal_format.nan)
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
				elseif a_number.is_integer_value then
					Result := formatted_integer (a_number.as_integer_value)
				else
					check
						decimal: a_number.is_decimal_value
						-- This will fail when we introduce float, and other integer types
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
			-- `a_phase' = 0 -> passive characters at start
			-- `a_phase' = 1 -> digit signs in integral part
			-- `a_phase' = 2 -> zero-digit signs in integral part
			-- `a_phase' = 3 -> zero-digit signs in fractional part
			-- `a_phase' = 4 -> digit signs in fractional part
			-- `a_phase' = 5 -> passive characters at end
	
feature -- Status setting

	set_last_error (an_error_value: XM_XPATH_ERROR_VALUE) is
			-- Set `error_value'.
		require
			not_in_error: not is_error		
			error_value_not_void: an_error_value /= Void
		do
			error_value := an_error_value
			is_error := True
		ensure
			set: error_value = an_error_value
			in_error: is_error
		end
	
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
			an_index: INTEGER
			a_per_mille, a_percent, a_decimal_separator, a_grouping_separator, a_digit_sign, a_zero_digit_sign: INTEGER
			a_character: INTEGER
		do
			a_per_mille := a_format.per_mille.item_code (1); a_percent := a_format.percent.item_code (1)
			a_decimal_separator := a_format.decimal_separator.item_code (1);  a_grouping_separator := a_format.grouping_separator.item_code (1)
			a_digit_sign := a_format.digit_sign.item_code (1); a_zero_digit_sign := a_format.zero_digit.item_code (1)
			from
				an_index := 1
			variant
				a_picture.count + 1 - an_index
			until
				is_error or else an_index > a_picture.count
			loop
				a_character := a_picture.item_code (an_index)
				if a_character = a_per_mille or else a_character = a_percent then
					if is_percent or else is_per_mille then
						set_last_error_from_string ("Cannot have more than one percent or per-mille character in a sub-picture",
															 Xpath_errors_uri, "XTDE1310", Dynamic_error)
					end
					is_percent := a_character = a_percent
					is_per_mille := a_character = a_per_mille
					inspect
						phase
					when 0 then
						prefix_string := STRING_.appended_string (prefix_string, a_picture.substring (an_index, an_index))
					when 1, 2, 3, 4, 5 then
						phase := 5; suffix_string := STRING_.appended_string (suffix_string, a_picture.substring (an_index, an_index))
					end
				elseif a_character = a_digit_sign then
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
				elseif a_character = a_zero_digit_sign then
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
				elseif a_character = a_decimal_separator then
					inspect
						phase
					when 0, 1, 2 then
						phase := 3
					when 3, 4, 5 then
						set_last_error_from_string  ("There must only be one decimal separator in a sub-picture",
															  Xpath_errors_uri, "XTDE1310", Dynamic_error)
					end
				elseif a_character = a_grouping_separator then
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
						prefix_string := STRING_.appended_string (prefix_string, a_picture.substring (an_index, an_index))						
					when 1, 2, 3, 4, 5 then
						phase := 5; suffix_string := STRING_.appended_string (suffix_string, a_picture.substring (an_index, an_index))
					end
				end
				an_index := an_index + 1
			end
			if not is_digit then
				set_last_error_from_string ("Sub-picture must contain at least one digit sign or zero digit sign?",
													 Xpath_errors_uri, "XTDE1310", Dynamic_error)
			end
		end

	calculate_grouping_positions is
			-- Sort out the grouping positions.
		local
			a_count, an_index, a_first_value: INTEGER
			is_regular: BOOLEAN
		do
			a_count := integral_part_positions.count
			if a_count > 0 then

				-- Convert to positions relative to the decimal separator.

				from
					create integral_grouping_separator_positions.make (1, a_count)
					an_index := 1
				variant
					a_count + 1 - an_index
				until
					an_index > a_count
				loop
					integral_grouping_separator_positions.put (maximum_integral_part_size - integral_part_positions.item (a_count - an_index + 1), an_index)
					an_index := an_index + 1
				end
				if a_count > 1 then
					is_regular := True
					a_first_value := integral_grouping_separator_positions.item (1)
					from
						an_index := 2
					variant
						a_count + 1 - an_index
					until
						not is_regular or else an_index > a_count
					loop
						if integral_grouping_separator_positions.item (an_index) /= a_first_value * an_index then
							is_regular := False
						end
						an_index := an_index + 1
					end
					if is_regular then
						create integral_grouping_separator_positions.make (1, 1)
						integral_grouping_separator_positions.put (a_first_value, 1)
					end
				end
			end
			a_count := fractional_part_positions.count
			if a_count > 0 then
				from
					create fractional_grouping_separator_positions.make (1, a_count)
					an_index := 1
				variant
					fractional_grouping_separator_positions.count + 1 - an_index
				until
					an_index > fractional_grouping_separator_positions.count
				loop
					fractional_grouping_separator_positions.put (fractional_part_positions.item (an_index), an_index)
					an_index := an_index + 1
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
			a_zero_count := minimum_integral_part_size - Result.count - a_point
			if a_zero_count > 0 then
				create zeros.make_filled ('0', a_zero_count)
				Result := Result + zeros
			end
			if a_point > 0 then
				a_zero_count := minimum_fractional_part_size - Result.count + a_point
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

	formatted_integer (a_value: XM_XPATH_INTEGER_VALUE): STRING is
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
				Result := Result + zeros
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
			a_decimal: MA_DECIMAL
			a_zero_count, a_point: INTEGER
			zeros: STRING
		do
			create a_decimal.make_from_string (a_value.out)
			Result := a_decimal.rescale (0 - maximum_fractional_part_size, shared_half_even_context).to_scientific_string
			a_point := Result.index_of ('.', 1)
			a_zero_count := minimum_integral_part_size - Result.count - a_point
			if a_zero_count > 0 then
				create zeros.make_filled ('0', a_zero_count)
				Result := Result + zeros
			end
			if a_point > 0 then
				a_zero_count := minimum_fractional_part_size - Result.count + a_point
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

	mapped_formatted_number (a_value: STRING; a_decimal_format: XM_XSLT_DECIMAL_FORMAT_ENTRY): STRING is
			-- Number with numerals and decimal point substituted
		require
			value_not_void: a_value /= Void
			decimal_point_present: a_value.index_of ('.', 1) > 0
			decimal_format_not_void: a_decimal_format /= Void
		local
			a_point, an_index, a_code, a_zero_code: INTEGER
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
				Result := STRING_.replaced_substring (Result, a_decimal_format.decimal_separator, a_point, a_point)
			end
			if not STRING_.same_string (a_decimal_format.zero_digit, "0") then
				from
					an_index := 1
					a_string := ""
					a_zero_code := a_decimal_format.zero_digit.item_code (1)
				until
					an_index > Result.count
				loop
					a_digit := Result.item (an_index)
					a_code := a_digit.code
					if a_code >= 48 and then a_code <= 57 then -- 0-9
						a_code := a_zero_code + (a_code - 48)
						a_string := STRING_.appended_string (a_string, unicode.code_to_string (a_code))
					else
						a_string := STRING_.appended_string (a_string, Result.substring (an_index, an_index))
					end
					an_index := an_index + 1
				end
				Result := a_string
			end
		ensure
			result_not_void: Result /= Void
		end

	grouped_formatted_number (a_value: STRING; a_decimal_format: XM_XSLT_DECIMAL_FORMAT_ENTRY): STRING is
			-- Number with grouping separators added
		require
			value_not_void: a_value /= Void
			decimal_format_not_void: a_decimal_format /= Void
		local
			an_index, a_point, a_grouping_index, a_grouping_position: INTEGER
			a_string: STRING
		do
			a_point := a_value.index_of (a_decimal_format.decimal_separator.item (1), 1)
			if integral_grouping_separator_positions /= Void then
				if integral_grouping_separator_positions.count = 1 then
					
					-- regular positions
					
					from
						an_index := 1; a_grouping_index := integral_grouping_separator_positions.item (1)
						a_string := ""
					until
						an_index > a_value.count
					loop
						if an_index < a_point and then INTEGER_.mod (an_index , a_grouping_index) = 0 then
							a_string := STRING_.appended_string (a_string, a_decimal_format.grouping_separator)
						end
						a_string := STRING_.appended_string (a_string, a_value.substring (an_index, an_index))
						an_index := an_index + 1
					end
					Result := a_string
				else
					
					-- tabulated positions
					
					from
						an_index := 1; a_grouping_index := 1
						a_string := ""
					until
						an_index > a_value.count
					loop
						a_grouping_position := integral_grouping_separator_positions.item (a_grouping_index)
						if an_index < a_point and then an_index = a_grouping_position then
							a_string := STRING_.appended_string (a_string, a_decimal_format.grouping_separator)
							a_grouping_position := a_grouping_position + 1
						end
						a_string := STRING_.appended_string (a_string, a_value.substring (an_index, an_index))
						an_index := an_index + 1
					end
					Result := a_string
				end
			else
				Result := a_value
			end
		ensure
			result_not_void: Result /= Void
		end

	fractional_grouped_formatted_number (a_value: STRING; a_decimal_format: XM_XSLT_DECIMAL_FORMAT_ENTRY): STRING is
			-- Number with grouping separators added to fractional part
		require
			value_not_void: a_value /= Void
			decimal_format_not_void: a_decimal_format /= Void
		local
			an_index, a_point, a_grouping_index, a_grouping_position: INTEGER
			a_string: STRING
		do
			a_point := a_value.index_of (a_decimal_format.decimal_separator.item (1), 1)
			if fractional_grouping_separator_positions /= Void then
				from
					an_index := 1; a_grouping_index := 1
					a_string := ""
				until
					an_index > a_value.count
				loop
					a_grouping_position := fractional_grouping_separator_positions.item (a_grouping_index) + a_point
					if an_index = a_grouping_position then
						a_string := STRING_.appended_string (a_string, a_decimal_format.grouping_separator)
						a_grouping_position := a_grouping_position + 1
					end
					a_string := STRING_.appended_string (a_string, Result.substring (an_index, an_index))
					an_index := an_index + 1
				end
				Result := a_string
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
	
