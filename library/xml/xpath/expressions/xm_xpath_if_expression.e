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
			simplified_expression, evaluate_item, promote, iterator, sub_expressions
		end

creation

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
			initialize
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


feature -- Status report

	display (a_level: INTEGER; a_pool: XM_XPATH_NAME_POOL) is
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indentation (a_level), "if (")
			std.error.put_string (a_string)
				if is_error then
				std.error.put_string (" in error%N")
			else
				std.error.put_new_line
				condition.display (a_level + 1, a_pool)
				a_string := STRING_.appended_string (indentation (a_level), "then")
				std.error.put_string (a_string)
				std.error.put_new_line
				then_expression.display (a_level + 1, a_pool)
					a_string := STRING_.appended_string (indentation (a_level), "else")
					std.error.put_string (a_string)
					std.error.put_new_line
					else_expression.display (a_level + 1, a_pool)				
				end
			end

feature -- Optimization

	simplified_expression: XM_XPATH_EXPRESSION is
			-- Simplified expression as a result of context-independent static optimizations
		local
			a_value: XM_XPATH_VALUE
			a_boolean_value: XM_XPATH_BOOLEAN_VALUE
			an_if_expression: XM_XPATH_IF_EXPRESSION
			an_expression: XM_XPATH_EXPRESSION
		do
			an_if_expression := clone (Current)
			an_expression := condition.simplified_expression
			an_if_expression.set_condition (an_expression)
			if an_expression.is_error then
				an_if_expression.set_last_error (an_expression.error_value)
			else
				a_value ?= condition
				if a_value /= Void then
					a_boolean_value := condition.effective_boolean_value (Void)
					if not a_boolean_value.is_error and then a_boolean_value.value then
						an_expression := then_expression.simplified_expression
						an_if_expression.set_then_expression (an_expression)
						if an_expression.is_error then
							an_if_expression.set_last_error (an_expression.error_value)
						end
					else
						an_expression := else_expression.simplified_expression
						an_if_expression.set_else_expression (an_expression)
						if an_expression.is_error then
							an_if_expression.set_last_error (an_expression.error_value)
						end						
					end
				else
					an_if_expression.set_then_expression (then_expression.simplified_expression)
					an_if_expression.set_else_expression (else_expression.simplified_expression)
				end
			end
			Result := an_if_expression
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
					set_replacement (simplified_expression)
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
			a_boolean_value := condition.effective_boolean_value (a_context)
			if a_boolean_value.is_error then
				last_evaluated_item := a_boolean_value
			elseif a_boolean_value.value then
				then_expression.evaluate_item (a_context)
			else
				else_expression.evaluate_item (a_context)
			end
		end

	iterator (a_context: XM_XPATH_CONTEXT): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM] is
			-- Iterates over the values of a sequence
		local
			a_boolean_value: XM_XPATH_BOOLEAN_VALUE
		do
			a_boolean_value := condition.effective_boolean_value (a_context)
			if a_boolean_value.is_error then
				create {XM_XPATH_INVALID_ITERATOR} Result.make (a_boolean_value.error_value)
			elseif a_boolean_value.value then
				Result := then_expression.iterator (a_context)
			else
				Result := else_expression.iterator (a_context)
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
		ensure
			else_set: else_expression = an_else_expression
			else_expression_not_marked_for_replacement: not else_expression.was_expression_replaced
		end	

feature {XM_XPATH_EXPRESSION} -- Restrictes

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

	condition_not_void: condition /= Void
	else_not_void: else_expression /= Void
	then_not_void: then_expression /= Void

end

	
