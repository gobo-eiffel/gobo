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
		do
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
				internal_call := False
				i := i + 1
			end
			current_class := old_class
			current_feature := old_feature
			current_instruction := old_instruction
		end

feature {NONE} -- Access

	current_instruction: ET_INSTRUCTION
			-- Instruction being processed

	current_feature: ET_FEATURE
			-- Feature to which `current_instruction' belongs

	current_class: ET_CLASS
			-- Class to with `current_feature' belongs

	expression_checker: ET_EXPRESSION_CHECKER
			-- Expression validity checker

feature {NONE} -- Instruction validity

	check_assignment_validity (an_instruction: ET_ASSIGNMENT) is
			-- Check validity of `an_instruction'.
		require
			an_instruction_not_void: an_instruction /= Void
		do
			an_instruction.target.process (Current)
			an_instruction.source.process (Current)
		end

	check_assignment_attempt_validity (an_instruction: ET_ASSIGNMENT_ATTEMPT) is
			-- Check validity of `an_instruction'.
		require
			an_instruction_not_void: an_instruction /= Void
		do
			an_instruction.target.process (Current)
			an_instruction.source.process (Current)
		end

	check_bang_instruction_validity (an_instruction: ET_BANG_INSTRUCTION) is
			-- Check validity of `an_instruction'.
		require
			an_instruction_not_void: an_instruction /= Void
		local
			a_type: ET_TYPE
			a_call: ET_QUALIFIED_CALL
		do
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
		local
			a_target: ET_EXPRESSION
			an_arguments: ET_ACTUAL_ARGUMENT_LIST
		do
			a_target := an_instruction.target
			if a_target /= Void then
				a_target.process (Current)
			end
			an_instruction.qualified_name.process (Current)
			an_arguments := an_instruction.arguments
			if an_arguments /= Void then
				an_arguments.process (Current)
			end
		end

	check_check_instruction_validity (an_instruction: ET_CHECK_INSTRUCTION) is
			-- Check validity of `an_instruction'.
		require
			an_instruction_not_void: an_instruction /= Void
		local
			i, nb: INTEGER
		do
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

			a_keys: ET_MANIFEST_STRING_LIST
		do
			a_compound := an_instruction.compound
			if a_compound /= Void then
				check_instructions_validity (a_compound, current_feature, current_class)
			end



			a_keys := an_instruction.keys
			if a_keys /= Void then
				a_keys.process (Current)
			end
		end

	check_if_instruction_validity (an_instruction: ET_IF_INSTRUCTION) is
			-- Check validity of `an_instruction'.
		require
			an_instruction_not_void: an_instruction /= Void
		local
			a_compound: ET_COMPOUND

			an_elseif_parts: ET_ELSEIF_PART_LIST
		do
			a_compound := an_instruction.then_compound
			if a_compound /= Void then
				check_instructions_validity (a_compound, current_feature, current_class)
			end
			a_compound := an_instruction.else_compound
			if a_compound /= Void then
				check_instructions_validity (a_compound, current_feature, current_class)
			end


			an_instruction.conditional.process (Current)
			an_elseif_parts := an_instruction.elseif_parts
			if an_elseif_parts /= Void then
				an_elseif_parts.process (Current)
			end
		end

	check_inspect_instruction_validity (an_instruction: ET_INSPECT_INSTRUCTION) is
			-- Check validity of `an_instruction'.
		require
			an_instruction_not_void: an_instruction /= Void
		local
			an_else_compound: ET_COMPOUND

			a_when_parts: ET_WHEN_PART_LIST
		do
			an_else_compound := an_instruction.else_compound
			if an_else_compound /= Void then
				check_instructions_validity (an_else_compound, current_feature, current_class)
			end

			an_instruction.conditional.process (Current)
			a_when_parts := an_instruction.when_parts
			if a_when_parts /= Void then
				a_when_parts.process (Current)
			end
		end

	check_loop_instruction_validity (an_instruction: ET_LOOP_INSTRUCTION) is
			-- Check validity of `an_instruction'.
		require
			an_instruction_not_void: an_instruction /= Void
		local
			a_compound: ET_COMPOUND

			an_invariant_part: ET_INVARIANTS
			a_variant_part: ET_VARIANT
		do
			a_compound := an_instruction.from_compound
			if a_compound /= Void then
				check_instructions_validity (a_compound, current_feature, current_class)
			end
			a_compound := an_instruction.loop_compound
			if a_compound /= Void then
				check_instructions_validity (a_compound, current_feature, current_class)
			end

			an_invariant_part := an_instruction.invariant_part
			if an_invariant_part /= Void then
				an_invariant_part.process (Current)
			end
			a_variant_part := an_instruction.variant_part
			if a_variant_part /= Void then
				a_variant_part.process (Current)
			end
			an_instruction.until_conditional.process (Current)
		end

	check_precursor_instruction_validity (an_instruction: ET_PRECURSOR_INSTRUCTION) is
			-- Check validity of `an_instruction'.
		require
			an_instruction_not_void: an_instruction /= Void
		local
			a_parent: ET_PRECURSOR_CLASS_NAME
			an_arguments: ET_ACTUAL_ARGUMENT_LIST
		do
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
		end

	check_static_call_instruction_validity (an_instruction: ET_STATIC_CALL_INSTRUCTION) is
			-- Check validity of `an_instruction'.
		require
			an_instruction_not_void: an_instruction /= Void
		local
			an_arguments: ET_ACTUAL_ARGUMENT_LIST
		do
			an_instruction.static_type.process (Current)
			an_instruction.qualified_name.process (Current)
			an_arguments := an_instruction.arguments
			if an_arguments /= Void then
				an_arguments.process (Current)
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

end
