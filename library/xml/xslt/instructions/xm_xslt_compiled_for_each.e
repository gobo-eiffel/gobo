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

	make (an_executable: XM_XSLT_EXECUTABLE; a_select_expression: XM_XPATH_EXPRESSION) is
			-- Establish invariant.
		require
			executable_not_void: an_executable /= Void
			select_expression_not_void: a_select_expression /= Void
		do
			executable := an_executable
			select_expression := a_select_expression
			instruction_name := "for-each"
			create children.make (0)
		ensure
			executable_set: executable = an_executable
			select_expression_set: select_expression = a_select_expression
		end

feature -- Access
	
	instruction_name: STRING
			-- Name of instruction, for diagnostics

feature -- Evaluation

	process_leaving_tail (a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Execute `Current', writing results to the current `XM_XPATH_RECEIVER'.
		local
			a_transformer: XM_XSLT_TRANSFORMER
			a_saved_iterator, an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			an_inner_context: XM_XSLT_EVALUATION_CONTEXT
			a_saved_template: XM_XSLT_COMPILED_TEMPLATE
		do
			a_transformer := a_context.transformer
			a_saved_template := a_transformer.current_template
			a_saved_iterator := a_transformer.current_iterator
			an_iterator := select_expression.iterator (a_context)
			an_inner_context := a_context.new_context
			an_inner_context.set_current_iterator (an_iterator)
			if a_transformer.is_tracing then
				todo ("process_leaving_tail", True)
			else
				from
					an_iterator.start
				until
					an_iterator.after
				loop
					process_children (an_inner_context)
					an_iterator.forth
				end
				a_transformer.set_current_iterator (a_saved_iterator)
				a_transformer.set_current_template (a_saved_template)
			end
		end

feature {NONE} -- Implementation
	
	select_expression: XM_XPATH_EXPRESSION
			-- Nodes to be selected

invariant

	select_expression_not_void: select_expression /= Void

end
	
