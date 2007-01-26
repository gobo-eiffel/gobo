indexing

	description:

		"Formatters for double parameters"

	library: "Gobo Eiffel String Library"
	copyright: "Copyright (c) 2004-2005, Object-Tools and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ST_DOUBLE_FORMATTER

inherit

	ST_PARAMETER_FORMATTER
		redefine
			make, reset_options
		end

	KL_IMPORTED_DOUBLE_ROUTINES
		export {NONE} all end

feature {NONE} -- Initialization

	make is
			-- Create a new formatter.
		do
			precursor
			create double_buffer.make (128)
			create string_output_stream.make (double_buffer)
			create unsigned_decimal_formatter.make
			create decimal_formatter.make
			create fractional_part.make (64)
		end

feature -- Initialization

	reset_options is
			-- Reset options to their default values.
		do
			precursor
			set_precision (6)
		end

feature -- Status report

	valid_parameter (a_parameter: ANY): BOOLEAN is
			-- Is `a_parameter' a valid parameter for current formatter?
		local
			a_cell: DS_CELL [DOUBLE]
		do
			a_cell ?= a_parameter
			Result := a_cell /= Void
		end

feature -- Formatting

	format_to (a_parameter: ANY; a_stream: KI_CHARACTER_OUTPUT_STREAM) is
			-- Format `a_parameter' to `a_stream'.
			-- (Use DS_CELL [DOUBLE] because in SE 2.1
			-- DOUBLE does not conform to ANY.)
		local
			a_cell: DS_CELL [DOUBLE]
		do
			a_cell ?= a_parameter
			check valid_parameter: a_cell /= Void end
			double_format_to (a_cell.item, a_stream)
		end

	double_format_to (a_parameter: DOUBLE; a_stream: KI_CHARACTER_OUTPUT_STREAM) is
			-- Format `a_parameter' to `a_stream'.
		require
			a_stream_not_void: a_stream /= Void
			a_stream_open_write: a_stream.is_open_write
		deferred
		end

feature {NONE} -- Implementation

	fsign: INTEGER
			-- Sign part

	integer_part: INTEGER
			-- Integer part

	fractional_part: STRING
			-- Fractional part

	build_integer_and_fractional_parts (d: DOUBLE) is
			-- Build `integer_part', `fractional_part' and `fsign' for `d'.
			-- 
			-- This function entered as replacing of simple expression:
			--   create f_f.make (floor((fractional_part*10^(precision))+0.5))
			-- which fails in case of large precision.
			-- Now we obtain fraction part with pieces of decimal_digit_count digits.
		local
			i: INTEGER
			fa: DOUBLE
			fp, fff: DOUBLE
		do
			fa := d.abs
			fsign := double_sign (d)
			STRING_.wipe_out (fractional_part)
			integer_part := DOUBLE_.floor_to_integer (fa)
			from
				i := precision
				fp := fa - integer_part
			until
				i <= decimal_digit_count - 1
			loop
				fff := fp * (10.0 ^ decimal_digit_count) -- .truncated_to_real
				append_integer_to_string (DOUBLE_.floor_to_integer (fff), decimal_digit_count, fractional_part)
				fp := fff - fff.floor
				i := i - decimal_digit_count
			end
			append_integer_to_string (DOUBLE_.floor_to_integer ((fp * 10.0 ^ i) + 0.5), i, fractional_part)
			check new_count: fractional_part.count = precision or fractional_part.count = precision + 1 end
			if fractional_part.count = precision then
				integer_part := integer_part * fsign
			else
					-- There is overflow.
					-- We should add 1 to the int_part ...
				integer_part := (integer_part + 1) * fsign
					-- ... and remove extraneous '1'
				fractional_part.remove (1)
			end
			if not fractional_part.is_empty then
				fractional_part.precede ('.')
			end
		end

	append_integer_to_string (i: INTEGER; a_precision: INTEGER; a_string: STRING) is
			-- Append decimal representation of `i' to `a_string'.
		require
			i_not_negative: i >= 0
			a_precision_not_negative: a_precision >= 0
			a_string_not_void: a_string /= Void
		do
			unsigned_decimal_formatter.reset_options
			unsigned_decimal_formatter.set_precision (a_precision)
			unsigned_decimal_formatter.set_align_left
			unsigned_decimal_formatter.set_padding_character ('0')
			string_output_stream.set_string (a_string)
			unsigned_decimal_formatter.integer_format_to (i, string_output_stream)
		end

	decimal_digit_count: INTEGER is 8
			-- NUmber of decimal digits that can fit into INTEGER type;
			-- Used in fractional part calculating decimal_digit_count < log10(Maxint)

	double_sign (d: DOUBLE): INTEGER is
			-- Sign of `d'
		do
			if d > 0.0 then
				Result := 1
			elseif d = 0.0 then
				Result := 0
			else
				Result := -1
			end
		ensure
			positive: d > 0.0 implies Result = 1
			negative: d < 0.0 implies Result = -1
			neither: d = 0.0 implies Result = 0
		end

	double_buffer: STRING
			-- Buffer used in `double_format_to'

	string_output_stream: KL_STRING_OUTPUT_STREAM 
			-- String output stream

	unsigned_decimal_formatter: ST_UNSIGNED_DECIMAL_FORMATTER
			-- Unsigned decimal formatter

	decimal_formatter: ST_DECIMAL_FORMATTER
			-- Decimal formatter

invariant

	double_buffer_not_void: double_buffer /= Void
	string_output_stream_not_void: string_output_stream /= Void
	unsigned_decimal_formatter_not_void: unsigned_decimal_formatter /= Void
	decimal_formatter_not_void: decimal_formatter /= Void
	fractional_part_not_void: fractional_part /= Void

end
