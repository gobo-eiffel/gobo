indexing

	description:

		"XPath anyURI values"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_ANY_URI_VALUE

inherit

	XM_XPATH_ATOMIC_VALUE

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
			value := trim_white_space (a_value)
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

	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type
		do
			Result := type_factory.any_uri_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

feature -- Comparison

	same_expression (other: XM_XPATH_EXPRESSION): BOOLEAN is
			-- Are `Current' and `other' the same expression?
		local
			other_uri: XM_XPATH_ANY_URI_VALUE
		do
			other_uri ?= other
			if other_uri /= Void then
				Result := STRING_.same_string (string_value, other_uri.string_value)
			end
		end

	three_way_comparison (other: XM_XPATH_ATOMIC_VALUE): INTEGER is
			-- Compare `Current' to `other'
		local
			a_uri_value: XM_XPATH_ANY_URI_VALUE
		do

			-- N.B. This implementatation won't be used, as ST_COLLATOR's version
			-- will be used for comparing strings (TODO: ? - check this out).			

			a_uri_value ?= other
				check
					a_uri_value /= Void
					-- From pre-condition `are_comparable'
				end
			Result := string_value.three_way_comparison (a_uri_value.string_value)
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
	
	display (a_level: INTEGER) is
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indentation (a_level), "anyURI (%"")
			a_string := STRING_.appended_string (a_string, string_value)
			a_string := STRING_.appended_string (a_string, "%")")
			std.error.put_string (a_string)
			if is_error then
				std.error.put_string (" in error%N")
			else			
				std.error.put_new_line
			end
		end

	is_convertible (a_required_type: XM_XPATH_ITEM_TYPE): BOOLEAN is
			-- Is `Current' convertible to `a_required_type'?
		do
			todo ("is-convertible", False)
		end

feature -- Conversion

	convert_to_type (a_required_type: XM_XPATH_ITEM_TYPE): XM_XPATH_ATOMIC_VALUE is
			-- Convert `Current' to `a_required_type'
		do
				todo ("convert-to-type", False)				
		end

feature {NONE} -- Implementation

	value: STRING
			-- The actual string-value

invariant
	value_not_void: value /= Void

end
