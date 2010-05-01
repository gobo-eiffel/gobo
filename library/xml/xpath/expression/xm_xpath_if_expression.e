note

	description:

		"XPath if expressions"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_IF_EXPRESSION

inherit

	XM_XPATH_COMPUTED_EXPRESSION
		redefine
			simplify, evaluate_item, promote, create_iterator,
			sub_expressions, contains_recursive_tail_function_calls,
			compute_special_properties,
			create_node_iterator, mark_tail_function_calls
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

	contains_recursive_tail_function_calls (a_name_code, a_arity: INTEGER): UT_TRISTATE is
			-- Does `Current' contains recursive tail calls of stylesheet functions?
			-- `Undecided' means it contains a tail call to another function.
		local
			l_then, l_else: UT_TRISTATE
		do
			l_then := then_expression.contains_recursive_tail_function_calls (a_name_code, a_arity)
			l_else := else_expression.contains_recursive_tail_function_calls (a_name_code, a_arity)
			if l_then.is_true or l_else.is_true then
				create Result.make_true
			elseif l_then.is_undefined or l_else.is_undefined then
				create Result.make_undefined
			else
				create Result.make_false
			end
		end

feature -- Status setting
	
	mark_tail_function_calls is
  			-- Mark tail calls on stylesheet functions.
  		do
			then_expression.mark_tail_function_calls
			else_expression.mark_tail_function_calls
  		end

feature -- Optimization

	simplify (a_replacement: DS_CELL [XM_XPATH_EXPRESSION]) is
			-- Perform context-independent static optimizations
		local
			l_boolean_value: XM_XPATH_BOOLEAN_VALUE
			l_replacement: DS_CELL [XM_XPATH_EXPRESSION]
		do
			create l_replacement.make (Void)
			condition.simplify (l_replacement)
			if l_replacement.item.is_error then
				set_replacement (a_replacement, l_replacement.item)
			else
				set_condition (l_replacement.item)
				l_replacement.put (Void)
				if condition.is_value and then not condition.depends_upon_implicit_timezone then
					condition.calculate_effective_boolean_value (Void)
					l_boolean_value := condition.last_boolean_value
					if not l_boolean_value.is_error and then l_boolean_value.value then
						then_expression.simplify (l_replacement)
						if l_replacement.item.is_error then
							set_replacement (a_replacement, l_replacement.item)
						else
							set_then_expression (l_replacement.item)
						end
					else
						else_expression.simplify (l_replacement)
						if l_replacement.item.is_error then
							set_replacement (a_replacement, l_replacement.item)
						else
							set_else_expression (l_replacement.item)
						end						
					end
				else
					then_expression.simplify (l_replacement)
					if l_replacement.item.is_error then
						set_replacement (a_replacement, l_replacement.item)
					else
						set_then_expression (l_replacement.item)
					end
					l_replacement.put (Void)
					else_expression.simplify (l_replacement)
					if l_replacement.item.is_error then
						set_replacement (a_replacement, l_replacement.item)
					else
						set_else_expression (l_replacement.item)
					end
				end
			end
			if a_replacement.item = Void then
				a_replacement.put (Current)
			end
		end

	check_static_type (a_replacement: DS_CELL [XM_XPATH_EXPRESSION];
		a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform static type-checking of `Current' and its subexpressions.
		local
			l_replacement: DS_CELL [XM_XPATH_EXPRESSION]
		do
			create l_replacement.make (Void)
			condition.check_static_type (l_replacement, a_context, a_context_item_type)
			if l_replacement.item.is_error then
				set_replacement (a_replacement, l_replacement.item)
			else
				set_condition (l_replacement.item)
				l_replacement.put (Void)
				if condition.is_boolean_value then
					-- If the condition after typechecking is reduced to a constant, cut it down to the appropriate branch.
					if condition.as_boolean_value.value then
						then_expression.check_static_type (l_replacement, a_context, a_context_item_type)
						set_replacement (a_replacement, l_replacement.item)
					else
						else_expression.check_static_type (l_replacement, a_context, a_context_item_type)
						set_replacement (a_replacement, l_replacement.item)
					end					
				else
					then_expression.check_static_type (l_replacement, a_context, a_context_item_type)
					if l_replacement.item.is_error then
						set_replacement (a_replacement, l_replacement.item)
					else
						set_then_expression (l_replacement.item)
					end
					l_replacement.put (Void)
					else_expression.check_static_type (l_replacement, a_context, a_context_item_type)
					if l_replacement.item.is_error then
						set_replacement (a_replacement, l_replacement.item)
					else
						set_else_expression (l_replacement.item)
					end
				end
			end
			if a_replacement.item = Void then
				a_replacement.put (Current)
			end			
		end

	optimize (a_replacement: DS_CELL [XM_XPATH_EXPRESSION];
		a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform optimization of `Current' and its subexpressions.
		local
			l_replacement: DS_CELL [XM_XPATH_EXPRESSION]
		do
			create l_replacement.make (Void)
			condition.optimize (l_replacement, a_context, a_context_item_type)
			if l_replacement.item.is_error then
				set_replacement (a_replacement, l_replacement.item)
			else
				set_condition (l_replacement.item)
				l_replacement.put (Void)
				then_expression.optimize (l_replacement, a_context, a_context_item_type)
				if l_replacement.item.is_error then
					set_replacement (a_replacement, l_replacement.item)
				else
					set_then_expression (l_replacement.item)
				end
				l_replacement.put (Void)
				else_expression.optimize (l_replacement, a_context, a_context_item_type)
				if l_replacement.item.is_error then
					set_replacement (a_replacement, l_replacement.item)
				else
					set_else_expression (l_replacement.item)
				end
			end
			if a_replacement.item = Void then
				a_replacement.put (Current)
			end
		end

	promote (a_replacement: DS_CELL [XM_XPATH_EXPRESSION]; a_offer: XM_XPATH_PROMOTION_OFFER) is
			-- Promote this subexpression.
		local
			l_promotion: XM_XPATH_EXPRESSION
			l_replacement: DS_CELL [XM_XPATH_EXPRESSION]
		do
			a_offer.accept (Current)
			l_promotion := a_offer.accepted_expression
			if l_promotion /= Void then
				set_replacement (a_replacement, l_promotion)
			else
				a_replacement.put (Current)
				create l_replacement.make (Void)
				condition.promote (l_replacement, a_offer)
				if condition /= l_replacement.item then
					set_condition (l_replacement.item)
					reset_static_properties
				end
				if a_offer.action = Unordered or a_offer.action = Inline_variable_references or
					a_offer.action = Replace_current then
					l_replacement.put (Void)
					then_expression.promote (l_replacement, a_offer)
					if then_expression /=  l_replacement.item then
						set_then_expression (l_replacement.item)
						reset_static_properties
					end
					l_replacement.put (Void)
					else_expression.promote (l_replacement, a_offer)
					if else_expression /=  l_replacement.item then
						set_else_expression (l_replacement.item)
						reset_static_properties
					end					
				end
			end
		end

feature -- Evaluation

	evaluate_item (a_result: DS_CELL [XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a single item to `a_result'.
		local
			l_boolean_value: XM_XPATH_BOOLEAN_VALUE
		do
			condition.calculate_effective_boolean_value (a_context)
			l_boolean_value := condition.last_boolean_value
			if l_boolean_value.is_error then
				a_result.put (l_boolean_value)
			elseif l_boolean_value.value then
				if then_expression.is_error then
					a_result.put (create {XM_XPATH_INVALID_ITEM}.make (then_expression.error_value))
				else
					then_expression.evaluate_item (a_result, a_context)
				end
			elseif else_expression.is_error then
				a_result.put (create {XM_XPATH_INVALID_ITEM}.make (else_expression.error_value))
			else
				else_expression.evaluate_item (a_result, a_context)
			end
		end

	create_iterator (a_context: XM_XPATH_CONTEXT) is
			-- Create an iterator over the values of a sequence
		local
			l_boolean_value: XM_XPATH_BOOLEAN_VALUE
		do
			condition.calculate_effective_boolean_value (a_context)
			l_boolean_value := condition.last_boolean_value
			if l_boolean_value.is_error then
				create {XM_XPATH_INVALID_ITERATOR} last_iterator.make (l_boolean_value.error_value)
			elseif l_boolean_value.value then
				if then_expression.is_error then
					create {XM_XPATH_INVALID_ITERATOR} last_iterator.make (then_expression.error_value)
				else
					then_expression.create_iterator (a_context)
					last_iterator := then_expression.last_iterator
				end
			elseif else_expression.is_error then
				create {XM_XPATH_INVALID_ITERATOR} last_iterator.make (else_expression.error_value)
			else
				else_expression.create_iterator (a_context)
				last_iterator := else_expression.last_iterator
			end
		end

	create_node_iterator (a_context: XM_XPATH_CONTEXT) is
			-- Create an iterator over a node sequence
		local
			l_boolean_value: XM_XPATH_BOOLEAN_VALUE
		do
			condition.calculate_effective_boolean_value (a_context)
			l_boolean_value := condition.last_boolean_value
			if l_boolean_value.is_error then
				create {XM_XPATH_INVALID_NODE_ITERATOR} last_node_iterator.make (l_boolean_value.error_value)
			elseif l_boolean_value.value then
				if then_expression.is_error then
					create {XM_XPATH_INVALID_NODE_ITERATOR} last_node_iterator.make (then_expression.error_value)
				else
					then_expression.create_node_iterator (a_context)
					last_node_iterator := then_expression.last_node_iterator
				end
			elseif else_expression.is_error then
				create {XM_XPATH_INVALID_NODE_ITERATOR} last_node_iterator.make (else_expression.error_value)				
			else
				else_expression.create_node_iterator (a_context)
				last_node_iterator := else_expression.last_node_iterator
			end
		end

feature -- Element change

	set_condition (a_condition: XM_XPATH_EXPRESSION) is
			-- Set `condition'.
		require
			condition_not_void: a_condition /= Void
		do
			condition := a_condition
			adopt_child_expression (condition)
		ensure
			condition_set: condition = a_condition
		end

	set_then_expression (a_then_expression: XM_XPATH_EXPRESSION) is
			-- Set `then_expression'.
		require
			then_not_void: a_then_expression /= Void
		do
			then_expression := a_then_expression
			adopt_child_expression (then_expression)
		ensure
			then_set: then_expression = a_then_expression
		end

	set_else_expression (an_else_expression: XM_XPATH_EXPRESSION) is
			-- Set `else_expression'.
		require
			else_not_void: an_else_expression /= Void
		do
			else_expression := an_else_expression
			adopt_child_expression (else_expression)
		ensure
			else_set: else_expression = an_else_expression
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
		local
			a_cardinality: INTEGER
		do
			a_cardinality := INTEGER_.bit_or (then_expression.cardinality, else_expression.cardinality)
			if a_cardinality = 0 or a_cardinality > Required_cardinality_zero_or_more then
				set_cardinality_zero_or_more
			else
				set_cardinality (a_cardinality)
			end
		end
	
invariant

	condition_not_void: initialized implies condition /= Void
	else_not_void: initialized implies else_expression /= Void
	then_not_void: initialized implies then_expression /= Void

end

	
