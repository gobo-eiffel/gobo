indexing

	description:

		"Abstract formatter."

	library: "Gobo Eiffel Formatter Library"
	origins: "Based on code from Object Tools."
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ST_ABSTRACT_FORMATTER

inherit

	ANY

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

feature {NONE} -- Initialization

	make is
			-- Initialize formatter by setting `value' to `anchor'.
		do
			set_value (anchor)
		ensure
			value_set: value = anchor
		end

feature {ST_SCIENTIFIC_FORMAT} -- Type that can be formatted

	anchor: ANY is
			-- Class used for `conforms_to' checks;
			-- To be implemented in descendent to appropriate type.
			-- Should be initialized.
		deferred
		ensure
			anchor_not_void: Result /= Void
		end

feature -- Width and precision

	precision: INTEGER
			-- Formatter dependent, can cause truncation

	is_precision_given: BOOLEAN is
			-- Is `precision' set?
		do
			Result := precision /= 0
		end

	width: INTEGER
			-- Minimum field with, does never cause truncation

feature -- Alignment

	alignment: INTEGER
			-- How to align `value'

	align_char: CHARACTER
			-- Padding character;
			-- default is to pad with blanks.

	align_left: INTEGER is 1
	align_right: INTEGER is 2
	align_center: INTEGER is 3
			-- Possible `alignment' values

feature -- Set

	reset_options is
			-- Reset any flags/options to their default values.
		do
			set_width (1)
			set_precision (0)
			set_align_right
			set_align_char (' ')
		end

	set_align_center is
			-- Set center alignment.
		do
			alignment := align_center
		end

	set_align_char (c: CHARACTER) is
			-- Align with spaces or zero's. Not valid for all formatters.
		require
			legal_align_char: (c = ' ') or else (c = '0')
		do
			align_char := c
		ensure
			align_char_set: align_char = c
		end

	set_align_left is
			-- Set left alignment.
		do
			alignment := align_left
		end

	set_align_right is
			-- Set right alignment.
		do
			alignment := align_right
		end

	set_precision (p: INTEGER) is
			-- Change the precision, a formatter specific truncating option.
		require
			valid_precision: p >= 0
		do
			precision := p
		end

	set_sign_always (always: BOOLEAN) is
			-- If `always', a sign, plus or minus, is always present in
			-- the output. By default a sign is used only for negative
			-- numbers.
		do
			sign_always := always
		ensure
			sign_set: sign_always = always
		end

	set_width (w: INTEGER) is
		require
			valid_width: w >= 0
		do
			width := w
		end

	sign_always: BOOLEAN
			-- Should a sign, plus or minus, be present in the output?
			-- By default a sign is used only for negative numbers.

feature {NONE} -- String padding routines

	center_pad (a_string: STRING; padding_character: CHARACTER; to_count: INTEGER) is
			-- Put an equal amount of padding to the left and right of
			-- `a_string' until `to_count' is reached.
		require
			a_string_not_void: a_string /= Void
			to_count_positive: to_count > 0
		local
			half: INTEGER
		do
			if a_string.count < to_count then
				half := (to_count - a_string.count) // 2
				left_pad (a_string, ' ', a_string.count + half)
				right_pad (a_string, ' ', to_count)
			end
		end

	justify (s: STRING) is
			-- Justify string according to `alignment' with `align_char'.
		require
			s_not_empty: s /= Void and then not s.is_empty
		do
			inspect alignment
			when align_left then
				right_pad (s, align_char, width)
			when align_right then
				left_pad (s, align_char, width)
			when align_center then
				center_pad (s, align_char, width)
			end
		ensure
			s_is_at_least_width: s.count >= width
		end

	left_pad (a_string: STRING; padding_character: CHARACTER; to_count: INTEGER) is
			-- Prepend `padding_character' to `a_string' to it until
			-- `to_count' is reached. Routine is not optimized for speed.
			-- Do nothing if `to_count' is already greater or equal then
			-- `a_string.count'.
		require
			a_string_not_void: a_string /= Void
			to_count_not_negative: to_count >= 0
		local
			offset: INTEGER;
		do
			from
				offset := to_count - a_string.count
			until
				offset <= 0
			loop
				a_string.insert_character (padding_character, 1)
				offset := offset - 1
			end
		ensure
			unchanged_if_no_room:
				old a_string.count >= to_count implies
					a_string.is_equal (old clone (a_string))
			padded_count_if_room:
				old a_string.count <= to_count implies
					a_string.count = to_count
			right_part_is_a_string_if_room:
				old a_string.count <= to_count implies
					a_string.substring ((to_count - old a_string.count) + 1, to_count).is_equal (old clone (a_string))
		end

	right_pad (a_string: STRING; padding_character: CHARACTER; to_count: INTEGER) is
			-- Append `padding_character' to `a_string' until
			-- `to_count' is reached.
			-- Do nothing if `to_count' is already greater or equal
			-- then `a_string.count'.
		require
			a_string_not_void: a_string /= Void
			to_count_not_negative: to_count >= 0
		local
			offset: INTEGER;
		do
			from
				offset := to_count - a_string.count
			until
				offset <= 0
			loop
				a_string.append_character (padding_character)
				offset := offset - 1
			end
		ensure
			unchanged_if_no_room:
				old a_string.count >= to_count implies
					a_string.is_equal (old clone (a_string))
			padded_count_if_room:
				old a_string.count <= to_count implies
					a_string.count = to_count
			left_part_is_a_string_if_room:
				old a_string.count <= to_count implies
					a_string.substring (1, old a_string.count).is_equal (old clone (a_string))
		end

feature -- Value to be formatted

	is_valid_value (a_value: like value): BOOLEAN is
			-- Is `a_value' valid?
			-- At least `a_value' should not be Void.
		do
			Result := a_value /= Void
		end

	set_value (a_value: like anchor) is
			-- Set the value to be formatted.
		require
			value_is_valid: is_valid_value (a_value)
		do
			value := a_value
			alignment := align_right
		ensure
			value_set: value = a_value
		end

	value: like anchor
			-- Value that is to be formatted;
			-- MUST never be changed by the formatter itself!

feature -- Output

	output: STRING is
			-- Formatted `value'
		deferred
		ensure
			not_void: Result /= Void
			value_not_changed: value.is_equal (old clone (value))
		end

invariant

	value_is_valid: is_valid_value (value)
	alignment_known: alignment = align_left or else alignment = align_right or else alignment = align_center
	precision_not_negative: precision >= 0
	width_not_negative: width >= 0

end
