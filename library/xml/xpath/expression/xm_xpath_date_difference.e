indexing

	description:

	"Objects that handle subtraction of two XPath Date, Date-time and Times"

library: "Gobo Eiffel XPath Library"
copyright: "Copyright (c) 2004, Colin Adams and others"
license: "Eiffel Forum License v2 (see forum.txt)"
date: "$Date$"
revision: "$Revision$"

class XM_XPATH_DATE_DIFFERENCE

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
			a_calendar_value, another_calendar_value: XM_XPATH_CALENDAR_VALUE
		do
			first_operand.evaluate_item (a_context)
			if first_operand.last_evaluated_item = Void then
				last_evaluated_item := Void
			elseif first_operand.last_evaluated_item.is_error then
				last_evaluated_item := first_operand.last_evaluated_item
			else
				second_operand.evaluate_item (a_context)
				if second_operand.last_evaluated_item = Void then
				last_evaluated_item := Void
				elseif second_operand.last_evaluated_item.is_error then
					last_evaluated_item := second_operand.last_evaluated_item
				else
					a_calendar_value := first_operand.last_evaluated_item.as_atomic_value.as_calendar_value
					another_calendar_value := second_operand.last_evaluated_item.as_atomic_value.as_calendar_value
					check
						minus: operator = Minus_token
					end
					if a_calendar_value.is_date_value then
						last_evaluated_item := a_calendar_value.as_date_value.minus (another_calendar_value.as_date_value, a_context)
					elseif a_calendar_value.is_date_time_value then
						last_evaluated_item := a_calendar_value.as_date_time_value.minus (another_calendar_value.as_date_time_value, a_context)
					elseif a_calendar_value.is_time_value then
						last_evaluated_item := a_calendar_value.as_time_value.minus (another_calendar_value.as_time_value, a_context)
					end
				end
			end
		end

end
	
