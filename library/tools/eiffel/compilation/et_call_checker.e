indexing

	description:

		"Eiffel call validity checkers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003-2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_CALL_CHECKER

inherit

	ET_AST_NULL_PROCESSOR

	ET_SHARED_TOKEN_CONSTANTS
		export {NONE} all end

feature -- Status report

	has_fatal_error: BOOLEAN
			-- Has a fatal error occurred when checking
			-- validity of last instruction or expression?

feature {NONE} -- Validity checking

	check_qualified_call_validity (a_target: ET_EXPRESSION; a_name: ET_FEATURE_NAME;
		an_actuals: ET_ACTUAL_ARGUMENT_LIST; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of qualified call.
		require
			a_target_not_void: a_target /= Void
			a_name_not_void: a_name /= Void
		local
			l_context: ET_NESTED_TYPE_CONTEXT
			a_class_impl: ET_CLASS
			a_class: ET_CLASS
			a_feature: ET_FEATURE
			a_type: ET_TYPE
			a_seed: INTEGER
			a_like: ET_LIKE_FEATURE
			any_type: ET_CLASS_TYPE
			l_target_context: ET_NESTED_TYPE_CONTEXT
		do
			any_type := universe.any_type
			a_class_impl := current_feature.implementation_class
			a_seed := a_name.seed
			if a_seed = 0 then
					-- We need to resolve `a_name' in the implementation
					-- class of `current_feature' first.
				if a_class_impl /= current_class or a_context = Void then
					l_context := new_type_context (a_class_impl)
					l_target_context := l_context
				else
					l_target_context := a_context
				end
				expression_checker.check_expression_validity (a_target, l_target_context, any_type, current_feature, a_class_impl)
				if expression_checker.has_fatal_error then
					set_fatal_error
				else
					if not l_target_context.is_empty and then l_target_context.first = universe.string_type then
							-- When a manifest string is the target of a call,
							-- we consider it as non-cat type.
						l_target_context.put (universe.string_class, 1)
					end
					a_class := l_target_context.base_class (universe)
					a_class.process (universe.interface_checker)
					if a_class.has_interface_error then
						set_fatal_error
					else
						a_feature := a_class.named_feature (a_name)
						if a_feature /= Void then
							a_seed := a_feature.first_seed
							a_name.set_seed (a_seed)
							if a_class_impl /= current_class then
									-- We need to get the feature in the
									-- context of `current_class'.
								a_feature := Void
							end
						else
							set_fatal_error
								-- ISE Eiffel 5.4 reports this error as a VEEN,
								-- but it is in fact a VUEX-2 (ETL2 p.368).
							error_handler.report_vuex2a_error (a_class_impl, a_name, a_class)
						end
					end
				end
			end
			if not has_fatal_error and a_seed /= 0 then
				if a_feature = Void then
					if a_context /= Void then
						l_target_context := a_context
					else
						if l_context /= Void then
							l_context.wipe_out
							l_context.set_root_context (current_class)
						else
							l_context := new_type_context (current_class)
						end
						l_target_context := l_context
					end
					expression_checker.check_expression_validity (a_target, l_target_context, any_type, current_feature, current_class)
					if expression_checker.has_fatal_error then
						set_fatal_error
					else
						if not l_target_context.is_empty and then l_target_context.first = universe.string_type then
								-- When a manifest string is the target of a call,
								-- we consider it as non-cat type.
							l_target_context.put (universe.string_class, 1)
						end
						a_class := l_target_context.base_class (universe)
						a_class.process (universe.interface_checker)
						if a_class.has_interface_error then
							set_fatal_error
						else
							a_feature := a_class.seeded_feature (a_seed)
							if a_feature = Void then
									-- Report internal error: if we got a seed, the
									-- `a_feature' should not be void.
								set_fatal_error
								error_handler.report_giaak_error
							end
						end
					end
				end
				if a_feature /= Void then
					check
						a_class_not_void: a_class /= Void
						l_target_context_not_void: l_target_context /= Void
					end
					if not a_feature.is_exported_to (current_class, universe.ancestor_builder) then
							-- The feature is not exported to `current_class'.
						set_fatal_error
						if current_class = a_class_impl then
							error_handler.report_vuex2b_error (current_class, a_name, a_feature, a_class)
						else
							error_handler.report_vuex2c_error (current_class, a_class_impl, a_name, a_feature, a_class)
						end
					end
					check_arguments_validity (an_actuals, a_name, a_feature, l_target_context, a_class)
						-- Check whether `a_feature' satistfies CAT validity rules.
					check_cat_validity (a_name, a_feature, l_target_context)
					a_type := a_feature.type
					if in_expression then
						if a_type = Void then
								-- In a call expression, `a_feature' has to be a query.
							set_fatal_error
							if current_class = a_class_impl then
								error_handler.report_vkcn2a_error (current_class, a_name, a_feature, a_class)
							else
								error_handler.report_vkcn2b_error (current_class, a_class_impl, a_name, a_feature, a_class)
							end
						elseif not has_fatal_error and then a_context /= Void then
-- TODO: like argument
							if an_actuals /= Void and then an_actuals.count = 1 then
								a_like ?= a_type
								if a_like /= Void and then a_like.is_like_argument then
									if l_target_context /= a_context then
										a_context.wipe_out
										a_context.set_root_context (current_class)
										l_target_context.force_first (a_feature.arguments.formal_argument (1).type)
										expression_checker.check_expression_validity (an_actuals.expression (1), a_context, l_target_context, current_feature, current_class)
										l_target_context.remove_first
									else
										l_target_context := new_type_context (current_class)
										l_target_context.copy_type_context (a_context)
										l_target_context.force_first (a_feature.arguments.formal_argument (1).type)
										a_context.wipe_out
										a_context.set_root_context (current_class)
										expression_checker.check_expression_validity (an_actuals.expression (1), a_context, l_target_context, current_feature, current_class)
										recycle_type_context (l_target_context)
									end
								else
									a_context.force_first (a_type)
								end
							else
								a_context.force_first (a_type)
							end
						end
					else
						if a_type /= Void then
								-- In a call instruction, `a_feature' has to be a procedure.
							set_fatal_error
							if current_class = a_class_impl then
								error_handler.report_vkcn1a_error (current_class, a_name, a_feature, a_class)
							else
								error_handler.report_vkcn1b_error (current_class, a_class_impl, a_name, a_feature, a_class)
							end
						end
					end
				end
			end
			if l_context /= Void then
				recycle_type_context (l_context)
			end
		end

	check_unqualified_call_validity (a_name: ET_FEATURE_NAME;
		an_actuals: ET_ACTUAL_ARGUMENT_LIST; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of unqualified call.
		require
			a_name_not_void: a_name /= Void
		local
			a_class_impl: ET_CLASS
			a_feature: ET_FEATURE
			a_type: ET_TYPE
			a_seed: INTEGER
			an_identifier: ET_IDENTIFIER
			an_arguments: ET_FORMAL_ARGUMENT_LIST
			a_locals: ET_LOCAL_VARIABLE_LIST
			a_like: ET_LIKE_FEATURE
			already_checked: BOOLEAN
			l_formal_context: ET_NESTED_TYPE_CONTEXT
		do
			a_class_impl := current_feature.implementation_class
			a_seed := a_name.seed
			if a_seed = 0 then
					-- We check first whether it is a formal argument or a local
					-- variable before checking whether it is a feature of the class
					-- because it gives better execution speed.
				an_identifier ?= a_name
				if an_identifier /= Void then
					an_arguments := current_feature.arguments
					if an_arguments /= Void then
						a_seed := an_arguments.index_of (an_identifier)
						if a_seed /= 0 then
								-- `a_name' is a fomal argument.
							if an_actuals /= Void then
									-- Syntax error: a formal argument cannot have arguments.
								set_fatal_error
								error_handler.report_gvuaa0a_error (a_class_impl, an_identifier, current_feature)
							end
							if in_expression then
								an_identifier.set_seed (a_seed)
								an_identifier.set_argument (True)
								if a_class_impl = current_class then
										-- No need to check validity in the
										-- context of `current_class' again.
									already_checked := True
									if not has_fatal_error and then a_context /= Void then
										a_context.force_first (an_arguments.formal_argument (a_seed).type)
									end
								end
							else
									-- Syntax error: a formal argument cannot be an instruction.
								set_fatal_error
									-- Note: ISE 5.4 reports a VKCN-1 here. However
									-- `a_name' is not a function nor an attribute name.
								error_handler.report_gvuia0a_error (a_class_impl, an_identifier, current_feature)
							end
						end
					end
					if a_seed = 0 then
						a_locals := current_feature.locals
						if a_locals /= Void then
							a_seed := a_locals.index_of (an_identifier)
							if a_seed /= 0 then
									-- `a_name' is a local variable.
								if an_actuals /= Void then
										-- Syntax error: a local variable cannot have arguments.
									set_fatal_error
									error_handler.report_gvual0a_error (a_class_impl, an_identifier, current_feature)
								end
								if in_expression then
									an_identifier.set_seed (a_seed)
									an_identifier.set_local (True)
									if a_class_impl = current_class then
											-- No need to check validity in the
											-- context of `current_class' again.
										already_checked := True
										if not has_fatal_error and then a_context /= Void then
											a_context.force_first (resolved_formal_parameters (a_locals.local_variable (a_seed).type))
										end
									end
								else
										-- Syntax error: a local variable cannot be an instruction.
									set_fatal_error
										-- Note: ISE 5.4 reports a VKCN-1 here. However
										-- `a_name' is not a function nor an attribute name.
									error_handler.report_gvuil0a_error (a_class_impl, an_identifier, current_feature)
								end
							end
						end
					end
				end
				if a_seed = 0 then
					a_class_impl.process (universe.interface_checker)
					if a_class_impl.has_interface_error then
						set_fatal_error
					else
						a_feature := a_class_impl.named_feature (a_name)
						if a_feature /= Void then
							a_seed := a_feature.first_seed
							a_name.set_seed (a_seed)
							if a_class_impl /= current_class then
									-- We need to get the feature in the
									-- context of `current_class'.
								a_feature := Void
							end
						else
							set_fatal_error
								-- ISE Eiffel 5.4 reports this error as a VEEN,
								-- but it is in fact a VUEX-1 (ETL2 p.368).
							error_handler.report_vuex1a_error (a_class_impl, a_name)
						end
					end
				end
			end
			if not has_fatal_error and a_seed /= 0 and not already_checked then
				if in_expression and then a_name.is_argument then
					an_arguments := current_feature.arguments
					if an_arguments = Void then
							-- Internal error.
						set_fatal_error
						error_handler.report_giaal_error
					elseif a_seed < 1 or a_seed > an_arguments.count then
							-- Internal error.
						set_fatal_error
						error_handler.report_giaam_error
					elseif an_actuals /= Void then
							-- Syntax error: a formal argument cannot have arguments.
						set_fatal_error
						an_identifier := a_locals.local_variable (a_seed).name
						error_handler.report_gvuaa0a_error (a_class_impl, an_identifier, current_feature)
					elseif a_context /= Void then
						a_context.force_first (an_arguments.formal_argument (a_seed).type)
					end
				elseif in_expression and then a_name.is_local then
					a_locals := current_feature.locals
					if a_locals = Void then
							-- Internal error.
						set_fatal_error
						error_handler.report_giaan_error
					elseif a_seed < 1 or a_seed > a_locals.count then
							-- Internal error.
						set_fatal_error
						error_handler.report_giaao_error
					elseif an_actuals /= Void then
							-- Syntax error: a local variable cannot have arguments.
						set_fatal_error
						an_identifier := a_locals.local_variable (a_seed).name
						error_handler.report_gvual0a_error (a_class_impl, an_identifier, current_feature)
					elseif a_context /= Void then
						a_context.force_first (resolved_formal_parameters (a_locals.local_variable (a_seed).type))
					end
				else
					if a_feature = Void then
						current_class.process (universe.interface_checker)
						if current_class.has_interface_error then
							set_fatal_error
						else
							a_feature := current_class.seeded_feature (a_seed)
							if a_feature = Void then
									-- Report internal error: if we got a seed, the
									-- `a_feature' should not be void.
								set_fatal_error
								error_handler.report_giabe_error
							end
						end
					end
					if a_feature /= Void then
						l_formal_context := new_type_context (current_class)
						check_arguments_validity (an_actuals, a_name, a_feature, l_formal_context, Void)
						recycle_type_context (l_formal_context)
						a_type := a_feature.type
						if in_expression then
							if a_type = Void then
									-- In a call expression, `a_feature' has to be a query.
								set_fatal_error
								if current_class = a_class_impl then
									error_handler.report_vkcn2c_error (current_class, a_name, a_feature)
								else
									error_handler.report_vkcn2d_error (current_class, a_class_impl, a_name, a_feature)
								end
							elseif not has_fatal_error and then a_context /= Void then
-- TODO: like argument
								if an_actuals /= Void and then an_actuals.count = 1 then
									a_like ?= a_type
									if a_like /= Void and then a_like.is_like_argument then
											-- Keep the `type' and `context' found for the argument.
										l_formal_context := new_type_context (current_class)
										l_formal_context.force_first (a_feature.arguments.formal_argument (1).type)
										expression_checker.check_expression_validity (an_actuals.expression (1), a_context, l_formal_context, current_feature, current_class)
										recycle_type_context (l_formal_context)
									else
										a_context.force_first (a_type)
									end
								else
									a_context.force_first (a_type)
								end
							end
						else
							if a_type /= Void then
									-- In a call instruction, `a_feature' has to be a procedure.
								set_fatal_error
								if current_class = a_class_impl then
									error_handler.report_vkcn1c_error (current_class, a_name, a_feature)
								else
									error_handler.report_vkcn1d_error (current_class, a_class_impl, a_name, a_feature)
								end
							end
						end
					end
				end
			end
		end

	check_precursor_validity (a_precursor: ET_PRECURSOR; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `a_precursor'.
		require
			a_precursor_not_void: a_precursor /= Void
		local
			a_class_impl: ET_CLASS
			a_precursor_keyword: ET_PRECURSOR_KEYWORD
			a_feature: ET_FEATURE
			a_parent_type, an_ancestor: ET_BASE_TYPE
			a_class: ET_CLASS
			an_actuals: ET_ACTUAL_ARGUMENT_LIST
			l_context: ET_NESTED_TYPE_CONTEXT
		do
				-- Make sure that `a_precursor' has been resolved.
			a_class_impl := current_feature.implementation_class
			a_class_impl.process (universe.feature_flattener)
			if a_class_impl.has_flattening_error then
				set_fatal_error
			else
				a_parent_type := a_precursor.parent_type
				if a_parent_type = Void then
						-- Internal error: the Precursor construct should
						-- already have been resolved when flattening the
						-- features of `a_class_impl'.
					set_fatal_error
					error_handler.report_giaap_error
				else
					a_precursor_keyword := a_precursor.precursor_keyword
					a_class := a_parent_type.direct_base_class (universe)
					a_feature := a_class.seeded_feature (a_precursor_keyword.seed)
					if a_feature = Void then
							-- Internal error: the Precursor construct should
							-- already have been resolved when flattening the
							-- features of `a_class_impl'.
						set_fatal_error
						error_handler.report_giabg_error
					else
						if current_class = a_class_impl then
							l_context := new_type_context (a_parent_type)
						else
								-- Resolve generic parameters in the
								-- context of `current_class'.
							if a_parent_type.is_generic then
								current_class.process (universe.ancestor_builder)
								if current_class.has_ancestors_error then
									set_fatal_error
								else
									an_ancestor := current_class.ancestor (a_parent_type, universe)
									if an_ancestor = Void then
											-- Internal error: `a_parent_type' is an ancestor
											-- of `a_class_impl', and hence of `current_class'.
										set_fatal_error
										error_handler.report_giabx_error
									else
										l_context := new_type_context (an_ancestor)
									end
								end
							else
								l_context := new_type_context (a_parent_type)
							end
						end
						if l_context /= Void then
							an_actuals := a_precursor.arguments
							check_arguments_validity (an_actuals, a_precursor_keyword, a_feature, l_context, a_class)
							if in_expression and then not has_fatal_error and then a_context /= Void then
								a_context.force_first (current_feature.type)
							end
							recycle_type_context (l_context)
						end
					end
				end
			end
		end

	check_static_call_validity (a_call: ET_STATIC_FEATURE_CALL; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `a_call'.
		require
			a_call_not_void: a_call /= Void
		local
			l_context: ET_NESTED_TYPE_CONTEXT
			l_target_context: ET_NESTED_TYPE_CONTEXT
			a_class_impl: ET_CLASS
			a_class: ET_CLASS
			a_feature: ET_FEATURE
			a_type: ET_TYPE
			a_name: ET_FEATURE_NAME
			a_seed: INTEGER
		do
			a_type := a_call.type
			check_type_validity (a_type)
			if not has_fatal_error then
				a_class_impl := current_feature.implementation_class
				a_name := a_call.name
				a_seed := a_name.seed
				if a_seed = 0 then
						-- We need to resolve `a_name' in the implementation
						-- class of `current_feature' first.
					if a_class_impl /= current_class or a_context = Void then
						l_context := new_type_context (a_class_impl)
						l_target_context := l_context
					else
						l_target_context := a_context
					end
					l_target_context.force_first (a_type)
					a_class := l_target_context.base_class (universe)
					a_class.process (universe.interface_checker)
					if a_class.has_interface_error then
						set_fatal_error
					else
						a_feature := a_class.named_feature (a_name)
						if a_feature /= Void then
							a_seed := a_feature.first_seed
							a_name.set_seed (a_seed)
							if a_class_impl /= current_class then
									-- We need to get the feature in the
									-- context of `current_class'.
								a_feature := Void
							end
						else
							set_fatal_error
								-- ISE Eiffel 5.4 reports this error as a VEEN,
								-- but it is in fact a VUEX-2 (ETL2 p.368).
							error_handler.report_vuex2a_error (a_class_impl, a_name, a_class)
						end
					end
				end
				if not has_fatal_error and a_seed /= 0 then
					if a_feature = Void then
						a_type := resolved_formal_parameters (a_type)
						if not has_fatal_error then
							if a_context /= Void then
								l_target_context := a_context
							else
								if l_context /= Void then
									l_context.wipe_out
									l_context.set_root_context (current_class)
								else
									l_context := new_type_context (current_class)
								end
								l_target_context := l_context
							end
							l_target_context.force_first (a_type)
							a_class := l_target_context.base_class (universe)
							a_class.process (universe.interface_checker)
							if a_class.has_interface_error then
								set_fatal_error
							else
								a_feature := a_class.seeded_feature (a_seed)
								if a_feature = Void then
										-- Report internal error: if we got a seed, the
										-- `a_feature' should not be void.
									set_fatal_error
									error_handler.report_giabc_error
								end
							end
						end
					end
					if a_feature /= Void then
						check
							a_class_not_void: a_class /= Void
							l_target_context_not_void: l_target_context /= Void
						end
						if not a_feature.is_exported_to (current_class, universe.ancestor_builder) then
								-- The feature is not exported to `current_class'.
							set_fatal_error
							if current_class = a_class_impl then
								error_handler.report_vuex2b_error (current_class, a_name, a_feature, a_class)
							else
								error_handler.report_vuex2c_error (current_class, a_class_impl, a_name, a_feature, a_class)
							end
						end
						check_arguments_validity (a_call.arguments, a_name, a_feature, l_target_context, a_class)
						a_type := a_feature.type
						if in_expression then
-- TODO: check that `a_feature' is a constant attribute or an external function.
							if a_type = Void then
									-- In a call expression, `a_feature' has to be a query.
								set_fatal_error
								if current_class = a_class_impl then
									error_handler.report_vkcn2a_error (current_class, a_name, a_feature, a_class)
								else
									error_handler.report_vkcn2b_error (current_class, a_class_impl, a_name, a_feature, a_class)
								end
							elseif not has_fatal_error and then a_context /= Void then
								a_context.force_first (a_type)
							end
						else
-- TODO: check that `a_feature' is an external procedure.
							if a_type /= Void then
									-- In a call instruction, `a_feature' has to be a procedure.
								set_fatal_error
								if current_class = a_class_impl then
									error_handler.report_vkcn1a_error (current_class, a_name, a_feature, a_class)
								else
									error_handler.report_vkcn1b_error (current_class, a_class_impl, a_name, a_feature, a_class)
								end
							end
						end
					end
				end
			end
			if l_context /= Void then
				recycle_type_context (l_context)
			end
		end

	check_arguments_validity (an_actuals: ET_ACTUAL_ARGUMENT_LIST; a_name: ET_FEATURE_NAME;
		a_feature: ET_FEATURE; a_context: ET_NESTED_TYPE_CONTEXT; a_class: ET_CLASS) is
			-- Check actual arguments validity when calling `a_feature' named `a_name'
			-- in context of its target `a_context'. `a_class' is the base class of the
			-- target, or void in case of an unqualified call.
		require
			a_name_not_void: a_name /= Void
			a_feature_not_void: a_feature /= Void
			a_context_not_void: a_context /= Void
		local
			a_class_impl: ET_CLASS
			an_actual: ET_EXPRESSION
			a_formals: ET_FORMAL_ARGUMENT_LIST
			a_formal: ET_FORMAL_ARGUMENT
			i, nb: INTEGER
			had_error: BOOLEAN
			an_actual_named_type: ET_NAMED_TYPE
			a_formal_named_type: ET_NAMED_TYPE
			a_convert_feature: ET_CONVERT_FEATURE
			a_convert_expression: ET_CONVERT_EXPRESSION
			an_expression_comma: ET_EXPRESSION_COMMA
			l_actual_context: ET_NESTED_TYPE_CONTEXT
			l_formal_context: ET_NESTED_TYPE_CONTEXT
			l_formal_type: ET_TYPE
		do
			a_class_impl := current_feature.implementation_class
			a_formals := a_feature.arguments
			if an_actuals = Void or else an_actuals.is_empty then
				if a_formals /= Void and then not a_formals.is_empty then
					set_fatal_error
					if a_class /= Void then
						if a_name.is_precursor then
							if current_class = a_class_impl then
								error_handler.report_vdpr4a_error (current_class, a_name.precursor_keyword, a_feature, a_class)
							else
								error_handler.report_vdpr4b_error (current_class, a_class_impl, a_name.precursor_keyword, a_feature, a_class)
							end
						else
							if current_class = a_class_impl then
								error_handler.report_vuar1a_error (current_class, a_name, a_feature, a_class)
							else
								error_handler.report_vuar1b_error (current_class, a_class_impl, a_name, a_feature, a_class)
							end
						end
					else
						if current_class = a_class_impl then
							error_handler.report_vuar1c_error (current_class, a_name, a_feature)
						else
							error_handler.report_vuar1d_error (current_class, a_class_impl, a_name, a_feature)
						end
					end
				end
			elseif a_formals = Void or else a_formals.count /= an_actuals.count then
				set_fatal_error
				if a_class /= Void then
					if a_name.is_precursor then
						if current_class = a_class_impl then
							error_handler.report_vdpr4a_error (current_class, a_name.precursor_keyword, a_feature, a_class)
						else
							error_handler.report_vdpr4b_error (current_class, a_class_impl, a_name.precursor_keyword, a_feature, a_class)
						end
					else
						if current_class = a_class_impl then
							error_handler.report_vuar1a_error (current_class, a_name, a_feature, a_class)
						else
							error_handler.report_vuar1b_error (current_class, a_class_impl, a_name, a_feature, a_class)
						end
					end
				else
					if current_class = a_class_impl then
						error_handler.report_vuar1c_error (current_class, a_name, a_feature)
					else
						error_handler.report_vuar1d_error (current_class, a_class_impl, a_name, a_feature)
					end
				end
			else
				l_actual_context := new_type_context (current_class)
				l_formal_context := a_context
				l_formal_type := tokens.like_current
				had_error := has_fatal_error
				nb := an_actuals.count
				from i := 1 until i > nb loop
					an_actual := an_actuals.expression (i)
					a_formal := a_formals.formal_argument (i)
					l_formal_context.force_first (a_formal.type)
					expression_checker.check_expression_validity (an_actual, l_actual_context, l_formal_context, current_feature, current_class)
					if expression_checker.has_fatal_error then
						had_error := True
					else
						a_convert_expression ?= an_actual
						if a_convert_expression /= Void then
-- TODO
-- Already converted in ancestor. Need to check that this conversion is still
-- valid in current class.
						elseif not l_actual_context.conforms_to_type (l_formal_type, l_formal_context, universe) then
							a_convert_feature := type_checker.convert_feature (l_actual_context, l_formal_context)
							if a_convert_feature /= Void then
								a_convert_expression := universe.ast_factory.new_convert_expression (an_actual, a_convert_feature)
								if a_convert_expression /= Void then
									an_expression_comma ?= an_actuals.item (i)
									if an_expression_comma /= Void then
										an_expression_comma.set_expression (a_convert_expression)
									else
										an_actuals.put (a_convert_expression, i)
									end
								end
							else
								an_actual_named_type := l_actual_context.named_type (universe)
								a_formal_named_type := l_formal_context.named_type (universe)
								had_error := True
								set_fatal_error
								if a_class /= Void then
									if a_name.is_precursor then
										if current_class = a_class_impl then
											error_handler.report_vdpr4c_error (current_class, a_name.precursor_keyword, a_feature, a_class, i, an_actual_named_type, a_formal_named_type)
										else
											error_handler.report_vdpr4d_error (current_class, a_class_impl, a_name.precursor_keyword, a_feature, a_class, i, an_actual_named_type, a_formal_named_type)
										end
									else
										if current_class = a_class_impl then
											error_handler.report_vuar2a_error (current_class, a_name, a_feature, a_class, i, an_actual_named_type, a_formal_named_type)
										else
											error_handler.report_vuar2b_error (current_class, a_class_impl, a_name, a_feature, a_class, i, an_actual_named_type, a_formal_named_type)
										end
									end
								else
									if current_class = a_class_impl then
										error_handler.report_vuar2c_error (current_class, a_name, a_feature, i, an_actual_named_type, a_formal_named_type)
									else
										error_handler.report_vuar2d_error (current_class, a_class_impl, a_name, a_feature, i, an_actual_named_type, a_formal_named_type)
									end
								end
							end
						end
					end
					l_formal_context.remove_first
					l_actual_context.wipe_out
					i := i + 1
				end
				recycle_type_context (l_actual_context)
				if had_error then
						-- The error status may have been reset
						-- while checking the arguments.
					set_fatal_error
				end
			end
		end

	check_cat_validity (a_name: ET_FEATURE_NAME; a_feature: ET_FEATURE; a_context: ET_TYPE_CONTEXT) is
			-- Check CAT valifity rules on qualified call to `a_feature' named `a_name'
			-- in context of its target `a_context'.
		require
			a_name_not_void: a_name /= Void
			a_feature_not_void: a_feature /= Void
			a_context_not_void: a_context /= Void
		local
			a_formals: ET_FORMAL_ARGUMENT_LIST
			a_formal: ET_FORMAL_ARGUMENT
			i, nb: INTEGER
			j, nb2: INTEGER
		do
			if universe.cat_enabled and not universe.searching_dog_types then
				if a_feature.is_cat then
					if not a_context.is_cat_type (universe) then
						set_fatal_error
-- TODO:
						error_handler.report_error_message ("class " + current_class.name.name + " (" +
							a_name.position.line.out + "," + a_name.position.column.out +
							"): cat feature `" + a_name.name + "' applied to target of non-cat type '" +
							a_context.base_type (universe).to_text + "'")
					end
				end
				a_formals := a_feature.arguments
				if a_formals /= Void and then not a_formals.is_empty then
					nb2 := a_formals.count
					nb := a_context.base_type_actual_count (universe)
					from i := 1 until i > nb loop
						if not a_context.is_actual_cat_parameter (i, universe) then
							from j := 1 until j > nb2 loop
								a_formal := a_formals.formal_argument (j)
								if a_formal.type.has_formal_type (i, a_context, universe) then
									set_fatal_error
-- TODO:
									error_handler.report_error_message ("class " + current_class.name.name + " (" +
										a_name.position.line.out + "," + a_name.position.column.out +
										"): the type of the formal argument #" + j.out + " of feature `" + a_name.name +
										"' contains formal generic parameter #" + i.out + " but the corresponding actual parameter '" +
										a_context.base_type_actual (i, universe).to_text + "' is not declared as cat.")
								end
								j := j + 1
							end
						end
						i := i + 1
					end
				end
			end
		end

	expression_checker: ET_EXPRESSION_CHECKER is
			-- Expression validity checker
		deferred
		end

feature {NONE} -- Type checking

	check_type_validity (a_type: ET_TYPE) is
			-- Check validity of `a_type'.
		require
			a_type_not_void: a_type /= Void
		do
			type_checker.check_type_validity (a_type, current_feature, current_feature.implementation_class)
			if type_checker.has_fatal_error then
				set_fatal_error
			end
		end

	resolved_formal_parameters (a_type: ET_TYPE): ET_TYPE is
			-- Replace formal generic parameters in `a_type' by their
			-- corresponding actual parameters if the class where
			-- `a_type' appears is generic and is not `current_class'.
		require
			a_type_not_void: a_type /= Void
		do
			Result := type_checker.resolved_formal_parameters (a_type, current_feature, current_class)
			if type_checker.has_fatal_error then
				set_fatal_error
			end
		ensure
			resolved_type_not_void: not has_fatal_error implies Result /= Void
		end

	type_checker: ET_TYPE_CHECKER
			-- Type checker

feature {NONE} -- Error handling

	set_fatal_error is
			-- Report a fatal error.
		do
			has_fatal_error := True
		ensure
			has_fatal_error: has_fatal_error
		end

feature {NONE} -- Access

	current_feature: ET_FEATURE
			-- Feature to which instruction or expression being processed belongs

	current_class: ET_CLASS
			-- Class to with `current_feature' belongs

feature {NONE} -- Type context

	new_type_context (a_context: ET_BASE_TYPE): ET_NESTED_TYPE_CONTEXT is
			-- New nested type context
		require
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
		do
			Result := expression_checker.new_type_context (a_context)
		ensure
			type_context_not_void: Result /= Void
			root_context_set: Result.root_context = a_context
			type_context_empty: Result.is_empty
		end

	recycle_type_context (a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Recycle `a_context'.
		require
			a_context_not_void: a_context /= Void
		do
			expression_checker.recycle_type_context (a_context)
		end

feature {NONE} -- Implementation

	in_expression: BOOLEAN is
			-- Are we processing an expression?
		do
			Result := False
		end

feature {NONE} -- Implementation

	internal_call: BOOLEAN
			-- Have the process routines been called from here?

	dummy_feature: ET_FEATURE is
			-- Dummy feature
		local
			a_name: ET_FEATURE_NAME
			a_clients: ET_NONE_CLIENTS
		once
			create {ET_IDENTIFIER} a_name.make ("**dummy**")
			create a_clients.make (tokens.left_brace_symbol, tokens.right_brace_symbol)
			create {ET_DEFERRED_PROCEDURE} Result.make (a_name, Void, Void, Void, Void, a_clients, current_class)
		ensure
			dummy_feature_not_void: Result /= Void
		end

invariant

	current_feature_not_void: current_feature /= Void
	current_class_not_void: current_class /= Void
	expression_checker_not_void: expression_checker /= Void
	type_checker_not_void: type_checker /= Void

end
