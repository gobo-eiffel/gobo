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

creation

	make

feature -- Evaluation

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate `Current' as a single item;
			-- We only take this path if the type could not be determined statically.
		local
			an_atomic_value, another_atomic_value: XM_XPATH_ATOMIC_VALUE
			an_untyped_atomic_value: XM_XPATH_UNTYPED_ATOMIC_VALUE
			a_numeric_value, another_numeric_value: XM_XPATH_NUMERIC_VALUE
			a_string: STRING
		do
			first_operand.evaluate_item (a_context)
			an_atomic_value ?= first_operand.last_evaluated_item
			if an_atomic_value /= Void then
				an_atomic_value := an_atomic_value.primitive_value
				an_untyped_atomic_value ?= an_atomic_value
				if an_untyped_atomic_value /= Void then
					a_string := an_untyped_atomic_value.string_value
					if a_string.is_double then
						create {XM_XPATH_DOUBLE_VALUE} an_atomic_value.make_from_string (a_string)
					else
						create {XM_XPATH_DOUBLE_VALUE} an_atomic_value.make_nan
					end
				end
				second_operand.evaluate_item (a_context)
				another_atomic_value ?= second_operand.last_evaluated_item
				if another_atomic_value /= Void then
					another_atomic_value := another_atomic_value.primitive_value
					an_untyped_atomic_value ?= another_atomic_value
					if an_untyped_atomic_value /= Void then
						a_string := an_untyped_atomic_value.string_value
						if a_string.is_double then
							create {XM_XPATH_DOUBLE_VALUE} another_atomic_value.make_from_string (a_string)
						else
							create {XM_XPATH_DOUBLE_VALUE} another_atomic_value.make_nan
						end
					end
					a_numeric_value ?= an_atomic_value
					another_numeric_value ?= another_atomic_value
					if a_numeric_value /= Void and then another_numeric_value /= Void then
						last_evaluated_item := a_numeric_value.arithmetic (operator, another_numeric_value)
					end
				end
			end
		end

end

	
