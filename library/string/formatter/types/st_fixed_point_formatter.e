indexing

	description:

		"Format fixed point values, ?f."

	conversion_rules:

		"The double argument is  rounded  and  converted  to decimal%
		%notation in the style [-]ddd.ddd, where the number of digits%
		%after the decimal-point character is equal to the precision%
		%specification. If the precision is missing, it is taken as 6;%
		%if the precision is explicitly zero, no decimal-point character%
		%appears. If a decimal point appears, at least one digit%
		%appears before it."

	library: "Gobo Eiffel Formatter Library"
	origins: "Based on code from Object Tools."
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ST_FIXED_POINT_FORMATTER

inherit

	ST_ABSTRACT_FORMATTER
		redefine
			make,
			reset_options
		end

creation

	make

feature {NONE} -- Initialization

	make is
		do
			precursor
			create integer_formatter.make
		end

feature -- Set defaults

	reset_options is
		do
			precursor
			set_precision (6)
		end

feature {ST_SCIENTIFIC_FORMAT} -- Type that can be formatted

	anchor: DOUBLE_REF is
		once
			create Result
		end

feature -- Output

	output: STRING is
			-- Formatted `value'
		local
			fa: DOUBLE
		do
			fa := value.item.abs
			fsign := double_sign (value.item)
			integer_part := fa.floor
			fractional_part := fa - integer_part
			Result := make_fract_part
			integer_formatter.reset_options
			integer_formatter.set_value (integer_part)
			-- make integer part and finish alignment
			inspect alignment
			when align_left then
				integer_formatter.set_width (1)
				Result.prepend (integer_formatter.output)
				right_pad (Result, ' ', width)
			when align_right then
				if width - Result.count < 1 then
					integer_formatter.set_width (1)
				else
					integer_formatter.set_width (width - Result.count)
				end
				integer_formatter.set_align_right
				Result.prepend (integer_formatter.output)
			when align_center then
				integer_formatter.set_width (1)
				Result.prepend (integer_formatter.output)
				center_pad (Result, ' ', width)
			end
		end

feature {ST_ABSTRACT_FORMATTER} -- Output implementation

	decimal_digit_count: INTEGER is 8
			-- This constant is number of decimal digits, fitted into
			-- INTEGER type;
			-- used in fractional part calculating decimal_digit_count <
			-- log10(Maxint)

	double_sign (r: DOUBLE): INTEGER is
			-- The integer value to multiple a number with to get the
			-- same sign as `r'
		do
			if r > 0.0 then
				Result := 1
			elseif r = 0.0 then
				Result := 0
			else
				Result := -1
			end
		ensure
			positive: r > 0.0 implies Result = 1
			negative: r < 0.0 implies Result = -1
			neither: r = 0.0 implies Result = 0
		end

	integer_part: INTEGER
			-- Integer part of value, set during `output'

	fsign: INTEGER
			-- Value to multiple a value with to possibly change its sign

	fractional_part: DOUBLE

	make_fract_part: STRING is
			-- This function entered as replacing of simple expression:
			--   create f_f.make (floor((fractional_part*10^(precision))+0.5))
			-- which fails in case of large precision.
			-- Now we obtain fraction part with pieces of
			-- decimal_digit_count digits.
			-- This function also modifies `integer_part', depending on
			-- the result.
		local
			i: INTEGER
			fp, fff: DOUBLE
		do
			from
				i := precision
				fp := fractional_part
				Result := ""
			until
				i <= decimal_digit_count - 1
			loop
				fff := fp * (10^decimal_digit_count) -- .truncated_to_real
				Result.append_string (produce_piece (fff.floor, decimal_digit_count))
				fp := fff - fff.floor
				i := i - decimal_digit_count
			end
			Result.append_string (produce_piece (((fp*10^i)+0.5).floor, i))
				check
					Result.count = precision or else Result.count = precision + 1
				end
			if Result.count = precision then
				integer_part := integer_part * fsign
			else
				-- There is overflow.
				-- We should add 1 to the int_part ...
				integer_part := (integer_part + 1) * fsign
				-- ... and remove extraneous '1'
				Result.remove (1)
			end
			if not Result.is_empty then
				Result.precede ('.')
			end
		ensure
			not_void: Result /= Void
			integer_part_set:
				(fsign = 0 implies integer_part = 0) or else
				(fsign = -1 implies integer_part = -1 * old integer_part) or else
				(fsign = 1 implies integer_part = old integer_part)
			starts_with_dot: not Result.is_empty implies Result.item (1) = '.'
		end

	produce_piece (i: INTEGER; p: INTEGER): STRING is
		local
			f_f: ST_UNSIGNED_DECIMAL_INTEGER_FORMATTER
		do
			create f_f.make
			f_f.set_value (i)
			f_f.set_precision (p)
			f_f.set_align_left
			f_f.set_align_char ('0')
			Result := f_f.output
		ensure
			not_void: Result /= Void
		end

feature {NONE} -- Implementation

	integer_formatter: ST_INTEGER_FORMATTER

invariant

	decimal_digit_count_positive: decimal_digit_count > 0
	integer_formatter_not_void: integer_formatter /= Void
	fsign_valid: fsign = 0 or else fsign = 1 or else fsign = -1
	precision_not_negative: precision >= 0

end
