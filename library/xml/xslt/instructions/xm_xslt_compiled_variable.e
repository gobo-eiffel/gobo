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

	make (an_executable: XM_XSLT_EXECUTABLE; a_name: STRING; a_slot_number: INTEGER) is
			-- Establish invariant.
		require
			executable_not_void: an_executable /= Void
			valid_name: a_name /= Void and then a_name.count > 0
		do
			executable := an_executable
			variable_name := a_name
			slot_number := a_slot_number
			instruction_name := "variable"
			create children.make (0)
		ensure
			executable_set: executable = an_executable
			name_set: variable_name = a_name
			slot_number: slot_number = a_slot_number
		end

feature -- Evaluation

	process_leaving_tail (a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Execute `Current', writing results to the current `XM_XPATH_RECEIVER'.
		local
			a_bindery: XM_XSLT_BINDERY
		do
			a_bindery := a_context.transformer.bindery
			if is_global_variable then
				if not a_bindery.is_evaluated (slot_number) then -- don't evaluate a global variable twice
					a_bindery.define_global_variable (slot_number, value (a_context))
				end
			else
				a_bindery.set_local_variable (slot_number, value (a_context))
			end
			last_tail_call := Void
		end

invariant

	instruction_name: STRING_.same_string (instruction_name, "variable")

end
