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
			check_old_expression_validity,
			check_precursor_expression_validity
		end

creation

	make

feature {NONE} -- Expression validity

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
