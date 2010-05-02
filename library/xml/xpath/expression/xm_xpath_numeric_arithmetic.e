note

	description:

		"XPath numeric arithmetic expressons"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_NUMERIC_ARITHMETIC

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
			l_atomic_value, l_other_atomic_value: XM_XPATH_ATOMIC_VALUE
			l_string: STRING
		do
			first_operand.evaluate_item (a_result, a_context)
			if a_result.item /= Void and then a_result.item.is_atomic_value then
				l_atomic_value := a_result.item.as_atomic_value.primitive_value
				if l_atomic_value.is_untyped_atomic then
					l_string := l_atomic_value.as_untyped_atomic.string_value
					if l_string.is_double then
						create {XM_XPATH_DOUBLE_VALUE} l_atomic_value.make_from_string (l_string)
					else
						create {XM_XPATH_DOUBLE_VALUE} l_atomic_value.make_nan
					end
				end
				a_result.put (Void)
				second_operand.evaluate_item (a_result, a_context)
				if a_result.item /= Void and then a_result.item.is_atomic_value then
					l_other_atomic_value := a_result.item.as_atomic_value.primitive_value
					if l_other_atomic_value.is_untyped_atomic then
						l_string := l_other_atomic_value.as_untyped_atomic.string_value
						if l_string.is_double then
							create {XM_XPATH_DOUBLE_VALUE} l_other_atomic_value.make_from_string (l_string)
						else
							create {XM_XPATH_DOUBLE_VALUE} l_other_atomic_value.make_nan
						end
					end
					if l_atomic_value.is_numeric_value and then l_other_atomic_value.is_numeric_value then
						a_result.put (l_atomic_value.as_numeric_value.arithmetic (operator, l_other_atomic_value.as_numeric_value))
					else
						a_result.put (Void)
					end
				else
					a_result.put (Void)
				end
			else
				a_result.put (Void)
			end
		end

end


