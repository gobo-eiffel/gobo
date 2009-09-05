indexing

	description:

		"Eiffel system class markers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004-2009, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_SYSTEM_MARKER

inherit

	ET_AST_NULL_PROCESSOR
		rename
			make as make_null
		redefine
			process_actual_parameter_list,
			process_agent_argument_operand_list,
			process_agent_typed_open_argument,
			process_agent_open_target,
			process_assigner_instruction,
			process_assignment,
			process_assignment_attempt,
			process_attribute,
			process_bang_instruction,
			process_binary_integer_constant,
			process_braced_type_list,
			process_bracket_expression,
			process_c1_character_constant,
			process_c2_character_constant,
			process_c3_character_constant,
			process_call_agent,
			process_call_expression,
			process_call_instruction,
			process_check_instruction,
			process_choice_list,
			process_choice_range,
			process_class,
			process_class_type,
			process_compound,
			process_constant_attribute,
			process_constrained_formal_parameter,
			process_convert_builtin_expression,
			process_convert_feature_list,
			process_convert_function,
			process_convert_from_expression,
			process_convert_procedure,
			process_convert_to_expression,
			process_create_expression,
			process_create_instruction,
			process_debug_instruction,
			process_deferred_function,
			process_deferred_procedure,
			process_do_function,
			process_do_function_inline_agent,
			process_do_procedure,
			process_do_procedure_inline_agent,
			process_dotnet_attribute,
			process_dotnet_constant_attribute,
			process_dotnet_function,
			process_dotnet_procedure,
			process_elseif_part,
			process_elseif_part_list,
			process_equality_expression,
			process_expression_address,
			process_external_function,
			process_external_function_inline_agent,
			process_external_procedure,
			process_external_procedure_inline_agent,
			process_formal_argument,
			process_formal_argument_list,
			process_formal_parameter_list,
			process_generic_class_type,
			process_hexadecimal_integer_constant,
			process_if_instruction,
			process_infix_cast_expression,
			process_infix_expression,
			process_inspect_instruction,
			process_invariants,
			process_local_variable,
			process_local_variable_list,
			process_loop_instruction,
			process_loop_invariants,
			process_manifest_array,
			process_manifest_tuple,
			process_manifest_type,
			process_named_object_test,
			process_object_equality_expression,
			process_object_test,
			process_octal_integer_constant,
			process_old_expression,
			process_old_object_test,
			process_once_function,
			process_once_function_inline_agent,
			process_once_manifest_string,
			process_once_procedure,
			process_once_procedure_inline_agent,
			process_parent,
			process_parenthesized_expression,
			process_parent_list,
			process_postconditions,
			process_preconditions,
			process_precursor_expression,
			process_precursor_instruction,
			process_prefix_expression,
			process_qualified_like_braced_type,
			process_qualified_like_type,
			process_regular_integer_constant,
			process_regular_manifest_string,
			process_regular_real_constant,
			process_special_manifest_string,
			process_static_call_expression,
			process_static_call_instruction,
			process_tagged_assertion,
			process_tuple_type,
			process_underscored_integer_constant,
			process_underscored_real_constant,
			process_unique_attribute,
			process_variant,
			process_verbatim_string,
			process_when_part,
			process_when_part_list
		end

create

	make

feature {NONE} -- Initialization

	make (a_system: ET_SYSTEM) is
			-- Create a new system marker for `a_system'.
		require
			a_system_not_void: a_system /= Void
		do
			current_system := a_system
		ensure
			current_system_set: current_system = a_system
		end

feature -- Access

	current_system: ET_SYSTEM
			-- Surrounding Eiffel system
			-- (Note: there is a frozen feature called `system' in
			-- class GENERAL of SmartEiffel 1.0)

feature -- Processing

	mark_system (a_class: ET_CLASS) is
			-- Identify the classes that `a_class' recursively depends on
			-- (see definition in ETL page 35) and mark them as being part
			-- of the system. Mark `a_class' as well.
		require
			a_class_not_void: a_class /= Void
		do
			unmark_all
			mark_system_no_unmark (a_class)
		ensure
			a_class_in_system: a_class.in_system
		end

	mark_system_no_unmark (a_class: ET_CLASS) is
			-- Identify the classes that `a_class' recursively depends on
			-- (see definition in ETL page 35) and mark them as being part
			-- of the system. Mark `a_class' as well. (Do not call `unmark_all'
			-- before marking the classes.)
		require
			a_class_not_void: a_class /= Void
		do
			is_recursive := True
			a_class.set_in_system (True)
			process_class (a_class)
		ensure
			a_class_in_system: a_class.in_system
		end

	mark_shallow (a_class: ET_CLASS) is
			-- Identify the classes that `a_class' directly depends on
			-- (see definition in ETL page 35) and mark them as being part
			-- of the system. Do not mark `a_class' if it does not
			-- directly depend on itself.
		require
			a_class_not_void: a_class /= Void
		do
			unmark_all
			mark_shallow_no_unmark (a_class)
		end

	mark_shallow_no_unmark (a_class: ET_CLASS) is
			-- Identify the classes that `a_class' directly depends on
			-- (see definition in ETL page 35) and mark them as being part
			-- of the system. Do not mark `a_class' if it does not
			-- directly depend on itself. (Do not call `unmark_all'
			-- before marking the classes.)
		require
			a_class_not_void: a_class /= Void
		do
			is_recursive := False
			process_class (a_class)
		end

	unmark_all is
			-- Unmark all classes of `current_system' as if none of them
			-- was in the system.
		do
			current_system.classes_do_recursive (agent {ET_CLASS}.set_in_system (False))
		end

feature {ET_AST_NODE} -- Processing

	process_actual_arguments (a_list: ET_ACTUAL_ARGUMENTS) is
			-- Process `a_list'.
		require
			a_list_not_void: a_list /= Void
		local
			i, nb: INTEGER
		do
			nb := a_list.count
			from i := 1 until i > nb loop
				process_expression (a_list.actual_argument (i))
				i := i + 1
			end
		end

	process_actual_parameter_list (a_list: ET_ACTUAL_PARAMETER_LIST) is
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			nb := a_list.count
			from i := 1 until i > nb loop
				process_type (a_list.type (i))
				i := i + 1
			end
		end

	process_agent_argument_operand_list (a_list: ET_AGENT_ARGUMENT_OPERAND_LIST) is
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

	process_agent_open_target (a_target: ET_AGENT_OPEN_TARGET) is
			-- Process `a_target'.
		do
			process_type (a_target.type)
		end

	process_agent_typed_open_argument (an_argument: ET_AGENT_TYPED_OPEN_ARGUMENT) is
			-- Process `an_argument'.
		do
			process_type (an_argument.type)
		end

	process_assertion (an_assertion: ET_ASSERTION) is
			-- Process `an_assertion'.
		require
			an_assertion_not_void: an_assertion /= Void
		do
			an_assertion.process (Current)
		end

	process_assertions (a_list: ET_ASSERTIONS) is
			-- Process `a_list'.
		require
			a_list_not_void: a_list /= Void
		local
			i, nb: INTEGER
		do
			nb := a_list.count
			from i := 1 until i > nb loop
				process_assertion (a_list.assertion (i))
				i := i + 1
			end
		end

	process_assigner_instruction (an_instruction: ET_ASSIGNER_INSTRUCTION) is
			-- Process `an_instruction'.
		do
			process_feature_call (an_instruction.call)
			process_expression (an_instruction.source)
		end

	process_assignment (an_instruction: ET_ASSIGNMENT) is
			-- Process `an_instruction'.
		do
			process_expression (an_instruction.source)
		end

	process_assignment_attempt (an_instruction: ET_ASSIGNMENT_ATTEMPT) is
			-- Process `an_instruction'.
		do
			process_expression (an_instruction.source)
		end

	process_attribute (a_feature: ET_ATTRIBUTE) is
			-- Process `a_feature'.
		do
			process_type (a_feature.type)
		end

	process_bang_instruction (an_instruction: ET_BANG_INSTRUCTION) is
			-- Process `an_instruction'.
		do
			process_creation_instruction (an_instruction)
		end

	process_binary_integer_constant (a_constant: ET_BINARY_INTEGER_CONSTANT) is
			-- Process `a_constant'.
		do
			process_integer_constant (a_constant)
		end

	process_braced_type_list (a_list: ET_BRACED_TYPE_LIST) is
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			nb := a_list.count
			from i := 1 until i > nb loop
				process_type (a_list.type (i))
				i := i + 1
			end
		end

	process_bracket_expression (an_expression: ET_BRACKET_EXPRESSION) is
			-- Process `an_expression'.
		do
			process_feature_call (an_expression)
		end

	process_c1_character_constant (a_constant: ET_C1_CHARACTER_CONSTANT) is
			-- Process `a_constant'.
		do
			process_character_constant (a_constant)
		end

	process_c2_character_constant (a_constant: ET_C2_CHARACTER_CONSTANT) is
			-- Process `a_constant'.
		do
			process_character_constant (a_constant)
		end

	process_c3_character_constant (a_constant: ET_C3_CHARACTER_CONSTANT) is
			-- Process `a_constant'.
		do
			process_character_constant (a_constant)
		end

	process_call_agent (an_expression: ET_CALL_AGENT) is
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

	process_call_expression (an_expression: ET_CALL_EXPRESSION) is
			-- Process `an_expression'.
		do
			process_feature_call (an_expression)
		end

	process_call_instruction (an_instruction: ET_CALL_INSTRUCTION) is
			-- Process `an_instruction'.
		do
			process_feature_call (an_instruction)
		end

	process_character_constant (a_constant: ET_CHARACTER_CONSTANT) is
			-- Process `a_constant'.
		require
			a_constant_not_void: a_constant /= Void
		local
			a_type: ET_TARGET_TYPE
		do
			a_type := a_constant.cast_type
			if a_type /= Void then
				process_type (a_type.type)
			end
		end

	process_check_instruction (an_instruction: ET_CHECK_INSTRUCTION) is
			-- Process `an_instruction'.
		do
			process_assertions (an_instruction)
		end

	process_choice_list (a_list: ET_CHOICE_LIST) is
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.choice (i).process (Current)
				i := i + 1
			end
		end

	process_choice_range (a_choice: ET_CHOICE_RANGE) is
			-- Process `a_choice'.
		do
			process_expression (a_choice.lower)
			process_expression (a_choice.upper)
		end

	process_class (a_class: ET_CLASS) is
			-- Process `a_class'.
		local
			a_formal_parameters: ET_FORMAL_PARAMETER_LIST
			a_parents: ET_PARENT_LIST
			a_convert_features: ET_CONVERT_FEATURE_LIST
			an_invariants: ET_INVARIANTS
			a_providers: DS_HASH_SET [ET_NAMED_CLASS]
			a_cursor: DS_HASH_SET_CURSOR [ET_NAMED_CLASS]
			a_provider: ET_CLASS
		do
			a_providers := a_class.providers
			if a_providers /= Void then
				a_cursor := a_providers.new_cursor
				from a_cursor.start until a_cursor.after loop
					a_provider := a_cursor.item.actual_class
					if not a_provider.in_system then
						a_provider.set_in_system (True)
						if is_recursive then
							process_class (a_provider)
						end
					end
					a_cursor.forth
				end
			else
				a_formal_parameters := a_class.formal_parameters
				if a_formal_parameters /= Void then
					process_formal_parameter_list (a_formal_parameters)
				end
				a_parents := a_class.parent_clause
				if a_parents /= Void then
					process_parent_list (a_parents)
				end
				a_convert_features := a_class.convert_features
				if a_convert_features /= Void then
					process_convert_feature_list (a_convert_features)
				end
				process_features (a_class)
				an_invariants := a_class.invariants
				if an_invariants /= Void then
					process_invariants (an_invariants)
				end
			end
		end

	process_class_type (a_type: ET_CLASS_TYPE) is
			-- Process `a_type'.
		local
			a_class: ET_CLASS
		do
			a_class := a_type.base_class
			if not a_class.in_system then
				a_class.set_in_system (True)
				if is_recursive then
					process_class (a_class)
				end
			end
		end

	process_compound (a_list: ET_COMPOUND) is
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

	process_constant_attribute (a_feature: ET_CONSTANT_ATTRIBUTE) is
			-- Process `a_feature'.
		do
			process_type (a_feature.type)
				-- The constant can be prefixed by its type.
			a_feature.constant.process (Current)
		end

	process_constrained_formal_parameter (a_parameter: ET_CONSTRAINED_FORMAL_PARAMETER) is
			-- Process `a_parameter'.
		do
			process_type  (a_parameter.constraint)
		end

	process_convert_builtin_expression (an_expression: ET_CONVERT_BUILTIN_EXPRESSION) is
			-- Process `an_expression'.
		do
			process_expression (an_expression.expression)
		end

	process_convert_feature_list (a_list: ET_CONVERT_FEATURE_LIST) is
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.convert_feature (i).process (Current)
				i := i + 1
			end
		end

	process_convert_function (a_convert_function: ET_CONVERT_FUNCTION) is
			-- Process `a_convert_function'.
		do
			a_convert_function.types.process (Current)
		end

	process_convert_from_expression (an_expression: ET_CONVERT_FROM_EXPRESSION) is
			-- Process `an_expression'.
		do
			process_expression (an_expression.expression)
		end

	process_convert_procedure (a_convert_procedure: ET_CONVERT_PROCEDURE) is
			-- Process `a_convert_procedure'.
		do
			a_convert_procedure.types.process (Current)
		end

	process_convert_to_expression (an_expression: ET_CONVERT_TO_EXPRESSION) is
			-- Process `an_expression'.
		do
			process_expression (an_expression.expression)
		end

	process_create_expression (an_expression: ET_CREATE_EXPRESSION) is
			-- Process `an_expression'.
		local
			a_call: ET_QUALIFIED_CALL
			an_arguments: ET_ACTUAL_ARGUMENT_LIST
		do
			process_type (an_expression.type)
			a_call := an_expression.creation_call
			if a_call /= Void then
				an_arguments := a_call.arguments
				if an_arguments /= Void then
					process_actual_arguments (an_arguments)
				end
			end
		end

	process_create_instruction (an_instruction: ET_CREATE_INSTRUCTION) is
			-- Process `an_instruction'.
		do
			process_creation_instruction (an_instruction)
		end

	process_creation_instruction (an_instruction: ET_CREATION_INSTRUCTION) is
			-- Process `an_instruction'.
		require
			an_instruction_not_void: an_instruction /= Void
		local
			a_type: ET_TYPE
			a_call: ET_QUALIFIED_CALL
			an_arguments: ET_ACTUAL_ARGUMENT_LIST
		do
			a_type := an_instruction.type
			if a_type /= Void then
				process_type (a_type)
			end
			a_call := an_instruction.creation_call
			if a_call /= Void then
				an_arguments := a_call.arguments
				if an_arguments /= Void then
					process_actual_arguments (an_arguments)
				end
			end
		end

	process_debug_instruction (an_instruction: ET_DEBUG_INSTRUCTION) is
			-- Process `an_instruction'.
		local
			a_compound: ET_COMPOUND
		do
			a_compound := an_instruction.compound
			if a_compound /= Void then
				process_compound (a_compound)
			end
		end

	process_deferred_function (a_feature: ET_DEFERRED_FUNCTION) is
			-- Process `a_feature'.
		do
			process_deferred_routine (a_feature)
		end

	process_deferred_procedure (a_feature: ET_DEFERRED_PROCEDURE) is
			-- Process `a_feature'.
		do
			process_deferred_routine (a_feature)
		end

	process_deferred_routine (a_feature: ET_DEFERRED_ROUTINE) is
			-- Process `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		local
			an_arguments: ET_FORMAL_ARGUMENT_LIST
			a_preconditions: ET_PRECONDITIONS
			a_postconditions: ET_POSTCONDITIONS
			a_type: ET_TYPE
		do
			an_arguments := a_feature.arguments
			if an_arguments /= Void then
				process_formal_argument_list (an_arguments)
			end
			a_type := a_feature.type
			if a_type /= Void then
				process_type (a_type)
			end
			a_preconditions := a_feature.preconditions
			if a_preconditions /= Void then
				process_preconditions (a_preconditions)
			end
			a_postconditions := a_feature.postconditions
			if a_postconditions /= Void then
				process_postconditions (a_postconditions)
			end
		end

	process_do_function (a_feature: ET_DO_FUNCTION) is
			-- Process `a_feature'.
		do
			process_internal_routine (a_feature)
		end

	process_do_function_inline_agent (an_expression: ET_DO_FUNCTION_INLINE_AGENT) is
			-- Process `an_expression'.
		do
			process_internal_routine_inline_agent (an_expression)
		end

	process_do_procedure (a_feature: ET_DO_PROCEDURE) is
			-- Process `a_feature'.
		do
			process_internal_routine (a_feature)
		end

	process_do_procedure_inline_agent (an_expression: ET_DO_PROCEDURE_INLINE_AGENT) is
			-- Process `an_expression'.
		do
			process_internal_routine_inline_agent (an_expression)
		end

	process_dotnet_attribute (a_feature: ET_DOTNET_ATTRIBUTE) is
			-- Process `a_feature'.
		do
			process_attribute (a_feature)
		end

	process_dotnet_constant_attribute (a_feature: ET_DOTNET_CONSTANT_ATTRIBUTE) is
			-- Process `a_feature'.
		do
			process_constant_attribute (a_feature)
		end

	process_dotnet_function (a_feature: ET_DOTNET_FUNCTION) is
			-- Process `a_feature'.
		local
			an_arguments: ET_FORMAL_ARGUMENT_LIST
		do
			an_arguments := a_feature.arguments
			if an_arguments /= Void then
				process_formal_argument_list (an_arguments)
			end
			process_type (a_feature.type)
		end

	process_dotnet_procedure (a_feature: ET_DOTNET_PROCEDURE) is
			-- Process `a_feature'.
		local
			an_arguments: ET_FORMAL_ARGUMENT_LIST
		do
			an_arguments := a_feature.arguments
			if an_arguments /= Void then
				process_formal_argument_list (an_arguments)
			end
		end

	process_elseif_part (an_elseif_part: ET_ELSEIF_PART) is
			-- Process `an_elseif_part'.
		local
			a_compound: ET_COMPOUND
		do
			process_expression (an_elseif_part.expression)
			a_compound := an_elseif_part.then_compound
			if a_compound /= Void then
				process_compound (a_compound)
			end
		end

	process_elseif_part_list (a_list: ET_ELSEIF_PART_LIST) is
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			nb := a_list.count
			from i := 1 until i > nb loop
				process_elseif_part (a_list.item (i))
				i := i + 1
			end
		end

	process_equality_expression (an_expression: ET_EQUALITY_EXPRESSION) is
			-- Process `an_expression'.
		do
			process_expression (an_expression.left)
			process_expression (an_expression.right)
		end

	process_expression (a_expression: ET_EXPRESSION) is
			-- Process `a_expression'.
		require
			a_expression_not_void: a_expression /= Void
		do
			a_expression.process (Current)
		end

	process_expression_address (an_expression: ET_EXPRESSION_ADDRESS) is
			-- Process `an_expression'.
		do
			process_expression (an_expression.expression)
		end

	process_expression_list (a_list: ET_EXPRESSION_LIST) is
			-- Process `a_list'.
		require
			a_list_not_void: a_list /= Void
		local
			i, nb: INTEGER
		do
			nb := a_list.count
			from i := 1 until i > nb loop
				process_expression (a_list.expression (i))
				i := i + 1
			end
		end

	process_external_function (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Process `a_feature'.
		do
			process_external_routine (a_feature)
		end

	process_external_function_inline_agent (an_expression: ET_EXTERNAL_FUNCTION_INLINE_AGENT) is
			-- Process `an_expression'.
		do
			process_external_routine_inline_agent (an_expression)
		end

	process_external_procedure (a_feature: ET_EXTERNAL_PROCEDURE) is
			-- Process `a_feature'.
		do
			process_external_routine (a_feature)
		end

	process_external_procedure_inline_agent (an_expression: ET_EXTERNAL_PROCEDURE_INLINE_AGENT) is
			-- Process `an_expression'.
		do
			process_external_routine_inline_agent (an_expression)
		end

	process_external_routine (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Process `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		do
			process_external_routine_closure (a_feature)
		end

	process_external_routine_closure (a_feature: ET_EXTERNAL_ROUTINE_CLOSURE) is
			-- Process `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		local
			an_arguments: ET_FORMAL_ARGUMENT_LIST
			a_preconditions: ET_PRECONDITIONS
			a_postconditions: ET_POSTCONDITIONS
			a_type: ET_TYPE
		do
			an_arguments := a_feature.arguments
			if an_arguments /= Void then
				process_formal_argument_list (an_arguments)
			end
			a_type := a_feature.type
			if a_type /= Void then
				process_type (a_type)
			end
			a_preconditions := a_feature.preconditions
			if a_preconditions /= Void then
				process_preconditions (a_preconditions)
			end
			a_postconditions := a_feature.postconditions
			if a_postconditions /= Void then
				process_postconditions (a_postconditions)
			end
		end

	process_external_routine_inline_agent (an_expression: ET_EXTERNAL_ROUTINE_INLINE_AGENT) is
			-- Process `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		local
			l_actual_arguments: ET_AGENT_ARGUMENT_OPERAND_LIST
		do
			process_external_routine_closure (an_expression)
			l_actual_arguments ?= an_expression.actual_arguments
			if l_actual_arguments /= Void then
				process_agent_argument_operand_list (l_actual_arguments)
			end
		end

	process_feature_call (a_call: ET_FEATURE_CALL) is
			-- Process `a_call'.
		local
			a_target: ET_EXPRESSION
			an_arguments: ET_ACTUAL_ARGUMENTS
		do
			a_target := a_call.target
			if a_target /= Void then
				process_expression (a_target)
			end
			an_arguments := a_call.arguments
			if an_arguments /= Void then
				process_actual_arguments (an_arguments)
			end
		end

	process_features (a_class: ET_CLASS) is
			-- Process features of `a_class'.
		require
			a_class_not_void: a_class /= Void
		local
			l_queries: ET_QUERY_LIST
			l_procedures: ET_PROCEDURE_LIST
			i, nb: INTEGER
		do
			l_queries := a_class.queries
			nb := l_queries.declared_count
			from i := 1 until i > nb loop
				l_queries.item (i).process (Current)
				i := i + 1
			end
			l_procedures := a_class.procedures
			nb := l_procedures.declared_count
			from i := 1 until i > nb loop
				l_procedures.item (i).process (Current)
				i := i + 1
			end
		end

	process_formal_argument (an_argument: ET_FORMAL_ARGUMENT) is
			-- Process `an_argument'.
		do
			if an_argument.is_last_entity then
				process_type (an_argument.type)
			end
		end

	process_formal_argument_list (a_list: ET_FORMAL_ARGUMENT_LIST) is
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			nb := a_list.count
			from i := 1 until i > nb loop
				process_formal_argument (a_list.formal_argument (i))
				i := i + 1
			end
		end

	process_formal_parameter_list (a_list: ET_FORMAL_PARAMETER_LIST) is
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.formal_parameter (i).process (Current)
				i := i + 1
			end
		end

	process_generic_class_type (a_type: ET_GENERIC_CLASS_TYPE) is
			-- Process `a_type'.
		do
			process_class_type (a_type)
			process_actual_parameter_list (a_type.actual_parameters)
		end

	process_hexadecimal_integer_constant (a_constant: ET_HEXADECIMAL_INTEGER_CONSTANT) is
			-- Process `a_constant'.
		do
			process_integer_constant (a_constant)
		end

	process_if_instruction (an_instruction: ET_IF_INSTRUCTION) is
			-- Process `an_instruction'.
		local
			an_elseif_parts: ET_ELSEIF_PART_LIST
			a_compound: ET_COMPOUND
		do
			process_expression (an_instruction.expression)
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

	process_infix_cast_expression (an_expression: ET_INFIX_CAST_EXPRESSION) is
			-- Process `an_expression'.
		do
			process_expression (an_expression.expression)
		end

	process_infix_expression (an_expression: ET_INFIX_EXPRESSION) is
			-- Process `an_expression'.
		do
			process_expression (an_expression.left)
			process_expression (an_expression.right)
		end

	process_inspect_instruction (an_instruction: ET_INSPECT_INSTRUCTION) is
			-- Process `an_instruction'.
		local
			a_when_parts: ET_WHEN_PART_LIST
			an_else_compound: ET_COMPOUND
		do
			process_expression (an_instruction.expression)
			a_when_parts := an_instruction.when_parts
			if a_when_parts /= Void then
				process_when_part_list (a_when_parts)
			end
			an_else_compound := an_instruction.else_compound
			if an_else_compound /= Void then
				process_compound (an_else_compound)
			end
		end

	process_integer_constant (a_constant: ET_INTEGER_CONSTANT) is
			-- Process `a_constant'.
		require
			a_constant_not_void: a_constant /= Void
		local
			a_type: ET_TARGET_TYPE
		do
			a_type := a_constant.cast_type
			if a_type /= Void then
				process_type (a_type.type)
			end
		end

	process_internal_routine (a_feature: ET_INTERNAL_ROUTINE) is
			-- Process `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		do
			process_internal_routine_closure (a_feature)
		end

	process_internal_routine_closure (a_feature: ET_INTERNAL_ROUTINE_CLOSURE) is
			-- Process `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		local
			an_arguments: ET_FORMAL_ARGUMENT_LIST
			a_preconditions: ET_PRECONDITIONS
			a_locals: ET_LOCAL_VARIABLE_LIST
			a_postconditions: ET_POSTCONDITIONS
			a_compound: ET_COMPOUND
			a_type: ET_TYPE
		do
			an_arguments := a_feature.arguments
			if an_arguments /= Void then
				process_formal_argument_list (an_arguments)
			end
			a_type := a_feature.type
			if a_type /= Void then
				process_type (a_type)
			end
			a_preconditions := a_feature.preconditions
			if a_preconditions /= Void then
				process_preconditions (a_preconditions)
			end
			a_locals := a_feature.locals
			if a_locals /= Void then
				process_local_variable_list (a_locals)
			end
			a_compound := a_feature.compound
			if a_compound /= Void then
				process_compound (a_compound)
			end
			a_postconditions := a_feature.postconditions
			if a_postconditions /= Void then
				process_postconditions (a_postconditions)
			end
			a_compound := a_feature.rescue_clause
			if a_compound /= Void then
				process_compound (a_compound)
			end
		end

	process_internal_routine_inline_agent (an_expression: ET_INTERNAL_ROUTINE_INLINE_AGENT) is
			-- Process `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		local
			l_actual_arguments: ET_AGENT_ARGUMENT_OPERAND_LIST
		do
			process_internal_routine_closure (an_expression)
			l_actual_arguments ?= an_expression.actual_arguments
			if l_actual_arguments /= Void then
				process_agent_argument_operand_list (l_actual_arguments)
			end
		end

	process_invariants (a_list: ET_INVARIANTS) is
			-- Process `a_list'.
		do
			process_assertions (a_list)
		end

	process_local_variable (a_local: ET_LOCAL_VARIABLE) is
			-- Process `a_local'.
		do
			if a_local.is_last_entity then
				process_type (a_local.type)
			end
		end

	process_local_variable_list (a_list: ET_LOCAL_VARIABLE_LIST) is
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			nb := a_list.count
			from i := 1 until i > nb loop
				process_local_variable (a_list.local_variable (i))
				i := i + 1
			end
		end

	process_loop_instruction (an_instruction: ET_LOOP_INSTRUCTION) is
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
			process_expression (an_instruction.until_expression)
			a_compound := an_instruction.loop_compound
			if a_compound /= Void then
				process_compound (a_compound)
			end
			a_variant_part := an_instruction.variant_part
			if a_variant_part /= Void then
				process_variant (a_variant_part)
			end
		end

	process_loop_invariants (a_list: ET_LOOP_INVARIANTS) is
			-- Process `a_list'.
		do
			process_assertions (a_list)
		end

	process_manifest_array (an_expression: ET_MANIFEST_ARRAY) is
			-- Process `an_expression'.
		do
			process_expression_list (an_expression)
		end

	process_manifest_string (a_string: ET_MANIFEST_STRING) is
			-- Process `a_string'.
		require
			a_string_not_void: a_string /= Void
		local
			a_type: ET_TARGET_TYPE
		do
			a_type := a_string.cast_type
			if a_type /= Void then
				process_type (a_type.type)
			end
		end

	process_manifest_tuple (an_expression: ET_MANIFEST_TUPLE) is
			-- Process `an_expression'.
		do
			process_expression_list (an_expression)
		end

	process_manifest_type (an_expression: ET_MANIFEST_TYPE) is
			-- Process `an_expression'.
		do
			process_type (an_expression.type)
		end

	process_named_object_test (an_expression: ET_NAMED_OBJECT_TEST) is
			-- Process `an_expression'.
		do
			process_object_test (an_expression)
		end

	process_object_equality_expression (an_expression: ET_OBJECT_EQUALITY_EXPRESSION) is
			-- Process `an_expression'.
		do
			process_expression (an_expression.left)
			process_expression (an_expression.right)
		end

	process_object_test (an_expression: ET_OBJECT_TEST) is
			-- Process `an_expression'.
		local
			l_type: ET_TYPE
		do
			l_type := an_expression.type
			if l_type /= Void then
				process_type (l_type)
			end
			process_expression (an_expression.expression)
		end

	process_octal_integer_constant (a_constant: ET_OCTAL_INTEGER_CONSTANT) is
			-- Process `a_constant'.
		do
			process_integer_constant (a_constant)
		end

	process_old_expression (an_expression: ET_OLD_EXPRESSION) is
			-- Process `an_expression'.
		do
			process_expression (an_expression.expression)
		end

	process_old_object_test (an_expression: ET_OLD_OBJECT_TEST) is
			-- Process `an_expression'.
		do
			process_object_test (an_expression)
		end

	process_once_function (a_feature: ET_ONCE_FUNCTION) is
			-- Process `a_feature'.
		do
			process_internal_routine (a_feature)
		end

	process_once_function_inline_agent (an_expression: ET_ONCE_FUNCTION_INLINE_AGENT) is
			-- Process `an_expression'.
		do
			process_internal_routine_inline_agent (an_expression)
		end

	process_once_manifest_string (a_string: ET_ONCE_MANIFEST_STRING) is
			-- Process `a_string'.
		do
			process_manifest_string (a_string.manifest_string)
		end

	process_once_procedure (a_feature: ET_ONCE_PROCEDURE) is
			-- Process `a_feature'.
		do
			process_internal_routine (a_feature)
		end

	process_once_procedure_inline_agent (an_expression: ET_ONCE_PROCEDURE_INLINE_AGENT) is
			-- Process `an_expression'.
		do
			process_internal_routine_inline_agent (an_expression)
		end

	process_parent (a_parent: ET_PARENT) is
			-- Process `a_parent'.
		do
			a_parent.type.process (Current)
		end

	process_parenthesized_expression (an_expression: ET_PARENTHESIZED_EXPRESSION) is
			-- Process `an_expression'.
		do
			process_expression (an_expression.expression)
		end

	process_parent_list (a_list: ET_PARENT_LIST) is
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			nb := a_list.count
			from i := 1 until i > nb loop
				process_parent (a_list.parent (i))
				i := i + 1
			end
		end

	process_postconditions (a_list: ET_POSTCONDITIONS) is
			-- Process `a_list'.
		do
			process_assertions (a_list)
		end

	process_preconditions (a_list: ET_PRECONDITIONS) is
			-- Process `a_list'.
		do
			process_assertions (a_list)
		end

	process_precursor_call (a_call: ET_PRECURSOR) is
			-- Process `a_call'.
		require
			a_call_not_void: a_call /= Void
		local
			an_arguments: ET_ACTUAL_ARGUMENT_LIST
		do
				-- The parent class name should already appear
				-- in the inheritance clause.
			an_arguments := a_call.arguments
			if an_arguments /= Void then
				process_actual_arguments (an_arguments)
			end
		end

	process_precursor_expression (an_expression: ET_PRECURSOR_EXPRESSION) is
			-- Process `an_expression'.
		do
			process_precursor_call (an_expression)
		end

	process_precursor_instruction (an_instruction: ET_PRECURSOR_INSTRUCTION) is
			-- Process `an_instruction'.
		do
			process_precursor_call (an_instruction)
		end

	process_prefix_expression (an_expression: ET_PREFIX_EXPRESSION) is
			-- Process `an_expression'.
		do
			process_expression (an_expression.expression)
		end

	process_qualified_like_braced_type (a_type: ET_QUALIFIED_LIKE_BRACED_TYPE) is
			-- Process `a_type'.
		do
			process_type (a_type.target_type)
		end

	process_qualified_like_type (a_type: ET_QUALIFIED_LIKE_TYPE) is
			-- Process `a_type'.
		do
			process_type (a_type.target_type)
		end

	process_real_constant (a_constant: ET_REAL_CONSTANT) is
			-- Process `a_constant'.
		local
			a_type: ET_TARGET_TYPE
		do
			a_type := a_constant.cast_type
			if a_type /= Void then
				process_type (a_type.type)
			end
		end

	process_regular_integer_constant (a_constant: ET_REGULAR_INTEGER_CONSTANT) is
			-- Process `a_constant'.
		do
			process_integer_constant (a_constant)
		end

	process_regular_manifest_string (a_string: ET_REGULAR_MANIFEST_STRING) is
			-- Process `a_string'.
		do
			process_manifest_string (a_string)
		end

	process_regular_real_constant (a_constant: ET_REGULAR_REAL_CONSTANT) is
			-- Process `a_constant'.
		do
			process_real_constant (a_constant)
		end

	process_special_manifest_string (a_string: ET_SPECIAL_MANIFEST_STRING) is
			-- Process `a_string'.
		do
			process_manifest_string (a_string)
		end

	process_static_feature_call (a_call: ET_STATIC_FEATURE_CALL) is
			-- Process `a_call'.
		require
			a_call_not_void: a_call /= Void
		local
			an_arguments: ET_ACTUAL_ARGUMENT_LIST
		do
			process_type (a_call.type)
			an_arguments := a_call.arguments
			if an_arguments /= Void then
				process_actual_arguments (an_arguments)
			end
		end

	process_static_call_expression (an_expression: ET_STATIC_CALL_EXPRESSION) is
			-- Process `an_expression'.
		do
			process_static_feature_call (an_expression)
		end

	process_static_call_instruction (an_instruction: ET_STATIC_CALL_INSTRUCTION) is
			-- Process `an_instruction'.
		do
			process_static_feature_call (an_instruction)
		end

	process_tagged_assertion (an_assertion: ET_TAGGED_ASSERTION) is
			-- Process `an_assertion'.
		local
			an_expression: ET_EXPRESSION
		do
			an_expression := an_assertion.expression
			if an_expression /= Void then
				process_expression (an_expression)
			end
		end

	process_tuple_type (a_type: ET_TUPLE_TYPE) is
			-- Process `a_type'.
		local
			a_class: ET_CLASS
			a_parameters: ET_ACTUAL_PARAMETER_LIST
		do
			a_class := a_type.base_class
			if not a_class.in_system then
				a_class.set_in_system (True)
				if is_recursive then
					process_class (a_class)
				end
			end
			a_parameters := a_type.actual_parameters
			if a_parameters /= Void then
				process_actual_parameter_list (a_parameters)
			end
		end

	process_type (a_type: ET_TYPE) is
			-- Process `a_type'.
		require
			a_type_not_void: a_type /= Void
		do
			a_type.process (Current)
		end

	process_underscored_integer_constant (a_constant: ET_UNDERSCORED_INTEGER_CONSTANT) is
			-- Process `a_constant'.
		do
			process_integer_constant (a_constant)
		end

	process_underscored_real_constant (a_constant: ET_UNDERSCORED_REAL_CONSTANT) is
			-- Process `a_constant'.
		do
			process_real_constant (a_constant)
		end

	process_unique_attribute (a_feature: ET_UNIQUE_ATTRIBUTE) is
			-- Process `a_feature'.
		do
			process_type (a_feature.type)
		end

	process_variant (a_variant: ET_VARIANT) is
			-- Process `a_variant'.
		local
			an_expression: ET_EXPRESSION
		do
			an_expression := a_variant.expression
			if an_expression /= Void then
				process_expression (an_expression)
			end
		end

	process_verbatim_string (a_string: ET_VERBATIM_STRING) is
			-- Process `a_string'.
		do
			process_manifest_string (a_string)
		end

	process_when_part (a_when_part: ET_WHEN_PART) is
			-- Process `a_when_part'.
		local
			a_compound: ET_COMPOUND
		do
			process_choice_list (a_when_part.choices)
			a_compound := a_when_part.then_compound
			if a_compound /= Void then
				process_compound (a_compound)
			end
		end

	process_when_part_list (a_list: ET_WHEN_PART_LIST) is
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

feature {NONE} -- Implementation

	is_recursive: BOOLEAN
			-- Is the processing recursive?

invariant

	current_system_not_void: current_system /= Void

end
