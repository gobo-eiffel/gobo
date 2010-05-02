note

	description:

		"XPath 1.0 compatibility-mode arithmetic expressons"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2006, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_ARITHMETIC10_EXPRESSION

inherit

	XM_XPATH_BINARY_EXPRESSION
		redefine
			check_static_type, evaluate_item
		end

	XM_XPATH_ARITHMETIC_ROUTINES

	XM_XPATH_ROLE
		export {NONE} all end

create

	make

feature -- Access


	item_type: XM_XPATH_ITEM_TYPE
			--Determine the data type of the expression, if possible
		do
			Result := type_factory.any_atomic_type
		end

feature -- Optimization

	check_static_type (a_replacement: DS_CELL [XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE)
			-- Perform static type-checking of `Current' and its subexpressions.
		local
			l_sequence_type: XM_XPATH_SEQUENCE_TYPE
			l_role, l_other_role: XM_XPATH_ROLE_LOCATOR
			l_type_checker: XM_XPATH_TYPE_CHECKER
			l_type, l_second_type: XM_XPATH_ITEM_TYPE
			l_action: INTEGER
			l_expression: XM_XPATH_EXPRESSION
			l_numeric_arithmetic: XM_XPATH_NUMERIC_ARITHMETIC
			l_replacement: DS_CELL [XM_XPATH_EXPRESSION]
		do
			if first_operand.is_empty_sequence or second_operand.is_empty_sequence then
				set_replacement (a_replacement, create {XM_XPATH_DOUBLE_VALUE}.make_nan)
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
						l_type_checker.static_type_check (a_context, first_operand, l_sequence_type, True, l_role)
						if l_type_checker.is_static_type_check_error then
							set_replacement (a_replacement, create {XM_XPATH_INVALID_VALUE}.make (l_type_checker.static_type_check_error))
						else
							set_first_operand (l_type_checker.checked_expression)
							l_type := first_operand.item_type
							set_first_operand (converted_operand (first_operand, l_type))
							l_type := first_operand.item_type
							if first_operand.cardinality_is_empty then
								set_replacement (a_replacement, create {XM_XPATH_DOUBLE_VALUE}.make_nan)
							else
								create l_other_role.make (Binary_expression_role, token_name (operator), 2, Xpath_errors_uri, "XPTY0004")
								l_type_checker.static_type_check (a_context, second_operand, l_sequence_type, True, l_other_role)
								if l_type_checker.is_static_type_check_error then
									set_replacement (a_replacement, create {XM_XPATH_INVALID_VALUE}.make (l_type_checker.static_type_check_error))
								else
									set_second_operand (l_type_checker.checked_expression)
									l_second_type := second_operand.item_type
									set_second_operand (converted_operand (second_operand, l_second_type))
									l_second_type := second_operand.item_type
									if second_operand.cardinality_is_empty then
										set_replacement (a_replacement, create {XM_XPATH_DOUBLE_VALUE}.make_nan)
									else
										if l_type = type_factory.boolean_type or l_type = type_factory.string_type then
											l_type := type_factory.numeric_type
										end
										if l_second_type = type_factory.boolean_type or l_second_type = type_factory.string_type then
											l_second_type := type_factory.numeric_type
										end
										l_action := action (l_type.primitive_type, l_second_type.primitive_type, operator)
										inspect
											l_action
										when Numeric_arithmetic_action then
											create l_numeric_arithmetic.make (first_operand, operator, second_operand)
											l_numeric_arithmetic.set_backwards_compatible_mode
											l_expression := l_numeric_arithmetic
										when Date_and_duration_action then
											create {XM_XPATH_DATE_AND_DURATION} l_expression.make (first_operand, operator, second_operand)
										when Date_difference_action then
											create {XM_XPATH_DATE_DIFFERENCE} l_expression.make (first_operand, operator, second_operand)
										when Duration_addition_action then
											create {XM_XPATH_DURATION_ADDITION} l_expression.make (first_operand, operator, second_operand)
										when Duration_multiplication_action then
											create {XM_XPATH_DURATION_MULTIPLICATION} l_expression.make (first_operand, operator, second_operand)
										when Duration_division_action then
											create {XM_XPATH_DURATION_DIVISION} l_expression.make (first_operand, operator, second_operand)
										when Unknown_action then
											-- defer to runtime
										end
										if l_expression /= Void then
											set_replacement (a_replacement, l_expression)
										end
									end
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

	evaluate_item (a_result: DS_CELL [XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT)
			-- Evaluate as a single item to `a_result'.
			-- We only take this path if the type could not be determined statically.
		local
			l_atomic_value, l_second_atomic_value: XM_XPATH_ATOMIC_VALUE
		do
			first_operand.evaluate_item (a_result, a_context)
			if a_result.item = Void then
				a_result.put (create {XM_XPATH_DOUBLE_VALUE}.make_nan)
			elseif a_result.item.is_error then
				-- nothing to do
			else
				if not a_result.item.is_atomic_value then
					a_result.put (create {XM_XPATH_DOUBLE_VALUE}.make_nan)
				else
					l_atomic_value := a_result.item.as_atomic_value
					a_result.put (Void)
					if l_atomic_value.is_boolean_value or l_atomic_value.is_string_value or l_atomic_value.is_numeric_value then
						if l_atomic_value.is_convertible (type_factory.double_type) then
							l_atomic_value.convert_to_type (type_factory.double_type)
							l_atomic_value := l_atomic_value.converted_value
						else
							a_result.put (create {XM_XPATH_DOUBLE_VALUE}.make_nan)
						end
					end
				end
				if a_result.item = Void then -- no error yet
					second_operand.evaluate_item (a_result, a_context)
					if a_result.item = Void then
						a_result.put (create {XM_XPATH_DOUBLE_VALUE}.make_nan)
					elseif a_result.item.is_error then
						-- nothing to do
					else
						if not a_result.item.is_atomic_value then
							a_result.put (create {XM_XPATH_DOUBLE_VALUE}.make_nan)
						else
							a_result.put (Void)
							l_second_atomic_value := a_result.item.as_atomic_value
							if l_second_atomic_value.is_boolean_value or l_second_atomic_value.is_string_value or l_second_atomic_value.is_numeric_value then
								if l_second_atomic_value.is_convertible (type_factory.double_type) then
									l_second_atomic_value.convert_to_type (type_factory.double_type)
									l_second_atomic_value := l_second_atomic_value.converted_value
								else
									a_result.put (create {XM_XPATH_DOUBLE_VALUE}.make_nan)
								end
							end
						end
					end
				end
				if a_result.item = Void then -- no error yet
					evaluate_item_stage_2 (a_result, a_context, l_atomic_value, l_second_atomic_value)
				end
			end
		end

feature {NONE} -- Evaluation

	evaluate_item_stage_2 (a_result: DS_CELL [XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT; a_first_operand, a_second_operand: XM_XPATH_ATOMIC_VALUE)
			-- Evaluate `Current' as a single item.
		require
			a_result_not_void: a_result /= Void
			a_result_empty: a_result.item = Void
		local
			l_action: INTEGER
			l_numeric_arithmetic: XM_XPATH_NUMERIC_ARITHMETIC
			l_expression: XM_XPATH_EXPRESSION
			l_string: STRING
		do
			l_action := action (a_first_operand.item_type.primitive_type, a_second_operand.item_type.primitive_type, operator)
			inspect
				l_action
			when Numeric_arithmetic_action then
				create l_numeric_arithmetic.make (first_operand, operator, second_operand)
				l_numeric_arithmetic.set_backwards_compatible_mode
				l_numeric_arithmetic.evaluate_item (a_result, a_context)
			when Duration_addition_action then
				create {XM_XPATH_DURATION_ADDITION} l_expression.make (a_first_operand, operator, a_second_operand)
				l_expression.evaluate_item (a_result, a_context)
			when Duration_multiplication_action then
				create {XM_XPATH_DURATION_MULTIPLICATION} l_expression.make (a_first_operand, operator, a_second_operand)
				l_expression.evaluate_item (a_result, a_context)
			when Duration_division_action then
				create {XM_XPATH_DURATION_DIVISION} l_expression.make (a_first_operand, operator, a_second_operand)
				l_expression.evaluate_item (a_result, a_context)
			when Date_and_duration_action then
				create {XM_XPATH_DATE_AND_DURATION} l_expression.make (a_first_operand, operator, a_second_operand)
				l_expression.evaluate_item (a_result, a_context)
			when Date_difference_action then
				create {XM_XPATH_DATE_DIFFERENCE} l_expression.make (a_first_operand, operator, a_second_operand)
				l_expression.evaluate_item (a_result, a_context)
			else
				l_string := STRING_.appended_string ("Unsuitable operands for arithmetic operation (", a_first_operand.item_type.conventional_name)
				l_string := STRING_.appended_string (l_string, ", ")
				l_string := STRING_.appended_string (l_string, a_second_operand.item_type.conventional_name)
				l_string := STRING_.appended_string (l_string,  ")")
				set_last_error_from_string (l_string, Xpath_errors_uri, "XPTY0004", Type_error)
				a_result.put (create {XM_XPATH_INVALID_VALUE}.make (error_value))
			end
		end

feature {NONE} -- Implementation

	converted_operand (a_expression: XM_XPATH_EXPRESSION; a_type: XM_XPATH_ITEM_TYPE): XM_XPATH_EXPRESSION
			-- `a_expression' wrapped in conversion code
		require
			a_expression_not_void: a_expression /= Void
			a_type_not_void: a_type /= Void
		local
			l_first: XM_XPATH_FIRST_ITEM_EXPRESSION
			l_number: XM_XPATH_NUMBER
			l_args: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]
		do
			if a_expression.cardinality_allows_many then
				create l_first.make (a_expression)
				l_first.set_parent (Current)
				Result := l_first
			else
				Result := a_expression
			end
			if not is_sub_type (a_type, type_factory.double_type) then
				create l_number.make
				if Result.is_computed_expression then
					l_number.set_parent (Result.as_computed_expression.container)
				end
				create l_args.make (1)
				l_args.put (Result, 1)
				l_number.set_arguments (l_args)
				Result := l_number
			end
		ensure
			converted_operand_not_void: Result /= Void
		end

end
