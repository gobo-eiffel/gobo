indexing

	description:

		"Expression roles"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_ROLE

feature -- Access

	Function_role, Binary_expression_role, Type_operation_role,
	Variable_role, Instruction_role, Function_result_role, Order_by_role: INTEGER is unique
	
end

