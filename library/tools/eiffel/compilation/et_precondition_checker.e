indexing

	description:

		"Eiffel validity checkers of expressions appearing in preconditions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_PRECONDITION_CHECKER

inherit

	ET_EXPRESSION_CHECKER
		redefine
			check_local_variable_validity,
			check_precursor_expression_validity,
			check_result_validity,
			check_result_address_validity
		end

creation

	make

feature {NONE} -- Expression validity

	check_local_variable_validity (a_name: ET_IDENTIFIER; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of local variable `a_name'.
		local
			a_class_impl: ET_CLASS
			a_feature: ET_FEATURE
		do
				-- The local entity appears in a precondition.
			set_fatal_error
			a_class_impl := current_feature.implementation_class
			if a_class_impl = current_class then 
				error_handler.report_veen2c_error (current_class, a_name, current_feature)
			else
-- TODO: find the corresponding feature in `a_class_impl'
				error_handler.report_veen2c_error (current_class, a_name, current_feature)
			end
		end

	check_precursor_expression_validity (an_expression: ET_PRECURSOR_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
		do
				-- The Precursor expression does not appear in a Routine_body.
			set_fatal_error
			error_handler.report_vdpr1b_error (current_feature.implementation_class, an_expression)
		end

	check_result_validity (an_expression: ET_RESULT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
		local
			a_class_impl: ET_CLASS
			a_feature: ET_FEATURE
		do
				-- The entity Result appears in a precondition.
			set_fatal_error
			a_class_impl := current_feature.implementation_class
			if a_class_impl = current_class then 
				error_handler.report_veen2b_error (current_class, an_expression, current_feature)
			else
-- TODO: find the corresponding feature in `a_class_impl'
				error_handler.report_veen2b_error (current_class, an_expression, current_feature)
			end
		end

	check_result_address_validity (an_expression: ET_RESULT_ADDRESS; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
		local
			a_class_impl: ET_CLASS
			a_feature: ET_FEATURE
		do
				-- The entity Result appears in a precondition.
			set_fatal_error
			a_class_impl := current_feature.implementation_class
			if a_class_impl = current_class then 
				error_handler.report_veen2b_error (current_class, an_expression.result_keyword, current_feature)
			else
-- TODO: find the corresponding feature in `a_class_impl'
				error_handler.report_veen2b_error (current_class, an_expression.result_keyword, current_feature)
			end
		end

end
