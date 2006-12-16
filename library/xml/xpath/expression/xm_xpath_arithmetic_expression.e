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

	XM_XPATH_ARITHMETIC_ROUTINES

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

				if operator = Division_token and Result = type_factory.integer_type then
					Result := type_factory.decimal_type
				end
			end
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end			
		end

feature -- Status report

	is_backwards_compatible_mode: BOOLEAN
			-- Is XPath 1.0 Backwards Compatible Mode used?

feature -- Status_setting

	set_backwards_compatible_mode is
			-- Set `is_backwards_compatible_mode' to `True'.
		do
			is_backwards_compatible_mode := True
		ensure
			is_backwards_compatible_mode_set: is_backwards_compatible_mode = True
		end

feature -- Optimization

	check_static_type (a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform static type-checking of `Current' and its subexpressions.
		local
			l_sequence_type: XM_XPATH_SEQUENCE_TYPE
			l_role, another_role: XM_XPATH_ROLE_LOCATOR
			l_type_checker: XM_XPATH_TYPE_CHECKER
		do
			mark_unreplaced
			is_backwards_compatible_mode := a_context.is_backwards_compatible_mode
			first_operand.check_static_type (a_context, a_context_item_type)
			if first_operand.is_error then
				set_last_error (first_operand.error_value)
			elseif first_operand.was_expression_replaced then
				set_first_operand (first_operand.replacement_expression)
			end
			second_operand.check_static_type (a_context, a_context_item_type)
			if second_operand.is_error then
				set_last_error (second_operand.error_value)
			elseif second_operand.was_expression_replaced then
				set_second_operand (second_operand.replacement_expression)
			end
			create l_sequence_type.make_optional_atomic
			create l_role.make (Binary_expression_role, token_name (operator), 1, Xpath_errors_uri, "XPTY0004")
			create l_type_checker
			l_type_checker.static_type_check (a_context, first_operand, l_sequence_type, is_backwards_compatible_mode, l_role)
			if l_type_checker.is_static_type_check_error then
				set_last_error (l_type_checker.static_type_check_error)
			else
				set_first_operand (l_type_checker.checked_expression)
				create another_role.make (Binary_expression_role, token_name (operator), 2, Xpath_errors_uri, "XPTY0004")
				l_type_checker.static_type_check (a_context, second_operand, l_sequence_type, is_backwards_compatible_mode, another_role)
				if l_type_checker.is_static_type_check_error then
					set_last_error (l_type_checker.static_type_check_error)
				else
					set_second_operand (l_type_checker.checked_expression)
					if is_backwards_compatible_mode then
						create_1_0_expression  (a_context, a_context_item_type)
					elseif first_operand.cardinality_is_empty then
						set_replacement (first_operand)
					elseif second_operand.cardinality_is_empty then
						set_replacement (second_operand)
					else
						Precursor (a_context, a_context_item_type)
						if not was_expression_replaced then
							type_check_arithmetic_expression (a_context)
						end
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
							an_action := action (an_atomic_value.item_type, another_atomic_value.item_type, operator)
							if an_action = Date_difference_action then
								if (an_atomic_value.is_date_value and another_atomic_value.is_date_value) or
									(an_atomic_value.is_time_value and another_atomic_value.is_time_value) or
									(an_atomic_value.is_date_time_value and another_atomic_value.is_date_time_value) then
									-- OK
								else
									an_action := Unknown_action -- to trigger type error
								end
							end
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
									if an_atomic_value.is_convertible (type_factory.numeric_type) and another_atomic_value.is_convertible (type_factory.numeric_type) then
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
										create {XM_XPATH_INVALID_VALUE} last_evaluated_item.make (error_value)
									end
								else
									a_string := STRING_.appended_string ("Unsuitable operands for arithmetic operation (", an_atomic_value.item_type.conventional_name)
									a_string := STRING_.appended_string (a_string, ", ")
									a_string := STRING_.appended_string (a_string, another_atomic_value.item_type.conventional_name)
									a_string := STRING_.appended_string (a_string,  ")")
									set_last_error_from_string (a_string, Xpath_errors_uri, "XPTY0004", Type_error)
									create {XM_XPATH_INVALID_VALUE} last_evaluated_item.make (error_value)
								end
							end
						end
					end
				end
			end
		end

feature {XM_XPATH_ARITHMETIC_EXPRESSION} -- Local

	type_check_arithmetic_expression  (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Perform static type checking of `Current' and its subexpressions
		require
			a_context_not_void: a_context /= Void
			first_operand_not_in_error: not first_operand.is_error
			second_operand_not_in_error: not second_operand.is_error
		local
			l_type, l_second_type: XM_XPATH_ITEM_TYPE
			l_action: INTEGER
			a_string: STRING
			l_expression: XM_XPATH_EXPRESSION
		do
			l_type := first_operand.item_type
			l_second_type := second_operand.item_type
			l_action := action (l_type, l_second_type, operator)
			if l_action = Date_difference_action then
				if (first_operand.is_date_value and second_operand.is_date_value) or
					(first_operand.is_time_value and second_operand.is_time_value) or
					(first_operand.is_date_time_value and second_operand.is_date_time_value) then
					-- OK
				else
					l_action := Unknown_action -- to trigger type error
				end
			end
			inspect
				l_action
			when Numeric_arithmetic_action then
				create {XM_XPATH_NUMERIC_ARITHMETIC} l_expression.make (first_operand, operator, second_operand)
			when Duration_addition_action then
				create {XM_XPATH_DURATION_ADDITION} l_expression.make (first_operand, operator, second_operand)
			when Duration_multiplication_action then
				create {XM_XPATH_DURATION_MULTIPLICATION} l_expression.make (first_operand, operator, second_operand)
			when Date_and_duration_action then
				create {XM_XPATH_DATE_AND_DURATION} l_expression.make (first_operand, operator, second_operand)
			when Date_difference_action then
				create {XM_XPATH_DATE_DIFFERENCE} l_expression.make (first_operand, operator, second_operand)
			else

				-- Either the types are not known yet, or they are wrong

				if is_sub_type (l_type, type_factory.any_atomic_type) and
					l_type /= type_factory.untyped_atomic_type and
					l_type /= type_factory.any_atomic_type and
					is_sub_type (l_second_type, type_factory.any_atomic_type) and
					l_second_type /= type_factory.untyped_atomic_type and
					l_second_type /= type_factory.any_atomic_type then
					a_string := STRING_.appended_string ("Unsuitable operands for arithmetic operation (", l_type.conventional_name)
					a_string := STRING_.appended_string (a_string, ", ")
					a_string := STRING_.appended_string (a_string, l_second_type.conventional_name)
					a_string := STRING_.appended_string (a_string,  ")")
					set_last_error_from_string (a_string, Xpath_errors_uri, "XPTY0004", Type_error)
				end
			end
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
			if (is_sub_type (t1, type_factory.numeric_type) or is_sub_type (t1, type_factory.untyped_atomic_type))
				and (is_sub_type (t2, type_factory.numeric_type) or is_sub_type (t2, type_factory.untyped_atomic_type)) then
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
			if (t1 = type_factory.year_month_duration_type or t1 = type_factory.day_time_duration_type) and is_sub_type (t2, type_factory.numeric_type) then
				Result := t1
			elseif(is_sub_type (t1, type_factory.numeric_type) or is_sub_type (t1, type_factory.untyped_atomic_type))
				and  (is_sub_type (t2, type_factory.numeric_type) or is_sub_type (t2, type_factory.untyped_atomic_type)) then
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
			if (t1 = type_factory.year_month_duration_type or t1 = type_factory.day_time_duration_type) and is_sub_type (t2, type_factory.numeric_type) then
				Result := t1
			elseif (t2 = type_factory.year_month_duration_type or t2 = type_factory.day_time_duration_type) and is_sub_type (t1, type_factory.numeric_type) then
				Result := t2
			elseif(is_sub_type (t1, type_factory.numeric_type) or is_sub_type (t1, type_factory.untyped_atomic_type))
				and (is_sub_type (t2, type_factory.numeric_type) or is_sub_type (t2, type_factory.untyped_atomic_type)) then
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
			if (is_sub_type (t1, type_factory.numeric_type) or is_sub_type (t1, type_factory.untyped_atomic_type))
				and (is_sub_type (t2, type_factory.numeric_type) or is_sub_type (t2, type_factory.untyped_atomic_type)) then
				Result := type_factory.numeric_type
			elseif t1 = type_factory.date_type and (t2 = type_factory.year_month_duration_type or t2 = type_factory.day_time_duration_type) then
				Result := type_factory.date_type
			elseif t2 = type_factory.date_type and (t1 = type_factory.year_month_duration_type or t1 = type_factory.day_time_duration_type) then
				Result := type_factory.date_type
			elseif t1 = type_factory.time_type and (t2 = type_factory.year_month_duration_type or t2 = type_factory.day_time_duration_type) then
				Result := type_factory.time_type
			elseif t2 = type_factory.time_type and (t1 = type_factory.year_month_duration_type or t1 = type_factory.day_time_duration_type) then
				Result := type_factory.time_type
			elseif t1 = type_factory.date_time_type and t2 = type_factory.date_time_type then
				Result := type_factory.date_time_type
			elseif t1 = type_factory.date_time_type and (t2 = type_factory.year_month_duration_type or t2 = type_factory.day_time_duration_type) then
				Result := type_factory.date_time_type					
			elseif t1= type_factory.year_month_duration_type and t2 = type_factory.year_month_duration_type then
				Result := t1 
			elseif t1 = type_factory.day_time_duration_type and t2 = type_factory.day_time_duration_type then
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
			if (is_sub_type (t1, type_factory.numeric_type) or is_sub_type (t1, type_factory.untyped_atomic_type))
				and (is_sub_type (t2, type_factory.numeric_type) or is_sub_type (t2, type_factory.untyped_atomic_type)) then
				Result := type_factory.numeric_type
			elseif t1 = type_factory.date_type and t2 = type_factory.date_type then
				Result := type_factory.day_time_duration_type
			elseif t1 = type_factory.date_type and (t2 = type_factory.year_month_duration_type or t2 = type_factory.day_time_duration_type) then
				Result := type_factory.date_type
			elseif t1 = type_factory.time_type and t2 = type_factory.time_type then
				Result := type_factory.day_time_duration_type
			elseif t1 = type_factory.time_type and (t2 = type_factory.year_month_duration_type or t2 = type_factory.day_time_duration_type) then
				Result := type_factory.time_type
			elseif t1 = type_factory.date_time_type and t2 = type_factory.date_time_type then
				Result := type_factory.day_time_duration_type
			elseif t1 = type_factory.date_time_type and (t2 = type_factory.year_month_duration_type or t2 = type_factory.day_time_duration_type) then
				Result := type_factory.date_time_type
			elseif t1= type_factory.year_month_duration_type and t2 = type_factory.year_month_duration_type then
				Result := t1 
			elseif t1 = type_factory.day_time_duration_type and t2 = type_factory.day_time_duration_type then
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
			l_type, l_second_type: XM_XPATH_ITEM_TYPE
		do
			if is_sub_type (t1, type_factory.numeric_type) then l_type := t1 else l_type := type_factory.double_type end
			if is_sub_type (t2, type_factory.numeric_type) then l_second_type := t1 else l_second_type := type_factory.double_type end
			if l_type = l_second_type then
				Result := l_type
			elseif l_type = type_factory.double_type or l_second_type = type_factory.double_type then
				Result := type_factory.double_type
			elseif l_type = type_factory.decimal_type or l_second_type = type_factory.decimal_type then
				Result := type_factory.decimal_type
				-- Add in float for scehma-aware
			else
				Result := type_factory.integer_type
			end
		ensure
			result_type_not_void: Result /= Void
		end

feature {NONE} -- Optimization

	create_1_0_expression  (a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Create XPath 1.0 compatibility expression.
		require
			a_context_not_void: a_context /= Void
			context_item_may_not_be_set: True
			no_previous_error: not is_error
			not_replaced: not was_expression_replaced
			static_properties_computed: are_static_properties_computed
		local
			l_nan: XM_XPATH_DOUBLE_VALUE
			l_backwards: XM_XPATH_ARITHMETIC10_EXPRESSION
		do
			if first_operand.cardinality_is_empty or second_operand.cardinality_is_empty then
				create l_nan.make_nan
				set_replacement (l_nan)
			else
				create l_backwards.make (first_operand, operator, second_operand)
				l_backwards.check_static_type (a_context, a_context_item_type)
				if l_backwards.was_expression_replaced then
					set_replacement (l_backwards.replacement_expression)
				else
					set_replacement (l_backwards)
				end
			end
		end

end
	
