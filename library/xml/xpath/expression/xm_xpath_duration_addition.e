note

	description:

	"Objects that handle addition and subtraction of XPath durations"

library: "Gobo Eiffel XPath Library"
copyright: "Copyright (c) 2004, Colin Adams and others"
license: "MIT License"
date: "$Date$"
revision: "$Revision$"

class XM_XPATH_DURATION_ADDITION

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
			l_duration, l_other_duration: XM_XPATH_DURATION_VALUE
		do
			first_operand.evaluate_item (a_result, a_context)
			if a_result.item = Void or else a_result.item.is_error then
				-- nothing to do
			else
				l_duration := a_result.item.as_atomic_value.as_duration_value
				a_result.put (Void)
				second_operand.evaluate_item (a_result, a_context)
				if a_result.item = Void or else a_result.item.is_error then
					-- nothing to do
				else
					l_other_duration := a_result.item.as_atomic_value.as_duration_value
					if operator = Plus_token then
						a_result.put (l_duration.plus (l_other_duration))
					else
						check
							minus: operator = Minus_token
						end
						a_result.put (l_duration.minus (l_other_duration))
					end
				end
			end
		end

invariant

	operator_plus_or_minus: operator = Plus_token xor operator = Minus_token

end

