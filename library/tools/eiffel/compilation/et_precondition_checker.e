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
			a_feature_impl: ET_FEATURE
		do
				-- The local entity appears in a precondition.
			set_fatal_error
			a_class_impl := current_feature.implementation_class
			if a_class_impl = current_class then
				error_handler.report_veen2c_error (current_class, a_name, current_feature)
			else
				a_feature_impl := current_feature.implementation_feature
				if not a_feature_impl.has_implementation_error then
						-- Internal error: the VEEN-2 error should have been
						-- reported in the implementation feature.
					error_handler.report_giado_error
				end
			end
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
				error_handler.report_giadk_error
			end
		end

	check_result_validity (an_expression: ET_RESULT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
		local
			a_class_impl: ET_CLASS
			a_feature_impl: ET_FEATURE
		do
				-- The entity Result appears in a precondition.
			set_fatal_error
			a_class_impl := current_feature.implementation_class
			if a_class_impl = current_class then
				error_handler.report_veen2b_error (current_class, an_expression, current_feature)
			else
				a_feature_impl := current_feature.implementation_feature
				if not a_feature_impl.has_implementation_error then
						-- Internal error: the VEEN-2 error should have been
						-- reported in the implementation feature.
					error_handler.report_giadm_error
				end
			end
		end

	check_result_address_validity (an_expression: ET_RESULT_ADDRESS; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
		local
			a_class_impl: ET_CLASS
			a_feature_impl: ET_FEATURE
		do
				-- The entity Result appears in a precondition.
			set_fatal_error
			a_class_impl := current_feature.implementation_class
			if a_class_impl = current_class then
				error_handler.report_veen2b_error (current_class, an_expression.result_keyword, current_feature)
			else
				a_feature_impl := current_feature.implementation_feature
				if not a_feature_impl.has_implementation_error then
						-- Internal error: the VEEN-2 error should have been
						-- reported in the implementation feature.
					error_handler.report_giadn_error
				end
			end
		end

end
