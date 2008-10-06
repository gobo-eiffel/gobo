indexing

	description:

		"Parameter formatters"

	library: "Gobo Eiffel String Library"
	copyright: "Copyright (c) 2004-2005, Object-Tools and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ST_PARAMETER_FORMATTER

inherit

	ANY

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

feature {NONE} -- Initialization

	make is
			-- Create a new formatter.
		do
			reset_options
		end

feature -- Initialization

	reset_options is
			-- Reset options to their default values.
		do
			set_width (1)
			set_precision (0)
			set_align_right
			set_padding_character (' ')
			set_plus_sign_enabled (False)
			set_lowercase (True)
		end

feature -- Options

	precision: INTEGER
			-- Precision (formatter-dependent meaning)
			-- (May cause truncation of formatted parameter.)

	width: INTEGER
			-- Minimum width of formatted parameter
			-- (Does never cause truncation of formatted parameter.)

	is_right_aligned: BOOLEAN is
			-- Should formatted parameter be aligned to the right?
		do
			Result := (alignment = align_right)
		end

	is_left_aligned: BOOLEAN is
			-- Should formatted parameter be aligned to the left?
		do
			Result := (alignment = align_left)
		end

	is_center_aligned: BOOLEAN is
			-- Should formatted parameter be centered?
		do
			Result := (alignment = align_center)
		end

	padding_character: CHARACTER
			-- Padding character
			-- (Default is space character)

	plus_sign_enabled: BOOLEAN
			-- Should the '+' sign be shown in the formatted parameter?
			-- (By default only the '-' sign is shown.)

	is_lowercase: BOOLEAN
			-- Should the formatted parameter be in lowercase?
			-- (Not applicable to all formatters.)

feature -- Setting

	set_precision (p: INTEGER) is
			-- Set `precision' to `p'.
		require
			p_not_negative: p >= 0
		do
			precision := p
		ensure
			precision_set: precision = p
		end

	set_width (w: INTEGER) is
			-- Set `width' to `w'.
		require
			w_not_negative: w >= 0
		do
			width := w
		ensure
			width_set: width = w
		end

	set_align_left is
			-- Set left alignment.
		do
			alignment := align_left
		ensure
			is_left_aligned: is_left_aligned
		end

	set_align_right is
			-- Set right alignment.
		do
			alignment := align_right
		ensure
			is_right_aligned: is_right_aligned
		end

	set_align_center is
			-- Set center alignment.
		do
			alignment := align_center
		ensure
			is_center_aligned: is_center_aligned
		end

	set_padding_character (c: CHARACTER) is
			-- Set `padding_character' to `c'.
		do
			padding_character := c
		ensure
			padding_character_set: padding_character = c
		end

	set_plus_sign_enabled (b: BOOLEAN) is
			-- Set `plus_sign_enabled' to `b'.
		do
			plus_sign_enabled := b
		ensure
			plus_sign_enabled_set: plus_sign_enabled = b
		end

	set_lowercase (b: BOOLEAN) is
			-- Set `is_lowercase' to `b'.
		do
			is_lowercase := b
		ensure
			is_lowercase_set: is_lowercase = b
		end

feature -- Status report

	valid_parameter (a_parameter: ANY): BOOLEAN is
			-- Is `a_parameter' a valid parameter for current formatter?
		require
			a_parameter_not_void: a_parameter /= Void
		deferred
		end

feature -- Formatting

	format_to (a_parameter: ANY; a_stream: KI_CHARACTER_OUTPUT_STREAM) is
			-- Format `a_parameter' to `a_stream'.
		require
			a_parameter_not_void: a_parameter /= Void
			valid_parameter: valid_parameter (a_parameter)
			a_stream_not_void: a_stream /= Void
			a_stream_open_write: a_stream.is_open_write
		deferred
		end

feature {NONE} -- Formatting

	right_format_to (a_string: STRING; a_stream: KI_CHARACTER_OUTPUT_STREAM) is
			-- Append '(width - a_string.count).max (0)' occurrences of
			-- `padding_character' to `a_stream', and then append `a_string'.
		require
			a_string_not_void: a_string /= Void
			a_stream_not_void: a_stream /= Void
			a_stream_open_write: a_stream.is_open_write
		local
			nb: INTEGER
		do
			nb := width - a_string.count
			from
			until
				nb <= 0
			loop
				a_stream.put_character (padding_character)
				nb := nb - 1
			end
			a_stream.put_string (a_string)
		end

	left_format_to (a_string: STRING; a_stream: KI_CHARACTER_OUTPUT_STREAM) is
			-- Append `a_string' to `a_stream', and then append
			-- '(width - a_string.count).max (0)' occurrences of
			-- `padding_character'.
		require
			a_string_not_void: a_string /= Void
			a_stream_not_void: a_stream /= Void
			a_stream_open_write: a_stream.is_open_write
		local
			nb: INTEGER
		do
			nb := width - a_string.count
			a_stream.put_string (a_string)
			from
			until
				nb <= 0
			loop
				a_stream.put_character (padding_character)
				nb := nb - 1
			end
		end

	center_format_to (a_string: STRING; a_stream: KI_CHARACTER_OUTPUT_STREAM) is
			-- Append '(width - a_string.count).max (0) // 2' occurrences of
			-- `padding_character' to `a_stream', then append `a_string', and
			-- then append enough occurrences of `padding_character' so that
			-- 'width.max (a_string.count)' has been written in total.
		require
			a_string_not_void: a_string /= Void
			a_stream_not_void: a_stream /= Void
			a_stream_open_write: a_stream.is_open_write
		local
			nb: INTEGER
			l, r: INTEGER
		do
			nb := width - a_string.count
			if nb > 0 then
				l := nb // 2
				r := nb - l
				from
				until
					l <= 0
				loop
					a_stream.put_character (padding_character)
					l := l - 1
				end
				a_stream.put_string (a_string)
				from
				until
					r <= 0
				loop
					a_stream.put_character (padding_character)
					r := r - 1
				end
			else
				a_stream.put_string (a_string)
			end
		end

	justify_format_to (a_string: STRING; a_stream: KI_CHARACTER_OUTPUT_STREAM) is
			-- Append `a_string' to `a_stream' using defined alignment
			-- and padding character if needed.
		require
			a_string_not_void: a_string /= Void
			a_stream_not_void: a_stream /= Void
			a_stream_open_write: a_stream.is_open_write
		do
			inspect alignment
			when align_left then
				left_format_to (a_string, a_stream)
			when align_right then
				right_format_to (a_string, a_stream)
			when align_center then
				center_format_to (a_string, a_stream)
			end
		end

feature {NONE} -- Alignment

	alignment: INTEGER
			-- Alignment policy for formatted parameter

	align_left: INTEGER is 1
			-- Possible value for `alignment'

	align_right: INTEGER is 2
			-- Possible value for `alignment'

	align_center: INTEGER is 3
			-- Possible value for `alignment'

invariant

	valid_alignment: alignment = align_left or alignment = align_right or alignment = align_center
	precision_not_negative: precision >= 0
	width_not_negative: width >= 0

end
