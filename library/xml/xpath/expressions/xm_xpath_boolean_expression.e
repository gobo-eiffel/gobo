indexing

	description:

		"XPath Boolean Expressions"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_BOOLEAN_EXPRESSION

inherit

	XM_XPATH_BINARY_EXPRESSION
		redefine
			analyze, calculate_effective_boolean_value, evaluate_item, make,
			is_boolean_expression, as_boolean_expression
		end
	
	XM_XPATH_TOKENS
	
creation

	make

feature {NONE} -- Initialization

	make (an_operand_one: XM_XPATH_EXPRESSION; a_token: INTEGER; an_operand_two: XM_XPATH_EXPRESSION) is
			-- Establish invariant
		do
			Precursor (an_operand_one, a_token, an_operand_two)
			initialized := True
		end

feature -- Access
	
	is_boolean_expression: BOOLEAN is
			-- Is `Current' a boolean expression?
		do
			Result := True
		end

	as_boolean_expression: XM_XPATH_BOOLEAN_EXPRESSION is
			-- `Current' seen as a boolean expression
		do
			Result := Current
		end

	item_type: XM_XPATH_ITEM_TYPE is
			--Determine the data type of the expression, if possible
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
			a_boolean_expression: XM_XPATH_BOOLEAN_EXPRESSION
		do
			mark_unreplaced
			Precursor (a_context)
			if was_expression_replaced then
				if replacement_expression.is_boolean_expression then
					a_boolean_expression := replacement_expression.as_boolean_expression
				end
			else
				a_boolean_expression := Current
			end
			if a_boolean_expression /= Void and then not a_boolean_expression.is_error then
				first_operand.set_unsorted (False)
				if first_operand.was_expression_replaced then set_first_operand (first_operand.replacement_expression) end
				second_operand.set_unsorted (False)
				if second_operand.was_expression_replaced then set_second_operand (second_operand.replacement_expression) end
				if a_boolean_expression /= Current then
					set_replacement (a_boolean_expression)
				end
			end
		end

feature -- Evaluation

	calculate_effective_boolean_value (a_context: XM_XPATH_CONTEXT) is
			-- Effective boolean value
		local
			a_boolean_value: XM_XPATH_BOOLEAN_VALUE
		do
			first_operand.calculate_effective_boolean_value (a_context)
			a_boolean_value := first_operand.last_boolean_value
			if a_boolean_value.is_error then
				last_boolean_value := a_boolean_value
			else
				inspect
					operator
				when And_token then
					if a_boolean_value.value then
						second_operand.calculate_effective_boolean_value (a_context)
						last_boolean_value := second_operand.last_boolean_value
					else
						last_boolean_value := a_boolean_value
					end
				when Or_token then
					if a_boolean_value.value then
						last_boolean_value := a_boolean_value
					else
						second_operand.calculate_effective_boolean_value (a_context)
						last_boolean_value := second_operand.last_boolean_value
					end
				end
			end
		end

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate `Current' as a single item
		do
			calculate_effective_boolean_value (a_context)
			last_evaluated_item := last_boolean_value
		end

end
	
