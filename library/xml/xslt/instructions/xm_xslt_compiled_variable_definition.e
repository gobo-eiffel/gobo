indexing

	description:

		"Objects that represent the compiled form of XSLT variable definitions"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XSLT_COMPILED_VARIABLE_DEFINITION

inherit

	XM_XSLT_COMPILED_GENERAL_VARIABLE

	XM_XPATH_BINDING

feature -- Access

	slot_number: INTEGER
			-- Slot number

feature -- Evaluation

	evaluate_variable (a_context: XM_XPATH_CONTEXT) is 
			-- Evaluate variable
		do
			todo ("evaluate_variable", False)
			--evaluation: last_evaluated_binding /= Void
		end


invariant

	variable_name: variable_name /= Void and then variable_name.count > 0

end
