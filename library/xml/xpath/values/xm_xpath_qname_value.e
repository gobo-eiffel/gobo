indexing

	description:

		"XPath QName values"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_QNAME_VALUE

inherit

	XM_XPATH_ATOMIC_VALUE

	XM_XPATH_SHARED_NAME_POOL

	KL_IMPORTED_STRING_ROUTINES

creation

	make

feature {NONE} -- Initialization

	make (a_name_code: INTEGER) is
			-- Establish invariant
		require
			valid_name_code: shared_name_pool.is_valid_name_code (a_name_code)
		do
			make_atomic_value
			name_code := a_name_code
		ensure
			name_code_set: name_code = a_name_code
			static_properties_computed: are_static_properties_computed
		end

feature -- Access

	string_value: STRING is
			--Value of the item as a string
		do
			Result := shared_name_pool.display_name_from_name_code (name_code)
		end

	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type
		do
			Result := type_factory.qname_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

feature -- Comparison

	same_expression (other: XM_XPATH_EXPRESSION): BOOLEAN is
			-- Are `Current' and `other' the same expression?
			-- The prefix is irrelevant. Only the local part and the namespace-uri matter
		local
			other_qname: XM_XPATH_QNAME_VALUE
		do
			other_qname ?= other
			if other_qname /= Void then
				Result := shared_name_pool.uri_code_from_name_code (name_code) = shared_name_pool.uri_code_from_name_code (other_qname.name_code)
					and then STRING_.same_string (shared_name_pool.local_name_from_name_code (name_code), shared_name_pool.local_name_from_name_code (other_qname.name_code))
			end
		end

	three_way_comparison (other: XM_XPATH_ATOMIC_VALUE): INTEGER is
			-- Compare `Current' to `other'
		local
			a_qname_value: XM_XPATH_QNAME_VALUE
			a_uri_code, another_uri_code: INTEGER
		do
			a_qname_value ?= other
				check
					a_qname_value /= Void
					-- From pre-condition `are_comparable'
				end
				a_uri_code := shared_name_pool.uri_code_from_name_code (name_code)
				another_uri_code := shared_name_pool.uri_code_from_name_code (a_qname_value.name_code)
				if a_uri_code = another_uri_code then
					Result := STRING_.three_way_comparison (shared_name_pool.local_name_from_name_code (name_code), shared_name_pool.local_name_from_name_code (a_qname_value.name_code))
				elseif a_uri_code < another_uri_code then
					Result := - 1
				else
					Result := 1
				end
		end

feature -- Status report

	is_comparable (other: XM_XPATH_ATOMIC_VALUE): BOOLEAN is
			-- Is `other' comparable to `Current'?
		local
			a_qname_value: XM_XPATH_QNAME_VALUE
		do
			a_qname_value ?= other
			Result := a_qname_value /= Void
		end
	
	display (a_level: INTEGER) is
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indentation (a_level), "QName (%"")
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

feature {XM_XPATH_QNAME_VALUE} -- Local

	name_code: INTEGER
			-- name code of this QName

invariant

	valid_name_code: shared_name_pool.is_valid_name_code (name_code)

end
