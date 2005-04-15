indexing
	description:

		"Objects that represent tail-recusive calls to xsl:functions"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_FUNCTION_CALL_PACKAGE

inherit

	XM_XPATH_VALUE

creation

	make

feature {NONE} -- Initialization

	make (a_function: XM_XSLT_COMPILED_USER_FUNCTION; some_actual_arguments: ARRAY [XM_XPATH_VALUE]; a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Establish invariant.
		require
			function_not_void: a_function /= Void
			arguments_not_void: some_actual_arguments /= Void
			context_not_void: a_context /= Void
		do
			function := a_function
			actual_arguments := some_actual_arguments
			context := a_context
			make_value
			set_cardinality (function.result_type.cardinality)
		ensure
			function_set: function = a_function
			arguments_set: actual_arguments = some_actual_arguments
			context_set: context = a_context
		end

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, when known
		do
			Result := function.result_type.primary_type
		end

feature -- Comparison

	same_expression (other: XM_XPATH_EXPRESSION): BOOLEAN is
			-- Are `Current' and `other' the same expression?
		do
			Result := other = Current
		end

feature -- Status report

	last_called_value: XM_XPATH_VALUE
			-- Result of last non-tail call

	is_convertible_to_item (a_context: XM_XPATH_CONTEXT): BOOLEAN is
			-- Can `Current' be converted to an `XM_XPATH_ITEM'?
		do
			Result := False -- in general, this is so
		end

	display (a_level: INTEGER) is
			-- Diagnostic print of expression structure to `std.error'
		do
			todo ("display", False)
		end

feature -- Evaluation

	evaluate_as_string (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a String.
		do
			evaluate_item (a_context)
			create last_evaluated_string.make (last_evaluated_item.string_value)
		end
	
	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a single item.
		do
			create_iterator (a_context); last_iterator.start
			if last_iterator.is_error then
				create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make (last_iterator.error_value)
			elseif not last_iterator.after then
				last_evaluated_item := last_iterator.item
			end
		end

	calculate_effective_boolean_value (a_context: XM_XPATH_CONTEXT) is
			-- Effective boolean value of the expression
		do
			evaluate_item (a_context)
			create last_boolean_value.make (last_evaluated_item /= Void)
			-- Refine this, but it's not really important, as it won't ever be called
		end

	create_iterator (a_context: XM_XPATH_CONTEXT) is
			-- Iterator over the values of a sequence
		do
			call
			last_called_value.create_iterator (a_context)
			last_iterator := last_called_value.last_iterator
		end

	call is
			-- Call `Current'.
		local
			a_context: XM_XSLT_EVALUATION_CONTEXT
		do
			a_context := context.new_clean_context
			function.call (actual_arguments, a_context, False)
			last_called_value := function.last_called_value
		ensure
			called_value_not_void: last_called_value /= Void -- but may be an error value
		end

feature -- Conversion

	as_item (a_context: XM_XPATH_CONTEXT): XM_XPATH_ITEM is
			-- Convert to an item
		do
			-- pre-condition is not met
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	native_implementations: INTEGER is
			-- Natively-supported evaluation routines
		do
			Result := Supports_iterator
		end


feature {NONE} -- Implementation

	function: XM_XSLT_COMPILED_USER_FUNCTION
			-- Function to call

	actual_arguments: ARRAY [XM_XPATH_VALUE]
			-- Arguments to function call

	context: XM_XSLT_EVALUATION_CONTEXT
			-- Evaluation context

invariant

	function_not_void: function /= Void
	arguments_not_void: actual_arguments /= Void
	context_not_void: context /= Void

end
	
