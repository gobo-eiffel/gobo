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
			check_precursor_expression_validity
		end

creation

	make

feature {NONE} -- Expression validity

	check_precursor_expression_validity (an_expression: ET_PRECURSOR_EXPRESSION) is
			-- Check validity of `an_expression'.
		do
				-- The Precursor expression does not appear in a Routine_body.
			set_fatal_error
			error_handler.report_vdpr1b_error (current_feature.implementation_class, an_expression)
		end

end
