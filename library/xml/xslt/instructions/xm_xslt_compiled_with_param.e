indexing

	description:

		"Objects that represent the compiled form of xsl:with-param"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_COMPILED_WITH_PARAM

inherit

	XM_XSLT_COMPILED_GENERAL_VARIABLE

	XM_XSLT_WITH_PARAM_ROUTINES

creation

	make

feature {NONE} -- Initialization

	make (an_executable: XM_XSLT_EXECUTABLE; a_variable_name: STRING) is
			-- Establish invariant.
		require
			executable_not_void: an_executable /= Void
			variable_name_not_void: a_variable_name /= Void
		do
			executable := an_executable
			instruction_name := "xsl:with-param"
			variable_name := a_variable_name
			compute_static_properties
			initialize
		ensure
			executable_set: executable = an_executable
			name_set: variable_name = a_variable_name
		end

feature -- Status report

	display (a_level: INTEGER) is
			-- Diagnostic print of expression structure to `std.error'
		do
			todo ("display", False)
		end

feature -- Evaluation

	process_leaving_tail (a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Execute `Current', writing results to the current `XM_XPATH_RECEIVER'.
		do
			check
				process_leaving_tail_not_used: False
			end
		end
	
	evaluate_variable (a_context: XM_XPATH_CONTEXT) is 
			-- Evaluate variable
		do
			check
				evaluate_variable_not_used: False
			end
		end

end
