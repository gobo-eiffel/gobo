indexing

	description:

		"Objects that implement the XPath trace() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_TRACE

inherit

	XM_XPATH_SYSTEM_FUNCTION
		redefine
			evaluate_item, create_iterator, pre_evaluate, compute_special_properties
		end

	XM_XPATH_TRACE_ROUTINES

create

	make

feature {NONE} -- Initialization

	make is
			-- Establish invariant
		do
			name := "trace"
			namespace_uri := Xpath_standard_functions_uri
			fingerprint := Trace_function_type_code
			minimum_argument_count := 2
			maximum_argument_count := 2
			create arguments.make (1)
			arguments.set_equality_tester (expression_tester)
			initialized := True
		end

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, where known
		do
			Result := arguments.item (1).item_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

feature -- Status report

	required_type (argument_number: INTEGER): XM_XPATH_SEQUENCE_TYPE is
			-- Type of argument number `argument_number'
		do
			if argument_number = 1 then
				create Result.make_any_sequence
			else
				create Result.make_single_string
			end
		end

feature -- Evaluation

	
	pre_evaluate (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Pre-evaluate `Current' at compile time.
		do
			-- Suppress compile-time evaluation
		end

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a single item
		local
			a_string_value: XM_XPATH_STRING_VALUE
			a_label: STRING
			is_suppressed: BOOLEAN
		do
			last_evaluated_item := Void
			is_suppressed :=  a_context.configuration.is_tracing_suppressed
			if not is_suppressed then
				arguments.item (2).evaluate_as_string (a_context)
				a_string_value := arguments.item (2).last_evaluated_string
				if a_string_value.is_error then
					last_evaluated_item := a_string_value
				else
					a_label := a_string_value.string_value
				end
			end
			if last_evaluated_item = Void then
				arguments.item (1).evaluate_item (a_context)
				last_evaluated_item := arguments.item (1).last_evaluated_item
				if not is_suppressed then
					trace_item (a_label, last_evaluated_item, a_context)
				end
			end
		end

	create_iterator (a_context: XM_XPATH_CONTEXT) is
			-- An iterator over the values of a sequence
		local
			a_string_value: XM_XPATH_STRING_VALUE
			an_item: XM_XPATH_ITEM
			a_label: STRING
		do
			arguments.item (1).create_iterator (a_context)
			last_iterator := arguments.item (1).last_iterator
			if not  a_context.configuration.is_tracing_suppressed then
				if not last_iterator.is_error then
					arguments.item (2).evaluate_as_string (a_context)
					a_string_value := arguments.item (2).last_evaluated_string
					if not a_string_value.is_error then
						a_label := a_string_value.string_value
					else
						a_label := ""
					end
					create {XM_XPATH_TRACING_ITERATOR} last_iterator.make (last_iterator, a_label, a_context)
				else
					arguments.item (2).evaluate_as_string (a_context)
					a_string_value := arguments.item (2).last_evaluated_string
					if not a_string_value.is_error then
						a_label := a_string_value.string_value
					else
						a_label := ""
					end
					create {XM_XPATH_INVALID_ITEM} an_item.make (last_iterator.error_value)
					trace_item (a_label, an_item, a_context)
				end
			end
		end

	create_node_iterator (a_context: XM_XPATH_CONTEXT) is
			-- Create an iterator over a node sequence
		do
			todo ("create_node_iterator", False)
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality is
			-- Compute cardinality.
		do
			if arguments.item (1).is_computed_expression then
				if not arguments.item (1).are_cardinalities_computed then
					arguments.item (1).as_computed_expression.compute_cardinality
				end
			end
			clone_cardinality (arguments.item (1))
		end

	compute_special_properties is
			-- Compute special properties.
		do
			if arguments.item (1).is_computed_expression then
				if not arguments.item (1).are_special_properties_computed then
					arguments.item (1).as_computed_expression.compute_special_properties
				end
			end
			clone_special_properties (arguments.item (1))
		end

end
	
