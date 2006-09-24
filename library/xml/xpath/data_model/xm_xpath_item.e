indexing

	description:

		"XPath item - a member of a sequence"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2003, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_ITEM

inherit

	ANY -- required by SE 2.1b1
	
	XM_XPATH_TYPE
		export {NONE} all end

	XM_XPATH_ERROR_TYPES

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

	KL_IMPORTED_ANY_ROUTINES
		export {NONE} all end

	KL_SHARED_STANDARD_FILES
		export {NONE} all end

	XM_XPATH_SHARED_NAME_POOL

feature -- Access

	string_value: STRING is
			--Value of the item as a string
		require
			item_not_in_error: not is_error
		deferred
		ensure
			string_value_not_void: Result /= Void
		end

	hash_code: INTEGER is
			-- Hash code value
		do
			Result := string_value.hash_code
		end

	typed_value: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ATOMIC_VALUE] is
			-- Typed value
		require
			item_not_in_error: not is_error
		deferred
		ensure
			typed_value_invulnerable: Result /= Void and then Result.is_invulnerable
		end

	item_type: XM_XPATH_ITEM_TYPE is
			-- Type
		deferred
		ensure
			item_type_not_void: Result /= Void
		end

	type_name: STRING is
			-- Type name for diagnostic purposes
		deferred
		ensure
			type_name_not_void: Result /= Void
		end

	is_node: BOOLEAN is
			-- Is `Current' a node?
		do
			Result := False
		end

	as_node: XM_XPATH_NODE is
			-- `Current' seen as a node
		require
			node: is_node
		do
		ensure
			same_object: ANY_.same_objects (Result, Current)
		end

	is_function_package: BOOLEAN is
			-- Is `Current' an XSLT function call package??
		do
			Result := False
		end

	is_element: BOOLEAN is
			-- Is `Current' an element?
		do
			Result := False
		end

	as_element: XM_XPATH_ELEMENT is
			-- `Current' seen as an element
		require
			element: is_element
		do
		ensure
			same_object: ANY_.same_objects (Result, Current)
		end

	is_document: BOOLEAN is
			-- Is `Current' a document?
		do
			Result := False
		end

	as_document: XM_XPATH_DOCUMENT is
			-- `Current' seen as a document
		require
			document: is_document
		do
		ensure
			same_object: ANY_.same_objects (Result, Current)
		end
	
	is_untyped_atomic: BOOLEAN is
			-- Is `Current' an untyped atomic value?
		do
			Result := False
		end

	as_untyped_atomic: XM_XPATH_UNTYPED_ATOMIC_VALUE is
			-- `Current' seen as an untyped atomic
		require
			untyped_atomic_value: is_untyped_atomic
		do
		ensure
			same_object: ANY_.same_objects (Result, Current)
		end

	is_object_value: BOOLEAN is
			-- Is `Current' an object value?
		do
			Result := False
		end

	is_atomic_value: BOOLEAN is
			-- Is `Current' an atomic value?
		do
			Result := False
		end

	as_atomic_value: XM_XPATH_ATOMIC_VALUE is
			-- `Current' seen as an atomic_value
		require
			atomic_value: is_atomic_value
		do
		ensure
			same_object: ANY_.same_objects (Result, Current)
		end

	is_numeric_value: BOOLEAN is
			-- Is `Current' a numeric value?
		do
			Result := False
		end

	as_numeric_value: XM_XPATH_NUMERIC_VALUE is
			-- `Current' seen as a numeric value
		require
			numeric_value: is_numeric_value
		do
		ensure
			same_object: ANY_.same_objects (Result, Current)
		end

	is_integer_value: BOOLEAN is
			-- Is `Current' an integer value?
		do
			Result := False
		end

	as_integer_value: XM_XPATH_INTEGER_VALUE is
			-- `Current' seen as an integer value
		require
			integer_value: is_integer_value
		do
		ensure
			same_object: ANY_.same_objects (Result, Current)
		end

	is_double_value: BOOLEAN is
			-- Is `Current' a double value?
		do
			Result := False
		end

	as_double_value: XM_XPATH_DOUBLE_VALUE is
			-- `Current' seen as a double value
		require
			double_value: is_double_value
		do
		ensure
			same_object: ANY_.same_objects (Result, Current)
		end

	is_float_value: BOOLEAN is
			-- Is `Current' a float value?
		do
			Result := False
		end

	as_float_value: XM_XPATH_FLOAT_VALUE is
			-- `Current' seen as a float value
		require
			float_value: is_float_value
		do
		ensure
			same_object: ANY_.same_objects (Result, Current)
		end

	is_decimal_value: BOOLEAN is
			-- Is `Current' a decimal value?
		do
			Result := False
		end

	as_decimal_value: XM_XPATH_DECIMAL_VALUE is
			-- `Current' seen as a decimal value
		require
			decimal_value: is_decimal_value
		do
		ensure
			same_object: ANY_.same_objects (Result, Current)
		end

	is_string_value: BOOLEAN is
			-- Is `Current' a string value?
		do
			Result := False
		end

	as_string_value: XM_XPATH_STRING_VALUE is
			-- `Current' seen as a string value
		require
			string_value: is_string_value
		do
		ensure
			same_object: ANY_.same_objects (Result, Current)
		end

	is_boolean_value: BOOLEAN is
			-- Is `Current' a boolean value?
		do
			Result := False
		end

	as_boolean_value: XM_XPATH_BOOLEAN_VALUE is
			-- `Current' seen as a boolean value
		require
			boolean_value: is_boolean_value
		do
		ensure
			same_object: ANY_.same_objects (Result, Current)
		end

	is_qname_value: BOOLEAN is
			-- Is `Current' a QName value?
		do
			Result := False
		end

	as_qname_value: XM_XPATH_QNAME_VALUE is
			-- `Current' seen as a QName value
		require
			qname_value: is_qname_value
		do
		ensure
			same_object: ANY_.same_objects (Result, Current)
		end

	is_any_uri: BOOLEAN is
			-- Is `Current' an anyURI value?
		do
			Result := False
		end

	as_any_uri: XM_XPATH_ANY_URI_VALUE is
			-- `Current' seen as an anyURI value
		require
			any_uri_value: is_any_uri
		do
		ensure
			same_object: ANY_.same_objects (Result, Current)
		end
	
feature -- Status report

	is_error: BOOLEAN is
			-- Has item failed evaluation?
		deferred
		end
	
	error_value: XM_XPATH_ERROR_VALUE is
			-- Error value
		deferred
		end

feature -- Status setting

	set_last_error (an_error_value: XM_XPATH_ERROR_VALUE) is
			-- Set `error_value'.
		require
			item_not_in_error: not is_error
			error_value_not_void: an_error_value /= Void -- removed 11/09/2006 - can't think why it was there: and then an_error_value.type /= Static_error
		deferred
		ensure
			item_in_error: is_error
			value_set: error_value = an_error_value
		end

	set_last_error_from_string (a_message, a_namespace_uri, a_code: STRING; an_error_type: INTEGER) is
			-- Set `error_value'.
		require
			item_not_in_error: not is_error
			valid_error_type: an_error_type = Static_error or an_error_type = Type_error or an_error_type = Dynamic_error
			message_not_void: a_message /= Void and then a_message.count > 0
			namespace_uri_not_void: a_namespace_uri /= Void
			code_not_void: a_code /= Void
		deferred
		ensure
			item_in_error: is_error
			valid_error: error_value /= Void
				and then STRING_.same_string (error_value.code , a_code)
		end

feature -- Conversion
	
	as_item_value: XM_XPATH_VALUE is
			-- `Current' seen as a value
		require
			item_not_in_error: not is_error
		do

			-- This default version is re-defined by NODE and ATOMIC_VALUE

			create {XM_XPATH_EMPTY_SEQUENCE} Result.make
		ensure
			value_not_void: Result /= Void
		end

feature -- Output

	send (a_receiver: XM_XPATH_SEQUENCE_RECEIVER) is
			-- Send `Current' to `a_receiver'.
		require
			receiver_not_void: a_receiver /= Void
		do
			a_receiver.append_item (Current)
		end

invariant

	no_error_value_without_error: not is_error implies error_value = Void
	item_in_error: is_error implies error_value /= Void
	node_or_atomic_value: not is_error implies is_node xor is_atomic_value
	integers_are_numeric: is_integer_value implies is_numeric_value
	doubles_are_numeric: is_double_value implies is_numeric_value
	floats_are_numeric: is_float_value implies is_numeric_value

end
	
