indexing

	description:

		"XPath general comparisons"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_GENERAL_COMPARISON

inherit

	XM_XPATH_BINARY_EXPRESSION
		rename
			make as make_binary_expression
		redefine
			display_operator, evaluate_item, analyze, effective_boolean_value
		end

	XM_XPATH_CARDINALITY

	XM_XPATH_ROLE
	
	XM_XPATH_COMPARISON_ROUTINES

creation

	make

feature {NONE} -- Initialization

	make (an_operand_one: XM_XPATH_EXPRESSION; a_token: INTEGER; an_operand_two: XM_XPATH_EXPRESSION; a_collator: ST_COLLATOR) is
			-- Establish invariant
		require
			operand_1_not_void: an_operand_one /= Void
			operand_2_not_void: an_operand_two /= Void
			general_comparison_operator: is_general_comparison_operator (a_token)
		do
			make_binary_expression (an_operand_one, a_token, an_operand_two)
			create atomic_comparer.make (a_collator)
		ensure
			operator_set: operator = a_token
			operand_1_set: operands /= Void and then operands.item (1).same_expression (an_operand_one)
			operand_2_set: operands.item (2).same_expression (an_operand_two)
		end

feature -- Access

		item_type: INTEGER is
			--Determine the data type of the expression, if possible
		do
			Result := Boolean_type
		end
	
feature -- Optimization	

	analyze (a_context: XM_XPATH_STATIC_CONTEXT): XM_XPATH_EXPRESSION is
			-- Perform static analysis of an expression and its subexpressions
		local
			an_expression, first_operand, second_operand: XM_XPATH_EXPRESSION
			a_result_expression: XM_XPATH_GENERAL_COMPARISON
			an_atomic_type, a_numeric_type: XM_XPATH_SEQUENCE_TYPE
			a_role, another_role: XM_XPATH_ROLE_LOCATOR
			a_type, another_type: INTEGER
			a_message: STRING
			a_singleton_comparison: XM_XPATH_SINGLETON_COMPARISON
			a_general_comparison: XM_XPATH_GENERAL_COMPARISON
			a_range_expression: XM_XPATH_RANGE_EXPRESSION
			an_integer_value, another_integer_value: XM_XPATH_INTEGER_VALUE
			a_position: XM_XPATH_POSITION
			a_value, another_value: XM_XPATH_VALUE
			a_minimax_comparison: XM_XPATH_MINIMAX_COMPARISON
			a_type_checker: XM_XPATH_TYPE_CHECKER
		do
			create a_type_checker
			is_backwards_compatible_mode := a_context.is_backwards_compatible_mode
			a_result_expression := clone (Current)
				check
					first_operand_may_be_analyzed: operands.item (1).may_analyze and then not operands.item (1).analyzed
					second_operand_may_be_analyzed: operands.item (2).may_analyze and then not operands.item (2).analyzed

					-- Analysis proceeds top-down through the sub-expressions

				end

			if operands.item (1).may_analyze then
				an_expression := operands.item (1).analyze (a_context)
			else
				an_expression := operands.item (1)
			end
			if not an_expression.is_error then
				a_result_expression.operands.put (an_expression.unsorted (False), 1)
				
				if operands.item (2).may_analyze then
					an_expression := operands.item (2).analyze (a_context)
				else
					an_expression := operands.item (2)
				end
				if not an_expression.is_error then
					a_result_expression.operands.put (an_expression.unsorted (False), 2)

					--	Check for compatibility with XPath 1.0 rules

					if is_backwards_compatible_mode then
						issue_warnings (operands.item (1).item_type, operands.item (2).item_type, a_context)
					end

					create an_atomic_type.make (Atomic_type, Required_cardinality_zero_or_more)
					create a_role.make (Binary_expression_role, token_name (operator), 1)
					an_expression := a_type_checker.static_type_check (a_result_expression.operands.item (1), an_atomic_type, False, a_role)
					if an_expression = Void then
							check
								static_type_error: a_type_checker.is_static_type_check_error
							end
						a_result_expression.set_last_error_from_string (a_type_checker.static_type_check_error_message, 4, Type_error)
					else
						a_result_expression.operands.put (an_expression, 1)

						create another_role.make (Binary_expression_role, token_name (operator), 2)
						an_expression := a_type_checker.static_type_check (a_result_expression.operands.item (2), an_atomic_type, False, another_role)
						if an_expression = Void then
								check
									static_type_error: a_type_checker.is_static_type_check_error
								end
							a_result_expression.set_last_error_from_string (a_type_checker.static_type_check_error_message, 4, Type_error)
						else
							a_result_expression.operands.put (an_expression, 2)

							a_type := a_result_expression.operands.item (1).item_type
							another_type := a_result_expression.operands.item (2).item_type
							if not is_backwards_compatible_mode then
								if not (a_type = Atomic_type or else a_type = Untyped_atomic_type
										  or else another_type = Atomic_type or else another_type = Untyped_atomic_type) then
									if primitive_type (a_type) /= primitive_type (another_type) then
										a_message := STRING_.appended_string ("Cannot compare ", type_name (a_type))
										a_message := STRING_.appended_string (a_message, " with ")
										a_message := STRING_.appended_string (a_message, type_name (another_type))
										a_result_expression.set_last_error_from_string (a_message, 4, Type_error)
									end
								end
							end
							if not a_result_expression.is_error then
								first_operand := a_result_expression.operands.item (1)
								second_operand := a_result_expression.operands.item (2)
									
								if (a_type = another_type or else not is_backwards_compatible_mode)
									and then first_operand.cardinality_exactly_one
									and then second_operand.cardinality_exactly_one then

									-- Use a value comparison if both arguments are singletons

									if a_type = Untyped_atomic_type then
										if another_type = Untyped_atomic_type then
											create {XM_XPATH_CAST_EXPRESSION} first_operand.make (first_operand, String_type, False)
											create {XM_XPATH_CAST_EXPRESSION} second_operand.make (second_operand, String_type, False)
										elseif is_sub_type (another_type, Number_type) then
											create {XM_XPATH_CAST_EXPRESSION} first_operand.make (first_operand, Double_type, False)
										else
											create {XM_XPATH_CAST_EXPRESSION} first_operand.make (second_operand, another_type, False)
										end
									elseif another_type = Untyped_atomic_type then
										if is_sub_type (a_type, Number_type) then
											create {XM_XPATH_CAST_EXPRESSION} second_operand.make (second_operand, Double_type, False)
										else
											create {XM_XPATH_CAST_EXPRESSION} second_operand.make (second_operand, a_type, False)
										end	
									end

									create {XM_XPATH_VALUE_COMPARISON} an_expression.make (first_operand, singleton_value_operator (operator), second_operand, atomic_comparer.collator)
									an_expression := an_expression.simplify
									if not an_expression.is_error and an_expression.may_analyze then
										an_expression := an_expression.analyze (a_context)
										Result := an_expression
									else
										Result := an_expression
									end
									
								else -- one or both arguments are not singletons

									-- Check if neither argument allows a sequence of >1

									if	not first_operand.cardinality_allows_many and not second_operand.cardinality_allows_many then

										create a_singleton_comparison.make (first_operand, singleton_value_operator (operator), second_operand, atomic_comparer.collator)
										Result := a_singleton_comparison.analyze (a_context)
										
									elseif not first_operand.cardinality_allows_many then

										-- If first argument is a singleton, reverse the arguments

										create a_general_comparison.make (second_operand, inverse_operator (operator), first_operand, atomic_comparer.collator)
										Result := a_general_comparison.analyze (a_context)

									else

										-- Look for (N to M = I)

										a_range_expression ?= first_operand
										if a_range_expression /= Void and then is_sub_type (second_operand.item_type, Integer_type)
											and then not second_operand.cardinality_allows_many then
											an_integer_value ?= a_range_expression.lower_bound
											another_integer_value ?= a_range_expression.upper_bound
											a_position ?= second_operand
											if an_integer_value /= Void and then another_integer_value /= Void and then a_position /= Void then
												create {XM_XPATH_POSITION_RANGE} Result.make (an_integer_value.value, another_integer_value.value)
											else
												create {XM_XPATH_INTEGER_RANGE_TEST} Result.make (second_operand, a_range_expression.lower_bound, a_range_expression.upper_bound)
											end

										else

											-- If the operator is gt, ge, lt, le then replace X < Y by min(X) < max(Y)

											-- This optimization is done only in the case where at least one of the
											-- sequences is known to be purely numeric. It isn't safe if both sequences
											-- contain untyped atomic values, because in that case, the type of the
											-- comparison isn't known in advance. For example [(1, U1) < ("fred", U2)]
											-- involves both string and numeric comparisons.

											if operator /= Equals_token and then operator /= Not_equal_token
												and then (is_sub_type (a_type, Number_type)
															 or else is_sub_type (another_type, Number_type)) then
												if not is_sub_type (a_type, Number_type) then
													create a_numeric_type.make_numeric_sequence
													create a_role.make (Binary_expression_role, token_name (operator), 1)
													first_operand := a_type_checker.static_type_check (first_operand, a_numeric_type, is_backwards_compatible_mode, a_role)
													if first_operand = Void then
															check
																static_type_error: a_type_checker.is_static_type_check_error
															end
														first_operand.set_last_error_from_string (a_type_checker.static_type_check_error_message, 4, Type_error)
														Result := first_operand -- Any expression with the correct error message will do
													else
														if not is_sub_type (another_type, Number_type) then
															create another_role.make (Binary_expression_role, token_name (operator), 2)
															second_operand := a_type_checker.static_type_check (second_operand, a_numeric_type, is_backwards_compatible_mode, another_role)
															if second_operand = Void then
																	check
																		static_type_error: a_type_checker.is_static_type_check_error
																	end
																second_operand.set_last_error_from_string (a_type_checker.static_type_check_error_message, 4, Type_error)
																Result := second_operand -- Any expression with the correct error message will do
															else
																create a_minimax_comparison.make (first_operand, operator, second_operand)
																Result := a_minimax_comparison.analyze (a_context)
															end
														end
													end
												end
											else

												-- Evaluate the expression now if both arguments are constant

												a_value ?= first_operand
												another_value ?= second_operand
												if a_value /= Void and then another_value /= Void then
													a_result_expression.operands.put (first_operand, 1)
													a_result_expression.operands.put (second_operand, 2)
													Result := a_result_expression.evaluate_item (Void).as_value
												end
											end
										end
									end
								end
							end
						end
					end
				else
					a_result_expression.set_last_error (an_expression.last_error)
				end
			else
				a_result_expression.set_last_error (an_expression.last_error)
			end
			if Result = Void then Result := a_result_expression end
			if not Result.analyzed then Result.set_analyzed end
		end

feature -- Evaluation

	effective_boolean_value (a_context: XM_XPATH_CONTEXT): XM_XPATH_BOOLEAN_VALUE is
			-- Effective boolean value
		local
			an_iterator, another_iterator, a_third_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			a_sequence_extent: XM_XPATH_SEQUENCE_EXTENT
			an_atomic_value, another_atomic_value: XM_XPATH_ATOMIC_VALUE
			a_count: INTEGER
			finished: BOOLEAN
			a_comparison_checker: XM_XPATH_COMPARISON_CHECKER
		do
			an_iterator := operands.item (1).iterator (a_context)
			another_iterator := operands.item (2).iterator (a_context)

			-- The second operand is more likely to be a singleton than the first so:
			
			create a_sequence_extent.make (another_iterator)
			a_count := a_sequence_extent.count
			if a_count = 0 then
				create Result.make (False)
			elseif a_count = 1 then
				another_atomic_value ?= a_sequence_extent.item_at (1)
				if another_atomic_value = Void then
					set_last_error_from_string ("Atomization failed for second operand of general comparison", 6, Type_error)
				end
				from
					an_iterator.forth
				until
					finished or else is_error or else an_iterator.after
				loop
					an_atomic_value ?= an_iterator.item_for_iteration
					if an_atomic_value = Void then
						set_last_error_from_string ("Atomization failed for first operand of general comparison", 6, Type_error)
					else
						create a_comparison_checker
						a_comparison_checker.check_correct_general_relation (an_atomic_value, singleton_value_operator (operator), atomic_comparer, another_atomic_value, is_backwards_compatible_mode)
						if a_comparison_checker.is_comparison_type_error then
							set_last_error (a_comparison_checker.last_type_error)
						elseif a_comparison_checker.last_check_result then
							create Result.make (True)
							finished := True
						end
					end
					an_iterator.forth
				end
			else -- a_count > 1 - so nested loop comparison
				from
					an_iterator.forth
				until
					finished or else is_error or else an_iterator.after
				loop
					an_atomic_value ?= an_iterator.item_for_iteration
					if an_atomic_value = Void then
						set_last_error_from_string ("Atomization failed for first operand of general comparison", 6, Type_error)
					else
						from
							a_third_iterator := a_sequence_extent.iterator (Void)
							a_third_iterator.forth
						until
							finished or else a_third_iterator.after
						loop
							another_atomic_value ?= a_third_iterator.item_for_iteration
							if another_atomic_value = Void then
								set_last_error_from_string ("Atomization failed for second operand of general comparison", 6, Type_error)
							else
								create a_comparison_checker
								a_comparison_checker.check_correct_general_relation (an_atomic_value, singleton_value_operator (operator), atomic_comparer, another_atomic_value, is_backwards_compatible_mode)
								if a_comparison_checker.is_comparison_type_error then
									set_last_error (a_comparison_checker.last_type_error)
								elseif a_comparison_checker.last_check_result then
									create Result.make (True)
									finished := True
								end
							end
							a_third_iterator.forth
						end
					end
					an_iterator.forth
				end
			end
			if Result = Void then create Result.make (False) end
		end

	evaluate_item (a_context: XM_XPATH_CONTEXT): XM_XPATH_ITEM is
			-- Evaluate `Current' as a single item
		do
			Result := effective_boolean_value (a_context)
		end

feature {NONE} -- Implementation

	is_backwards_compatible_mode: BOOLEAN
			-- Are we in XPath 1.0 compatibility mode?

	atomic_comparer: XM_XPATH_ATOMIC_COMPARER
			-- Comparer for atomic values

	display_operator: STRING is
			-- Format `operator' for display
		do
			Result := STRING_.appended_string ("many-to-many ", Precursor)
		end

	issue_warnings (a_type, another_type: INTEGER a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Issue warnings about backwards compatibility.
		require
			context_not_void: a_context /= Void
		do
			if is_sub_type (a_type, Any_node) and then is_sub_type (another_type, Boolean_type) then
				a_context.issue_warning ("Comparison of a node-set to a boolean has changed since XPath 1.0")
			elseif is_sub_type (a_type, Boolean_type) and then is_sub_type (another_type, Any_node) then
				a_context.issue_warning ("Comparison of a boolean to a node-set has changed since XPath 1.0")
			elseif (is_sub_type (a_type, Any_node) or else is_sub_type (a_type, String_type))
				and then (is_sub_type (another_type, Any_node) or else is_sub_type (another_type, String_type))
				and then (operator = Less_than_token or else operator = Less_equal_token
							 or else operator = Greater_than_token or else operator = Greater_equal_token)
			then
				a_context.issue_warning ("Less-than and greater-than comparisons between strings have changed since XPath 1.0")
			end
		end

invariant

	general_comparison: is_general_comparison_operator (operator)
	atomic_comparer_not_void: atomic_comparer /= Void

end
	
