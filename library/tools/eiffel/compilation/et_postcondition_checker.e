indexing

	description:

		"Eiffel validity checkers of expressions appearing in postconditions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_POSTCONDITION_CHECKER

inherit

	ET_EXPRESSION_CHECKER
		redefine
			check_local_variable_validity,
			check_old_expression_validity,
			check_precursor_expression_validity
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
				-- The local entity appears in a postcondition.
			set_fatal_error
			a_class_impl := current_feature.implementation_class
			if a_class_impl = current_class then 
				error_handler.report_veen2c_error (current_class, a_name, current_feature)
			else
-- TODO: find the corresponding feature in `a_class_impl'
				error_handler.report_veen2c_error (current_class, a_name, current_feature)
			end
		end

	check_old_expression_validity (an_expression: ET_OLD_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
		do
				-- Check VAOL-2 (ETL2 p.124).
			check_expression_validity (an_expression.expression, a_context, current_target_type, current_feature, current_class)
		end

	check_precursor_expression_validity (an_expression: ET_PRECURSOR_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
		do
				-- The Precursor expression does not appear in a Routine_body.
			set_fatal_error
			error_handler.report_vdpr1b_error (current_feature.implementation_class, an_expression)
		end

end
