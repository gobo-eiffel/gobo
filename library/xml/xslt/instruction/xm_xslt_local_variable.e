indexing

	description:

		"Objects that represent the compiled form of a local xsl:variable"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_LOCAL_VARIABLE

inherit

	XM_XSLT_COMPILED_VARIABLE

	XM_XPATH_VARIABLE_DECLARATION_ROUTINES

create

	make

feature -- Status report

	display (a_level: INTEGER) is
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indentation (a_level), "local variable: ")
			std.error.put_string (a_string);
			std.error.put_string (variable_name);
			std.error.put_new_line
			if select_expression /= Void then select_expression.display (a_level + 1) end
		end

feature -- Evaluation

	generate_tail_call (a_tail: DS_CELL [XM_XPATH_TAIL_CALL]; a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Execute `Current', writing results to the current `XM_XPATH_RECEIVER'.
		do
			select_expression.lazily_evaluate (a_context, Many_references)
			a_context.set_local_variable (last_evaluation, slot_number)
		end

	evaluate_variable (a_context: XM_XPATH_CONTEXT) is 
			-- Evaluate variable
		do
			check
				valid_slot_number: a_context.is_valid_local_variable (slot_number)
			end
			last_evaluated_binding := a_context.evaluated_local_variable (slot_number)
		end

end
	
