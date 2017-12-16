note

	description:

		"XPath Venn expressions"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004-2015, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_VENN_EXPRESSION

inherit

	XM_XPATH_BINARY_EXPRESSION
		rename
			make as make_binary
		redefine
			compute_cardinality, compute_special_properties, simplify, check_static_type, create_iterator,
			calculate_effective_boolean_value, create_node_iterator
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

	make (an_operand_one: XM_XPATH_EXPRESSION; a_token: INTEGER; an_operand_two: XM_XPATH_EXPRESSION; a_function_library: XM_XPATH_FUNCTION_LIBRARY)
			-- Establish invariant
		require
			operand_1_not_void: an_operand_one /= Void
			operand_2_not_void: an_operand_two /= Void
			-- TODO: is_binary_op?
			function_library_not_void: a_function_library /= Void
		do
			function_library := a_function_library
			make_binary (an_operand_one, a_token, an_operand_two)
			if shared_name_pool.is_name_code_allocated ("", Xpath_standard_functions_uri, "not") then
				not_function_fingerprint := shared_name_pool.fingerprint (Xpath_standard_functions_uri, "not")
			else
				shared_name_pool.allocate_name ("", Xpath_standard_functions_uri, "not")
				not_function_fingerprint := fingerprint_from_name_code (shared_name_pool.last_name_code)
			end
			initialized := True
		ensure
			operator_set: operator = a_token
			operand_1_set: first_operand /= Void and then first_operand.same_expression (an_operand_one)
			operand_2_set: second_operand /= Void and then second_operand.same_expression (an_operand_two)
			static_properties_computed: are_static_properties_computed
			function_library_set: function_library = a_function_library
		end

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE
			-- Data type of the expression, when known
		do
			Result := common_super_type (first_operand.item_type, second_operand.item_type)
		end

feature -- Optimization

	simplify (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION])
			-- Perform context-independent static optimizations.
		local
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			create l_replacement.make (Void)
			first_operand.simplify (l_replacement)
			check postcondition_of_simplify: attached l_replacement.item as l_replacement_item then
				set_first_operand (l_replacement_item)
				if first_operand.is_error then
					set_replacement (a_replacement, first_operand)
				else
					l_replacement.put (Void)
					second_operand.simplify (l_replacement)
					check postcondition_of_simplify: attached l_replacement.item as l_replacement_item_2 then
						set_second_operand (l_replacement_item_2)
						if second_operand.is_error then
							set_replacement (a_replacement, second_operand)
						else
							simplify_empty_expression (a_replacement)
						end
					end
				end
			end
		end


	check_static_type (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: detachable XM_XPATH_ITEM_TYPE)
			-- Perform static type-checking of `Current' and its subexpressions.
		local
			l_role, l_other_role: XM_XPATH_ROLE_LOCATOR
			l_type_checker: XM_XPATH_TYPE_CHECKER
			l_node_sequence: XM_XPATH_SEQUENCE_TYPE
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			create l_replacement.make (Void)
			first_operand.check_static_type (l_replacement, a_context, a_context_item_type)
			check postcondition_of_check_static_type: attached l_replacement.item as l_replacement_item then
				set_first_operand (l_replacement_item)
				if first_operand.is_error then
					set_replacement (a_replacement, first_operand)
				else
					l_replacement.put (Void)
					second_operand.check_static_type (l_replacement, a_context, a_context_item_type)
					check postcondition_of_check_static_type: attached l_replacement.item as l_replacement_item_2 then
						set_second_operand (l_replacement_item_2)
						if second_operand.is_error then
							set_replacement (a_replacement, second_operand)
						else
							check attached token_name (operator) as l_token_name then
								create l_role.make (Binary_expression_role, l_token_name, 1, Xpath_errors_uri, "XPTY0004")
								create l_type_checker
								create l_node_sequence.make_node_sequence
								l_type_checker.static_type_check (a_context, first_operand, l_node_sequence, False, l_role)
								if l_type_checker.is_static_type_check_error then
									check invariant_of_XM_XPATH_TYPE_CHECKER: attached l_type_checker.static_type_check_error as l_static_type_check_error then
										set_replacement (a_replacement, create {XM_XPATH_INVALID_VALUE}.make (l_static_type_check_error))
									end
								else
									check postcondition_of_static_type_check: attached l_type_checker.checked_expression as l_checked_expression then
										set_first_operand (l_checked_expression)
										create l_other_role.make (Binary_expression_role, l_token_name, 2, Xpath_errors_uri, "XPTY0004")
										l_type_checker.static_type_check (a_context, second_operand, l_node_sequence, False, l_other_role)
										if l_type_checker.is_static_type_check_error then
											check invariant_of_XM_XPATH_TYPE_CHECKER: attached l_type_checker.static_type_check_error as l_static_type_check_error_2 then
												set_replacement (a_replacement, create {XM_XPATH_INVALID_VALUE}.make (l_static_type_check_error_2))
											end
										else
											check postcondition_of_static_type_check: attached l_type_checker.checked_expression as l_checked_expression_2 then
												set_second_operand (l_checked_expression_2)
												a_replacement.put (Current)
											end
										end
									end
								end
							end
						end
					end
				end
			end
		end

feature -- Evaluation

	calculate_effective_boolean_value (a_context: XM_XPATH_CONTEXT)
			-- Effective boolean value
		local
			a_boolean_value: XM_XPATH_BOOLEAN_VALUE
		do
			if operator = Union_token then
				first_operand.calculate_effective_boolean_value (a_context)
				check postcondition_of_calculate_effective_boolean_value: attached first_operand.last_boolean_value as l_last_boolean_value then
					a_boolean_value := l_last_boolean_value
					if a_boolean_value.value then
						last_boolean_value := a_boolean_value
					else
						second_operand.calculate_effective_boolean_value (a_context)
						last_boolean_value := second_operand.last_boolean_value
					end
				end
			else
				Precursor (a_context)
			end
		end

	create_iterator (a_context: XM_XPATH_CONTEXT)
			-- Create an iterator over the values of a sequence
		local
			l_iterator, l_other_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
		do
			first_operand.create_node_iterator (a_context)
			check postcondition_of_create_node_iterator: attached first_operand.last_node_iterator as l_last_node_iterator then
				l_iterator := l_last_node_iterator
				if l_iterator.is_error then
					last_iterator := l_iterator
				else
					if not first_operand.ordered_nodeset then
						create {XM_XPATH_DOCUMENT_ORDER_ITERATOR} l_iterator.make (l_iterator, global_order_comparer)
					end
					second_operand.create_node_iterator (a_context)
					check postcondition_of_create_node_iterator: attached second_operand.last_node_iterator as l_last_node_iterator_2 then
						l_other_iterator := l_last_node_iterator_2
						if l_other_iterator.is_error then
							last_iterator := l_other_iterator
						else
							if not second_operand.ordered_nodeset then
								create {XM_XPATH_DOCUMENT_ORDER_ITERATOR} l_other_iterator.make (l_other_iterator, global_order_comparer)
							end
							inspect
								operator
							when Union_token then
								create {XM_XPATH_UNION_ENUMERATION} last_iterator.make (l_iterator, l_other_iterator, global_order_comparer)
							when Intersect_token then
								create {XM_XPATH_INTERSECTION_ENUMERATION} last_iterator.make (l_iterator, l_other_iterator, global_order_comparer)
							when Except_token then
								create {XM_XPATH_DIFFERENCE_ENUMERATION} last_iterator.make (l_iterator, l_other_iterator, global_order_comparer)
							end
						end
					end
				end
			end
		ensure then
			unique_document_order: True -- The result will always be sorted in document order, with duplicates eliminated
			node_iterator: attached last_iterator as l_last_iterator and then l_last_iterator.is_node_iterator
		end

	create_node_iterator (a_context: XM_XPATH_CONTEXT)
			-- Create an iterator over a node sequence
		do
			create_iterator (a_context)
			check postcondition_of_create_iterator: attached last_iterator as l_last_iterator then
				last_node_iterator := l_last_iterator.as_node_iterator
			end
		ensure then
			unique_document_order: True -- The result will always be sorted in document order, with duplicates eliminated
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality
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

	compute_special_properties
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
			if first_operand.non_creating and second_operand.non_creating then
				set_non_creating
			end
		end

feature {XM_XPATH_VENN_EXPRESSION} -- Local

	simplify_empty_expression (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION])
			-- Further simplification when either operand is an empty sequence;
			-- This can happen after reduction with constructs of the form //a[condition] | //b[not(condition)]
			-- (common in XPath 1.0 because there were no conditional expressions)
		require
			a_replacement_not_void: a_replacement /= Void
			not_replaced: a_replacement.item = Void
		local
			l_finished: BOOLEAN
		do
			inspect
				operator
			when Union_token then
				if first_operand.is_empty_sequence and second_operand.ordered_nodeset then
					set_replacement (a_replacement, second_operand)
					l_finished := True
				elseif second_operand.is_empty_sequence and first_operand.ordered_nodeset then
						set_replacement (a_replacement, first_operand)
						l_finished := True
				end
			when Intersect_token then
				if first_operand.is_empty_sequence then
					set_replacement (a_replacement, first_operand)
					l_finished := True
				else
					if second_operand.is_empty_sequence then
						set_replacement (a_replacement, second_operand)
						l_finished := True
					end
				end
			when Except_token then
				if first_operand.is_empty_sequence then
					set_replacement (a_replacement, first_operand)
					l_finished := True
				else
					if second_operand.is_empty_sequence and first_operand.ordered_nodeset then
						set_replacement (a_replacement, first_operand)
						l_finished := True
					end
				end
			end
			if not l_finished then
				merge_axis_expression (a_replacement)
			end
		ensure
			replaced: a_replacement.item /= Void
		end

feature {NONE} -- Implementation

	set_cardinality_for_union_expression
			-- Set cardinality for union expression.
		do
			if first_operand.is_empty_sequence then
				set_cardinalities (second_operand)
			elseif second_operand.is_empty_sequence then
				set_cardinalities (first_operand)
			elseif first_operand.cardinality_allows_zero or second_operand.cardinality_allows_zero then
				set_cardinality_zero_or_more
			else
				set_cardinality_one_or_more
			end
		end

	set_cardinality_for_intersect_expression
			-- Set cardinality for intersect expression.
		do
			if first_operand.is_empty_sequence then
				set_cardinality_empty
			elseif second_operand.is_empty_sequence then
				set_cardinality_empty
			elseif first_operand.cardinality_allows_many or second_operand.cardinality_allows_many then
				set_cardinality_zero_or_more
			else
				set_cardinality_optional
			end
		end

	set_cardinality_for_difference_expression
			-- Set cardinality for difference expression.
		do
			if first_operand.is_empty_sequence then
				set_cardinality_empty
			elseif second_operand.is_empty_sequence then
					set_cardinalities (first_operand)
			elseif first_operand.cardinality_allows_many then
				set_cardinality_zero_or_more
			else
				set_cardinality_optional
			end
		end

	test_context_document_nodeset: BOOLEAN
			-- Are all nodes in the same document as the context node?
		do
			inspect
				operator
			when Union_token then
				Result := first_operand.context_document_nodeset and second_operand.context_document_nodeset
			when Intersect_token then
				Result := first_operand.context_document_nodeset or second_operand.context_document_nodeset
			when Except_token then
				Result := first_operand.context_document_nodeset
			end
		end

	test_subtree_nodeset: BOOLEAN
			-- Are all nodes a subtree of the context node?
		do
			inspect
				operator
			when Union_token then
				Result := first_operand.subtree_nodeset and second_operand.subtree_nodeset
			when Intersect_token then
				Result := first_operand.subtree_nodeset or second_operand.subtree_nodeset
			when Except_token then
				Result := first_operand.subtree_nodeset
			end
		end

	merge_axis_expression (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION])
			-- Merge expressions when both operands are axis expressions on the same axis;
			--  ie. rewrite (axis::test1 | axis::test2) as axis::(test1 | test2)
		require
			a_replacement_not_void: a_replacement /= Void
			not_replaced: a_replacement.item = Void
		local
			l_axis_expression, l_other_axis_expression: XM_XPATH_AXIS_EXPRESSION
			l_combined_node_test: XM_XPATH_COMBINED_NODE_TEST
		do
			if first_operand.is_axis_expression and second_operand.is_axis_expression then
				l_axis_expression := first_operand.as_axis_expression;
				l_other_axis_expression := second_operand.as_axis_expression;
				if l_axis_expression.axis = l_other_axis_expression.axis and then attached l_axis_expression.node_test as l_node_test and then attached l_other_axis_expression.node_test as l_other_node_test then
					create l_combined_node_test.make (l_node_test, operator, l_other_node_test)
					create l_other_axis_expression.make (l_axis_expression.axis, l_combined_node_test)
					set_replacement (a_replacement, l_other_axis_expression)
				else
					merge_common_start_expression (a_replacement)
				end
			else
				merge_common_start_expression (a_replacement)
			end
		ensure
			replaced: a_replacement.item /= Void
		end

	merge_common_start_expression (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION])
			-- Merge common start path expressions;
			--  i.e. rewrite (/X | /Y) as /(X|Y).
			--  This applies recursively, so that /A/B/C | /A/B/D becomes /A/B/child::(C|D)
		require
			a_replacement_not_void: a_replacement /= Void
			not_replaced: a_replacement.item = Void
		local
			l_path_expression, l_other_path_expression: XM_XPATH_PATH_EXPRESSION
			l_venn_expression: XM_XPATH_VENN_EXPRESSION
		do
			if first_operand.is_path_expression and second_operand.is_path_expression and operator = Union_token then
				l_path_expression := first_operand.as_path_expression
				l_other_path_expression := second_operand.as_path_expression
				if l_path_expression.first_step.same_expression (l_other_path_expression.first_step) then
					create l_venn_expression.make (l_path_expression.remaining_steps, operator, l_other_path_expression.remaining_steps, function_library)
					create l_other_path_expression.make (l_path_expression.first_step, l_venn_expression)
					l_other_path_expression.simplify (a_replacement)
				else
					merge_non_positional_filter_expression (a_replacement)
				end
			else
				merge_non_positional_filter_expression (a_replacement)
			end
		ensure
			replaced: a_replacement.item /= Void
		end

	merge_non_positional_filter_expression (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION])
			-- Merge non-positional filter expressions;
			-- A[exp0] | A[exp1] becomes A[exp0 | exp1]
		require
			a_replacement_not_void: a_replacement /= Void
			not_replaced: a_replacement.item = Void
		local
			l_expression: XM_XPATH_EXPRESSION
			l_filter_expression, l_other_filter_expression: XM_XPATH_FILTER_EXPRESSION
			l_arguments: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]
		do
			if first_operand.is_filter_expression and second_operand.is_filter_expression then
				l_filter_expression := first_operand.as_filter_expression
				l_other_filter_expression := second_operand.as_filter_expression
				if not l_filter_expression.is_positional and not l_other_filter_expression.is_positional and
					l_filter_expression.base_expression.same_expression (l_other_filter_expression.base_expression) then
					inspect
						operator
					when Union_token then
						create {XM_XPATH_BOOLEAN_EXPRESSION} l_expression.make (l_filter_expression.filter, Or_token, l_other_filter_expression.filter)
					when Intersect_token then
						create {XM_XPATH_BOOLEAN_EXPRESSION} l_expression.make (l_filter_expression.filter, And_token, l_other_filter_expression.filter)
					when Except_token then
						create l_arguments.make (1)
						l_arguments.put (l_other_filter_expression.filter, 1)
						function_library.bind_function (not_function_fingerprint, l_arguments, False)
						check postcondition_of_bind_function: attached function_library.last_bound_function as l_last_bound_function then
							create {XM_XPATH_BOOLEAN_EXPRESSION} l_expression.make (l_filter_expression.filter, And_token, l_last_bound_function.as_not_function)
						end
					end
					copy_location_identifier (l_expression)
					create l_other_filter_expression.make (l_filter_expression.base_expression, l_expression)
					set_replacement (a_replacement, l_other_filter_expression)
				end
			end
			if a_replacement.item = Void then
				a_replacement.put (Current)
			end
		ensure
			replaced: a_replacement.item /= Void
		end

	function_library: XM_XPATH_FUNCTION_LIBRARY
			-- Function library

	not_function_fingerprint: INTEGER
			-- Fingerprint of "not" function

invariant

	venn_operator: operator = Union_token or operator = Intersect_token or operator = Except_token
	strictly_positive_not_function_fingerprint: initialized implies not_function_fingerprint > 0
	function_library_not_void: initialized implies function_library /= Void

end

