indexing

	description:

		"XPath if expressions"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_IF_EXPRESSION

inherit

	XM_XPATH_COMPUTED_EXPRESSION
		redefine
			simplify, evaluate_item, promote, create_iterator,
			sub_expressions, mark_tail_function_calls,
			compute_special_properties, is_tail_recursive
		end

create

	make

feature {NONE} -- Initialization

	make (a_condition: XM_XPATH_EXPRESSION; a_then_expression: XM_XPATH_EXPRESSION; an_else_expression: XM_XPATH_EXPRESSION) is
			-- Establish invariant.
		require
				condition_not_void: a_condition /= Void
				else_not_void: an_else_expression /= Void
				then_not_void: a_then_expression /= Void
		do
			set_condition (a_condition)
			set_else_expression (an_else_expression)
			set_then_expression (a_then_expression)
			compute_static_properties
			initialized := True
		ensure
			static_properties_computed: are_static_properties_computed
			condition_set: condition = a_condition
			else_set: else_expression = an_else_expression
			then_set: then_expression = a_then_expression
		end

feature -- Access

	condition: XM_XPATH_EXPRESSION
			-- Conditional clause

	else_expression: XM_XPATH_EXPRESSION
			-- Else clause
	
	then_expression: XM_XPATH_EXPRESSION
			-- Then clause
	
	item_type: XM_XPATH_ITEM_TYPE is
			-- Determine the data type of the expression, if possible
		do
			Result := common_super_type (then_expression.item_type, else_expression.item_type)
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

	sub_expressions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION] is
			-- Immediate sub-expressions of `Current'
		do
			create Result.make (3)
			Result.set_equality_tester (expression_tester)
			Result.put (condition, 1)
			Result.put (then_expression, 2)
			Result.put (else_expression, 3)
		end

	is_tail_recursive: BOOLEAN is
			-- Is `Current' a tail recursive function call?
		do
			Result := then_expression.is_tail_recursive or else
			else_expression.is_tail_recursive
		end

feature -- Status report

	display (a_level: INTEGER) is
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indentation (a_level), "if (")
			std.error.put_string (a_string)
			std.error.put_new_line
			condition.display (a_level + 1)
			a_string := STRING_.appended_string (indentation (a_level), "then")
			std.error.put_string (a_string)
			std.error.put_new_line
			then_expression.display (a_level + 1)
			a_string := STRING_.appended_string (indentation (a_level), "else")
			std.error.put_string (a_string)
			std.error.put_new_line
			else_expression.display (a_level + 1)				
		end

feature -- Status setting
	
	mark_tail_function_calls is
			-- Mark tail-recursive calls on stylesheet functions.
		do
			then_expression.mark_tail_function_calls
			else_expression.mark_tail_function_calls
		end

feature -- Optimization

	simplify is
			-- Perform context-independent static optimizations
		local
			a_boolean_value: XM_XPATH_BOOLEAN_VALUE
		do
			condition.simplify
			if condition.is_error then
				set_last_error (condition.error_value)
			else
				if condition.was_expression_replaced then
					set_condition (condition.replacement_expression)
				end
				if condition.is_value then
					condition.calculate_effective_boolean_value (Void)
					a_boolean_value := condition.last_boolean_value
					if not a_boolean_value.is_error and then a_boolean_value.value then
						then_expression.simplify
						if then_expression.is_error then
							set_last_error (then_expression.error_value)
						elseif then_expression.was_expression_replaced then
							set_then_expression (then_expression.replacement_expression)
						end
					else
						else_expression.simplify
						if else_expression.is_error then
							set_last_error (else_expression.error_value)
						elseif else_expression.was_expression_replaced then
							set_else_expression (else_expression.replacement_expression)
						end						
					end
				else
					then_expression.simplify
					if then_expression.was_expression_replaced then
						set_then_expression (then_expression.replacement_expression)
					end
					else_expression.simplify
					if else_expression.was_expression_replaced then
						set_else_expression (else_expression.replacement_expression)
					end
				end
			end
		end

	analyze (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Perform static analysis of an expression and its subexpressions	
		do
			mark_unreplaced
			condition.analyze (a_context)
			if condition.was_expression_replaced then
				set_condition (condition.replacement_expression)
			end
			if condition.is_error then
				set_last_error (condition.error_value)
			else
				then_expression.analyze (a_context)
				if then_expression.was_expression_replaced then
					set_then_expression (then_expression.replacement_expression)
				end
				if then_expression.is_error then
					set_last_error (then_expression.error_value)
				else
					else_expression.analyze (a_context)
					if else_expression.was_expression_replaced then
						set_else_expression (else_expression.replacement_expression)
					end
					if else_expression.is_error then
						set_last_error (else_expression.error_value)
					end
				end
				if not is_error then
					simplify
				end
			end
		end

	promote (an_offer: XM_XPATH_PROMOTION_OFFER) is
			-- Promote this subexpression.
		local
			a_promotion: XM_XPATH_EXPRESSION
		do
			an_offer.accept (Current)
			a_promotion := an_offer.accepted_expression
			if a_promotion /= Void then
				set_replacement (a_promotion)
			else
				condition.promote (an_offer)
				if condition.was_expression_replaced then set_condition (condition.replacement_expression) end
				if an_offer.action = Unordered or else an_offer.action = Inline_variable_references then
					then_expression.promote (an_offer)
					if then_expression.was_expression_replaced then set_then_expression (then_expression.replacement_expression) end
					else_expression.promote (an_offer)
					if else_expression.was_expression_replaced then set_else_expression (else_expression.replacement_expression) end					
				end
			end
		end

feature -- Evaluation

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate `Current' as a single item
		local
			a_boolean_value: XM_XPATH_BOOLEAN_VALUE
		do
			last_evaluated_item := Void
			condition.calculate_effective_boolean_value (a_context)
			a_boolean_value := condition.last_boolean_value
			if a_boolean_value.is_error then
				last_evaluated_item := a_boolean_value
			elseif a_boolean_value.value then
				then_expression.evaluate_item (a_context)
				last_evaluated_item := then_expression.last_evaluated_item
			else
				else_expression.evaluate_item (a_context)
				last_evaluated_item := else_expression.last_evaluated_item
			end
		end

	create_iterator (a_context: XM_XPATH_CONTEXT) is
			-- Iterates over the values of a sequence
		local
			a_boolean_value: XM_XPATH_BOOLEAN_VALUE
		do
			condition.calculate_effective_boolean_value (a_context)
			a_boolean_value := condition.last_boolean_value
			if a_boolean_value.is_error then
				create {XM_XPATH_INVALID_ITERATOR} last_iterator.make (a_boolean_value.error_value)
			elseif a_boolean_value.value then
				then_expression.create_iterator (a_context)
				last_iterator := then_expression.last_iterator
			else
				else_expression.create_iterator (a_context)
				last_iterator := else_expression.last_iterator
			end
		end

feature -- Element change

	set_condition (a_condition: XM_XPATH_EXPRESSION) is
			-- Set `condition'.
		require
			condition_not_void: a_condition /= Void
		do
			condition := a_condition
			if condition.was_expression_replaced then condition.mark_unreplaced end
			adopt_child_expression (condition)
		ensure
			condition_set: condition = a_condition
			condition_not_marked_for_replacement: not condition.was_expression_replaced
		end

	set_then_expression (a_then_expression: XM_XPATH_EXPRESSION) is
			-- Set `then_expression'.
		require
			then_not_void: a_then_expression /= Void
		do
			then_expression := a_then_expression
			if then_expression.was_expression_replaced then then_expression.mark_unreplaced end
			adopt_child_expression (then_expression)
		ensure
			then_set: then_expression = a_then_expression
				then_expression_not_marked_for_replacement: not then_expression.was_expression_replaced
		end

	set_else_expression (an_else_expression: XM_XPATH_EXPRESSION) is
			-- Set `else_expression'.
		require
			else_not_void: an_else_expression /= Void
		do
			else_expression := an_else_expression
			if else_expression.was_expression_replaced then else_expression.mark_unreplaced end
			adopt_child_expression (else_expression)
		ensure
			else_set: else_expression = an_else_expression
			else_expression_not_marked_for_replacement: not else_expression.was_expression_replaced
		end	


feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_special_properties is
			-- Compute special properties.
		do
			clone_special_properties (then_expression)
			mask_special_properties (else_expression)
		end

	compute_cardinality is
			-- Compute cardinality.
		do
			clone_cardinality (then_expression)
			set_cardinalities (merged_cardinality (else_expression.cardinalities))
			if cardinality_allows_zero and then cardinality_allows_many then
				set_cardinality_zero_or_more
			end
		end
	
invariant

	condition_not_void: initialized implies condition /= Void
	else_not_void: initialized implies else_expression /= Void
	then_not_void: initialized implies then_expression /= Void

end

	
