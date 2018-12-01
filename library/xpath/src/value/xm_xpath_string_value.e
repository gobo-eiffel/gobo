note

	description:

		"[
        XPath string values.
        This class is also used for untyped atomic values, in order to save
        memory allocation costs when converting between the two types.
        These conversions happen in vast quantities.
       ]"


	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004-2018, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_STRING_VALUE

inherit

	XM_XPATH_ATOMIC_VALUE
		redefine
			calculate_effective_boolean_value, is_string_value, as_string_value,
			same_atomic_value, is_untyped_atomic, as_untyped_atomic
		end

	XM_XPATH_SHARED_ANY_ITEM_TYPE
		export {NONE} all end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

create

	make, make_untyped_atomic

feature {NONE} -- Initialization

	make (a_value: STRING)
			-- Create as string value.
		require
			value_not_void: a_value /= Void
		do
			make_atomic_value
			value := STRING_.cloned_string (a_value)
		ensure
			value_set: STRING_.same_string (value, a_value)
			string_value: is_string_value
			static_properties_computed: are_static_properties_computed
		end

	make_untyped_atomic (a_value: STRING)
			-- Create as untyped atomic value.
		require
			value_not_void: a_value /= Void
		do
			make_atomic_value
			value := STRING_.cloned_string (a_value)
			is_untyped_atomic := True
		ensure
			value_set: STRING_.same_string (value, a_value)
			untyped_atomic_value: is_untyped_atomic
			static_properties_computed: are_static_properties_computed
		end

feature -- Access

	is_untyped_atomic: BOOLEAN
			-- Is `Current' an untyped atomic value?

	is_string_value: BOOLEAN
			-- Is `Current' a string value?
		do
			Result := not is_untyped_atomic
		end

	string_value: STRING
			-- Value of the item as a string
		do
			Result := value
		end

	item_type: XM_XPATH_ITEM_TYPE
			-- Data type
		do
			if is_string_value then
				Result := type_factory.string_type
			else
				Result := type_factory.untyped_atomic_type
			end
		end

feature -- Comparison

	same_expression (a_other: XM_XPATH_EXPRESSION): BOOLEAN
			-- Are `Current' and `a_other' the same expression?
		do
			if is_string_value then
				if a_other.is_string_value then
					Result := STRING_.same_string (string_value, a_other.as_string_value.string_value)
				end
			else
				if a_other.is_untyped_atomic then
					Result := STRING_.same_string (string_value, a_other.as_untyped_atomic.string_value)
				end
			end
		end

	three_way_comparison (other: XM_XPATH_ATOMIC_VALUE; a_context: detachable XM_XPATH_CONTEXT): INTEGER
			-- Compare `Current' to `other'
		do

			-- N.B. This implementatation won't be used, as ST_COLLATOR's version
			-- will be used for comparing strings

			Result := STRING_.three_way_comparison (string_value, other.string_value)
		end

	three_way_comparison_using_collator (a_other: XM_XPATH_ATOMIC_VALUE; a_collator: ST_COLLATOR): INTEGER
			-- Comparison with `a_other'
		require
			untyped_atomic: is_untyped_atomic
			atomic_value_valid: a_other /= Void and then is_comparable (a_other)
			collator_not_void: a_collator /= Void
		do
			if a_other.is_numeric_value then
				if double_value = Void then
					convert_to_type (type_factory.double_type)
				end
				check attached double_value as l_double_value then
					Result := l_double_value.three_way_comparison (a_other.as_numeric_value, Void)
				end
			else
				Result := a_collator.three_way_comparison (string_value, a_other.string_value)
			end
		ensure
			three_way_comparison: Result >= -1 and Result <= 1
		end

	same_atomic_value (a_other: XM_XPATH_ATOMIC_VALUE): BOOLEAN
			-- Are `Current' and `other' the same value?

		do
			if is_untyped_atomic and a_other.is_untyped_atomic then
				Result := STRING_.same_string (value, a_other.as_untyped_atomic.string_value)
			elseif is_string_value and a_other.is_string_value then
				Result := STRING_.same_string (value, a_other.as_string_value.string_value)
			else
				Result := Precursor (a_other)
			end
		end

feature -- Status report

	is_comparable (a_other: XM_XPATH_ATOMIC_VALUE): BOOLEAN
			-- Is `a_other' comparable to `Current'?
		do
			if is_string_value then
				Result := a_other.is_string_value and not a_other.is_any_uri
			else
				if a_other.is_numeric_value then
					if double_value /= Void then
						Result := True
					else
						Result := is_convertible (type_factory.double_type)
					end
				else
					Result := True
				end
			end
		end

	display (a_level: INTEGER)
			-- Diagnostic print of expression structure to `std.error'
		local
			l_string: STRING
		do
			if is_string_value then
				l_string := STRING_.concat (indentation (a_level), "string (%"")
			else
				l_string := STRING_.concat (indentation (a_level), "untyped (%"")
			end
			l_string := STRING_.appended_string (l_string, string_value)
			l_string := STRING_.appended_string (l_string, "%")")
			std.error.put_string (l_string)
			std.error.put_new_line
		end

	is_convertible (a_required_type: XM_XPATH_ITEM_TYPE): BOOLEAN
			-- Is `Current' convertible to `a_required_type'?
		local
			a_string: STRING
			a_date_time_parser: ST_XSD_DATE_TIME_PARSER
			a_duration_parser: XM_XPATH_DURATION_PARSER
			l_last_decimal: like last_decimal
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
				if value.index_of ('e', 1) = 0 and value.index_of ('E', 1) = 0 then
					create l_last_decimal.make_from_string (trimmed_white_space (value))
					last_decimal := l_last_decimal
					Result := not (l_last_decimal.is_nan)
				end
			elseif a_required_type = type_factory.untyped_atomic_type
				or else a_required_type = type_factory.string_type
				or else a_required_type = type_factory.any_atomic_type
				or else a_required_type = type_factory.any_simple_type
				or else a_required_type = any_item then
				Result := True
			elseif a_required_type = type_factory.any_uri_type then
				Result := True -- TODO - not quite true - might contain # in fragment
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
				Result := STRING_.is_hexadecimal (string_value) and string_value.count \\ 2 = 0
			elseif a_required_type = type_factory.base64_binary_type then
				Result := STRING_.is_base64 (string_value)
			end
		end

feature -- Evaluation

	calculate_effective_boolean_value (a_context: XM_XPATH_CONTEXT)
			-- Effective boolean value
		do
			create last_boolean_value.make (value.count > 0)
		end

feature -- Conversion

	as_string_value: XM_XPATH_STRING_VALUE
			-- `Current' seen as a string value
		do
			Result := Current
		end

	as_untyped_atomic: XM_XPATH_STRING_VALUE
			-- `Current' seen as an untyped atomic
		do
			Result := Current
		end

	convert_to_type (a_required_type: XM_XPATH_ITEM_TYPE)
			-- Convert `Current' to `a_required_type'
		local
			l_value: STRING
			l_last_decimal: like last_decimal
		do
			if a_required_type = type_factory.string_type or
				a_required_type = type_factory.any_atomic_type or
				a_required_type = any_item then
				create {XM_XPATH_STRING_VALUE} converted_value.make (value)
			elseif a_required_type = type_factory.untyped_atomic_type or
				a_required_type = type_factory.any_simple_type then
				create {XM_XPATH_STRING_VALUE} converted_value.make_untyped_atomic (value)
			else
				l_value := STRING_.cloned_string (value)
				STRING_.left_adjust (l_value)
				STRING_.right_adjust (l_value)
				if a_required_type = type_factory.boolean_type then
					if STRING_.same_string (l_value, "0") or STRING_.same_string (l_value, "false") then
						create {XM_XPATH_BOOLEAN_VALUE} converted_value.make (False)
					else
						check
							STRING_.same_string (l_value, "1") or STRING_.same_string (l_value, "true")
							-- from pre-condition
						end
						create {XM_XPATH_BOOLEAN_VALUE} converted_value.make (True)
					end
				elseif a_required_type = type_factory.double_type or a_required_type = type_factory.numeric_type then
					if double_value /= Void then
						converted_value := double_value
					else
						-- Cache the result
						create double_value.make_from_string (l_value)
						converted_value := double_value
					end
				elseif a_required_type = type_factory.float_type then
					create {XM_XPATH_FLOAT_VALUE} converted_value.make_from_string (l_value)
				elseif a_required_type = type_factory.integer_type then
					if STRING_.is_integer_64 (l_value) then
						create {XM_XPATH_MACHINE_INTEGER_VALUE} converted_value.make (STRING_.to_integer_64 (l_value))
					else
						create {XM_XPATH_INTEGER_VALUE} converted_value.make_from_string (l_value)
					end
				elseif a_required_type = type_factory.decimal_type then
					l_last_decimal := last_decimal
					if l_last_decimal = Void then
						create l_last_decimal.make_from_string (trimmed_white_space (value))
						last_decimal := l_last_decimal
					end
					create {XM_XPATH_DECIMAL_VALUE} converted_value.make (l_last_decimal)
				elseif a_required_type = type_factory.any_uri_type then
					create {XM_XPATH_ANY_URI_VALUE} converted_value.make (value)
				elseif a_required_type = type_factory.date_type then
					create {XM_XPATH_DATE_VALUE} converted_value.make (value)
				elseif a_required_type = type_factory.time_type then
					create {XM_XPATH_TIME_VALUE} converted_value.make (value)
				elseif a_required_type = type_factory.date_time_type then
					create {XM_XPATH_DATE_TIME_VALUE} converted_value.make (value)
				elseif a_required_type = type_factory.g_year_month_type then
					create {XM_XPATH_YEAR_MONTH_VALUE} converted_value.make (value)
				elseif a_required_type = type_factory.g_year_type then
					create {XM_XPATH_YEAR_VALUE} converted_value.make (value)
				elseif a_required_type = type_factory.g_month_type then
					create {XM_XPATH_MONTH_VALUE} converted_value.make (value)
				elseif a_required_type = type_factory.g_month_day_type then
					create {XM_XPATH_MONTH_DAY_VALUE} converted_value.make (value)
				elseif a_required_type = type_factory.g_day_type then
					create {XM_XPATH_DAY_VALUE} converted_value.make (value)
				elseif a_required_type = type_factory.day_time_duration_type then
					create {XM_XPATH_SECONDS_DURATION_VALUE} converted_value.make (value)
				elseif a_required_type = type_factory.year_month_duration_type then
					create {XM_XPATH_MONTHS_DURATION_VALUE} converted_value.make (value)
				elseif a_required_type = type_factory.duration_type then
					create {XM_XPATH_DURATION_VALUE} converted_value.make (value)
				elseif a_required_type = type_factory.hex_binary_type then
					create {XM_XPATH_HEX_BINARY_VALUE} converted_value.make (value)
				elseif a_required_type = type_factory.base64_binary_type then
					create {XM_XPATH_BASE64_BINARY_VALUE} converted_value.make (value)
				else
					-- TODO for schema-aware types
					todo ("convert-to-type (" + a_required_type.conventional_name + ")",True)
				end
			end
		end

feature {NONE} -- Implementation

	value: STRING
			-- The actual string-value

	double_value: detachable XM_XPATH_DOUBLE_VALUE
			-- Cached result

	last_decimal: detachable MA_DECIMAL
			-- Cached value from `is_convertible (type_factory.decimal_type)'

invariant

	value_not_void: value /= Void

end
