indexing

	description:

		"XPath arithmetic expressons"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_ARITHMETIC_EXPRESSION

inherit

	XM_XPATH_BINARY_EXPRESSION
		redefine
			analyze, evaluate_item
	end

	XM_XPATH_ROLE

creation

	make

feature -- Access

	item_type: INTEGER is
			--Determine the data type of the expression, if possible
		local
			a_type, another_type: INTEGER
		do
			a_type := first_operand.item_type
			another_type := second_operand.item_type
			Result := common_item_type (a_type, another_type)
			if Result = Number_type then
				Result := lowest_commom_promotion_super_type (a_type, another_type)

				-- Exception: integer / integer => decimal

				if operator = Division_token and then Result = Integer_type then
					Result := Decimal_type
				end
			end
		end

feature -- Optimization

	analyze (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Perform static analysis of `Current' and its subexpressions
		local
			a_sequence_type: XM_XPATH_SEQUENCE_TYPE
			a_role, another_role: XM_XPATH_ROLE_LOCATOR
			a_type_checker: XM_XPATH_TYPE_CHECKER
			an_expression: XM_XPATH_EXPRESSION
			an_arithmetic_expression: XM_XPATH_ARITHMETIC_EXPRESSION
		do
			mark_unreplaced
			is_backwards_compatible_mode := a_context.is_backwards_compatible_mode

			-- TODO: this is using the function call rules. Arithetic expressions have slightly different rules.

			create a_sequence_type.make_optional_atomic
			create a_role.make (Binary_expression_role, token_name (operator), 1)
			create a_type_checker
			a_type_checker.static_type_check (first_operand, a_sequence_type, is_backwards_compatible_mode, a_role)
			if a_type_checker.is_static_type_check_error then
				set_last_error_from_string (a_type_checker.static_type_check_error_message, 4, Type_error)
			else
				set_first_operand (a_type_checker.checked_expression)
				create another_role.make (Binary_expression_role, token_name (operator), 2)
				a_type_checker.static_type_check (second_operand, a_sequence_type, is_backwards_compatible_mode, another_role)
				if a_type_checker.is_static_type_check_error then
					set_last_error_from_string (a_type_checker.static_type_check_error_message, 4, Type_error)
				else
					set_second_operand (a_type_checker.checked_expression)
					Precursor (a_context)

					-- Now, we may or may not still be an arithmetic expression.

					if was_expression_replaced then
						an_expression := replacement_expression
					else
						an_expression := Current
					end
					an_arithmetic_expression ?= an_expression
					if an_arithmetic_expression /= Void then
						an_arithmetic_expression.analyze_arithmetic_expression (a_context)
					end
				end
			end
		end

feature -- Evaluation

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate `Current' as a single item;
			-- We only take this path if the type could not be determined statically.
		local
			an_atomic_value, another_atomic_value: XM_XPATH_ATOMIC_VALUE
			an_action: INTEGER
			an_expression: XM_XPATH_EXPRESSION
			a_numeric_value, another_numeric_value: XM_XPATH_NUMERIC_VALUE
			a_string: STRING
		do
			first_operand.evaluate_item (a_context)
			an_atomic_value ?= first_operand.last_evaluated_item
			if an_atomic_value = Void then
				last_evaluated_item := Void
			else
				second_operand.evaluate_item (a_context)
				another_atomic_value ?= second_operand.last_evaluated_item
				if another_atomic_value = Void then
					last_evaluated_item := Void
				else
					an_action := action (an_atomic_value.item_type, another_atomic_value.item_type)
					inspect
						an_action
					when Numeric_arithmetic_action then
						create {XM_XPATH_NUMERIC_ARITHMETIC} an_expression.make (an_atomic_value, operator, another_atomic_value)
						an_expression.evaluate_item (a_context)
						last_evaluated_item := an_expression.last_evaluated_item
					when Duration_addition_action then
						create {XM_XPATH_DURATION_ADDITION} an_expression.make (an_atomic_value, operator, another_atomic_value)
						an_expression.evaluate_item (a_context)
						last_evaluated_item := an_expression.last_evaluated_item
					when Duration_multiplication_action then
						create {XM_XPATH_DURATION_MULTIPLICATION} an_expression.make (an_atomic_value, operator, another_atomic_value)
						an_expression.evaluate_item (a_context)
						last_evaluated_item := an_expression.last_evaluated_item
					when Date_and_duration_action then
						create {XM_XPATH_DATE_AND_DURATION} an_expression.make (an_atomic_value, operator, another_atomic_value)
						an_expression.evaluate_item (a_context)
						last_evaluated_item := an_expression.last_evaluated_item
					when Date_difference_action then
						create {XM_XPATH_DATE_DIFFERENCE} an_expression.make (an_atomic_value, operator, another_atomic_value)
						an_expression.evaluate_item (a_context)
						last_evaluated_item := an_expression.last_evaluated_item
					else

						-- Types are not known yet. Force to numeric if in 1.0 mode

						if is_backwards_compatible_mode then
							if an_atomic_value.is_convertible (Number_type) and then another_atomic_value.is_convertible (Number_type) then
								a_numeric_value ?= an_atomic_value.convert_to_type (Number_type)
								another_numeric_value ?= another_atomic_value.convert_to_type (Number_type)
								create {XM_XPATH_NUMERIC_ARITHMETIC} an_expression.make (a_numeric_value, operator, another_numeric_value)
								an_expression.evaluate_item (a_context)
								last_evaluated_item := an_expression.last_evaluated_item
							else
								a_string := STRING_.appended_string ("Unsuitable operands for arithmetic operation (", type_name (an_atomic_value.item_type))
								a_string := STRING_.appended_string (a_string, ", ")
								a_string := STRING_.appended_string (a_string, type_name (another_atomic_value.item_type))
								a_string := STRING_.appended_string (a_string,  ")")
								set_last_error_from_string (a_string, Type_error, 6)								
							end
						else
							a_string := STRING_.appended_string ("Unsuitable operands for arithmetic operation (", type_name (an_atomic_value.item_type))
							a_string := STRING_.appended_string (a_string, ", ")
							a_string := STRING_.appended_string (a_string, type_name (another_atomic_value.item_type))
							a_string := STRING_.appended_string (a_string,  ")")
							set_last_error_from_string (a_string, Type_error, 6)	
						end
					end
				end
			end
		end

feature {XM_XPATH_ARITHMETIC_EXPRESSION} -- Local

	is_backwards_compatible_mode: BOOLEAN
			-- Is XPath 1.0 Backwards Compatible Mode used?

	Unknown_action, Numeric_arithmetic_action, Date_and_duration_action, Date_difference_action, Duration_addition_action, Duration_multiplication_action: INTEGER is unique
			-- Arithmetic action need on operands
	
		analyze_arithmetic_expression  (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Perform static analysis of `Current' and its subexpressions
		local
			a_type, another_type, an_action: INTEGER
			a_string: STRING
			finished: BOOLEAN
			a_value, another_value: XM_XPATH_VALUE
			an_expression: XM_XPATH_EXPRESSION
		do
			a_type := first_operand.item_type
			another_type := second_operand.item_type
			an_action := action (a_type, another_type)
			inspect
				an_action
			when Numeric_arithmetic_action then
				create {XM_XPATH_NUMERIC_ARITHMETIC} an_expression.make (first_operand, operator, second_operand)
			when Duration_addition_action then
				create {XM_XPATH_DURATION_ADDITION} an_expression.make (first_operand, operator, second_operand)
			when Duration_multiplication_action then
				create {XM_XPATH_DURATION_MULTIPLICATION} an_expression.make (first_operand, operator, second_operand)
			when Date_and_duration_action then
				create {XM_XPATH_DATE_AND_DURATION} an_expression.make (first_operand, operator, second_operand)
			when Date_difference_action then
				create {XM_XPATH_DATE_DIFFERENCE} an_expression.make (first_operand, operator, second_operand)
			else

				-- Either the types are not known yet, or they are wrong

				if not is_backwards_compatible_mode and then
					is_sub_type (a_type, Atomic_type) and then
					a_type /= Untyped_atomic_type and then
					a_type /= Atomic_type and then
					is_sub_type (another_type, Atomic_type) and then
					another_type /= Untyped_atomic_type and then
					another_type /= Atomic_type then
					a_string := STRING_.appended_string ("Unsuitable operands for arithmetic operation (", type_name (a_type))
					a_string := STRING_.appended_string (a_string, ", ")
					a_string := STRING_.appended_string (a_string, type_name (another_type))
					a_string := STRING_.appended_string (a_string,  ")")
					set_last_error_from_string (a_string, Type_error, 6)
				else
					finished := True
				end
			end
			if not finished and not is_error then
				a_value ?= first_operand
				another_value ?= second_operand
				if a_value /= Void and then another_value /= Void then
					eagerly_evaluate (Void)
					set_replacement (last_evaluation)
				else
					set_replacement (an_expression)
				end
			end
		end

feature {NONE} -- Implementation

	action (t1, t2: INTEGER): INTEGER is
			-- Action needed for `t1' and `t2'
		require
			first_type_valid: is_valid_type (t1)
			second_type_valid: is_valid_type (t2)
		do
			if (is_sub_type (t1, Number_type) or else is_sub_type (t1, Untyped_atomic_type))
					and then (is_sub_type (t2, Number_type) or else is_sub_type (t2, Untyped_atomic_type)) then
					Result := Numeric_arithmetic_action
			else
				inspect
					operator
				when Modulus_token, Integer_division_token then
					Result := Unknown_action
				when Division_token then
					if (t1 = Year_month_duration_type or else t1 = Day_time_duration_type) and then is_sub_type (t2, Number_type) then
						Result := Duration_multiplication_action
					else
						Result := Unknown_action
					end
				when Multiply_token then
					if (t1 = Year_month_duration_type or else t1 = Day_time_duration_type) and then is_sub_type (t2, Number_type) then
						Result := Duration_multiplication_action
					elseif (t2 = Year_month_duration_type or else t2 = Day_time_duration_type) and then is_sub_type (t1, Number_type) then
						Result := Duration_multiplication_action
					else
						Result := Unknown_action
					end
				when Plus_token, Minus_token then
					if t1= Year_month_duration_type and then t2 = Year_month_duration_type then
						Result := Duration_addition_action
					elseif t1 = Day_time_duration_type and then t2 = Day_time_duration_type then
						Result := Duration_addition_action
					elseif t1 = Date_type and then (t2 = Year_month_duration_type or else t2 = Day_time_duration_type) then
						Result := Date_and_duration_action
					elseif t2 = Date_type and then (t1 = Year_month_duration_type or else t1 = Day_time_duration_type) then
						Result := Date_and_duration_action
					elseif t1 = Time_type and then (t2 = Year_month_duration_type or else t2 = Day_time_duration_type) then
						Result := Date_and_duration_action
					elseif t2 = Time_type and then (t1 = Year_month_duration_type or else t1 = Day_time_duration_type) then
						Result := Date_and_duration_action
					elseif t1 = Date_time_type and then t2 = Date_time_type then
						Result := Date_and_duration_action
					elseif t1 = Date_time_type and then (t2 = Year_month_duration_type or else t2 = Day_time_duration_type) then
						Result := Date_and_duration_action
					else
						Result := Unknown_action						
					end
				end
			end
		ensure
			valid_result_action: Unknown_action <= Result and then Result <= Duration_multiplication_action
		end
			
	common_item_type (t1, t2: INTEGER): INTEGER is
			-- Common type to use for arithmetic
		require
			first_type_valid: is_valid_type (t1)
			second_type_valid: is_valid_type (t2)
			not_integer_division: operator /= Integer_division_token
		do
			inspect
				operator
			when Modulus_token, Integer_division_token then
				Result := common_item_type_for_modulus (t1, t2)
			when Division_token then
				Result := common_item_type_for_division (t1, t2)
			when Multiply_token then
				Result := common_item_type_for_multiplication (t1, t2)
			when Plus_token then
				Result := common_item_type_for_addition (t1, t2)
			when Minus_token then
				Result := common_item_type_for_subtraction (t1, t2)
			end
		ensure
			valid_result_type: is_valid_type (Result)
		end

	common_item_type_for_modulus (t1, t2: INTEGER): INTEGER is
			-- Common type to use for modulus arithmetic
		require
			first_type_valid: is_valid_type (t1)
			second_type_valid: is_valid_type (t2)
		do
			if (is_sub_type (t1, Number_type) or else is_sub_type (t1, Untyped_atomic_type))
				and then (is_sub_type (t2, Number_type) or else is_sub_type (t2, Untyped_atomic_type)) then
				Result := Number_type
			else
				Result := Atomic_type -- Type is not known statically
			end
		end

	common_item_type_for_division (t1, t2: INTEGER): INTEGER is
			-- Common type to use for division
		require
			first_type_valid: is_valid_type (t1)
			second_type_valid: is_valid_type (t2)
		do
			if (t1 = Year_month_duration_type or else t1 = Day_time_duration_type) and then is_sub_type (t2, Number_type) then
				Result := t1
			elseif(is_sub_type (t1, Number_type) or else is_sub_type (t1, Untyped_atomic_type))
				and then (is_sub_type (t2, Number_type) or else is_sub_type (t2, Untyped_atomic_type)) then
				Result := Number_type
			else
				Result := Atomic_type -- Type is not known statically
			end
		end
	
	common_item_type_for_multiplication (t1, t2: INTEGER): INTEGER is
			-- Common type to use for multiplication
		require
			first_type_valid: is_valid_type (t1)
			second_type_valid: is_valid_type (t2)
		do
			if (t1 = Year_month_duration_type or else t1 = Day_time_duration_type) and then is_sub_type (t2, Number_type) then
				Result := t1
			elseif (t2 = Year_month_duration_type or else t2 = Day_time_duration_type) and then is_sub_type (t1, Number_type) then
				Result := t2
			elseif(is_sub_type (t1, Number_type) or else is_sub_type (t1, Untyped_atomic_type))
				and then (is_sub_type (t2, Number_type) or else is_sub_type (t2, Untyped_atomic_type)) then
				Result := Number_type
			else
				Result := Atomic_type -- Type is not known statically
			end
		end

	common_item_type_for_addition (t1, t2: INTEGER): INTEGER is
			-- Common type to use for addition
		require
			first_type_valid: is_valid_type (t1)
			second_type_valid: is_valid_type (t2)
		do
			if (is_sub_type (t1, Number_type) or else is_sub_type (t1, Untyped_atomic_type))
				and then (is_sub_type (t2, Number_type) or else is_sub_type (t2, Untyped_atomic_type)) then
				Result := Number_type
			elseif t1 = Date_type and then (t2 = Year_month_duration_type or else t2 = Day_time_duration_type) then
				Result := Date_type
			elseif t2 = Date_type and then (t1 = Year_month_duration_type or else t1 = Day_time_duration_type) then
				Result := Date_type
			elseif t1 = Time_type and then (t2 = Year_month_duration_type or else t2 = Day_time_duration_type) then
				Result := Time_type
			elseif t2 = Time_type and then (t1 = Year_month_duration_type or else t1 = Day_time_duration_type) then
				Result := Time_type
			elseif t1 = Date_time_type and then t2 = Date_time_type then
				Result := Date_time_type
			elseif t1 = Date_time_type and then (t2 = Year_month_duration_type or else t2 = Day_time_duration_type) then
				Result := Date_time_type					
			elseif t1= Year_month_duration_type and then t2 = Year_month_duration_type then
				Result := t1 
			elseif t1 = Day_time_duration_type and then t2 = Day_time_duration_type then
				Result := t1
			else
				Result := Atomic_type -- Type is not known statically
			end	
		end

	common_item_type_for_subtraction (t1, t2: INTEGER): INTEGER is
			-- Common type to use for subtraction
		require
			first_type_valid: is_valid_type (t1)
			second_type_valid: is_valid_type (t2)
		do
			if (is_sub_type (t1, Number_type) or else is_sub_type (t1, Untyped_atomic_type))
				and then (is_sub_type (t2, Number_type) or else is_sub_type (t2, Untyped_atomic_type)) then
				Result := Number_type
			elseif t1 = Date_type and then t2 = Date_type then
				Result := Day_time_duration_type
			elseif t1 = Date_type and then (t2 = Year_month_duration_type or else t2 = Day_time_duration_type) then
				Result := Date_type
			elseif t1 = Time_type and then t2 = Time_type then
				Result := Day_time_duration_type
			elseif t1 = Time_type and then (t2 = Year_month_duration_type or else t2 = Day_time_duration_type) then
				Result := Time_type
			elseif t1 = Date_time_type and then t2 = Date_time_type then
				Result := Day_time_duration_type
			elseif t1 = Date_time_type and then (t2 = Year_month_duration_type or else t2 = Day_time_duration_type) then
				Result := Date_time_type
			elseif t1= Year_month_duration_type and then t2 = Year_month_duration_type then
				Result := t1 
			elseif t1 = Day_time_duration_type and then t2 = Day_time_duration_type then
				Result := t1
			else
				Result := Atomic_type -- Type is not known statically
			end			
		end

	lowest_commom_promotion_super_type (t1, t2: INTEGER): INTEGER is
			-- Lowest common supertype of two numeric values for promotion purposes
	require
			first_type_valid: is_valid_type (t1)
			second_type_valid: is_valid_type (t2)
		local
			a_type, another_type: INTEGER
		do
			if is_sub_type (t1, Number_type) then a_type := t1 else a_type := Double_type end
			if is_sub_type (t2, Number_type) then another_type := t1 else another_type := Double_type end
			if a_type = another_type then
				Result := a_type
			elseif a_type = Double_type or else another_type = Double_type then
				Result := Double_type
			elseif a_type = Decimal_type or else another_type = Decimal_type then
				Result := Decimal_type
				-- Add in float for scehma-aware
			else
				Result := Integer_type
			end
		ensure
			valid_result_type: is_valid_type (Result)
		end
			
end
	
