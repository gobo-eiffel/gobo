note

	description:

		"Finders of browsable names at some given positions in class texts"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class ET_BROWSABLE_NAME_FINDER

inherit

	ET_CLASS_PROCESSOR
		redefine
			make
		end

	ET_AST_ITERATOR
		rename
			make as make_ast_processor
		redefine
			process_attribute,
			process_bang_instruction,
			process_base_type_rename_constraint,
			process_bracket_expression,
			process_class,
			process_class_type,
			process_client,
			process_client_comma,
			process_constant_attribute,
			process_constrained_formal_parameter,
			process_create_expression,
			process_create_instruction,
			process_deferred_function,
			process_deferred_procedure,
			process_do_function,
			process_do_function_inline_agent,
			process_do_procedure,
			process_do_procedure_inline_agent,
			process_dotnet_function,
			process_dotnet_procedure,
			process_extended_attribute,
			process_extended_feature_name_of_feature,
			process_external_function,
			process_external_function_inline_agent,
			process_external_procedure,
			process_external_procedure_inline_agent,
			process_formal_parameter,
			process_formal_parameter_type,
			process_identifier,
			process_infix_expression,
			process_invariants,
			process_once_function,
			process_once_function_inline_agent,
			process_once_procedure,
			process_once_procedure_inline_agent,
			process_parenthesis_expression,
			process_precursor_expression,
			process_precursor_instruction,
			process_prefix_expression,
			process_qualified_call_expression,
			process_qualified_call_instruction,
			process_qualified_like_braced_type,
			process_qualified_like_type,
			process_rename_list,
			process_result,
			process_result_address,
			process_static_call_expression,
			process_static_call_instruction,
			process_tuple_type,
			process_type_rename_constraint,
			process_unique_attribute,
			process_unqualified_call_expression,
			process_unqualified_call_instruction
		end

create

	make

feature {NONE} -- Initialization

	make (a_system_processor: like system_processor)
			-- Create a new browsable name finder.
		do
			precursor (a_system_processor)
			current_class := tokens.unknown_class
			current_position := tokens.null_position
			create expression_type_finder.make (a_system_processor)
			create internal_type_context.make_with_capacity (current_class, 100)
		end

feature -- Access

	last_browsable_name: detachable ET_BROWSABLE_NAME
			-- Last browsable name found, if any

feature -- Basic operations

	find_browsable_name (a_position: ET_POSITION; a_class: ET_CLASS)
			-- Find a browsable name in `a_class` at position `a_position`.
		require
			a_position_not_void: a_position /= Void
			a_class_not_void: a_class /= Void
		local
			l_old_position: like current_position
			l_old_class: like current_class
		do
			l_old_position := current_position
			current_position := a_position
			l_old_class := current_class
			current_class := a_class
			last_browsable_name := Void
			a_class.process (Current)
			current_class := l_old_class
			current_position := l_old_position
		end

feature {ET_AST_NODE} -- Processing

	process_argument_name (a_identifier: ET_IDENTIFIER)
			-- Process `a_identifier'.
		require
			a_identifier_not_void: a_identifier /= Void
			a_identifier_is_argument: a_identifier.is_argument
		local
			l_seed: INTEGER
		do
			if a_identifier.contains_position (current_position) then
				if attached current_closure as l_closure and then attached l_closure.arguments as l_arguments then
					l_seed := a_identifier.seed
					if l_seed >= 1 and l_seed <= l_arguments.count then
						create {ET_BROWSABLE_ARGUMENT_NAME} last_browsable_name.make (a_identifier, l_arguments.formal_argument (l_seed), current_class)
					end
				end
			end
		end

	process_attribute (a_feature: ET_ATTRIBUTE)
			-- Process `a_feature'.
		local
			l_old_closure: like current_closure
		do
			l_old_closure := current_closure
			current_closure := a_feature
			precursor (a_feature)
			current_closure := l_old_closure
		end

	process_bang_instruction (a_instruction: ET_BANG_INSTRUCTION)
			-- Process `a_instruction`.
		do
			process_creation_instruction (a_instruction)
			if last_browsable_name = Void then
				precursor (a_instruction)
			end
		end

	process_bracket_expression (a_expression: ET_BRACKET_EXPRESSION)
			-- Process `an_expression'.
		do
			process_qualified_feature_call (a_expression)
			if last_browsable_name = Void then
				precursor (a_expression)
			end
		end

	process_base_type_rename_constraint (a_type_rename_constraint: ET_BASE_TYPE_RENAME_CONSTRAINT)
			-- Process `a_type_rename_constraint'.
		do
			process_type_rename_constraint (a_type_rename_constraint)
		end

	process_class (a_class: ET_CLASS)
			-- Process `a_class'.
		local
			l_name: ET_CLASS_NAME
		do
			l_name := a_class.name
			if l_name.contains_position (current_position) then
				create {ET_BROWSABLE_CLASS_NAME} last_browsable_name.make (l_name, a_class, current_class)
			end
			if last_browsable_name = Void then
				precursor (a_class)
			end
		end

	process_class_type (a_type: ET_CLASS_TYPE)
			-- Process `a_type'.
		local
			l_name: ET_CLASS_NAME
		do
			l_name := a_type.name
			if l_name.contains_position (current_position) then
				create {ET_BROWSABLE_CLASS_NAME} last_browsable_name.make (l_name, a_type.base_class, current_class)
			end
			if last_browsable_name = Void then
				precursor (a_type)
			end
		end

	process_client (a_client: ET_CLIENT)
			-- Process `a_client'.
		local
			l_name: ET_CLASS_NAME
		do
			l_name := a_client.name
			if l_name.contains_position (current_position) then
				create {ET_BROWSABLE_CLASS_NAME} last_browsable_name.make (l_name, a_client.base_class, current_class)
			end
			if last_browsable_name = Void then
				precursor (a_client)
			end
		end

	process_client_comma (a_client_comma: ET_CLIENT_COMMA)
			-- Process `a_client_comma'.
		local
			l_name: ET_CLASS_NAME
		do
			l_name := a_client_comma.name
			if l_name.contains_position (current_position) then
				create {ET_BROWSABLE_CLASS_NAME} last_browsable_name.make (l_name, a_client_comma.base_class, current_class)
			end
			if last_browsable_name = Void then
				precursor (a_client_comma)
			end
		end

	process_constant_attribute (a_feature: ET_CONSTANT_ATTRIBUTE)
			-- Process `a_feature'.
		local
			l_old_closure: like current_closure
		do
			l_old_closure := current_closure
			current_closure := a_feature
			precursor (a_feature)
			current_closure := l_old_closure
		end

	process_constrained_formal_parameter (a_parameter: ET_CONSTRAINED_FORMAL_PARAMETER)
			-- Process `a_parameter'.
		local
			i, nb: INTEGER
			l_name: ET_FEATURE_NAME
			l_target_type: ET_BASE_TYPE
			l_parameter_name: ET_IDENTIFIER
		do
			l_parameter_name := a_parameter.name
			if l_parameter_name.contains_position (current_position) then
				create {ET_BROWSABLE_FORMAL_PARAMETER_NAME} last_browsable_name.make (l_parameter_name, a_parameter, current_class)
			elseif attached a_parameter.creation_procedures as l_creation_procedures then
				nb := l_creation_procedures.count
				from i := 1 until i > nb loop
					l_name := l_creation_procedures.feature_name (i)
					if l_name.contains_position (current_position) then
						internal_type_context.reset (current_class)
						internal_type_context.put_last (a_parameter.type)
						l_target_type := internal_type_context.base_type
						if attached l_target_type.base_class.seeded_feature (l_name.seed) as l_feature then
							create {ET_BROWSABLE_CREATION_CALL_NAME} last_browsable_name.make (l_name, l_feature, l_target_type, current_class)
						end
					end
					i := i  + 1
				end
			end
			if last_browsable_name = Void then
				precursor (a_parameter)
			end
		end

	process_create_expression (a_expression: ET_CREATE_EXPRESSION)
			-- Process `a_expression`.
		do
			process_creation_expression (a_expression)
			if last_browsable_name = Void then
				precursor (a_expression)
			end
		end

	process_create_instruction (a_instruction: ET_CREATE_INSTRUCTION)
			-- Process `a_instruction`.
		do
			process_creation_instruction (a_instruction)
			if last_browsable_name = Void then
				precursor (a_instruction)
			end
		end

	process_creation_expression (a_expression: ET_CREATION_EXPRESSION)
			-- Process `a_expression`.
		require
			a_expression_not_void: a_expression /= Void
		local
			l_name: ET_FEATURE_NAME
			l_target_type: ET_BASE_TYPE
		do
			l_name := a_expression.name
			if l_name.contains_position (current_position) then
				internal_type_context.reset (current_class)
				internal_type_context.put_last (a_expression.type)
				l_target_type := internal_type_context.base_type
				if attached l_target_type.base_class.seeded_feature (l_name.seed) as l_feature then
					create {ET_BROWSABLE_CREATION_CALL_NAME} last_browsable_name.make (l_name, l_feature, l_target_type, current_class)
				end
			end
		end

	process_creation_instruction (a_instruction: ET_CREATION_INSTRUCTION)
			-- Process `a_instruction`.
		require
			a_instruction_not_void: a_instruction /= Void
		local
			l_name: ET_FEATURE_NAME
			l_target_type: ET_BASE_TYPE
		do
			l_name := a_instruction.name
			if l_name.contains_position (current_position) then
				if attached current_closure as l_closure then
					internal_type_context.reset (current_class)
					if attached a_instruction.type as l_type then
						internal_type_context.put_last (l_type)
					elseif
						attached {ET_IDENTIFIER} a_instruction.target as l_identifier and then
						attached current_class.seeded_feature (l_identifier.seed) as l_feature and then
						attached l_feature.type as l_type
					then
						internal_type_context.put_last (l_type)
					else
						expression_type_finder.find_expression_type_in_closure (a_instruction.target, l_closure, l_closure, current_class, internal_type_context, current_universe.any_type)
					end
					l_target_type := internal_type_context.base_type
					if attached l_target_type.base_class.seeded_feature (l_name.seed) as l_feature then
						create {ET_BROWSABLE_CREATION_CALL_NAME} last_browsable_name.make (l_name, l_feature, l_target_type, current_class)
					end
				end
			end
		end

	process_deferred_function (a_feature: ET_DEFERRED_FUNCTION)
			-- Process `a_feature'.
		local
			l_old_closure: like current_closure
		do
			l_old_closure := current_closure
			current_closure := a_feature
			precursor (a_feature)
			current_closure := l_old_closure
		end

	process_deferred_procedure (a_feature: ET_DEFERRED_PROCEDURE)
			-- Process `a_feature'.
		local
			l_old_closure: like current_closure
		do
			l_old_closure := current_closure
			current_closure := a_feature
			precursor (a_feature)
			current_closure := l_old_closure
		end

	process_do_function (a_feature: ET_DO_FUNCTION)
			-- Process `a_feature'.
		local
			l_old_closure: like current_closure
		do
			l_old_closure := current_closure
			current_closure := a_feature
			precursor (a_feature)
			current_closure := l_old_closure
		end

	process_do_function_inline_agent (a_expression: ET_DO_FUNCTION_INLINE_AGENT)
			-- Process `a_expression'.
		local
			l_old_closure: like current_closure
		do
			l_old_closure := current_closure
			current_closure := a_expression
			precursor (a_expression)
			current_closure := l_old_closure
		end

	process_do_procedure (a_feature: ET_DO_PROCEDURE)
			-- Process `a_feature'.
		local
			l_old_closure: like current_closure
		do
			l_old_closure := current_closure
			current_closure := a_feature
			precursor (a_feature)
			current_closure := l_old_closure
		end

	process_do_procedure_inline_agent (a_expression: ET_DO_PROCEDURE_INLINE_AGENT)
			-- Process `a_expression'.
		local
			l_old_closure: like current_closure
		do
			l_old_closure := current_closure
			current_closure := a_expression
			precursor (a_expression)
			current_closure := l_old_closure
		end

	process_dotnet_function (a_feature: ET_DOTNET_FUNCTION)
			-- Process `a_feature'.
		local
			l_old_closure: like current_closure
		do
			l_old_closure := current_closure
			current_closure := a_feature
			precursor (a_feature)
			current_closure := l_old_closure
		end

	process_dotnet_procedure (a_feature: ET_DOTNET_PROCEDURE)
			-- Process `a_feature'.
		local
			l_old_closure: like current_closure
		do
			l_old_closure := current_closure
			current_closure := a_feature
			precursor (a_feature)
			current_closure := l_old_closure
		end

	process_extended_attribute (a_feature: ET_EXTENDED_ATTRIBUTE)
			-- Process `a_feature'.
		local
			l_old_closure: like current_closure
		do
			l_old_closure := current_closure
			current_closure := a_feature
			precursor (a_feature)
			current_closure := l_old_closure
		end

	process_extended_feature_name_of_feature (a_feature: ET_FEATURE)
			-- Process `a_name'.
		local
			l_feature_name: ET_FEATURE_NAME
			i, nb: INTEGER
			l_alias_string: ET_MANIFEST_STRING
		do
			l_feature_name := a_feature.name
			if l_feature_name.contains_position (current_position) then
				create {ET_BROWSABLE_UNQUALIFIED_CALL_NAME} last_browsable_name.make (l_feature_name, a_feature, current_class)
			end
			if attached a_feature.alias_names as l_alias_names then
				nb := l_alias_names.count
				from i := 1 until i > nb loop
					l_alias_string := l_alias_names.item (i).alias_string
					if l_alias_string.contains_position (current_position) then
						create {ET_BROWSABLE_UNQUALIFIED_CALL_NAME} last_browsable_name.make (l_alias_string, a_feature, current_class)
					end
					i := i + 1
				end
			end
		end

	process_external_function (a_feature: ET_EXTERNAL_FUNCTION)
			-- Process `a_feature'.
		local
			l_old_closure: like current_closure
		do
			l_old_closure := current_closure
			current_closure := a_feature
			precursor (a_feature)
			current_closure := l_old_closure
		end

	process_external_function_inline_agent (a_expression: ET_EXTERNAL_FUNCTION_INLINE_AGENT)
			-- Process `a_expression'.
		local
			l_old_closure: like current_closure
		do
			l_old_closure := current_closure
			current_closure := a_expression
			precursor (a_expression)
			current_closure := l_old_closure
		end

	process_external_procedure (a_feature: ET_EXTERNAL_PROCEDURE)
			-- Process `a_feature'.
		local
			l_old_closure: like current_closure
		do
			l_old_closure := current_closure
			current_closure := a_feature
			precursor (a_feature)
			current_closure := l_old_closure
		end

	process_external_procedure_inline_agent (a_expression: ET_EXTERNAL_PROCEDURE_INLINE_AGENT)
			-- Process `a_expression'.
		local
			l_old_closure: like current_closure
		do
			l_old_closure := current_closure
			current_closure := a_expression
			precursor (a_expression)
			current_closure := l_old_closure
		end

	process_feature_name (a_identifier: ET_IDENTIFIER)
			-- Process `a_identifier'.
		require
			a_identifier_not_void: a_identifier /= Void
			a_identifier_is_feature_name: a_identifier.is_feature_name
		do
			if a_identifier.contains_position (current_position) then
				if attached current_class.seeded_feature (a_identifier.seed) as l_feature then
					create {ET_BROWSABLE_UNQUALIFIED_CALL_NAME} last_browsable_name.make (a_identifier, l_feature, current_class)
				end
			end
		end

	process_formal_parameter (a_parameter: ET_FORMAL_PARAMETER)
			-- Process `a_parameter'.
		local
			l_name: ET_IDENTIFIER
		do
			l_name := a_parameter.name
			if l_name.contains_position (current_position) then
				create {ET_BROWSABLE_FORMAL_PARAMETER_NAME} last_browsable_name.make (l_name, a_parameter, current_class)
			end
			if last_browsable_name = Void then
				precursor (a_parameter)
			end
		end

	process_formal_parameter_type (a_type: ET_FORMAL_PARAMETER_TYPE)
			-- Process `a_type'.
		local
			l_name: ET_IDENTIFIER
			l_index: INTEGER
		do
			l_name := a_type.name
			if l_name.contains_position (current_position) then
				if attached current_class.formal_parameters as l_formal_parameters then
					l_index := a_type.index
					if l_index >= 1 and l_index <= l_formal_parameters.count then
						create {ET_BROWSABLE_FORMAL_PARAMETER_NAME} last_browsable_name.make (l_name, l_formal_parameters.formal_parameter (l_index), current_class)
					end
				end
			end
			if last_browsable_name = Void then
				precursor (a_type)
			end
		end

	process_identifier (a_identifier: ET_IDENTIFIER)
			-- Process `a_identifier'.
		do
			if a_identifier.is_local then
				process_local_name (a_identifier)
			elseif a_identifier.is_argument then
				process_argument_name (a_identifier)
			elseif a_identifier.is_object_test_local then
				process_object_test_local_name (a_identifier)
			elseif a_identifier.is_iteration_item then
				process_iteration_item_name (a_identifier)
			elseif a_identifier.is_inline_separate_argument then
				process_inline_separate_argument_name (a_identifier)
			elseif a_identifier.is_feature_name then
				process_feature_name (a_identifier)
			else
				precursor (a_identifier)
			end
		end

	process_infix_expression (a_expression: ET_INFIX_EXPRESSION)
			-- Process `a_expression'.
		do
			process_qualified_feature_call (a_expression)
			if last_browsable_name = Void then
				precursor (a_expression)
			end
		end

	process_inline_separate_argument_name (a_identifier: ET_IDENTIFIER)
			-- Process `a_identifier'.
		require
			a_identifier_not_void: a_identifier /= Void
			a_identifier_is_inline_separate_argument: a_identifier.is_inline_separate_argument
		local
			l_seed: INTEGER
		do
			if a_identifier.contains_position (current_position) then
				if attached current_closure as l_closure and then attached l_closure.inline_separate_arguments as l_inline_separate_arguments then
					l_seed := a_identifier.seed
					if l_seed >= 1 and l_seed <= l_inline_separate_arguments.count then
						internal_type_context.reset (current_class)
						expression_type_finder.find_expression_type_in_closure (a_identifier, l_closure, l_closure, current_class, internal_type_context, current_universe.any_type)
						create {ET_BROWSABLE_INLINE_SEPARATE_ARGUMENT_NAME} last_browsable_name.make (a_identifier, internal_type_context.named_type, l_inline_separate_arguments.argument (l_seed), current_class)
					end
				end
			end
		end

	process_invariants (a_list: ET_INVARIANTS)
			-- Process `a_list'.
		local
			l_old_closure: like current_closure
		do
			l_old_closure := current_closure
			current_closure := a_list
			precursor (a_list)
			current_closure := l_old_closure
		end

	process_iteration_item_name (a_identifier: ET_IDENTIFIER)
			-- Process `a_identifier'.
		require
			a_identifier_not_void: a_identifier /= Void
			a_identifier_is_iteration_item: a_identifier.is_iteration_item
		local
			l_seed: INTEGER
		do
			if a_identifier.contains_position (current_position) then
				if attached current_closure as l_closure and then attached l_closure.iteration_components as l_iteration_components then
					l_seed := a_identifier.seed
					if l_seed >= 1 and l_seed <= l_iteration_components.count then
						internal_type_context.reset (current_class)
						expression_type_finder.find_expression_type_in_closure (a_identifier, l_closure, l_closure, current_class, internal_type_context, current_universe.any_type)
						create {ET_BROWSABLE_ITERATION_ITEM_NAME} last_browsable_name.make (a_identifier, internal_type_context.named_type, l_iteration_components.iteration_component (l_seed), current_class)
					end
				end
			end
		end

	process_local_name (a_identifier: ET_IDENTIFIER)
			-- Process `a_identifier'.
		require
			a_identifier_not_void: a_identifier /= Void
			a_identifier_is_local: a_identifier.is_local
		local
			l_seed: INTEGER
		do
			if a_identifier.contains_position (current_position) then
				if attached current_closure as l_closure and then attached l_closure.locals as l_locals then
					l_seed := a_identifier.seed
					if l_seed >= 1 and l_seed <= l_locals.count then
						create {ET_BROWSABLE_LOCAL_NAME} last_browsable_name.make (a_identifier, l_locals.local_variable (l_seed), current_class)
					end
				end
			end
		end

	process_object_test_local_name (a_identifier: ET_IDENTIFIER)
			-- Process `a_identifier'.
		require
			a_identifier_not_void: a_identifier /= Void
			a_identifier_is_object_test_local: a_identifier.is_object_test_local
		local
			l_seed: INTEGER
		do
			if a_identifier.contains_position (current_position) then
				if attached current_closure as l_closure and then attached l_closure.object_tests as l_object_tests then
					l_seed := a_identifier.seed
					if l_seed >= 1 and l_seed <= l_object_tests.count then
						internal_type_context.reset (current_class)
						expression_type_finder.find_expression_type_in_closure (a_identifier, l_closure, l_closure, current_class, internal_type_context, current_universe.any_type)
						create {ET_BROWSABLE_OBJECT_TEST_LOCAL_NAME} last_browsable_name.make (a_identifier, internal_type_context.named_type, l_object_tests.object_test (l_seed), current_class)
					end
				end
			end
		end

	process_once_function (a_feature: ET_ONCE_FUNCTION)
			-- Process `a_feature'.
		local
			l_old_closure: like current_closure
		do
			l_old_closure := current_closure
			current_closure := a_feature
			precursor (a_feature)
			current_closure := l_old_closure
		end

	process_once_function_inline_agent (a_expression: ET_ONCE_FUNCTION_INLINE_AGENT)
			-- Process `a_expression'.
		local
			l_old_closure: like current_closure
		do
			l_old_closure := current_closure
			current_closure := a_expression
			precursor (a_expression)
			current_closure := l_old_closure
		end

	process_once_procedure (a_feature: ET_ONCE_PROCEDURE)
			-- Process `a_feature'.
		local
			l_old_closure: like current_closure
		do
			l_old_closure := current_closure
			current_closure := a_feature
			precursor (a_feature)
			current_closure := l_old_closure
		end

	process_once_procedure_inline_agent (a_expression: ET_ONCE_PROCEDURE_INLINE_AGENT)
			-- Process `a_expression'.
		local
			l_old_closure: like current_closure
		do
			l_old_closure := current_closure
			current_closure := a_expression
			precursor (a_expression)
			current_closure := l_old_closure
		end

	process_parenthesis_expression (a_expression: ET_PARENTHESIS_EXPRESSION)
			-- Process `a_expression'.
		do
			process_qualified_feature_call (a_expression)
			if last_browsable_name = Void then
				precursor (a_expression)
			end
		end

	process_precursor_call (a_call: ET_PRECURSOR_CALL)
			-- Process `a_call'.
		require
			a_call_not_void: a_call /= Void
		local
			l_name: ET_CALL_NAME
			l_class_name: ET_CLASS_NAME
		do
			l_name := a_call.precursor_keyword
			if not attached a_call.parent_type as l_parent_type then
				-- Do nothing.
			elseif l_name.contains_position (current_position) then
				if attached l_parent_type.base_class.seeded_feature (l_name.seed) as l_feature then
					create {ET_BROWSABLE_QUALIFIED_CALL_NAME} last_browsable_name.make (l_name, l_feature, l_parent_type, current_class)
				end
			elseif attached a_call.parent_name as l_parent_name then
				l_class_name := l_parent_name.class_name
				if l_class_name.contains_position (current_position) then
					create {ET_BROWSABLE_CLASS_NAME} last_browsable_name.make (l_class_name, l_parent_type.base_class, current_class)
				end
			end
		end

	process_precursor_expression (a_expression: ET_PRECURSOR_EXPRESSION)
			-- Process `a_expression'.
		do
			if attached a_expression.parenthesis_call as l_parenthesis_call then
				process_qualified_feature_call (l_parenthesis_call)
			else
				process_precursor_call (a_expression)
			end
			if last_browsable_name = Void then
				precursor (a_expression)
			end
		end

	process_precursor_instruction (a_instruction: ET_PRECURSOR_INSTRUCTION)
			-- Process `a_instruction'.
		do
			if attached a_instruction.parenthesis_call as l_parenthesis_call then
				process_qualified_feature_call (l_parenthesis_call)
			else
				process_precursor_call (a_instruction)
			end
			if last_browsable_name = Void then
				precursor (a_instruction)
			end
		end

	process_prefix_expression (a_expression: ET_PREFIX_EXPRESSION)
			-- Process `a_expression'.
		do
			process_qualified_feature_call (a_expression)
			if last_browsable_name = Void then
				precursor (a_expression)
			end
		end

	process_qualified_call_expression (a_expression: ET_QUALIFIED_CALL_EXPRESSION)
			-- Process `a_expression'.
		do
			if attached a_expression.parenthesis_call as l_parenthesis_call then
				process_qualified_feature_call (l_parenthesis_call)
			else
				process_qualified_feature_call (a_expression)
			end
			if last_browsable_name = Void then
				precursor (a_expression)
			end
		end

	process_qualified_call_instruction (a_instruction: ET_QUALIFIED_CALL_INSTRUCTION)
			-- Process `a_instruction'.
		do
			if attached a_instruction.parenthesis_call as l_parenthesis_call then
				process_qualified_feature_call (l_parenthesis_call)
			else
				process_qualified_feature_call (a_instruction)
			end
			if last_browsable_name = Void then
				precursor (a_instruction)
			end
		end

	process_qualified_feature_call (a_call: ET_QUALIFIED_FEATURE_CALL)
			-- Process `a_call'.
		require
			a_call_not_void: a_call /= Void
		local
			l_name: ET_CALL_NAME
			l_target_type: ET_BASE_TYPE
			l_seed: INTEGER
		do
			l_name := a_call.name
			if l_name.contains_position (current_position) then
				if attached current_closure as l_closure then
					internal_type_context.reset (current_class)
					expression_type_finder.find_expression_type_in_closure (a_call.target, l_closure, l_closure, current_class, internal_type_context, current_universe.any_type)
					l_target_type := internal_type_context.base_type
					if attached {ET_IDENTIFIER} l_name as l_label and then l_label.is_tuple_label then
						l_seed := l_label.seed
						if
							attached l_target_type.actual_parameters as l_actual_parameters and then
							l_seed >= 1 and then l_seed <= l_actual_parameters.count and then
							attached {ET_LABELED_ACTUAL_PARAMETER} l_actual_parameters.actual_parameter (l_seed) as l_labeled_parameter
						then
							create {ET_BROWSABLE_TUPLE_LABEL_NAME} last_browsable_name.make (l_label, l_labeled_parameter, current_class)
						end
					elseif attached l_target_type.base_class.seeded_feature (l_name.seed) as l_feature then
						create {ET_BROWSABLE_QUALIFIED_CALL_NAME} last_browsable_name.make (l_name, l_feature, l_target_type, current_class)
					end
				end
			end
		end

	process_qualified_like_braced_type (a_type: ET_QUALIFIED_LIKE_BRACED_TYPE)
			-- Process `a_type'.
		do
			process_qualified_like_identifier (a_type)
			if last_browsable_name = Void then
				precursor (a_type)
			end
		end

	process_qualified_like_identifier (a_type: ET_QUALIFIED_LIKE_IDENTIFIER)
			-- Process `a_type'.
		require
			a_type_not_void: a_type /= Void
		local
			l_name: ET_FEATURE_NAME
			l_target_type: ET_BASE_TYPE
		do
			l_name := a_type.name
			if l_name.contains_position (current_position) then
				internal_type_context.reset (current_class)
				internal_type_context.put_last (a_type.target_type)
				l_target_type := internal_type_context.base_type
				if attached l_target_type.base_class.seeded_feature (l_name.seed) as l_feature then
					create {ET_BROWSABLE_QUALIFIED_CALL_NAME} last_browsable_name.make (l_name, l_feature, l_target_type, current_class)
				end
			end
		end

	process_qualified_like_type (a_type: ET_QUALIFIED_LIKE_TYPE)
			-- Process `a_type'.
		do
			process_qualified_like_identifier (a_type)
			if last_browsable_name = Void then
				precursor (a_type)
			end
		end

	process_rename_list (a_list: ET_RENAME_LIST)
			-- Process `a_list'.
		local
			i, nb: INTEGER
			l_rename: ET_RENAME
			l_name: ET_FEATURE_NAME
			l_extended_name: ET_EXTENDED_FEATURE_NAME
			j, nb2: INTEGER
			l_alias_string: ET_MANIFEST_STRING
		do
			nb := a_list.count
			from i := 1 until i > nb loop
				l_rename := a_list.rename_pair (i)
				l_name := l_rename.old_name
				if l_name.contains_position (current_position) then
					if attached current_class.base_class.seeded_feature (l_name.seed) as l_feature then
						create {ET_BROWSABLE_UNQUALIFIED_CALL_NAME} last_browsable_name.make (l_name, l_feature, current_class)
					end
				end
				l_extended_name := l_rename.new_name
				l_name := l_extended_name.feature_name
				if l_name.contains_position (current_position) then
					if attached current_class.base_class.seeded_feature (l_name.seed) as l_feature then
						create {ET_BROWSABLE_UNQUALIFIED_CALL_NAME} last_browsable_name.make (l_name, l_feature, current_class)
					end
				end
				if attached l_extended_name.alias_names as l_alias_names then
					nb2 := l_alias_names.count
					from j := 1 until j > nb2 loop
						l_alias_string := l_alias_names.item (j).alias_string
						if l_alias_string.contains_position (current_position) then
							if attached current_class.base_class.seeded_feature (l_name.seed) as l_feature then
								create {ET_BROWSABLE_UNQUALIFIED_CALL_NAME} last_browsable_name.make (l_alias_string, l_feature, current_class)
							end
						end
						j := j + 1
					end
				end
				i := i + 1
			end
		end

	process_result (a_expression: ET_RESULT)
			-- Process `a_expression'.
		do
			if a_expression.contains_position (current_position) then
				if attached current_closure as l_closure and then attached l_closure.type as l_type then
					create {ET_BROWSABLE_RESULT} last_browsable_name.make (a_expression, l_type, current_class)
				end
			end
		end

	process_result_address (a_expression: ET_RESULT_ADDRESS)
			-- Process `a_expression'.
		do
			process_result (a_expression.result_keyword)
		end

	process_static_call_expression (a_expression: ET_STATIC_CALL_EXPRESSION)
			-- Process `a_expression'.
		do
			if attached a_expression.parenthesis_call as l_parenthesis_call then
				process_qualified_feature_call (l_parenthesis_call)
			else
				process_static_feature_call (a_expression)
			end
			if last_browsable_name = Void then
				precursor (a_expression)
			end
		end

	process_static_call_instruction (a_instruction: ET_STATIC_CALL_INSTRUCTION)
			-- Process `a_instruction'.
		do
			if attached a_instruction.parenthesis_call as l_parenthesis_call then
				process_qualified_feature_call (l_parenthesis_call)
			else
				process_static_feature_call (a_instruction)
			end
			if last_browsable_name = Void then
				precursor (a_instruction)
			end
		end

	process_static_feature_call (a_call: ET_STATIC_FEATURE_CALL)
			-- Process `a_call'.
		require
			a_call_not_void: a_call /= Void
		local
			l_name: ET_CALL_NAME
			l_target_type: ET_BASE_TYPE
		do
			l_name := a_call.name
			if l_name.contains_position (current_position) then
				internal_type_context.reset (current_class)
				internal_type_context.put_last (a_call.type)
				l_target_type := internal_type_context.base_type
				if attached l_target_type.base_class.seeded_feature (l_name.seed) as l_feature then
					create {ET_BROWSABLE_QUALIFIED_CALL_NAME} last_browsable_name.make (l_name, l_feature, l_target_type, current_class)
				end
			end
		end

	process_tuple_type (a_type: ET_TUPLE_TYPE)
			-- Process `a_type'.
		local
			l_name: ET_IDENTIFIER
		do
			l_name := a_type.tuple_keyword
			if l_name.contains_position (current_position) then
				create {ET_BROWSABLE_CLASS_NAME} last_browsable_name.make (l_name, a_type.base_class, current_class)
			end
			if last_browsable_name = Void then
				precursor (a_type)
			end
		end

	process_type_rename_constraint (a_type_rename_constraint: ET_TYPE_RENAME_CONSTRAINT)
			-- Process `a_type_rename_constraint'.
		local
			l_renames: ET_CONSTRAINT_RENAME_LIST
			i, nb: INTEGER
			l_rename: ET_RENAME
			l_name: ET_FEATURE_NAME
			l_extended_name: ET_EXTENDED_FEATURE_NAME
			l_target_type: ET_BASE_TYPE
			j, nb2: INTEGER
			l_alias_string: ET_MANIFEST_STRING
		do
			l_renames := a_type_rename_constraint.renames
			nb := l_renames.count
			from i := 1 until i > nb loop
				l_rename := l_renames.rename_pair (i)
				l_name := l_rename.old_name
				if l_name.contains_position (current_position) then
					internal_type_context.reset (current_class)
					internal_type_context.put_last (a_type_rename_constraint.type)
					l_target_type := internal_type_context.base_type
					if attached l_target_type.base_class.seeded_feature (l_name.seed) as l_feature then
						create {ET_BROWSABLE_QUALIFIED_CALL_NAME} last_browsable_name.make (l_name, l_feature, l_target_type, current_class)
					end
				end
				l_extended_name := l_rename.new_name
				l_name := l_extended_name.feature_name
				if l_name.contains_position (current_position) then
					internal_type_context.reset (current_class)
					internal_type_context.put_last (a_type_rename_constraint.type)
					l_target_type := internal_type_context.base_type
					if attached l_target_type.base_class.seeded_feature (l_name.seed) as l_feature then
						create {ET_BROWSABLE_QUALIFIED_CALL_NAME} last_browsable_name.make (l_name, l_feature, l_target_type, current_class)
					end
				end
				if attached l_extended_name.alias_names as l_alias_names then
					nb2 := l_alias_names.count
					from j := 1 until j > nb2 loop
						l_alias_string := l_alias_names.item (j).alias_string
						if l_alias_string.contains_position (current_position) then
							internal_type_context.reset (current_class)
							internal_type_context.put_last (a_type_rename_constraint.type)
							l_target_type := internal_type_context.base_type
							if attached l_target_type.base_class.seeded_feature (l_name.seed) as l_feature then
								create {ET_BROWSABLE_QUALIFIED_CALL_NAME} last_browsable_name.make (l_alias_string, l_feature, l_target_type, current_class)
							end
						end
						j := j + 1
					end
				end
				i := i + 1
			end
			if last_browsable_name = Void then
				precursor (a_type_rename_constraint)
			end
		end

	process_unique_attribute (a_feature: ET_UNIQUE_ATTRIBUTE)
			-- Process `a_feature'.
		local
			l_old_closure: like current_closure
		do
			l_old_closure := current_closure
			current_closure := a_feature
			precursor (a_feature)
			current_closure := l_old_closure
		end

	process_unqualified_call_expression (a_expression: ET_UNQUALIFIED_CALL_EXPRESSION)
			-- Process `a_expression'.
		do
			if attached a_expression.parenthesis_call as l_parenthesis_call then
				process_qualified_feature_call (l_parenthesis_call)
				if last_browsable_name = Void then
					precursor (a_expression)
				end
			else
				precursor (a_expression)
			end
		end

	process_unqualified_call_instruction (a_instruction: ET_UNQUALIFIED_CALL_INSTRUCTION)
			-- Process `a_instruction'.
		do
			if attached a_instruction.parenthesis_call as l_parenthesis_call then
				process_qualified_feature_call (l_parenthesis_call)
				if last_browsable_name = Void then
					precursor (a_instruction)
				end
			else
				precursor (a_instruction)
			end
		end

feature {NONE} -- Implementation

	current_position: ET_POSITION
			-- Position of the browsable name being searched?

	current_closure: detachable ET_CLOSURE
			-- Closure (feature, invariant, inline agent)
			-- being processed

	ast_node_is_below (a_ast_node: ET_AST_NODE; a_position: ET_POSITION): BOOLEAN
			-- Is `a_ast_node` below `a_position` in the class text?
		require
			a_ast_node_not_void: a_ast_node /= Void
			a_position_not_void: a_position /= Void
		local
			l_first_position: ET_POSITION
		do
			l_first_position := a_ast_node.first_position
			if l_first_position.line > a_position.line then
				Result := True
			elseif l_first_position.line = a_position.line then
				Result := l_first_position.column > a_position.column
			end
		end

	ast_node_is_above (a_ast_node: ET_AST_NODE; a_position: ET_POSITION): BOOLEAN
			-- Is `a_ast_node` above `a_position` in the class text?
		require
			a_ast_node_not_void: a_ast_node /= Void
			a_position_not_void: a_position /= Void
		local
			l_last_position: ET_POSITION
		do
			l_last_position := a_ast_node.last_position
			if l_last_position.line < a_position.line then
				Result := True
			elseif l_last_position.line = a_position.line then
				Result := l_last_position.column < a_position.column
			end
		end

	ast_node_contains (a_ast_node: ET_AST_NODE; a_position: ET_POSITION): BOOLEAN
			-- Does `a_ast_node` contains character at `a_position` in the class text?
		require
			a_ast_node_not_void: a_ast_node /= Void
			a_position_not_void: a_position /= Void
		do
			if a_ast_node.first_position.line /= 0 and a_ast_node.last_position.line /= 0 then
				Result := not ast_node_is_above (a_ast_node, a_position) and not ast_node_is_below (a_ast_node, a_position)
			end
		end

	expression_type_finder: ET_EXPRESSION_TYPE_FINDER
			-- Expression type finder

	internal_type_context: ET_NESTED_TYPE_CONTEXT
			-- Type context to be used internally

invariant

	current_class_not_void: current_class /= Void
	current_position_not_void: current_position /= Void
	expression_type_finder_not_void: expression_type_finder /= Void
	internal_type_context_not_void: internal_type_context /= Void

end
