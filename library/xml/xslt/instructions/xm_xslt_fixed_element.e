indexing
	description:

		"Attributes whose name is known at compile time"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_FIXED_ELEMENT

inherit

	XM_XSLT_ELEMENT_CONSTRUCTOR

creation

	make

feature {NONE} -- Initialization

	make (a_name_code: INTEGER; a_namespace_code_list: DS_ARRAYED_LIST [INTEGER]; todo_list: ANY; a_simple_type: XM_XPATH_SCHEMA_TYPE; a_validation_action: INTEGER) is
			-- Establish invariant.
		require
			namespace_codes_not_void: a_namespace_code_list /= Void
		do
			create children.make (0)
			make_expression_instruction
			name_code := a_name_code
			validation_action := a_validation_action
			type := a_simple_type
		ensure
			name_code_set: name_code = a_name_code
			validation_action_set: validation_action = a_validation_action
			type_set: type = a_simple_type
		end

feature -- Access

	instruction_name: STRING is
			-- Name of instruction, for diagnostics
		do
			Result := executable.configuration.name_pool.display_name_from_name_code (name_code)
		end

end
	
