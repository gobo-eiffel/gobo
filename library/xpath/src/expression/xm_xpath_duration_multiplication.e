note

	description:

		"Objects that handle multiplication and scalar division of XPath durations"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004-2015, Colin Adams and others"
	license: "MIT License"

class XM_XPATH_DURATION_MULTIPLICATION

inherit

	XM_XPATH_ARITHMETIC_EXPRESSION
		redefine
			make, evaluate_item
		end

create

	make

feature {NONE} -- Initialization

	make (a_operand_one: XM_XPATH_EXPRESSION; a_token: INTEGER; a_operand_two: XM_XPATH_EXPRESSION)
			-- Establish invariant
		do
			-- One of the operands evaluates to a duration - we ensure it is the first one.
			if is_sub_type (a_operand_one.item_type, type_factory.duration_type) then
				Precursor (a_operand_one, a_token, a_operand_two)
			else
				check
					second_operand_is_duration: is_sub_type (a_operand_two.item_type, type_factory.duration_type)
				end
				Precursor (a_operand_two, a_token, a_operand_one)
			end
			initialized := True
		end

feature -- Evaluation

	evaluate_item (a_result: DS_CELL [detachable XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT)
			-- Evaluate as a single item to `a_result'.
			-- We only take this path if the type could not be determined statically.
		local
			l_duration_value: XM_XPATH_DURATION_VALUE
			l_duration: DT_DATE_TIME_DURATION
			l_numeric_value: XM_XPATH_NUMERIC_VALUE
		do
			first_operand.evaluate_item (a_result, a_context)
			if not attached a_result.item as l_result_item or else l_result_item.is_error then
				-- nothing to do
			else
				l_duration_value := l_result_item.as_atomic_value.as_duration_value
				a_result.put (Void)
				second_operand.evaluate_item (a_result, a_context)
				if not attached a_result.item as l_result_item_2 or else l_result_item_2.is_error then
					-- nothing to do
				else
					l_numeric_value := l_result_item_2.as_numeric_value
					if operator = Multiply_token then
						if l_numeric_value.is_nan then
							a_result.put (create {XM_XPATH_INVALID_ITEM}.make_from_string ("Multiplication by NaN", Xpath_errors_uri, "FOCA0005", Dynamic_error))
						elseif l_numeric_value.is_zero then
							create l_duration.make (0, 0, 0, 0, 0, 0)
							if l_duration_value.is_months_duration then
								a_result.put (create {XM_XPATH_MONTHS_DURATION_VALUE}.make_from_duration (l_duration))
							else
								a_result.put (create {XM_XPATH_SECONDS_DURATION_VALUE}.make_from_duration (l_duration))
							end
						elseif l_numeric_value.is_infinite then
							a_result.put (create {XM_XPATH_INVALID_ITEM}.make_from_string ("Multiplication by Infinity", Xpath_errors_uri, "FODT0002", Dynamic_error))
						else
							a_result.put (l_duration_value.multiply (l_numeric_value.as_double))
						end
					else
						check
							division: operator = Division_token
						end
						if l_numeric_value.is_nan then
							a_result.put (create {XM_XPATH_INVALID_ITEM}.make_from_string ("Division by NaN", Xpath_errors_uri, "FOCA0005", Dynamic_error))
						elseif l_numeric_value.is_zero then
							a_result.put (create {XM_XPATH_INVALID_ITEM}.make_from_string ("Division by zero", Xpath_errors_uri, "FODT0002", Dynamic_error))
						elseif l_numeric_value.is_infinite then
							create l_duration.make (0, 0, 0, 0, 0, 0)
							if l_duration_value.is_months_duration then
								a_result.put (create {XM_XPATH_MONTHS_DURATION_VALUE}.make_from_duration (l_duration))
							else
								a_result.put (create {XM_XPATH_SECONDS_DURATION_VALUE}.make_from_duration (l_duration))
							end
						else
							a_result.put (l_duration_value.scalar_divide (l_numeric_value.as_double))
						end
					end
				end
			end
		end

invariant

	first_operand_is_duration: is_sub_type (first_operand.item_type, type_factory.duration_type)
	operator: operator = Multiply_token xor operator = Division_token

end

