indexing

	description:

		"Eiffel expression validity checkers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003-2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_EXPRESSION_CHECKER

inherit

	ET_CALL_CHECKER
		redefine
			make,
			set_fatal_error,
			in_expression,
			process_bit_constant,
			process_c1_character_constant,
			process_c2_character_constant,
			process_c3_character_constant,
			process_call_agent,
			process_call_expression,
			process_convert_expression,
			process_create_expression,
			process_current,
			process_current_address,
			process_equality_expression,
			process_expression_address,
			process_false_constant,
			process_feature_address,
			process_hexadecimal_integer_constant,
			process_infix_expression,
			process_manifest_array,
			process_manifest_tuple,
			process_old_expression,
			process_once_manifest_string,
			process_parenthesized_expression,
			process_precursor_expression,
			process_prefix_expression,
			process_regular_integer_constant,
			process_regular_manifest_string,
			process_regular_real_constant,
			process_result,
			process_result_address,
			process_special_manifest_string,
			process_static_call_expression,
			process_strip_expression,
			process_true_constant,
			process_underscored_integer_constant,
			process_underscored_real_constant,
			process_verbatim_string,
			new_type_context,
			recycle_type_context
		end

creation

	make

feature {NONE} -- Initialization

	make (a_universe: like universe) is
			-- Create a new expression validity checker.
		do
			universe := a_universe
			current_class := a_universe.unknown_class
			current_feature := dummy_feature
			current_target_type := a_universe.any_class
			create type_checker.make (a_universe)
		end

feature -- Setting

	reset is
			-- Reset current validity checker.
		do
			has_fatal_error := False
		ensure
			no_error: not has_fatal_error
		end

feature -- Validity checking

	check_expression_validity (an_expression: ET_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT;
		a_target_type: ET_TYPE_CONTEXT; a_feature: ET_FEATURE; a_class: ET_CLASS) is
			-- Check validity of `an_expression' (whose target is of type
			-- `a_target_type') in `a_feature' of `a_class'. Set `has_fatal_error'
			-- is a fatal error occurred. Otherwise the type of `an_expression'
			-- is appended to `a_context' if it is supplied.
		require
			an_expression_not_void: an_expression /= Void
			a_target_type_not_void: a_target_type /= Void
			valid_target_context: a_target_type.is_valid_context
			a_feature_not_void: a_feature /= Void
			a_class_not_void: a_class /= Void
		local
			old_feature: ET_FEATURE
			old_class: ET_CLASS
			old_target_type: ET_TYPE_CONTEXT
		do
			reset
			old_feature := current_feature
			current_feature := a_feature
			old_class := current_class
			current_class := a_class
			old_target_type := current_target_type
			current_target_type := a_target_type
			current_context := a_context
			internal_call := True
			an_expression.process (Current)
			if internal_call then
					-- Internal error.
				internal_call := False
				set_fatal_error
				error_handler.report_giaaj_error
			end
			current_class := old_class
			current_feature := old_feature
			current_target_type := old_target_type
			current_context := Void
		end

	check_writable_validity (a_writable: ET_WRITABLE; a_context: ET_NESTED_TYPE_CONTEXT;
		a_feature: ET_FEATURE; a_class: ET_CLASS) is
			-- Check validity of `a_writable' in `a_feature' of `a_class'.
			-- Set `has_fatal_error' is a fatal error occurred. Otherwise
			-- the type of `a_writable' is appended to `a_context' if it
			-- is supplied.
		require
			a_writable_not_void: a_writable /= Void
			a_feature_not_void: a_feature /= Void
			a_class_not_void: a_class /= Void
		local
			old_feature: ET_FEATURE
			old_class: ET_CLASS
			a_result: ET_RESULT
			an_identifier: ET_IDENTIFIER
			a_locals: ET_LOCAL_VARIABLE_LIST
			a_seed: INTEGER
			a_class_impl: ET_CLASS
			an_attribute: ET_FEATURE
			an_arguments: ET_FORMAL_ARGUMENT_LIST
			a_type: ET_TYPE
		do
			reset
			old_feature := current_feature
			current_feature := a_feature
			old_class := current_class
			current_class := a_class
			current_context := a_context
			a_class_impl := current_feature.implementation_class
			a_result ?= a_writable
			if a_result /= Void then
				a_type := current_feature.type
				if a_type = Void then
					set_fatal_error
					error_handler.report_veen2a_error (a_class_impl, a_result, current_feature)
				elseif a_context /= Void then
					a_context.force_first (a_type)
				end
			else
				an_identifier ?= a_writable
				if an_identifier /= Void then
					a_seed := an_identifier.seed
					if a_seed /= 0 then
						if an_identifier.is_local then
							a_locals := current_feature.locals
							if a_locals = Void then
									-- Internal error.
								set_fatal_error
								error_handler.report_giabk_error
							elseif a_seed < 1 or a_seed > a_locals.count then
									-- Internal error.
								set_fatal_error
								error_handler.report_giabl_error
							else
								a_type := resolved_formal_parameters (a_locals.local_variable (a_seed).type)
								if a_context /= Void then
									a_context.force_first (a_type)
								end
							end
						else
							an_attribute := current_class.seeded_feature (a_seed)
							if an_attribute = Void then
									-- Internal error: if we got a seed, the
									-- `an_attribute' should not be void.
								set_fatal_error
								error_handler.report_giabm_error
							elseif not an_attribute.is_attribute then
								set_fatal_error
								if current_class = a_class_impl then
									error_handler.report_vjaw0a_error (current_class, an_identifier, an_attribute)
								else
									error_handler.report_vjaw0b_error (current_class, a_class_impl, an_identifier, an_attribute)
								end
							else
								a_type := an_attribute.type
								if a_context /= Void then
									a_context.force_first (a_type)
								end
							end
						end
					else
						a_locals := current_feature.locals
						if a_locals /= Void then
							a_seed := a_locals.index_of (an_identifier)
							if a_seed /= 0 then
								an_identifier.set_seed (a_seed)
								an_identifier.set_local (True)
								a_type := resolved_formal_parameters (a_locals.local_variable (a_seed).type)
								if a_context /= Void then
									a_context.force_first (a_type)
								end
							end
						end
						if a_seed = 0 then
							a_class_impl.process (universe.interface_checker)
							if a_class_impl.has_interface_error then
								set_fatal_error
							else
								an_attribute := a_class_impl.named_feature (an_identifier)
								if an_attribute /= Void then
									if an_attribute.is_attribute then
										a_seed := an_attribute.first_seed
										an_identifier.set_seed (a_seed)
										if a_class_impl /= current_class then
												-- We need to get the feature in the
												-- context of `current_class'.
											an_attribute := current_class.seeded_feature (a_seed)
											if an_attribute = Void then
													-- Internal error: if we got a seed, the
													-- `an_attribute' should not be void.
												set_fatal_error
												error_handler.report_giabn_error
											elseif not an_attribute.is_attribute then
												set_fatal_error
												error_handler.report_vjaw0b_error (current_class, a_class_impl, an_identifier, an_attribute)
											else
												a_type := an_attribute.type
												if a_context /= Void then
													a_context.force_first (a_type)
												end
											end
										else
											a_type := an_attribute.type
											if a_context /= Void then
												a_context.force_first (a_type)
											end
										end
									else
										set_fatal_error
										error_handler.report_vjaw0a_error (a_class_impl, an_identifier, an_attribute)
									end
								else
									an_arguments := current_feature.arguments
									if an_arguments /= Void and then an_arguments.index_of (an_identifier) /= 0 then
										set_fatal_error
										error_handler.report_vjaw0c_error (a_class_impl, an_identifier, current_feature)
									else
										set_fatal_error
										error_handler.report_veen0a_error (a_class_impl, an_identifier, current_feature)
									end
								end
							end
						end
					end
				else
						-- Internal error: a Writable is either a result or an identifier.
					set_fatal_error
					error_handler.report_giabo_error
				end
			end
			current_class := old_class
			current_feature := old_feature
			current_context := Void
		end

feature {NONE} -- Expression validity

	check_bit_constant_validity (a_constant: ET_BIT_CONSTANT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `a_constant'.
		require
			a_constant_not_void: a_constant /= Void
		local
			an_integer_constant: ET_REGULAR_INTEGER_CONSTANT
			a_type: ET_BIT_N
		do
			if a_context /= Void then
				create an_integer_constant.make ((a_constant.literal.count - 1).out)
				create a_type.make (an_integer_constant)
				a_context.force_first (a_type)
			end
		end

	check_c1_character_constant_validity (a_constant: ET_C1_CHARACTER_CONSTANT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `a_constant'.
		require
			a_constant_not_void: a_constant /= Void
		do
			if a_context /= Void then
				a_context.force_first (universe.character_class)
			end
		end

	check_c2_character_constant_validity (a_constant: ET_C2_CHARACTER_CONSTANT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `a_constant'.
		require
			a_constant_not_void: a_constant /= Void
		do
			if a_context /= Void then
				a_context.force_first (universe.character_class)
			end
		end

	check_c3_character_constant_validity (a_constant: ET_C3_CHARACTER_CONSTANT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `a_constant'.
		require
			a_constant_not_void: a_constant /= Void
		do
			if a_context /= Void then
				a_context.force_first (universe.character_class)
			end
		end

	check_call_agent_validity (an_expression: ET_CALL_AGENT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		local
			a_target: ET_AGENT_TARGET
			an_arguments: ET_AGENT_ACTUAL_ARGUMENT_LIST
		do
-- TODO
			a_target := an_expression.target
			if a_target /= Void and an_expression.use_tilde then
				a_target.process (Current)
				an_expression.agent_keyword.process (Current)
			else
				an_expression.agent_keyword.process (Current)
				if a_target /= Void then
					a_target.process (Current)
				end
			end
			an_expression.qualified_name.process (Current)
			an_arguments := an_expression.arguments
			if an_arguments /= Void then
				an_arguments.process (Current)
			end

			if a_context /= Void then
				a_context.force_first (universe.none_type)
			end
		end

	check_call_expression_validity (an_expression: ET_CALL_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		do
			if an_expression.target = Void then
				check_unqualified_call_validity (an_expression.name, an_expression.arguments, a_context)
			else
				check_qualified_call_validity (an_expression.target, an_expression.name, an_expression.arguments, a_context)
			end
		end

	check_convert_expression_validity (an_expression: ET_CONVERT_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		do
			check_expression_validity (an_expression.expression, a_context, current_target_type, current_feature, current_class)
		end

	check_create_expression_validity (an_expression: ET_CREATE_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		local
			l_context: ET_NESTED_TYPE_CONTEXT
			a_class_impl: ET_CLASS
			a_class: ET_CLASS
			a_creation_type: ET_NAMED_TYPE
			a_formal_parameter_type: ET_FORMAL_PARAMETER_TYPE
			a_formal_parameter: ET_FORMAL_PARAMETER
			a_formal_parameters: ET_FORMAL_PARAMETER_LIST
			a_creator: ET_CONSTRAINT_CREATOR
			an_index: INTEGER
			a_class_type: ET_CLASS_TYPE
			a_feature: ET_FEATURE
			a_type: ET_TYPE
			a_seed: INTEGER
			a_call: ET_QUALIFIED_CALL
			a_name: ET_FEATURE_NAME
		do
			a_type := an_expression.type
			check_type_validity (a_type)
			if not has_fatal_error then
				a_class_impl := current_feature.implementation_class
				a_call := an_expression.creation_call
				if a_call /= Void then
					a_name := a_call.name
					a_seed := a_name.seed
					if a_seed = 0 then
							-- We need to resolve `a_name' in the implementation
							-- class of `current_feature' first.
						l_context := new_type_context (a_class_impl)
						l_context.force_first (a_type)
						a_class := l_context.base_class (universe)
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
				else
					a_name := tokens.default_create_feature_name
					a_seed := universe.default_create_seed
				end
			end
			if not has_fatal_error then
				if a_feature = Void then
					a_type := resolved_formal_parameters (a_type)
					if not has_fatal_error then
						if l_context /= Void then
							l_context.wipe_out
							l_context.set_root_context (current_class)
						else
							l_context := new_type_context (current_class)
						end
						l_context.force_first (a_type)
						a_class := l_context.base_class (universe)
						a_class.process (universe.interface_checker)
						if a_class.has_interface_error then
							set_fatal_error
						elseif a_seed /= 0 then
							a_feature := a_class.seeded_feature (a_seed)
							if a_feature = Void then
									-- Report internal error: if we got a seed, the
									-- `a_feature' should not be void.
								set_fatal_error
								error_handler.report_giaav_error
							end
						end
					end
				end
			end
			if not has_fatal_error then
				check
					a_class_not_void: a_class /= Void
					l_context_not_void: l_context /= Void
				end
				a_creation_type := l_context.named_type (universe)
				a_class_type ?= a_creation_type
				if a_class_type /= Void then
					check_creation_type_validity (a_class_type, an_expression)
				end
				if a_feature = Void then
					check
							-- No creation call, and feature 'default_create' not
							-- supported by the underlying Eiffel compiler.
						no_call: a_call = Void
						no_default_create: universe.default_create_seed = 0
					end
					if a_class.creators /= Void then
						set_fatal_error
						if current_class = a_class_impl then
							error_handler.report_vgcc5a_error (current_class, an_expression, a_class)
						else
							error_handler.report_vgcc5b_error (current_class, a_class_impl, an_expression, a_class)
						end
					end
				else
					if a_feature.type /= Void then
							-- This is not a procedure.
						set_fatal_error
						if current_class = a_class_impl then
							error_handler.report_vgcc6b_error (current_class, a_name, a_feature, a_class)
						else
							error_handler.report_vgcc6c_error (current_class, a_class_impl, a_name, a_feature, a_class)
						end
					end
					a_formal_parameter_type ?= a_creation_type
					if a_formal_parameter_type /= Void then
						an_index := a_formal_parameter_type.index
						a_formal_parameters := current_class.formal_parameters
						if a_formal_parameters = Void or else an_index > a_formal_parameters.count then
								-- Internal error: `a_formal_parameter' is supposed
								-- to be a formal parameter of `current_class'.
							set_fatal_error
							error_handler.report_giabh_error
						else
							a_formal_parameter := a_formal_parameters.formal_parameter (an_index)
							a_creator := a_formal_parameter.creation_procedures
							if a_creator = Void or else not a_creator.has_feature (a_feature) then
								set_fatal_error
								if current_class = a_class_impl then
									error_handler.report_vgcc8a_error (current_class, a_name, a_feature, a_class, a_formal_parameter)
								else
									error_handler.report_vgcc8b_error (current_class, a_class_impl, a_name, a_feature, a_class, a_formal_parameter)
								end
							end
						end
					elseif not a_feature.is_creation_exported_to (current_class, a_class, universe.ancestor_builder) then
						if a_class.creators /= Void or else not a_feature.has_seed (universe.default_create_seed) then
								-- The procedure is not a creation procedure exported to `current_class'.
							set_fatal_error
							if current_class = a_class_impl then
								error_handler.report_vgcc6d_error (current_class, a_name, a_feature, a_class)
							else
								error_handler.report_vgcc6e_error (current_class, a_class_impl, a_name, a_feature, a_class)
							end
						end
					end
					if a_call /= Void then
						check_arguments_validity (a_call.arguments, a_name, a_feature, l_context, a_class)
					else
						check_arguments_validity (Void, a_name, a_feature, l_context, a_class)
					end
				end
			end
			if l_context /= Void then
				recycle_type_context (l_context)
			end
			if not has_fatal_error and then a_context /= Void then
				a_context.force_first (a_type)
			end
		end

	check_current_validity (an_expression: ET_CURRENT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		do
			if a_context /= Void then
				a_context.force_first (current_class)
			end
		end

	check_current_address_validity (an_expression: ET_CURRENT_ADDRESS; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		local
			a_typed_pointer_class: ET_CLASS
			a_typed_pointer_type: ET_GENERIC_CLASS_TYPE
			an_actuals: ET_ACTUAL_PARAMETER_LIST
		do
			a_typed_pointer_class := universe.typed_pointer_class
			if a_typed_pointer_class.is_preparsed then
					-- Class TYPED_POINTER has been found in the universe.
					-- Use ISE's implementation.
				if a_context /= Void then
					create an_actuals.make_with_capacity (1)
					an_actuals.put_first (current_class)
					create a_typed_pointer_type.make (Void, a_typed_pointer_class.name, an_actuals, a_typed_pointer_class)
					a_context.force_first (a_typed_pointer_type)
				end
			elseif a_context /= Void then
				a_context.force_first (universe.pointer_class)
			end
		end

	check_equality_expression_validity (an_expression: ET_EQUALITY_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		local
			left_type: ET_TYPE
			left_context: ET_NESTED_TYPE_CONTEXT
			right_type: ET_TYPE
			right_context: ET_NESTED_TYPE_CONTEXT
			a_class_impl: ET_CLASS
			left_named_type: ET_NAMED_TYPE
			right_named_type: ET_NAMED_TYPE
			any_type: ET_CLASS_TYPE
		do
			any_type := universe.any_type
			left_context := new_type_context (current_class)
			right_context := new_type_context (current_class)
			check_expression_validity (an_expression.left, left_context, any_type, current_feature, current_class)
			if not has_fatal_error then
				check_expression_validity (an_expression.right, right_context, any_type, current_feature, current_class)
				if not has_fatal_error then
					if not universe.cat_enabled then
							-- This rule is too constraining when checking CAT-calls.
						left_type := tokens.like_current
						right_type := tokens.like_current
						if left_context.conforms_to_type (right_type, right_context, universe) then
							-- OK.
						elseif right_context.conforms_to_type (left_type, left_context, universe) then
							-- OK.
						elseif left_context.same_named_type (universe.none_type, current_class, universe) then
							-- OK.
						elseif right_context.same_named_type (universe.none_type, current_class, universe) then
							-- OK.
						elseif type_checker.convert_feature (left_context, right_context) /= Void then
							-- OK.
						elseif type_checker.convert_feature (right_context, left_context) /= Void then
							-- OK.
						else
							left_named_type := left_context.named_type (universe)
							right_named_type := right_context.named_type (universe)
							a_class_impl := current_feature.implementation_class
							set_fatal_error
							if a_class_impl = current_class then
								error_handler.report_vweq0a_error (current_class, an_expression, left_named_type, right_named_type)
							else
								error_handler.report_vweq0b_error (current_class, a_class_impl, an_expression, left_named_type, right_named_type)
							end
						end
					end
					if not has_fatal_error and then a_context /= Void then
						a_context.force_first (universe.boolean_class)
					end
				end
			else
				check_expression_validity (an_expression.right, right_context, any_type, current_feature, current_class)
				set_fatal_error
			end
			recycle_type_context (left_context)
			recycle_type_context (right_context)
		end

	check_expression_address_validity (an_expression: ET_EXPRESSION_ADDRESS; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		local
			a_typed_pointer_class: ET_CLASS
			a_typed_pointer_type: ET_GENERIC_CLASS_TYPE
			an_actuals: ET_ACTUAL_PARAMETER_LIST
			any_type: ET_CLASS_TYPE
		do
			any_type := universe.any_type
			a_typed_pointer_class := universe.typed_pointer_class
			if a_typed_pointer_class.is_preparsed then
					-- Class TYPED_POINTER has been found in the universe.
					-- Use ISE's implementation.
				check_expression_validity (an_expression.expression, a_context, any_type, current_feature, current_class)
				if not has_fatal_error and then a_context /= Void then
					if not a_context.is_empty then
						create an_actuals.make_with_capacity (1)
						an_actuals.put_first (a_context.first)
						create a_typed_pointer_type.make (Void, a_typed_pointer_class.name, an_actuals, a_typed_pointer_class)
						a_context.put (a_typed_pointer_type, 1)
					else
						create an_actuals.make_with_capacity (1)
						an_actuals.put_first (a_context.root_context)
						create a_typed_pointer_type.make (Void, a_typed_pointer_class.name, an_actuals, a_typed_pointer_class)
						a_context.force_first (a_typed_pointer_type)
					end
				end
			else
					-- Use the ETL2 implementation.
				check_expression_validity (an_expression.expression, Void, any_type, current_feature, current_class)
				if not has_fatal_error and then a_context /= Void then
					a_context.force_first (universe.pointer_class)
				end
			end
		end

	check_false_constant_validity (a_constant: ET_FALSE_CONSTANT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `a_constant'.
		require
			a_constant_not_void: a_constant /= Void
		do
			if a_context /= Void then
				a_context.force_first (universe.boolean_class)
			end
		end

	check_feature_address_validity (an_expression: ET_FEATURE_ADDRESS; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		local
			a_class_impl: ET_CLASS
			a_feature: ET_FEATURE
			a_name: ET_FEATURE_NAME
			a_seed: INTEGER
			already_checked: BOOLEAN
			an_identifier: ET_IDENTIFIER
			an_arguments: ET_FORMAL_ARGUMENT_LIST
			a_locals: ET_LOCAL_VARIABLE_LIST
			a_typed_pointer_class: ET_CLASS
			a_typed_pointer_type: ET_GENERIC_CLASS_TYPE
			an_actuals: ET_ACTUAL_PARAMETER_LIST
		do
			a_class_impl := current_feature.implementation_class
			a_name := an_expression.name
			a_seed := a_name.seed
			if a_seed = 0 then
				an_identifier ?= a_name
				if an_identifier /= Void then
					an_arguments := current_feature.arguments
					if an_arguments /= Void then
						a_seed := an_arguments.index_of (an_identifier)
						if a_seed /= 0 then
							an_identifier.set_seed (a_seed)
							an_identifier.set_argument (True)
							if a_class_impl = current_class then
									-- No need to check validity in the
									-- context of `current_class' again.
								already_checked := True
								if not has_fatal_error then
									a_typed_pointer_class := universe.typed_pointer_class
									if a_typed_pointer_class.is_preparsed then
											-- Class TYPED_POINTER has been found in the universe.
											-- Use ISE's implementation.
										if a_context /= Void then
											create an_actuals.make_with_capacity (1)
											an_actuals.put_first (an_arguments.formal_argument (a_seed).type)
											create a_typed_pointer_type.make (Void, a_typed_pointer_class.name, an_actuals, a_typed_pointer_class)
											a_context.force_first (a_typed_pointer_type)
										end
									elseif a_context /= Void then
										a_context.force_first (universe.pointer_class)
									end
								end
							end
						end
					end
					if a_seed = 0 then
						a_locals := current_feature.locals
						if a_locals /= Void then
							a_seed := a_locals.index_of (an_identifier)
							if a_seed /= 0 then
								an_identifier.set_seed (a_seed)
								an_identifier.set_local (True)
								if a_class_impl = current_class then
										-- No need to check validity in the
										-- context of `current_class' again.
									already_checked := True
									if not has_fatal_error then
										a_typed_pointer_class := universe.typed_pointer_class
										if a_typed_pointer_class.is_preparsed then
												-- Class TYPED_POINTER has been found in the universe.
												-- Use ISE's implementation.
											if a_context /= Void then
												create an_actuals.make_with_capacity (1)
												an_actuals.put_first (a_locals.local_variable (a_seed).type)
												create a_typed_pointer_type.make (Void, a_typed_pointer_class.name, an_actuals, a_typed_pointer_class)
												a_context.force_first (a_typed_pointer_type)
											end
										elseif a_context /= Void then
											a_context.force_first (universe.pointer_class)
										end
									end
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
							if a_class_impl = current_class then
									-- No need to check validity in the
									-- context of `current_class' again.
								already_checked := True
								if not has_fatal_error and then a_context /= Void then
										-- $feature_name is of type POINTER, even
										-- in ISE and its TYPED_POINTER support.
									a_context.force_first (universe.pointer_class)
								end
							end
						else
							set_fatal_error
								-- ISE Eiffel 5.4 reports this error as a VEEN,
								-- but it is in fact a VUAR-4 (ETL2 p.369).
							error_handler.report_vuar4a_error (a_class_impl, a_name)
						end
					end
				end
			end
			if not has_fatal_error and a_seed /= 0 and not already_checked then
				if a_name.is_argument then
					an_arguments := current_feature.arguments
					if an_arguments = Void then
							-- Internal error.
						set_fatal_error
						error_handler.report_giaaq_error
					elseif a_seed < 1 or a_seed > an_arguments.count then
							-- Internal error.
						set_fatal_error
						error_handler.report_giaar_error
					else
						a_typed_pointer_class := universe.typed_pointer_class
						if a_typed_pointer_class.is_preparsed then
								-- Class TYPED_POINTER has been found in the universe.
								-- Use ISE's implementation.
							if a_context /= Void then
								create an_actuals.make_with_capacity (1)
								an_actuals.put_first (an_arguments.formal_argument (a_seed).type)
								create a_typed_pointer_type.make (Void, a_typed_pointer_class.name, an_actuals, a_typed_pointer_class)
								a_context.force_first (a_typed_pointer_type)
							end
						elseif a_context /= Void then
							a_context.force_first (universe.pointer_class)
						end
					end
				elseif a_name.is_local then
					a_locals := current_feature.locals
					if a_locals = Void then
							-- Internal error.
						set_fatal_error
						error_handler.report_giaas_error
					elseif a_seed < 1 or a_seed > a_locals.count then
							-- Internal error.
						set_fatal_error
						error_handler.report_giaat_error
					else
						a_typed_pointer_class := universe.typed_pointer_class
						if a_typed_pointer_class.is_preparsed then
								-- Class TYPED_POINTER has been found in the universe.
								-- Use ISE's implementation.
							if a_context /= Void then
								create an_actuals.make_with_capacity (1)
								an_actuals.put_first (a_locals.local_variable (a_seed).type)
								create a_typed_pointer_type.make (Void, a_typed_pointer_class.name, an_actuals, a_typed_pointer_class)
								a_context.force_first (a_typed_pointer_type)
							end
						elseif a_context /= Void then
							a_context.force_first (universe.pointer_class)
						end
					end
				else
					current_class.process (universe.interface_checker)
					if current_class.has_interface_error then
						set_fatal_error
					else
						a_feature := current_class.seeded_feature (a_seed)
						if a_feature /= Void then
								-- $feature_name is of type POINTER, even
								-- in ISE and its TYPED_POINTER support.
							if a_context /= Void then
								a_context.force_first (universe.pointer_class)
							end
						else
								-- Report internal error: if we got a seed, the
								-- `a_feature' should not be void.
							set_fatal_error
							error_handler.report_giaau_error
						end
					end
				end
			end
		end

	check_hexadecimal_integer_constant_validity (a_constant: ET_HEXADECIMAL_INTEGER_CONSTANT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `a_constant'.
		require
			a_constant_not_void: a_constant /= Void
		local
			a_literal: STRING
		do
			if a_context /= Void then
				a_literal := a_constant.literal
				inspect a_literal.count
				when 4 then
						-- 0[xX][a-fA-F0-9]{2}
					a_context.force_first (universe.integer_8_class)
				when 6 then
						-- 0[xX][a-fA-F0-9]{4}
					a_context.force_first (universe.integer_16_class)
				when 10 then
						-- 0[xX][a-fA-F0-9]{8}
					a_context.force_first (universe.integer_class)
				when 18 then
						-- 0[xX][a-fA-F0-9]{16}
					a_context.force_first (universe.integer_64_class)
				else
					a_context.force_first (universe.integer_class)
				end
			end
		end

	check_infix_expression_validity (an_expression: ET_INFIX_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		local
			a_name: ET_FEATURE_NAME
			a_target: ET_EXPRESSION
			l_context: ET_NESTED_TYPE_CONTEXT
			l_target_context: ET_NESTED_TYPE_CONTEXT
			a_class_impl: ET_CLASS
			a_class: ET_CLASS
			a_feature: ET_FEATURE
			a_type: ET_TYPE
			a_seed: INTEGER
			an_actual: ET_EXPRESSION
			a_formals: ET_FORMAL_ARGUMENT_LIST
			a_formal: ET_FORMAL_ARGUMENT
			had_error: BOOLEAN
			an_infix_convert_class: ET_CLASS
			an_infix_convert_feature: ET_FEATURE
			an_actual_type, a_formal_type: ET_NAMED_TYPE
			a_like: ET_LIKE_FEATURE
			a_convert_feature: ET_CONVERT_FEATURE
			a_convert_expression: ET_CONVERT_EXPRESSION
			l_actual_context: ET_NESTED_TYPE_CONTEXT
			l_formal_context: ET_NESTED_TYPE_CONTEXT
			l_formal_type: ET_TYPE
			any_type: ET_CLASS_TYPE
		do
			any_type := universe.any_type
			a_name := an_expression.name
			a_target := an_expression.left
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
				check_expression_validity (a_target, l_target_context, any_type, current_feature, a_class_impl)
				if not has_fatal_error then
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
					check_expression_validity (a_target, l_target_context, any_type, current_feature, current_class)
					if not has_fatal_error then
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
								error_handler.report_giabd_error
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
						-- Check arguments validity.
					a_formals := a_feature.arguments
					if a_formals = Void or else a_formals.count /= 1 then
						set_fatal_error
						if current_class = a_class_impl then
							error_handler.report_vuar1a_error (current_class, a_name, a_feature, a_class)
						else
							error_handler.report_vuar1b_error (current_class, a_class_impl, a_name, a_feature, a_class)
						end
					else
						an_actual := an_expression.right
						a_formal := a_formals.formal_argument (1)
						had_error := has_fatal_error
						l_actual_context := new_type_context (current_class)
						l_formal_context := l_target_context
						l_formal_context.force_first (a_formal.type)
						l_formal_type := tokens.like_current
						check_expression_validity (an_actual, l_actual_context, l_formal_context, current_feature, current_class)
						if has_fatal_error then
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
										an_expression.set_right (a_convert_expression)
									end
								else
-- TODO: infix feature convertibility
									an_infix_convert_class := l_actual_context.base_class (universe)
									an_infix_convert_class.process (universe.interface_checker)
									if an_infix_convert_class.has_interface_error then
										had_error := True
										set_fatal_error
									else
										an_infix_convert_feature := an_infix_convert_class.named_feature (a_name)
										if an_infix_convert_feature /= Void then
											a_feature := an_infix_convert_feature
											a_class := an_infix_convert_class
											l_formal_context.remove_first
											l_target_context.copy_type_context (l_actual_context)
											l_formal_context.force_first (a_formal.type)
-- TODO
											--a_seed := a_feature.first_seed
											--a_name.set_seed (a_seed)
										else
											an_actual_type := l_actual_context.named_type (universe)
											a_formal_type := l_formal_context.named_type (universe)
											had_error := True
											set_fatal_error
											if current_class = a_class_impl then
												error_handler.report_vuar2a_error (current_class, a_name, a_feature, a_class, 1, an_actual_type, a_formal_type)
											else
												error_handler.report_vuar2b_error (current_class, a_class_impl, a_name, a_feature, a_class, 1, an_actual_type, a_formal_type)
											end
										end
									end
								end
							end
						end
						recycle_type_context (l_actual_context)
						l_formal_context.remove_first
						if had_error then
								-- The error status may have been reset
								-- while checking the arguments.
							set_fatal_error
						end
					end
						-- Check whether `a_feature' satistfies CAT validity rules.
					check_cat_validity (a_name, a_feature, l_target_context)
					a_type := a_feature.type
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
						a_like ?= a_type
						if a_like /= Void and then a_like.is_like_argument then
							if l_target_context /= a_context then
								a_context.wipe_out
								a_context.set_root_context (current_class)
								l_target_context.force_first (a_feature.arguments.formal_argument (1).type)
								expression_checker.check_expression_validity (an_expression.right, a_context, l_target_context, current_feature, current_class)
								l_target_context.remove_first
							else
								l_target_context := new_type_context (current_class)
								l_target_context.copy_type_context (a_context)
								l_target_context.force_first (a_feature.arguments.formal_argument (1).type)
								a_context.wipe_out
								a_context.set_root_context (current_class)
								expression_checker.check_expression_validity (an_expression.right, a_context, l_target_context, current_feature, current_class)
								recycle_type_context (l_target_context)
							end
						else
							a_context.force_first (a_type)
						end
					end
				end
			end
			if l_context /= Void then
				recycle_type_context (l_context)
			end
		end

	check_manifest_array_validity (an_expression: ET_MANIFEST_ARRAY; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		local
			i, nb: INTEGER
			had_error: BOOLEAN
			a_type: ET_TYPE
			hybrid_type: BOOLEAN
			an_actuals: ET_ACTUAL_PARAMETER_LIST
			array_class: ET_CLASS
			an_array_type: ET_CLASS_TYPE
			an_array_parameters: ET_ACTUAL_PARAMETER_LIST
			an_array_parameter: ET_TYPE
			a_generic_class_type: ET_GENERIC_CLASS_TYPE
			l_array_parameter_context: ET_NESTED_TYPE_CONTEXT
			l_context: ET_NESTED_TYPE_CONTEXT
		do
			array_class := universe.array_class
			an_array_type ?= current_target_type.named_type (universe)
			if an_array_type /= Void and then an_array_type.direct_base_class (universe) = array_class then
				an_array_parameters := an_array_type.actual_parameters
				if an_array_parameters /= Void and then an_array_parameters.count = 1 then
					an_array_parameter := an_array_parameters.type (1)
				end
			end
			nb := an_expression.count
			if an_array_parameter /= Void then
				l_array_parameter_context := new_type_context (current_class)
				l_array_parameter_context.force_first (an_array_parameter)
				l_context := new_type_context (current_class)
				from i := 1 until i > nb loop
					check_expression_validity (an_expression.expression (i), l_context, l_array_parameter_context, current_feature, current_class)
					if not has_fatal_error then
						if not l_context.conforms_to_type (an_array_parameter, current_class, universe) then
							if type_checker.convert_feature (l_context, l_array_parameter_context) = Void then
								an_array_type := universe.array_any_type
							end
						end
					else
						had_error := True
					end
					l_context.wipe_out
					i := i + 1
				end
				recycle_type_context (l_array_parameter_context)
				recycle_type_context (l_context)
				if had_error then
					set_fatal_error
				elseif a_context /= Void then
					a_context.force_first (an_array_type)
				end
			else
				l_array_parameter_context := new_type_context (current_class)
				l_array_parameter_context.force_first (universe.any_type)
				l_context := new_type_context (current_class)
				from i := 1 until i > nb loop
					check_expression_validity (an_expression.expression (i), l_context, l_array_parameter_context, current_feature, current_class)
					if not has_fatal_error then
						if not had_error then
							if a_type = Void then
								a_type := l_context.named_type (universe)
							elseif not l_context.same_named_type (a_type, current_class, universe) then
								hybrid_type := True
							end
						end
					else
						had_error := True
					end
					l_context.wipe_out
					i := i + 1
				end
				recycle_type_context (l_array_parameter_context)
				recycle_type_context (l_context)
				if had_error then
					set_fatal_error
				elseif a_context /= Void then
					if a_type = Void then
						a_context.force_first (universe.array_any_type)
					elseif hybrid_type then
						a_context.force_first (universe.array_any_type)
					else
						create an_actuals.make_with_capacity (1)
						an_actuals.put_first (a_type)
						create a_generic_class_type.make (Void, array_class.name, an_actuals, array_class)
						a_generic_class_type.set_cat_keyword (universe.array_any_type.cat_keyword)
						a_generic_class_type.set_unresolved_type (universe.array_any_type)
						a_context.force_first (a_generic_class_type)
					end
				end
			end
		end

	check_manifest_tuple_validity (an_expression: ET_MANIFEST_TUPLE; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		local
			i, nb, nb2: INTEGER
			had_error: BOOLEAN
			an_actuals: ET_ACTUAL_PARAMETER_LIST
			a_tuple_type: ET_TUPLE_TYPE
			a_tuple_parameters: ET_ACTUAL_PARAMETER_LIST
			l_parameter_context: ET_NESTED_TYPE_CONTEXT
			l_context: ET_NESTED_TYPE_CONTEXT
		do
			a_tuple_type ?= current_target_type.named_type (universe)
			if a_tuple_type /= Void then
				a_tuple_parameters := a_tuple_type.actual_parameters
				if a_tuple_parameters /= Void then
					nb2 := a_tuple_parameters.count
				end
			end
			l_parameter_context := new_type_context (current_class)
			l_parameter_context.force_first (universe.any_type)
			l_context := new_type_context (current_class)
			nb := an_expression.count
			create an_actuals.make_with_capacity (nb)
			from i := nb until i <= nb2 loop
				check_expression_validity (an_expression.expression (i), l_context, l_parameter_context, current_feature, current_class)
				if not has_fatal_error then
					an_actuals.put_first (l_context.named_type (universe))
				else
					had_error := True
				end
				l_context.wipe_out
				i := i - 1
			end
			from until i < 1 loop
				l_parameter_context.wipe_out
				l_parameter_context.force_first (a_tuple_parameters.type (i))
				check_expression_validity (an_expression.expression (i), l_context, l_parameter_context, current_feature, current_class)
				if not has_fatal_error then
					an_actuals.put_first (l_context.named_type (universe))
				else
					had_error := True
				end
				l_context.wipe_out
				i := i - 1
			end
			recycle_type_context (l_parameter_context)
			recycle_type_context (l_context)
			if had_error then
				set_fatal_error
			elseif a_context /= Void then
				create a_tuple_type.make (an_actuals)
				a_context.force_first (a_tuple_type)
			end
		end

	check_old_expression_validity (an_expression: ET_OLD_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		do
				-- Check VAOL-2 (ETL2 p.124).
			check_expression_validity (an_expression.expression, a_context, current_target_type, current_feature, current_class)
				-- Check VAOL-1 (ETL2 p.124).
			set_fatal_error
			error_handler.report_vaol1a_error (current_feature.implementation_class, an_expression)
		end

	check_once_manifest_string_validity (an_expression: ET_ONCE_MANIFEST_STRING; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		do
			check_expression_validity (an_expression.manifest_string, a_context, current_target_type, current_feature, current_class)
		end

	check_parenthesized_expression_validity (an_expression: ET_PARENTHESIZED_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		do
			check_expression_validity (an_expression.expression, a_context, current_target_type, current_feature, current_class)
		end

	check_precursor_expression_validity (an_expression: ET_PRECURSOR_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		do
			check_precursor_validity (an_expression, a_context)
		end

	check_prefix_expression_validity (an_expression: ET_PREFIX_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		do
			check_qualified_call_validity (an_expression.expression, an_expression.name, Void, a_context)
		end

	check_regular_integer_constant_validity (a_constant: ET_REGULAR_INTEGER_CONSTANT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `a_constant'.
		require
			a_constant_not_void: a_constant /= Void
		local
			a_class_type: ET_CLASS_TYPE
			a_class: ET_CLASS
			a_type: ET_TYPE
		do
			if a_context /= Void then
				a_type := universe.integer_class
				a_class_type ?= current_target_type.named_type (universe)
				if a_class_type /= Void then
					a_class := a_class_type.direct_base_class (universe)
					if a_class = universe.integer_8_class then
						a_type := a_class
					elseif a_class = universe.integer_16_class then
						a_type := a_class
					end
				end
				a_context.force_first (a_type)
			end
		end

	check_regular_manifest_string_validity (a_string: ET_REGULAR_MANIFEST_STRING; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `a_string'.
		require
			a_string_not_void: a_string /= Void
		do
			if a_context /= Void then
				a_context.force_first (universe.string_type)
			end
		end

	check_regular_real_constant_validity (a_constant: ET_REGULAR_REAL_CONSTANT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `a_constant'.
		require
			a_constant_not_void: a_constant /= Void
		do
			if a_context /= Void then
				a_context.force_first (universe.double_class)
			end
		end

	check_result_validity (an_expression: ET_RESULT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		local
			a_type: ET_TYPE
		do
			a_type := current_feature.type
			if a_type = Void then
				set_fatal_error
				error_handler.report_veen2a_error (current_feature.implementation_class, an_expression, current_feature)
			elseif a_context /= Void then
				a_context.force_first (a_type)
			end
		end

	check_result_address_validity (an_expression: ET_RESULT_ADDRESS; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		local
			a_type: ET_TYPE
			a_typed_pointer_class: ET_CLASS
			a_typed_pointer_type: ET_GENERIC_CLASS_TYPE
			an_actuals: ET_ACTUAL_PARAMETER_LIST
		do
			a_type := current_feature.type
			if a_type = Void then
				set_fatal_error
				error_handler.report_veen2a_error (current_feature.implementation_class, an_expression.result_keyword, current_feature)
			else
				a_typed_pointer_class := universe.typed_pointer_class
				if a_typed_pointer_class.is_preparsed then
						-- Class TYPED_POINTER has been found in the universe.
						-- Use ISE's implementation.
					if a_context /= Void then
						create an_actuals.make_with_capacity (1)
						an_actuals.put_first (a_type)
						create a_typed_pointer_type.make (Void, a_typed_pointer_class.name, an_actuals, a_typed_pointer_class)
						a_context.force_first (a_typed_pointer_type)
					end
				elseif a_context /= Void then
					a_context.force_first (universe.pointer_class)
				end
			end
		end

	check_special_manifest_string_validity (a_string: ET_SPECIAL_MANIFEST_STRING; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `a_string'.
		require
			a_string_not_void: a_string /= Void
		do
			if a_context /= Void then
				a_context.force_first (universe.string_type)
			end
		end

	check_static_call_expression_validity (an_expression: ET_STATIC_CALL_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		do
			check_static_call_validity (an_expression, a_context)
		end

	check_strip_expression_validity (an_expression: ET_STRIP_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		local
			a_class_impl: ET_CLASS
			a_name, other_name: ET_FEATURE_NAME
			a_seed: INTEGER
			i, j, nb: INTEGER
			a_feature: ET_FEATURE
			had_error: BOOLEAN
			already_checked: BOOLEAN
		do
			a_class_impl := current_feature.implementation_class
			nb := an_expression.count
			from i := 1 until i > nb loop
				a_name := an_expression.feature_name (i)
				from j := 1 until j >= i loop
					other_name := an_expression.feature_name (j)
					if a_name.same_feature_name (other_name) then
						set_fatal_error
						error_handler.report_vwst2a_error (a_class_impl, other_name, a_name)
					end
					j := j + 1
				end
				a_seed := a_name.seed
				had_error := False
				already_checked := False
				if a_seed = 0 then
					had_error := True
					a_class_impl.process (universe.interface_checker)
					if a_class_impl.has_interface_error then
						set_fatal_error
					else
						a_feature := a_class_impl.named_feature (a_name)
						if a_feature = Void then
							set_fatal_error
							error_handler.report_vwst1a_error (a_class_impl, a_name)
						else
							a_seed := a_feature.first_seed
							a_name.set_seed (a_seed)
							if not a_feature.is_attribute then
								set_fatal_error
								error_handler.report_vwst1b_error (a_class_impl, a_name, a_feature)
							else
								had_error := False
								if a_class_impl = current_class then
									already_checked := True
								end
							end
						end
					end
				end
				if not had_error and a_seed /= 0 and not already_checked then
					current_class.process (universe.interface_checker)
					if current_class.has_interface_error then
						set_fatal_error
					else
						a_feature := current_class.seeded_feature (a_seed)
						if a_feature = Void then
								-- Internal error.
							set_fatal_error
							error_handler.report_giaaw_error
						else
							if not a_feature.is_attribute then
								set_fatal_error
								error_handler.report_vwst1b_error (a_class_impl, a_name, a_feature)
							end
						end
					end
				end
				i := i + 1
			end
			if not has_fatal_error and then a_context /= Void then
				a_context.force_first (universe.array_any_type)
			end
		end

	check_true_constant_validity (a_constant: ET_TRUE_CONSTANT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `a_constant'.
		require
			a_constant_not_void: a_constant /= Void
		do
			if a_context /= Void then
				a_context.force_first (universe.boolean_class)
			end
		end

	check_underscored_integer_constant_validity (a_constant: ET_UNDERSCORED_INTEGER_CONSTANT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `a_constant'.
		require
			a_constant_not_void: a_constant /= Void
		local
			a_class_type: ET_CLASS_TYPE
			a_class: ET_CLASS
			a_type: ET_TYPE
		do
			if a_context /= Void then
				a_type := universe.integer_class
				a_class_type ?= current_target_type.named_type (universe)
				if a_class_type /= Void then
					a_class := a_class_type.direct_base_class (universe)
					if a_class = universe.integer_8_class then
						a_type := a_class
					elseif a_class = universe.integer_16_class then
						a_type := a_class
					end
				end
				a_context.force_first (a_type)
			end
		end

	check_underscored_real_constant_validity (a_constant: ET_UNDERSCORED_REAL_CONSTANT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `a_constant'.
		require
			a_constant_not_void: a_constant /= Void
		do
			if a_context /= Void then
				a_context.force_first (universe.double_class)
			end
		end

	check_verbatim_string_validity (a_string: ET_VERBATIM_STRING; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `a_string'.
		require
			a_string_not_void: a_string /= Void
		do
			if a_context /= Void then
				a_context.force_first (universe.string_type)
			end
		end

	expression_checker: ET_EXPRESSION_CHECKER is
			-- Expression validity checker
		do
			Result := Current
		ensure then
			definition: Result = Current
		end

feature {NONE} -- Type checking

	check_creation_type_validity (a_type: ET_CLASS_TYPE; a_creation: ET_CREATE_EXPRESSION) is
			-- Check validity of `a_type' as base type of a creation type
			-- in `current_class'. Note that `a_type' should already be a
			-- valid type by itself (call `check_type_validity' for that).
		require
			a_type_not_void: a_type /= Void
			a_type_named_type: a_type.is_named_type
			a_creation_not_void: a_creation /= Void
		do
			type_checker.check_creation_type_validity (a_type, current_feature, current_class, a_creation.type.position)
			if type_checker.has_fatal_error then
				set_fatal_error
			end
		end

feature {ET_AST_NODE} -- Processing

	process_bit_constant (a_constant: ET_BIT_CONSTANT) is
			-- Process `a_constant'.
		do
			if internal_call then
				internal_call := False
				check_bit_constant_validity (a_constant, current_context)
			end
		end

	process_c1_character_constant (a_constant: ET_C1_CHARACTER_CONSTANT) is
			-- Process `a_constant'.
		do
			if internal_call then
				internal_call := False
				check_c1_character_constant_validity (a_constant, current_context)
			end
		end

	process_c2_character_constant (a_constant: ET_C2_CHARACTER_CONSTANT) is
			-- Process `a_constant'.
		do
			if internal_call then
				internal_call := False
				check_c2_character_constant_validity (a_constant, current_context)
			end
		end

	process_c3_character_constant (a_constant: ET_C3_CHARACTER_CONSTANT) is
			-- Process `a_constant'.
		do
			if internal_call then
				internal_call := False
				check_c3_character_constant_validity (a_constant, current_context)
			end
		end

	process_call_agent (an_expression: ET_CALL_AGENT) is
			-- Process `an_expression'.
		do
			if internal_call then
				internal_call := False
				check_call_agent_validity (an_expression, current_context)
			end
		end

	process_call_expression (an_expression: ET_CALL_EXPRESSION) is
			-- Process `an_expression'.
		do
			if internal_call then
				internal_call := False
				check_call_expression_validity (an_expression, current_context)
			end
		end

	process_convert_expression (an_expression: ET_CONVERT_EXPRESSION) is
			-- Process `an_expression'.
		do
			if internal_call then
				internal_call := False
				check_convert_expression_validity (an_expression, current_context)
			end
		end

	process_create_expression (an_expression: ET_CREATE_EXPRESSION) is
			-- Process `an_expression'.
		do
			if internal_call then
				internal_call := False
				check_create_expression_validity (an_expression, current_context)
			end
		end

	process_current (an_expression: ET_CURRENT) is
			-- Process `an_expression'.
		do
			if internal_call then
				internal_call := False
				check_current_validity (an_expression, current_context)
			end
		end

	process_current_address (an_expression: ET_CURRENT_ADDRESS) is
			-- Process `an_expression'.
		do
			if internal_call then
				internal_call := False
				check_current_address_validity (an_expression, current_context)
			end
		end

	process_equality_expression (an_expression: ET_EQUALITY_EXPRESSION) is
			-- Process `an_expression'.
		do
			if internal_call then
				internal_call := False
				check_equality_expression_validity (an_expression, current_context)
			end
		end

	process_expression_address (an_expression: ET_EXPRESSION_ADDRESS) is
			-- Process `an_expression'.
		do
			if internal_call then
				internal_call := False
				check_expression_address_validity (an_expression, current_context)
			end
		end

	process_false_constant (a_constant: ET_FALSE_CONSTANT) is
			-- Process `a_constant'.
		do
			if internal_call then
				internal_call := False
				check_false_constant_validity (a_constant, current_context)
			end
		end

	process_feature_address (an_expression: ET_FEATURE_ADDRESS) is
			-- Process `an_expression'.
		do
			if internal_call then
				internal_call := False
				check_feature_address_validity (an_expression, current_context)
			end
		end

	process_hexadecimal_integer_constant (a_constant: ET_HEXADECIMAL_INTEGER_CONSTANT) is
			-- Process `a_constant'.
		do
			if internal_call then
				internal_call := False
				check_hexadecimal_integer_constant_validity (a_constant, current_context)
			end
		end

	process_infix_expression (an_expression: ET_INFIX_EXPRESSION) is
			-- Process `an_expression'.
		do
			if internal_call then
				internal_call := False
				check_infix_expression_validity (an_expression, current_context)
			end
		end

	process_manifest_array (an_expression: ET_MANIFEST_ARRAY) is
			-- Process `an_expression'.
		do
			if internal_call then
				internal_call := False
				check_manifest_array_validity (an_expression, current_context)
			end
		end

	process_manifest_tuple (an_expression: ET_MANIFEST_TUPLE) is
			-- Process `an_expression'.
		do
			if internal_call then
				internal_call := False
				check_manifest_tuple_validity (an_expression, current_context)
			end
		end

	process_old_expression (an_expression: ET_OLD_EXPRESSION) is
			-- Process `an_expression'.
		do
			if internal_call then
				internal_call := False
				check_old_expression_validity (an_expression, current_context)
			end
		end

	process_once_manifest_string (an_expression: ET_ONCE_MANIFEST_STRING) is
			-- Process `an_expression'.
		do
			if internal_call then
				internal_call := False
				check_once_manifest_string_validity (an_expression, current_context)
			end
		end

	process_parenthesized_expression (an_expression: ET_PARENTHESIZED_EXPRESSION) is
			-- Process `an_expression'.
		do
			if internal_call then
				internal_call := False
				check_parenthesized_expression_validity (an_expression, current_context)
			end
		end

	process_precursor_expression (an_expression: ET_PRECURSOR_EXPRESSION) is
			-- Process `an_expression'.
		do
			if internal_call then
				internal_call := False
				check_precursor_expression_validity (an_expression, current_context)
			end
		end

	process_prefix_expression (an_expression: ET_PREFIX_EXPRESSION) is
			-- Process `an_expression'.
		do
			if internal_call then
				internal_call := False
				check_prefix_expression_validity (an_expression, current_context)
			end
		end

	process_regular_integer_constant (a_constant: ET_REGULAR_INTEGER_CONSTANT) is
			-- Process `a_constant'.
		do
			if internal_call then
				internal_call := False
				check_regular_integer_constant_validity (a_constant, current_context)
			end
		end

	process_regular_manifest_string (a_string: ET_REGULAR_MANIFEST_STRING) is
			-- Process `a_string'.
		do
			if internal_call then
				internal_call := False
				check_regular_manifest_string_validity (a_string, current_context)
			end
		end

	process_regular_real_constant (a_constant: ET_REGULAR_REAL_CONSTANT) is
			-- Process `a_constant'.
		do
			if internal_call then
				internal_call := False
				check_regular_real_constant_validity (a_constant, current_context)
			end
		end

	process_result (an_expression: ET_RESULT) is
			-- Process `an_expression'.
		do
			if internal_call then
				internal_call := False
				check_result_validity (an_expression, current_context)
			end
		end

	process_result_address (an_expression: ET_RESULT_ADDRESS) is
			-- Process `an_expression'.
		do
			if internal_call then
				internal_call := False
				check_result_address_validity (an_expression, current_context)
			end
		end

	process_special_manifest_string (a_string: ET_SPECIAL_MANIFEST_STRING) is
			-- Process `a_string'.
		do
			if internal_call then
				internal_call := False
				check_special_manifest_string_validity (a_string, current_context)
			end
		end

	process_static_call_expression (an_expression: ET_STATIC_CALL_EXPRESSION) is
			-- Process `an_expression'.
		do
			if internal_call then
				internal_call := False
				check_static_call_expression_validity (an_expression, current_context)
			end
		end

	process_strip_expression (an_expression: ET_STRIP_EXPRESSION) is
			-- Process `an_expression'.
		do
			if internal_call then
				internal_call := False
				check_strip_expression_validity (an_expression, current_context)
			end
		end

	process_true_constant (a_constant: ET_TRUE_CONSTANT) is
			-- Process `a_constant'.
		do
			if internal_call then
				internal_call := False
				check_true_constant_validity (a_constant, current_context)
			end
		end

	process_underscored_integer_constant (a_constant: ET_UNDERSCORED_INTEGER_CONSTANT) is
			-- Process `a_constant'.
		do
			if internal_call then
				internal_call := False
				check_underscored_integer_constant_validity (a_constant, current_context)
			end
		end

	process_underscored_real_constant (a_constant: ET_UNDERSCORED_REAL_CONSTANT) is
			-- Process `a_constant'.
		do
			if internal_call then
				internal_call := False
				check_underscored_real_constant_validity (a_constant, current_context)
			end
		end

	process_verbatim_string (a_string: ET_VERBATIM_STRING) is
			-- Process `a_string'.
		do
			if internal_call then
				internal_call := False
				check_verbatim_string_validity (a_string, current_context)
			end
		end

feature {NONE} -- Error handling

	set_fatal_error is
			-- Report a fatal error.
		do
			has_fatal_error := True
		end

feature {NONE} -- Access

	current_context: ET_NESTED_TYPE_CONTEXT
			-- Context of expression being checked
			-- (may be Void is not supplied)

	current_target_type: ET_TYPE_CONTEXT
			-- Type of the target of expression being processed

feature {ET_CALL_CHECKER} -- Type context

	new_type_context (a_context: ET_BASE_TYPE): ET_NESTED_TYPE_CONTEXT is
			-- New nested type context
		do
			Result := context_pool
			if Result /= Void then
				context_pool := Result.next
				Result.set_next (Void)
				Result.set_root_context (a_context)
			else
				create Result.make_with_capacity (a_context, 10)
			end
		end

	recycle_type_context (a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Recycle `a_context'.
		do
			a_context.wipe_out
			a_context.set_root_context (universe.unknown_class)
			a_context.set_next (context_pool)
			context_pool := a_context
		end

feature {NONE} -- Type context

	context_pool: ET_NESTED_TYPE_CONTEXT
			-- Pool of recycled type context

feature {NONE} -- Implementation

	in_expression: BOOLEAN is True
			-- Are we processing an expression?

invariant

	current_target_type_not_void: current_target_type /= Void
	current_target_valid_context: current_target_type.is_valid_context

end
