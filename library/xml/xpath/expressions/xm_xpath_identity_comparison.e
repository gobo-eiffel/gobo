indexing

	description:

		"XPath identity comparisons"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_IDENTITY_COMPARISON

inherit

	XM_XPATH_BINARY_EXPRESSION
		redefine
			analyze, evaluate_item, calculate_effective_boolean_value
		end

	XM_XPATH_ROLE

	XM_XPATH_SHARED_GLOBAL_ORDER_COMPARER

creation

	make

feature -- Access

	generate_id_emulation_mode: BOOLEAN
			-- Emulation mode for generate-id() comparisons

	item_type: XM_XPATH_ITEM_TYPE is
			-- Determine the data type of the expression, if possible
		do
			Result := type_factory.boolean_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

feature -- Optimization	

		analyze (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Perform static analysis of an expression and its subexpressions
		local
			a_role, another_role: XM_XPATH_ROLE_LOCATOR
			a_type_checker: XM_XPATH_TYPE_CHECKER
			a_single_node: XM_XPATH_SEQUENCE_TYPE
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
					create a_single_node.make_optional_node
					a_type_checker.static_type_check (a_context, first_operand, a_single_node, False, a_role)
					if a_type_checker.is_static_type_check_error then
						set_last_error_from_string (a_type_checker.static_type_check_error_message, Xpath_errors_uri, "XP0006", Type_error)
					else
						set_first_operand (a_type_checker.checked_expression)
						create another_role.make (Binary_expression_role, token_name (operator), 2)
						a_type_checker.static_type_check (a_context, second_operand, a_single_node, False, another_role)
						if a_type_checker.is_static_type_check_error then
							set_last_error_from_string (a_type_checker.static_type_check_error_message, Xpath_errors_uri, "XP0006", Type_error)
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
			a_node, another_node: XM_XPATH_NODE
		do
			first_operand.evaluate_item (a_context)
			if first_operand.last_evaluated_item.is_error then
				create last_boolean_value.make (False)
				last_boolean_value.set_last_error (first_operand.last_evaluated_item.error_value)
			else
				a_node ?= first_operand.last_evaluated_item
				if a_node = Void then
					if generate_id_emulation_mode then
						second_operand.evaluate_item (a_context)
						a_node ?= second_operand.last_evaluated_item
						create last_boolean_value.make (a_node = Void)
					else
						create last_boolean_value.make (False)
					end
				else
					second_operand.evaluate_item (a_context)
					if second_operand.last_evaluated_item.is_error then
						create last_boolean_value.make (False)
						last_boolean_value.set_last_error (second_operand.last_evaluated_item.error_value)
					else
						another_node ?= second_operand.last_evaluated_item
						if another_node = Void then
							create last_boolean_value.make (False)
						else
							create last_boolean_value.make (identity_comparison (a_node, another_node))
						end
					end
				end
			end
		end

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a single item.
		local
			a_node, another_node: XM_XPATH_NODE
		do
			first_operand.evaluate_item (a_context)
			if first_operand.last_evaluated_item.is_error then
				last_evaluated_item := first_operand.last_evaluated_item
			else
				a_node ?= first_operand.last_evaluated_item
				if a_node = Void then
					if	generate_id_emulation_mode	then
						second_operand.evaluate_item (a_context)
						another_node ?= second_operand.last_evaluated_item
						create {XM_XPATH_BOOLEAN_VALUE} last_evaluated_item.make (another_node = Void)
					else
						last_evaluated_item := Void
					end
				else
					second_operand.evaluate_item (a_context)
					if second_operand.last_evaluated_item.is_error then
						last_evaluated_item := second_operand.last_evaluated_item
					else
						another_node ?= second_operand.last_evaluated_item
						if another_node = Void then
							if	generate_id_emulation_mode	then
								create {XM_XPATH_BOOLEAN_VALUE} last_evaluated_item.make (False)
							else
								last_evaluated_item := Void
							end
						else
							create {XM_XPATH_BOOLEAN_VALUE} last_evaluated_item.make (identity_comparison (a_node, another_node))
						end
					end
				end
			end
		end

feature -- Element change

	set_generate_id_emulation is
			-- Turn on generate-id() emulation mode
		do
			generate_id_emulation_mode := True
		ensure
			generate_id_emulation_mode_set: generate_id_emulation_mode			
		end

feature {NONE} -- Implementation

	identity_comparison (a_node, another_node: XM_XPATH_NODE): BOOLEAN is
			-- Is `a_node' in `operator' relation to `another_node'?
		require
			first_node_not_void: a_node /= Void
			second_node_not_void: another_node /= Void
		do
			inspect
				operator
			when Is_token then
				Result := a_node.is_same_node (another_node)
			when Precedes_token then
				Result := global_order_comparer.three_way_comparison (a_node, another_node) < 0
			when Follows_token then
				Result := global_order_comparer.three_way_comparison (a_node, another_node) > 0
			end
		end

invariant

	document_order_operator: operator = Is_token or else operator = Precedes_token or else operator = Follows_token

end
	
