indexing

	description:

		"Eiffel validity checkers of expressions appearing in preconditions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003-2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_PRECONDITION_CHECKER

inherit

	ET_EXPRESSION_CHECKER
		redefine
			make,
			check_formal_argument_validity,
			check_local_variable_validity,
			check_precursor_expression_validity,
			check_result_validity,
			check_result_address_validity,
			check_vape_validity,
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
			Result := a_feature.implementation_feature.assertions_checked
		end

	has_implementation_error (a_feature: ET_FEATURE): BOOLEAN is
			-- Has a fatal error occurred during checking
			-- of implementation of assertions of `a_feature'?
		do
			Result := a_feature.implementation_feature.has_assertions_error
		end

feature -- Validity checking

	check_preconditions_validity (a_preconditions: ET_PRECONDITIONS; a_feature: ET_FEATURE; a_class: ET_CLASS) is
			-- Check validity of `a_preconditions' of `a_feature' in `a_class'.
			-- Set `has_fatal_error' is a fatal error occurred.
		require
			a_preconditions_not_void: a_preconditions /= Void
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
						check_preconditions_validity (a_preconditions, a_feature_impl, a_class_impl)
					end
				end
				if not has_fatal_error then
					boolean_type := universe.boolean_class
					assertion_context.set_root_context (current_class)
					nb := a_preconditions.count
					from i := 1 until i > nb loop
						an_expression := a_preconditions.assertion (i).expression
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
				error_handler.report_giady_error
			elseif a_seed < 1 or a_seed > an_arguments.count then
					-- Internal error.
				set_fatal_error
				error_handler.report_giadz_error
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
				-- The local entity appears in a precondition.
			set_fatal_error
			a_class_impl := current_feature.implementation_class
			if a_class_impl = current_class then
				error_handler.report_veen2c_error (current_class, a_name, current_feature)
			else
				if not has_implementation_error (current_feature) then
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
		do
				-- The Precursor expression does not appear in a Routine_body.
			set_fatal_error
			a_class_impl := current_feature.implementation_class
			if current_class = a_class_impl then
				error_handler.report_vdpr1b_error (current_class, an_expression)
			elseif not has_implementation_error (current_feature) then
					-- Internal error: the VDPR-1 error should have been
					-- reported in the implementation feature.
				error_handler.report_giadk_error
			end
		end

	check_result_validity (an_expression: ET_RESULT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
		local
			a_class_impl: ET_CLASS
		do
				-- The entity Result appears in a precondition.
			set_fatal_error
			a_class_impl := current_feature.implementation_class
			if a_class_impl = current_class then
				error_handler.report_veen2b_error (current_class, an_expression, current_feature)
			else
				if not has_implementation_error (current_feature) then
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
		do
				-- The entity Result appears in a precondition.
			set_fatal_error
			a_class_impl := current_feature.implementation_class
			if a_class_impl = current_class then
				error_handler.report_veen2b_error (current_class, an_expression.result_keyword, current_feature)
			else
				if not has_implementation_error (current_feature) then
						-- Internal error: the VEEN-2 error should have been
						-- reported in the implementation feature.
					error_handler.report_giadn_error
				end
			end
		end

	check_vape_validity (a_name: ET_FEATURE_NAME; a_feature: ET_FEATURE; a_class: ET_CLASS) is
			-- Check VAPE validity rule when calling `a_feature' named `a_name'
			-- in a precondition of `current_feature' in `current_class'.
			-- `a_class' is the base class of the target, or void in case of
			-- an unqualified call.
			-- The validity rule VAPE says that all features which are called
			-- in a precondition of a feature `f' should be exported to every
			-- class to which `f' is exported.
		local
			l_void_seed: INTEGER
			l_feature_clients: ET_CLASS_NAME_LIST
			l_clients: ET_CLASS_NAME_LIST
			l_client_name: ET_CLASS_NAME
			l_client: ET_CLASS
			i, nb: INTEGER
			a_class_impl: ET_CLASS
		do
			l_void_seed := universe.void_seed
			if l_void_seed > 0 and then a_feature.has_seed (l_void_seed) then
				-- Note: ISE Eiffel does not report VAPE when `a_feature' is the Void feature.
				-- However ETL says it should be reported (it does not mention a special
				-- case for `Void').
			else
				l_feature_clients := a_feature.clients
				l_clients := current_feature.clients
				nb := l_clients.count
				from i := 1 until i > nb loop
					l_client_name := l_clients.class_name (i)
					if l_client_name.same_class_name (universe.none_class.name) then
						-- NONE is a descendant of all classes.
					elseif universe.has_class (l_client_name) then
						l_client := universe.eiffel_class (l_client_name)
						if not a_feature.is_exported_to (l_client, universe.ancestor_builder) then
								-- The feature is not exported to `l_client'.
							set_fatal_error
							a_class_impl := current_feature.implementation_class
							if current_class = a_class_impl then
								if a_class = Void then
									error_handler.report_vape0a_error (current_class, a_name, a_feature, current_feature, l_client)
								else
									error_handler.report_vape0c_error (current_class, a_name, a_feature, a_class, current_feature, l_client)
								end
							else
								if a_class = Void then
									error_handler.report_vape0b_error (current_class, a_class_impl, a_name, a_feature, current_feature, l_client)
								else
									error_handler.report_vape0d_error (current_class, a_class_impl, a_name, a_feature, a_class, current_feature, l_client)
								end
							end
						end
					elseif not l_feature_clients.has (l_client_name) then
							-- The feature is not exported to `l_client_name'.
							-- Note that `l_client_name' is not a class in the universe.
							-- Therefore we expect this class name to be explicitly
							-- listed in the client list of `a_feature'.
						set_fatal_error
						a_class_impl := current_feature.implementation_class
						if current_class = a_class_impl then
							if a_class = Void then
								error_handler.report_vape0e_error (current_class, a_name, a_feature, current_feature, l_client_name)
							else
								error_handler.report_vape0g_error (current_class, a_name, a_feature, a_class, current_feature, l_client_name)
							end
						else
							if a_class = Void then
								error_handler.report_vape0f_error (current_class, a_class_impl, a_name, a_feature, current_feature, l_client_name)
							else
								error_handler.report_vape0h_error (current_class, a_class_impl, a_name, a_feature, a_class, current_feature, l_client_name)
							end
						end
					end
					i := i + 1
				end
			end
		end

feature {NONE} -- Implementation

	assertion_context: ET_NESTED_TYPE_CONTEXT
			-- Assertion context

invariant

	assertion_context_not_void: assertion_context /= Void

end
