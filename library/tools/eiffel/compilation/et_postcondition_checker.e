indexing

	description:

		"Eiffel validity checkers of expressions appearing in postconditions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003-2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_POSTCONDITION_CHECKER

inherit

	ET_EXPRESSION_CHECKER
		redefine
			make,
			check_formal_argument_validity,
			check_local_variable_validity,
			check_old_expression_validity,
			check_precursor_expression_validity,
			check_result_validity,
			check_result_address_validity,
			implementation_checked,
			has_implementation_error
		end

creation

	make

feature {NONE} -- Initialization

	make (a_universe: like universe) is
			-- Create a new precondition validity checker.
		do
			precursor (a_universe)
			create assertion_context.make_with_capacity (current_class, 10)
		end

feature -- Status report

	implementation_checked (a_feature: ET_FEATURE): BOOLEAN is
			-- Has the implementation of assertions of `a_feature' been checked?
		do
			Result := a_feature.implementation_feature.implementation_checked
		end

	has_implementation_error (a_feature: ET_FEATURE): BOOLEAN is
			-- Has a fatal error occurred during checking
			-- of implementation of assertions of `a_feature'?
		do
			Result := a_feature.implementation_feature.has_implementation_error
		end

feature -- Validity checking

	check_postconditions_validity (a_postconditions: ET_POSTCONDITIONS; a_feature: ET_FEATURE; a_class: ET_CLASS) is
			-- Check validity of `a_postconditions' of `a_feature' in `a_class'.
			-- Set `has_fatal_error' is a fatal error occurred.
		require
			a_postconditions_not_void: a_postconditions /= Void
			a_class_not_void: a_class /= Void
		local
			old_feature: ET_FEATURE
			old_class: ET_CLASS
			a_class_impl: ET_CLASS
			a_feature_impl: ET_FEATURE
			i, nb: INTEGER
			an_expression: ET_EXPRESSION
			boolean_type: ET_CLASS_TYPE
			a_named_type: ET_NAMED_TYPE
			had_error: BOOLEAN
		do
			reset
			old_feature := current_feature
			current_feature := a_feature
			old_class := current_class
			current_class := a_class
				-- First, make sure that the interface of
				-- `current_class' is valid.
			current_class.process (universe.interface_checker)
			if current_class.has_interface_error then
				set_fatal_error
			else
				a_class_impl := current_feature.implementation_class
				if a_class_impl /= current_class then
					a_feature_impl := current_feature.implementation_feature
					if a_feature_impl.assertions_checked then
						if a_feature_impl.has_assertions_error then
							set_fatal_error
						end
					else
						check_postconditions_validity (a_postconditions, a_feature_impl, a_class_impl)
					end
				end
				if not has_fatal_error then
					boolean_type := universe.boolean_class
					assertion_context.set_root_context (current_class)
					nb := a_postconditions.count
					from i := 1 until i > nb loop
						an_expression := a_postconditions.assertion (i).expression
						if an_expression /= Void then
							check_subexpression_validity (an_expression, assertion_context, boolean_type)
							if has_fatal_error then
								had_error := True
							else
								if not assertion_context.same_named_type (boolean_type, current_class, universe) then
									had_error := True
									set_fatal_error
									a_named_type := assertion_context.named_type (universe)
									a_class_impl := current_feature.implementation_class
									if current_class = a_class_impl then
										error_handler.report_vwbe0a_error (current_class, an_expression, a_named_type)
									else
										error_handler.report_vwbe0b_error (current_class, a_class_impl, an_expression, a_named_type)
									end
								end
							end
							assertion_context.wipe_out
						end
						i := i + 1
					end
					if had_error then
						set_fatal_error
					end
				end
			end
			current_class := old_class
			current_feature := old_feature
		end

feature {NONE} -- Expression validity

	check_formal_argument_validity (a_name: ET_IDENTIFIER; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of formal argument `a_name'.
		local
			a_seed: INTEGER
			an_arguments: ET_FORMAL_ARGUMENT_LIST
			a_feature_impl: ET_FEATURE
			a_type: ET_TYPE
		do
				-- Use arguments of implementation feature because the types
				-- of the signature of `current_feature' might not have been
				-- resolved for `current_class' (when processing precursors'
				-- assertions).
			a_feature_impl := current_feature.implementation_feature
			an_arguments := a_feature_impl.arguments
			a_seed := a_name.seed
			if an_arguments = Void then
					-- Internal error.
				set_fatal_error
				error_handler.report_giaea_error
			elseif a_seed < 1 or a_seed > an_arguments.count then
					-- Internal error.
				set_fatal_error
				error_handler.report_giaeb_error
			else
				a_type := resolved_formal_parameters (an_arguments.formal_argument (a_seed).type)
				if not has_fatal_error then
					a_context.force_first (a_type)
				end
			end
		end

	check_local_variable_validity (a_name: ET_IDENTIFIER; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of local variable `a_name'.
		local
			a_class_impl: ET_CLASS
		do
				-- The local entity appears in a postcondition.
			set_fatal_error
			a_class_impl := current_feature.implementation_class
			if a_class_impl = current_class then
				error_handler.report_veen2c_error (current_class, a_name, current_feature)
			else
				if not has_implementation_error (current_feature) then
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
		do
				-- The Precursor expression does not appear in a Routine_body.
			set_fatal_error
			a_class_impl := current_feature.implementation_class
			if current_class = a_class_impl then
				error_handler.report_vdpr1b_error (current_class, an_expression)
			elseif not has_implementation_error (current_feature) then
					-- Internal error: the VDPR-1 error should have been
					-- reported in the implementation feature.
				error_handler.report_giadl_error
			end
		end

	check_result_validity (an_expression: ET_RESULT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
		local
			a_type: ET_TYPE
			a_class_impl: ET_CLASS
			a_feature_impl: ET_FEATURE
		do
				-- Use type of implementation feature because the types
				-- of the signature of `current_feature' might not have been
				-- resolved for `current_class' (when processing precursors'
				-- assertions).
			a_feature_impl := current_feature.implementation_feature
			a_type := a_feature_impl.type
			if a_type = Void then
				set_fatal_error
				a_class_impl := current_feature.implementation_class
				if a_class_impl = current_class then
					error_handler.report_veen2a_error (current_class, an_expression, current_feature)
				else
					if not has_implementation_error (current_feature) then
							-- Internal error: the VEEN-2 error should have been
							-- reported in the implementation feature.
						error_handler.report_giaec_error
					end
				end
			else
				a_type := resolved_formal_parameters (a_type)
				if not has_fatal_error then
					a_context.force_first (a_type)
				end
			end
		end

	check_result_address_validity (an_expression: ET_RESULT_ADDRESS; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
		local
			a_type: ET_TYPE
			a_typed_pointer_class: ET_CLASS
			a_typed_pointer_type: ET_GENERIC_CLASS_TYPE
			an_actuals: ET_ACTUAL_PARAMETER_LIST
			a_class_impl: ET_CLASS
			a_feature_impl: ET_FEATURE
		do
				-- Use type of implementation feature because the types
				-- of the signature of `current_feature' might not have been
				-- resolved for `current_class' (when processing precursors'
				-- assertions).
			a_feature_impl := current_feature.implementation_feature
			a_type := a_feature_impl.type
			if a_type = Void then
				set_fatal_error
				a_class_impl := current_feature.implementation_class
				if a_class_impl = current_class then
					error_handler.report_veen2a_error (current_class, an_expression.result_keyword, current_feature)
				else
					if not has_implementation_error (current_feature) then
							-- Internal error: the VEEN-2 error should have been
							-- reported in the implementation feature.
						error_handler.report_giaed_error
					end
				end
			else
				a_typed_pointer_class := universe.typed_pointer_class
				if a_typed_pointer_class.is_preparsed then
						-- Class TYPED_POINTER has been found in the universe.
						-- Use ISE's implementation.
					a_type := resolved_formal_parameters (a_type)
					if not has_fatal_error then
						create an_actuals.make_with_capacity (1)
						an_actuals.put_first (a_type)
						create a_typed_pointer_type.make (Void, a_typed_pointer_class.name, an_actuals, a_typed_pointer_class)
						a_context.force_first (a_typed_pointer_type)
					end
				else
					a_context.force_first (universe.pointer_class)
				end
			end
		end

feature {NONE} -- Implementation

	assertion_context: ET_NESTED_TYPE_CONTEXT
			-- Assertion context

invariant

	assertion_context_not_void: assertion_context /= Void

end
