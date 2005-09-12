indexing

	description:

		"Objects that represent XPath xdt:yearMonthDuration values"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_MONTHS_DURATION_VALUE

inherit

	XM_XPATH_DURATION_VALUE
		redefine
			make, make_from_duration, is_duration, string_value,
			is_months_duration, as_months_duration,
			same_expression, is_convertible,
			display, convert_to_type, item_type
		end

create

	make, make_from_duration

feature {NONE} -- Initialization

	make (a_duration: STRING) is
			-- Create from lexical duration.
		local
			a_parser: XM_XPATH_DURATION_PARSER
		do
			make_atomic_value
			create a_parser.make
			duration := a_parser.string_to_months_duration (a_duration)
			normalize
		end

	make_from_duration (a_duration: like duration) is
			-- Create from duration.
		do
			make_atomic_value
			duration := a_duration
			normalize
		end

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, where know
		do
			Result := type_factory.year_month_duration_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

	string_value: STRING is
			--Value of the item as a string
		local
			a_string: STRING
			total_months, a_year, a_month: INTEGER
		do
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

	months: INTEGER is
			-- total number of months
		do
			Result := duration.year + duration.month
		end

feature -- Comparison

	same_expression (other: XM_XPATH_EXPRESSION): BOOLEAN is
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

	is_duration (a_duration: STRING): BOOLEAN is
			-- Is `a_duration' a valid duration?
		local
			a_parser: XM_XPATH_DURATION_PARSER
		do
			create a_parser.make
			Result := a_parser.is_months_duration (a_duration)
		end

	is_months_duration: BOOLEAN is
			-- Is `Current' an xdt:yearMonthDuration value?
		do
			Result := True
		end

	is_convertible (a_required_type: XM_XPATH_ITEM_TYPE): BOOLEAN is
			-- Is `Current' convertible to `a_required_type'?
		do
			if	a_required_type = any_item or else a_required_type = type_factory.any_atomic_type
				or else a_required_type = type_factory.duration_type
				or else a_required_type = type_factory.year_month_duration_type
				or else a_required_type = type_factory.string_type
				or else a_required_type = type_factory.untyped_atomic_type then
				Result := True
			end
		end

	display (a_level: INTEGER) is
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

feature -- Conversions

	as_months_duration: XM_XPATH_MONTHS_DURATION_VALUE is
			-- `Current' seen as an xdt:yearMonthDuration value
		do
			Result := Current
		end
	
	convert_to_type (a_required_type: XM_XPATH_ITEM_TYPE): XM_XPATH_ATOMIC_VALUE is
			-- Convert `Current' to `a_required_type'
		local
			a_duration: like duration
		do
			if	a_required_type = any_item or else a_required_type = type_factory.any_atomic_type
				or else a_required_type = type_factory.year_month_duration_type then
				Result := Current
			elseif a_required_type = type_factory.string_type then
				create {XM_XPATH_STRING_VALUE} Result.make (string_value)
			elseif a_required_type = type_factory.untyped_atomic_type then
				create {XM_XPATH_UNTYPED_ATOMIC_VALUE} Result.make (string_value)
			elseif a_required_type = type_factory.duration_type then
				create {XM_XPATH_DURATION_VALUE} Result.make_from_duration (duration)
			end
		end

feature {NONE} -- Implementation

	normalize is
			-- Normalize `duration'
		do
			if duration.month.abs > 11 then
				duration.set_year (duration.year + (duration.month // 12))
				duration.set_month (duration.month \\ 12)
			end
		end

end
