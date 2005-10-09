indexing

	description:

		"XPath Venn expressions"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_VENN_EXPRESSION

inherit

	XM_XPATH_BINARY_EXPRESSION
		rename
			make as make_binary
		redefine
			compute_cardinality, compute_special_properties, simplify, check_static_type, create_iterator, calculate_effective_boolean_value
		end

	XM_XPATH_SHARED_GLOBAL_ORDER_COMPARER
		export {NONE} all end

	XM_XPATH_ROLE
		export {NONE} all end

	XM_XPATH_NAME_UTILITIES
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (an_operand_one: XM_XPATH_EXPRESSION; a_token: INTEGER; an_operand_two: XM_XPATH_EXPRESSION; a_function_library: XM_XPATH_FUNCTION_LIBRARY) is
			-- Establish invariant
		require
			operand_1_not_void: an_operand_one /= Void
			operand_2_not_void: an_operand_two /= Void
			-- TODO: is_binary_op?
			function_library_not_void: a_function_library /= Void
		do
			make_binary (an_operand_one, a_token, an_operand_two)
			if shared_name_pool.is_name_code_allocated ("", Xpath_standard_functions_uri, "not") then
				not_function_fingerprint := shared_name_pool.fingerprint (Xpath_standard_functions_uri, "not")
			else
				shared_name_pool.allocate_name ("", Xpath_standard_functions_uri, "not")
				not_function_fingerprint := fingerprint_from_name_code (shared_name_pool.last_name_code)
			end
			function_library := a_function_library
			initialized := True
		ensure
			operator_set: operator = a_token
			operand_1_set: first_operand /= Void and then first_operand.same_expression (an_operand_one)
			operand_2_set: second_operand /= Void and then second_operand.same_expression (an_operand_two)
			static_properties_computed: are_static_properties_computed
			function_library_set: function_library = a_function_library
		end

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, when known
		do
			Result := common_super_type (first_operand.item_type, second_operand.item_type)
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

feature -- Optimization

	simplify is
			-- Perform context-independent static optimizations.
		do
			first_operand.simplify
			if first_operand.is_error then
				set_last_error (first_operand.error_value)
			elseif first_operand.was_expression_replaced then
				set_first_operand (first_operand.replacement_expression)
			end

			if not is_error then
				second_operand.simplify
				if second_operand.is_error then
					set_last_error (second_operand.error_value)
				elseif second_operand.was_expression_replaced then
					set_second_operand (second_operand.replacement_expression)
				end
			end
			if not is_error then
				simplify_empty_expression
			end
		end


	check_static_type (a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform static type-checking of `Current' and its subexpressions.
		local
			a_role, another_role: XM_XPATH_ROLE_LOCATOR
			a_type_checker: XM_XPATH_TYPE_CHECKER
			a_node_sequence: XM_XPATH_SEQUENCE_TYPE
		do
			mark_unreplaced
			first_operand.check_static_type (a_context, a_context_item_type)
			if first_operand.was_expression_replaced then
				set_first_operand (first_operand.replacement_expression)
			end
			if first_operand.is_error then
				set_last_error (first_operand.error_value)
			else
				second_operand.check_static_type (a_context, a_context_item_type)
				if second_operand.was_expression_replaced then
					set_second_operand (second_operand.replacement_expression)
				end
				if second_operand.is_error then
					set_last_error (second_operand.error_value)
				else
					create a_role.make (Binary_expression_role, token_name (operator), 1, Xpath_errors_uri, "XPTY0004")
					create a_type_checker
					create a_node_sequence.make_node_sequence
					a_type_checker.static_type_check (a_context, first_operand, a_node_sequence, False, a_role)
					if a_type_checker.is_static_type_check_error then
						set_last_error (a_type_checker.static_type_check_error)
					else
						set_first_operand (a_type_checker.checked_expression)
						create another_role.make (Binary_expression_role, token_name (operator), 2, Xpath_errors_uri, "XPTY0004")
						a_type_checker.static_type_check (a_context, second_operand, a_node_sequence, False, another_role)
						if a_type_checker.is_static_type_check_error then
							set_last_error (a_type_checker.static_type_check_error)
						else
							set_second_operand (a_type_checker.checked_expression)
						end
					end
				end
			end
		end

feature -- Evaluation

	calculate_effective_boolean_value (a_context: XM_XPATH_CONTEXT) is
			-- Effective boolean value
		local
			a_boolean_value: XM_XPATH_BOOLEAN_VALUE
		do
			if operator = Union_token then
				first_operand.calculate_effective_boolean_value (a_context)
				a_boolean_value := first_operand.last_boolean_value
				if a_boolean_value.value then
					last_boolean_value := a_boolean_value
				else
					second_operand.calculate_effective_boolean_value (a_context)
					last_boolean_value := second_operand.last_boolean_value
				end
			else
				Precursor (a_context)
			end
		end

	create_iterator (a_context: XM_XPATH_CONTEXT) is
			-- Iterate over the values of a sequence
		local
			an_iterator, another_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			a_node_iterator, another_node_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
		do
			first_operand.create_iterator (a_context)
			an_iterator := first_operand.last_iterator
			if an_iterator.is_error then
				last_iterator := an_iterator
			else
				if an_iterator.is_node_iterator then a_node_iterator := an_iterator.as_node_iterator end
				if not first_operand.ordered_nodeset and then an_iterator.is_node_iterator then
					create {XM_XPATH_DOCUMENT_ORDER_ITERATOR} a_node_iterator.make (an_iterator.as_node_iterator, global_order_comparer)
				end
				if a_node_iterator = Void then create {XM_XPATH_EMPTY_ITERATOR} a_node_iterator.make end
				second_operand.create_iterator (a_context)
				another_iterator := second_operand.last_iterator
				if another_iterator.is_error then
					last_iterator := another_iterator
				else
					if another_iterator.is_node_iterator then another_node_iterator := another_iterator.as_node_iterator end
					if not second_operand.ordered_nodeset and then another_iterator.is_node_iterator then
						create {XM_XPATH_DOCUMENT_ORDER_ITERATOR} another_node_iterator.make (another_iterator.as_node_iterator, global_order_comparer)
					end
					if another_node_iterator = Void then create {XM_XPATH_EMPTY_ITERATOR} another_node_iterator.make end
					inspect
						operator
					when Union_token then
						create {XM_XPATH_UNION_ENUMERATION} last_iterator.make (a_node_iterator, another_node_iterator, global_order_comparer)
					when Intersect_token then
						create {XM_XPATH_INTERSECTION_ENUMERATION} last_iterator.make (a_node_iterator, another_node_iterator, global_order_comparer)
					when Except_token then
						create {XM_XPATH_DIFFERENCE_ENUMERATION} last_iterator.make (a_node_iterator, another_node_iterator, global_order_comparer)
					end
				end
			end
		ensure then
			unique_document_order: True -- The result will always be sorted in document order, with duplicates eliminated
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality is
			-- Compute cardinality.
		do
			inspect
				operator
			when Union_token then
				set_cardinality_for_union_expression
			when Intersect_token then
				set_cardinality_for_intersect_expression
			when Except_token then
				set_cardinality_for_difference_expression
			end
		end

	compute_special_properties is
			-- Compute special properties.
		do
			initialize_special_properties
			set_ordered_nodeset
			if test_context_document_nodeset then
				set_context_document_nodeset
			end
			if test_subtree_nodeset then
				set_subtree_nodeset
			end
			if first_operand.non_creating and then second_operand.non_creating then
				set_non_creating
			end
		end

feature {XM_XPATH_VENN_EXPRESSION} -- Local

	simplify_empty_expression is
			-- Further simplification when either operand is an empty sequence;
			-- This can happen after reduction with constructs of the form //a[condition] | //b[not(condition)]
			-- (common in XPath 1.0 because there were no conditional expressions)
		local
			finished: BOOLEAN
		do
			inspect
				operator
			when Union_token then
				if first_operand.is_empty_sequence and then second_operand.ordered_nodeset then
					set_replacement (second_operand)
					finished := True
				else
					if second_operand.is_empty_sequence and then first_operand.ordered_nodeset then
						set_replacement (first_operand)
						finished := True
					end
				end
			when Intersect_token then
				if first_operand.is_empty_sequence then
					set_replacement (first_operand)
					finished := True
				else
					if second_operand.is_empty_sequence then
						set_replacement (second_operand)
						finished := True
					end
				end
			when Except_token then
				if first_operand.is_empty_sequence then
					set_replacement (first_operand)
					finished := True
				else
					if second_operand.is_empty_sequence and then first_operand.ordered_nodeset then
						set_replacement (first_operand)
						finished := True
					end
				end				
			end			
			if not finished then	merge_axis_expression end
		end
		
feature {NONE} -- Implementation

	set_cardinality_for_union_expression is
			-- Set cardinality for union expression.
		do
			if first_operand.is_empty_sequence then
				clone_cardinality (second_operand)
			elseif second_operand.is_empty_sequence then
				clone_cardinality (first_operand)
			elseif first_operand.cardinality_allows_zero or else second_operand.cardinality_allows_zero then
				set_cardinality_zero_or_more
			else
				set_cardinality_one_or_more
			end
		end

	set_cardinality_for_intersect_expression is
			-- Set cardinality for intersect expression.
		do
			if first_operand.is_empty_sequence then
				set_cardinality_empty
			elseif second_operand.is_empty_sequence then
				set_cardinality_empty
			elseif first_operand.cardinality_allows_many or else second_operand.cardinality_allows_many then
				set_cardinality_zero_or_more
			else
				set_cardinality_optional
			end
		end

	set_cardinality_for_difference_expression is
			-- Set cardinality for difference expression.
		do
			if first_operand.is_empty_sequence then
				set_cardinality_empty
			elseif second_operand.is_empty_sequence then
					clone_cardinality (first_operand)
			elseif first_operand.cardinality_allows_many then
				set_cardinality_zero_or_more
			else
				set_cardinality_optional
			end
		end

	test_context_document_nodeset: BOOLEAN is
			-- Are all nodes in the same document as the context node?
		do
			inspect
				operator
			when Union_token then
				Result := first_operand.context_document_nodeset and then second_operand.context_document_nodeset
			when Intersect_token then
				Result := first_operand.context_document_nodeset or else second_operand.context_document_nodeset
			when Except_token then
				Result := first_operand.context_document_nodeset
			end				
		end

	test_subtree_nodeset: BOOLEAN is
			-- Are all nodes a subtree of the context node?
		do
			inspect
				operator
			when Union_token then
				Result := first_operand.subtree_nodeset and then second_operand.subtree_nodeset
			when Intersect_token then
				Result := first_operand.subtree_nodeset or else second_operand.subtree_nodeset
			when Except_token then
				Result := first_operand.subtree_nodeset
			end				
		end

	merge_axis_expression is
			-- Merge expressions when both operands are axis expressions on the same axis;
			--  ie. rewrite (axis::test1 | axis::test2) as axis::(test1 | test2)
		local
			an_axis_expression, another_axis_expression: XM_XPATH_AXIS_EXPRESSION
			a_combined_node_test: XM_XPATH_COMBINED_NODE_TEST
		do
			if first_operand.is_axis_expression and then second_operand.is_axis_expression then
				an_axis_expression := first_operand.as_axis_expression;
				another_axis_expression := second_operand.as_axis_expression;
				if an_axis_expression.axis = another_axis_expression.axis then
					create a_combined_node_test.make (an_axis_expression.node_test, operator, another_axis_expression.node_test)
					create another_axis_expression.make (an_axis_expression.axis, a_combined_node_test)
					set_replacement (another_axis_expression)
				else
					merge_common_start_expression
				end
			else
				merge_common_start_expression
			end
		end

	merge_common_start_expression is
			-- Merge common start path expressions;
			--  i.e. rewrite (/X | /Y) as /(X|Y).
			--  This applies recursively, so that /A/B/C | /A/B/D becomes /A/B/child::(C|D)
		local
			a_path_expression, another_path_expression: XM_XPATH_PATH_EXPRESSION
			a_venn_expression: XM_XPATH_VENN_EXPRESSION
		do
			if first_operand.is_path_expression and then second_operand.is_path_expression then
				a_path_expression := first_operand.as_path_expression
				another_path_expression := second_operand.as_path_expression
				if a_path_expression.first_step.same_expression (another_path_expression.first_step) then
					create a_venn_expression.make (a_path_expression.remaining_steps, operator, another_path_expression.remaining_steps, function_library)
					create another_path_expression.make (a_path_expression.first_step, a_venn_expression)
					another_path_expression.simplify
					if another_path_expression.was_expression_replaced then
						set_replacement (another_path_expression.replacement_expression)
					else
						set_replacement (another_path_expression)
					end
				else
					merge_non_positional_filter_expression
				end
			else
				merge_non_positional_filter_expression
			end
		end

	merge_non_positional_filter_expression is
			-- Merge non-positional filter expressions;
			-- A[exp0] | A[exp1] becomes A[exp0 | exp1]
		local
			an_expression: XM_XPATH_EXPRESSION
			a_filter_expression, another_filter_expression: XM_XPATH_FILTER_EXPRESSION
			arguments: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]
		do
			if first_operand.is_filter_expression and then second_operand.is_filter_expression then
				a_filter_expression := first_operand.as_filter_expression
				another_filter_expression := second_operand.as_filter_expression
				if not a_filter_expression.is_positional and then not another_filter_expression.is_positional then
					inspect
						operator
					when Union_token then
						create {XM_XPATH_BOOLEAN_EXPRESSION} an_expression.make (a_filter_expression.filter, Or_token, another_filter_expression.filter)
					when Intersect_token then
						create {XM_XPATH_BOOLEAN_EXPRESSION} an_expression.make (a_filter_expression.filter, And_token, another_filter_expression.filter)
					when Except_token then
						create arguments.make (1)
						arguments.put (another_filter_expression.filter, 1)
						function_library.bind_function (not_function_fingerprint, arguments, False)
						create {XM_XPATH_BOOLEAN_EXPRESSION} an_expression.make (a_filter_expression.filter, And_token, function_library.last_bound_function.as_not_function)
					end
					copy_location_identifier (an_expression)
					create another_filter_expression.make (a_filter_expression.base_expression, an_expression)
					set_replacement (another_filter_expression)
				end
			end
		end

	function_library: XM_XPATH_FUNCTION_LIBRARY
			-- Function library

	not_function_fingerprint: INTEGER
			-- Fingerprint of "not" function

invariant

	venn_operator: operator = Union_token or else operator = Intersect_token or else operator = Except_token
	strictly_positive_not_function_fingerprint: initialized implies not_function_fingerprint > 0
	function_library_not_void: initialized implies function_library /= Void

end
	
