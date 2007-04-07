indexing

	description:

	"Objects that handle addition and subtraction of XPath Date, Date-time and Time and a duration"

library: "Gobo Eiffel XPath Library"
copyright: "Copyright (c) 2004, Colin Adams and others"
license: "MIT License"
date: "$Date$"
revision: "$Revision$"

class XM_XPATH_DATE_AND_DURATION

inherit
	
	XM_XPATH_ARITHMETIC_EXPRESSION
		redefine
			make, evaluate_item
		end

create

	make

feature {NONE} -- Initialization

	make (a_operand_one: XM_XPATH_EXPRESSION; a_token: INTEGER; a_operand_two: XM_XPATH_EXPRESSION) is
			-- Establish invariant
		do

			-- One operand is a date/dateTime/time, the other is a duration.
			-- We normalize so that `second_operand' is a duration.

			if a_operand_one.is_duration_value then
				Precursor (a_operand_two, a_token, a_operand_one)
			else
				Precursor (a_operand_one, a_token, a_operand_two)
			end
		end

feature -- Evaluation

	evaluate_item (a_result: DS_CELL [XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a single item to `a_result'.
			-- We only take this path if the type could not be determined statically.
		local
			l_calendar_value: XM_XPATH_CALENDAR_VALUE
			l_duration: XM_XPATH_DURATION_VALUE
			l_item: XM_XPATH_ITEM
		do
			first_operand.evaluate_item (a_result, a_context)
			if a_result.item = Void or else a_result.item.is_error then
				-- nothing to do
			else
				l_item := a_result.item
				a_result.put (Void)
				second_operand.evaluate_item (a_result, a_context)
				if a_result.item = Void or else a_result.item.is_error then
					-- nothing to do
				else
					l_calendar_value := l_item.as_atomic_value.as_calendar_value
					l_duration := a_result.item.as_atomic_value.as_duration_value
					if operator = Plus_token then
						a_result.put (l_calendar_value.plus (l_duration))
					else
						check
							minus: operator = Minus_token
						end
						l_item := l_duration.multiply (-1.0)
						if l_item.is_error then
							a_result.put (l_item)
						else
							l_duration := l_item.as_atomic_value.as_duration_value
							a_result.put (l_calendar_value.plus (l_duration))
						end
					end
				end
			end
		end

invariant

		second_operand_is_duration: initialized implies is_sub_type (second_operand.item_type, type_factory.duration_type)

end
	
