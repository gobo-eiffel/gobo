note

	description:

	"Objects that handle division of XPath durations by durations"

library: "Gobo Eiffel XPath Library"
copyright: "Copyright (c) 2004, Colin Adams and others"
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

	evaluate_item (a_result: DS_CELL [XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a single item to `a_result'.
			-- We only take this path if the type could not be determined statically.
		local
			l_duration, l_other_duration: XM_XPATH_DURATION_VALUE
		do
			first_operand.evaluate_item (a_result, a_context)
			if a_result.item = Void  or else a_result.item.is_error then
				-- nothing to do
			else
				l_duration := a_result.item.as_atomic_value.as_duration_value
				a_result.put (Void)
				second_operand.evaluate_item (a_result, a_context)
				if a_result.item = Void  or else a_result.item.is_error then
					-- nothing to do
				else
					l_other_duration := a_result.item.as_atomic_value.as_duration_value
					a_result.put (l_duration.divide (l_other_duration))
				end
			end
		end

end
	
