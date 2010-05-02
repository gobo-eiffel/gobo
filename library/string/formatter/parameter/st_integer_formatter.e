note

	description:

		"Formatters for integer parameters"

	formatting_rules: "[
		Precision, if not 0, gives the minimum of digits that must appear;
		if the formatted value requires fewer digits, it is padded on the
		left with zeros. The default precision is 1. When 0 is formatted with
		a precision 0, the output is empty.
	]"
	library: "Gobo Eiffel String Library"
	copyright: "Copyright (c) 2004-2005, Object-Tools and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ST_INTEGER_FORMATTER

inherit

	ST_PARAMETER_FORMATTER
		redefine
			reset_options,
			make
		end

	KL_IMPORTED_INTEGER_ROUTINES
		export {NONE} all end

	KL_SHARED_PLATFORM
		export {NONE} all end

feature {NONE} -- Initialization

	make
			-- Create a new formatter.
		do
			precursor
			create integer_buffer.make (128)
		end

feature -- Initialization

	reset_options
			-- Reset options to their default values.
		do
			precursor
			set_precision (1)
		end

feature -- Access

	base: INTEGER
			-- Base used to format integer;
			-- 8 for octal, 10 for decimal, 16 for hexadecimal, ...
		deferred
		ensure
			base_large_enough: Result >= 2
			base_small_enough: Result <= 36
		end

feature -- Status report

	valid_parameter (a_parameter: ANY): BOOLEAN
			-- Is `a_parameter' a valid parameter for current formatter?
		local
			a_cell: detachable DS_CELL [INTEGER]
		do
			a_cell ?= a_parameter
			Result := a_cell /= Void
		end

feature -- Formatting

	format_to (a_parameter: ANY; a_stream: KI_CHARACTER_OUTPUT_STREAM)
			-- Format `a_parameter' to `a_stream'.
			-- (Use DS_CELL [INTEGER] because in SE 2.1
			-- INTEGER does not conform to ANY.)
		local
			a_cell: detachable DS_CELL [INTEGER]
		do
			a_cell ?= a_parameter
			check
					-- From precondition 'valid_parameter'.
				valid_parameter: a_cell /= Void
			end
			integer_format_to (a_cell.item, a_stream)
		end

	integer_format_to (a_parameter: INTEGER; a_stream: KI_CHARACTER_OUTPUT_STREAM)
			-- Format `a_parameter' to `a_stream'.
		require
			a_stream_not_void: a_stream /= Void
			a_stream_open_write: a_stream.is_open_write
		local
			a_sign: CHARACTER
			i: INTEGER
			old_width: INTEGER
		do
			if precision = 0 and a_parameter = 0 then
					-- Do nothing.
			else
				STRING_.wipe_out (integer_buffer)
				if a_parameter = Platform.Minimum_integer then
					append_abs_to_string (a_parameter, integer_buffer)
				else
					append_to_string (a_parameter.abs, integer_buffer)
				end
				if precision > 0 then
					from
						i := precision - integer_buffer.count
					until
						i <= 0
					loop
						integer_buffer.precede ('0')
						i := i - 1
					end
				end
				if plus_sign_enabled or space_sign_enabled or a_parameter < 0 then
					if a_parameter < 0 then
						a_sign := '-'
					elseif plus_sign_enabled then
						a_sign := '+'
					else
						a_sign := ' '
					end
					inspect alignment
					when align_left then
						integer_buffer.precede (a_sign)
						left_format_to (integer_buffer, a_stream)
					when align_right then
						if padding_character = '0' then
							a_stream.put_character (a_sign)
							old_width := width
							width := (width - 1).max (0)
							right_format_to (integer_buffer, a_stream)
							width := old_width
						else
							integer_buffer.precede (a_sign)
							right_format_to (integer_buffer, a_stream)
						end
					when align_center then
						integer_buffer.precede (a_sign)
						center_format_to (integer_buffer, a_stream)
					end
				else
					justify_format_to (integer_buffer, a_stream)
				end
			end
		end

feature {NONE} -- Implementation

	append_to_string (n: INTEGER; a_string: STRING)
			-- Append value of `n' in base `base' to `a_string'.
		require
			n_not_negative: n >= 0
			a_string_not_void: a_string /= Void
		local
			i: INTEGER
		do
			i := n // base
			if i /= 0 then
				append_to_string (i, a_string)
			end
			if is_lowercase then
				a_string.append_character (lower_digits.item ((n \\ base) + 1))
			else
				a_string.append_character (upper_digits.item ((n \\ base) + 1))
			end
		end

	append_abs_to_string (n: INTEGER; a_string: STRING)
			-- Append absolute value of `n' in base `base' to `a_string'.
		require
			a_string_not_void: a_string /= Void
		local
			i: INTEGER
		do
			i := INTEGER_.div (n, base).abs
			if i /= 0 then
				append_to_string (i, a_string)
			end
			if is_lowercase then
				a_string.append_character (lower_digits.item (INTEGER_.mod (n, base).abs + 1))
			else
				a_string.append_character (upper_digits.item (INTEGER_.mod (n, base).abs + 1))
			end
		end

	lower_digits: STRING = "0123456789abcdefghijklmnopqrstuvwxyz"

	upper_digits: STRING = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"

	integer_buffer: STRING
			-- Buffer used in `integer_format_to'

invariant

	integer_buffer_not_void: integer_buffer /= Void

end
