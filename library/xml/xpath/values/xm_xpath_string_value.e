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
			calculate_effective_boolean_value, is_string_value, as_string_value
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
			--Value of the item as a string
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

	three_way_comparison (other: XM_XPATH_ATOMIC_VALUE): INTEGER is
			-- Compare `Current' to `other'
		do

			-- N.B. This implementatation won't be used, as ST_COLLATOR's version
			-- will be used for comparing strings
			
			Result := string_value.three_way_comparison (other.as_string_value.string_value)
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
					Result := True -- but you may get NaN TODO
					todo ("is-convertible (to decimal)", True)
				else
					Result := a_string.is_integer
				end
			elseif a_required_type = type_factory.double_type or else a_required_type = type_factory.numeric_type then
				a_string := trimmed_white_space (value)
				Result := a_string.is_double or else STRING_.same_string (a_string, "INF")
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
				Result := False				
				todo ("is-convertible (xs:date)", True)
			else
				Result := False -- TODO dtd type, datetimes and times
				todo ("is-convertible", True)
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
