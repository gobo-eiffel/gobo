indexing

	description:

	"Objects that compare two XPath singleton expressions;%
	%Unlike XM_XPATH_VALUE_COMPARISON, this class allows%
	%either operand to be an empty sequence, and converts%
	%untyped atomic operands to the type of the other operand."

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_SINGLETON_COMPARISON

inherit

	XM_XPATH_BINARY_EXPRESSION
		rename
			make as make_binary_expression
		end

	XM_XPATH_COMPARISON_ROUTINES

creation

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
		ensure
			operator_set: operator = a_token
			operand_1_set: operands /= Void and then operands.item (1).same_expression (an_operand_one)
			operand_2_set: operands.item (2).same_expression (an_operand_two)
		end

feature -- Access

		item_type: INTEGER is
			--Determine the data type of the expression, if possible
		do
			todo ("item-type", False)
			-- TODO
		end

feature {NONE} -- Implementation

	atomic_comparer: XM_XPATH_ATOMIC_COMPARER
			-- Comparer for atomic values

end
	
