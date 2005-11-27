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

	XM_XPATH_OBJECT_VALUE
		rename
			make as make_object
		redefine
			item_type, primitive_value, is_function_package, reduce,
			same_expression, is_convertible_to_item, display, as_item,
			string_value, send
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
			-- Iterator over the values of a sequence
		local
			a_flattener: XM_XSLT_FUNCTION_CALL_FLATTENER
			a_value: XM_XPATH_VALUE
		do
			call
			a_value := last_called_value
			a_value.create_iterator (a_context)
			if a_value.last_iterator.is_error then
				last_iterator := a_value.last_iterator
			else
				create a_flattener.make
				create {XM_XPATH_MAPPING_ITERATOR} last_iterator.make (a_value.last_iterator, a_flattener, a_context)
			end
		ensure
			last_iterator_not_void: last_iterator /= Void
		end

	call is
			-- Call `Current'.
		local
			a_context: XM_XSLT_EVALUATION_CONTEXT
		do
			a_context := context.new_clean_context
			function.call (actual_arguments, parameter_count, a_context, False)
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

feature -- Output

	send (a_receiver: XM_XPATH_SEQUENCE_RECEIVER) is
			-- Send `Current' to `a_receiver'.
		local
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			an_invalid_item: XM_XPATH_INVALID_ITEM
			a_function_package: like Current
			finished: BOOLEAN
		do

			-- We want to avoid recursion, to operate in constant space,

			from a_function_package := Current until finished loop
				a_function_package.call
				a_function_package.last_called_value.create_iterator (Void)
				an_iterator := a_function_package.last_called_value.last_iterator
				from an_iterator.start until finished or else an_iterator.after loop
					if an_iterator.is_error then
						create an_invalid_item.make (an_iterator.error_value); finished := True
						a_receiver.append_item (an_invalid_item)
					else
						if an_iterator.item.is_function_package then
							a_function_package ?= an_iterator.item
						else
							a_function_package := Void
							a_receiver.append_item (an_iterator.item)
						end
					end
					an_iterator.forth
					check
						nothing_after_function_package: a_function_package /= Void implies an_iterator.after
					end
				end
				if a_function_package = Void then finished := True end
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
	
