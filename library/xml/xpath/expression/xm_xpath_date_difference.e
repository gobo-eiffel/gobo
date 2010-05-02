note

	description:

	"Objects that handle subtraction of two XPath Date, Date-time and Times"

library: "Gobo Eiffel XPath Library"
copyright: "Copyright (c) 2004, Colin Adams and others"
license: "MIT License"
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

	evaluate_item (a_result: DS_CELL [XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT)
			-- Evaluate as a single item to `a_result'.
			-- We only take this path if the type could not be determined statically.
		local
			l_calendar_value, l_other_calendar_value: XM_XPATH_CALENDAR_VALUE
		do
			first_operand.evaluate_item (a_result, a_context)
			if a_result.item = Void or else a_result.item.is_error then
				-- nothing to do
			else
				l_calendar_value := a_result.item.as_atomic_value.as_calendar_value
				a_result.put (Void)
				second_operand.evaluate_item (a_result, a_context)
				if a_result.item = Void or else a_result.item.is_error then
					-- nothing to do
				else
					l_other_calendar_value := a_result.item.as_atomic_value.as_calendar_value
					if l_calendar_value.is_date_value then
						a_result.put (l_calendar_value.as_date_value.minus (l_other_calendar_value.as_date_value, a_context))
					elseif l_calendar_value.is_date_time_value then
						a_result.put (l_calendar_value.as_date_time_value.minus (l_other_calendar_value.as_date_time_value, a_context))
					elseif l_calendar_value.is_time_value then
						a_result.put (l_calendar_value.as_time_value.minus (l_other_calendar_value.as_time_value, a_context))
					else
						a_result.put (Void)
					end
				end
			end
		end

invariant

	minus: operator = Minus_token

end

