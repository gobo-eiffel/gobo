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
			an_integer_value, another_integer_value: XM_XPATH_INTEGER_VALUE
		do
			if operator = Integer_division_token then
				first_operand.evaluate_item (a_context)
				an_atomic_value ?= first_operand.last_evaluated_item
				if an_atomic_value /= Void then
					if an_atomic_value.is_convertible (Integer_type) then
						an_integer_value ?= an_atomic_value.convert_to_type (Integer_type)
						second_operand.evaluate_item (a_context)
						another_atomic_value ?= second_operand.last_evaluated_item
						if another_atomic_value /= Void then
							if another_atomic_value.is_convertible (Integer_type) then
								another_integer_value ?= another_atomic_value.convert_to_type (Integer_type)
								last_evaluated_item := an_integer_value.arithmetic (operator, another_integer_value)
							else
								set_last_error_from_string ("Second argument to idiv must be an integer", Type_error, 6)
							end
						else
							last_evaluated_item := Void -- represents empty sequence
						end
					else
						set_last_error_from_string ("First argument to idiv must be an integer", Type_error, 6)
					end
				else
					last_evaluated_item := Void -- represents empty sequence
				end
			else
				evaluate_for_non_integer_division (a_context)				
			end
		end

feature {NONE} -- Implementation

	evaluate_for_non_integer_division (a_context	: XM_XPATH_CONTEXT) is
			-- Evaluate `Current' as a single item
		require
			not_integer_division: operator /= Integer_division_token
			expression_not_in_error: not is_error
		local
			an_atomic_value, another_atomic_value: XM_XPATH_ATOMIC_VALUE
			a_double_value, another_double_value: XM_XPATH_DOUBLE_VALUE
		do
			first_operand.evaluate_item (a_context)
			an_atomic_value ?= first_operand.last_evaluated_item
			if an_atomic_value /= Void then
				if an_atomic_value.is_convertible (Double_type) then
					a_double_value ?= an_atomic_value.convert_to_type (Double_type) 
				else
					create a_double_value.make_nan
				end
				second_operand.evaluate_item (a_context)
				another_atomic_value ?= second_operand.last_evaluated_item
				if another_atomic_value /= Void then
					if another_atomic_value.is_convertible (Double_type) then
						another_double_value ?= another_atomic_value.convert_to_type (Double_type) 
					else
						create another_double_value.make_nan
					end
					last_evaluated_item := a_double_value.arithmetic (operator, another_double_value)
				else
					last_evaluated_item := Void -- represents empty sequence
				end
			else
				last_evaluated_item := Void -- represents empty sequence
			end
		end

end
	
