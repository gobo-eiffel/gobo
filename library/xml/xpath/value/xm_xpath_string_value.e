indexing

	description:

		"XPath string values"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_STRING_VALUE

inherit

	XM_XPATH_ATOMIC_VALUE
		redefine
			calculate_effective_boolean_value, is_string_value, as_string_value,
			same_atomic_value
		end

	XM_XPATH_SHARED_ANY_ITEM_TYPE
		export {NONE} all end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_value: STRING) is
			-- Establish invariant
		require
			value_not_void: a_value /= Void
		do
			make_atomic_value
			value := STRING_.cloned_string (a_value)
		ensure
			value_set: STRING_.same_string (value, a_value)
			static_properties_computed: are_static_properties_computed
		end

feature -- Access
	
	is_string_value: BOOLEAN is
			-- Is `Current' a string value?
		do
			Result := True
		end

	as_string_value: XM_XPATH_STRING_VALUE is
			-- `Current' seen as a string value
		do
			Result := Current
		end

	string_value: STRING is
			-- Value of the item as a string
		do
			Result := value
		end

	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type
		do
			Result := type_factory.string_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

feature -- Comparison

	same_expression (other: XM_XPATH_EXPRESSION): BOOLEAN is
			-- Are `Current' and `other' the same expression?
		do
			if other.is_string_value then
				Result := STRING_.same_string (string_value, other.as_string_value.string_value)
			end
		end

	three_way_comparison (other: XM_XPATH_ATOMIC_VALUE; a_context: XM_XPATH_CONTEXT): INTEGER is
			-- Compare `Current' to `other'
		do

			-- N.B. This implementatation won't be used, as ST_COLLATOR's version
			-- will be used for comparing strings
			
			Result := STRING_.three_way_comparison (string_value, other.as_string_value.string_value)
		end

	same_atomic_value (other: XM_XPATH_ATOMIC_VALUE): BOOLEAN is
			-- Are `Current' and `other' the same value?

		do
			if other.is_untyped_atomic then
				Result := STRING_.same_string (value, other.as_untyped_atomic.string_value)
			else
				Result := Precursor (other)
			end
		end

feature -- Status report

	is_comparable (other: XM_XPATH_ATOMIC_VALUE): BOOLEAN is
			-- Is `other' comparable to `Current'?
		do
			Result := other.is_string_value
		end
	
	display (a_level: INTEGER) is
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indentation (a_level), "string (%"")
			a_string := STRING_.appended_string (a_string, string_value)
			a_string := STRING_.appended_string (a_string, "%")")
			std.error.put_string (a_string)
			std.error.put_new_line
		end

	is_convertible (a_required_type: XM_XPATH_ITEM_TYPE): BOOLEAN is
			-- Is `Current' convertible to `a_required_type'?
		local
			a_string: STRING
			a_date_time_parser: DT_XSD_DATE_TIME_PARSER
			a_duration_parser: XM_XPATH_DURATION_PARSER
		do
			if a_required_type = type_factory.boolean_type then
				a_string := trimmed_white_space (value)
				if STRING_.same_string (a_string, "0") or else STRING_.same_string (a_string, "false") 
					or else STRING_.same_string (a_string, "1") or else STRING_.same_string (a_string, "true") then
					Result := True
				end
			elseif a_required_type = type_factory.numeric_type then
				a_string := trimmed_white_space (value)
				if a_string.index_of ('e', 1) > 0 or else a_string.index_of ('E', 1) > 0 then
					Result := a_string.is_double
				elseif  a_string.index_of ('.', 1) > 0 then
					Result := True -- but you may get NaN
					-- Maybe this is correct behaviour todo ("is-convertible (to decimal)", True)
				else
					Result := a_string.is_integer
				end
			elseif a_required_type = type_factory.double_type or else a_required_type = type_factory.numeric_type then
				a_string := trimmed_white_space (value)
				Result := a_string.is_double or else STRING_.same_string (a_string, "INF")
					or else STRING_.same_string (a_string, "-INF")
					or else STRING_.same_string (a_string, "NaN")
			elseif a_required_type = type_factory.float_type then
				a_string := trimmed_white_space (value)
				Result := a_string.is_real or else STRING_.same_string (a_string, "INF")
					or else STRING_.same_string (a_string, "-INF")
					or else STRING_.same_string (a_string, "NaN")
			elseif a_required_type = type_factory.integer_type then
				a_string := trimmed_white_space (value)
				Result := a_string.is_integer
			elseif a_required_type = type_factory.decimal_type then
				a_string := trimmed_white_space (value)
				create last_decimal.make_from_string (a_string)
				Result := not (last_decimal.is_nan)
			elseif a_required_type = type_factory.untyped_atomic_type
				or else a_required_type = type_factory.string_type
				or else a_required_type = type_factory.any_atomic_type
				or else a_required_type = type_factory.any_simple_type
				or else a_required_type = any_item then
				Result := True
			elseif a_required_type = type_factory.any_uri_type then
				Result := True
			elseif a_required_type = type_factory.qname_type then
				Result := False -- not done directly, as a static context is necessary
			elseif a_required_type = type_factory.date_type then
				create a_date_time_parser.make_1_1
				Result := a_date_time_parser.is_zoned_date (value)
					or else a_date_time_parser.is_date (value)
			elseif a_required_type = type_factory.time_type then
				create a_date_time_parser.make_1_1
				Result := a_date_time_parser.is_zoned_time (value)
					or else a_date_time_parser.is_time (value)
			elseif a_required_type = type_factory.date_time_type then
				create a_date_time_parser.make_1_1
				Result := a_date_time_parser.is_zoned_date_time (value)
					or else a_date_time_parser.is_date_time (value)
			elseif a_required_type = type_factory.g_year_month_type then
				create a_date_time_parser.make_1_1
				Result := a_date_time_parser.is_zoned_year_month (value)
					or else a_date_time_parser.is_year_month (value)
			elseif a_required_type = type_factory.g_year_type then
				create a_date_time_parser.make_1_1
				Result := a_date_time_parser.is_zoned_year (value)
					or else a_date_time_parser.is_year (value)
			elseif a_required_type = type_factory.g_month_type then
				create a_date_time_parser.make_1_1
				Result := a_date_time_parser.is_zoned_month (value)
					or else a_date_time_parser.is_month (value)
			elseif a_required_type = type_factory.g_month_day_type then
				create a_date_time_parser.make_1_1
				Result := a_date_time_parser.is_zoned_month_day (value)
					or else a_date_time_parser.is_month_day (value)
			elseif a_required_type = type_factory.g_day_type then
				create a_date_time_parser.make_1_1
				Result := a_date_time_parser.is_zoned_day (value)
					or else a_date_time_parser.is_day (value)
			elseif a_required_type = type_factory.day_time_duration_type then
				create a_duration_parser.make
				Result := a_duration_parser.is_seconds_duration (value)
			elseif a_required_type = type_factory.year_month_duration_type then
				create a_duration_parser.make
				Result := a_duration_parser.is_months_duration (value)
			elseif a_required_type = type_factory.duration_type then
				create a_duration_parser.make
				Result := a_duration_parser.is_duration (value)
			elseif a_required_type = type_factory.hex_binary_type then
				Result := STRING_.is_hexadecimal (string_value)
			elseif a_required_type = type_factory.base64_binary_type then
				Result := STRING_.is_base64 (string_value)
			end
		end

feature -- Evaluation

		calculate_effective_boolean_value (a_context: XM_XPATH_CONTEXT) is
			-- Effective boolean value
		do
			create last_boolean_value.make (value.count > 0)
		end

feature -- Conversion

	convert_to_type (a_required_type: XM_XPATH_ITEM_TYPE): XM_XPATH_ATOMIC_VALUE is
			-- Convert `Current' to `a_required_type'
		local
			a_value: STRING
		do
			a_value := STRING_.cloned_string (value)
			STRING_.left_adjust (a_value)
			STRING_.right_adjust (a_value)
			if a_required_type = type_factory.boolean_type then
				if STRING_.same_string (a_value, "0") or else STRING_.same_string (a_value, "false") then
					create {XM_XPATH_BOOLEAN_VALUE} Result.make (False)
				else
					check
						STRING_.same_string (a_value, "1") or else STRING_.same_string (a_value, "true")
						-- from pre-condition
					end
					create {XM_XPATH_BOOLEAN_VALUE} Result.make (True)
				end
			elseif a_required_type = type_factory.double_type or else a_required_type = type_factory.numeric_type then
				create {XM_XPATH_DOUBLE_VALUE} Result.make_from_string (a_value)
			elseif a_required_type = type_factory.float_type then
				create {XM_XPATH_FLOAT_VALUE} Result.make_from_string (a_value)
			elseif a_required_type = type_factory.integer_type then
				create {XM_XPATH_INTEGER_VALUE} Result.make_from_string (a_value)
			elseif a_required_type = type_factory.decimal_type then
				create {XM_XPATH_DECIMAL_VALUE} Result.make (last_decimal)
			elseif a_required_type = type_factory.any_uri_type then
				create {XM_XPATH_ANY_URI_VALUE} Result.make (value)
			elseif a_required_type = type_factory.string_type or else
				a_required_type = type_factory.any_atomic_type or else
				a_required_type = any_item then
				Result := Current
			elseif a_required_type = type_factory.untyped_atomic_type or else
				a_required_type = type_factory.any_simple_type then
				create {XM_XPATH_UNTYPED_ATOMIC_VALUE} Result.make (value)
			elseif a_required_type = type_factory.date_type then
				create {XM_XPATH_DATE_VALUE} Result.make (value)
			elseif a_required_type = type_factory.time_type then
				create {XM_XPATH_TIME_VALUE} Result.make (value)
			elseif a_required_type = type_factory.date_time_type then
				create {XM_XPATH_DATE_TIME_VALUE} Result.make (value)
			elseif a_required_type = type_factory.g_year_month_type then
				create {XM_XPATH_YEAR_MONTH_VALUE} Result.make (value)
			elseif a_required_type = type_factory.g_year_type then
				create {XM_XPATH_YEAR_VALUE} Result.make (value)
			elseif a_required_type = type_factory.g_month_type then
				create {XM_XPATH_MONTH_VALUE} Result.make (value)
			elseif a_required_type = type_factory.g_month_day_type then
				create {XM_XPATH_MONTH_DAY_VALUE} Result.make (value)
			elseif a_required_type = type_factory.g_day_type then
				create {XM_XPATH_DAY_VALUE} Result.make (value)
			elseif a_required_type = type_factory.day_time_duration_type then
				create {XM_XPATH_SECONDS_DURATION_VALUE} Result.make (value)
			elseif a_required_type = type_factory.year_month_duration_type then
				create {XM_XPATH_MONTHS_DURATION_VALUE} Result.make (value)
			elseif a_required_type = type_factory.duration_type then
				create {XM_XPATH_DURATION_VALUE} Result.make (value)
			elseif a_required_type = type_factory.hex_binary_type then
				create {XM_XPATH_HEX_BINARY_VALUE} Result.make (value)
			elseif a_required_type = type_factory.base64_binary_type then
				create {XM_XPATH_BASE64_BINARY_VALUE} Result.make (value)
			else
				-- TODO
				todo ("convert-to-type (" + a_required_type.conventional_name + ")",True)				
			end
		end

feature {NONE} -- Implementation

	value: STRING
			-- The actual string-value

	last_decimal: MA_DECIMAL
			-- Cached value from `is_convertible (type_factory.decimal_type)'
	
invariant

	value_not_void: value /= Void

end
