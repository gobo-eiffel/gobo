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

	ET_CALL_CHECKER
		rename
			make as make_call_checker
		redefine
			process_assignment,
			process_assignment_attempt,
			process_bang_instruction,
			process_call_instruction,
			process_check_instruction,
			process_create_instruction,
			process_debug_instruction,
			process_identifier,
			process_if_instruction,
			process_inspect_instruction,
			process_loop_instruction,
			process_precursor_instruction,
			process_retry_instruction,
			process_semicolon_symbol,
			process_static_call_instruction
		end

creation

	make, make_with_expression_checker

feature {NONE} -- Initialization

	make (a_universe: like universe) is
			-- Create a new instruction validity checker.
		require
			a_universe_not_void: a_universe /= Void
		do
			create expression_checker.make (a_universe)
			make_with_expression_checker (expression_checker)
		ensure
			universe_set: universe = a_universe
		end

	make_with_expression_checker (an_expression_checker: like expression_checker) is
			-- Create an new instruction validity checker using
			-- `an_expression_checker' to check validity of expressions.
		require
			an_expression_checker_not_void: an_expression_checker /= Void
		do
			expression_checker := an_expression_checker
			make_call_checker (an_expression_checker.universe)
			create actual_context.make_with_capacity (current_class, 10)
		ensure
			expression_checker_set: expression_checker = an_expression_checker
			universe_set: universe = an_expression_checker.universe
		end

feature -- Validity checking

	check_instructions_validity (a_compound: ET_COMPOUND; a_feature: ET_FEATURE; a_class: ET_CLASS) is
			-- Check validity of `a_coumpound' in `a_feature' of `a_class'.
		require
			a_compound_not_void: a_compound /= Void
			a_feature_not_void: a_feature /= Void
			a_class_not_void: a_class /= Void
			implementation_checked: a_class /= a_feature.implementation_class implies implementation_checked (a_feature)
		local
			old_feature: ET_FEATURE
			old_class: ET_CLASS
			i, nb: INTEGER
			had_error: BOOLEAN
		do
			has_fatal_error := False
			old_feature := current_feature
			current_feature := a_feature
			old_class := current_class
			current_class := a_class
			nb := a_compound.count
			from i := 1 until i > nb loop
				internal_call := True
				a_compound.item (i).process (Current)
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
		end

feature {NONE} -- Instruction validity

	check_assignment_validity (an_instruction: ET_ASSIGNMENT) is
			-- Check validity of `an_instruction'.
		require
			an_instruction_not_void: an_instruction /= Void
		local
			a_target: ET_WRITABLE
			a_target_type: ET_TYPE
			a_target_context: ET_NESTED_TYPE_CONTEXT
			a_source: ET_EXPRESSION
			a_source_context: ET_NESTED_TYPE_CONTEXT
			a_class_impl: ET_CLASS
			a_source_named_type: ET_NAMED_TYPE
			a_target_named_type: ET_NAMED_TYPE
			a_convert_feature: ET_CONVERT_FEATURE
			a_convert_expression: ET_CONVERT_EXPRESSION
		do
			actual_context.reset (current_class)
			a_source_context := actual_context
			formal_context.reset (current_class)
			a_target_context := formal_context
			a_target := an_instruction.target
			expression_checker.check_writable_validity (a_target, a_target_context, current_feature, current_class)
			if expression_checker.has_fatal_error then
				set_fatal_error
				a_target_context.wipe_out
				a_target_context.force_first (universe.any_type)
			end
			a_source := an_instruction.source
			check_subexpression_validity (a_source, a_source_context, a_target_context)
			if not has_fatal_error then
				a_target_type := tokens.like_current
				if not a_source_context.conforms_to_type (a_target_type, a_target_context, universe) then
					a_class_impl := current_feature.implementation_class
					if current_class = a_class_impl then
						a_convert_feature := type_checker.convert_feature (a_source_context, a_target_context)
					else
							-- Convertibility should be resolved in the implementation class.
						a_convert_feature := Void
					end
					if a_convert_feature /= Void then
							-- Insert the conversion feature call in the AST.
						a_convert_expression := universe.ast_factory.new_convert_expression (a_source, a_convert_feature)
						if a_convert_expression /= Void then
							an_instruction.set_source (a_convert_expression)
						end
					else
						set_fatal_error
						a_source_named_type := a_source_context.named_type (universe)
						a_target_named_type := a_target_context.named_type (universe)
						a_class_impl := current_feature.implementation_class
						if current_class = a_class_impl then
							error_handler.report_vjar0a_error (current_class, an_instruction, a_source_named_type, a_target_named_type)
						else
							error_handler.report_vjar0b_error (current_class, a_class_impl, an_instruction, a_source_named_type, a_target_named_type)
						end
					end
				end
			end
		end

	check_assignment_attempt_validity (an_instruction: ET_ASSIGNMENT_ATTEMPT) is
			-- Check validity of `an_instruction'.
		require
			an_instruction_not_void: an_instruction /= Void
		local
			a_target: ET_WRITABLE
			a_target_context: ET_NESTED_TYPE_CONTEXT
			a_source: ET_EXPRESSION
			a_source_context: ET_NESTED_TYPE_CONTEXT
			a_target_named_type: ET_NAMED_TYPE
			a_class_impl: ET_CLASS
		do
			actual_context.reset (current_class)
			a_source_context := actual_context
			formal_context.reset (current_class)
			a_target_context := formal_context
			a_target := an_instruction.target
			expression_checker.check_writable_validity (a_target, a_target_context, current_feature, current_class)
			if expression_checker.has_fatal_error then
				set_fatal_error
				a_target_context.wipe_out
				a_target_context.force_first (universe.any_type)
			elseif a_target_context.is_type_expanded (universe) then
				set_fatal_error
				a_target_named_type := a_target_context.named_type (universe)
				a_class_impl := current_feature.implementation_class
				if current_class = a_class_impl then
					error_handler.report_vjrv0a_error (current_class, a_target, a_target_named_type)
				else
					error_handler.report_vjrv0b_error (current_class, a_class_impl, a_target, a_target_named_type)
				end
			end
			a_source := an_instruction.source
			check_subexpression_validity (a_source, a_source_context, a_target_context)
		end

	check_bang_instruction_validity (an_instruction: ET_BANG_INSTRUCTION) is
			-- Check validity of `an_instruction'.
		require
			an_instruction_not_void: an_instruction /= Void
		do
			check_creation_instruction_validity (an_instruction)
		end

	check_call_instruction_validity (an_instruction: ET_CALL_INSTRUCTION) is
			-- Check validity of `an_instruction'.
		require
			an_instruction_not_void: an_instruction /= Void
		do
			actual_context.reset (current_class)
			if an_instruction.target = Void then
				check_unqualified_call_validity (an_instruction.name, an_instruction.arguments, actual_context)
			else
				check_qualified_call_validity (an_instruction.target, an_instruction.name, an_instruction.arguments, actual_context)
			end
		end

	check_check_instruction_validity (an_instruction: ET_CHECK_INSTRUCTION) is
			-- Check validity of `an_instruction'.
		require
			an_instruction_not_void: an_instruction /= Void
		local
			i, nb: INTEGER
			an_expression: ET_EXPRESSION
			boolean_type: ET_CLASS_TYPE
			a_class_impl: ET_CLASS
			a_named_type: ET_NAMED_TYPE
			had_error: BOOLEAN
		do
			boolean_type := universe.boolean_class
			actual_context.reset (current_class)
			nb := an_instruction.count
			from i := 1 until i > nb loop
				an_expression := an_instruction.assertion (i).expression
				has_fatal_error := False
				check_subexpression_validity (an_expression, actual_context, boolean_type)
				if has_fatal_error then
					had_error := True
				else
					if not actual_context.same_named_type (boolean_type, current_class, universe) then
						set_fatal_error
						had_error := True
						a_named_type := actual_context.named_type (universe)
						a_class_impl := current_feature.implementation_class
						if current_class = a_class_impl then
							error_handler.report_vwbe0a_error (current_class, an_expression, a_named_type)
						else
							error_handler.report_vwbe0b_error (current_class, a_class_impl, an_expression, a_named_type)
						end
					end
				end
				actual_context.wipe_out
				i := i + 1
			end
			if had_error then
				set_fatal_error
			end
		end

	check_create_instruction_validity (an_instruction: ET_CREATE_INSTRUCTION) is
			-- Check validity of `an_instruction'.
		require
			an_instruction_not_void: an_instruction /= Void
		do
			check_creation_instruction_validity (an_instruction)
		end

	check_creation_instruction_validity (an_instruction: ET_CREATION_INSTRUCTION) is
			-- Check validity of `an_instruction'.
		require
			an_instruction_not_void: an_instruction /= Void
		local
			a_context: ET_NESTED_TYPE_CONTEXT
			a_class_impl: ET_CLASS
			a_class: ET_CLASS
			a_creation_named_type: ET_NAMED_TYPE
			a_target_named_type: ET_NAMED_TYPE
			a_formal_parameter_type: ET_FORMAL_PARAMETER_TYPE
			a_formal_parameter: ET_FORMAL_PARAMETER
			a_formal_parameters: ET_FORMAL_PARAMETER_LIST
			a_creator: ET_CONSTRAINT_CREATOR
			an_index: INTEGER
			a_class_type: ET_CLASS_TYPE
			a_feature: ET_FEATURE
			a_target_type: ET_TYPE
			a_target_context: ET_NESTED_TYPE_CONTEXT
			a_creation_type: ET_TYPE
			a_creation_context: ET_NESTED_TYPE_CONTEXT
			a_seed: INTEGER
			a_call: ET_QUALIFIED_CALL
			a_name: ET_FEATURE_NAME
		do
			actual_context.reset (current_class)
			formal_context.reset (current_class)
			a_target_context := formal_context
			a_creation_context := actual_context
			a_creation_type := an_instruction.type
			if a_creation_type /= Void then
				check_type_validity (a_creation_type)
			end
			if not has_fatal_error then
				a_call := an_instruction.creation_call
				if a_call /= Void then
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
								error_handler.report_giacq_error
							end
						else
							expression_checker.check_writable_validity (an_instruction.target, a_target_context, current_feature, current_class)
							if expression_checker.has_fatal_error then
								set_fatal_error
							else
								a_target_type := tokens.like_current
								if a_creation_type /= Void then
									a_creation_context.force_first (a_creation_type)
									a_context := a_creation_context
								else
									a_context := a_target_context
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
										error_handler.report_vuex2a_error (a_class_impl, a_name, a_class)
									end
								end
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
					expression_checker.check_writable_validity (an_instruction.target, a_target_context, current_feature, current_class)
					if expression_checker.has_fatal_error then
						set_fatal_error
					else
						a_target_type := tokens.like_current
						if a_creation_type /= Void then
							a_creation_type := resolved_formal_parameters (a_creation_type)
							if not has_fatal_error then
								a_creation_context.force_first (a_creation_type)
								a_context := a_creation_context
							end
						else
							a_context := a_target_context
						end
					end
					if not has_fatal_error then
						a_class := a_context.base_class (universe)
						a_class.process (universe.interface_checker)
						if a_class.has_interface_error then
							set_fatal_error
						elseif a_seed /= 0 then
							a_feature := a_class.seeded_feature (a_seed)
							if a_feature = Void then
									-- Report internal error: if we got a seed, the
									-- `a_feature' should not be void.
								set_fatal_error
								error_handler.report_giabp_error
							end
						end
					end
				end
			end
			if not has_fatal_error then
				check
					a_class_not_void: a_class /= Void
					a_context_not_void: a_context /= Void
				end
				if a_creation_type /= Void then
					if not a_creation_context.conforms_to_type (a_target_type, a_target_context, universe) then
						set_fatal_error
						a_creation_named_type := a_creation_context.named_type (universe)
						a_target_named_type := a_target_context.named_type (universe)
						a_class_impl := current_feature.implementation_class
						if current_class = a_class_impl then
							error_handler.report_vgcc3a_error (current_class, an_instruction, a_creation_named_type, a_target_named_type)
						else
							error_handler.report_vgcc3b_error (current_class, a_class_impl, an_instruction, a_creation_named_type, a_target_named_type)
						end
					else
						universe.report_create_supplier (a_creation_type, current_class, current_feature)
					end
				end
				a_creation_named_type := a_context.named_type (universe)
				a_class_type ?= a_creation_named_type
				if a_class_type /= Void then
					check_creation_type_validity (a_class_type, an_instruction)
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
						a_class_impl := current_feature.implementation_class
						if current_class = a_class_impl then
							error_handler.report_vgcc5c_error (current_class, an_instruction, a_class)
						else
							error_handler.report_vgcc5d_error (current_class, a_class_impl, an_instruction, a_class)
						end
					end
				else
					if a_feature.type /= Void then
							-- This is not a procedure.
						set_fatal_error
						a_class_impl := current_feature.implementation_class
						if current_class = a_class_impl then
							error_handler.report_vgcc6f_error (current_class, a_name, a_feature, a_class)
						elseif not has_implementation_error (current_feature) then
								-- Internal error: this error should have been reported when
								-- processing the implementation of `current_feature' or in
								-- the feature flattener when redeclaring procedure `a_feature'
								-- to a function in an ancestor of `a_class'.
							error_handler.report_giacr_error
						end
					end
					a_formal_parameter_type ?= a_creation_named_type
					if a_formal_parameter_type /= Void then
						an_index := a_formal_parameter_type.index
						a_formal_parameters := current_class.formal_parameters
						if a_formal_parameters = Void or else an_index > a_formal_parameters.count then
								-- Internal error: `a_formal_parameter' is supposed
								-- to be a formal parameter of `current_class'.
							set_fatal_error
							error_handler.report_giabq_error
						else
							a_formal_parameter := a_formal_parameters.formal_parameter (an_index)
							a_creator := a_formal_parameter.creation_procedures
							if a_creator = Void or else not a_creator.has_feature (a_feature) then
								set_fatal_error
								a_class_impl := current_feature.implementation_class
								if current_class = a_class_impl then
									error_handler.report_vgcc8c_error (current_class, a_name, a_feature, a_class, a_formal_parameter)
								else
									error_handler.report_vgcc8d_error (current_class, a_class_impl, a_name, a_feature, a_class, a_formal_parameter)
								end
							end
						end
					elseif not a_feature.is_creation_exported_to (current_class, a_class, universe.ancestor_builder) then
						if a_class.creators /= Void or else not a_feature.has_seed (universe.default_create_seed) then
								-- The procedure is not a creation procedure exported to `current_class'.
							set_fatal_error
							a_class_impl := current_feature.implementation_class
							if current_class = a_class_impl then
								error_handler.report_vgcc6h_error (current_class, a_name, a_feature, a_class)
							else
								error_handler.report_vgcc6i_error (current_class, a_class_impl, a_name, a_feature, a_class)
							end
						end
					end
					if a_call /= Void then
						check_arguments_validity (a_call.arguments, a_context, a_name, a_feature, a_class)
					else
						check_arguments_validity (Void, a_context, a_name, a_feature, a_class)
					end
				end
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
			boolean_type: ET_CLASS_TYPE
			a_conditional: ET_EXPRESSION
			a_compound: ET_COMPOUND
			an_elseif_parts: ET_ELSEIF_PART_LIST
			an_elseif: ET_ELSEIF_PART
			i, nb: INTEGER
			had_error: BOOLEAN
			a_class_impl: ET_CLASS
			a_named_type: ET_NAMED_TYPE
		do
			boolean_type := universe.boolean_class
			actual_context.reset (current_class)
			a_conditional := an_instruction.conditional.expression
			check_subexpression_validity (a_conditional, actual_context, boolean_type)
			if not has_fatal_error then
				if not actual_context.same_named_type (boolean_type, current_class, universe) then
					set_fatal_error
					a_named_type := actual_context.named_type (universe)
					a_class_impl := current_feature.implementation_class
					if current_class = a_class_impl then
						error_handler.report_vwbe0a_error (current_class, a_conditional, a_named_type)
					else
						error_handler.report_vwbe0b_error (current_class, a_class_impl, a_conditional, a_named_type)
					end
				end
			end
			had_error := has_fatal_error
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
					actual_context.reset (current_class)
					check_subexpression_validity (a_conditional, actual_context, boolean_type)
					if has_fatal_error then
						had_error := True
					else
						if not actual_context.same_named_type (boolean_type, current_class, universe) then
							had_error := True
							set_fatal_error
							a_named_type := actual_context.named_type (universe)
							a_class_impl := current_feature.implementation_class
							if current_class = a_class_impl then
								error_handler.report_vwbe0a_error (current_class, a_conditional, a_named_type)
							else
								error_handler.report_vwbe0b_error (current_class, a_class_impl, a_conditional, a_named_type)
							end
						end
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
			an_expression: ET_EXPRESSION
			a_when_parts: ET_WHEN_PART_LIST
			a_when_part: ET_WHEN_PART
			a_compound: ET_COMPOUND
			i, nb: INTEGER
			had_error: BOOLEAN
			had_value_error: BOOLEAN
			a_value_context: ET_NESTED_TYPE_CONTEXT
			a_value_type: ET_TYPE
			any_type: ET_CLASS_TYPE
			a_value_named_type: ET_NAMED_TYPE
			a_class_impl: ET_CLASS
			a_choices: ET_CHOICE_LIST
			a_choice: ET_CHOICE
			a_choice_constant: ET_CHOICE_CONSTANT
			a_choice_context: ET_NESTED_TYPE_CONTEXT
			a_choice_named_type: ET_NAMED_TYPE
			j, nb2: INTEGER
			a_value_class: ET_CLASS
			a_choice_class: ET_CLASS
		do
			any_type := universe.any_type
			formal_context.reset (current_class)
			a_value_context := formal_context
			an_expression := an_instruction.conditional.expression
			check_subexpression_validity (an_expression, a_value_context, any_type)
			if not has_fatal_error then
				if a_value_context.same_named_type (universe.character_class, current_class, universe) then
					-- OK.
				elseif a_value_context.same_named_type (universe.integer_class, current_class, universe) then
					-- OK.
				elseif a_value_context.same_named_type (universe.integer_8_class, current_class, universe) then
					-- Valid with ISE Eiffel. To be checked with other compilers.
				elseif a_value_context.same_named_type (universe.integer_16_class, current_class, universe) then
					-- Valid with ISE Eiffel. To be checked with other compilers.
				elseif a_value_context.same_named_type (universe.integer_64_class, current_class, universe) then
					-- Valid with ISE Eiffel. To be checked with other compilers.
				else
					set_fatal_error
					a_value_named_type := a_value_context.named_type (universe)
					a_class_impl := current_feature.implementation_class
					if current_class = a_class_impl then
						error_handler.report_vomb1a_error (current_class, an_expression, a_value_named_type)
					else
						error_handler.report_vomb1b_error (current_class, a_class_impl, an_expression, a_value_named_type)
					end
				end
			end
			had_error := has_fatal_error
			had_value_error := had_error
			actual_context.reset (current_class)
			a_choice_context := actual_context
			a_value_type := tokens.like_current
			a_when_parts := an_instruction.when_parts
			if a_when_parts /= Void then
				nb := a_when_parts.count
				from i := 1 until i > nb loop
					a_when_part := a_when_parts.item (i)
					a_choices := a_when_part.choices
					nb2 := a_choices.count
					from j := 1 until j > nb2 loop
						a_choice := a_choices.choice (j)
						a_choice_constant := a_choice.lower
						an_expression := a_choice_constant.expression
						has_fatal_error := False
						check_subexpression_validity (an_expression, a_choice_context, a_value_context)
						if has_fatal_error then
							had_error := True
						elseif not had_value_error then
							if a_choice_context.same_named_type (a_value_type, a_value_context, universe) then
								-- OK.
							else
								a_value_class := a_value_context.base_class (universe)
								a_choice_class := a_choice_context.base_class (universe)
								if
									a_value_class = universe.integer_16_class and then
									a_choice_class = universe.integer_8_class
								then
									-- Valid with ISE Eiffel. To be checked with other compilers.
								elseif
									a_value_class = universe.integer_class and then
									(a_choice_class = universe.integer_8_class or
									a_choice_class = universe.integer_16_class)
								then
									-- Valid with ISE Eiffel. To be checked with other compilers.
								elseif
									a_value_class = universe.integer_64_class and then
									(a_choice_class = universe.integer_8_class or
									a_choice_class = universe.integer_16_class or
									a_choice_class = universe.integer_class)
								then
									-- Valid with ISE Eiffel. To be checked with other compilers.
								else
									had_error := True
									set_fatal_error
									a_value_named_type := a_value_context.named_type (universe)
									a_choice_named_type := a_choice_context.named_type (universe)
									a_class_impl := current_feature.implementation_class
									if current_class = a_class_impl then
										error_handler.report_vomb2a_error (current_class, a_choice_constant, a_choice_named_type, a_value_named_type)
									else
										error_handler.report_vomb2b_error (current_class, a_class_impl, a_choice_constant, a_choice_named_type, a_value_named_type)
									end
								end
							end
						end
						a_choice_context.wipe_out
						if a_choice.is_range then
							a_choice_constant := a_choice.upper
							an_expression := a_choice_constant.expression
							has_fatal_error := False
							check_subexpression_validity (an_expression, a_choice_context, a_value_context)
							if has_fatal_error then
								had_error := True
							elseif not had_value_error then
								if a_choice_context.same_named_type (a_value_type, a_value_context, universe) then
									-- OK.
								else
									a_value_class := a_value_context.base_class (universe)
									a_choice_class := a_choice_context.base_class (universe)
									if
										a_value_class = universe.integer_16_class and then
										a_choice_class = universe.integer_8_class
									then
										-- Valid with ISE Eiffel. To be checked with other compilers.
									elseif
										a_value_class = universe.integer_class and then
										(a_choice_class = universe.integer_8_class or
										a_choice_class = universe.integer_16_class)
									then
										-- Valid with ISE Eiffel. To be checked with other compilers.
									elseif
										a_value_class = universe.integer_64_class and then
										(a_choice_class = universe.integer_8_class or
										a_choice_class = universe.integer_16_class or
										a_choice_class = universe.integer_class)
									then
										-- Valid with ISE Eiffel. To be checked with other compilers.
									else
										had_error := True
										set_fatal_error
										a_value_named_type := a_value_context.named_type (universe)
										a_choice_named_type := a_choice_context.named_type (universe)
										a_class_impl := current_feature.implementation_class
										if current_class = a_class_impl then
											error_handler.report_vomb2a_error (current_class, a_choice_constant, a_choice_named_type, a_value_named_type)
										else
											error_handler.report_vomb2b_error (current_class, a_class_impl, a_choice_constant, a_choice_named_type, a_value_named_type)
										end
									end
								end
							end
							a_choice_context.wipe_out
						end
						j := j + 1
-- TODO: check Unique and Constants and choice unicity.
					end
					i := i + 1
				end
					-- We need to process the compounds after the choices because
					-- `check_instructions_validity' may alter `actual_context'
					-- and `formal_context' used to check the validity of the
					-- choice values compared to the type of the inspect expression.
				from i := 1 until i > nb loop
					a_when_part := a_when_parts.item (i)
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
			an_expression: ET_EXPRESSION
			a_compound: ET_COMPOUND
			had_error: BOOLEAN
			a_class_impl: ET_CLASS
			a_named_type: ET_NAMED_TYPE
			boolean_type: ET_CLASS_TYPE
			a_variant: ET_VARIANT
			integer_type: ET_CLASS_TYPE
			an_invariant: ET_LOOP_INVARIANTS
			i, nb: INTEGER
		do
			a_compound := an_instruction.from_compound
			if a_compound /= Void then
				check_instructions_validity (a_compound, current_feature, current_class)
			end
			had_error := has_fatal_error
			boolean_type := universe.boolean_class
			actual_context.reset (current_class)
			an_invariant := an_instruction.invariant_part
			if an_invariant /= Void then
				nb := an_invariant.count
				from i := 1 until i > nb loop
					an_expression := an_invariant.assertion (i).expression
					has_fatal_error := False
					check_subexpression_validity (an_expression, actual_context, boolean_type)
					if has_fatal_error then
						had_error := True
					else
						if not actual_context.same_named_type (boolean_type, current_class, universe) then
							had_error := True
							set_fatal_error
							a_named_type := actual_context.named_type (universe)
							a_class_impl := current_feature.implementation_class
							if current_class = a_class_impl then
								error_handler.report_vwbe0a_error (current_class, an_expression, a_named_type)
							else
								error_handler.report_vwbe0b_error (current_class, a_class_impl, an_expression, a_named_type)
							end
						end
					end
					actual_context.wipe_out
					i := i + 1
				end
			end
			a_variant := an_instruction.variant_part
			if a_variant /= Void then
				an_expression := a_variant.expression
				if an_expression /= Void then
					integer_type := universe.integer_class
					has_fatal_error := False
					check_subexpression_validity (an_expression, actual_context, integer_type)
					if has_fatal_error then
						had_error := True
					else
						if not actual_context.same_named_type (integer_type, current_class, universe) then
							had_error := True
							set_fatal_error
							a_named_type := actual_context.named_type (universe)
							a_class_impl := current_feature.implementation_class
							if current_class = a_class_impl then
								error_handler.report_vave0a_error (current_class, an_expression, a_named_type)
							else
								error_handler.report_vave0b_error (current_class, a_class_impl, an_expression, a_named_type)
							end
						end
					end
					actual_context.wipe_out
				else
-- TODO: syntax error.
				end
			end
			an_expression := an_instruction.until_conditional.expression
			has_fatal_error := False
			check_subexpression_validity (an_expression, actual_context, boolean_type)
			if has_fatal_error then
				had_error := True
			else
				if not actual_context.same_named_type (boolean_type, current_class, universe) then
					had_error := True
					set_fatal_error
					a_named_type := actual_context.named_type (universe)
					a_class_impl := current_feature.implementation_class
					if current_class = a_class_impl then
						error_handler.report_vwbe0a_error (current_class, an_expression, a_named_type)
					else
						error_handler.report_vwbe0b_error (current_class, a_class_impl, an_expression, a_named_type)
					end
				end
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
		do
			actual_context.reset (current_class)
			check_precursor_validity (an_instruction, actual_context)
		end

	check_retry_instruction_validity (an_instruction: ET_RETRY_INSTRUCTION) is
			-- Check validity of `an_instruction'.
		require
			an_instruction_not_void: an_instruction /= Void
		local
			a_class_impl: ET_CLASS
		do
				-- The Retry instruction does not appear in a Rescue clause.
			set_fatal_error
			a_class_impl := current_feature.implementation_class
			if a_class_impl /= current_class then
				if not has_implementation_error (current_feature) then
						-- Internal error: the VXRT error should have been
						-- reported in the implementation feature.
					error_handler.report_giacs_error
				end
			else
				error_handler.report_vxrt0a_error (current_class, an_instruction)
			end
		end

	check_static_call_instruction_validity (an_instruction: ET_STATIC_CALL_INSTRUCTION) is
			-- Check validity of `an_instruction'.
		require
			an_instruction_not_void: an_instruction /= Void
		do
			actual_context.reset (current_class)
			check_static_call_validity (an_instruction, actual_context)
		end

	check_subexpression_validity (an_expression: ET_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT;
		a_target_type: ET_TYPE_CONTEXT) is
			-- Check validity of `an_expression' (whose target is of type
			-- `a_target_type') in `current_feature' of `current_class'.
			-- Set `has_fatal_error' is a fatal error occurred. Otherwise
			-- the type of `an_expression' is appended to `a_context'.
		do
			expression_checker.check_expression_validity (an_expression, a_context, a_target_type, current_feature, current_class)
			if expression_checker.has_fatal_error then
				set_fatal_error
			end
		end

	check_argument_validity (an_actual: ET_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT;
		a_formal_type: ET_TYPE_CONTEXT) is
			-- Check validity of actual argument `an_actual' (whose formal is of type
			-- `a_formal_type') in `current_feature' of `current_class'. Set `has_fatal_error'
			-- is a fatal error occurred. Otherwise the type of `an_expression'
			-- is appended to `a_context'.
		do
			expression_checker.check_expression_validity (an_actual, a_context, a_formal_type, current_feature, current_class)
			if expression_checker.has_fatal_error then
				set_fatal_error
			end
		end

	check_arguments_validity (an_actuals: ET_ACTUAL_ARGUMENT_LIST; a_context: ET_NESTED_TYPE_CONTEXT;
		a_name: ET_FEATURE_NAME; a_feature: ET_FEATURE; a_class: ET_CLASS) is
			-- Check actual arguments validity when calling `a_feature' named `a_name'
			-- in context of its target `a_context'. `a_class' is the base class of the
			-- target, or void in case of an unqualified call.
		do
			expression_checker.check_actual_arguments_validity (an_actuals, a_context, a_name, a_feature, a_class, current_feature, current_class)
			if expression_checker.has_fatal_error then
				set_fatal_error
			end
		end

	expression_checker: ET_EXPRESSION_CHECKER
			-- Expression validity checker

feature {NONE} -- Type checking

	check_creation_type_validity (a_type: ET_CLASS_TYPE; a_creation: ET_CREATION_INSTRUCTION) is
			-- Check validity of `a_type' as base type of a creation type
			-- in `current_class'. Note that `a_type' should already be a
			-- valid type by itself (call `check_type_validity' for that).
		require
			a_type_not_void: a_type /= Void
			a_type_named_type: a_type.is_named_type
			a_creation_not_void: a_creation /= Void
		local
			a_position: ET_POSITION
			a_creation_type: ET_TYPE
		do
			a_creation_type := a_creation.type
			if a_creation_type /= Void then
				a_position := a_creation_type.position
			else
				a_position := a_creation.target.position
			end
			type_checker.check_creation_type_validity (a_type, current_feature, current_class, a_position)
			if type_checker.has_fatal_error then
				set_fatal_error
			end
		end

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

	process_identifier (a_identifier: ET_IDENTIFIER) is
			-- Process `a_identifier'.
		do
			if internal_call then
				internal_call := False
				actual_context.reset (current_class)
				check_unqualified_call_validity (a_identifier, Void, actual_context)
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

	process_semicolon_symbol (a_symbol: ET_SEMICOLON_SYMBOL) is
			-- Process `a_symbol'.
		do
			if internal_call then
				internal_call := False
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

	actual_context: ET_NESTED_TYPE_CONTEXT
			-- Actual context

invariant

	expression_checker_not_void: expression_checker /= Void
	actual_context_not_void: actual_context /= Void

end
