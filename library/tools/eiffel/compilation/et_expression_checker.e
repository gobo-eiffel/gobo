indexing

	description:

		"Eiffel expression validity checkers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_EXPRESSION_CHECKER

inherit

	ET_AST_NULL_PROCESSOR
		redefine
			make,
			process_bit_constant,
			process_c1_character_constant,
			process_c2_character_constant,
			process_c3_character_constant,
			process_call_agent,
			process_call_expression,
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
			process_verbatim_string
		end

	ET_SHARED_TOKEN_CONSTANTS
		export {NONE} all end

creation

	make

feature {NONE} -- Initialization

	make (a_universe: like universe) is
			-- Create a new expression validity checker.
		do
			universe := a_universe
			current_class := a_universe.unknown_class
			current_feature := dummy_feature
			current_expression := dummy_expression
		end

feature -- Validity checking

	check_expression_validity (an_expression: ET_EXPRESSION; a_feature: ET_FEATURE; a_class: ET_CLASS) is
			-- Check validity of `an_expression' in `a_feature' of `a_class'.
			-- Set `has_fatal_error' is a fatal error occurred. Otherwise
			-- the type of `an_expression' and its type context are made
			-- available in `type' and `context'.
		require
			an_expression_not_void: an_expression /= Void
			a_feature_not_void: a_feature /= Void
			a_class_not_void: a_class /= Void
		local
			old_expression: ET_EXPRESSION
			old_feature: ET_FEATURE
			old_class: ET_CLASS
		do
			reset
			old_expression := current_expression
			current_expression := an_expression
			old_feature := current_feature
			current_feature := a_feature
			old_class := current_class
			current_class := a_class
			internal_call := True
			current_expression.process (Current)
			if internal_call then
					-- Internal error.
				internal_call := False
				set_fatal_error
				error_handler.report_giaaj_error
			end
			current_class := old_class
			current_feature := old_feature
			current_expression := old_expression
			if type = Void or context = Void then
				set_fatal_error
			end
		ensure
			type_not_void: not has_fatal_error implies type /= Void
			context_not_void: not has_fatal_error implies context /= Void
		end

feature -- Status report

	has_fatal_error: BOOLEAN
			-- Has a fatal error occurred when checking
			-- validity of last expression?

feature -- Access

	type: ET_TYPE
			-- Type of last expression checked

	context: ET_TYPE_CONTEXT
			-- Context of `type'

feature -- Setting

	reset is
			-- Reset current validity checker.
		do
			has_fatal_error := False
			type := Void
			context := Void
		ensure
			no_error: not has_fatal_error
			type_reset: type = Void
			context_reset: context = Void
		end

feature {NONE} -- Error handling

	set_fatal_error is
			-- Report a fatal error.
		do
			has_fatal_error := True
			type := Void
			context := Void
		ensure
			has_fatal_error: has_fatal_error
		end

feature {NONE} -- Access

	current_expression: ET_EXPRESSION
			-- Expression being processed

	current_feature: ET_FEATURE
			-- Feature where `current_expression' appears

	current_class: ET_CLASS
			-- Class to with `current_feature' belongs

feature {NONE} -- Expression validity

	check_bit_constant_validity (a_constant: ET_BIT_CONSTANT) is
			-- Check validity of `a_constant'.
		require
			a_constant_not_void: a_constant /= Void
		local
			an_integer_constant: ET_REGULAR_INTEGER_CONSTANT
		do
			create an_integer_constant.make ((a_constant.literal.count - 1).out)
			create {ET_BIT_N} type.make (an_integer_constant)
			context := current_class
		end

	check_c1_character_constant_validity (a_constant: ET_C1_CHARACTER_CONSTANT) is
			-- Check validity of `a_constant'.
		require
			a_constant_not_void: a_constant /= Void
		do
			type := universe.character_class
			context := current_class
		end

	check_c2_character_constant_validity (a_constant: ET_C2_CHARACTER_CONSTANT) is
			-- Check validity of `a_constant'.
		require
			a_constant_not_void: a_constant /= Void
		do
			type := universe.character_class
			context := current_class
		end

	check_c3_character_constant_validity (a_constant: ET_C3_CHARACTER_CONSTANT) is
			-- Check validity of `a_constant'.
		require
			a_constant_not_void: a_constant /= Void
		do
			type := universe.character_class
			context := current_class
		end

	check_call_agent_validity (an_expression: ET_CALL_AGENT) is
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
		end

	check_call_expression_validity (an_expression: ET_CALL_EXPRESSION) is
			-- Check validity of `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		do
			if an_expression.target = Void then
				check_unqualified_call_expression_validity (an_expression.name, an_expression.arguments)
			else
				check_qualified_call_expression_validity (an_expression.target, an_expression.name, an_expression.arguments)
			end
		end

	check_qualified_call_expression_validity (a_target: ET_EXPRESSION; a_name: ET_FEATURE_NAME; an_actuals: ET_ACTUAL_ARGUMENT_LIST) is
			-- Check validity of qualified call expression.
		require
			a_target_not_void: a_target /= Void
			a_name_not_void: a_name /= Void
		local
			a_context: ET_TYPE_CONTEXT
			a_class_impl: ET_CLASS
			a_class: ET_CLASS
			a_feature: ET_FEATURE
			a_type: ET_TYPE
			a_seed: INTEGER
			an_actual: ET_EXPRESSION
			a_formals: ET_FORMAL_ARGUMENT_LIST
			a_formal: ET_FORMAL_ARGUMENT
			already_checked: BOOLEAN
			i, nb: INTEGER
			had_error: BOOLEAN
		do
			a_class_impl := current_feature.implementation_class
			a_seed := a_name.seed
			if a_seed = 0 then
					-- We need to resolve `a_name' in the implementation
					-- class of `current_feature' first.
				check_expression_validity (a_target, current_feature, a_class_impl)
				if not has_fatal_error then
					create {ET_NESTED_TYPE_CONTEXT} a_context.make (type.shallow_base_type (context, universe), context)
					a_class := a_context.type.direct_base_class (universe)
					a_class.process (universe.interface_checker)
					if a_class.has_interface_error then
						set_fatal_error
					else
						a_feature := a_class.named_feature (a_name)
						if a_feature /= Void then
							a_seed := a_feature.first_seed
							a_name.set_seed (a_seed)
							if not a_feature.is_exported_to (a_class_impl, universe.ancestor_builder) then
									-- The feature is not exported to the class
									-- where this qualified feature call appears.
								set_fatal_error
								error_handler.report_vuex2b_error (a_class_impl, a_name, a_feature, a_class)
							end
								-- Check arguments validity.
							a_formals := a_feature.arguments
							if an_actuals = Void or else an_actuals.is_empty then
								if a_formals /= Void and then not a_formals.is_empty then
									set_fatal_error
									error_handler.report_vuar1a_error (a_class_impl, a_name, a_feature, a_class)
								end
							elseif a_formals = Void or else a_formals.count /= an_actuals.count then
								set_fatal_error
								error_handler.report_vuar1a_error (a_class_impl, a_name, a_feature, a_class)
							else
								had_error := has_fatal_error
								nb := an_actuals.count
								from i := 1 until i > nb loop
									an_actual := an_actuals.expression (i)
									check_expression_validity (an_actual, current_feature, a_class_impl)
									if has_fatal_error then
										had_error := True
									else
										a_formal := a_formals.formal_argument (i)
										if not type.conforms_to_type (a_formal.type, a_class, context, universe) then
											had_error := True
											set_fatal_error
											error_handler.report_vuar2a_error (a_class_impl, a_name, a_feature, a_class, i)
										end
									end
									i := i + 1
								end
								if had_error then
										-- The error status may have been reset
										-- while checking the arguments.
									set_fatal_error
								end
							end
							a_type := a_feature.type
							if a_type = Void then
									-- In a call expression, `a_feature' has to be a query.
								set_fatal_error
								error_handler.report_vkcn2a_error (a_class_impl, a_name, a_feature, a_class)
							end
							if a_class_impl = current_class then
									-- No need to check validity in the
									-- context of `current_class' again.
								already_checked := True
								if not has_fatal_error then
									type := a_type
									context := a_context
								end
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
			if not has_fatal_error and a_seed /= 0 and not already_checked then
				check_expression_validity (a_target, current_feature, current_class)
				if not has_fatal_error then
					create {ET_NESTED_TYPE_CONTEXT} a_context.make (type.shallow_base_type (context, universe), context)
					a_class := a_context.type.direct_base_class (universe)
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
						else
							if not a_feature.is_exported_to (current_class, universe.ancestor_builder) then
									-- The feature is not exported to `current_class'.
								set_fatal_error
								if current_class = a_class_impl then
									error_handler.report_vuex2b_error (a_class_impl, a_name, a_feature, a_class)
								else
									error_handler.report_vuex2c_error (a_class_impl, current_class, a_name, a_feature, a_class)
								end
							end
								-- Check arguments validity.
							a_formals := a_feature.arguments
							if an_actuals = Void or else an_actuals.is_empty then
								if a_formals /= Void and then not a_formals.is_empty then
									set_fatal_error
									if current_class = a_class_impl then
										error_handler.report_vuar1a_error (a_class_impl, a_name, a_feature, a_class)
									else
										error_handler.report_vuar1b_error (a_class_impl, current_class, a_name, a_feature, a_class)
									end
								end
							elseif a_formals = Void or else a_formals.count /= an_actuals.count then
								set_fatal_error
								if current_class = a_class_impl then
									error_handler.report_vuar1a_error (a_class_impl, a_name, a_feature, a_class)
								else
									error_handler.report_vuar1b_error (a_class_impl, current_class, a_name, a_feature, a_class)
								end
							else
								had_error := has_fatal_error
								nb := an_actuals.count
								from i := 1 until i > nb loop
									an_actual := an_actuals.expression (i)
									check_expression_validity (an_actual, current_feature, current_class)
									if has_fatal_error then
										had_error := True
									else
										a_formal := a_formals.formal_argument (i)
										if not type.conforms_to_type (a_formal.type, a_class, context, universe) then
											had_error := True
											set_fatal_error
											if current_class = a_class_impl then
												error_handler.report_vuar2a_error (a_class_impl, a_name, a_feature, a_class, i)
											else
												error_handler.report_vuar2b_error (a_class_impl, current_class, a_name, a_feature, a_class, i)
											end
										end
									end
									i := i + 1
								end
								if had_error then
										-- The error status may have been reset
										-- while checking the arguments.
									set_fatal_error
								end
							end
							a_type := a_feature.type
							if a_type = Void then
									-- In a call expression, `a_feature' has to be a query.
								set_fatal_error
								if current_class = a_class_impl then
									error_handler.report_vkcn2a_error (a_class_impl, a_name, a_feature, a_class)
								else
									error_handler.report_vkcn2b_error (a_class_impl, current_class, a_name, a_feature, a_class)
								end
							elseif not has_fatal_error then
								type := a_type
								context := a_context
							end
						end
					end
				end
			end
		end

	check_unqualified_call_expression_validity (a_name: ET_FEATURE_NAME; an_actuals: ET_ACTUAL_ARGUMENT_LIST) is
			-- Check validity of unqualified call expression.
		require
			a_name_not_void: a_name /= Void
		local
			a_class_impl: ET_CLASS
			a_feature: ET_FEATURE
			a_type: ET_TYPE
			a_seed: INTEGER
			an_actual: ET_EXPRESSION
			a_formals: ET_FORMAL_ARGUMENT_LIST
			a_formal: ET_FORMAL_ARGUMENT
			already_checked: BOOLEAN
			i, nb: INTEGER
			had_error: BOOLEAN
			an_identifier: ET_IDENTIFIER
			an_arguments: ET_FORMAL_ARGUMENT_LIST
			a_locals: ET_LOCAL_VARIABLE_LIST
		do
			a_class_impl := current_feature.implementation_class
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
							if an_actuals /= Void then
									-- Syntax error: a formal argument cannot have arguments.
								set_fatal_error
								error_handler.report_gvuaa0a_error (a_class_impl, an_identifier, current_feature)
							end
							if a_class_impl = current_class then
									-- No need to check validity in the
									-- context of `current_class' again.
								already_checked := True
								if not has_fatal_error then
									type := an_arguments.formal_argument (a_seed).type
									context := current_class
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
								if an_actuals /= Void then
										-- Syntax error: a local variable cannot have arguments.
									set_fatal_error
									error_handler.report_gvual0a_error (a_class_impl, an_identifier, current_feature)
								end
								if a_class_impl = current_class then
										-- No need to check validity in the
										-- context of `current_class' again.
									already_checked := True
									if not has_fatal_error then
										type := a_locals.local_variable (a_seed).type
										context := current_class
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
								-- Check arguments validity.
							a_formals := a_feature.arguments
							if an_actuals = Void or else an_actuals.is_empty then
								if a_formals /= Void and then not a_formals.is_empty then
									set_fatal_error
									error_handler.report_vuar1c_error (a_class_impl, a_name, a_feature)
								end
							elseif a_formals = Void or else a_formals.count /= an_actuals.count then
								set_fatal_error
								error_handler.report_vuar1c_error (a_class_impl, a_name, a_feature)
							else
								had_error := has_fatal_error
								nb := an_actuals.count
								from i := 1 until i > nb loop
									an_actual := an_actuals.expression (i)
									check_expression_validity (an_actual, current_feature, a_class_impl)
									if has_fatal_error then
										had_error := True
									else
										a_formal := a_formals.formal_argument (i)
										if not type.conforms_to_type (a_formal.type, a_class_impl, context, universe) then
											had_error := True
											set_fatal_error
											error_handler.report_vuar2c_error (a_class_impl, a_name, a_feature, i)
										end
									end
									i := i + 1
								end
								if had_error then
										-- The error status may have been reset
										-- while checking the arguments.
									set_fatal_error
								end
							end
							a_type := a_feature.type
							if a_type = Void then
									-- In a call expression, `a_feature' has to be a query.
								set_fatal_error
								error_handler.report_vkcn2c_error (a_class_impl, a_name, a_feature)
							end
							if a_class_impl = current_class then
									-- No need to check validity in the
									-- context of `current_class' again.
								already_checked := True
								if not has_fatal_error then
									type := a_type
									context := current_class
								end
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
				if a_name.is_argument then
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
					else
						type := an_arguments.formal_argument (a_seed).type
						context := current_class
					end
				elseif a_name.is_local then
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
					else
						type := a_locals.local_variable (a_seed).type
						context := current_class
					end
				else
					current_class.process (universe.interface_checker)
					if current_class.has_interface_error then
						set_fatal_error
					else
						a_feature := current_class.seeded_feature (a_seed)
						if a_feature = Void then
								-- Report internal error: if we got a seed, the
								-- `a_feature' should not be void.
							set_fatal_error
							error_handler.report_giaap_error
						else
								-- Check arguments validity.
							a_formals := a_feature.arguments
							if an_actuals = Void or else an_actuals.is_empty then
								if a_formals /= Void and then not a_formals.is_empty then
									set_fatal_error
									if current_class = a_class_impl then
										error_handler.report_vuar1c_error (a_class_impl, a_name, a_feature)
									else
										error_handler.report_vuar1d_error (a_class_impl, current_class, a_name, a_feature)
									end
								end
							elseif a_formals = Void or else a_formals.count /= an_actuals.count then
								set_fatal_error
								if current_class = a_class_impl then
									error_handler.report_vuar1c_error (a_class_impl, a_name, a_feature)
								else
									error_handler.report_vuar1d_error (a_class_impl, current_class, a_name, a_feature)
								end
							else
								had_error := has_fatal_error
								nb := an_actuals.count
								from i := 1 until i > nb loop
									an_actual := an_actuals.expression (i)
									check_expression_validity (an_actual, current_feature, current_class)
									if has_fatal_error then
										had_error := True
									else
										a_formal := a_formals.formal_argument (i)
										if not type.conforms_to_type (a_formal.type, current_class, context, universe) then
											had_error := True
											set_fatal_error
											if current_class = a_class_impl then
												error_handler.report_vuar2c_error (a_class_impl, a_name, a_feature, i)
											else
												error_handler.report_vuar2d_error (a_class_impl, current_class, a_name, a_feature, i)
											end
										end
									end
									i := i + 1
								end
								if had_error then
										-- The error status may have been reset
										-- while checking the arguments.
									set_fatal_error
								end
							end
							a_type := a_feature.type
							if a_type = Void then
									-- In a call expression, `a_feature' has to be a query.
								set_fatal_error
								if current_class = a_class_impl then
									error_handler.report_vkcn2c_error (a_class_impl, a_name, a_feature)
								else
									error_handler.report_vkcn2d_error (a_class_impl, current_class, a_name, a_feature)
								end
							elseif not has_fatal_error then
								type := a_type
								context := current_class
							end
						end
					end
				end
			end
		end

	check_create_expression_validity (an_expression: ET_CREATE_EXPRESSION) is
			-- Check validity of `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		local
			a_call: ET_QUALIFIED_CALL
		do
-- TODO
			an_expression.create_keyword.process (Current)
			an_expression.creation_type.process (Current)
			a_call := an_expression.creation_call
			if a_call /= Void then
				a_call.process (Current)
			end
		end

	check_current_validity (an_expression: ET_CURRENT) is
			-- Check validity of `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		do
			type := current_class
			context := current_class
		end

	check_current_address_validity (an_expression: ET_CURRENT_ADDRESS) is
			-- Check validity of `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		do
			type := universe.pointer_class
			context := current_class
		end

	check_equality_expression_validity (an_expression: ET_EQUALITY_EXPRESSION) is
			-- Check validity of `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		local
			left_type: ET_TYPE
			left_context: ET_TYPE_CONTEXT
			right_type: ET_TYPE
			right_context: ET_TYPE_CONTEXT
			a_class_impl: ET_CLASS
		do
			check_expression_validity (an_expression.left, current_feature, current_class)
			if not has_fatal_error then
				left_type := type
				left_context := context
				check_expression_validity (an_expression.right, current_feature, current_class)
				if not has_fatal_error then
					right_type := type
					right_context := context
					if
						left_type.conforms_to_type (right_type, right_context, left_context, universe) or
						right_type.conforms_to_type (left_type, left_context, right_context, universe)
					then
						type := universe.boolean_class
						context := current_class
					else
						set_fatal_error
						a_class_impl := current_feature.implementation_class
						if a_class_impl = current_class then
							error_handler.report_vweq0a_error (a_class_impl, an_expression)
						else
							error_handler.report_vweq0b_error (a_class_impl, current_class, an_expression)
						end
					end
				end
			else
				check_expression_validity (an_expression.right, current_feature, current_class)
				set_fatal_error
			end
		end

	check_expression_address_validity (an_expression: ET_EXPRESSION_ADDRESS) is
			-- Check validity of `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		do
			check_expression_validity (an_expression.expression, current_feature, current_class)
			if not has_fatal_error then
				type := universe.pointer_class
				context := current_class
			end
		end

	check_false_constant_validity (a_constant: ET_FALSE_CONSTANT) is
			-- Check validity of `a_constant'.
		require
			a_constant_not_void: a_constant /= Void
		do
			type := universe.boolean_class
			context := current_class
		end

	check_feature_address_validity (an_expression: ET_FEATURE_ADDRESS) is
			-- Check validity of `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		local
			a_class_impl: ET_CLASS
			a_feature: ET_FEATURE
			a_name: ET_FEATURE_NAME
			a_seed: INTEGER
			already_checked: BOOLEAN
			i, nb: INTEGER
			an_identifier: ET_IDENTIFIER
			an_arguments: ET_FORMAL_ARGUMENT_LIST
			a_locals: ET_LOCAL_VARIABLE_LIST
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
									type := universe.pointer_class
									context := current_class
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
										type := universe.pointer_class
										context := current_class
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
								if not has_fatal_error then
									type := universe.pointer_class
									context := current_class
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
						type := universe.pointer_class
						context := current_class
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
						type := universe.pointer_class
						context := current_class
					end
				else
					current_class.process (universe.interface_checker)
					if current_class.has_interface_error then
						set_fatal_error
					else
						a_feature := current_class.seeded_feature (a_seed)
						if a_feature = Void then
								-- Report internal error: if we got a seed, the
								-- `a_feature' should not be void.
							set_fatal_error
							error_handler.report_giaau_error
						else
							type := universe.pointer_class
							context := current_class
						end
					end
				end
			end
		end

	check_hexadecimal_integer_constant_validity (a_constant: ET_HEXADECIMAL_INTEGER_CONSTANT) is
			-- Check validity of `a_constant'.
		require
			a_constant_not_void: a_constant /= Void
		do
			type := universe.integer_class
			context := current_class
		end

	check_infix_expression_validity (an_expression: ET_INFIX_EXPRESSION) is
			-- Check validity of `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		local
			an_actuals: ET_ACTUAL_ARGUMENT_LIST
		do
			create an_actuals.make_with_capacity (1)
			an_actuals.put_first (an_expression.right)
			check_qualified_call_expression_validity (an_expression.left, an_expression.name, an_actuals)
		end

	check_manifest_array_validity (an_expression: ET_MANIFEST_ARRAY) is
			-- Check validity of `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		local
			i, nb: INTEGER
		do
-- TODO
			an_expression.left_symbol.process (Current)
			nb := an_expression.count
			from i := 1 until i > nb loop
				an_expression.item (i).process (Current)
				i := i + 1
			end
			an_expression.right_symbol.process (Current)
		end

	check_manifest_tuple_validity (an_expression: ET_MANIFEST_TUPLE) is
			-- Check validity of `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		local
			i, nb: INTEGER
		do
-- TODO
			an_expression.left_symbol.process (Current)
			nb := an_expression.count
			from i := 1 until i > nb loop
				an_expression.item (i).process (Current)
				i := i + 1
			end
			an_expression.right_symbol.process (Current)
		end

	check_old_expression_validity (an_expression: ET_OLD_EXPRESSION) is
			-- Check validity of `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		do
				-- Check VAOL-2 (ETL2 p.124).
			check_expression_validity (an_expression.expression, current_feature, current_class)
				-- Check VAOL-1 (ETL2 p.124).
			set_fatal_error
			error_handler.report_vaol1a_error (current_feature.implementation_class, an_expression)
		end

	check_once_manifest_string_validity (an_expression: ET_ONCE_MANIFEST_STRING) is
			-- Check validity of `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		do
			check_expression_validity (an_expression.manifest_string, current_feature, current_class)
		end

	check_parenthesized_expression_validity (an_expression: ET_PARENTHESIZED_EXPRESSION) is
			-- Check validity of `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		do
			check_expression_validity (an_expression.expression, current_feature, current_class)
		end

	check_precursor_expression_validity (an_expression: ET_PRECURSOR_EXPRESSION) is
			-- Check validity of `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		local
			a_parent: ET_PRECURSOR_CLASS_NAME
			an_arguments: ET_ACTUAL_ARGUMENT_LIST
		do
-- TODO
			if not an_expression.is_parent_prefixed then
				an_expression.precursor_keyword.process (Current)
			end
			a_parent := an_expression.parent
			if a_parent /= Void then
				a_parent.process (Current)
			end
			if an_expression.is_parent_prefixed then
				an_expression.precursor_keyword.process (Current)
			end
			an_arguments := an_expression.arguments
			if an_arguments /= Void then
				an_arguments.process (Current)
			end
		end

	check_prefix_expression_validity (an_expression: ET_PREFIX_EXPRESSION) is
			-- Check validity of `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		do
			check_qualified_call_expression_validity (an_expression.expression, an_expression.name, Void)
		end

	check_regular_integer_constant_validity (a_constant: ET_REGULAR_INTEGER_CONSTANT) is
			-- Check validity of `a_constant'.
		require
			a_constant_not_void: a_constant /= Void
		do
			type := universe.integer_class
			context := current_class
		end

	check_regular_manifest_string_validity (a_string: ET_REGULAR_MANIFEST_STRING) is
			-- Check validity of `a_string'.
		require
			a_string_not_void: a_string /= Void
		do
			type := universe.string_class
			context := current_class
		end

	check_regular_real_constant_validity (a_constant: ET_REGULAR_REAL_CONSTANT) is
			-- Check validity of `a_constant'.
		require
			a_constant_not_void: a_constant /= Void
		do
			type := universe.real_class
			context := current_class
		end

	check_result_validity (an_expression: ET_RESULT) is
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
			else
				type := a_type
				context := current_class
			end
		end

	check_result_address_validity (an_expression: ET_RESULT_ADDRESS) is
			-- Check validity of `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		local
			a_type: ET_TYPE
		do
			a_type := current_feature.type
			if a_type = Void then
				set_fatal_error
				error_handler.report_veen2a_error (current_feature.implementation_class, an_expression.result_keyword, current_feature)
			else
				type := universe.pointer_class
				context := current_class
			end
		end

	check_special_manifest_string_validity (a_string: ET_SPECIAL_MANIFEST_STRING) is
			-- Check validity of `a_string'.
		require
			a_string_not_void: a_string /= Void
		do
			type := universe.string_class
			context := current_class
		end

	check_static_call_expression_validity (an_expression: ET_STATIC_CALL_EXPRESSION) is
			-- Check validity of `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		local
			an_arguments: ET_ACTUAL_ARGUMENT_LIST
		do
-- TODO
			an_expression.feature_keyword.process (Current)
			an_expression.static_type.process (Current)
			an_expression.qualified_name.process (Current)
			an_arguments := an_expression.arguments
			if an_arguments /= Void then
				an_arguments.process (Current)
			end
		end

	check_strip_expression_validity (an_expression: ET_STRIP_EXPRESSION) is
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
						-- error_handler.report_vwst2a_error ()
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
							-- error_handler.report_vwst1a_error ()
						else
							a_seed := a_feature.first_seed
							a_name.set_seed (a_seed)
							if not a_feature.is_attribute then
								set_fatal_error
								-- error_handler.report_vwst1a_error ()
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
							-- TODO
						else
							if not a_feature.is_attribute then
								set_fatal_error
								-- error_handler.report_vwst1a_error ()
							end
						end
					end
				end
				i := i + 1
			end
			if not has_fatal_error then
				type := universe.array_any_type
				context := current_class
			end
		end

	check_true_constant_validity (a_constant: ET_TRUE_CONSTANT) is
			-- Check validity of `a_constant'.
		require
			a_constant_not_void: a_constant /= Void
		do
			type := universe.boolean_class
			context := current_class
		end

	check_underscored_integer_constant_validity (a_constant: ET_UNDERSCORED_INTEGER_CONSTANT) is
			-- Check validity of `a_constant'.
		require
			a_constant_not_void: a_constant /= Void
		do
			type := universe.integer_class
			context := current_class
		end

	check_underscored_real_constant_validity (a_constant: ET_UNDERSCORED_REAL_CONSTANT) is
			-- Check validity of `a_constant'.
		require
			a_constant_not_void: a_constant /= Void
		do
			type := universe.real_class
			context := current_class
		end

	check_verbatim_string_validity (a_string: ET_VERBATIM_STRING) is
			-- Check validity of `a_string'.
		require
			a_string_not_void: a_string /= Void
		do
			type := universe.string_class
			context := current_class
		end

feature {ET_AST_NODE} -- Processing

	process_bit_constant (a_constant: ET_BIT_CONSTANT) is
			-- Process `a_constant'.
		do
			if internal_call then
				internal_call := False
				check_bit_constant_validity (a_constant)
			end
		end

	process_c1_character_constant (a_constant: ET_C1_CHARACTER_CONSTANT) is
			-- Process `a_constant'.
		do
			if internal_call then
				internal_call := False
				check_c1_character_constant_validity (a_constant)
			end
		end

	process_c2_character_constant (a_constant: ET_C2_CHARACTER_CONSTANT) is
			-- Process `a_constant'.
		do
			if internal_call then
				internal_call := False
				check_c2_character_constant_validity (a_constant)
			end
		end

	process_c3_character_constant (a_constant: ET_C3_CHARACTER_CONSTANT) is
			-- Process `a_constant'.
		do
			if internal_call then
				internal_call := False
				check_c3_character_constant_validity (a_constant)
			end
		end

	process_call_agent (an_expression: ET_CALL_AGENT) is
			-- Process `an_expression'.
		do
			if internal_call then
				internal_call := False
				check_call_agent_validity (an_expression)
			end
		end

	process_call_expression (an_expression: ET_CALL_EXPRESSION) is
			-- Process `an_expression'.
		do
			if internal_call then
				internal_call := False
				check_call_expression_validity (an_expression)
			end
		end

	process_create_expression (an_expression: ET_CREATE_EXPRESSION) is
			-- Process `an_expression'.
		do
			if internal_call then
				internal_call := False
				check_create_expression_validity (an_expression)
			end
		end

	process_current (an_expression: ET_CURRENT) is
			-- Process `an_expression'.
		do
			if internal_call then
				internal_call := False
				check_current_validity (an_expression)
			end
		end

	process_current_address (an_expression: ET_CURRENT_ADDRESS) is
			-- Process `an_expression'.
		do
			if internal_call then
				internal_call := False
				check_current_address_validity (an_expression)
			end
		end

	process_equality_expression (an_expression: ET_EQUALITY_EXPRESSION) is
			-- Process `an_expression'.
		do
			if internal_call then
				internal_call := False
				check_equality_expression_validity (an_expression)
			end
		end

	process_expression_address (an_expression: ET_EXPRESSION_ADDRESS) is
			-- Process `an_expression'.
		do
			if internal_call then
				internal_call := False
				check_expression_address_validity (an_expression)
			end
		end

	process_false_constant (a_constant: ET_FALSE_CONSTANT) is
			-- Process `a_constant'.
		do
			if internal_call then
				internal_call := False
				check_false_constant_validity (a_constant)
			end
		end

	process_feature_address (an_expression: ET_FEATURE_ADDRESS) is
			-- Process `an_expression'.
		do
			if internal_call then
				internal_call := False
				check_feature_address_validity (an_expression)
			end
		end

	process_hexadecimal_integer_constant (a_constant: ET_HEXADECIMAL_INTEGER_CONSTANT) is
			-- Process `a_constant'.
		do
			if internal_call then
				internal_call := False
				check_hexadecimal_integer_constant_validity (a_constant)
			end
		end

	process_infix_expression (an_expression: ET_INFIX_EXPRESSION) is
			-- Process `an_expression'.
		do
			if internal_call then
				internal_call := False
				check_infix_expression_validity (an_expression)
			end
		end

	process_manifest_array (an_expression: ET_MANIFEST_ARRAY) is
			-- Process `an_expression'.
		do
			if internal_call then
				internal_call := False
				check_manifest_array_validity (an_expression)
			end
		end

	process_manifest_tuple (an_expression: ET_MANIFEST_TUPLE) is
			-- Process `an_expression'.
		do
			if internal_call then
				internal_call := False
				check_manifest_tuple_validity (an_expression)
			end
		end

	process_old_expression (an_expression: ET_OLD_EXPRESSION) is
			-- Process `an_expression'.
		do
			if internal_call then
				internal_call := False
				check_old_expression_validity (an_expression)
			end
		end

	process_once_manifest_string (an_expression: ET_ONCE_MANIFEST_STRING) is
			-- Process `an_expression'.
		do
			if internal_call then
				internal_call := False
				check_once_manifest_string_validity (an_expression)
			end
		end

	process_parenthesized_expression (an_expression: ET_PARENTHESIZED_EXPRESSION) is
			-- Process `an_expression'.
		do
			if internal_call then
				internal_call := False
				check_parenthesized_expression_validity (an_expression)
			end
		end

	process_precursor_expression (an_expression: ET_PRECURSOR_EXPRESSION) is
			-- Process `an_expression'.
		do
			if internal_call then
				internal_call := False
				check_precursor_expression_validity (an_expression)
			end
		end

	process_prefix_expression (an_expression: ET_PREFIX_EXPRESSION) is
			-- Process `an_expression'.
		do
			if internal_call then
				internal_call := False
				check_prefix_expression_validity (an_expression)
			end
		end

	process_regular_integer_constant (a_constant: ET_REGULAR_INTEGER_CONSTANT) is
			-- Process `a_constant'.
		do
			if internal_call then
				internal_call := False
				check_regular_integer_constant_validity (a_constant)
			end
		end

	process_regular_manifest_string (a_string: ET_REGULAR_MANIFEST_STRING) is
			-- Process `a_string'.
		do
			if internal_call then
				internal_call := False
				check_regular_manifest_string_validity (a_string)
			end
		end

	process_regular_real_constant (a_constant: ET_REGULAR_REAL_CONSTANT) is
			-- Process `a_constant'.
		do
			if internal_call then
				internal_call := False
				check_regular_real_constant_validity (a_constant)
			end
		end

	process_result (an_expression: ET_RESULT) is
			-- Process `an_expression'.
		do
			if internal_call then
				internal_call := False
				check_result_validity (an_expression)
			end
		end

	process_result_address (an_expression: ET_RESULT_ADDRESS) is
			-- Process `an_expression'.
		do
			if internal_call then
				internal_call := False
				check_result_address_validity (an_expression)
			end
		end

	process_special_manifest_string (a_string: ET_SPECIAL_MANIFEST_STRING) is
			-- Process `a_string'.
		do
			if internal_call then
				internal_call := False
				check_special_manifest_string_validity (a_string)
			end
		end

	process_static_call_expression (an_expression: ET_STATIC_CALL_EXPRESSION) is
			-- Process `an_expression'.
		do
			if internal_call then
				internal_call := False
				check_static_call_expression_validity (an_expression)
			end
		end

	process_strip_expression (an_expression: ET_STRIP_EXPRESSION) is
			-- Process `an_expression'.
		do
			if internal_call then
				internal_call := False
				check_strip_expression_validity (an_expression)
			end
		end

	process_true_constant (a_constant: ET_TRUE_CONSTANT) is
			-- Process `a_constant'.
		do
			if internal_call then
				internal_call := False
				check_true_constant_validity (a_constant)
			end
		end

	process_underscored_integer_constant (a_constant: ET_UNDERSCORED_INTEGER_CONSTANT) is
			-- Process `a_constant'.
		do
			if internal_call then
				internal_call := False
				check_underscored_integer_constant_validity (a_constant)
			end
		end

	process_underscored_real_constant (a_constant: ET_UNDERSCORED_REAL_CONSTANT) is
			-- Process `a_constant'.
		do
			if internal_call then
				internal_call := False
				check_underscored_real_constant_validity (a_constant)
			end
		end

	process_verbatim_string (a_string: ET_VERBATIM_STRING) is
			-- Process `a_string'.
		do
			if internal_call then
				internal_call := False
				check_verbatim_string_validity (a_string)
			end
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

	dummy_expression: ET_EXPRESSION is
			-- Dummy expression
		once
			Result := tokens.current_keyword
		ensure
			dummy_expression_not_void: Result /= Void
		end

invariant

	current_expression_not_void: current_expression /= Void
	current_feature_not_void: current_feature /= Void
	current_class_not_void: current_class /= Void

end
