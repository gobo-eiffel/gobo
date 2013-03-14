note
	description: "Formatter for integral numbers"
	library: "Free implementation of ELKS library"
	status: "See notice at end of class."
	legal: "See notice at end of class."
	names: format_integer;
	date: "$Date: 2012-07-23 23:02:19 +0200 (Mon, 23 Jul 2012) $"
	revision: "$Revision: 567 $"

class FORMAT_INTEGER

create
	make

feature -- Initialization

	make (w: INTEGER)
		require
			reasonable_field: w >= 1
		do
			blank_fill
			width := w
			sign_normal
			sign_negative_only
			right_justify
		ensure
			blank_fill: fill_character = ' '
			show_sign_negative: show_sign_negative
			no_separator: no_separator
			width_set: width = w
			right_justified: right_justified
			leading_sign: leading_sign
		end

feature -- Access

	fill_character: CHARACTER
			-- Padding character.

	width: INTEGER
			-- Width of the field.

	separator: CHARACTER
			-- Separator between 1000's of numbers.

	justification: INTEGER
			-- Where in the field the format goes.

	trailing_sign: BOOLEAN
			-- Is the sign at the end?

	sign_format: INTEGER
			-- How the sign is formatted.

	sign_string: STRING
			-- Formatting details for the sign.

	bracketted_negative: BOOLEAN
			-- Enclose negative numbers in brackets?

feature -- Status report

	centered: BOOLEAN
			-- Are numbers to be formatted centered?
		do
			Result := justification = Center_justification
		ensure
			Result = (justification = Center_justification)
		end

	left_justified: BOOLEAN
			-- Are numbers to be formatted with spaces on the right?
		do
			Result := justification = Left_justification
		ensure
			Result = (justification = Left_justification)
		end

	right_justified: BOOLEAN
			-- Are numbers to be formatted with spaces on the left?
		do
			Result := justification = Right_justification
		ensure
			Result = (justification = Right_justification)
		end

	not_justified: BOOLEAN
			-- Are numbers to be formatted in smallest string possible
		do
			Result := justification = No_justification
		ensure
			Result = (justification = No_justification)
		end

	show_sign_negative: BOOLEAN
			-- Are numbers to show sign only when negative?
		do
			Result := sign_format = Sign_negative_value
		ensure
			Result = (sign_format = Sign_negative_value)
		end

	show_sign_positive: BOOLEAN
			-- Are numbers to show sign only when positive?
		do
			Result := sign_format = Sign_positive_value
		ensure
			Result = (sign_format = Sign_positive_value)
		end

	show_sign: BOOLEAN
			-- Are numbers to show sign whether positive or negative?
		do
			Result := sign_format = Show_sign_value
		ensure
			Result = (sign_format = Show_sign_value)
		end

	ignore_sign: BOOLEAN
			-- Ignore the sign of a number?
		do
			Result := sign_format = Ignore_sign_value
		ensure
			Result = (sign_format = Ignore_sign_value)
		end

	no_separator: BOOLEAN
			-- Is there a separator?
		do
			Result := separator = '%U'
		ensure
			Result = (separator = '%U')
		end

	leading_sign: BOOLEAN
		-- Is the sign leading?
		do
			Result := not trailing_sign
		ensure
			Result = not trailing_sign
		end

feature -- Status setting

	blank_fill
			-- Fill numbers with blanks.
		do
			fill_character := ' '
		ensure
			fill_character = ' '
		end

	zero_fill
			-- Fill numbers with zeros.
		do
			fill_character := '0'
		ensure
			fill_character = '0'
		end

	dollar_fill
			-- Fill numbers with dollars.
		do
			fill_character := '$'
		ensure
			fill_character = '$'
		end

	asterisk_fill
			-- Fill numbers with asterisks.
		do
			fill_character := '*'
		ensure
			fill_character = '*'
		end

	set_fill (c: CHARACTER)
			-- Fill numbers with `c'
		do
			fill_character := c
		ensure
			fill_character = c
		end

	set_width (w: INTEGER)
			-- Set width to `w'
		require
			wide_enough: w >= 1
		do
			width := w
		ensure
			width = w
		end

	underscore_separate
			-- Set separator to underscore.
		do
			separator := '_'
		ensure
			separator = '_'
		end

	comma_separate
			-- Set separator to comma.
		do
			separator := ','
		ensure
			separator = ','
		end

	dot_separate
			-- Set separator to period.
		do
			separator := '.'
		ensure
			separator = '.'
		end

	remove_separator
			-- Remove the separator.
		do
			separator := '%U'
		ensure
			separator = '%U'
		end

	set_separator (c: CHARACTER)
			-- Set the separator to `c'
		do
			separator := c
		ensure
			separator = c
		end

	left_justify
			--Put padding on right
		do
			justification := Left_justification
		ensure
			left_justified
		end

	center_justify
			-- Put padding on right and left
		do
			justification := Center_justification
		ensure
			centered
		end

	right_justify
			-- Put padding on left
		do
			justification := Right_justification
		ensure
			right_justified
		end

	no_justify
			-- Always return the smallest string possible
		do
			justification := No_justification
		ensure
			not_justified
		end

	sign_leading
			-- Set the sign to lead
		do
			trailing_sign := False
		ensure
			leading_sign
		end

	sign_trailing
			-- Set the sign to trail
		do
			trailing_sign := True
		ensure
			trailing_sign
		end

	sign_positive_only
			-- Show sign for positive numbers only.
		do
			sign_format := Sign_positive_value
		ensure
			show_sign_positive
		end

	sign_negative_only
			-- Show sign for negative numbers only.
		do
			sign_format := Sign_negative_value
		ensure
			show_sign_negative
		end

	sign_show
			-- Show sign for all numbers.
		do
			sign_format := Show_sign_value
		ensure
			show_sign
		end

	sign_ignore
			-- Do not show sign.
		do
			sign_format := Ignore_sign_value
		ensure
			ignore_sign
		end

	sign_normal
			-- Set sign for - and +.
		do
			sign_string := "- +"
		ensure
			sign_string ~ "- +"
		end

	sign_cr_dr
			-- Set sign for CR/DR
		do
			sign_string := "CR  DR"
		ensure
			sign_string ~ "CR  DR"
		end

	sign_dr_cr
			-- Set sign for DR/CR
		do
			sign_string := "DR  CR"
		ensure
			sign_string ~ "DR  CR"
		end

	sign_floating_dollar
			-- Set sign for floating dollar.
		do
			sign_string := "$$$"
			sign_leading
		ensure
			sign_string ~ "$$$"
		end

	sign_floating_dollar_signed
			-- Set sign for floating dollar include sign.
		do
			sign_string := "-$ $+$"
			sign_leading
		ensure
			sign_string ~ "-$ $+$"
		end

	set_sign (s: STRING)
			-- Set sign values for positive, zero, negative
			-- All values must be the same length.
			-- Stored as negative, zero, positive.
		require
			s /= Void
			s.count >= 3
			s.count \\ 3 = 0
		do
			sign_string := s.twin
		ensure
			sign_set: sign_string ~ s
		end

	bracket_negative
			-- Bracket negative numbers.
		do
			bracketted_negative := True
		ensure
			bracketted_negative
		end

	unbracket_negative
			-- Do not bracket negative numbers.
		do
			bracketted_negative := False
		ensure
			not bracketted_negative
		end

feature -- Conversion

	formatted (i: INTEGER): STRING
			-- Format the integer.
		local
			sign: INTEGER
			unsigned: INTEGER
		do
			if i < 0 then
				sign := -1
				unsigned := -i
			elseif i > 0 then
				sign := 1
				unsigned := i
			end
			if not no_separator then
				Result := split (unsigned.out)
			else
				Result := unsigned.out
			end
			if not ignore_sign or bracketted_negative then
				Result := process_sign (Result, sign)
			end
			if justification /= No_justification and then Result.count < width then
				Result := justify (Result)
			end
		ensure
			exists: Result /= Void
			correct_length: not_justified or Result.count >= width
		end

feature {NONE} -- Implementation

	No_justification: INTEGER = 0
	Left_justification: INTEGER = 1
	Center_justification: INTEGER = 2
	Right_justification: INTEGER = 3


	Show_sign_value: INTEGER = 0
	Ignore_sign_value: INTEGER = 1
	Sign_positive_value: INTEGER = 2
	Sign_negative_value: INTEGER = 3

	split (s: STRING): STRING
			-- Apply separators to an integer
		require
			efficiency: separator /= '%U'
		local
			count, sep_length: INTEGER
		do
			from
				count := s.count
				create Result.make (width)
			until
				count <= 3
			loop
				from
					sep_length := 0
				until
					sep_length = 3
				loop
					Result.precede (s.item (count))
					count := count - 1
					sep_length := sep_length + 1
				end
				Result.precede (separator)
			end
			from
			until
				count = 0
			loop
				Result.precede (s.item (count))
				count := count - 1
			end
		end -- split

	process_sign (s: STRING; sn: INTEGER): STRING
			-- Process sign related values.
		local
			sstring: detachable STRING
		do
			Result := s
			if bracketted_negative and sn = -1 then
				Result.precede ('(')
				Result.extend (')')
			end
			if ((show_sign_negative or show_sign) and sn = -1) or else
				((show_sign_positive or show_sign) and sn = 1) or else
				(show_sign and sn = 0) then
				sstring := sign_value (sn)
			end
			if sstring /= Void then
				if trailing_sign then
					Result.append (sstring)
				else
					Result.prepend (sstring)
				end
			end
		end

	sign_size: INTEGER
			-- Size of the sign.
		do
			Result := sign_string.count // 3
		ensure
			Result * 3 = sign_string.count
		end

	sign_value (i: INTEGER): STRING
			-- Value of the sign.
		require
			correct_sign: - 1 <= i and i <= 1
		local
			t: INTEGER
		do
			t := sign_size * (i + 1) + 1
			Result := sign_string.substring (t, t + sign_size - 1)
		end

	justify (s: STRING): STRING
			-- Justify `s'.
		require
			room: s.count < width
			justification: justification /= no_justification
		local
			l, r: STRING
			i, t: INTEGER
		do
			Result := s
			if not centered then
				-- be concerned about filling
				create l.make (width - s.count)
				from
					i := 1
				until
					i > l.capacity
				loop
					l.extend (fill_character)
					i := i + 1
				end
				if left_justified then
					Result.append (l)
				else
					Result.prepend (l)
				end
			else -- centered
				-- add spaces both sides, more on left than right though
				-- when there is a choice
				t := (width - s.count) // 2
				if 2 * t + s.count < width then
					create l.make (t + 1)
				else
					create l.make (t)
				end
				create r.make (t)
				from
					i := 1
				until
					i > r.capacity
				loop
					l.extend (fill_character)
					r.extend (fill_character)
					i := i + 1
				end
				if i = l.capacity then l.extend (fill_character) end
				Result.prepend (l)
				Result.append (r)
			end
		end

invariant
	sign_string_attached: sign_string /= Void
	sign_string_count: sign_string.count >= 3
	sign_string_equal_parts: sign_string.count \\ 3 = 0
	wide_enough: width >= 1
	no_justification <= justification and justification <= right_justification

note
	copyright: "Copyright (c) 1984-2012, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
