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
			promote, simplify, sub_expressions, same_expression, compute_special_properties,
			is_binary_expression, as_binary_expression
		end

	XM_XPATH_TOKENS
		export {NONE} all end

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
			adopt_child_expression (an_operand_one)
			adopt_child_expression (an_operand_two)
			compute_static_properties
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
	
	is_binary_expression: BOOLEAN is
			-- Is `Current' a binary expression?
		do
			Result := True
		end

	as_binary_expression: XM_XPATH_BINARY_EXPRESSION is
			-- `Current' seen as a binary expression
		do
			Result := Current
		end

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
			if other.is_binary_expression then
				other_binary := other.as_binary_expression
				if operator = other_binary.operator then
					if first_operand.same_expression (other_binary.first_operand)
						and then second_operand.same_expression ( other_binary.second_operand) then
						Result := True
					elseif is_commutative (operator) and then
						first_operand.same_expression ( other_binary.second_operand)
							and then second_operand.same_expression ( other_binary.first_operand) then
							Result := True
							-- TODO: recognize associative operators (A|(B|C)) == ((A|B)|C)
							-- TODO: hang-on! What is the purpose of same expression, after all?
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
			std.error.put_new_line
			first_operand.display (a_level + 1)
			second_operand.display (a_level + 1)
		end

feature -- Optimization	

	simplify is
			-- Perform context-independent static optimizations
		do
			first_operand.simplify
			if first_operand.is_error then
				set_last_error (first_operand.error_value)
			elseif first_operand.was_expression_replaced then
				set_first_operand (first_operand.replacement_expression)
			end

			if not is_error then
				second_operand.simplify
				if second_operand.is_error then
					set_last_error (second_operand.error_value)
				elseif second_operand.was_expression_replaced then
					set_second_operand (second_operand.replacement_expression)
				end
			end
		end


	check_static_type (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Perform static type-checking of `Current' and its subexpressions.
		do
			mark_unreplaced
			first_operand.check_static_type (a_context)
			if first_operand.was_expression_replaced then
				set_first_operand (first_operand.replacement_expression)
			end
			if first_operand.is_error then
				set_last_error (first_operand.error_value)
			else
				second_operand.check_static_type (a_context)
				if second_operand.was_expression_replaced then
					set_second_operand (second_operand.replacement_expression)
				end
				if second_operand.is_error then
					set_last_error (second_operand.error_value)
				else

					-- If both operands are known, [[and result is a singleton??]], pre-evaluate the expression

					if first_operand.is_value and then second_operand.is_value then
						eagerly_evaluate (Void)
						set_replacement (last_evaluation)
					end
				end
			end
		end

	optimize (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Perform optimization of `Current' and its subexpressions.
		do
			mark_unreplaced
			first_operand.optimize (a_context)
			if first_operand.was_expression_replaced then
				set_first_operand (first_operand.replacement_expression)
			end
			if first_operand.is_error then
				set_last_error (first_operand.error_value)
			else
				second_operand.optimize (a_context)
				if second_operand.was_expression_replaced then
					set_second_operand (second_operand.replacement_expression)
				end
				if second_operand.is_error then
					set_last_error (second_operand.error_value)
				else
					
					-- If both operands are known, [[and result is a singleton??]], pre-evaluate the expression
					
					if first_operand.is_value and then second_operand.is_value then
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
			elseif an_offer.action /= Unordered then
				first_operand.promote (an_offer)
				if first_operand.was_expression_replaced then set_first_operand (first_operand.replacement_expression) end
				second_operand.promote (an_offer)
				if second_operand.was_expression_replaced then set_second_operand (second_operand.replacement_expression) end
			end
		end

feature -- Element change

	set_first_operand (an_operand: XM_XPATH_EXPRESSION) is
			-- Set `first_operand'.
		require
			operand_not_marked_for_replacement: an_operand /= Void and then not an_operand.was_expression_replaced
		do
			first_operand := an_operand
			if not first_operand.is_error then first_operand.mark_unreplaced end
			adopt_child_expression (first_operand)
		ensure
			first_operand_set: first_operand = an_operand
			first_operand_not_replaced: not first_operand.was_expression_replaced
		end

	set_second_operand (an_operand: XM_XPATH_EXPRESSION) is
			-- Set `second_operand'.
		require
			operand_not_marked_for_replacement: an_operand /= Void and then not an_operand.was_expression_replaced
		do
			second_operand := an_operand
			if not second_operand.is_error then second_operand.mark_unreplaced end
			adopt_child_expression (second_operand)
		ensure
			second_operand_set: second_operand = an_operand
			second_operand_not_replaced: not second_operand.was_expression_replaced
		end

feature {XM_XSLT_EXPRESSION} -- Restricted

	compute_cardinality is
			-- Compute cardinality.
		do
			if first_operand.cardinality_allows_zero and then
				second_operand.cardinality_allows_zero then
				set_cardinality_optional
			else
				set_cardinality_exactly_one
			end
		end

	display_operator: STRING is
			-- Format `operator' for display
		do
			Result := token_name (operator)
		ensure
			display_operator_not_void: Result /= Void
		end

	compute_special_properties is
			-- Compute special properties.
		do
			Precursor
			set_non_creating
		end

invariant

	first_operand: initialized implies first_operand /= Void
	second_operand: initialized implies second_operand /= Void

end
	
