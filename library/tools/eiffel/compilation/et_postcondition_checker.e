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
			check_old_expression_validity
		end

creation

	make

feature {NONE} -- Expression validity

	check_old_expression_validity (an_expression: ET_OLD_EXPRESSION) is
			-- Check validity of `an_expression'.
		do
				-- Check VAOL-2 (ETL2 p.124).
			check_expression_validity (an_expression.expression, current_target_type, current_target_context, current_feature, current_class)
		end

end
