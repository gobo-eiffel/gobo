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
		redefine
			make
		end

	ET_SHARED_TOKEN_CONSTANTS
		export {NONE} all end

feature {NONE} -- Initialization

	make (a_universe: like universe) is
			-- Create a new call validity checker.
		do
			universe := a_universe
			current_class := a_universe.unknown_class
			current_feature := dummy_feature
			create type_checker.make (a_universe)
			create formal_context.make_with_capacity (current_class, 10)
		end

feature -- Status report

	has_fatal_error: BOOLEAN
			-- Has a fatal error occurred when checking
			-- validity of last instruction or expression?

	implementation_checked (a_feature: ET_FEATURE): BOOLEAN is
			-- Has the implementation of `a_feature' been checked?
		require
			a_feature_not_void: a_feature /= Void
		do
			Result := a_feature.implementation_feature.implementation_checked
		end

	has_implementation_error (a_feature: ET_FEATURE): BOOLEAN is
			-- Has a fatal error occurred during checking
			-- of implementation of `a_feature'?
		require
			a_feature_not_void: a_feature /= Void
		do
			Result := a_feature.implementation_feature.has_implementation_error
		end

feature {NONE} -- Validity checking

	check_qualified_call_validity (a_target: ET_EXPRESSION; a_name: ET_FEATURE_NAME;
		an_actuals: ET_ACTUAL_ARGUMENT_LIST; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of qualified call.
		require
			a_target_not_void: a_target /= Void
			a_name_not_void: a_name /= Void
			a_context_not_void: a_context /= Void
		local
			a_class_impl: ET_CLASS
			a_class: ET_CLASS
			a_feature: ET_FEATURE
			a_type: ET_TYPE
			a_seed: INTEGER
			a_like: ET_LIKE_FEATURE
			any_type: ET_CLASS_TYPE
		do
			any_type := universe.any_type
			a_seed := a_name.seed
			if a_seed = 0 then
					-- We need to resolve `a_name' in the implementation
					-- class of `current_feature' first.
				a_class_impl := current_feature.implementation_class
				if a_class_impl /= current_class then
					set_fatal_error
					if not has_implementation_error (current_feature) then
							-- Internal error: `a_name' should have been resolved in
							-- the implementation feature.
						error_handler.report_giacf_error
					end
				else
					check_subexpression_validity (a_target, a_context, any_type)
					if not has_fatal_error then
						if not a_context.is_empty and then a_context.first = universe.string_type then
								-- When a manifest string is the target of a call,
								-- we consider it as non-cat type.
							a_context.put (universe.string_class, 1)
						end
						a_class := a_context.base_class (universe)
						a_class.process (universe.interface_checker)
						if a_class.has_interface_error then
							set_fatal_error
						else
							a_feature := a_class.named_feature (a_name)
							if a_feature /= Void then
								a_seed := a_feature.first_seed
								a_name.set_seed (a_seed)
							else
								set_fatal_error
									-- ISE Eiffel 5.4 reports this error as a VEEN,
									-- but it is in fact a VUEX-2 (ETL2 p.368).
								error_handler.report_vuex2a_error (current_class, a_name, a_class)
							end
						end
					end
				end
			end
			if not has_fatal_error then
				if a_feature = Void then
					check_subexpression_validity (a_target, a_context, any_type)
					if not has_fatal_error then
						if not a_context.is_empty and then a_context.first = universe.string_type then
								-- When a manifest string is the target of a call,
								-- we consider it as non-cat type.
							a_context.put (universe.string_class, 1)
						end
						a_class := a_context.base_class (universe)
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
					end
					if not a_feature.is_exported_to (current_class, universe.ancestor_builder) then
							-- The feature is not exported to `current_class'.
						set_fatal_error
						a_class_impl := current_feature.implementation_class
						if current_class = a_class_impl then
							error_handler.report_vuex2b_error (current_class, a_name, a_feature, a_class)
						else
							error_handler.report_vuex2c_error (current_class, a_class_impl, a_name, a_feature, a_class)
						end
					end
					check_arguments_validity (an_actuals, a_context, a_name, a_feature, a_class)
						-- Check whether `a_feature' satistfies CAT validity rules.
					check_cat_validity (a_name, a_feature, a_context)
					a_type := a_feature.type
					if in_expression then
						if a_type = Void then
								-- In a call expression, `a_feature' has to be a query.
							set_fatal_error
							a_class_impl := current_feature.implementation_class
							if current_class = a_class_impl then
								error_handler.report_vkcn2a_error (current_class, a_name, a_feature, a_class)
							elseif not has_implementation_error (current_feature) then
									-- Internal error: this error should have been reported when
									-- processing the implementation of `current_feature' or in
									-- the feature flattener when redeclaring function `a_feature'
									-- to a procedure in an ancestor of `a_class'.
								error_handler.report_giacg_error
							end
						elseif not has_fatal_error then
-- TODO: like argument (the following is just a workaround
-- which works only in a limited number of cases).
							if an_actuals /= Void and then an_actuals.count = 1 then
								a_like ?= a_type
								if a_like /= Void and then a_like.is_like_argument then
									formal_context.copy_type_context (a_context)
									formal_context.force_first (a_feature.arguments.formal_argument (1).type)
									a_context.wipe_out
									check_argument_validity (an_actuals.expression (1), a_context, formal_context)
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
							a_class_impl := current_feature.implementation_class
							if current_class = a_class_impl then
								error_handler.report_vkcn1a_error (current_class, a_name, a_feature, a_class)
							elseif not has_implementation_error (current_feature) then
									-- Internal error: this error should have been reported when
									-- processing the implementation of `current_feature' or in
									-- the feature flattener when redeclaring procedure `a_feature'
									-- to a function in an ancestor of `a_class'.
								error_handler.report_giach_error
							end
						end
					end
				end
			end
		end

	check_unqualified_call_validity (a_name: ET_FEATURE_NAME;
		an_actuals: ET_ACTUAL_ARGUMENT_LIST; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of unqualified call.
		require
			a_name_not_void: a_name /= Void
			a_context_not_void: a_context /= Void
		local
			a_class_impl: ET_CLASS
			a_feature: ET_FEATURE
			a_type: ET_TYPE
			a_seed: INTEGER
			an_identifier: ET_IDENTIFIER
			an_arguments: ET_FORMAL_ARGUMENT_LIST
			a_locals: ET_LOCAL_VARIABLE_LIST
			a_like: ET_LIKE_FEATURE
		do
			a_seed := a_name.seed
			if a_seed = 0 then
					-- We need to resolve `a_name' in the implementation
					-- class of `current_feature' first.
				a_class_impl := current_feature.implementation_class
				if a_class_impl /= current_class then
					set_fatal_error
					if not has_implementation_error (current_feature) then
							-- Internal error: `a_name' should have been resolved in
							-- the implementation feature.
						error_handler.report_giaci_error
					end
				else
					current_class.process (universe.interface_checker)
					if current_class.has_interface_error then
						set_fatal_error
					else
						a_feature := current_class.named_feature (a_name)
						if a_feature /= Void then
							a_seed := a_feature.first_seed
							a_name.set_seed (a_seed)
						else
								-- Check whether it is a formal argument or a local variable.
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
											error_handler.report_gvuaa0a_error (current_class, an_identifier, current_feature)
										end
											-- Do not set the seed of `an_identifier' so that we report
											-- this error again when checked in a descendant class.
										an_identifier.set_argument (True)
										if in_expression then
											if not has_fatal_error then
													-- Make sure that we report the correct error when
													-- it appears in an invariant.
												an_identifier.set_seed (a_seed)
												check_subexpression_validity (an_identifier, a_context, universe.any_type)
												an_identifier.set_seed (0)
											end
											if not has_fatal_error then
													-- Internal error: the parser should not have
													-- generated a feature call.
												set_fatal_error
												error_handler.report_giaby_error
											end
										else
												-- Syntax error: a formal argument cannot be an instruction.
											set_fatal_error
												-- Note: ISE 5.4 reports a VKCN-1 here. However
												-- `a_name' is not a function nor an attribute name.
											error_handler.report_gvuia0a_error (current_class, an_identifier, current_feature)
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
												error_handler.report_gvual0a_error (current_class, an_identifier, current_feature)
											end
												-- Do not set the seed of `an_identifier' so that we report
												-- this error again when checked in a descendant class.
											an_identifier.set_local (True)
											if in_expression then
												if not has_fatal_error then
														-- Make sure that we report the correct error when
														-- it appears in a precondition or invariant.
													an_identifier.set_seed (a_seed)
													check_subexpression_validity (an_identifier, a_context, universe.any_type)
													an_identifier.set_seed (0)
												end
												if not has_fatal_error then
														-- Internal error: the parser should not have
														-- generated a feature call.
													set_fatal_error
													error_handler.report_giabz_error
												end
											else
													-- Syntax error: a local variable cannot be an instruction.
												set_fatal_error
													-- Note: ISE 5.4 reports a VKCN-1 here. However
													-- `a_name' is not a function nor an attribute name.
												error_handler.report_gvuil0a_error (current_class, an_identifier, current_feature)
											end
										end
									end
								end
							end
							if a_seed = 0 then
								set_fatal_error
									-- ISE Eiffel 5.4 reports this error as a VEEN,
									-- but it is in fact a VUEX-1 (ETL2 p.368).
								error_handler.report_vuex1a_error (current_class, a_name)
							end
						end
					end
				end
			end
			if not has_fatal_error then
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
					check_arguments_validity (an_actuals, a_context, a_name, a_feature, Void)
					a_type := a_feature.type
					if in_expression then
						if a_type = Void then
								-- In a call expression, `a_feature' has to be a query.
							set_fatal_error
							a_class_impl := current_feature.implementation_class
							if current_class = a_class_impl then
								error_handler.report_vkcn2c_error (current_class, a_name, a_feature)
							elseif not has_implementation_error (current_feature) then
									-- Internal error: this error should have been reported when
									-- processing the implementation of `current_feature' or in
									-- the feature flattener when redeclaring function `a_feature'
									-- to a procedure in an ancestor of `current_class'.
								error_handler.report_giacj_error
							end
						elseif not has_fatal_error then
-- TODO: like argument (the following is just a workaround
-- which works only in a limited number of cases).
							if an_actuals /= Void and then an_actuals.count = 1 then
								a_like ?= a_type
								if a_like /= Void and then a_like.is_like_argument then
									formal_context.reset (current_class)
									formal_context.force_first (a_feature.arguments.formal_argument (1).type)
									a_context.wipe_out
									check_argument_validity (an_actuals.expression (1), a_context, formal_context)
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
							a_class_impl := current_feature.implementation_class
							if current_class = a_class_impl then
								error_handler.report_vkcn1c_error (current_class, a_name, a_feature)
							elseif not has_implementation_error (current_feature) then
									-- Internal error: this error should have been reported when
									-- processing the implementation of `current_feature' or in
									-- the feature flattener when redeclaring procedure `a_feature'
									-- to a function in an ancestor of `current_class'.
								error_handler.report_giack_error
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
			a_context_not_void: a_context /= Void
		local
			a_class_impl: ET_CLASS
			a_precursor_keyword: ET_PRECURSOR_KEYWORD
			a_feature: ET_FEATURE
			a_parent_type, an_ancestor: ET_BASE_TYPE
			a_class: ET_CLASS
			an_actuals: ET_ACTUAL_ARGUMENT_LIST
		do
			a_class_impl := current_feature.implementation_class
			if current_feature.first_precursor = Void then
					-- Immediate features cannot have Precursor.
				set_fatal_error
				if a_class_impl /= current_class then
					if not has_implementation_error (current_feature) then
							-- Internal error: Precursor should have been resolved in
							-- the implementation feature.
						error_handler.report_giadx_error
					end
				else
					error_handler.report_vdpr3d_error (current_class, a_precursor, current_feature)
				end
			else
					-- Make sure that `a_precursor' has been resolved.
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
								formal_context.reset (current_class)
								formal_context.force_first (a_parent_type)
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
											formal_context.reset (current_class)
											formal_context.force_first (an_ancestor)
										end
									end
								else
									formal_context.reset (current_class)
									formal_context.force_first (a_parent_type)
								end
							end
							if not has_fatal_error then
								an_actuals := a_precursor.arguments
								check_arguments_validity (an_actuals, formal_context, a_precursor_keyword, a_feature, a_class)
								if in_expression and then not has_fatal_error then
-- TODO: like argument and get the type as it was in the parent.
									a_context.force_first (current_feature.type)
								end
							end
						end
					end
				end
			end
		end

	check_static_call_validity (a_call: ET_STATIC_FEATURE_CALL; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `a_call'.
		require
			a_call_not_void: a_call /= Void
			a_context_not_void: a_context /= Void
		local
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
				a_name := a_call.name
				a_seed := a_name.seed
				if a_seed = 0 then
						-- We need to resolve `a_name' in the implementation
						-- class of `current_feature' first.
					a_class_impl := current_feature.implementation_class
					if a_class_impl /= current_class then
						set_fatal_error
						if not has_implementation_error (current_feature) then
								-- Internal error: `a_name' should have been resolved in
								-- the implementation feature.
							error_handler.report_giacl_error
						end
					else
						a_context.force_first (a_type)
						a_class := a_context.base_class (universe)
						a_class.process (universe.interface_checker)
						if a_class.has_interface_error then
							set_fatal_error
						else
							a_feature := a_class.named_feature (a_name)
							if a_feature /= Void then
								a_seed := a_feature.first_seed
								a_name.set_seed (a_seed)
							else
								set_fatal_error
									-- ISE Eiffel 5.4 reports this error as a VEEN,
									-- but it is in fact a VUEX-2 (ETL2 p.368).
								error_handler.report_vuex2a_error (current_class, a_name, a_class)
							end
						end
					end
				end
				if not has_fatal_error then
					if a_feature = Void then
						a_type := resolved_formal_parameters (a_type)
						if not has_fatal_error then
							a_context.force_first (a_type)
							a_class := a_context.base_class (universe)
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
						end
						if not a_feature.is_exported_to (current_class, universe.ancestor_builder) then
								-- The feature is not exported to `current_class'.
							set_fatal_error
							a_class_impl := current_feature.implementation_class
							if current_class = a_class_impl then
								error_handler.report_vuex2b_error (current_class, a_name, a_feature, a_class)
							else
								error_handler.report_vuex2c_error (current_class, a_class_impl, a_name, a_feature, a_class)
							end
						end
						check_arguments_validity (a_call.arguments, a_context, a_name, a_feature, a_class)
						a_type := a_feature.type
						if in_expression then
-- TODO: check that `a_feature' is a constant attribute or an external function.
							if a_type = Void then
									-- In a call expression, `a_feature' has to be a query.
								set_fatal_error
								a_class_impl := current_feature.implementation_class
								if current_class = a_class_impl then
									error_handler.report_vkcn2a_error (current_class, a_name, a_feature, a_class)
								elseif not has_implementation_error (current_feature) then
										-- Internal error: this error should have been reported when
										-- processing the implementation of `current_feature' or in
										-- the feature flattener when redeclaring function `a_feature'
										-- to a procedure in an ancestor of `a_class'.
									error_handler.report_giacm_error
								end
							elseif not has_fatal_error then
-- TODO: like argument.
								a_context.force_first (a_type)
							end
						else
-- TODO: check that `a_feature' is an external procedure.
							if a_type /= Void then
									-- In a call instruction, `a_feature' has to be a procedure.
								set_fatal_error
								a_class_impl := current_feature.implementation_class
								if current_class = a_class_impl then
									error_handler.report_vkcn1a_error (current_class, a_name, a_feature, a_class)
								elseif not has_implementation_error (current_feature) then
										-- Internal error: this error should have been reported when
										-- processing the implementation of `current_feature' or in
										-- the feature flattener when redeclaring procedure `a_feature'
										-- to a function in an ancestor of `a_class'.
									error_handler.report_giacn_error
								end
							end
						end
					end
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
-- TODO: better error message reporting.
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
-- TODO: better error message reporting.
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

	check_subexpression_validity (an_expression: ET_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT;
		a_target_type: ET_TYPE_CONTEXT) is
			-- Check validity of `an_expression' (whose target is of type
			-- `a_target_type') in `current_feature' of `current_class'.
			-- Set `has_fatal_error' is a fatal error occurred. Otherwise
			-- the type of `an_expression' is appended to `a_context'.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
			a_target_type_not_void: a_target_type /= Void
			valid_target_context: a_target_type.is_valid_context
		deferred
		end

	check_argument_validity (an_actual: ET_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT;
		a_formal_type: ET_TYPE_CONTEXT) is
			-- Check validity of actual argument `an_actual' (whose formal is of type
			-- `a_formal_type') in `current_feature' of `current_class'. Set `has_fatal_error'
			-- is a fatal error occurred. Otherwise the type of `an_expression'
			-- is appended to `a_context'.
		require
			an_actual_not_void: an_actual /= Void
			a_context_not_void: a_context /= Void
			a_formal_type_not_void: a_formal_type /= Void
			valid_formal_context: a_formal_type.is_valid_context
		deferred
		end

	check_arguments_validity (an_actuals: ET_ACTUAL_ARGUMENT_LIST; a_context: ET_NESTED_TYPE_CONTEXT;
		a_name: ET_FEATURE_NAME; a_feature: ET_FEATURE; a_class: ET_CLASS) is
			-- Check actual arguments validity when calling `a_feature' named `a_name'
			-- in context of its target `a_context'. `a_class' is the base class of the
			-- target, or void in case of an unqualified call.
		require
			a_context_not_void: a_context /= Void
			a_name_not_void: a_name /= Void
			a_feature_not_void: a_feature /= Void
		deferred
		end

feature {NONE} -- Type checking

	check_type_validity (a_type: ET_TYPE) is
			-- Check validity of `a_type'.
		require
			a_type_not_void: a_type /= Void
		do
			type_checker.check_type_validity (a_type, current_feature.implementation_feature, current_feature.implementation_class)
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

feature {NONE} -- Implementation

	formal_context: ET_NESTED_TYPE_CONTEXT
			-- Formal context

	in_expression: BOOLEAN is
			-- Are we processing an expression?
		do
			Result := False
		end

	internal_call: BOOLEAN
			-- Have the process routines been called from here?

	dummy_feature: ET_FEATURE is
			-- Dummy feature
		local
			a_name: ET_FEATURE_NAME
		once
			create {ET_IDENTIFIER} a_name.make ("**dummy**")
			create {ET_DEFERRED_PROCEDURE} Result.make (a_name, Void, Void, Void, Void, tokens.any_clients, current_class)
		ensure
			dummy_feature_not_void: Result /= Void
		end

invariant

	current_feature_not_void: current_feature /= Void
	current_class_not_void: current_class /= Void
	implementation_checked: current_class /= current_feature.implementation_class implies implementation_checked (current_feature)
	type_checker_not_void: type_checker /= Void
	formal_context_not_void: formal_context /= Void

end
