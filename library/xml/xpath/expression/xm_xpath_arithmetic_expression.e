note

	description:

		"XPath arithmetic expressons"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_ARITHMETIC_EXPRESSION

inherit

	XM_XPATH_BINARY_EXPRESSION
		redefine
			check_static_type, evaluate_item, make, is_arithmetic_expression, as_arithmetic_expression,
			is_valid_operator
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
			l_type, l_other_type: XM_XPATH_ITEM_TYPE
			l_primitive_type, l_other_primitive_type: INTEGER
			l_table: ARRAY [XM_XPATH_ARITHMETIC_SIGNATURE]
			l_table_index: INTEGER
		do
			l_type := first_operand.item_type
			l_other_type := second_operand.item_type
			l_primitive_type := l_type.primitive_type
			l_other_primitive_type := l_other_type.primitive_type

			l_table := signature_table (operator)
			l_table_index := signature_table_index (l_table, l_primitive_type, l_other_primitive_type)

			if l_table_index = 0 then
				-- type not known statically
				Result := type_factory.any_atomic_type
			else
				Result := l_table.item (l_table_index).result_type
				if Result = type_factory.numeric_type then
					Result := lowest_commom_promotion_super_type (l_type, l_other_type)
					-- Exception: integer / integer => decimal
					if operator = Division_token and Result = type_factory.integer_type then
						Result := type_factory.decimal_type
					end
				elseif Result = type_factory.duration_type then
					-- if one of the operands is a subtype of duration, then the result will be the same subtype
					if is_sub_type (l_type, type_factory.day_time_duration_type) then
						Result := type_factory.day_time_duration_type
					elseif is_sub_type (l_other_type, type_factory.day_time_duration_type) then
						Result := type_factory.day_time_duration_type
					elseif is_sub_type (l_type, type_factory.year_month_duration_type) then
						Result := type_factory.year_month_duration_type
					elseif is_sub_type (l_other_type, type_factory.year_month_duration_type) then
						Result := type_factory.year_month_duration_type
					end
				end
			end
		end

feature -- Status report

	is_backwards_compatible_mode: BOOLEAN
			-- Is XPath 1.0 Backwards Compatible Mode used?

	is_valid_operator (a_operator: INTEGER): BOOLEAN is
			-- Is `a_operator' valid for `Current'?
		do
			Result := is_arithmetic_operator	(a_operator)
		end

feature -- Status_setting

	set_backwards_compatible_mode is
			-- Set `is_backwards_compatible_mode' to `True'.
		do
			is_backwards_compatible_mode := True
		ensure
			is_backwards_compatible_mode_set: is_backwards_compatible_mode = True
		end


feature -- Optimization

	check_static_type (a_replacement: DS_CELL [XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform static type-checking of `Current' and its subexpressions.
		local
			l_sequence_type: XM_XPATH_SEQUENCE_TYPE
			l_role, another_role: XM_XPATH_ROLE_LOCATOR
			l_type_checker: XM_XPATH_TYPE_CHECKER
			l_replacement: DS_CELL [XM_XPATH_EXPRESSION]
		do
			is_backwards_compatible_mode := a_context.is_backwards_compatible_mode
			if is_backwards_compatible_mode then
				create_1_0_expression (a_replacement, a_context, a_context_item_type)
			else
				create l_replacement.make (Void)
				first_operand.check_static_type (l_replacement, a_context, a_context_item_type)
				set_first_operand (l_replacement.item)
				if first_operand.is_error then
					set_replacement (a_replacement, first_operand)
				else
					l_replacement.put (Void)
					second_operand.check_static_type (l_replacement, a_context, a_context_item_type)
					set_second_operand (l_replacement.item)
					if second_operand.is_error then
						set_replacement (a_replacement, second_operand)
					else
						create l_sequence_type.make_optional_atomic
						create l_role.make (Binary_expression_role, token_name (operator), 1, Xpath_errors_uri, "XPTY0004")
						create l_type_checker
						l_type_checker.static_type_check (a_context, first_operand, l_sequence_type, False, l_role)
						if l_type_checker.is_static_type_check_error then
							set_replacement (a_replacement, create {XM_XPATH_INVALID_VALUE}.make (l_type_checker.static_type_check_error))
						else
							set_first_operand (l_type_checker.checked_expression)
							create another_role.make (Binary_expression_role, token_name (operator), 2, Xpath_errors_uri, "XPTY0004")
							l_type_checker.static_type_check (a_context, second_operand, l_sequence_type, False, another_role)
							if l_type_checker.is_static_type_check_error then
								set_replacement (a_replacement, create {XM_XPATH_INVALID_VALUE}.make (l_type_checker.static_type_check_error))
							else
								set_second_operand (l_type_checker.checked_expression)
								if first_operand.cardinality_is_empty then
									set_replacement (a_replacement, first_operand)
								elseif second_operand.cardinality_is_empty then
									set_replacement (a_replacement, second_operand)
								else
									Precursor (a_replacement, a_context, a_context_item_type)
									-- TODO: review this:
									--if not not is_error then
									--	type_check_arithmetic_expression (a_context)
									--end
								end
							end
						end
					end
				end
			end
			if a_replacement.item = Void then
				a_replacement.put (Current)
			end
		end

feature -- Evaluation

	evaluate_item (a_result: DS_CELL [XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a single item to `a_result'.
			-- We only take this path if the type could not be determined statically.
		local
			l_atomic_value, l_other_atomic_value: XM_XPATH_ATOMIC_VALUE
			l_action: INTEGER
			l_expression: XM_XPATH_EXPRESSION
			l_numeric_value, l_other_numeric_value: XM_XPATH_NUMERIC_VALUE
			l_string: STRING
		do
			first_operand.evaluate_item (a_result, a_context)
			if a_result.item = Void or else a_result.item.is_error then
				-- nothing to do
			else
				if not a_result.item.is_atomic_value then
					a_result.put (Void)
				else
					l_atomic_value := a_result.item.as_atomic_value
					a_result.put (Void)
					second_operand.evaluate_item (a_result, a_context)
					if a_result.item = Void or else a_result.item.is_error then
						-- nothing to do
					else
						if not a_result.item.is_atomic_value then
							a_result.put (Void)
						else
							l_other_atomic_value := a_result.item.as_atomic_value
							a_result.put (Void)
							l_action := action (l_atomic_value.item_type.primitive_type, l_other_atomic_value.item_type.primitive_type, operator)
							inspect
								l_action
							when Numeric_arithmetic_action then
								create {XM_XPATH_NUMERIC_ARITHMETIC} l_expression.make (l_atomic_value, operator, l_other_atomic_value)
								l_expression.evaluate_item (a_result, a_context)
							when Duration_addition_action then
								create {XM_XPATH_DURATION_ADDITION} l_expression.make (l_atomic_value, operator, l_other_atomic_value)
								l_expression.evaluate_item (a_result, a_context)
							when Duration_multiplication_action then
								create {XM_XPATH_DURATION_MULTIPLICATION} l_expression.make (l_atomic_value, operator, l_other_atomic_value)
								l_expression.evaluate_item (a_result, a_context)
							when Duration_division_action then
								create {XM_XPATH_DURATION_DIVISION} l_expression.make (l_atomic_value, operator, l_other_atomic_value)
								l_expression.evaluate_item (a_result, a_context)
							when Date_and_duration_action then
								create {XM_XPATH_DATE_AND_DURATION} l_expression.make (l_atomic_value, operator, l_other_atomic_value)
								l_expression.evaluate_item (a_result, a_context)
							when Date_difference_action then
								create {XM_XPATH_DATE_DIFFERENCE} l_expression.make (l_atomic_value, operator, l_other_atomic_value)
								l_expression.evaluate_item (a_result, a_context)
							else
								
								-- Types are not known yet. Force to numeric if in 1.0 mode
								
								if is_backwards_compatible_mode then
									if l_atomic_value.is_convertible (type_factory.numeric_type) and l_other_atomic_value.is_convertible (type_factory.numeric_type) then
										l_atomic_value.convert_to_type (type_factory.numeric_type)
										l_numeric_value := l_atomic_value.converted_value.as_numeric_value
										l_other_atomic_value.convert_to_type (type_factory.numeric_type)
										l_other_numeric_value := l_other_atomic_value.converted_value.as_numeric_value
										create {XM_XPATH_NUMERIC_ARITHMETIC} l_expression.make (l_numeric_value, operator, l_other_numeric_value)
										l_expression.evaluate_item (a_result, a_context)
									else
										l_string := STRING_.appended_string ("Unsuitable operands for arithmetic operation (", l_atomic_value.item_type.conventional_name)
										l_string := STRING_.appended_string (l_string, ", ")
										l_string := STRING_.appended_string (l_string, l_other_atomic_value.item_type.conventional_name)
										l_string := STRING_.appended_string (l_string,  ")")
										set_last_error_from_string (l_string, Xpath_errors_uri, "XPTY0004", Type_error)
										a_result.put (create {XM_XPATH_INVALID_VALUE}.make (error_value))
									end
								else
									l_string := STRING_.appended_string ("Unsuitable operands for arithmetic operation (", l_atomic_value.item_type.conventional_name)
									l_string := STRING_.appended_string (l_string, ", ")
									l_string := STRING_.appended_string (l_string, l_other_atomic_value.item_type.conventional_name)
									l_string := STRING_.appended_string (l_string,  ")")
									set_last_error_from_string (l_string, Xpath_errors_uri, "XPTY0004", Type_error)
									a_result.put (create {XM_XPATH_INVALID_VALUE}.make (error_value))
								end
							end
						end
					end
				end
			end
		end

feature {XM_XPATH_ARITHMETIC_EXPRESSION} -- Local

	type_check_arithmetic_expression  (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Perform static type checking of `Current' and its subexpressions.
			-- TODO: this is currently a no-op. review.
		require
			no_previous_error: not is_error
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
			l_action := action (l_type.primitive_type, l_second_type.primitive_type, operator)
			inspect
				l_action
			when Numeric_arithmetic_action then
				create {XM_XPATH_NUMERIC_ARITHMETIC} l_expression.make (first_operand, operator, second_operand)
			when Duration_addition_action then
				create {XM_XPATH_DURATION_ADDITION} l_expression.make (first_operand, operator, second_operand)
			when Duration_multiplication_action then
				create {XM_XPATH_DURATION_MULTIPLICATION} l_expression.make (first_operand, operator, second_operand)
			when Duration_division_action then
				create {XM_XPATH_DURATION_DIVISION} l_expression.make (first_operand, operator, second_operand)				
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

	create_1_0_expression (a_replacement: DS_CELL [XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Create XPath 1.0 compatibility expression.
		require
			no_previous_error: not is_error
			static_properties_computed: are_static_properties_computed
			a_context_not_void: a_context /= Void
			a_context_item_type_not_void: a_context_item_type /= Void
			a_replacement_not_void: a_replacement /= Void
			not_replaced: a_replacement.item = Void			
		local
			l_nan: XM_XPATH_DOUBLE_VALUE
			l_backwards: XM_XPATH_ARITHMETIC10_EXPRESSION
		do
			if first_operand.cardinality_is_empty or second_operand.cardinality_is_empty then
				create l_nan.make_nan
				set_replacement (a_replacement, l_nan)
			else
				create l_backwards.make (first_operand, operator, second_operand)
				l_backwards.check_static_type (a_replacement, a_context, a_context_item_type)
			end
		end

invariant

	valid_operator: is_arithmetic_operator (operator)

end
	
