indexing

	description: "Objects that represent an xsl:for-each,"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_COMPILED_FOR_EACH

inherit
	
	XM_XSLT_INSTRUCTION

creation

	make

feature {NONE} -- Initialization

	make (a_select_expression: XM_XPATH_EXPRESSION) is
			-- Establish invariant.
		require
			select_expression_not_void: a_select_expression /= Void
		do
			select_expression := a_select_expression
			instruction_name := "for-each"
			create children.make (0)
		ensure
			select_expression_set: select_expression = a_select_expression
		end

feature -- Access
	
	instruction_name: STRING
			-- Name of instruction, for diagnostics

feature -- Evaluation

	process_leaving_tail (a_context: XM_XSLT_CONTEXT) is
			-- Execute `Current', writing results to the current `XM_XPATH_RECEIVER'.
		do
			todo ("process_leaving_tail", False)
		end

feature {NONE} -- Implementation
	
	select_expression: XM_XPATH_EXPRESSION
			-- Nodes to be selected

invariant

	select_expression_not_void: select_expression /= Void

end
	
