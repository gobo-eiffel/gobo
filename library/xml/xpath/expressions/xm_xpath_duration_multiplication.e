indexing

	description:

	"Objects that handle multiplication and scalar division of XPath durations"

library: "Gobo Eiffel XPath Library"
copyright: "Copyright (c) 2004, Colin Adams and others"
license: "Eiffel Forum License v2 (see forum.txt)"
date: "$Date$"
revision: "$Revision$"

class XM_XPATH_DURATION_MULTIPLICATION

inherit
	
	XM_XPATH_ARITHMETIC_EXPRESSION
		redefine
			evaluate_item
		end

create

	make

feature -- Evaluation

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate `Current' as a single item;
			-- We only take this path if the type could not be determined statically.
		local
			a_duration_value: XM_XPATH_DURATION_VALUE
			a_duration: DT_DATE_TIME_DURATION
			a_numeric_value: XM_XPATH_NUMERIC_VALUE
		do
			first_operand.evaluate_item (a_context)
			if first_operand.last_evaluated_item = Void then
				last_evaluated_item := Void
			elseif first_operand.last_evaluated_item.is_error then
				last_evaluated_item := first_operand.last_evaluated_item
			else
				a_duration_value := first_operand.last_evaluated_item.as_atomic_value.as_duration_value
				second_operand.evaluate_item (a_context)
				if second_operand.last_evaluated_item = Void then
				last_evaluated_item := Void
				elseif second_operand.last_evaluated_item.is_error then
					last_evaluated_item := second_operand.last_evaluated_item
				else
					a_numeric_value := second_operand.last_evaluated_item.as_numeric_value
					if operator = Multiply_token then
						if a_numeric_value.is_nan then
							create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make_from_string ("Multiplication by NaN", Xpath_errors_uri, "FOCA0005", Dynamic_error)
						elseif a_numeric_value.is_zero then
							create a_duration.make (0, 0, 0, 0, 0, 0)
							create {XM_XPATH_MONTHS_DURATION_VALUE} last_evaluated_item.make_from_duration (a_duration)
						elseif a_numeric_value.is_infinite then
							create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make_from_string ("Multiplication by Infinity", Xpath_errors_uri, "FODT0002", Dynamic_error)
						else
							last_evaluated_item := a_duration_value.multiply (a_numeric_value.as_double)
						end
					else
						check
							minus: operator = Division_token
						end
						if a_numeric_value.is_nan then
							create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make_from_string ("Division by NaN", Xpath_errors_uri, "FOCA0005", Dynamic_error)
						elseif a_numeric_value.is_zero then
							create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make_from_string ("Division by zero", Xpath_errors_uri, "FODT0002", Dynamic_error)
						elseif a_numeric_value.is_infinite then
							create a_duration.make (0, 0, 0, 0, 0, 0)
							create {XM_XPATH_MONTHS_DURATION_VALUE} last_evaluated_item.make_from_duration (a_duration)
						else
							last_evaluated_item := a_duration_value.scalar_divide (a_numeric_value.as_double)
						end
					end
				end
			end
		end

end
	
