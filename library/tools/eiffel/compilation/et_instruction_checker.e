indexing

	description:

		"Eiffel instruction validity checkers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_INSTRUCTION_CHECKER

inherit

	ET_AST_NULL_PROCESSOR
		redefine
			make,
			process_assignment,
			process_assignment_attempt,
			process_bang_instruction,
			process_call_instruction,
			process_check_instruction,
			process_create_instruction,
			process_debug_instruction,
			process_if_instruction,
			process_inspect_instruction,
			process_loop_instruction,
			process_precursor_instruction,
			process_retry_instruction,
			process_static_call_instruction
		end

	ET_SHARED_TOKEN_CONSTANTS
		export {NONE} all end

creation

	make

feature {NONE} -- Initialization

	make (a_universe: like universe) is
			-- Create a new instruction validity checker.
		do
			universe := a_universe
			current_class := a_universe.unknown_class
			current_feature := dummy_feature
			current_instruction := dummy_instruction
			create expression_checker.make (a_universe)
			create type_checker.make (a_universe)
		end

feature -- Validity checking

	check_instructions_validity (a_compound: ET_COMPOUND; a_feature: ET_FEATURE; a_class: ET_CLASS) is
			-- Check validity of `a_coumpound' in `a_feature' of `a_class'.
		require
			a_compound_not_void: a_compound /= Void
			a_feature_not_void: a_feature /= Void
			a_class_not_void: a_class /= Void
		local
			old_instruction: ET_INSTRUCTION
			old_feature: ET_FEATURE
			old_class: ET_CLASS
			i, nb: INTEGER
			had_error: BOOLEAN
		do
			has_fatal_error := False
			old_instruction := current_instruction
			old_feature := current_feature
			current_feature := a_feature
			old_class := current_class
			current_class := a_class
			nb := a_compound.count
			from i := 1 until i > nb loop
				internal_call := True
				current_instruction := a_compound.item (i)
				current_instruction.process (Current)
				if internal_call then
					-- Internal error.
					internal_call := False
					set_fatal_error
					error_handler.report_giaaz_error
				end
				if has_fatal_error then
					had_error := True
				end
				i := i + 1
			end
			if had_error then
				set_fatal_error
			end
			current_class := old_class
			current_feature := old_feature
			current_instruction := old_instruction
		end

feature -- Status report

	has_fatal_error: BOOLEAN
			-- Has a fatal error occurred when checking
			-- validity of last instructions?

feature {NONE} -- Error handling

	set_fatal_error is
			-- Report a fatal error.
		do
			has_fatal_error := True
		ensure
			has_fatal_error: has_fatal_error
		end

feature {NONE} -- Access

	current_instruction: ET_INSTRUCTION
			-- Instruction being processed

	current_feature: ET_FEATURE
			-- Feature to which `current_instruction' belongs

	current_class: ET_CLASS
			-- Class to with `current_feature' belongs

feature {NONE} -- Instruction validity

	check_assignment_validity (an_instruction: ET_ASSIGNMENT) is
			-- Check validity of `an_instruction'.
		require
			an_instruction_not_void: an_instruction /= Void
		local
			a_target: ET_WRITABLE
			a_result: ET_RESULT
			an_identifier: ET_IDENTIFIER
			a_target_type: ET_TYPE
			a_source: ET_EXPRESSION
		do
-- TODO
			a_target := an_instruction.target
			a_result ?= a_target
			if a_result /= Void then
				a_target_type := current_feature.type
				if a_target_type = Void then
				end
			else
				an_identifier ?= a_target
				if an_identifier /= Void then
				end
			end
			a_source := an_instruction.source
			expression_checker.check_expression_validity (a_source, current_feature, current_class)
			if expression_checker.has_fatal_error then
				set_fatal_error
			else
			end
		end

	check_assignment_attempt_validity (an_instruction: ET_ASSIGNMENT_ATTEMPT) is
			-- Check validity of `an_instruction'.
		require
			an_instruction_not_void: an_instruction /= Void
		local
			a_source: ET_EXPRESSION
		do
-- TODO
			a_source := an_instruction.source
			expression_checker.check_expression_validity (a_source, current_feature, current_class)
			if expression_checker.has_fatal_error then
				set_fatal_error
			else
			end
		end

	check_bang_instruction_validity (an_instruction: ET_BANG_INSTRUCTION) is
			-- Check validity of `an_instruction'.
		require
			an_instruction_not_void: an_instruction /= Void
		local
			a_type: ET_TYPE
			a_call: ET_QUALIFIED_CALL
		do
-- TODO
-- TODO
			a_type := an_instruction.type
			if a_type /= Void then
				a_type.process (Current)
			end
			an_instruction.target.process (Current)
			a_call := an_instruction.creation_call
			if a_call /= Void then
				a_call.process (Current)
			end
		end

	check_call_instruction_validity (an_instruction: ET_CALL_INSTRUCTION) is
			-- Check validity of `an_instruction'.
		require
			an_instruction_not_void: an_instruction /= Void
		do
			if an_instruction.target = Void then
				check_unqualified_call_instruction_validity (an_instruction.name, an_instruction.arguments)
			else
				check_qualified_call_instruction_validity (an_instruction.target, an_instruction.name, an_instruction.arguments)
			end
		end

	check_qualified_call_instruction_validity (a_target: ET_EXPRESSION; a_name: ET_FEATURE_NAME; an_actuals: ET_ACTUAL_ARGUMENT_LIST) is
			-- Check validity of qualified call instruction.
		require
			a_target_not_void: a_target /= Void
			a_name_not_void: a_name /= Void
		local
			a_context: ET_NESTED_TYPE_CONTEXT
			a_base_type: ET_BASE_TYPE
			a_class_impl: ET_CLASS
			a_class: ET_CLASS
			a_feature: ET_FEATURE
			a_type: ET_TYPE
			a_seed: INTEGER
			an_actual: ET_EXPRESSION
			a_formals: ET_FORMAL_ARGUMENT_LIST
			a_formal: ET_FORMAL_ARGUMENT
			i, nb: INTEGER
			an_actual_type: ET_TYPE
			an_actual_context: ET_TYPE_CONTEXT
			a_formal_type: ET_TYPE
			an_actual_named_type: ET_NAMED_TYPE
			a_formal_named_type: ET_NAMED_TYPE
		do
			a_class_impl := current_feature.implementation_class
			a_seed := a_name.seed
			if a_seed = 0 then
					-- We need to resolve `a_name' in the implementation
					-- class of `current_feature' first.
				expression_checker.check_expression_validity (a_target, current_feature, a_class_impl)
				if not expression_checker.has_fatal_error then
					a_base_type := expression_checker.type.base_type (expression_checker.context, universe)
					create a_context.make (a_base_type, a_class_impl)
					a_class := a_base_type.direct_base_class (universe)
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
					expression_checker.check_expression_validity (a_target, current_feature, current_class)
					if not expression_checker.has_fatal_error then
						a_base_type := expression_checker.type.base_type (expression_checker.context, universe)
						create a_context.make (a_base_type, current_class)
						a_class := a_base_type.direct_base_class (universe)
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
						a_context_not_void: a_context /= Void
					end
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
						nb := an_actuals.count
						from i := 1 until i > nb loop
							an_actual := an_actuals.expression (i)
							expression_checker.check_expression_validity (an_actual, current_feature, current_class)
							if expression_checker.has_fatal_error then
								set_fatal_error
							else
								an_actual_type := expression_checker.type
								an_actual_context := expression_checker.context
								a_formal := a_formals.formal_argument (i)
								if not an_actual_type.conforms_to_type (a_formal.type, a_context, an_actual_context, universe) then
									if not an_actual_type.convertible_to_type (a_formal.type, a_context, an_actual_context, universe) then
										an_actual_named_type := an_actual_type.named_type (an_actual_context, universe)
										a_formal_named_type := a_formal.type.named_type (a_context, universe)
										set_fatal_error
										if current_class = a_class_impl then
											error_handler.report_vuar2a_error (a_class_impl, a_name, a_feature, a_class, i, an_actual_named_type, a_formal_named_type)
										else
											error_handler.report_vuar2b_error (a_class_impl, current_class, a_name, a_feature, a_class, i, an_actual_named_type, a_formal_named_type)
										end
									end
								end
							end
							i := i + 1
						end
					end
					a_type := a_feature.type
					if a_type /= Void then
							-- In a call instruction, `a_feature' has to be a procedure.
						set_fatal_error
						if current_class = a_class_impl then
							error_handler.report_vkcn1a_error (a_class_impl, a_name, a_feature, a_class)
						else
							error_handler.report_vkcn1b_error (a_class_impl, current_class, a_name, a_feature, a_class)
						end
					end
				end
			end
		end

	check_unqualified_call_instruction_validity (a_name: ET_FEATURE_NAME; an_actuals: ET_ACTUAL_ARGUMENT_LIST) is
			-- Check validity of unqualified call instruction.
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
			an_identifier: ET_IDENTIFIER
			an_arguments: ET_FORMAL_ARGUMENT_LIST
			a_locals: ET_LOCAL_VARIABLE_LIST
			an_actual_type: ET_TYPE
			an_actual_context: ET_TYPE_CONTEXT
			a_formal_type: ET_TYPE
			an_actual_named_type: ET_NAMED_TYPE
			a_formal_named_type: ET_NAMED_TYPE
		do
			a_class_impl := current_feature.implementation_class
			a_seed := a_name.seed
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
										-- Syntax error: a formal argument cannot be an instruction.
									set_fatal_error
									--error_handler.report_gvuaa0a_error (a_class_impl, an_identifier, current_feature)
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
											-- Syntax error: a local variable cannot be an instruction.
										set_fatal_error
										--error_handler.report_gvual0a_error (a_class_impl, an_identifier, current_feature)
									end
								end
							end
						end
						if a_seed = 0 then
							set_fatal_error
								-- ISE Eiffel 5.4 reports this error as a VEEN,
								-- but it is in fact a VUEX-1 (ETL2 p.368).
							error_handler.report_vuex1a_error (a_class_impl, a_name)
						end
					end
				end
			end
			if not has_fatal_error and a_seed /= 0 then
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
						nb := an_actuals.count
						from i := 1 until i > nb loop
							an_actual := an_actuals.expression (i)
							expression_checker.check_expression_validity (an_actual, current_feature, current_class)
							if expression_checker.has_fatal_error then
								set_fatal_error
							else
								an_actual_type := expression_checker.type
								an_actual_context := expression_checker.context
								a_formal := a_formals.formal_argument (i)
								if not an_actual_type.conforms_to_type (a_formal.type, current_class, an_actual_context, universe) then
									if not an_actual_type.convertible_to_type (a_formal.type, current_class, an_actual_context, universe) then
										an_actual_named_type := an_actual_type.named_type (an_actual_context, universe)
										a_formal_named_type := a_formal.type.named_type (current_class, universe)
										set_fatal_error
										if current_class = a_class_impl then
											error_handler.report_vuar2c_error (a_class_impl, a_name, a_feature, i, an_actual_named_type, a_formal_named_type)
										else
											error_handler.report_vuar2d_error (a_class_impl, current_class, a_name, a_feature, i, an_actual_named_type, a_formal_named_type)
										end
									end
								end
							end
							i := i + 1
						end
					end
					a_type := a_feature.type
					if a_type /= Void then
							-- In a call instruction, `a_feature' has to be a procedure.
						set_fatal_error
						if current_class = a_class_impl then
							error_handler.report_vkcn1c_error (a_class_impl, a_name, a_feature)
						else
							error_handler.report_vkcn1d_error (a_class_impl, current_class, a_name, a_feature)
						end
					end
				end
			end
		end

	check_check_instruction_validity (an_instruction: ET_CHECK_INSTRUCTION) is
			-- Check validity of `an_instruction'.
		require
			an_instruction_not_void: an_instruction /= Void
		local
			i, nb: INTEGER
		do
-- TODO
-- TODO
			nb := an_instruction.count
			from i := 1 until i > nb loop
				an_instruction.item (i).process (Current)
				i := i + 1
			end
		end

	check_create_instruction_validity (an_instruction: ET_CREATE_INSTRUCTION) is
			-- Check validity of `an_instruction'.
		require
			an_instruction_not_void: an_instruction /= Void
		local
			a_type: ET_TARGET_TYPE
			a_call: ET_QUALIFIED_CALL
		do
-- TODO
-- TODO
			a_type := an_instruction.creation_type
			if a_type /= Void then
				a_type.process (Current)
			end
			an_instruction.target.process (Current)
			a_call := an_instruction.creation_call
			if a_call /= Void then
				a_call.process (Current)
			end
		end

	check_debug_instruction_validity (an_instruction: ET_DEBUG_INSTRUCTION) is
			-- Check validity of `an_instruction'.
		require
			an_instruction_not_void: an_instruction /= Void
		local
			a_compound: ET_COMPOUND
		do
			a_compound := an_instruction.compound
			if a_compound /= Void then
				check_instructions_validity (a_compound, current_feature, current_class)
			end
		end

	check_if_instruction_validity (an_instruction: ET_IF_INSTRUCTION) is
			-- Check validity of `an_instruction'.
		require
			an_instruction_not_void: an_instruction /= Void
		local
			a_conditional: ET_EXPRESSION
			a_compound: ET_COMPOUND
			an_elseif_parts: ET_ELSEIF_PART_LIST
			an_elseif: ET_ELSEIF_PART
			i, nb: INTEGER
			had_error: BOOLEAN
		do
			a_conditional := an_instruction.conditional.expression
			expression_checker.check_expression_validity (a_conditional, current_feature, current_class)
			if expression_checker.has_fatal_error then
				had_error := True
			else
-- TODO: check that it is a boolean expression
			end
			a_compound := an_instruction.then_compound
			if a_compound /= Void then
				check_instructions_validity (a_compound, current_feature, current_class)
				if has_fatal_error then
					had_error := True
				end
			end
			an_elseif_parts := an_instruction.elseif_parts
			if an_elseif_parts /= Void then
				nb := an_elseif_parts.count
				from i := 1 until i > nb loop
					an_elseif := an_elseif_parts.item (i)
					a_conditional := an_elseif.conditional.expression
					expression_checker.check_expression_validity (a_conditional, current_feature, current_class)
					if expression_checker.has_fatal_error then
						had_error := True
					else
-- TODO: check that it is a boolean expression
					end
					a_compound := an_elseif.then_compound
					if a_compound /= Void then
						check_instructions_validity (a_compound, current_feature, current_class)
						if has_fatal_error then
							had_error := True
						end
					end
					i := i + 1
				end
			end
			a_compound := an_instruction.else_compound
			if a_compound /= Void then
				check_instructions_validity (a_compound, current_feature, current_class)
				if has_fatal_error then
					had_error := True
				end
			end
			if had_error then
				set_fatal_error
			end
		end

	check_inspect_instruction_validity (an_instruction: ET_INSPECT_INSTRUCTION) is
			-- Check validity of `an_instruction'.
		require
			an_instruction_not_void: an_instruction /= Void
		local
			a_conditional: ET_EXPRESSION
			a_when_parts: ET_WHEN_PART_LIST
			a_when_part: ET_WHEN_PART
			a_compound: ET_COMPOUND
			i, nb: INTEGER
			had_error: BOOLEAN
		do
			a_conditional := an_instruction.conditional.expression
			expression_checker.check_expression_validity (a_conditional, current_feature, current_class)
			if expression_checker.has_fatal_error then
				had_error := True
			else
-- TODO: check that it is an integer or character expression
			end
			a_when_parts := an_instruction.when_parts
			if a_when_parts /= Void then
				nb := a_when_parts.count
				from i := 1 until i > nb loop
					a_when_part := a_when_parts.item (i)
-- TODO: check choices.
					a_compound := a_when_part.then_compound
					if a_compound /= Void then
						check_instructions_validity (a_compound, current_feature, current_class)
						if has_fatal_error then
							had_error := True
						end
					end
					i := i + 1
				end
			end
			a_compound := an_instruction.else_compound
			if a_compound /= Void then
				check_instructions_validity (a_compound, current_feature, current_class)
				if has_fatal_error then
					had_error := True
				end
			end
			if had_error then
				set_fatal_error
			end
		end

	check_loop_instruction_validity (an_instruction: ET_LOOP_INSTRUCTION) is
			-- Check validity of `an_instruction'.
		require
			an_instruction_not_void: an_instruction /= Void
		local
			a_conditional: ET_EXPRESSION
			a_compound: ET_COMPOUND
			an_invariant_part: ET_INVARIANTS
			a_variant_part: ET_VARIANT
			had_error: BOOLEAN
		do
			a_compound := an_instruction.from_compound
			if a_compound /= Void then
				check_instructions_validity (a_compound, current_feature, current_class)
				if has_fatal_error then
					had_error := True
				end
			end
-- TODO: check invariant and variant
			a_conditional := an_instruction.until_conditional.expression
			expression_checker.check_expression_validity (a_conditional, current_feature, current_class)
			if expression_checker.has_fatal_error then
				had_error := True
			else
-- TODO: check that it is a boolean expression
			end
			a_compound := an_instruction.loop_compound
			if a_compound /= Void then
				check_instructions_validity (a_compound, current_feature, current_class)
				if has_fatal_error then
					had_error := True
				end
			end
			if had_error then
				set_fatal_error
			end
		end

	check_precursor_instruction_validity (an_instruction: ET_PRECURSOR_INSTRUCTION) is
			-- Check validity of `an_instruction'.
		require
			an_instruction_not_void: an_instruction /= Void
		local
			a_parent: ET_PRECURSOR_CLASS_NAME
			an_arguments: ET_ACTUAL_ARGUMENT_LIST
		do
-- TODO
-- TODO
			a_parent := an_instruction.parent
			if a_parent /= Void then
				a_parent.process (Current)
			end
			an_arguments := an_instruction.arguments
			if an_arguments /= Void then
				an_arguments.process (Current)
			end
		end

	check_retry_instruction_validity (an_instruction: ET_RETRY_INSTRUCTION) is
			-- Check validity of `an_instruction'.
		require
			an_instruction_not_void: an_instruction /= Void
		do
-- TODO
		end

	check_static_call_instruction_validity (an_instruction: ET_STATIC_CALL_INSTRUCTION) is
			-- Check validity of `an_instruction'.
		require
			an_instruction_not_void: an_instruction /= Void
		local
			a_context: ET_NESTED_TYPE_CONTEXT
			a_base_type: ET_BASE_TYPE
			a_class_impl: ET_CLASS
			a_class: ET_CLASS
			a_feature: ET_FEATURE
			a_type: ET_TYPE
			a_name: ET_FEATURE_NAME
			a_seed: INTEGER
			an_actuals: ET_ACTUAL_ARGUMENT_LIST
			an_actual: ET_EXPRESSION
			a_formals: ET_FORMAL_ARGUMENT_LIST
			a_formal: ET_FORMAL_ARGUMENT
			i, nb: INTEGER
			an_actual_type: ET_TYPE
			an_actual_context: ET_TYPE_CONTEXT
			a_formal_type: ET_TYPE
			an_actual_named_type: ET_NAMED_TYPE
			a_formal_named_type: ET_NAMED_TYPE
		do
			a_type := an_instruction.type
			check_type_validity (a_type)
			if not has_fatal_error then
				a_class_impl := current_feature.implementation_class
				a_name := an_instruction.name
				a_seed := a_name.seed
				if a_seed = 0 then
						-- We need to resolve `a_name' in the implementation
						-- class of `current_feature' first.
					a_base_type := a_type.base_type (a_class_impl, universe)
					create a_context.make (a_base_type, a_class_impl)
					a_class := a_base_type.direct_base_class (universe)
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
							a_base_type := a_type.base_type (current_class, universe)
							create a_context.make (a_base_type, current_class)
							a_class := a_base_type.direct_base_class (universe)
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
							a_context_not_void: a_context /= Void
						end
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
						an_actuals := an_instruction.arguments
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
							nb := an_actuals.count
							from i := 1 until i > nb loop
								an_actual := an_actuals.expression (i)
								expression_checker.check_expression_validity (an_actual, current_feature, current_class)
								if expression_checker.has_fatal_error then
									set_fatal_error
								else
									an_actual_type := expression_checker.type
									an_actual_context := expression_checker.context
									a_formal := a_formals.formal_argument (i)
									if not an_actual_type.conforms_to_type (a_formal.type, a_context, an_actual_context, universe) then
										if not an_actual_type.convertible_to_type (a_formal.type, a_context, an_actual_context, universe) then
											an_actual_named_type := an_actual_type.named_type (an_actual_context, universe)
											a_formal_named_type := a_formal.type.named_type (a_context, universe)
											set_fatal_error
											if current_class = a_class_impl then
												error_handler.report_vuar2a_error (a_class_impl, a_name, a_feature, a_class, i, an_actual_named_type, a_formal_named_type)
											else
												error_handler.report_vuar2b_error (a_class_impl, current_class, a_name, a_feature, a_class, i, an_actual_named_type, a_formal_named_type)
											end
										end
									end
								end
								i := i + 1
							end
						end
-- TODO: check that `a_feature' is an external procedure.
						a_type := a_feature.type
						if a_type /= Void then
								-- In a call instruction, `a_feature' has to be a procedure.
							set_fatal_error
							if current_class = a_class_impl then
								error_handler.report_vkcn1a_error (a_class_impl, a_name, a_feature, a_class)
							else
								error_handler.report_vkcn1b_error (a_class_impl, current_class, a_name, a_feature, a_class)
							end
						end
					end
				end
			end
		end

	expression_checker: ET_EXPRESSION_CHECKER
			-- Expression validity checker

feature {NONE} -- Type checking

	resolved_formal_parameters (a_type: ET_TYPE): ET_TYPE is
			-- Replace formal generic parameters in `a_type' by their
			-- corresponding actual parameters if the class where
			-- `a_type' appears is generic and is not `current_class'.
		require
			a_type_not_void: a_type /= Void
		local
			a_class_impl: ET_CLASS
			an_ancestor: ET_BASE_TYPE
			a_parameters: ET_ACTUAL_PARAMETER_LIST
		do
			a_class_impl := current_feature.implementation_class
			if a_class_impl /= current_class and then a_class_impl.is_generic then
					-- We need to replace formal generic parameters in
					-- `a_type' by their corresponding actual parameters.
				current_class.process (universe.ancestor_builder)
				if current_class.has_ancestors_error then
					set_fatal_error
				else
					an_ancestor := current_class.ancestor (a_class_impl, universe)
					if an_ancestor = Void then
							-- Internal error: `current_class' is a descendant of `a_class_impl'.
						set_fatal_error
						error_handler.report_giaba_error
					else
						a_parameters := an_ancestor.actual_parameters
						if a_parameters = Void then
								-- Internal error: we said that `a_class_impl' was generic.
							set_fatal_error
							error_handler.report_giabb_error
						else
							Result := a_type.resolved_formal_parameters (a_parameters)
						end
					end
				end
			else
				Result := a_type
			end
		ensure
			resolved_type_not_void: not has_fatal_error implies Result /= Void
		end

	check_type_validity (a_type: ET_TYPE) is
			-- Check validity of `a_type'.
		require
			a_type_not_void: a_type /= Void
		do
			type_checker.resolve_type (a_type, current_feature, current_feature.implementation_class)
			if type_checker.has_fatal_error then
				set_fatal_error
			end
		end

	type_checker: ET_IDENTIFIER_TYPE_RESOLVER
			-- Type checker

feature {ET_AST_NODE} -- Processing

	process_assignment (an_instruction: ET_ASSIGNMENT) is
			-- Process `an_instruction'.
		do
			if internal_call then
				internal_call := False
				check_assignment_validity (an_instruction)
			end
		end

	process_assignment_attempt (an_instruction: ET_ASSIGNMENT_ATTEMPT) is
			-- Process `an_instruction'.
		do
			if internal_call then
				internal_call := False
				check_assignment_attempt_validity (an_instruction)
			end
		end

	process_bang_instruction (an_instruction: ET_BANG_INSTRUCTION) is
			-- Process `an_instruction'.
		do
			if internal_call then
				internal_call := False
				check_bang_instruction_validity (an_instruction)
			end
		end

	process_call_instruction (an_instruction: ET_CALL_INSTRUCTION) is
			-- Process `an_instruction'.
		do
			if internal_call then
				internal_call := False
				check_call_instruction_validity (an_instruction)
			end
		end

	process_check_instruction (an_instruction: ET_CHECK_INSTRUCTION) is
			-- Process `an_instruction'.
		do
			if internal_call then
				internal_call := False
				check_check_instruction_validity (an_instruction)
			end
		end

	process_create_instruction (an_instruction: ET_CREATE_INSTRUCTION) is
			-- Process `an_instruction'.
		do
			if internal_call then
				internal_call := False
				check_create_instruction_validity (an_instruction)
			end
		end

	process_debug_instruction (an_instruction: ET_DEBUG_INSTRUCTION) is
			-- Process `an_instruction'.
		do
			if internal_call then
				internal_call := False
				check_debug_instruction_validity (an_instruction)
			end
		end

	process_if_instruction (an_instruction: ET_IF_INSTRUCTION) is
			-- Process `an_instruction'.
		do
			if internal_call then
				internal_call := False
				check_if_instruction_validity (an_instruction)
			end
		end

	process_inspect_instruction (an_instruction: ET_INSPECT_INSTRUCTION) is
			-- Process `an_instruction'.
		do
			if internal_call then
				internal_call := False
				check_inspect_instruction_validity (an_instruction)
			end
		end

	process_loop_instruction (an_instruction: ET_LOOP_INSTRUCTION) is
			-- Process `an_instruction'.
		do
			if internal_call then
				internal_call := False
				check_loop_instruction_validity (an_instruction)
			end
		end

	process_precursor_instruction (an_instruction: ET_PRECURSOR_INSTRUCTION) is
			-- Process `an_instruction'.
		do
			if internal_call then
				internal_call := False
				check_precursor_instruction_validity (an_instruction)
			end
		end

	process_retry_instruction (an_instruction: ET_RETRY_INSTRUCTION) is
			-- Process `an_instruction'.
		do
			if internal_call then
				internal_call := False
				check_retry_instruction_validity (an_instruction)
			end
		end

	process_static_call_instruction (an_instruction: ET_STATIC_CALL_INSTRUCTION) is
			-- Process `an_instruction'.
		do
			if internal_call then
				internal_call := False
				check_static_call_instruction_validity (an_instruction)
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

	dummy_instruction: ET_INSTRUCTION is
			-- Dummy instruction
		once
			Result := tokens.semicolon_symbol
		ensure
			dummy_instruction_not_void: Result /= Void
		end

invariant

	current_instruction_not_void: current_instruction /= Void
	current_feature_not_void: current_feature /= Void
	current_class_not_void: current_class /= Void
	expression_checker_not_void: expression_checker /= Void
	type_checker_not_void: type_checker /= Void

end
