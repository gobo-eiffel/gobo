indexing

	description:

		"XPath identity comparisons"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_IDENTITY_COMPARISON

inherit

	XM_XPATH_BINARY_EXPRESSION
		redefine
			check_static_type, evaluate_item, calculate_effective_boolean_value, make
		end

	XM_XPATH_ROLE

	XM_XPATH_SHARED_GLOBAL_ORDER_COMPARER

create

	make

feature {NONE} -- Initialization

	make (an_operand_one: XM_XPATH_EXPRESSION; a_token: INTEGER; an_operand_two: XM_XPATH_EXPRESSION) is
			-- Establish invariant
		do
			Precursor (an_operand_one, a_token, an_operand_two)
			initialized := True
		end

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

	check_static_type (a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform static type-checking of `Current' and its subexpressions.
		local
			a_role, another_role: XM_XPATH_ROLE_LOCATOR
			a_type_checker: XM_XPATH_TYPE_CHECKER
			a_single_node: XM_XPATH_SEQUENCE_TYPE
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
					create a_single_node.make_optional_node
					a_type_checker.static_type_check (a_context, first_operand, a_single_node, False, a_role)
					if a_type_checker.is_static_type_check_error then
						set_last_error (a_type_checker.static_type_check_error)
					else
						set_first_operand (a_type_checker.checked_expression)
						create another_role.make (Binary_expression_role, token_name (operator), 2, Xpath_errors_uri, "XPTY0004")
						a_type_checker.static_type_check (a_context, second_operand, a_single_node, False, another_role)
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
			l_result: DS_CELL [XM_XPATH_ITEM]
			l_node: XM_XPATH_NODE
		do
			create l_result.make (Void)
			first_operand.evaluate_item (l_result, a_context)
			if l_result.item /= Void and then l_result.item.is_error then
				create last_boolean_value.make (False)
				last_boolean_value.set_last_error (l_result.item.error_value)
			else
				if l_result.item = Void or else not l_result.item.is_node then
					if generate_id_emulation_mode then
						create l_result.make (Void)
						second_operand.evaluate_item (l_result, a_context)
						create last_boolean_value.make (l_result.item = Void or else not l_result.item.is_node)
					else
						create last_boolean_value.make (False)
					end
				else
					l_node := l_result.item.as_node
					create l_result.make (Void)
					second_operand.evaluate_item (l_result, a_context)
					if l_result.item /= Void and then l_result.item.is_error then
						create last_boolean_value.make (False)
						last_boolean_value.set_last_error (l_result.item.error_value)
					else
						if l_result.item = Void or else not l_result.item.is_node then
							create last_boolean_value.make (False)
						else
							create last_boolean_value.make (identity_comparison (l_node, l_result.item.as_node))
						end
					end
				end
			end
		end

	evaluate_item (a_result: DS_CELL [XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a single item to `a_result'.
		local
			l_node: XM_XPATH_NODE
		do
			first_operand.evaluate_item (a_result, a_context)
			if a_result.item /= Void and then a_result.item.is_error then
				-- nothing to do
			else
				if a_result.item = Void or else not a_result.item.is_node then
					a_result.put (Void)
					if	generate_id_emulation_mode	then
						second_operand.evaluate_item (a_result, a_context)
						a_result.put (create {XM_XPATH_BOOLEAN_VALUE}.make (a_result.item = Void or else not a_result.item.is_node))
					end
				else
					l_node := a_result.item.as_node
					a_result.put (Void)
					second_operand.evaluate_item (a_result, a_context)
					if a_result.item /= Void and then a_result.item.is_error then
						-- nothing to do
					else
						if a_result.item = Void or else not a_result.item.is_node then
							if	generate_id_emulation_mode	then
								a_result.put (create {XM_XPATH_BOOLEAN_VALUE}.make (False))
							else
								a_result.put (Void)
							end
						else
							a_result.put (create {XM_XPATH_BOOLEAN_VALUE}.make (identity_comparison (l_node, a_result.item.as_node)))
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
	
