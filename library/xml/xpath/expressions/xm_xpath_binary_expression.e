indexing

	description:

		"XPath Binary Expressions"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_BINARY_EXPRESSION

inherit

	XM_XPATH_COMPUTED_EXPRESSION
		redefine
			promote, simplified_expression, sub_expressions, same_expression
		end

	XM_XPATH_TOKENS

feature {NONE} -- Initialization

	make (an_operand_one: XM_XPATH_EXPRESSION; a_token: INTEGER; an_operand_two: XM_XPATH_EXPRESSION) is
			-- Establish invariant
		require
			operand_1_not_void: an_operand_one /= Void
			operand_2_not_void: an_operand_two /= Void
			-- TODO: is_binary_op?
		do
			operator := a_token
			set_first_operand (an_operand_one)
			set_second_operand (an_operand_two)
			compute_static_properties
			initialize
		ensure
			operator_set: operator = a_token
			operand_1_set: first_operand /= Void and then first_operand.same_expression (an_operand_one)
			operand_2_set: second_operand /= Void and then second_operand.same_expression (an_operand_two)
			static_properties_computed: are_static_properties_computed
		end

feature -- Access

	operator: INTEGER
			-- The operation, as a token number

	first_operand, second_operand: XM_XPATH_EXPRESSION
			-- The two operands

	sub_expressions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION] is
			-- Immediate sub-expressions of `Current'
		do
			create Result.make (2)
			Result.set_equality_tester (expression_tester)
			Result.put (first_operand, 1)
			Result.put (second_operand, 2)
		end

feature -- Comparison

	same_expression (other: XM_XPATH_EXPRESSION): BOOLEAN is
			-- Are `Current' and `other' the same expression?
		local
			other_binary: XM_XPATH_BINARY_EXPRESSION
		do
			other_binary ?= other
			if other_binary /= Void then
				if operator = other_binary.operator then
					if first_operand.same_expression (other_binary.first_operand)
						and then second_operand.same_expression ( other_binary.second_operand) then
						Result := True
					elseif is_commutative (operator) and then
						first_operand.same_expression ( other_binary.second_operand)
							and then second_operand.same_expression ( other_binary.first_operand) then
							Result := True
							-- TODO: recognize associative operators (A|(B|C)) == ((A|B)|C)
							--    and inverse operators (A<B) == (B>A)
					end
				end
			end
		end

feature -- Status report

	is_commutative (an_operator: INTEGER): BOOLEAN is
			-- Is `an_operator' a commutative operator?
		do
			Result := an_operator = And_token
				or else an_operator = Or_token
				or else an_operator = Union_token
				or else an_operator = Intersect_token
				or else an_operator = Plus_token
				or else an_operator = Multiply_token
				or else an_operator = Equals_token
				or else an_operator = Fortran_equal_token
				or else an_operator = Not_equal_token
				or else an_operator = Fortran_not_equal_token
		end

	display (a_level: INTEGER) is
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indentation (a_level), "operator ")
			a_string := STRING_.appended_string (a_string, display_operator)
			std.error.put_string (a_string)
			if is_error then
				std.error.put_string (" in error%N")
			else
				std.error.put_new_line
				first_operand.display (a_level + 1)
				second_operand.display (a_level + 1)
			end
		end

feature -- Optimization	

	simplified_expression: XM_XPATH_EXPRESSION is
			-- Simplified expression as a result of context-independent static optimizations
		local
			a_binary_expression: XM_XPATH_BINARY_EXPRESSION
		do
			a_binary_expression := clone (Current)
			a_binary_expression.set_first_operand (first_operand.simplified_expression)
			if a_binary_expression.first_operand.is_error then
				a_binary_expression.set_last_error (a_binary_expression.first_operand.error_value)
			end

			if not a_binary_expression.is_error then
				a_binary_expression.set_second_operand (second_operand.simplified_expression)
				if a_binary_expression.second_operand.is_error then
					a_binary_expression.set_last_error (a_binary_expression.second_operand.error_value)
				end
			end
			Result := a_binary_expression
		end

	analyze (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Perform static analysis of an expression and its subexpressions
		local
			a_value, another_value: XM_XPATH_VALUE
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

					-- If both operands are known, [[and result is a singleton??]], pre-evaluate the expression

					a_value ?= first_operand; another_value ?= second_operand
					if a_value /= Void and then another_value /= Void then
						eagerly_evaluate (Void)
						set_replacement (last_evaluation)
					end
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
				if an_offer.action = Unordered then
					first_operand.promote (an_offer)
					if first_operand.was_expression_replaced then set_first_operand (first_operand.replacement_expression) end
					second_operand.promote (an_offer)
					if second_operand.was_expression_replaced then set_second_operand (second_operand.replacement_expression) end
				end
			end
		end

feature -- Element change

	set_first_operand (an_operand: XM_XPATH_EXPRESSION) is
			-- Set `first_operand'.
		require
			operand_not_void: an_operand /= Void
		do
			first_operand := an_operand
			if first_operand.was_expression_replaced then first_operand.mark_unreplaced end
		ensure
			first_operand_set: first_operand = an_operand
			first_operand_not_marked_for_replacement: not first_operand.was_expression_replaced
		end

	set_second_operand (an_operand: XM_XPATH_EXPRESSION) is
			-- Set `second_operand'.
		require
			operand_not_void: an_operand /= Void
		do
			second_operand := an_operand
			if second_operand.was_expression_replaced then second_operand.mark_unreplaced end
		ensure
			second_operand_set: second_operand = an_operand
			second_operand_not_marked_for_replacement: not second_operand.was_expression_replaced
		end

feature {NONE} -- Implementation

	compute_cardinality is
			-- Compute cardinality.
		do
			create cardinalities.make (1, 3) -- All False
			cardinalities.put (True, 1)
			cardinalities.put (True, 2)
			are_cardinalities_computed := True
		end

	display_operator: STRING is
			-- Format `operator' for display
		do
			Result := token_name (operator)
		ensure
			display_operator_not_void: Result /= Void
		end

invariant

	first_operand: first_operand /= Void
	second_operand: second_operand /= Void

end
	
