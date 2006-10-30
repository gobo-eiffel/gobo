indexing

	description:

	"Objects that handle addition and subtraction of XPath Date, Date-time and Time and a duration"

library: "Gobo Eiffel XPath Library"
copyright: "Copyright (c) 2004, Colin Adams and others"
license: "Eiffel Forum License v2 (see forum.txt)"
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

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate `Current' as a single item;
			-- We only take this path if the type could not be determined statically.
		local
			a_calendar_value: XM_XPATH_CALENDAR_VALUE
			a_duration: XM_XPATH_DURATION_VALUE
			an_item: XM_XPATH_ITEM
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
					a_duration := second_operand.last_evaluated_item.as_atomic_value.as_duration_value
					if operator = Plus_token then
						last_evaluated_item := a_calendar_value.plus (a_duration)
					else
						check
							minus: operator = Minus_token
						end
						an_item := a_duration.multiply (-1.0)
						if an_item.is_error then
							last_evaluated_item := an_item
						else
							a_duration := an_item.as_atomic_value.as_duration_value
							last_evaluated_item := a_calendar_value.plus (a_duration)
						end
					end
				end
			end
		end

invariant

		second_operand_is_duration: initialized implies is_sub_type (second_operand.item_type, type_factory.duration_type)

end
	
