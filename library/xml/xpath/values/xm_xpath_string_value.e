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
			effective_boolean_value
		end

	KL_IMPORTED_STRING_ROUTINES

creation

	make

feature {NONE} -- Initialization

	make (a_value: STRING) is
			-- Establish invariant
		require
			value_not_void: a_value /= Void
		do
			make_atomic_value
			value := clone (a_value)
		ensure
			value_set: STRING_.same_string (value, a_value)
			static_properties_computed: are_static_properties_computed
		end

feature -- Access

	string_value: STRING is
			--Value of the item as a string
		do
			Result := value
		end

	type: INTEGER is
			-- Type
		do
			Result := String_type
		end
	
	item_type: INTEGER is
			--Determine the data type, if possible;
		do
			Result := String_type
		end

feature -- Comparison

	same_expression (other: XM_XPATH_EXPRESSION): BOOLEAN is
			-- Are `Current' and `other' the same expression?
		local
			other_string: XM_XPATH_STRING_VALUE
		do
			other_string ?= other
			if other_string /= Void then
				Result := STRING_.same_string (string_value, other_string.string_value)
			end
		end

	three_way_comparison (other: XM_XPATH_ATOMIC_VALUE): INTEGER is
			-- Compare `Current' to `other'
		local
			a_string_value: XM_XPATH_STRING_VALUE
		do

			-- N.B. This implementatation won't be used, as ST_COLLATOR's version
			-- will be used for comparing strings
			
			a_string_value ?= other
				check
					a_string_value /= Void
					-- From pre-condition `are_comparable'
				end
			Result := string_value.three_way_comparison (a_string_value.string_value)
		end

feature -- Status report

	is_comparable (other: XM_XPATH_ATOMIC_VALUE): BOOLEAN is
			-- Is `other' comparable to `Current'?
		local
			a_string_value: XM_XPATH_STRING_VALUE
		do
			a_string_value ?= other
			Result := a_string_value /= Void
		end
	
	display (a_level: INTEGER; a_pool: XM_XPATH_NAME_POOL) is
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

	is_convertible (a_required_type: INTEGER): BOOLEAN is
			-- Is `Current' convertible to `a_required_type'?
		local
			a_string: STRING
		do
			inspect
				a_required_type
			when Boolean_type then
				a_string := trim_white_space (value)
				if STRING_.same_string (a_string, "0") or else STRING_.same_string (a_string, "false") 
					or else STRING_.same_string (a_string, "1") or else STRING_.same_string (a_string, "true") then
					Result := True
				end
			when Number_type then
				a_string := trim_white_space (value)
				if a_string.index_of ('e', 1) > 0 or else a_string.index_of ('E', 1) > 0 then
					Result := a_string.is_double
				elseif  a_string.index_of ('.', 1) > 0 then
					Result := a_string.is_double -- TODO
					todo ("is-convertible", True)
				else
					Result := a_string.is_integer
				end
			when Double_type then
				Result := a_string.is_double
			when Integer_type then
				Result := a_string.is_integer
			when Decimal_type then
				Result := a_string.is_double	-- TODO
				todo ("is-convertible", True)
			when Untyped_atomic_type, String_type, Atomic_type, Any_item then
				Result := True
			else
				Result := False -- TODO Any_uri, qname, dtd type, dates and times
				todo ("is-convertible", True)
			end
		end

feature -- Evaluation

		effective_boolean_value (a_context: XM_XPATH_CONTEXT): XM_XPATH_BOOLEAN_VALUE is
			-- Effective boolean value
		do
			create Result.make (value.count > 0)
		end

feature -- Conversion

	convert_to_type (a_required_type: INTEGER): XM_XPATH_ATOMIC_VALUE is
			-- Convert `Current' to `a_required_type'
		do
			-- TODO
			todo ("convert-to-type" ,False)
		end

feature {NONE} -- Implementation

	value: STRING
			-- The actual string-value

invariant
	value_not_void: value /= Void

end
