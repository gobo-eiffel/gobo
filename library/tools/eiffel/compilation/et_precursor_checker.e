note

	description:

		"Eiffel precursor validity checkers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003-2011, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_PRECURSOR_CHECKER

inherit

	ET_CLASS_SUBPROCESSOR
		redefine
			make
		end

	ET_AST_NULL_PROCESSOR
		undefine
			make
		redefine
			process_actual_argument_list,
			process_agent_argument_operand_list,
			process_assigner_instruction,
			process_assignment,
			process_assignment_attempt,
			process_bang_instruction,
			process_bracket_argument_list,
			process_bracket_expression,
			process_call_agent,
			process_call_expression,
			process_call_instruction,
			process_check_instruction,
			process_compound,
			process_convert_builtin_expression,
			process_convert_from_expression,
			process_convert_to_expression,
			process_create_expression,
			process_create_instruction,
			process_debug_instruction,
			process_do_function,
			process_do_function_inline_agent,
			process_do_procedure,
			process_do_procedure_inline_agent,
			process_elseif_part,
			process_elseif_part_list,
			process_equality_expression,
			process_expression_address,
			process_external_function_inline_agent,
			process_external_procedure_inline_agent,
			process_if_instruction,
			process_infix_expression,
			process_inspect_instruction,
			process_loop_instruction,
			process_loop_invariants,
			process_manifest_array,
			process_manifest_tuple,
			process_named_object_test,
			process_object_equality_expression,
			process_object_test,
			process_old_object_test,
			process_once_function,
			process_once_function_inline_agent,
			process_once_procedure,
			process_once_procedure_inline_agent,
			process_parenthesized_expression,
			process_precursor_expression,
			process_precursor_instruction,
			process_prefix_expression,
			process_static_call_expression,
			process_static_call_instruction,
			process_tagged_assertion,
			process_when_part,
			process_when_part_list
		end

create

	make

feature {NONE} -- Initialization

	make
			-- Create a new precursor validity checker.
		do
			precursor {ET_CLASS_SUBPROCESSOR}
			current_feature := dummy_feature
		end

feature -- Validity checking

	check_feature_validity (a_feature: ET_REDECLARED_FEATURE; a_class: ET_CLASS)
			-- Check validity of Precursor constructs in `a_feature' appearing in `a_class'.
		require
			a_feature_not_void: a_feature /= Void
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		local
			old_feature: ET_REDECLARED_FEATURE
			old_class: ET_CLASS
		do
			has_fatal_error := False
			old_feature := current_feature
			current_feature := a_feature
			old_class := current_class
			current_class := a_class
			a_feature.flattened_feature.process (Current)
			current_class := old_class
			current_feature := old_feature
		end

feature {NONE} -- Precursor validity

	check_precursor_validity (a_precursor: ET_PRECURSOR)
			-- Check validity of `a_precursor'.
		require
			a_precursor_not_void: a_precursor /= Void
		local
			a_parent_name: ET_PRECURSOR_CLASS_NAME
			a_class_name: ET_CLASS_NAME
			a_class: ET_CLASS
			a_parent_feature: ET_PARENT_FEATURE
			a_parent_type: ET_BASE_TYPE
			a_precursor_feature: ET_FEATURE
			an_effective: ET_PARENT_FEATURE
			a_deferred: ET_PARENT_FEATURE
			a_parents: ET_PARENT_LIST
			a_parent_found: BOOLEAN
			a_feature: ET_FEATURE
			i, nb: INTEGER
		do
			a_parent_name := a_precursor.parent_name
			if a_parent_name /= Void then
				a_class_name := a_parent_name.class_name
				if not current_universe.has_master_class (a_class_name) then
					set_fatal_error
					error_handler.report_vdpr2a_error (current_class, a_precursor)
				else
					a_class := current_universe.master_class (a_class_name).actual_class
					from
						a_parent_feature := current_feature.parent_feature
					until
						a_parent_feature = Void
					loop
						a_parent_type := a_parent_feature.parent.type
						if a_parent_type.base_class = a_class then
							a_precursor_feature := a_parent_feature.precursor_feature
							if an_effective /= Void then
								if not a_parent_feature.is_deferred then
									-- Note: use `same_version' to behave like ISE's implementation.
									-- if a_parent_feature.precursor_feature /= an_effective.precursor_feature then
									if not a_parent_feature.same_version (an_effective) then
										a_feature := current_feature.flattened_feature
										set_fatal_error
										error_handler.report_vdpr3a_error (current_class, a_precursor, a_feature, an_effective, a_parent_feature)
									end
								end
							elseif not a_parent_feature.is_deferred then
								an_effective := a_parent_feature
								a_precursor.precursor_keyword.set_seed (a_precursor_feature.first_seed)
								a_precursor.set_parent_type (a_parent_type)
							else
								a_deferred := a_parent_feature
							end
						end
						a_parent_feature := a_parent_feature.merged_feature
					end
					if an_effective = Void then
						if a_deferred /= Void then
							-- Note: follow ISE's behavior and do not take
							-- Undefine clauses into account.
							--a_feature := current_feature.flattened_feature
							--set_fatal_error
							--error_handler.report_vdpr3b_error (current_class, a_precursor, a_feature, a_deferred)
							from
								a_parent_feature := current_feature.parent_feature
							until
								a_parent_feature = Void
							loop
								a_parent_type := a_parent_feature.parent.type
								if a_parent_type.base_class = a_class then
									a_precursor_feature := a_parent_feature.precursor_feature
									if an_effective /= Void then
										if not a_precursor_feature.is_deferred then
											-- Note: use `same_version' to behave like ISE's implementation.
											-- if a_parent_feature.precursor_feature /= an_effective.precursor_feature then
											if not a_parent_feature.same_version (an_effective) then
												a_feature := current_feature.flattened_feature
												set_fatal_error
												error_handler.report_vdpr3a_error (current_class, a_precursor, a_feature, an_effective, a_parent_feature)
											end
										end
									elseif not a_precursor_feature.is_deferred then
										an_effective := a_parent_feature
										a_precursor.precursor_keyword.set_seed (a_precursor_feature.first_seed)
										a_precursor.set_parent_type (a_parent_type)
									end
								end
								a_parent_feature := a_parent_feature.merged_feature
							end
							if an_effective = Void then
								a_feature := current_feature.flattened_feature
								set_fatal_error
								error_handler.report_vdpr3b_error (current_class, a_precursor, a_feature, a_deferred)
							end
						else
							a_parents := current_class.parent_clause
							if a_parents = Void then
								if not a_class.is_any_class then
									set_fatal_error
									error_handler.report_vdpr2a_error (current_class, a_precursor)
								else
									a_feature := current_feature.flattened_feature
									set_fatal_error
									error_handler.report_vdpr3c_error (current_class, a_precursor, a_feature)
								end
							else
								nb := a_parents.count
								from i := 1 until i > nb loop
									if a_parents.parent (i).type.base_class = a_class then
										a_parent_found := True
										i := nb + 1 -- Jump out of the loop.
									else
										i := i + 1
									end
								end
								if a_parent_found then
									a_feature := current_feature.flattened_feature
									set_fatal_error
									error_handler.report_vdpr3c_error (current_class, a_precursor, a_feature)
								else
									set_fatal_error
									error_handler.report_vdpr2a_error (current_class, a_precursor)
								end
							end
						end
					end
				end
			else
				from
					a_parent_feature := current_feature.parent_feature
				until
					a_parent_feature = Void
				loop
					a_precursor_feature := a_parent_feature.precursor_feature
					if an_effective /= Void then
						if not a_parent_feature.is_deferred then
							-- Note: use `same_version' to behave like ISE's implementation.
							--a_parent_type := a_parent_feature.parent.type
							--a_class := a_parent_type.base_class
							--if a_class /= an_effective.parent.type.base_class then
							--	a_feature := current_feature.flattened_feature
							--	set_fatal_error
							--	error_handler.report_vdpr3a_error (current_class, a_precursor, a_feature, an_effective, a_parent_feature)
							--elseif a_precursor_feature /= an_effective.precursor_feature then
							if not a_parent_feature.same_version (an_effective) then
								a_feature := current_feature.flattened_feature
								set_fatal_error
								error_handler.report_vdpr3a_error (current_class, a_precursor, a_feature, an_effective, a_parent_feature)
							end
						end
					elseif not a_parent_feature.is_deferred then
						an_effective := a_parent_feature
						a_precursor.precursor_keyword.set_seed (a_precursor_feature.first_seed)
						a_precursor.set_parent_type (a_parent_feature.parent.type)
					else
						a_deferred := a_parent_feature
					end
					a_parent_feature := a_parent_feature.merged_feature
				end
				if an_effective = Void then
					if a_deferred /= Void then
						-- Note: follow ISE's behavior and do not take
						-- Undefine clauses into account.
						--a_feature := current_feature.flattened_feature
						--set_fatal_error
						--error_handler.report_vdpr3b_error (current_class, a_precursor, a_feature, a_deferred)
						from
							a_parent_feature := current_feature.parent_feature
						until
							a_parent_feature = Void
						loop
							a_precursor_feature := a_parent_feature.precursor_feature
							if an_effective /= Void then
								if not a_precursor_feature.is_deferred then
									-- Note: use `same_version' to behave like ISE's implementation.
									--a_parent_type := a_parent_feature.parent.type
									--a_class := a_parent.direct_base_class
									--if a_class /= an_effective.parent.type.base_class then
									--	a_feature := current_feature.flattened_feature
									--	set_fatal_error
									--	error_handler.report_vdpr3a_error (current_class, a_precursor, a_feature, an_effective, a_parent_feature)
									--elseif a_precursor_feature /= an_effective.precursor_feature then
									if not a_parent_feature.same_version (an_effective) then
										a_feature := current_feature.flattened_feature
										set_fatal_error
										error_handler.report_vdpr3a_error (current_class, a_precursor, a_feature, an_effective, a_parent_feature)
									end
								end
							elseif not a_precursor_feature.is_deferred then
								an_effective := a_parent_feature
								a_precursor.precursor_keyword.set_seed (a_precursor_feature.first_seed)
								a_precursor.set_parent_type (a_parent_feature.parent.type)
							end
							a_parent_feature := a_parent_feature.merged_feature
						end
						if an_effective = Void then
							a_feature := current_feature.flattened_feature
							set_fatal_error
							error_handler.report_vdpr3b_error (current_class, a_precursor, a_feature, a_deferred)
						end
					else
							-- Internal error: either `an_effective' or `a_deferred'
							-- should be non-void because `current_feature' has at least
							-- one parent feature.
						set_fatal_error
						error_handler.report_giaaa_error
					end
				end
			end
		end

feature {ET_AST_NODE} -- Processing

	process_actual_argument_list (a_list: ET_ACTUAL_ARGUMENT_LIST)
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.actual_argument (i).process (Current)
				i := i + 1
			end
		end

	process_agent_argument_operand_list (a_list: ET_AGENT_ARGUMENT_OPERAND_LIST)
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.actual_argument (i).process (Current)
				i := i + 1
			end
		end

	process_assigner_instruction (an_instruction: ET_ASSIGNER_INSTRUCTION)
			-- Process `an_instruction'.
		do
			an_instruction.call.process (Current)
			an_instruction.source.process (Current)
		end

	process_assignment (an_instruction: ET_ASSIGNMENT)
			-- Process `an_instruction'.
		do
			an_instruction.source.process (Current)
		end

	process_assignment_attempt (an_instruction: ET_ASSIGNMENT_ATTEMPT)
			-- Process `an_instruction'.
		do
			an_instruction.source.process (Current)
		end

	process_bang_instruction (an_instruction: ET_BANG_INSTRUCTION)
			-- Process `an_instruction'.
		local
			a_call: ET_QUALIFIED_CALL
			an_arguments: ET_ACTUAL_ARGUMENT_LIST
		do
			a_call := an_instruction.creation_call
			if a_call /= Void then
				an_arguments := a_call.arguments
				if an_arguments /= Void then
					process_actual_argument_list (an_arguments)
				end
			end
		end

	process_bracket_argument_list (a_list: ET_BRACKET_ARGUMENT_LIST)
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.actual_argument (i).process (Current)
				i := i + 1
			end
		end

	process_bracket_expression (an_expression: ET_BRACKET_EXPRESSION)
			-- Process `an_expression'.
		local
			l_arguments: ET_BRACKET_ARGUMENT_LIST
		do
			an_expression.target.process (Current)
			l_arguments := an_expression.arguments
			if l_arguments /= Void then
				l_arguments.process (Current)
			end
		end

	process_call_agent (an_expression: ET_CALL_AGENT)
			-- Process `an_expression'.
		local
			a_target: ET_AGENT_TARGET
			an_arguments: ET_AGENT_ARGUMENT_OPERAND_LIST
		do
			a_target := an_expression.target
			a_target.process (Current)
			an_arguments ?= an_expression.arguments
			if an_arguments /= Void then
				process_agent_argument_operand_list (an_arguments)
			end
		end

	process_call_expression (an_expression: ET_CALL_EXPRESSION)
			-- Process `an_expression'.
		local
			a_target: ET_EXPRESSION
			an_arguments: ET_ACTUAL_ARGUMENT_LIST
		do
			a_target := an_expression.target
			if a_target /= Void then
				a_target.process (Current)
			end
			an_arguments := an_expression.arguments
			if an_arguments /= Void then
				process_actual_argument_list (an_arguments)
			end
		end

	process_call_instruction (an_instruction: ET_CALL_INSTRUCTION)
			-- Process `an_instruction'.
		local
			a_target: ET_EXPRESSION
			an_arguments: ET_ACTUAL_ARGUMENT_LIST
		do
			a_target := an_instruction.target
			if a_target /= Void then
				a_target.process (Current)
			end
			an_arguments := an_instruction.arguments
			if an_arguments /= Void then
				process_actual_argument_list (an_arguments)
			end
		end

	process_check_instruction (an_instruction: ET_CHECK_INSTRUCTION)
			-- Process `an_instruction'.
		local
			i, nb: INTEGER
			l_compound: ET_COMPOUND
		do
			nb := an_instruction.count
			from i := 1 until i > nb loop
				an_instruction.assertion (i).process (Current)
				i := i + 1
			end
			l_compound := an_instruction.then_compound
			if l_compound /= Void then
				process_compound (l_compound)
			end
		end

	process_compound (a_list: ET_COMPOUND)
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.item (i).process (Current)
				i := i + 1
			end
		end

	process_convert_builtin_expression (a_convert_expression: ET_CONVERT_BUILTIN_EXPRESSION)
			-- Process `a_convert_expression'.
		do
			a_convert_expression.expression.process (Current)
		end

	process_convert_from_expression (a_convert_expression: ET_CONVERT_FROM_EXPRESSION)
			-- Process `a_convert_expression'.
		do
			a_convert_expression.expression.process (Current)
		end

	process_convert_to_expression (a_convert_expression: ET_CONVERT_TO_EXPRESSION)
			-- Process `a_convert_expression'.
		do
			a_convert_expression.expression.process (Current)
		end

	process_create_expression (an_expression: ET_CREATE_EXPRESSION)
			-- Process `an_expression'.
		local
			a_call: ET_QUALIFIED_CALL
			an_arguments: ET_ACTUAL_ARGUMENT_LIST
		do
			a_call := an_expression.creation_call
			if a_call /= Void then
				an_arguments := a_call.arguments
				if an_arguments /= Void then
					process_actual_argument_list (an_arguments)
				end
			end
		end

	process_create_instruction (an_instruction: ET_CREATE_INSTRUCTION)
			-- Process `an_instruction'.
		local
			a_call: ET_QUALIFIED_CALL
			an_arguments: ET_ACTUAL_ARGUMENT_LIST
		do
			a_call := an_instruction.creation_call
			if a_call /= Void then
				an_arguments := a_call.arguments
				if an_arguments /= Void then
					process_actual_argument_list (an_arguments)
				end
			end
		end

	process_debug_instruction (an_instruction: ET_DEBUG_INSTRUCTION)
			-- Process `an_instruction'.
		local
			a_compound: ET_COMPOUND
		do
			a_compound := an_instruction.compound
			if a_compound /= Void then
				process_compound (a_compound)
			end
		end

	process_do_function (a_feature: ET_DO_FUNCTION)
			-- Process `a_feature'.
		local
			a_compound: ET_COMPOUND
		do
			a_compound := a_feature.compound
			if a_compound /= Void then
				process_compound (a_compound)
			end
		end

	process_do_function_inline_agent (an_expression: ET_DO_FUNCTION_INLINE_AGENT)
			-- Process `an_expression'.
		local
			an_arguments: ET_AGENT_ARGUMENT_OPERAND_LIST
		do
			an_arguments ?= an_expression.actual_arguments
			if an_arguments /= Void then
				process_agent_argument_operand_list (an_arguments)
			end
		end

	process_do_procedure (a_feature: ET_DO_PROCEDURE)
			-- Process `a_feature'.
		local
			a_compound: ET_COMPOUND
		do
			a_compound := a_feature.compound
			if a_compound /= Void then
				process_compound (a_compound)
			end
		end

	process_do_procedure_inline_agent (an_expression: ET_DO_PROCEDURE_INLINE_AGENT)
			-- Process `an_expression'.
		local
			an_arguments: ET_AGENT_ARGUMENT_OPERAND_LIST
		do
			an_arguments ?= an_expression.actual_arguments
			if an_arguments /= Void then
				process_agent_argument_operand_list (an_arguments)
			end
		end

	process_elseif_part (an_elseif_part: ET_ELSEIF_PART)
			-- Process `an_elseif_part'.
		local
			a_compound: ET_COMPOUND
		do
			an_elseif_part.expression.process (Current)
			a_compound := an_elseif_part.then_compound
			if a_compound /= Void then
				process_compound (a_compound)
			end
		end

	process_elseif_part_list (a_list: ET_ELSEIF_PART_LIST)
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.item (i).process (Current)
				i := i + 1
			end
		end

	process_equality_expression (an_expression: ET_EQUALITY_EXPRESSION)
			-- Process `an_expression'.
		do
			an_expression.left.process (Current)
			an_expression.right.process (Current)
		end

	process_expression_address (an_expression: ET_EXPRESSION_ADDRESS)
			-- Process `an_expression'.
		do
			an_expression.expression.process (Current)
		end

	process_external_function_inline_agent (an_expression: ET_EXTERNAL_FUNCTION_INLINE_AGENT)
			-- Process `an_expression'.
		local
			an_arguments: ET_AGENT_ARGUMENT_OPERAND_LIST
		do
			an_arguments ?= an_expression.actual_arguments
			if an_arguments /= Void then
				process_agent_argument_operand_list (an_arguments)
			end
		end

	process_external_procedure_inline_agent (an_expression: ET_EXTERNAL_PROCEDURE_INLINE_AGENT)
			-- Process `an_expression'.
		local
			an_arguments: ET_AGENT_ARGUMENT_OPERAND_LIST
		do
			an_arguments ?= an_expression.actual_arguments
			if an_arguments /= Void then
				process_agent_argument_operand_list (an_arguments)
			end
		end

	process_if_instruction (an_instruction: ET_IF_INSTRUCTION)
			-- Process `an_instruction'.
		local
			an_elseif_parts: ET_ELSEIF_PART_LIST
			a_compound: ET_COMPOUND
		do
			an_instruction.expression.process (Current)
			a_compound := an_instruction.then_compound
			if a_compound /= Void then
				process_compound (a_compound)
			end
			an_elseif_parts := an_instruction.elseif_parts
			if an_elseif_parts /= Void then
				process_elseif_part_list (an_elseif_parts)
			end
			a_compound := an_instruction.else_compound
			if a_compound /= Void then
				process_compound (a_compound)
			end
		end

	process_infix_expression (an_expression: ET_INFIX_EXPRESSION)
			-- Process `an_expression'.
		do
			an_expression.left.process (Current)
			an_expression.right.process (Current)
		end

	process_inspect_instruction (an_instruction: ET_INSPECT_INSTRUCTION)
			-- Process `an_instruction'.
		local
			a_when_parts: ET_WHEN_PART_LIST
			an_else_compound: ET_COMPOUND
		do
			an_instruction.expression.process (Current)
			a_when_parts := an_instruction.when_parts
			if a_when_parts /= Void then
				process_when_part_list (a_when_parts)
			end
			an_else_compound := an_instruction.else_compound
			if an_else_compound /= Void then
				process_compound (an_else_compound)
			end
		end

	process_loop_instruction (an_instruction: ET_LOOP_INSTRUCTION)
			-- Process `an_instruction'.
		local
			an_invariant_part: ET_LOOP_INVARIANTS
			a_variant_part: ET_VARIANT
			a_compound: ET_COMPOUND
		do
			a_compound := an_instruction.from_compound
			if a_compound /= Void then
				process_compound (a_compound)
			end
			an_invariant_part := an_instruction.invariant_part
			if an_invariant_part /= Void then
				process_loop_invariants (an_invariant_part)
			end
			an_instruction.until_expression.process (Current)
			a_compound := an_instruction.loop_compound
			if a_compound /= Void then
				process_compound (a_compound)
			end
			a_variant_part := an_instruction.variant_part
			if a_variant_part /= Void then
				a_variant_part.expression.process (Current)
			end
		end

	process_loop_invariants (a_list: ET_LOOP_INVARIANTS)
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.assertion (i).process (Current)
				i := i + 1
			end
		end

	process_manifest_array (an_expression: ET_MANIFEST_ARRAY)
			-- Process `an_expression'.
		local
			i, nb: INTEGER
		do
			nb := an_expression.count
			from i := 1 until i > nb loop
				an_expression.expression (i).process (Current)
				i := i + 1
			end
		end

	process_manifest_tuple (an_expression: ET_MANIFEST_TUPLE)
			-- Process `an_expression'.
		local
			i, nb: INTEGER
		do
			nb := an_expression.count
			from i := 1 until i > nb loop
				an_expression.expression (i).process (Current)
				i := i + 1
			end
		end

	process_named_object_test (an_expression: ET_NAMED_OBJECT_TEST)
			-- Process `an_expression'.
		do
			an_expression.expression.process (Current)
		end

	process_object_equality_expression (an_expression: ET_OBJECT_EQUALITY_EXPRESSION)
			-- Process `an_expression'.
		do
			an_expression.left.process (Current)
			an_expression.right.process (Current)
		end

	process_object_test (an_expression: ET_OBJECT_TEST)
			-- Process `an_expression'.
		do
			an_expression.expression.process (Current)
		end

	process_old_object_test (an_expression: ET_OLD_OBJECT_TEST)
			-- Process `an_expression'.
		do
			an_expression.expression.process (Current)
		end

	process_once_function (a_feature: ET_ONCE_FUNCTION)
			-- Process `a_feature'.
		local
			a_compound: ET_COMPOUND
		do
			a_compound := a_feature.compound
			if a_compound /= Void then
				process_compound (a_compound)
			end
		end

	process_once_function_inline_agent (an_expression: ET_ONCE_FUNCTION_INLINE_AGENT)
			-- Process `an_expression'.
		local
			an_arguments: ET_AGENT_ARGUMENT_OPERAND_LIST
		do
			an_arguments ?= an_expression.actual_arguments
			if an_arguments /= Void then
				process_agent_argument_operand_list (an_arguments)
			end
		end

	process_once_procedure (a_feature: ET_ONCE_PROCEDURE)
			-- Process `a_feature'.
		local
			a_compound: ET_COMPOUND
		do
			a_compound := a_feature.compound
			if a_compound /= Void then
				process_compound (a_compound)
			end
		end

	process_once_procedure_inline_agent (an_expression: ET_ONCE_PROCEDURE_INLINE_AGENT)
			-- Process `an_expression'.
		local
			an_arguments: ET_AGENT_ARGUMENT_OPERAND_LIST
		do
			an_arguments ?= an_expression.actual_arguments
			if an_arguments /= Void then
				process_agent_argument_operand_list (an_arguments)
			end
		end

	process_parenthesized_expression (an_expression: ET_PARENTHESIZED_EXPRESSION)
			-- Process `an_expression'.
		do
			an_expression.expression.process (Current)
		end

	process_precursor_expression (an_expression: ET_PRECURSOR_EXPRESSION)
			-- Process `an_expression'.
		local
			an_arguments: ET_ACTUAL_ARGUMENT_LIST
		do
			check_precursor_validity (an_expression)
			an_arguments := an_expression.arguments
			if an_arguments /= Void then
				process_actual_argument_list (an_arguments)
			end
		end

	process_precursor_instruction (an_instruction: ET_PRECURSOR_INSTRUCTION)
			-- Process `an_instruction'.
		local
			an_arguments: ET_ACTUAL_ARGUMENT_LIST
		do
			check_precursor_validity (an_instruction)
			an_arguments := an_instruction.arguments
			if an_arguments /= Void then
				process_actual_argument_list (an_arguments)
			end
		end

	process_prefix_expression (an_expression: ET_PREFIX_EXPRESSION)
			-- Process `an_expression'.
		do
			an_expression.expression.process (Current)
		end

	process_static_call_expression (an_expression: ET_STATIC_CALL_EXPRESSION)
			-- Process `an_expression'.
		local
			an_arguments: ET_ACTUAL_ARGUMENT_LIST
		do
			an_arguments := an_expression.arguments
			if an_arguments /= Void then
				process_actual_argument_list (an_arguments)
			end
		end

	process_static_call_instruction (an_instruction: ET_STATIC_CALL_INSTRUCTION)
			-- Process `an_instruction'.
		local
			an_arguments: ET_ACTUAL_ARGUMENT_LIST
		do
			an_arguments := an_instruction.arguments
			if an_arguments /= Void then
				process_actual_argument_list (an_arguments)
			end
		end

	process_tagged_assertion (an_assertion: ET_TAGGED_ASSERTION)
			-- Process `an_assertion'.
		local
			an_expression: ET_EXPRESSION
		do
			an_expression := an_assertion.expression
			if an_expression /= Void then
				an_expression.process (Current)
			end
		end

	process_when_part (a_when_part: ET_WHEN_PART)
			-- Process `a_when_part'.
		local
			a_compound: ET_COMPOUND
		do
			a_compound := a_when_part.then_compound
			if a_compound /= Void then
				process_compound (a_compound)
			end
		end

	process_when_part_list (a_list: ET_WHEN_PART_LIST)
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			nb := a_list.count
			from i := 1 until i > nb loop
				process_when_part (a_list.item (i))
				i := i + 1
			end
		end

feature {NONE} -- Access

	current_feature: ET_REDECLARED_FEATURE
			-- Feature being processed

feature {NONE} -- Implementation

	dummy_feature: ET_REDECLARED_FEATURE
			-- Dummy feature
		local
			a_name: ET_FEATURE_NAME
			a_feature: ET_FEATURE
			a_parent_feature: ET_PARENT_FEATURE
		once
			create {ET_IDENTIFIER} a_name.make ("**dummy**")
			create {ET_DEFERRED_PROCEDURE} a_feature.make (a_name, Void, current_class)
			create a_parent_feature.make (a_feature, current_system.any_parent)
			create Result.make (a_feature, a_parent_feature)
		ensure
			dummy_feature_not_void: Result /= Void
		end

invariant

	current_feature_not_void: current_feature /= Void

end
