indexing

	description:

		"XPath numeric arithmetic expressons"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
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

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate `Current' as a single item;
			-- We only take this path if the type could not be determined statically.
		local
			an_atomic_value, another_atomic_value: XM_XPATH_ATOMIC_VALUE
			a_string: STRING
		do
			first_operand.evaluate_item (a_context)
			if first_operand.last_evaluated_item /= Void and then first_operand.last_evaluated_item.is_atomic_value then
				an_atomic_value := first_operand.last_evaluated_item.as_atomic_value.primitive_value
				if an_atomic_value.is_untyped_atomic then
					a_string := an_atomic_value.as_untyped_atomic.string_value
					if a_string.is_double then
						create {XM_XPATH_DOUBLE_VALUE} an_atomic_value.make_from_string (a_string)
					else
						create {XM_XPATH_DOUBLE_VALUE} an_atomic_value.make_nan
					end
				end
				second_operand.evaluate_item (a_context)
				if second_operand.last_evaluated_item /= Void and then second_operand.last_evaluated_item.is_atomic_value then
					another_atomic_value := second_operand.last_evaluated_item.as_atomic_value.primitive_value
					if another_atomic_value.is_untyped_atomic then
						a_string := another_atomic_value.as_untyped_atomic.string_value
						if a_string.is_double then
							create {XM_XPATH_DOUBLE_VALUE} another_atomic_value.make_from_string (a_string)
						else
							create {XM_XPATH_DOUBLE_VALUE} another_atomic_value.make_nan
						end
					end
					if an_atomic_value.is_numeric_value and then another_atomic_value.is_numeric_value then
						last_evaluated_item := an_atomic_value.as_numeric_value.arithmetic (operator, another_atomic_value.as_numeric_value)
					end
				else
					last_evaluated_item := Void
				end
			else
				last_evaluated_item := Void
			end
		end

end

	
