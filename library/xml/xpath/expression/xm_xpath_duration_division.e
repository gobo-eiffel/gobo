note

	description:

		"Objects that handle division of XPath durations by durations"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004-2015, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_DURATION_DIVISION

inherit

	XM_XPATH_ARITHMETIC_EXPRESSION
		redefine
			evaluate_item
		end

create

	make

feature -- Evaluation

	evaluate_item (a_result: DS_CELL [detachable XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT)
			-- Evaluate as a single item to `a_result'.
			-- We only take this path if the type could not be determined statically.
		local
			l_duration, l_other_duration: XM_XPATH_DURATION_VALUE
		do
			first_operand.evaluate_item (a_result, a_context)
			if not attached a_result.item as l_result_item or else l_result_item.is_error then
				-- nothing to do
			else
				l_duration := l_result_item.as_atomic_value.as_duration_value
				a_result.put (Void)
				second_operand.evaluate_item (a_result, a_context)
				if not attached a_result.item as l_result_item_2 or else l_result_item_2.is_error then
					-- nothing to do
				else
					l_other_duration := l_result_item_2.as_atomic_value.as_duration_value
					a_result.put (l_duration.divide (l_other_duration))
				end
			end
		end

end

