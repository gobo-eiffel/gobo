indexing

	description:

		"Objects that represent the compiled form of xsl:variable"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_COMPILED_VARIABLE

inherit

	XM_XSLT_COMPILED_VARIABLE_DEFINITION

creation

	make

feature {NONE} -- Initialization

	make (a_name: STRING; a_slot_number: INTEGER) is
			-- Establish invariant.
		require
			valid_name: a_name /= Void and then a_name.count > 0
		do
			variable_name := a_name
			slot_number := a_slot_number
			instruction_name := "variable"
			create children.make (0)
		ensure
			name_set: variable_name = a_name
			slot_number: slot_number = a_slot_number
		end

feature -- Evaluation

	process_leaving_tail (a_context: XM_XSLT_CONTEXT) is
			-- Execute `Current', writing results to the current `XM_XPATH_RECEIVER'.
		do
			todo ("process_leaving_tail", False)
		end

invariant

	instruction_name: STRING_.same_string (instruction_name, "variable")

end
