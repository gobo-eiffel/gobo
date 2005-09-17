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
			check_static_type, evaluate_item, make, is_arithmetic_expression, as_arithmetic_expression
		end

	XM_XPATH_ROLE

create

	make

feature {NONE} -- Initialization

	make (an_operand_one: XM_XPATH_EXPRESSION; a_token: INTEGER; an_operand_two: XM_XPATH_EXPRESSION) is
			-- Establish invariant
		do
			Precursor (an_operand_one, a_token, an_operand_two)
			initialized := True
		end

feature -- Access

	is_arithmetic_expression: BOOLEAN is
			-- Is `Current' a arithmetic expression?
		do
			Result := True
		end

	as_arithmetic_expression: XM_XPATH_ARITHMETIC_EXPRESSION is
			-- `Current' seen as a arithmetic expression
		do
			Result := Current
		end

	item_type: XM_XPATH_ITEM_TYPE is
			--Determine the data type of the expression, if possible
		local
			a_type, another_type: XM_XPATH_ITEM_TYPE
		do
			a_type := first_operand.item_type
			another_type := second_operand.item_type
			Result := common_item_type (a_type, another_type)
			if Result = type_factory.numeric_type then
				Result := lowest_commom_promotion_super_type (a_type, another_type)

				-- Exception: integer / integer => decimal

				if operator = Division_token and then Result = type_factory.integer_type then
					Result := type_factory.decimal_type
				end
			end
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end			
		end

feature -- Optimization

	check_static_type (a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform static type-checking of `Current' and its subexpressions.
		local
			a_sequence_type: XM_XPATH_SEQUENCE_TYPE
			a_role, another_role: XM_XPATH_ROLE_LOCATOR
			a_type_checker: XM_XPATH_TYPE_CHECKER
			an_expression: XM_XPATH_EXPRESSION
		do
			mark_unreplaced
			is_backwards_compatible_mode := a_context.is_backwards_compatible_mode

			-- TODO: this is using the function call rules. Arithetic expressions have slightly different rules.

			create a_sequence_type.make_optional_atomic
			create a_role.make (Binary_expression_role, token_name (operator), 1, Xpath_errors_uri, "XPTY0004")
			create a_type_checker
			a_type_checker.static_type_check (a_context, first_operand, a_sequence_type, is_backwards_compatible_mode, a_role)
			if a_type_checker.is_static_type_check_error then
				set_last_error (a_type_checker.static_type_check_error)
			else
				set_first_operand (a_type_checker.checked_expression)
				create another_role.make (Binary_expression_role, token_name (operator), 2, Xpath_errors_uri, "XPTY0004")
				a_type_checker.static_type_check (a_context, second_operand, a_sequence_type, is_backwards_compatible_mode, another_role)
				if a_type_checker.is_static_type_check_error then
					set_last_error (a_type_checker.static_type_check_error)
				else
					set_second_operand (a_type_checker.checked_expression)
					Precursor (a_context, a_context_item_type)

					-- Now, we may or may not still be an arithmetic expression.

					if was_expression_replaced then
						an_expression := replacement_expression
					else
						an_expression := Current
					end
					if an_expression.is_arithmetic_expression then
						an_expression.as_arithmetic_expression.type_check_arithmetic_expression (a_context)
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
			if first_operand.last_evaluated_item = Void then
				last_evaluated_item := Void
			elseif first_operand.last_evaluated_item.is_error then
				last_evaluated_item := first_operand.last_evaluated_item
			else
				if not first_operand.last_evaluated_item.is_atomic_value then
					last_evaluated_item := Void
				else
					second_operand.evaluate_item (a_context)
					if second_operand.last_evaluated_item = Void then
						last_evaluated_item := Void
					elseif second_operand.last_evaluated_item.is_error then
						last_evaluated_item := second_operand.last_evaluated_item
					else
						if not second_operand.last_evaluated_item.is_atomic_value then
							last_evaluated_item := Void
						else
							an_atomic_value := first_operand.last_evaluated_item.as_atomic_value
							another_atomic_value := second_operand.last_evaluated_item.as_atomic_value
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
							when Duration_division_action then
								create {XM_XPATH_DURATION_DIVISION} an_expression.make (an_atomic_value, operator, another_atomic_value)
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
									if an_atomic_value.is_convertible (type_factory.numeric_type) and then another_atomic_value.is_convertible (type_factory.numeric_type) then
										a_numeric_value := an_atomic_value.convert_to_type (type_factory.numeric_type).as_numeric_value
										another_numeric_value := another_atomic_value.convert_to_type (type_factory.numeric_type).as_numeric_value
										create {XM_XPATH_NUMERIC_ARITHMETIC} an_expression.make (a_numeric_value, operator, another_numeric_value)
										an_expression.evaluate_item (a_context)
										last_evaluated_item := an_expression.last_evaluated_item
									else
										a_string := STRING_.appended_string ("Unsuitable operands for arithmetic operation (", an_atomic_value.item_type.conventional_name)
										a_string := STRING_.appended_string (a_string, ", ")
										a_string := STRING_.appended_string (a_string, another_atomic_value.item_type.conventional_name)
										a_string := STRING_.appended_string (a_string,  ")")
										set_last_error_from_string (a_string, Xpath_errors_uri, "XPTY0004", Type_error)								
									end
								else
									a_string := STRING_.appended_string ("Unsuitable operands for arithmetic operation (", an_atomic_value.item_type.conventional_name)
									a_string := STRING_.appended_string (a_string, ", ")
									a_string := STRING_.appended_string (a_string, another_atomic_value.item_type.conventional_name)
									a_string := STRING_.appended_string (a_string,  ")")
									set_last_error_from_string (a_string, Xpath_errors_uri, "XPTY0004", Type_error)	
								end
							end
						end
					end
				end
			end
		end

feature {XM_XPATH_ARITHMETIC_EXPRESSION} -- Local

	is_backwards_compatible_mode: BOOLEAN
			-- Is XPath 1.0 Backwards Compatible Mode used?

	Unknown_action: INTEGER is 1
	Numeric_arithmetic_action: INTEGER is 2
	Date_and_duration_action: INTEGER is 3
	Date_difference_action: INTEGER is 4
	Duration_addition_action: INTEGER is 5
	Duration_multiplication_action: INTEGER is 6
	Duration_division_action: INTEGER is 7
			-- Arithmetic action need on operands
	
	type_check_arithmetic_expression  (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Perform static type checking of `Current' and its subexpressions
		local
			a_type, another_type: XM_XPATH_ITEM_TYPE
			an_action: INTEGER
			a_string: STRING
			finished: BOOLEAN
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
					is_sub_type (a_type, type_factory.any_atomic_type) and then
					a_type /= type_factory.untyped_atomic_type and then
					a_type /= type_factory.any_atomic_type and then
					is_sub_type (another_type, type_factory.any_atomic_type) and then
					another_type /= type_factory.untyped_atomic_type and then
					another_type /= type_factory.any_atomic_type then
					a_string := STRING_.appended_string ("Unsuitable operands for arithmetic operation (", a_type.conventional_name)
					a_string := STRING_.appended_string (a_string, ", ")
					a_string := STRING_.appended_string (a_string, another_type.conventional_name)
					a_string := STRING_.appended_string (a_string,  ")")
					set_last_error_from_string (a_string, Xpath_errors_uri, "XPTY0004", Type_error)
				else
					finished := True
				end
			end
			if not finished and not is_error then
				if first_operand.is_value and then not first_operand.depends_upon_implicit_timezone
					and then second_operand.is_value and then not second_operand.depends_upon_implicit_timezone then
					eagerly_evaluate (Void)
					set_replacement (last_evaluation)
				else
					set_replacement (an_expression)
				end
			end
		end

feature {NONE} -- Implementation

	action (t1, t2: XM_XPATH_ITEM_TYPE): INTEGER is
			-- Action needed for `t1' and `t2'
		require
			first_type_not_void: t1 /= Void
			second_type_not_void: t2 /= Void
		do
			if (is_sub_type (t1, type_factory.numeric_type) or else is_sub_type (t1, type_factory.untyped_atomic_type))
					and then (is_sub_type (t2, type_factory.numeric_type) or else is_sub_type (t2, type_factory.untyped_atomic_type)) then
					Result := Numeric_arithmetic_action
			else
				inspect
					operator
				when Modulus_token, Integer_division_token then
					Result := Unknown_action
				when Division_token then
					if (t1 = type_factory.year_month_duration_type or else t1 = type_factory.day_time_duration_type) then
						if is_sub_type (t2, type_factory.numeric_type) then
							Result := Duration_multiplication_action
						elseif (t1 = type_factory.year_month_duration_type or else t1 = type_factory.day_time_duration_type) then
							Result := Duration_division_action
						end
					else
						Result := Unknown_action
					end
				when Multiply_token then
					if (t1 = type_factory.year_month_duration_type or else t1 = type_factory.day_time_duration_type) and then is_sub_type (t2, type_factory.numeric_type) then
						Result := Duration_multiplication_action
					elseif (t2 = type_factory.year_month_duration_type or else t2 = type_factory.day_time_duration_type) and then is_sub_type (t1, type_factory.numeric_type) then
						Result := Duration_multiplication_action
					else
						Result := Unknown_action
					end
				when Plus_token, Minus_token then
					if t1= type_factory.year_month_duration_type and then t2 = type_factory.year_month_duration_type then
						Result := Duration_addition_action
					elseif t1 = type_factory.day_time_duration_type and then t2 = type_factory.day_time_duration_type then
						Result := Duration_addition_action
					elseif t1 = t2 and then operator = Minus_token then
						Result := Date_difference_action
					elseif t1 = type_factory.date_type and then (t2 = type_factory.year_month_duration_type or else t2 = type_factory.day_time_duration_type) then
						Result := Date_and_duration_action
					elseif t2 = type_factory.date_type and then (t1 = type_factory.year_month_duration_type or else t1 = type_factory.day_time_duration_type) then
						Result := Date_and_duration_action
					elseif t1 = type_factory.time_type and then (t2 = type_factory.year_month_duration_type or else t2 = type_factory.day_time_duration_type) then
						Result := Date_and_duration_action
					elseif t2 = type_factory.time_type and then (t1 = type_factory.year_month_duration_type or else t1 = type_factory.day_time_duration_type) then
						Result := Date_and_duration_action
					elseif t1 = type_factory.date_time_type and then t2 = type_factory.date_time_type then
						Result := Date_and_duration_action
					elseif t1 = type_factory.date_time_type and then (t2 = type_factory.year_month_duration_type or else t2 = type_factory.day_time_duration_type) then
						Result := Date_and_duration_action
					else
						Result := Unknown_action						
					end
				end
			end
		ensure
			valid_result_action: Unknown_action <= Result and then Result <= Duration_division_action
		end
			
	common_item_type (t1, t2: XM_XPATH_ITEM_TYPE): XM_XPATH_ITEM_TYPE is
			-- Common type to use for arithmetic
		require
			first_type_not_void: t1 /= Void
			second_type_not_void: t2 /= Void
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
			common_item_type_not_void: Result /= Void
		end

	common_item_type_for_modulus (t1, t2: XM_XPATH_ITEM_TYPE): XM_XPATH_ITEM_TYPE is
			-- Common type to use for modulus arithmetic
		require
			first_type_not_void: t1 /= Void
			second_type_not_void: t2 /= Void
		do
			if (is_sub_type (t1, type_factory.numeric_type) or else is_sub_type (t1, type_factory.untyped_atomic_type))
				and then (is_sub_type (t2, type_factory.numeric_type) or else is_sub_type (t2, type_factory.untyped_atomic_type)) then
				Result := type_factory.numeric_type
			else
				Result := type_factory.any_atomic_type -- Type is not known statically
			end
		end

	common_item_type_for_division (t1, t2: XM_XPATH_ITEM_TYPE): XM_XPATH_ITEM_TYPE is
			-- Common type to use for division
		require
			first_type_not_void: t1 /= Void
			second_type_not_void: t2 /= Void
		do
			if (t1 = type_factory.year_month_duration_type or else t1 = type_factory.day_time_duration_type) and then is_sub_type (t2, type_factory.numeric_type) then
				Result := t1
			elseif(is_sub_type (t1, type_factory.numeric_type) or else is_sub_type (t1, type_factory.untyped_atomic_type))
				and then (is_sub_type (t2, type_factory.numeric_type) or else is_sub_type (t2, type_factory.untyped_atomic_type)) then
				Result := type_factory.numeric_type
			else
				Result := type_factory.any_atomic_type -- Type is not known statically
			end
		end
	
	common_item_type_for_multiplication (t1, t2: XM_XPATH_ITEM_TYPE): XM_XPATH_ITEM_TYPE is
			-- Common type to use for multiplication
		require
			first_type_not_void: t1 /= Void
			second_type_not_void: t2 /= Void
		do
			if (t1 = type_factory.year_month_duration_type or else t1 = type_factory.day_time_duration_type) and then is_sub_type (t2, type_factory.numeric_type) then
				Result := t1
			elseif (t2 = type_factory.year_month_duration_type or else t2 = type_factory.day_time_duration_type) and then is_sub_type (t1, type_factory.numeric_type) then
				Result := t2
			elseif(is_sub_type (t1, type_factory.numeric_type) or else is_sub_type (t1, type_factory.untyped_atomic_type))
				and then (is_sub_type (t2, type_factory.numeric_type) or else is_sub_type (t2, type_factory.untyped_atomic_type)) then
				Result := type_factory.numeric_type
			else
				Result := type_factory.any_atomic_type -- Type is not known statically
			end
		end

	common_item_type_for_addition (t1, t2: XM_XPATH_ITEM_TYPE): XM_XPATH_ITEM_TYPE is
			-- Common type to use for addition
		require
			first_type_not_void: t1 /= Void
			second_type_not_void: t2 /= Void
		do
			if (is_sub_type (t1, type_factory.numeric_type) or else is_sub_type (t1, type_factory.untyped_atomic_type))
				and then (is_sub_type (t2, type_factory.numeric_type) or else is_sub_type (t2, type_factory.untyped_atomic_type)) then
				Result := type_factory.numeric_type
			elseif t1 = type_factory.date_type and then (t2 = type_factory.year_month_duration_type or else t2 = type_factory.day_time_duration_type) then
				Result := type_factory.date_type
			elseif t2 = type_factory.date_type and then (t1 = type_factory.year_month_duration_type or else t1 = type_factory.day_time_duration_type) then
				Result := type_factory.date_type
			elseif t1 = type_factory.time_type and then (t2 = type_factory.year_month_duration_type or else t2 = type_factory.day_time_duration_type) then
				Result := type_factory.time_type
			elseif t2 = type_factory.time_type and then (t1 = type_factory.year_month_duration_type or else t1 = type_factory.day_time_duration_type) then
				Result := type_factory.time_type
			elseif t1 = type_factory.date_time_type and then t2 = type_factory.date_time_type then
				Result := type_factory.date_time_type
			elseif t1 = type_factory.date_time_type and then (t2 = type_factory.year_month_duration_type or else t2 = type_factory.day_time_duration_type) then
				Result := type_factory.date_time_type					
			elseif t1= type_factory.year_month_duration_type and then t2 = type_factory.year_month_duration_type then
				Result := t1 
			elseif t1 = type_factory.day_time_duration_type and then t2 = type_factory.day_time_duration_type then
				Result := t1
			else
				Result := type_factory.any_atomic_type -- Type is not known statically
			end	
		end

	common_item_type_for_subtraction (t1, t2: XM_XPATH_ITEM_TYPE): XM_XPATH_ITEM_TYPE is
			-- Common type to use for subtraction
		require
			first_type_not_void: t1 /= Void
			second_type_not_void: t2 /= Void
		do
			if (is_sub_type (t1, type_factory.numeric_type) or else is_sub_type (t1, type_factory.untyped_atomic_type))
				and then (is_sub_type (t2, type_factory.numeric_type) or else is_sub_type (t2, type_factory.untyped_atomic_type)) then
				Result := type_factory.numeric_type
			elseif t1 = type_factory.date_type and then t2 = type_factory.date_type then
				Result := type_factory.day_time_duration_type
			elseif t1 = type_factory.date_type and then (t2 = type_factory.year_month_duration_type or else t2 = type_factory.day_time_duration_type) then
				Result := type_factory.date_type
			elseif t1 = type_factory.time_type and then t2 = type_factory.time_type then
				Result := type_factory.day_time_duration_type
			elseif t1 = type_factory.time_type and then (t2 = type_factory.year_month_duration_type or else t2 = type_factory.day_time_duration_type) then
				Result := type_factory.time_type
			elseif t1 = type_factory.date_time_type and then t2 = type_factory.date_time_type then
				Result := type_factory.day_time_duration_type
			elseif t1 = type_factory.date_time_type and then (t2 = type_factory.year_month_duration_type or else t2 = type_factory.day_time_duration_type) then
				Result := type_factory.date_time_type
			elseif t1= type_factory.year_month_duration_type and then t2 = type_factory.year_month_duration_type then
				Result := t1 
			elseif t1 = type_factory.day_time_duration_type and then t2 = type_factory.day_time_duration_type then
				Result := t1
			else
				Result := type_factory.any_atomic_type -- Type is not known statically
			end			
		end

	lowest_commom_promotion_super_type (t1, t2: XM_XPATH_ITEM_TYPE): XM_XPATH_ITEM_TYPE is
			-- Lowest common supertype of two numeric values for promotion purposes
	require
			first_type_not_void: t1 /= Void
			second_type_not_void: t2 /= Void
		local
			a_type, another_type: XM_XPATH_ITEM_TYPE
		do
			if is_sub_type (t1, type_factory.numeric_type) then a_type := t1 else a_type := type_factory.double_type end
			if is_sub_type (t2, type_factory.numeric_type) then another_type := t1 else another_type := type_factory.double_type end
			if a_type = another_type then
				Result := a_type
			elseif a_type = type_factory.double_type or else another_type = type_factory.double_type then
				Result := type_factory.double_type
			elseif a_type = type_factory.decimal_type or else another_type = type_factory.decimal_type then
				Result := type_factory.decimal_type
				-- Add in float for scehma-aware
			else
				Result := type_factory.integer_type
			end
		ensure
			result_type_not_void: Result /= Void
		end
			
end
	
