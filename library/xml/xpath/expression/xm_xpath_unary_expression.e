indexing

	description:

		"XPath Unary Expressions"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_UNARY_EXPRESSION

inherit

	XM_XPATH_COMPUTED_EXPRESSION
		redefine
			sub_expressions, same_expression, simplify, promote, compute_special_properties,
			is_unary_expression, as_unary_expression, processed_eager_evaluation
		end

feature {NONE} -- Initialization

	make_unary (an_operand: XM_XPATH_EXPRESSION) is
			-- Establish invariant
		require
			operand_not_void: an_operand /= Void
		do
			base_expression := an_operand
			adopt_child_expression (base_expression)
			initialized := True
		ensure
			base_expression_set: base_expression /= Void and then base_expression.same_expression (an_operand)
		end

feature -- Access

	base_expression: XM_XPATH_EXPRESSION
			-- Base_Expression

	is_unary_expression: BOOLEAN is
			-- Is `Current' a unary expression?
		do
			Result := True
		end

	as_unary_expression: XM_XPATH_UNARY_EXPRESSION is
			-- `Current' seen as a unary expression
		do
			Result := Current
		end

	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, when known
		do
			Result := base_expression.item_type
		end

	sub_expressions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION] is
			-- Immediate sub-expressions of `Current'
		do
			create Result.make (1)
			Result.set_equality_tester (expression_tester)
			Result.put (base_expression, 1)
		end

feature -- Comparison

	same_expression (other: XM_XPATH_EXPRESSION): BOOLEAN is
			-- Are `Current' and `other' the same expression?
		do
			if other.is_unary_expression then
				Result := base_expression.same_expression (other.as_unary_expression.base_expression)
			end
		end

feature -- Status report

	display (a_level: INTEGER) is
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indentation (a_level), "operator ")
			a_string := STRING_.appended_string (a_string, display_operator)
			std.error.put_string (a_string)
			std.error.put_new_line
			base_expression.display (a_level + 1)
		end
	
feature -- Optimization	

	simplify (a_replacement: DS_CELL [XM_XPATH_EXPRESSION]) is
			-- Perform context-independent static optimizations
		local
			l_replacement: DS_CELL [XM_XPATH_EXPRESSION]
		do
			create l_replacement.make (Void)
			base_expression.simplify (l_replacement)
			set_base_expression (l_replacement.item)
			if base_expression.is_error then
				set_replacement (a_replacement, base_expression)
			else
				a_replacement.put (Current)
			end
		end

	check_static_type (a_replacement: DS_CELL [XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform static type-checking of `Current' and its subexpressions.
		local
			l_replacement: DS_CELL [XM_XPATH_EXPRESSION]
		do
			create l_replacement.make (Void)
			base_expression.check_static_type (l_replacement, a_context, a_context_item_type)
			set_base_expression (l_replacement.item)
			if base_expression.is_error then
				set_replacement (a_replacement, base_expression)
			else

				-- If operand is a value, pre-evaluate the expression

				if base_expression.is_value and not base_expression.depends_upon_implicit_timezone then
					create_iterator (a_context.new_compile_time_context)
					expression_factory.create_sequence_extent (last_iterator)
					
					-- if early evaluation fails, suppress the error: the value might not be needed at run-time
					
					if is_error or expression_factory.last_created_closure.is_error then
						error_value := Void
						if base_expression.is_error then
							base_expression.clear_error
						end
						a_replacement.put (Current)
					else
						set_replacement (a_replacement, expression_factory.last_created_closure)
					end
				else
					a_replacement.put (Current)
				end
			end
		end

	optimize (a_replacement: DS_CELL [XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform optimization of `Current' and its subexpressions.
		local
			l_replacement: DS_CELL [XM_XPATH_EXPRESSION]
		do
			create l_replacement.make (Void)
			base_expression.optimize (l_replacement, a_context, a_context_item_type)
			set_base_expression (l_replacement.item)
			if base_expression.is_error then
				set_replacement (a_replacement, base_expression)
			else
				
				-- If  operand value is, pre-evaluate the expression
				
				if base_expression.is_value and then not base_expression.depends_upon_implicit_timezone then
					create_iterator (a_context.new_compile_time_context)
					expression_factory.create_sequence_extent (last_iterator)
					
					-- if early evaluation fails, suppress the error: the value might not be needed at run-time
					
					if is_error or expression_factory.last_created_closure.is_error then
						error_value := Void
						if base_expression.is_error then
							base_expression.clear_error
						end
						a_replacement.put (Current)
					else
						set_replacement (a_replacement, expression_factory.last_created_closure)
					end
				else
					a_replacement.put (Current)
				end
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
				base_expression.promote (l_replacement, a_offer)
				set_base_expression (l_replacement.item)
				reset_static_properties
			end
		end

feature -- Evaluation

	processed_eager_evaluation (a_context: XM_XPATH_CONTEXT): XM_XPATH_VALUE is
			-- Eager evaluation via `generate_events'
		do
			Result := base_expression.processed_eager_evaluation (a_context)
		end

feature -- Element change

	set_base_expression (an_operand: XM_XPATH_EXPRESSION) is
			-- Set `base_expression'.
		require
			operand_not_void: an_operand /= Void
		do
			base_expression := an_operand
			adopt_child_expression (base_expression)
		ensure
			base_expression_set: base_expression = an_operand
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinalities (base_expression)
		end

	compute_special_properties is
			-- Compute special properties.
		do
			clone_special_properties (base_expression)
		end

	display_operator: STRING is
			-- Format `operator' for display
		deferred
		ensure
			display_operator_not_void: Result /= Void
		end

invariant

	base_expression: base_expression /= Void

end
	
