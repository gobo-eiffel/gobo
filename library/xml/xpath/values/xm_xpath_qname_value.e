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
		redefine
			is_qname_value, as_qname_value
		end

	XM_XPATH_SHARED_NAME_POOL
		export {NONE} all end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

create

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

	is_qname_value: BOOLEAN is
			-- Is `Current' a QName value?
		do
			Result := True
		end

	as_qname_value: XM_XPATH_QNAME_VALUE is
			-- `Current' seen as a QName value
		do
			Result := Current
		end

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

	namespace_uri: STRING is
			-- Namespace of `Current'
		do
			Result := shared_name_pool.namespace_uri_from_name_code (name_code)
		ensure
			namespace_uri_not_void: Result /= Void
		end

	local_name: STRING is
			-- Local name of `Current'
		do
			Result := shared_name_pool.local_name_from_name_code (name_code)
		ensure
			local_name_not_void: Result /= Void
		end

feature -- Comparison

	same_expression (other: XM_XPATH_EXPRESSION): BOOLEAN is
			-- Are `Current' and `other' the same expression?
			-- The prefix is irrelevant. Only the local part and the namespace-uri matter
		local
			other_qname: XM_XPATH_QNAME_VALUE
		do
			if other.is_qname_value then
				other_qname := other.as_qname_value
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
			a_qname_value := other.as_qname_value
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
		do
			Result := other.is_qname_value
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
			std.error.put_new_line
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
