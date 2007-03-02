indexing

	description:

		"Signatures for XPath arithmetic expressions"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2007, Colin Adams and others"
	license: "MIT License"
	date: "$Date:  $"
	revision: "$Revision:  $"

class XM_XPATH_ARITHMETIC_SIGNATURE

create

	make

feature {NONE} -- Initialization

	make (a_first, a_second: like first_operand_type; a_operation: like operation; a_result: like result_type) is
			-- Initialize `Current'.
		require
			a_result_not_void: a_result /= Void
		do
			first_operand_type := a_first
			second_operand_type := a_second
			operation := a_operation
			result_type := a_result
		ensure
			first_operand_type_set: first_operand_type = a_first
			second_operand_type_set: second_operand_type = a_second
			operation_set: operation = a_operation
			result_type_set: result_type = a_result
		end

feature -- Access

	first_operand_type: INTEGER
			-- Type of first operand

	second_operand_type: INTEGER
			-- Type of second operand

	operation: INTEGER
			-- Arithmetic operation

	result_type: XM_XPATH_ITEM_TYPE
			-- Type of expression result

invariant

	result_type_not_void: result_type /= Void

end

