note

	description:

		"Objects that are XPath values that are not a sequence (strictly, a sequence of one item)"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004-2014, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_ATOMIC_VALUE

inherit

	XM_XPATH_VALUE
		undefine
			is_integer_value, as_integer_value, is_string_value, as_string_value, is_decimal_value, as_decimal_value,
			is_qname_value, as_qname_value, is_boolean_value, as_boolean_value, is_numeric_value, as_numeric_value,
			is_atomic_value, as_atomic_value, is_untyped_atomic, as_untyped_atomic, is_function_package,
			is_any_uri, as_any_uri, is_machine_integer_value, as_machine_integer_value
		redefine
			generate_events, count, calculate_effective_boolean_value
		end

	XM_XPATH_ITEM
		redefine
			as_item_value, is_atomic_value, as_atomic_value
		end

	HASHABLE

feature {NONE} -- Initialization

	make_atomic_value
			-- Establish static properties
		do
			make_value
			set_cardinality_exactly_one
		end

feature -- Access

	hash_code: INTEGER
			-- Hash code value
		do
			Result := string_value.hash_code
		end

	typed_value: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ATOMIC_VALUE]
			-- Typed value
		do
			create {XM_XPATH_SINGLETON_ITERATOR [XM_XPATH_ATOMIC_VALUE]} Result.make (Current)
		end

	type_name: STRING
			-- Type name for diagnostic purposes
		do
			Result := item_type.conventional_name
		end

	primitive_value: XM_XPATH_ATOMIC_VALUE
			-- Primitive value;
			-- For built-in types, this is the type itself.
			-- For user-defined types, this is the type minus it's type annotation.
		do
			Result := Current
		ensure
			primitive_value_not_void: Result /= Void
		end

	is_atomic_value: BOOLEAN
			-- Is `Current' an atomic value?
		do
			Result := True
		end

	as_atomic_value: XM_XPATH_ATOMIC_VALUE
			-- `Current' seen as an atomic_value
		do
			Result := Current
		end

	count: INTEGER
			-- Number of items in `Current'
		do
			Result := 1
		end

feature -- Comparison

	three_way_comparison (a_other: XM_XPATH_ATOMIC_VALUE; a_context: detachable XM_XPATH_CONTEXT): INTEGER
			-- Compare `Current' to `a_other'
		require
			comparable_a_other: a_other /= Void and then is_comparable (a_other)
			dynamic_context_not_void: (depends_upon_implicit_timezone or else a_other.depends_upon_implicit_timezone) implies a_context /= Void
		deferred
		ensure
			three_way_comparison: Result >= -1 and Result <= 1
		end


	same_atomic_value (a_other: XM_XPATH_ATOMIC_VALUE): BOOLEAN
			-- Are `Current' and `a_other' the same value?
		require
			a_other_not_void: a_other /= Void
		do
			Result := same_expression (a_other)
		end

feature -- Status report

	is_convertible_to_item (a_context: XM_XPATH_CONTEXT): BOOLEAN
			-- Can `Current' be converted to an `XM_XPATH_ITEM'?
		do
			Result := True
		end

	is_comparable (a_other: XM_XPATH_ATOMIC_VALUE): BOOLEAN
			-- Is `a_other' comparable to `Current'?
		require
			a_other_not_void: a_other /= Void
		deferred
		end

	is_convertible (a_required_type: XM_XPATH_ITEM_TYPE): BOOLEAN
			-- Is `Current' convertible to `a_required_type'?
		require
			required_type_not_void: a_required_type /= Void
		deferred
		end

feature -- Evaluation

	calculate_effective_boolean_value (a_context: XM_XPATH_CONTEXT)
			-- Effective boolean value
		local
			a_message: STRING
			l_last_boolean_value: like last_boolean_value
		do
			create l_last_boolean_value.make (False)
			last_boolean_value := l_last_boolean_value
			a_message := STRING_.concat ("Effective boolean value is not defined for an atomic value of type ", item_type.conventional_name)
			l_last_boolean_value.set_last_error_from_string (a_message, "", "XPTY0004", Type_error)
		end

	evaluate_item (a_result: DS_CELL [detachable XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT)
			-- Evaluate as a single item to `a_result'.
		do
			a_result.put (Current)
		end

	evaluate_as_string (a_context: XM_XPATH_CONTEXT)
			-- Evaluate `Current' as a String
		do
			create last_evaluated_string.make (string_value)
		end

	create_iterator (a_context: XM_XPATH_CONTEXT)
			-- Iterator over the values of a sequence
		do
			create {XM_XPATH_SINGLETON_ITERATOR [XM_XPATH_ATOMIC_VALUE]} last_iterator.make (Current)
		end

	create_node_iterator (a_context: XM_XPATH_CONTEXT)
			-- Create an iterator over a node sequence
		do
			-- precondition is never met
		end

	generate_events (a_context: XM_XPATH_CONTEXT)
			-- Execute `Current' completely, writing results to the current `XM_XPATH_RECEIVER'.
		local
			l_result: DS_CELL [detachable XM_XPATH_ITEM]
		do
			create l_result.make (Void)
			evaluate_item (l_result, a_context)
			if attached l_result.item as l_result_item then
				check precondition_has_push_processing: attached a_context.current_receiver as l_current_receiver then
					l_current_receiver.append_item (l_result_item)
				end
			end
		end

feature -- Conversion

	converted_value: detachable XM_XPATH_ATOMIC_VALUE
		-- Result from `convert_to_type'

	convert_to_type (a_required_type: XM_XPATH_ITEM_TYPE)
			-- Convert `Current' to `required_type'
		require
			required_type_not_void: a_required_type /= Void
			convertible: is_convertible (a_required_type)
		deferred
		ensure
			conversion_available: attached converted_value as l_converted_value
			correct_type: is_sub_type (l_converted_value.item_type, a_required_type)
		end

	as_item (a_context: XM_XPATH_CONTEXT): XM_XPATH_ITEM
			-- `Current' seen as an item
		do
			Result := Current
		end

	as_item_value: XM_XPATH_VALUE
			-- `Current' seen as a value
		do
				Result := Current
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	native_implementations: INTEGER
			-- Natively-supported evaluation routines
		do
			Result := Supports_evaluate
		end

end
