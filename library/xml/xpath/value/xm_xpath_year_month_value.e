indexing

	description:

		"Objects that represent XML Schema gYearMonth values"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_YEAR_MONTH_VALUE

inherit

	XM_XPATH_DATE_VALUE
		redefine
			make, is_date_value, item_type,
			is_date, same_expression,
			string_value, three_way_comparison,
			is_comparable, is_convertible,
			convert_to_type, display, is_calendar_value,
			is_year_month_value, as_year_month_value
		end

create

	make, make_from_date, make_from_zoned_date

feature {NONE} -- Initialization

	make (a_lexical_date: STRING) is
			-- Create from lexical date.
		local
			a_date_time_parser: DT_XSD_DATE_TIME_PARSER
		do
			make_atomic_value
			create a_date_time_parser.make_1_1
			if a_date_time_parser.is_zoned_year_month (a_lexical_date) then
				zoned := True
				zoned_date := a_date_time_parser.string_to_zoned_year_month (a_lexical_date)				
			else
				local_date := a_date_time_parser.string_to_year_month (a_lexical_date)
			end
			if not zoned then set_depends_upon_implicit_timezone end
		end

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, where know
		do
			Result := type_factory.g_year_month_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

	string_value: STRING is
			--Value of the item as a string
		local
			a_date_time_parser: DT_XSD_DATE_TIME_FORMAT
		do
			create a_date_time_parser.make_1_1
			if zoned then
				Result := a_date_time_parser.zoned_year_month_to_string (zoned_date)
			else
				Result := a_date_time_parser.year_month_to_string (local_date)
			end
		end

feature -- Comparison

	same_expression (other: XM_XPATH_EXPRESSION): BOOLEAN is
			-- Are `Current' and `other' the same expression?
		do
			if other.is_year_month_value then
				Result := zoned = other.as_year_month_value.zoned
					and then utc_date.three_way_comparison (other.as_year_month_value.utc_date) = 0
			end
		end
	
	three_way_comparison (other: XM_XPATH_ATOMIC_VALUE; a_context: XM_XPATH_CONTEXT): INTEGER is
			-- Comparison of `Current' to `other'
		local
			a_ym: XM_XPATH_YEAR_MONTH_VALUE
			dt1, dt2: DT_DATE_TIME
			a_time: DT_TIME
		do
			a_ym := other.as_year_month_value
			if zoned = a_ym.zoned then
				create a_time.make (0,0,0)
				create dt1.make_from_date_time (zoned_date.date, a_time)
				zoned_date.time_zone.convert_to_utc (dt1)
				create a_time.make (0,0,0)
				create dt2.make_from_date_time (a_ym.zoned_date.date, a_time)
				a_ym.zoned_date.time_zone.convert_to_utc (dt2)
				Result := dt1.three_way_comparison (dt2)
 			elseif zoned then
				create a_time.make (0,0,0)
				create dt2.make_from_date_time (a_ym.local_date, a_time)
				a_context.implicit_timezone.convert_to_utc (dt2)
				create a_time.make (0,0,0)
				create dt1.make_from_date_time (zoned_date.date, a_time)
				zoned_date.time_zone.convert_to_utc (dt1)
				Result := dt1.three_way_comparison (dt2)
			else -- `other' is zoned
				create a_time.make (0,0,0)
				create dt2.make_from_date_time (a_ym.local_date, a_time)
				a_ym.zoned_date.time_zone.convert_to_utc (dt2)
				create a_time.make (0,0,0)
				create dt1.make_from_date_time (local_date, a_time)
				a_context.implicit_timezone.convert_to_utc (dt1)
				Result := dt1.three_way_comparison (dt2)
			end
		end

feature -- Status report

	is_date_value: BOOLEAN is
			-- Is `Current' a date value?
		do
			Result := False
		end

	is_calendar_value: BOOLEAN is
			-- Is `Current' a calendar value?
		do
			Result := False
		end

	is_year_month_value: BOOLEAN is
			-- Is `Current' a gYearMonth value?
		do
			Result := True
		end

	is_date (a_lexical_date: STRING): BOOLEAN is
			-- Is `a_lexical_date' a valid date?
		local
			a_date_time_parser: DT_XSD_DATE_TIME_PARSER
		do
			create a_date_time_parser.make_1_1
			Result := a_date_time_parser.is_zoned_year_month (a_lexical_date)
				or else a_date_time_parser.is_year_month (a_lexical_date)
		end

	is_comparable (other: XM_XPATH_ATOMIC_VALUE): BOOLEAN is
			-- Is `other' comparable to `Current'?
		do
			Result := other.is_year_month_value
		end

	is_convertible (a_required_type: XM_XPATH_ITEM_TYPE): BOOLEAN is
			-- Is `Current' convertible to `a_required_type'?
		do
			if	a_required_type = any_item or else a_required_type = type_factory.any_atomic_type
				or else a_required_type = type_factory.g_year_month_type
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
			a_string := STRING_.appended_string (indentation (a_level), "gYearMonth (")
			a_string := STRING_.appended_string (a_string, string_value)
			a_string := STRING_.appended_string (a_string, ")")
			std.error.put_string (a_string)
			std.error.put_new_line
		end

feature -- Conversions

	as_year_month_value: XM_XPATH_YEAR_MONTH_VALUE is
			-- `Current' seen as a gYearMonth value
		do
			Result := Current
		end

	convert_to_type (a_required_type: XM_XPATH_ITEM_TYPE): XM_XPATH_ATOMIC_VALUE is
			-- Convert `Current' to `a_required_type'
		do
			if	a_required_type = any_item or else a_required_type = type_factory.any_atomic_type
				or else a_required_type = type_factory.g_year_month_type then
				Result := Current
			elseif a_required_type = type_factory.string_type then
				create {XM_XPATH_STRING_VALUE} Result.make (string_value)
			elseif a_required_type = type_factory.untyped_atomic_type then
				create {XM_XPATH_UNTYPED_ATOMIC_VALUE} Result.make (string_value)
			end
		end

end
