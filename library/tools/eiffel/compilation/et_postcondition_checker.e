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
			a_feature_impl: ET_FEATURE
		do
				-- The local entity appears in a postcondition.
			set_fatal_error
			a_class_impl := current_feature.implementation_class
			if a_class_impl = current_class then
				error_handler.report_veen2c_error (current_class, a_name, current_feature)
			else
				a_feature_impl := current_feature.implementation_feature
				if not a_feature_impl.has_implementation_error then
						-- Internal error: the VEEN-2 error should have been
						-- reported in the implementation feature.
					error_handler.report_giadp_error
				end
			end
		end

	check_old_expression_validity (an_expression: ET_OLD_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
		do
				-- Check VAOL-2 (ETL2 p.124).
			check_subexpression_validity (an_expression.expression, a_context, current_target_type)
		end

	check_precursor_expression_validity (an_expression: ET_PRECURSOR_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
		local
			a_class_impl: ET_CLASS
			a_feature_impl: ET_FEATURE
		do
				-- The Precursor expression does not appear in a Routine_body.
			set_fatal_error
			a_class_impl := current_feature.implementation_class
			a_feature_impl := current_feature.implementation_feature
			if current_class = a_class_impl then
				error_handler.report_vdpr1b_error (current_class, an_expression)
			elseif not a_feature_impl.has_implementation_error then
					-- Internal error: the VDPR-1 error should have been
					-- reported in the implementation feature.
				error_handler.report_giadl_error
			end
		end

end
