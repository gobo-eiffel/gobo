indexing

	description:

		"XSLT format-number() sub-pictures"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_SUB_PICTURE

inherit

	XM_XPATH_ERROR_TYPES

	KL_IMPORTED_STRING_ROUTINES

	XM_XPATH_DEBUGGING_ROUTINES

creation

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
			todo ("make", True)
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
			-- Positons of grouping separators

	fractional_part_positions: DS_ARRAYED_LIST [INTEGER]
			-- Positions of grouping separators in fractional part

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
		ensure
			set: error_value = an_error_value
			in_error: is_error
		end
	
	set_last_error_from_string (a_message, a_code: STRING; an_error_type: INTEGER) is
			-- Set `error_value'.
		require
			valid_error_type: an_error_type = Static_error or an_error_type = Type_error or an_error_type = Dynamic_error
			message_not_void: a_message /= Void and then a_message.count > 0
			valid_code: a_code /= Void and then is_valid_error_code (a_code)
			not_in_error: not is_error			
		do
			create error_value.make_from_string (a_message, a_code, an_error_type)
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
				is_error or else an_index > a_picture.count -- N.B. XT1310 is a recoverable error, but this implementation does not recover.
			loop
				a_character := a_picture.item_code (an_index)
				if a_character = a_per_mille or else a_character = a_percent then
					if is_percent or else is_per_mille then
						set_last_error_from_string ("Cannot have more than one percent or per-mille character in a sub-picture", "XT1310", Dynamic_error)
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
						set_last_error_from_string  ("Digit sign must not appear after a zero-digit sign in the integer part of a sub-picture", "XT1310", Dynamic_error)
					when 3, 4 then
						phase := 4; maximum_fractional_part_size := maximum_fractional_part_size + 1
					when 5 then
						set_last_error_from_string  ("Passive character must not appear between active characters in a sub-picture", "XT1310", Dynamic_error)
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
						set_last_error_from_string  ("Zero digit sign must not appear after a digit sign in the fractional part of a sub-picture", "XT1310", Dynamic_error)
					when 5 then
						set_last_error_from_string  ("Passive character must not appear between active characters in a sub-picture", "XT1310", Dynamic_error)
					end
				elseif a_character = a_decimal_separator then
					inspect
						phase
					when 0, 1, 2 then
						phase := 3
					when 3, 4, 5 then
						set_last_error_from_string  ("There must only be one decimal separator in a sub-picture", "XT1310", Dynamic_error)
					end
				elseif a_character = a_grouping_separator then
					inspect
						phase
					when 0, 1, 2 then
						integral_part_positions.force_last (maximum_integral_part_size)
					when 3, 4 then
						if maximum_fractional_part_size = 0 then
							set_last_error_from_string  ("Grouping separator cannot be adjacent to decimal separator", "XT1310", Dynamic_error)
						else
							fractional_part_positions.force_last (maximum_fractional_part_size)
						end
					when 5 then
						set_last_error_from_string  ("Grouping separator found in suffix of sub-picture", "XT1310", Dynamic_error)
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
				set_last_error_from_string ("Sub-picture must contain at least one digit sign or zero digit sign?", "XT1310", Dynamic_error)
			end
		end

	calculate_grouping_positions is
			-- Sort out the grouping positions.
		local
			a_count: INTEGER
		do
			a_count := integral_part_positions.count
			if a_count > 0 then

				create integral_grouping_separator_positions.make (1, a_count)
				
				-- Convert to positions relative to the decimal separator.

				
			end
		end

invariant

	error: is_error implies error_value /= Void
	no_error: not is_error implies error_value = Void
	percent_or_per_mill: not is_error implies not (is_per_mille and then is_percent)
	prefix_string_not_void: prefix_string /= Void
	integral_part_positions_not_void: integral_part_positions /= Void
	fractional_part_positions_not_void: fractional_part_positions /= Void

end
	
