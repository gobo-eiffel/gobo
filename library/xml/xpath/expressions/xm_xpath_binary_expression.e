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
			promote, simplify, sub_expressions, same_expression
		end

	XM_XPATH_TOKENS

feature {NONE} -- Initialization

	make (an_operand_one: XM_XPATH_EXPRESSION; token: INTEGER; an_operand_two: XM_XPATH_EXPRESSION) is
			-- Establish invariant
		require
			operand_1_not_void: an_operand_one /= Void
			operand_2_not_void: an_operand_two /= Void
			-- TODO: is_binary_op?
		do
			operator := token
			create operands.make (1,2)
			operands.put (an_operand_one, 1)
			operands.put (an_operand_two, 2)
		ensure
			operator_set: operator = token
			operand_1_set: operands /= Void and then operands.item (1).same_expression (an_operand_one)
			operand_2_set: operands.item (2).same_expression (an_operand_two)
		end

feature -- Access

	operator: INTEGER
			-- The operation, as a token number

	operands: ARRAY [XM_XPATH_EXPRESSION]
			-- The two operands

	sub_expressions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION] is
			-- Immediate sub-expressions of `Current'
		do
			create Result.make (2)
			Result.set_equality_tester (expression_tester)
			Result.put (operands.item (1), 1)
			Result.put (operands.item (2), 2)
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
					if operands.item (1).same_expression (other_binary.operands.item (1))
						and then operands.item (2).same_expression ( other_binary.operands.item (2)) then
						Result := True
					elseif is_commutative (operator) and then
						operands.item (1).same_expression ( other_binary.operands.item (2))
							and then operands.item (2).same_expression ( other_binary.operands.item (1)) then
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

	display (a_level: INTEGER; a_pool: XM_XPATH_NAME_POOL) is
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indent (a_level), "operator ")
			a_string := STRING_.appended_string (a_string, display_operator)
			std.error.put_string (a_string)
			std.error.put_new_line
			operands.item (1).display (a_level + 1, a_pool)
			operands.item (2).display (a_level + 1, a_pool)
		end

feature -- Optimization	

	simplify: XM_XPATH_EXPRESSION is
			-- Simplify an expression
		local
			a_binary_expression: XM_XPATH_BINARY_EXPRESSION
		do
			a_binary_expression := clone (Current)
			a_binary_expression.operands.put (operands.item (1).simplify, 1)
			a_binary_expression.operands.put (operands.item (2).simplify, 2)
			Result := a_binary_expression
		end

	analyze (a_context: XM_XPATH_STATIC_CONTEXT): XM_XPATH_EXPRESSION is
			-- Perform static analysis of an expression and its subexpressions
		do
			-- TODO
		end
	
	promote (an_offer: XM_XPATH_PROMOTION_OFFER): XM_XPATH_EXPRESSION is
			-- Offer promotion for this subexpression
		do
			-- TODO
		end

feature {NONE} -- Implementation

	compute_cardinality is
			-- Compute cardinality.
		do
			create cardinalities.make (1, 3) -- All False
			cardinalities.put (True, 1)
			cardinalities.put (True, 2)
		end

	display_operator: STRING is
			-- Format `operator' for display
		do
			Result := token_name (operator)
		ensure
			display_operator_not_void: Result /= Void
		end

invariant

	two_operands: operands /= Void and then operands.count = 2
	static_type_error: is_static_type_error implies internal_last_static_type_error /= Void and then internal_last_static_type_error.count > 0

end
	
