note

	description:

		"Objects that represent XPath xdt:yearMonthDuration values"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "MIT License"

class XM_XPATH_MONTHS_DURATION_VALUE

inherit

	XM_XPATH_DURATION_VALUE
		rename
			make as make_duration,
			make_from_duration as make_duration_from_duration
		redefine
			is_duration, string_value, is_normal,
			is_months_duration, as_months_duration,
			same_expression, plus, minus, seconds,
			multiply, scalar_divide, divide,
			display, item_type, is_comparable
		end

	KL_SHARED_PLATFORM
		export {NONE} all end

create

	make, make_from_duration

feature {NONE} -- Initialization

	make (a_duration: STRING)
			-- Create from lexical duration.
		local
			a_parser: XM_XPATH_DURATION_PARSER
		do
			make_atomic_value
			create a_parser.make
			duration := a_parser.string_to_months_duration (a_duration)
			normalize
		end

	make_from_duration (a_duration: like duration)
			-- Create from duration.
		require
			zero_days_and_time: a_duration.day = 0 and then a_duration.millisecond_count = 0
		do
			make_atomic_value
			duration := a_duration
			normalize
		end

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE
			-- Data type of the expression, where know
		do
			Result := type_factory.year_month_duration_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

	string_value: STRING
			--Value of the item as a string
		local
			total_months, a_year, a_month: INTEGER
		do
			if not is_normal then normalize end
			total_months := months
			if total_months = 0 then
				Result := "P0M"
			else
				if is_negative then Result := "-P" else Result := "P" end
				a_year := (total_months // 12).abs
				a_month := (total_months \\ 12).abs
				if a_year = 0 then
					Result := Result + a_month.out + "M"
				else
					Result := Result + a_year.out + "Y"
					if a_month /= 0 then
						Result := Result + a_month.out + "M"
					end
				end
			end
		end

	months: INTEGER
			-- total number of months
		do
			Result := 12 * duration.year + duration.month
		end

	seconds: MA_DECIMAL
			-- Seconds component (including milliseconds)
		do
			create Result.make_zero
		end

feature -- Comparison

	same_expression (other: XM_XPATH_EXPRESSION): BOOLEAN
			-- Are `Current' and `other' the same expression?
		local
			a_duration: like duration
		do
			if other.is_months_duration then
				a_duration := other.as_duration_value.duration
				Result := duration.is_equal (a_duration)
			end
		end

feature -- Status report

	is_duration (a_duration: STRING): BOOLEAN
			-- Is `a_duration' a valid duration?
		local
			a_parser: XM_XPATH_DURATION_PARSER
		do
			create a_parser.make
			Result := a_parser.is_months_duration (a_duration)
		end

	is_months_duration: BOOLEAN
			-- Is `Current' an xdt:yearMonthDuration value?
		do
			Result := True
		end

	is_normal: BOOLEAN
			-- Is `duration' in normal form?
		do
			Result := duration.month = 0 or
				duration.year = 0 or
				(duration.month.sign = duration.year.sign)
		end

	display (a_level: INTEGER)
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indentation (a_level), "yearMonthDuration (")
			a_string := STRING_.appended_string (a_string, string_value)
			a_string := STRING_.appended_string (a_string, ")")
			std.error.put_string (a_string)
			std.error.put_new_line
		end

	is_comparable (other: XM_XPATH_ATOMIC_VALUE): BOOLEAN
			-- Is `other' comparable to `Current'?
		do
			Result := other.is_months_duration
		end

feature -- Conversions

	as_months_duration: XM_XPATH_MONTHS_DURATION_VALUE
			-- `Current' seen as an xdt:yearMonthDuration value
		do
			Result := Current
		end


feature -- Basic operations

	plus (other: XM_XPATH_DURATION_VALUE): XM_XPATH_ITEM
			-- Addition of `other' to `Current'
		do
			if other.is_months_duration then
				create {XM_XPATH_MONTHS_DURATION_VALUE} Result.make_from_duration (duration + other.duration)
			else
				create {XM_XPATH_INVALID_ITEM} Result.make_from_string ("Both operands must be the same type for duration addition", Gexslt_eiffel_type_uri, "MIXED-DURATIONS", Dynamic_error)
			end
		end

	minus (other: XM_XPATH_DURATION_VALUE): XM_XPATH_ITEM
			-- Subtraction of `other' from `Current'
		do
			if other.is_months_duration then
				create {XM_XPATH_MONTHS_DURATION_VALUE} Result.make_from_duration (duration - other.duration)
			else
				create {XM_XPATH_INVALID_ITEM} Result.make_from_string ("Both operands must be the same type for duration subtraction", Gexslt_eiffel_type_uri, "MIXED-DURATIONS", Dynamic_error)
			end
		end

	multiply (a_scalar: DOUBLE): XM_XPATH_ITEM
			-- Multiplication of `Current' by `a_scalar'
		local
			a_duration: like duration
			a_result: INTEGER
			a_double: DOUBLE
		do
			a_double := months * a_scalar
			if a_double.abs + 0.5 < (Platform.Maximum_integer + 1.0) then
				a_result := DOUBLE_.rounded_to_integer (a_double)
				if a_result = Platform.Minimum_integer then
					create {XM_XPATH_INVALID_ITEM} Result.make_from_string ("Arithmetic overflow in duration multiplication", Xpath_errors_uri, "FODT0002", Dynamic_error)
				else
					create a_duration.make (0, a_result, 0, 0, 0, 0)
					create {XM_XPATH_MONTHS_DURATION_VALUE} Result.make_from_duration (a_duration)
				end
			else
				create {XM_XPATH_INVALID_ITEM} Result.make_from_string ("Arithmetic overflow in duration multiplication", Xpath_errors_uri, "FODT0002", Dynamic_error)
			end
		end

	scalar_divide (a_scalar: DOUBLE): XM_XPATH_ITEM
			-- Division of `Current' by `a_scalar'
		do
			Result := multiply (1.0 / a_scalar)
		end

	divide (other: XM_XPATH_DURATION_VALUE): XM_XPATH_ITEM
			-- Division of `other' into `Current'
		local
			a_decimal, another_decimal: MA_DECIMAL
		do
			if other.is_months_duration then
				if other.as_months_duration.months = 0 then
					create {XM_XPATH_INVALID_ITEM} Result.make_from_string ("Division by zero", Xpath_errors_uri, "FOAR0001", Dynamic_error)
				else
					create a_decimal.make_from_integer (months)
					create another_decimal.make_from_integer (other.as_months_duration.months)
					a_decimal := a_decimal / another_decimal
					create {XM_XPATH_DECIMAL_VALUE} Result.make (a_decimal)
				end
			else
				create {XM_XPATH_INVALID_ITEM} Result.make_from_string ("Both operands must be the same type for duration division", Gexslt_eiffel_type_uri, "MIXED-DURATIONS", Dynamic_error)
			end
		end

feature {NONE} -- Implementation

	normalize
			-- Normalize `duration'
		local
			l_total_months: INTEGER
		do
			l_total_months := duration.year * 12 + duration.month
			duration.set_year (INTEGER_.div (l_total_months, 12))
			duration.set_month (INTEGER_.mod (l_total_months, 12))
		end

invariant

	zero_days_and_time: duration.day = 0 and then duration.millisecond_count = 0

end
