note

	description:

		"XPath item - a member of a sequence"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2003-2014, Colin Adams and others"
	license: "MIT License"

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

	string_value: STRING
			--Value of the item as a string
		require
			item_not_in_error: not is_error
		deferred
		ensure
			string_value_not_void: Result /= Void
		end

	typed_value: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ATOMIC_VALUE]
			-- Typed value
		require
			item_not_in_error: not is_error
		deferred
		ensure
			typed_value_invulnerable: Result /= Void and then Result.is_invulnerable
		end

	item_type: XM_XPATH_ITEM_TYPE
			-- Type
		deferred
		ensure
			item_type_not_void: Result /= Void
		end

	type_name: STRING
			-- Type name for diagnostic purposes
		deferred
		ensure
			type_name_not_void: Result /= Void
		end

	error_value: detachable XM_XPATH_ERROR_VALUE
			-- Error value
		deferred
		end

feature -- Status report

	is_error: BOOLEAN
			-- Has item failed evaluation?
		deferred
		end

	is_node: BOOLEAN
			-- Is `Current' a node?
		do
			Result := False
		end

	is_atomic_value: BOOLEAN
			-- Is `Current' an atomic value?
		do
			Result := False
		end

	is_function_package: BOOLEAN
			-- Is `Current' an XSLT function call package??
		do
			Result := False
		end

	is_element: BOOLEAN
			-- Is `Current' an element?
		do
			Result := False
		end

	is_document: BOOLEAN
			-- Is `Current' a document?
		do
			Result := False
		end

	is_untyped_atomic: BOOLEAN
			-- Is `Current' an untyped atomic value?
		do
			Result := False
		end

	is_numeric_value: BOOLEAN
			-- Is `Current' a numeric value?
		do
			Result := False
		end

	is_integer_value: BOOLEAN
			-- Is `Current' an integer value?
		do
			Result := False
		end

	is_machine_integer_value: BOOLEAN
			-- Is `Current' a machine integer value?
		do
			Result := False
		end

	is_double_value: BOOLEAN
			-- Is `Current' a double value?
		do
			Result := False
		end

	is_decimal_value: BOOLEAN
			-- Is `Current' a decimal value?
		do
			Result := False
		end

	is_string_value: BOOLEAN
			-- Is `Current' a string value?
		do
			Result := False
		end

	is_boolean_value: BOOLEAN
			-- Is `Current' a boolean value?
		do
			Result := False
		end

	is_qname_value: BOOLEAN
			-- Is `Current' a QName value?
		do
			Result := False
		end

	is_any_uri: BOOLEAN
			-- Is `Current' an anyURI value?
		do
			Result := False
		end

feature -- Status setting

	set_last_error (a_error_value: XM_XPATH_ERROR_VALUE)
			-- Set `error_value'.
		require
			item_not_in_error: not is_error
			error_value_not_void: a_error_value /= Void
		deferred
		ensure
			item_in_error: is_error
			error_value_set: error_value = a_error_value
		end

	set_last_error_from_string (a_message, a_namespace_uri, a_code: STRING; a_error_type: INTEGER)
			-- Set `error_value'.
		require
			item_not_in_error: not is_error
			valid_error_type: a_error_type = Static_error or a_error_type = Type_error or a_error_type = Dynamic_error
			message_not_void: a_message /= Void and then a_message.count > 0
			namespace_uri_not_void: a_namespace_uri /= Void
			code_not_void: a_code /= Void
		deferred
		ensure
			item_in_error: is_error
			valid_error: attached error_value as l_error_value
				and then STRING_.same_string (l_error_value.code , a_code)
		end

feature -- Conversion

	as_item_value: XM_XPATH_VALUE
			-- `Current' seen as a value
		require
			item_not_in_error: not is_error
		deferred
		ensure
			value_not_void: Result /= Void
		end

	as_node: XM_XPATH_NODE
			-- `Current' seen as a node
		require
			node: is_node
		do
			check is_node: False then end
		ensure
			same_object: ANY_.same_objects (Result, Current)
		end

	as_atomic_value: XM_XPATH_ATOMIC_VALUE
			-- `Current' seen as an atomic_value
		require
			atomic_value: is_atomic_value
		do
			check is_atomic_value: False then end
		ensure
			same_object: ANY_.same_objects (Result, Current)
		end

	as_element: XM_XPATH_ELEMENT
			-- `Current' seen as an element
		require
			element: is_element
		do
			check is_element: False then end
		ensure
			same_object: ANY_.same_objects (Result, Current)
		end

	as_document: XM_XPATH_DOCUMENT
			-- `Current' seen as a document
		require
			document: is_document
		do
			check is_document: False then end
		ensure
			same_object: ANY_.same_objects (Result, Current)
		end

	as_untyped_atomic: XM_XPATH_STRING_VALUE
			-- `Current' seen as an untyped atomic
		require
			untyped_atomic_value: is_untyped_atomic
		do
			check is_untyped_atomic: False then end
		ensure
			as_untyped_atomic_not_void: Result /= Void
			untyped_atomic: Result.is_untyped_atomic
			same_object: ANY_.same_objects (Result, Current)
		end

	as_numeric_value: XM_XPATH_NUMERIC_VALUE
			-- `Current' seen as a numeric value
		require
			numeric_value: is_numeric_value
		do
			check is_numeric_value: False then end
		ensure
			same_object: ANY_.same_objects (Result, Current)
		end

	as_integer_value: XM_XPATH_INTEGER_VALUE
			-- `Current' seen as an integer value
		require
			integer_value: is_integer_value
		do
			check is_integer_value: False then end
		ensure
			same_object: ANY_.same_objects (Result, Current)
		end

	as_machine_integer_value: XM_XPATH_MACHINE_INTEGER_VALUE
			-- `Current' seen as a machine integer value
		require
			machine_integer_value: is_machine_integer_value
		do
			check is_machine_integer_value: False then end
		ensure
			same_object: ANY_.same_objects (Result, Current)
		end

	as_double_value: XM_XPATH_DOUBLE_VALUE
			-- `Current' seen as a double value
		require
			double_value: is_double_value
		do
			check is_double_value: False then end
		ensure
			same_object: ANY_.same_objects (Result, Current)
		end

	is_float_value: BOOLEAN
			-- Is `Current' a float value?
		do
			Result := False
		end

	as_float_value: XM_XPATH_FLOAT_VALUE
			-- `Current' seen as a float value
		require
			float_value: is_float_value
		do
			check is_float_value: False then end
		ensure
			same_object: ANY_.same_objects (Result, Current)
		end

	as_decimal_value: XM_XPATH_DECIMAL_VALUE
			-- `Current' seen as a decimal value
		require
			decimal_value: is_decimal_value
		do
			check is_decimal_value: False then end
		ensure
			same_object: ANY_.same_objects (Result, Current)
		end

	as_string_value: XM_XPATH_STRING_VALUE
			-- `Current' seen as a string value
		require
			string_value: is_string_value
		do
			check is_string_value: False then end
		ensure
			as_string_not_void: Result /= Void
			string_value: Result.is_string_value
			same_object: ANY_.same_objects (Result, Current)
		end

	as_boolean_value: XM_XPATH_BOOLEAN_VALUE
			-- `Current' seen as a boolean value
		require
			boolean_value: is_boolean_value
		do
			check is_boolean_value: False then end
		ensure
			same_object: ANY_.same_objects (Result, Current)
		end

	as_qname_value: XM_XPATH_QNAME_VALUE
			-- `Current' seen as a QName value
		require
			qname_value: is_qname_value
		do
			check is_qname_value: False then end
		ensure
			same_object: ANY_.same_objects (Result, Current)
		end

	as_any_uri: XM_XPATH_ANY_URI_VALUE
			-- `Current' seen as an anyURI value
		require
			any_uri_value: is_any_uri
		do
			check is_any_uri: False then end
		ensure
			same_object: ANY_.same_objects (Result, Current)
		end

feature -- Output

	send (a_receiver: XM_XPATH_SEQUENCE_RECEIVER)
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
	machine_integers_are_numeric: is_machine_integer_value implies is_numeric_value
	doubles_are_numeric: is_double_value implies is_numeric_value
	floats_are_numeric: is_float_value implies is_numeric_value

end

