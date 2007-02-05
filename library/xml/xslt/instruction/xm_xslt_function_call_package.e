indexing
	description:

		"Objects that represent tail-recusive calls to xsl:functions"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_FUNCTION_CALL_PACKAGE

inherit

	XM_XPATH_OBJECT_VALUE
		rename
			make as make_object
		redefine
			item_type, primitive_value, is_function_package, reduce,
			same_expression, is_convertible_to_item, display, as_item,
			string_value, send, create_node_iterator
		end

create

	make

feature {NONE} -- Initialization

	make (a_function: XM_XSLT_COMPILED_USER_FUNCTION; some_actual_arguments: ARRAY [XM_XPATH_VALUE]; a_parameter_count: INTEGER; a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Establish invariant.
		require
			function_not_void: a_function /= Void
			arguments_not_void: some_actual_arguments /= Void
			positive_parameter_count: a_parameter_count >= 0
			context_not_void: a_context /= Void
		do
			function := a_function			
			actual_arguments := some_actual_arguments
			parameter_count := a_parameter_count
			context := a_context
			make_object (function)
			set_cardinality (function.result_type.cardinality)
		ensure
			function_set: function = a_function
			arguments_set: actual_arguments = some_actual_arguments
			parameter_count_set: parameter_count = a_parameter_count
			context_set: context = a_context
		end

feature -- Access

	parameter_count: INTEGER
			-- Number of parameters passed

	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, when known
		do
			Result := function.result_type.primary_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

	primitive_value: XM_XPATH_ATOMIC_VALUE is
			-- Primitive value;
			-- Not pure. TODO: ??
		do
			reduce
			Result := last_reduced_value.as_atomic_value
			if last_reduced_value.is_error then
				set_last_error (last_reduced_value.error_value)
			end
		end

	is_function_package: BOOLEAN is
			-- Is `Current' an XSLT function call package??
		do
			Result := True
		end
	
	string_value: STRING is
			-- Value of the item as a string
		do

			-- not sure about this (it violates CQS, but perhaps this doesn't matter) - just an experiment.
			-- probably, this whole class should be a sequence value instead.

			reduce
			if is_error then
				Result := ""
			elseif last_reduced_value.is_atomic_value then
				Result := last_reduced_value.as_atomic_value.string_value
			else
				last_reduced_value.evaluate_as_string (Void)
				Result := last_reduced_value.last_evaluated_string.string_value
			end
		end

feature -- Comparison

	same_expression (other: XM_XPATH_EXPRESSION): BOOLEAN is
			-- Are `Current' and `other' the same expression?
		do
			Result := other = Current
		end

feature -- Status report

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

feature -- Optimization

	reduce is
			-- Reduce a value to its simplest form.
		local
			a_sequence_extent: XM_XPATH_SEQUENCE_EXTENT
		do
			create_results_iterator (Void)
			if last_iterator.is_error then
				create {XM_XPATH_INVALID_VALUE} last_reduced_value.make (last_iterator.error_value)
				set_last_error (last_reduced_value.error_value)
			else
				create a_sequence_extent.make (last_iterator)
				a_sequence_extent.reduce
				last_reduced_value := a_sequence_extent.last_reduced_value
				if last_reduced_value.is_error then
					set_last_error (last_reduced_value.error_value)
				end
			end
		end

feature -- Evaluation

	create_results_iterator (a_context: XM_XPATH_CONTEXT) is
			-- Create an iterator over the values of a sequence
		local
			l_flattener: XM_XSLT_FUNCTION_CALL_FLATTENER
			l_value: DS_CELL [XM_XPATH_VALUE]
		do
			create l_value.make (Void)
			call (l_value)
			l_value.item.create_iterator (a_context)
			if l_value.item.last_iterator.is_error then
				last_iterator := l_value.item.last_iterator
			else
				create l_flattener.make
				-- TODO: need a node_iterator version
				create {XM_XPATH_MAPPING_ITERATOR} last_iterator.make (l_value.item.last_iterator, l_flattener, a_context)
			end
		ensure
			last_iterator_not_void: last_iterator /= Void
		end

	create_node_results_iterator (a_context: XM_XPATH_CONTEXT) is
			-- Create an iterator over the nodes of a sequence
		local
			l_flattener: XM_XSLT_NODE_FUNCTION_CALL_FLATTENER
			l_value: DS_CELL [XM_XPATH_VALUE]
		do
			create l_value.make (Void)
			call (l_value)
			l_value.item.create_node_iterator (a_context)
			if l_value.item.last_node_iterator.is_error then
				last_node_iterator := l_value.item.last_node_iterator
			else
				create l_flattener.make
				create {XM_XPATH_NODE_MAPPING_ITERATOR} last_node_iterator.make (l_value.item.last_node_iterator, l_flattener, a_context)
			end
		ensure
			last_node_iterator_not_void: last_node_iterator /= Void
		end

	create_node_iterator (a_context: XM_XPATH_CONTEXT) is
			-- Create an iterator over the nodes of a sequence.
		do
			create_node_results_iterator (a_context)
		end

	call (a_return_value: DS_CELL [XM_XPATH_VALUE]) is
			-- Call `Current'.
			-- Result returned as `a_return_value.item'.
		require
			a_return_value_not_void: a_return_value /= Void
			return_value_is_void: a_return_value.item = Void
		local
			l_context: XM_XSLT_EVALUATION_CONTEXT
		do
			l_context := context.new_clean_context
			function.call (a_return_value, actual_arguments, parameter_count, l_context, False)
		ensure
			called_value_not_void: a_return_value.item /= Void -- but may be an error value
		end

feature -- Conversion

	as_item (a_context: XM_XPATH_CONTEXT): XM_XPATH_ITEM is
			-- Convert to an item
		do
			-- pre-condition is not met
		end

feature -- Output

	send (a_receiver: XM_XPATH_SEQUENCE_RECEIVER) is
			-- Send `Current' to `a_receiver'.
		local
			l_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			l_invalid_item: XM_XPATH_INVALID_ITEM
			l_function_package: like Current
			l_finished: BOOLEAN
			l_value: DS_CELL [XM_XPATH_VALUE]
		do

			-- We want to avoid recursion, to operate in constant space,

			from l_function_package := Current until l_finished loop
				create l_value.make (Void)
				l_function_package.call (l_value)
				if l_value.item.is_error then
					l_finished := True
					a_receiver.on_error (l_value.item.error_value.error_message)
				else
					l_value.item.create_iterator (Void)
					l_iterator := l_value.item.last_iterator
					from l_iterator.start until l_finished or else l_iterator.after loop
						if l_iterator.is_error then
							create l_invalid_item.make (l_iterator.error_value); l_finished := True
							a_receiver.append_item (l_invalid_item)
						else
							if l_iterator.item.is_function_package then
								l_function_package ?= l_iterator.item
							else
								l_function_package := Void
								a_receiver.append_item (l_iterator.item)
							end
						end
						l_iterator.forth
						check
							nothing_after_function_package: l_function_package /= Void implies l_iterator.after
						end
					end
					if l_function_package = Void then l_finished := True end
				end
			end
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
	positive_parameter_count: parameter_count >= 0
	context_not_void: context /= Void

end
	
