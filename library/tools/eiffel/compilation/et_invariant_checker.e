indexing

	description:

		"Eiffel validity checkers of expressions appearing in class invariants"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_INVARIANT_CHECKER

inherit

	ET_EXPRESSION_CHECKER
		redefine
			make,
			check_formal_argument_validity,
			check_local_variable_validity,
			check_precursor_expression_validity,
			check_result_validity,
			check_result_address_validity
		end

creation

	make

feature {NONE} -- Initialization

	make (a_universe: like universe) is
			-- Create a new expression validity checker.
		do
			precursor (a_universe)
			create assertion_context.make_with_capacity (current_class, 10)
		end

feature -- Validity checking

	check_invariants_validity (an_invariants: ET_INVARIANTS; a_class: ET_CLASS) is
			-- Check validity of `an_invariants' in `a_class'.
			-- Set `has_fatal_error' is a fatal error occurred.
		require
			an_invariants_not_void: an_invariants /= Void
			a_class_not_void: a_class /= Void
		local
			old_feature: ET_FEATURE
			old_class: ET_CLASS
			a_class_impl: ET_CLASS
			i, nb: INTEGER
			an_expression: ET_EXPRESSION
			boolean_type: ET_CLASS_TYPE
			a_named_type: ET_NAMED_TYPE
			had_error: BOOLEAN
		do
			reset
			old_feature := current_feature
			current_feature := an_invariants
			old_class := current_class
			current_class := a_class
				-- First, make sure that the interface of
				-- `current_class' is valid.
			current_class.process (universe.interface_checker)
			if current_class.has_interface_error then
				set_fatal_error
			else
				a_class_impl := an_invariants.implementation_class
				if a_class_impl /= current_class then
					if an_invariants.implementation_checked then
						if an_invariants.has_implementation_error then
							set_fatal_error
						end
					else
						check_invariants_validity (an_invariants, a_class_impl)
					end
				end
				if not has_fatal_error then
					boolean_type := universe.boolean_class
					assertion_context.set_root_context (current_class)
					nb := an_invariants.count
					from i := 1 until i > nb loop
						an_expression := an_invariants.assertion (i).expression
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
					if current_class = a_class_impl then
						an_invariants.set_implementation_checked
						if has_fatal_error then
							an_invariants.set_implementation_error
						end
					end
				end
			end
			current_class := old_class
			current_feature := old_feature
		end

feature {NONE} -- Expression validity

	check_formal_argument_validity (a_name: ET_IDENTIFIER; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of formal argument `a_name'.
		do
				-- VEEN-3: the formal argument appears in an invariant.
				-- Internal error: the invariant has no formal argument.
			set_fatal_error
			error_handler.report_giads_error
		end

	check_local_variable_validity (a_name: ET_IDENTIFIER; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of local variable `a_name'.
		do
				-- VEEN-2: the local entity appears in an invariant.
				-- Internal error: the invariant has no local entity.
			set_fatal_error
			error_handler.report_giadt_error
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
				error_handler.report_giadu_error
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
				error_handler.report_veen2d_error (current_class, an_expression)
			else
				a_feature_impl := current_feature.implementation_feature
				if not a_feature_impl.has_implementation_error then
						-- Internal error: the VEEN-2 error should have been
						-- reported in the implementation feature.
					error_handler.report_giadv_error
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
				error_handler.report_veen2d_error (current_class, an_expression.result_keyword)
			else
				a_feature_impl := current_feature.implementation_feature
				if not a_feature_impl.has_implementation_error then
						-- Internal error: the VEEN-2 error should have been
						-- reported in the implementation feature.
					error_handler.report_giadw_error
				end
			end
		end

feature {NONE} -- Implementation

	assertion_context: ET_NESTED_TYPE_CONTEXT
			-- Assertion context

invariant

	assertion_context_not_void: assertion_context /= Void

end
