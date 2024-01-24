note

	description:

		"XPath Binary Expressions"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004-2015, Colin Adams and others"
	license: "MIT License"

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

	make (a_operand_one: XM_XPATH_EXPRESSION; a_token: INTEGER; a_operand_two: XM_XPATH_EXPRESSION)
			-- Establish invariant
		require
			operand_1_not_void: a_operand_one /= Void
			operand_2_not_void: a_operand_two /= Void
			valid_operator: is_valid_operator (a_token)
		do
			operator := a_token
				-- Make the compiler happy in void-safe mode by setting
				-- `second_operand' before calling `set_first_operand'.
			second_operand := a_operand_two
			set_first_operand (a_operand_one)
			set_second_operand (a_operand_two)
			adopt_child_expression (a_operand_one)
			adopt_child_expression (a_operand_two)
			compute_static_properties
		ensure
			operator_set: operator = a_token
			operand_1_set: first_operand /= Void
			operand_2_set: second_operand /= Void
			same_operands: (first_operand.same_expression (a_operand_one) and second_operand.same_expression (a_operand_two))
								or (first_operand.same_expression (a_operand_two) and second_operand.same_expression (a_operand_one))
			static_properties_computed: are_static_properties_computed
		end

feature -- Access

	operator: INTEGER
			-- The operation, as a token number

	first_operand, second_operand: XM_XPATH_EXPRESSION
			-- The two operands

	is_binary_expression: BOOLEAN
			-- Is `Current' a binary expression?
		do
			Result := True
		end

	as_binary_expression: XM_XPATH_BINARY_EXPRESSION
			-- `Current' seen as a binary expression
		do
			Result := Current
		end

	sub_expressions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]
			-- Immediate sub-expressions of `Current'
		do
			create Result.make (2)
			Result.set_equality_tester (expression_tester)
			Result.put (first_operand, 1)
			Result.put (second_operand, 2)
		end

feature -- Comparison

	same_expression (other: XM_XPATH_EXPRESSION): BOOLEAN
			-- Are `Current' and `other' the same expression?
		local
			other_binary: XM_XPATH_BINARY_EXPRESSION
		do
			if other.is_binary_expression then
				other_binary := other.as_binary_expression
				if operator = other_binary.operator then
					if first_operand.same_expression (other_binary.first_operand)
						and second_operand.same_expression ( other_binary.second_operand) then
						Result := True
					elseif is_commutative (operator) and
						first_operand.same_expression ( other_binary.second_operand)
							and second_operand.same_expression ( other_binary.first_operand) then
							Result := True
							-- TODO: recognize associative operators (A|(B|C)) == ((A|B)|C)
							-- TODO: hang-on! What is the purpose of same expression, after all?
					end
				end
			end
		end

feature -- Status report

	is_valid_operator (a_operator: INTEGER): BOOLEAN
			-- Is `a_operator' valid for `Current'?
		do
			Result := True
		end

	is_commutative (an_operator: INTEGER): BOOLEAN
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

	display (a_level: INTEGER)
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

	simplify (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION])
			-- Perform context-independent static optimizations
		local
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			create l_replacement.make (Void)
			first_operand.simplify (l_replacement)
			check postcondition_of_simplify: attached l_replacement.item as l_replacement_item then
				if l_replacement_item.is_error then
					set_replacement (a_replacement, l_replacement_item)
				else
					set_first_operand (l_replacement_item)
				end

				if not l_replacement_item.is_error then
					l_replacement.put (Void)
					second_operand.simplify (l_replacement)
					check postcondition_of_simplify: attached l_replacement.item as l_replacement_item_2 then
						if l_replacement_item_2.is_error then
							set_replacement (a_replacement, l_replacement_item_2)
						else
							set_second_operand (l_replacement_item_2)
							a_replacement.put (Current)
						end
					end
				end
			end
		end

	check_static_type (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: detachable XM_XPATH_ITEM_TYPE)
			-- Perform static type-checking of `Current' and its subexpressions.
		local
			l_result: DS_CELL [detachable XM_XPATH_ITEM]
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			create l_replacement.make (Void)
			first_operand.check_static_type (l_replacement, a_context, a_context_item_type)
			check postcondition_of_check_static_type: attached l_replacement.item as l_replacement_item then
				if l_replacement_item.is_error then
					set_replacement (a_replacement, l_replacement_item)
				else
					set_first_operand (l_replacement_item)
					l_replacement.put (Void)
					second_operand.check_static_type (l_replacement, a_context, a_context_item_type)
					check postcondition_of_check_static_type: attached l_replacement.item as l_replacement_item_2 then
						if l_replacement_item_2.is_error then
							set_replacement (a_replacement, l_replacement_item_2)
						else
							set_second_operand (l_replacement_item_2)

							-- If both operands are known, [[and result is a singleton??]], pre-evaluate the expression

							if first_operand.is_value and not first_operand.depends_upon_implicit_timezone
								and second_operand.is_value and not second_operand.depends_upon_implicit_timezone
								and not cardinality_allows_many then
								create l_result.make (Void)
								evaluate_item (l_result, a_context.new_compile_time_context)
								if not attached l_result.item as l_result_item or else not l_result_item.is_error then
									check there_is_a_bug_here: attached l_result.item as l_result_item then
										if l_result_item.is_node then
											set_replacement (a_replacement, create {XM_XPATH_SINGLETON_NODE}.make (l_result_item.as_node))
										else
											set_replacement (a_replacement, l_result_item.as_atomic_value)
										end
									end
								else
									if is_error then
										-- the value might not be needed at runtime
										error_value := Void
									end
									a_replacement.put (Current)
								end
							else
								a_replacement.put (Current)
							end
						end
					end
				end
			end
		end

	optimize (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: detachable XM_XPATH_ITEM_TYPE)
			-- Perform optimization of `Current' and its subexpressions.
		local
			l_result: DS_CELL [detachable XM_XPATH_ITEM]
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			create l_replacement.make (Void)
			first_operand.optimize (l_replacement, a_context, a_context_item_type)
			check postcondition_of_optimize: attached l_replacement.item as l_replacement_item then
				if l_replacement_item.is_error then
					set_replacement (a_replacement, l_replacement_item)
				else
					set_first_operand (l_replacement_item)
					l_replacement.put (Void)
					second_operand.optimize (l_replacement, a_context, a_context_item_type)
					check postcondition_of_optimize: attached l_replacement.item as l_replacement_item_2 then
						if l_replacement_item_2.is_error then
							set_replacement (a_replacement, l_replacement_item_2)
						else
							set_second_operand (l_replacement_item_2)

							-- If both operands are known, [[and result is a singleton??]], pre-evaluate the expression

							if first_operand.is_value and not first_operand.depends_upon_implicit_timezone
								and second_operand.is_value and not second_operand.depends_upon_implicit_timezone
								and not cardinality_allows_many then
								create l_result.make (Void)
								evaluate_item (l_result, a_context.new_compile_time_context)
								if attached l_result.item as l_result_item and then not l_result_item.is_error then
									-- the value might not be needed at runtime
									if l_result_item.is_node then
										set_replacement (a_replacement, create {XM_XPATH_SINGLETON_NODE}.make (l_result_item.as_node))
									else
										set_replacement (a_replacement, l_result_item.as_atomic_value)
									end
								else
									a_replacement.put (Current)
								end
							else
								a_replacement.put (Current)
							end
						end
					end
				end
			end
		end

	promote (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_offer: XM_XPATH_PROMOTION_OFFER)
			-- Promote this subexpression.
		local
			l_promotion: detachable XM_XPATH_EXPRESSION
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			a_offer.accept (Current)
			l_promotion := a_offer.accepted_expression
			if l_promotion /= Void then
				set_replacement (a_replacement, l_promotion)
			elseif a_offer.action /= Unordered then
				create l_replacement.make (Void)
				first_operand.promote (l_replacement, a_offer)
				check postcondition_of_promote: attached l_replacement.item as l_replacement_item then
					if first_operand /= l_replacement_item then
						set_first_operand (l_replacement_item)
						reset_static_properties
					end
				end
				l_replacement.put (Void)
				second_operand.promote (l_replacement, a_offer)
				check postcondition_of_promote: attached l_replacement.item as l_replacement_item then
					if second_operand /= l_replacement_item then
						set_second_operand (l_replacement_item)
						reset_static_properties
					end
				end
			end
			if a_replacement.item = Void then
				a_replacement.put (Current)
			end
		end

feature -- Element change

	set_first_operand (a_operand: XM_XPATH_EXPRESSION)
			-- Set `first_operand'.
		require
			a_operand_not_void: a_operand /= Void
		do
			first_operand := a_operand
			if not first_operand.is_error then
				adopt_child_expression (first_operand)
			end
		ensure
			first_operand_set: first_operand = a_operand
		end

	set_second_operand (a_operand: XM_XPATH_EXPRESSION)
			-- Set `second_operand'.
		require
			a_operand_not_void: a_operand /= Void
		do
			second_operand := a_operand
			if not second_operand.is_error then
				adopt_child_expression (second_operand)
			end
		ensure
			second_operand_set: second_operand = a_operand
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality
			-- Compute cardinality.
		do
			if first_operand.cardinality_allows_zero and
				second_operand.cardinality_allows_zero then
				set_cardinality_optional
			else
				set_cardinality_exactly_one
			end
		end

	display_operator: STRING
			-- Format `operator' for display
		do
			check attached token_name (operator) as l_token_name then
				Result := l_token_name
			end
		ensure
			display_operator_not_void: Result /= Void
		end

	compute_special_properties
			-- Compute special properties.
		do
			Precursor
			set_non_creating
		end

invariant

	first_operand: initialized implies first_operand /= Void
	second_operand: initialized implies second_operand /= Void

end

