indexing

	description:

		"XPath value comparisons"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_VALUE_COMPARISON

inherit

	XM_XPATH_BINARY_EXPRESSION
		rename
			make as make_binary_expression
		redefine
			analyze, evaluated_item, effective_boolean_value
		end

	XM_XPATH_COMPARISON_ROUTINES

	XM_XPATH_SHARED_FUNCTION_FACTORY

	XM_XPATH_ROLE

	KL_SHARED_PLATFORM

creation

	make

feature {NONE} -- Initialization

	make (an_operand_one: XM_XPATH_EXPRESSION; a_token: INTEGER; an_operand_two: XM_XPATH_EXPRESSION; a_collator: ST_COLLATOR) is
			-- Establish invariant
		require
			operand_1_not_void: an_operand_one /= Void
			operand_2_not_void: an_operand_two /= Void
			value_comparison_operator: is_value_comparison_operator (a_token)
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
			-- Perform static analysis of `Current' and its subexpressions
		local
			first_operand, second_operand: XM_XPATH_EXPRESSION
			a_result_expression: XM_XPATH_VALUE_COMPARISON
			an_atomic_type: XM_XPATH_SEQUENCE_TYPE
			a_role, another_role: XM_XPATH_ROLE_LOCATOR
			a_type, another_type, an_integer: INTEGER
			a_count_function: XM_XPATH_COUNT
			an_empty_function: XM_XPATH_EMPTY
			an_exists_function: XM_XPATH_EXISTS
			an_atomic_value: XM_XPATH_ATOMIC_VALUE
			an_integer_value: XM_XPATH_INTEGER_VALUE
			new_arguments: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]
			a_filter_expression: XM_XPATH_FILTER_EXPRESSION
			a_type_checker: XM_XPATH_TYPE_CHECKER
			a_message: STRING
			a_string_length_function: XM_XPATH_STRING_LENGTH
			a_position_function: XM_XPATH_POSITION
			a_last_function: XM_XPATH_LAST
			a_value, another_value: XM_XPATH_VALUE
			a_boolean_value: XM_XPATH_BOOLEAN_VALUE
		do
			a_result_expression := clone (Current)
			create a_type_checker
			if a_result_expression.operands.item(1).may_analyze then
				first_operand := a_result_expression.operands.item(1).analyze (a_context)
			else
				first_operand := a_result_expression.operands.item(1)
			end
			if first_operand.is_error then
				a_result_expression.set_last_error (first_operand.last_error)
			else
				if a_result_expression.operands.item(2).may_analyze then
					second_operand := a_result_expression.operands.item(2).analyze (a_context)
				else
					second_operand := a_result_expression.operands.item(2)
				end
				if second_operand.is_error then
					a_result_expression.set_last_error (second_operand.last_error)
				else
					create an_atomic_type.make (Atomic_type, Required_cardinality_exactly_one)
					create a_role.make (Binary_expression_role, token_name (operator), 1)
					first_operand := a_type_checker.static_type_check (first_operand, an_atomic_type, False, a_role)
					if first_operand = Void then
							check
								static_type_error: a_type_checker.is_static_type_check_error
							end
						a_result_expression.set_last_error_from_string (a_type_checker.static_type_check_error_message, 4, Type_error)
					else
						a_result_expression.operands.put (first_operand, 1)

						create another_role.make (Binary_expression_role, token_name (operator), 2)
						second_operand := a_type_checker.static_type_check (second_operand, an_atomic_type, False, a_role)
						if second_operand = Void then
								check
									static_type_error: a_type_checker.is_static_type_check_error
								end
							a_result_expression.set_last_error_from_string (a_type_checker.static_type_check_error_message, 4, Type_error)
						else
							a_result_expression.operands.put (second_operand, 2)

							a_type := first_operand.item_type
							another_type := second_operand.item_type
						
							if not (a_type = Atomic_type or else a_type = Untyped_atomic_type
									  or else another_type = Atomic_type or else another_type = Untyped_atomic_type) then
								if primitive_type (a_type) /= primitive_type (another_type) then
									a_message := STRING_.appended_string ("Cannot compare ", type_name (a_type))
									a_message := STRING_.appended_string (a_message, " with ")
									a_message := STRING_.appended_string (a_message, type_name (another_type))
									a_result_expression.set_last_error_from_string (a_message, 4, Type_error)
								end
							end

							if not a_result_expression.is_error then

								-- Optimise count(x) eq 0 (or gt 0, ne 0, eq 0, etc).

								a_count_function ?= first_operand
								an_atomic_value ?= second_operand
								if a_count_function /= Void and then an_atomic_value /= Void then
										check
											one_argument: a_count_function.arguments.count = 1
										end

									if is_zero (an_atomic_value) then
										if operator = Fortran_equal_token or else operator = Fortran_less_equal_token then
										
											-- Rewrite count(x)=0 as empty(x).
										
											an_empty_function ?= Function_factory.make_system_function ("empty")
												check
													empty_function: an_empty_function /= Void
												end
											an_empty_function.set_arguments (a_count_function.arguments)
											Result := an_empty_function
										elseif operator = Fortran_not_equal_token or else operator = Fortran_greater_than_token then
										
											-- Rewrite count(x)!=0, count(x)>0 as exists(x)
										
											an_exists_function ?= Function_factory.make_system_function ("exists")
												check
													exists_function: an_exists_function /= Void
												end
											an_exists_function.set_arguments (a_count_function.arguments)
											Result := an_exists_function
										elseif operator = Fortran_greater_equal_token then
										
											-- Rewrite count(x)>=0 as true()
										
											create {XM_XPATH_BOOLEAN_VALUE} Result.make (True)
										else
												check
													less_then_or_equal_to: operator = Fortran_less_equal_token
												end
										
											-- Rewrite count(x)<0 as false()
										
											create {XM_XPATH_BOOLEAN_VALUE} Result.make (False)
										end

									else
										an_integer_value ?= second_operand
										if an_integer_value /= Void and then
											(operator = Fortran_greater_than_token or else operator = Fortran_greater_equal_token) then

											-- Rewrite count(x) gt n as exists(x[n+1])
											--  and count(x) ge n as exists(x[n])

											an_integer := an_integer_value.value
											if operator = Fortran_greater_than_token then
												an_integer := an_integer + 1
											end
											an_exists_function ?= Function_factory.make_system_function ("exists")
												check
													exists_function_2: an_exists_function /= Void
												end
											create new_arguments.make (1)
											create an_integer_value.make (an_integer)
											create a_filter_expression.make (a_count_function.arguments.item(1), an_integer_value)
											new_arguments.put (a_filter_expression, 1)
											an_exists_function.set_arguments (new_arguments)
											Result := an_exists_function
										end
									end
								end

								if Result = Void then

									-- We haven't managed to optimize anything yet, so:


									a_count_function ?= second_operand
									if a_count_function /= Void and then is_zero (first_operand) then
										
										-- Optimise (0 eq count(x)), etc. by inversion

										create a_result_expression.make (a_count_function, inverse_operator (operator), first_operand, atomic_comparer.collator)
										Result := a_result_expression.analyze (a_context)
									else

										-- Optimise string-length(x) = 0, >0, !=0 etc.

										a_string_length_function ?= first_operand
										if a_string_length_function /= Void and then is_zero (second_operand) then
											a_string_length_function.set_test_for_zero
										else

											-- Optimise 0 = string-length(x), etc.

											a_string_length_function ?= second_operand
											if a_string_length_function /= Void and then is_zero (first_operand) then
												a_string_length_function.set_test_for_zero
											end
										end

										-- Optimise position() < n etc.

										a_position_function ?= first_operand
										an_integer_value ?= second_operand
										if a_position_function /= Void and then an_integer_value /= Void then
											an_integer := an_integer_value.value
											if an_integer < 0 then an_integer := 0 end
											if an_integer < Platform.Maximum_integer then
												inspect
													operator
												when Fortran_equal_token then
													create {XM_XPATH_POSITION_RANGE} Result.make (an_integer, an_integer)
												when Fortran_greater_equal_token then
													create {XM_XPATH_POSITION_RANGE} Result.make (an_integer, Platform.Maximum_integer)
												when Fortran_not_equal_token then
													if an_integer = 1 then
														create {XM_XPATH_POSITION_RANGE} Result.make (2, Platform.Maximum_integer)
													end
												when Fortran_less_than_token then
													create {XM_XPATH_POSITION_RANGE} Result.make (1, an_integer - 1)
												when Fortran_greater_than_token then
													create {XM_XPATH_POSITION_RANGE} Result.make (an_integer + 1, Platform.Maximum_integer)
												when Fortran_less_equal_token then
													create {XM_XPATH_POSITION_RANGE} Result.make (1, an_integer)													
												end
											end
										else
											a_position_function ?= second_operand
											an_integer_value ?= first_operand
											if a_position_function /= Void and then an_integer_value /= Void then
												an_integer := an_integer_value.value
												if an_integer < 0 then an_integer := 0 end
												if an_integer < Platform.Maximum_integer then
													inspect
														operator
													when Fortran_equal_token then
														create {XM_XPATH_POSITION_RANGE} Result.make (an_integer, an_integer)
													when Fortran_less_equal_token then
														create {XM_XPATH_POSITION_RANGE} Result.make (an_integer, Platform.Maximum_integer)
													when Fortran_not_equal_token then
														if an_integer = 1 then
															create {XM_XPATH_POSITION_RANGE} Result.make (2, Platform.Maximum_integer)
														end
													when Fortran_greater_than_token then
														create {XM_XPATH_POSITION_RANGE} Result.make (1, an_integer - 1)
													when Fortran_less_than_token then
														create {XM_XPATH_POSITION_RANGE} Result.make (an_integer + 1, Platform.Maximum_integer)
													when Fortran_greater_equal_token then
														create {XM_XPATH_POSITION_RANGE} Result.make (1, an_integer)													
													end
												end
											end
										end
										if Result = Void then

											-- We haven't managed to optimize anything yet, so:

											a_position_function ?= first_operand
											a_last_function ?= second_operand
											if a_position_function /= Void and then a_last_function /= Void then

												-- Optimise position()=last() etc.

												inspect
													operator
												when Fortran_equal_token, Fortran_greater_equal_token then
													create {XM_XPATH_IS_LAST_EXPRESSION} Result.make (True)
												when Fortran_not_equal_token, Fortran_less_than_token then
													create {XM_XPATH_IS_LAST_EXPRESSION} Result.make (False)
												when Fortran_greater_than_token then
													create {XM_XPATH_BOOLEAN_VALUE} Result.make (False)
												when Fortran_less_equal_token then
													create {XM_XPATH_BOOLEAN_VALUE} Result.make (True)													
												end
											end
											
											if Result = Void then
												a_position_function ?= second_operand
												a_last_function ?= first_operand
												if a_position_function /= Void and then a_last_function /= Void then
													
													-- Optimise last()=position() etc.
													
													inspect
														operator
													when Fortran_equal_token, Fortran_less_equal_token then
														create {XM_XPATH_IS_LAST_EXPRESSION} Result.make (True)
													when Fortran_not_equal_token, Fortran_greater_than_token then
														create {XM_XPATH_IS_LAST_EXPRESSION} Result.make (False)
													when Fortran_less_than_token then
														create {XM_XPATH_BOOLEAN_VALUE} Result.make (False)
													when Fortran_greater_equal_token then
														create {XM_XPATH_BOOLEAN_VALUE} Result.make (True)													
													end
												end
											end
											-- TODO not needed until XSLT: if Result = Void then
												
												-- We haven't managed to optimize anything yet, so:

												-- Optimize generate-id(X) = generate-id(Y) as "X is Y"
												-- This construct is often used in XSLT 1.0 stylesheets.
												-- Only do this if we know the arguments are singletons, because "is" doesn't
												-- do first-value extraction.

												
											-- end
										end
									end
								end
							end
						end
					end
				end
			end
			if Result = Void then
				if not a_result_expression.is_error then
					a_value ?= first_operand
					another_value ?= second_operand
					if a_value /= Void and then another_value /= Void then

						-- Evaluate the expression now if both arguments are constant

						a_boolean_value ?= a_result_expression.evaluated_item (Void)
							check
								a_boolean_value /= Void
								-- That's what evaluated_item returns for this class.
							end
						Result := a_boolean_value
					end
				end
				if Result = Void then Result := a_result_expression end
			end
			Result.set_analyzed
		end

feature -- Evaluation

	effective_boolean_value (a_context: XM_XPATH_CONTEXT): XM_XPATH_BOOLEAN_VALUE is
			-- Effective boolean value
		local
			an_atomic_value, another_atomic_value: XM_XPATH_ATOMIC_VALUE
			an_item, another_item: XM_XPATH_ITEM
			a_comparison_checker: XM_XPATH_COMPARISON_CHECKER
		do
			an_item := operands.item (1).evaluated_item (a_context)
			if an_item.is_item_in_error then
				create Result.make (False)
				Result.set_evaluation_error (an_item.evaluation_error_value)
			else
				another_item := operands.item (2).evaluated_item (a_context)
				if another_item.is_item_in_error then
				create Result.make (False)
				Result.set_evaluation_error (another_item.evaluation_error_value)
				else
					an_atomic_value ?= an_item
					another_atomic_value ?= another_item
					if an_atomic_value = Void then
						create Result.make (False)
						Result.set_last_error_from_string ("Atomization failed for second operand of value comparison", 6, Type_error)
					elseif another_atomic_value = Void then
						create Result.make (False)
						Result.set_last_error_from_string ("Atomization failed for second operand of value comparison", 6, Type_error)
					else
						create a_comparison_checker
						a_comparison_checker.check_correct_value_relation (an_atomic_value, operator, atomic_comparer, another_atomic_value)
						if a_comparison_checker.is_comparison_type_error then
							create Result.make (False)
							Result.set_last_error (a_comparison_checker.last_type_error)
						elseif a_comparison_checker.last_check_result then
							create Result.make (True)
						else
							create Result.make (False)
						end
					end
				end
			end
		end

	evaluated_item (a_context: XM_XPATH_CONTEXT): XM_XPATH_ITEM is
			-- Evaluate `Current' as a single item
		do
			Result := effective_boolean_value (a_context)
		end

feature {NONE} -- Implementation

	atomic_comparer: XM_XPATH_ATOMIC_COMPARER
			-- Comparer for atomic values

	is_zero (an_expression: XM_XPATH_EXPRESSION): BOOLEAN is
			-- Is `an_expression' a constant zero?
		require
			expression_not_void: an_expression /= Void
		local
			an_atomic_value: XM_XPATH_ATOMIC_VALUE
			an_integer_value: XM_XPATH_INTEGER_VALUE
		do
			an_atomic_value ?= an_expression
			if an_atomic_value /= Void then
				an_integer_value ?= an_atomic_value
				if an_integer_value /= Void then
					Result := an_integer_value.value = 0
				else
					if an_atomic_value.is_convertible (Integer_type) then
						an_integer_value ?= an_atomic_value.convert_to_type (Integer_type)
							check
								integer: an_integer_value /= Void
								-- because of is_convertible
							end
						Result := an_integer_value.value = 0
					end
				end
			end
		end

end
	
