indexing

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

create

	make

feature -- Access


	item_type: XM_XPATH_ITEM_TYPE is
			--Determine the data type of the expression, if possible
		do
			Result := type_factory.any_atomic_type
		end

feature -- Optimization

	check_static_type (a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform static type-checking of `Current' and its subexpressions.
		local
			l_type, l_second_type: XM_XPATH_ITEM_TYPE
			l_action: INTEGER
			l_expression: XM_XPATH_EXPRESSION
			l_numeric_arithmetic: XM_XPATH_NUMERIC_ARITHMETIC
		do
			l_type := first_operand.item_type
			l_second_type := second_operand.item_type
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
				set_replacement (l_expression)
			end
		end

feature -- Evaluation

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate `Current' as a single item;
			-- We only take this path if the type could not be determined statically.
		local
			l_atomic_value, l_second_atomic_value: XM_XPATH_ATOMIC_VALUE
		do
			first_operand.evaluate_item (a_context)
			if first_operand.last_evaluated_item = Void then
				create {XM_XPATH_DOUBLE_VALUE} last_evaluated_item.make_nan
			elseif first_operand.last_evaluated_item.is_error then
				last_evaluated_item := first_operand.last_evaluated_item
			else
				if not first_operand.last_evaluated_item.is_atomic_value then
					create {XM_XPATH_DOUBLE_VALUE} last_evaluated_item.make_nan
				else
					l_atomic_value := first_operand.last_evaluated_item.as_atomic_value
					if l_atomic_value.is_boolean_value or l_atomic_value.is_string_value or l_atomic_value.is_numeric_value then
						if l_atomic_value.is_convertible (type_factory.double_type) then
							l_atomic_value := l_atomic_value.convert_to_type (type_factory.double_type)
						else
							create {XM_XPATH_DOUBLE_VALUE} last_evaluated_item.make_nan
						end
					end
				end
				if last_evaluated_item = Void then -- no error yet
					second_operand.evaluate_item (a_context)
					if second_operand.last_evaluated_item = Void then
						create {XM_XPATH_DOUBLE_VALUE} last_evaluated_item.make_nan
					elseif second_operand.last_evaluated_item.is_error then
						last_evaluated_item := second_operand.last_evaluated_item
					else
						if not second_operand.last_evaluated_item.is_atomic_value then
							create {XM_XPATH_DOUBLE_VALUE} last_evaluated_item.make_nan
						else
							l_second_atomic_value := second_operand.last_evaluated_item.as_atomic_value
							if l_second_atomic_value.is_boolean_value or l_second_atomic_value.is_string_value or l_second_atomic_value.is_numeric_value then
								if l_second_atomic_value.is_convertible (type_factory.double_type) then
									l_second_atomic_value := l_second_atomic_value.convert_to_type (type_factory.double_type)
								else
									create {XM_XPATH_DOUBLE_VALUE} last_evaluated_item.make_nan
								end
							end
						end
					end
				end
				if last_evaluated_item = Void then -- no error yet
					evaluate_item_stage_2 (a_context, l_atomic_value, l_second_atomic_value)
				end
			end
		end

feature {NONE} -- Evaluation

	evaluate_item_stage_2 (a_context: XM_XPATH_CONTEXT; a_first_operand, a_second_operand: XM_XPATH_ATOMIC_VALUE) is
			-- Evaluate `Current' as a single item.
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
				l_numeric_arithmetic.evaluate_item (a_context)
				last_evaluated_item := l_expression.last_evaluated_item
			when Duration_addition_action then
				create {XM_XPATH_DURATION_ADDITION} l_expression.make (a_first_operand, operator, a_second_operand)
				l_expression.evaluate_item (a_context)
				last_evaluated_item := l_expression.last_evaluated_item
			when Duration_multiplication_action then
				create {XM_XPATH_DURATION_MULTIPLICATION} l_expression.make (a_first_operand, operator, a_second_operand)
				l_expression.evaluate_item (a_context)
				last_evaluated_item := l_expression.last_evaluated_item
			when Duration_division_action then
				create {XM_XPATH_DURATION_DIVISION} l_expression.make (a_first_operand, operator, a_second_operand)
				l_expression.evaluate_item (a_context)
				last_evaluated_item := l_expression.last_evaluated_item
			when Date_and_duration_action then
				create {XM_XPATH_DATE_AND_DURATION} l_expression.make (a_first_operand, operator, a_second_operand)
				l_expression.evaluate_item (a_context)
				last_evaluated_item := l_expression.last_evaluated_item
			when Date_difference_action then
				create {XM_XPATH_DATE_DIFFERENCE} l_expression.make (a_first_operand, operator, a_second_operand)
				l_expression.evaluate_item (a_context)
				last_evaluated_item := l_expression.last_evaluated_item
			else
				l_string := STRING_.appended_string ("Unsuitable operands for arithmetic operation (", a_first_operand.item_type.conventional_name)
				l_string := STRING_.appended_string (l_string, ", ")
				l_string := STRING_.appended_string (l_string, a_second_operand.item_type.conventional_name)
				l_string := STRING_.appended_string (l_string,  ")")
				set_last_error_from_string (l_string, Xpath_errors_uri, "XPTY0004", Type_error)
				create {XM_XPATH_INVALID_VALUE} last_evaluated_item.make (error_value)
			end
		end

end
