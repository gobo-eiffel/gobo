indexing

	description:

		"XPath Venn exxpressions"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_VENN_EXPRESSION

inherit

	XM_XPATH_BINARY_EXPRESSION
		redefine
			compute_cardinality, compute_special_properties, simplified_expression, analyze, iterator, effective_boolean_value
		end

	XM_XPATH_SHARED_FUNCTION_FACTORY

	XM_XPATH_SHARED_GLOBAL_ORDER_COMPARER

	XM_XPATH_ROLE

creation

	make

feature -- Access

	item_type: INTEGER is
			--Determine the data type of the expression, if possible
		do
			Result := common_super_type (first_operand.item_type, second_operand.item_type)
		end

feature -- Optimization

	simplified_expression: XM_XPATH_EXPRESSION is
			-- Simplified expression as a result of context-independent static optimizations
		local
			a_venn_expression: XM_XPATH_VENN_EXPRESSION
		do
			a_venn_expression := clone (Current)
			a_venn_expression.set_first_operand (first_operand.simplified_expression)
			if a_venn_expression.first_operand.is_error then
				a_venn_expression.set_last_error (a_venn_expression.first_operand.error_value)
			end

			if not a_venn_expression.is_error then
				a_venn_expression.set_second_operand (second_operand.simplified_expression)
				if a_venn_expression.second_operand.is_error then
					a_venn_expression.set_last_error (a_venn_expression.second_operand.error_value)
				end
			end
			
			Result := a_venn_expression.simplified_empty_expression
		end

	analyze (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Perform static analysis of an expression and its subexpressions
		local
			a_role, another_role: XM_XPATH_ROLE_LOCATOR
			a_type_checker: XM_XPATH_TYPE_CHECKER
			a_node_sequence: XM_XPATH_SEQUENCE_TYPE
		do
			mark_unreplaced
			first_operand.analyze (a_context)
			if first_operand.was_expression_replaced then
				set_first_operand (first_operand.replacement_expression)
			end
			if first_operand.is_error then
				set_last_error (first_operand.error_value)
			else
				second_operand.analyze (a_context)
				if second_operand.was_expression_replaced then
					set_second_operand (second_operand.replacement_expression)
				end
				if second_operand.is_error then
					set_last_error (second_operand.error_value)
				else
					create a_role.make (Binary_expression_role, token_name (operator), 1)
					create a_type_checker
					create a_node_sequence.make_node_sequence
					a_type_checker.static_type_check (first_operand, a_node_sequence, False, a_role)
					if a_type_checker.is_static_type_check_error then
						set_last_error_from_string (a_type_checker.static_type_check_error_message, 4, Type_error)
					else
						set_first_operand (a_type_checker.checked_expression)
						create another_role.make (Binary_expression_role, token_name (operator), 2)
						a_type_checker.static_type_check (second_operand, a_node_sequence, False, another_role)
						if a_type_checker.is_static_type_check_error then
							set_last_error_from_string (a_type_checker.static_type_check_error_message, 4, Type_error)
						else
							set_second_operand (a_type_checker.checked_expression)
						end
					end
				end
			end
		end

feature -- Evaluation

	effective_boolean_value (a_context: XM_XPATH_CONTEXT): XM_XPATH_BOOLEAN_VALUE is
			-- Effective boolean value
		local
			a_boolean_value: XM_XPATH_BOOLEAN_VALUE
		do
			if operator = Union_token then
				a_boolean_value := first_operand.effective_boolean_value (a_context)
				if a_boolean_value.value then
					Result := a_boolean_value
				else
					Result := second_operand.effective_boolean_value (a_context)
				end
			else
				Result := Precursor (a_context)
			end
		end

	iterator (a_context: XM_XPATH_CONTEXT): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM] is
			-- Iterate over the values of a sequence
		local
			an_iterator, another_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			a_node_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
		do
			an_iterator := first_operand.iterator (a_context)
			if an_iterator.is_error then
				Result := an_iterator
			else
				if not first_operand.ordered_nodeset then
					a_node_iterator ?= an_iterator
					if a_node_iterator /= Void then
						create {XM_XPATH_DOCUMENT_ORDER_ITERATOR} an_iterator.make (a_node_iterator, global_order_comparer)
					else
						do_nothing -- must be an empty iterator, but we won't bother to check this
					end
				end
				another_iterator := second_operand.iterator (a_context)
				if another_iterator.is_error then
					Result := another_iterator
				else
					if not second_operand.ordered_nodeset then
						a_node_iterator ?= an_iterator
						if a_node_iterator /= Void then
							create {XM_XPATH_DOCUMENT_ORDER_ITERATOR} another_iterator.make (a_node_iterator, global_order_comparer)
						else
							do_nothing -- must be an empty iterator, but we won't bother to check this
						end
					end
					inspect
						operator
					when Union_token then
						create {XM_XPATH_UNION_ENUMERATION} Result.make (an_iterator, another_iterator, global_order_comparer)
					when Intersect_token then
						create {XM_XPATH_INTERSECTION_ENUMERATION} Result.make (an_iterator, another_iterator, global_order_comparer)
					when Except_token then
						create {XM_XPATH_DIFFERENCE_ENUMERATION} Result.make (an_iterator, another_iterator, global_order_comparer)
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
			create special_properties.make (1, 6)
			-- All `False' by default
			are_special_properties_computed := True
			set_ordered_nodeset
			if test_context_document_nodeset then
				set_context_document_nodeset
			end
			if test_subtree_nodeset then
				set_subtree_nodeset
			end			
		end

feature {XM_XPATH_VENN_EXPRESSION} -- Local

	simplified_empty_expression: XM_XPATH_EXPRESSION is
			-- Further simplified expression when either operand is an empty sequence;
			-- This can happen after reduction with constructs of the form //a[condition] | //b[not(condition)]
			-- (common in XPath 1.0 because there were no conditional expressions)
		local
			an_expression: XM_XPATH_EXPRESSION
			an_empty_sequence: XM_XPATH_EMPTY_SEQUENCE
		do
			inspect
				operator
			when Union_token then
				an_empty_sequence ?= first_operand
				if an_empty_sequence /= Void and then second_operand.ordered_nodeset then
					an_expression := second_operand
				else
					an_empty_sequence ?= second_operand
					if an_empty_sequence /= Void and then first_operand.ordered_nodeset then
						an_expression := first_operand
					end
				end
			when Intersect_token then
				an_empty_sequence ?= first_operand
				if an_empty_sequence /= Void then
					an_expression := an_empty_sequence
				else
					an_empty_sequence ?= second_operand
					if an_empty_sequence /= Void then an_expression := an_empty_sequence end
				end
			when Except_token then
				an_empty_sequence ?= first_operand
				if an_empty_sequence /= Void then
					an_expression := an_empty_sequence
				else
					an_empty_sequence ?= second_operand
					if an_empty_sequence /= Void and then first_operand.ordered_nodeset then an_expression := first_operand end
				end				
			end
			
			if an_expression /= Void then	Result := an_expression	else Result := merged_axis_expression end
		ensure
			simplified_empty_expression_not_void: Result /= Void
		end
		
feature {NONE} -- Implementation

	set_cardinality_for_union_expression is
			-- Set cardinality for union expression.
		local
			a_cardinality_set: ARRAY [BOOLEAN]
			an_empty_sequence: XM_XPATH_EMPTY_SEQUENCE
		do
			an_empty_sequence ?= first_operand
			if an_empty_sequence /= Void then
				clone_cardinality (second_operand)
			else
				an_empty_sequence ?= second_operand
				if an_empty_sequence /= Void then
					clone_cardinality (first_operand)
				else
					if first_operand.cardinality_allows_zero or else second_operand.cardinality_allows_zero then
						set_cardinality_zero_or_more
					else
						set_cardinality_one_or_more
					end
				end
			end
		end

	set_cardinality_for_intersect_expression is
			-- Set cardinality for intersect expression.
		local
			a_cardinality_set: ARRAY [BOOLEAN]
			an_empty_sequence: XM_XPATH_EMPTY_SEQUENCE
		do
			an_empty_sequence ?= first_operand
			if an_empty_sequence /= Void then
				set_cardinality_empty
			else
				an_empty_sequence ?= second_operand
				if an_empty_sequence /= Void then
					set_cardinality_empty
				else
					if first_operand.cardinality_allows_many or else second_operand.cardinality_allows_many then
						set_cardinality_zero_or_more
					else
						set_cardinality_optional
					end
				end
			end
		end

	set_cardinality_for_difference_expression is
			-- Set cardinality for difference expression.
		local
			a_cardinality_set: ARRAY [BOOLEAN]
			an_empty_sequence: XM_XPATH_EMPTY_SEQUENCE
		do
			an_empty_sequence ?= first_operand
			if an_empty_sequence /= Void then
				set_cardinality_empty
			else
				an_empty_sequence ?= second_operand
				if an_empty_sequence /= Void then
					clone_cardinality (first_operand)
				else
					if first_operand.cardinality_allows_many then
						set_cardinality_zero_or_more
					else
						set_cardinality_optional
					end
				end
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

	merged_axis_expression: XM_XPATH_EXPRESSION is
			-- Merged expression when both operands are axis expressions on the same axis;
			--  ie. rewrite (axis::test1 | axis::test2) as axis::(test1 | test2)
		local
			an_axis_expression, another_axis_expression: XM_XPATH_AXIS_EXPRESSION
			a_combined_node_test: XM_XPATH_COMBINED_NODE_TEST
		do
			an_axis_expression ?= first_operand; another_axis_expression ?= second_operand
			if an_axis_expression /= Void and then another_axis_expression /= Void and then
				an_axis_expression.axis = another_axis_expression.axis then
				create a_combined_node_test.make (an_axis_expression.node_test, operator, another_axis_expression.node_test)
				create {XM_XPATH_AXIS_EXPRESSION} Result.make (an_axis_expression.axis, a_combined_node_test)
			else
				Result := merged_common_start_expression
			end
		ensure
			merged_axis_expression_not_void: Result /= Void
		end

	merged_common_start_expression: XM_XPATH_EXPRESSION is
			-- Merged common start path expressions;
			--  i.e. rewrite (/X | /Y) as /(X|Y).
			--  This applies recursively, so that /A/B/C | /A/B/D becomes /A/B/child::(C|D)
		local
			a_path_expression, another_path_expression: XM_XPATH_PATH_EXPRESSION
			a_venn_expression: XM_XPATH_VENN_EXPRESSION
		do
			a_path_expression ?= first_operand; another_path_expression ?= second_operand
			if a_path_expression /= Void and then another_path_expression /= Void and then
				a_path_expression.first_step.same_expression (another_path_expression.first_step) then
				create a_venn_expression.make (a_path_expression.remaining_steps, operator, another_path_expression.remaining_steps)
				create {XM_XPATH_PATH_EXPRESSION} Result.make (a_path_expression.first_step, a_venn_expression)
				Result := Result.simplified_expression
				-- TODO: copy location information
			else
				Result := merged_non_positional_filter_expression
			end
		ensure
			merged_common_start_expression_not_void: Result /= Void
		end

	merged_non_positional_filter_expression: XM_XPATH_EXPRESSION is
			-- Merged non-positional filter expressions;
			-- A[exp0] | A[exp1] becomes A[exp0 | exp1]
		local
			an_expression: XM_XPATH_EXPRESSION
			a_filter_expression, another_filter_expression: XM_XPATH_FILTER_EXPRESSION
			a_not_function: XM_XPATH_NOT
			arguments: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]
		do
			a_filter_expression ?= first_operand; another_filter_expression ?= second_operand
			if a_filter_expression /= Void and then another_filter_expression /= Void and then
				not a_filter_expression.is_positional and then not another_filter_expression.is_positional then
				inspect
					operator
				when Union_token then
					create {XM_XPATH_BOOLEAN_EXPRESSION} an_expression.make (a_filter_expression.filter, Or_token, another_filter_expression.filter)
				when Intersect_token then
					create {XM_XPATH_BOOLEAN_EXPRESSION} an_expression.make (a_filter_expression.filter, And_token, another_filter_expression.filter)
				when Except_token then
					a_not_function ?= function_factory.make_system_function ("not")
					create arguments.make (1)
					arguments.put (another_filter_expression.filter, 1)
					a_not_function.set_arguments (arguments)
					create {XM_XPATH_BOOLEAN_EXPRESSION} an_expression.make (a_filter_expression.filter, And_token, a_not_function)
				end
				create {XM_XPATH_FILTER_EXPRESSION} Result.make (a_filter_expression.base_expression, an_expression)
				-- TODO copy location information
			else
				Result := Current
			end
		ensure
			merged_non_positional_filter_expression_not_void: Result /= Void
		end

invariant

	venn_operator: operator = Union_token or else operator = Intersect_token or else operator = Except_token

end
	
