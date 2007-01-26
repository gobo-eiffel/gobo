indexing

	description:

	"Objects that compare two XPath singleton expressions;%
	%Unlike XM_XPATH_VALUE_COMPARISON, this class allows%
	%either operand to be an empty sequence, and converts%
	%untyped atomic operands to the type of the other operand."

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_SINGLETON_COMPARISON

inherit

	XM_XPATH_BINARY_EXPRESSION
		rename
			make as make_binary_expression
		redefine
			evaluate_item, calculate_effective_boolean_value, display_operator
		end

	XM_XPATH_COMPARISON_ROUTINES

create

	make

feature {NONE} -- Initialization

	make (an_operand_one: XM_XPATH_EXPRESSION; a_token: INTEGER; an_operand_two: XM_XPATH_EXPRESSION; a_collator: ST_COLLATOR) is
			-- Establish invariant
		require
			operand_1_not_void: an_operand_one /= Void
			operand_2_not_void: an_operand_two /= Void
			value_comparison_operator: is_value_comparison_operator (a_token)
		do
			make_binary_expression (an_operand_one, a_token, an_operand_two)
			create atomic_comparer.make (a_collator)
			initialized := True
		ensure
			static_properties_computed: are_static_properties_computed
			operator_set: operator = a_token
			operand_1_set: first_operand /= Void and then first_operand.same_expression (an_operand_one)
			operand_2_set: second_operand /= Void and then second_operand.same_expression (an_operand_two)
		end

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE is
			-- Determine the data type of the expression, if possible
		do
			Result := type_factory.boolean_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

feature -- Evaluation

	calculate_effective_boolean_value (a_context: XM_XPATH_CONTEXT) is
			-- Effective boolean value
		local
			a_comparison_checker: XM_XPATH_COMPARISON_CHECKER
		do
			first_operand.evaluate_item (a_context)
			if first_operand.last_evaluated_item = Void then
				create last_boolean_value.make (False)
			elseif first_operand.last_evaluated_item /= Void and then first_operand.last_evaluated_item.is_error then
				create last_boolean_value.make (False)
				last_boolean_value.set_last_error (first_operand.last_evaluated_item.error_value)
			elseif not first_operand.last_evaluated_item.is_atomic_value then
				create last_boolean_value.make (False)
			else
				second_operand.evaluate_item (a_context)
				if second_operand.last_evaluated_item.is_error then
					create last_boolean_value.make (False)
					last_boolean_value.set_last_error (second_operand.last_evaluated_item.error_value)
				elseif second_operand.last_evaluated_item = Void or else not second_operand.last_evaluated_item.is_atomic_value then
					create last_boolean_value.make (False)
				else
					create a_comparison_checker
					a_comparison_checker.check_correct_general_relation (first_operand.last_evaluated_item.as_atomic_value,
																						  singleton_value_operator (operator), atomic_comparer,
																						  second_operand.last_evaluated_item.as_atomic_value, False)
					if a_comparison_checker.is_comparison_type_error then
						set_last_error (a_comparison_checker.last_type_error)
						create last_boolean_value.make (False)
					else
						create last_boolean_value.make (a_comparison_checker.last_check_result)
					end
				end
			end
		end

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate `Current' as a single item
		do
			calculate_effective_boolean_value (a_context)
			last_evaluated_item := last_boolean_value
		end
	
feature {NONE} -- Implementation

	atomic_comparer: XM_XPATH_ATOMIC_COMPARER
			-- Comparer for atomic values

	display_operator: STRING is
			-- Format `operator' for display
		do
			Result := STRING_.appended_string ("singleton ", Precursor)
		end
	
end
	
