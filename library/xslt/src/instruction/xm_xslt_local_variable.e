﻿note

	description:

		"Objects that represent the compiled form of a local xsl:variable"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2005-2015, Colin Adams and others"
	license: "MIT License"

class XM_XSLT_LOCAL_VARIABLE

inherit

	XM_XSLT_COMPILED_VARIABLE

	XM_XPATH_VARIABLE_DECLARATION_ROUTINES

create

	make

feature -- Status report

	display (a_level: INTEGER)
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indentation (a_level), "local variable: ")
			std.error.put_string (a_string);
			std.error.put_string (variable_name);
			std.error.put_new_line
			if attached select_expression as l_select_expression then
				l_select_expression.display (a_level + 1)
			end
		end

feature -- Evaluation

	generate_tail_call (a_tail: DS_CELL [detachable XM_XPATH_TAIL_CALL]; a_context: XM_XSLT_EVALUATION_CONTEXT)
			-- Execute `Current', writing results to the current `XM_XPATH_RECEIVER'.
		local
			l_result: DS_CELL [detachable XM_XPATH_VALUE]
		do
			create l_result.make (Void)
			check attached select_expression as l_select_expression then
				l_select_expression.evaluate (l_result, l_select_expression.lazy_evaluation_mode, Many_references, a_context)
				check postcondition_of_evaluate: attached l_result.item as l_result_item then
					a_context.set_local_variable (l_result_item, slot_number)
				end
			end
		end

	evaluate_variable (a_context: XM_XPATH_CONTEXT)
			-- Evaluate variable
		do
			check
				valid_slot_number: a_context.is_valid_local_variable (slot_number)
			end
			last_evaluated_binding := a_context.evaluated_local_variable (slot_number)
		end

end

