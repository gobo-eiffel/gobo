indexing

	description:

		"XPath range expressons"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_RANGE_EXPRESSION

inherit

	XM_XPATH_BINARY_EXPRESSION
		redefine
			analyze, compute_cardinality, iterator
		end

	XM_XPATH_ROLE

creation

	make

		-- The sequence must be ascending; if the end-point is less
		--  than the start-point, an empty sequence is returned. This is to allow
		--  expressions of the form "for $i in 1 to count($seq) return ...."

feature -- Access

	item_type: INTEGER is
			--Determine the data type of the expression, if possible
		do
			Result := Integer_type
		end

	lower_bound: XM_XPATH_EXPRESSION is
			-- Inclusive lower bound
		do
			Result := first_operand
		end

	upper_bound: XM_XPATH_EXPRESSION is
			-- Inclusive upper bound
		do
			Result := second_operand
		end

feature -- Optimization	

	analyze (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Perform static analysis of an expression and its subexpressions
		local
			a_value, another_value: XM_XPATH_VALUE
			a_role, another_role: XM_XPATH_ROLE_LOCATOR
			an_expression: XM_XPATH_EXPRESSION
			a_sequence_type: XM_XPATH_SEQUENCE_TYPE
			a_type_checker: XM_XPATH_TYPE_CHECKER
		do
			if first_operand.may_analyze then first_operand.analyze (a_context) end
			if first_operand.was_expression_replaced then
				set_first_operand (first_operand.replacement_expression)
			end
			if first_operand.is_error then
				set_last_error (first_operand.last_error)
			else
				if second_operand.may_analyze then second_operand.analyze (a_context) end
				if second_operand.was_expression_replaced then
					set_second_operand (second_operand.replacement_expression)
				end
				if second_operand.is_error then
					set_last_error (second_operand.last_error)
				else
					create a_sequence_type.make_optional_integer
					create a_role.make (Binary_expression_role, "to", 1)
					create a_type_checker
					an_expression := a_type_checker.static_type_check (first_operand, a_sequence_type, False, a_role)
					if an_expression = Void then
							check
								static_type_error: a_type_checker.is_static_type_check_error
							end
						set_last_error_from_string (a_type_checker.static_type_check_error_message, 4, Type_error)
					else
						set_first_operand (an_expression)
						create another_role.make (Binary_expression_role, "to", 2)
						an_expression := a_type_checker.static_type_check (second_operand, a_sequence_type, False, another_role)
						if an_expression = Void then
								check
									static_type_error: a_type_checker.is_static_type_check_error
								end
							set_last_error_from_string (a_type_checker.static_type_check_error_message, 4, Type_error)
						else
							set_second_operand (an_expression)
							replacement_expression := simplify
							was_expression_replaced := True
						end
					end
				end
			end
			if not analyzed then set_analyzed end
		end

feature -- Evaluation

	iterator (a_context: XM_XPATH_CONTEXT): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM] is
			-- Iterator over the values of a sequence
		local
			an_integer_value, another_integer_value: XM_XPATH_INTEGER_VALUE 
		do
			first_operand.evaluate_item (a_context)
			an_integer_value ?= first_operand.last_evaluated_item
			if an_integer_value = Void then
				create {XM_XPATH_EMPTY_ITERATOR [XM_XPATH_ITEM]} Result.make
			else
				second_operand.evaluate_item (a_context)
				another_integer_value ?= second_operand.last_evaluated_item
				if another_integer_value = Void then
					create {XM_XPATH_EMPTY_ITERATOR [XM_XPATH_ITEM]} Result.make
				elseif an_integer_value.value > another_integer_value.value then
					create {XM_XPATH_EMPTY_ITERATOR [XM_XPATH_ITEM]} Result.make
				else
					create {XM_XPATH_RANGE_ITERATOR} Result.make (an_integer_value.value, another_integer_value.value)
				end
			end
		end

feature {NONE} -- Implementation

	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_zero_or_more
		end
	
end
