note

	description:

		"Eiffel AST iterators"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003-2010, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_AST_ITERATOR

inherit

	ET_AST_PROCESSOR

create

	make

feature {ET_AST_NODE} -- Processing

	process_actual_argument_list (a_list: ET_ACTUAL_ARGUMENT_LIST)
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			a_list.left_symbol.process (Current)
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.item (i).process (Current)
				i := i + 1
			end
			a_list.right_symbol.process (Current)
		end

	process_actual_parameter_comma (a_parameter: ET_ACTUAL_PARAMETER_COMMA)
			-- Process `a_parameter'.
		do
			a_parameter.actual_parameter.process (Current)
			a_parameter.comma.process (Current)
		end

	process_actual_parameter_list (a_list: ET_ACTUAL_PARAMETER_LIST)
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			a_list.left_bracket.process (Current)
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.item (i).process (Current)
				i := i + 1
			end
			a_list.right_bracket.process (Current)
		end

	process_agent_argument_operand_comma (an_argument: ET_AGENT_ARGUMENT_OPERAND_COMMA)
			-- Process `an_argument'.
		do
			an_argument.agent_actual_argument.process (Current)
			an_argument.comma.process (Current)
		end

	process_agent_argument_operand_list (a_list: ET_AGENT_ARGUMENT_OPERAND_LIST)
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			a_list.left_parenthesis.process (Current)
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.item (i).process (Current)
				i := i + 1
			end
			a_list.right_parenthesis.process (Current)
		end

	process_agent_implicit_current_target (a_target: ET_AGENT_IMPLICIT_CURRENT_TARGET)
			-- Process `a_target'.
		do
			-- Do nothing.
		end

	process_agent_implicit_open_argument (an_argument: ET_AGENT_IMPLICIT_OPEN_ARGUMENT)
			-- Process `an_argument'.
		do
			-- Do nothing.
		end

	process_agent_keyword (a_keyword: ET_AGENT_KEYWORD)
			-- Process `a_keyword'.
		do
			process_keyword (a_keyword)
		end

	process_agent_open_target (a_target: ET_AGENT_OPEN_TARGET)
			-- Process `a_target'.
		do
			a_target.left_brace.process (Current)
			a_target.type.process (Current)
			a_target.right_brace.process (Current)
		end

	process_agent_typed_open_argument (an_argument: ET_AGENT_TYPED_OPEN_ARGUMENT)
			-- Process `an_argument'.
		do
			an_argument.left_brace.process (Current)
			an_argument.type.process (Current)
			an_argument.right_brace.process (Current)
			an_argument.question_mark.process (Current)
		end

	process_alias_free_name (a_name: ET_ALIAS_FREE_NAME)
			-- Process `a_name'.
		do
			a_name.alias_keyword.process (Current)
			a_name.alias_string.process (Current)
		end

	process_alias_name (a_name: ET_ALIAS_NAME)
			-- Process `a_name'.
		do
			a_name.alias_keyword.process (Current)
			a_name.alias_string.process (Current)
		end

	process_aliased_feature_name (a_name: ET_ALIASED_FEATURE_NAME)
			-- Process `a_name'.
		do
			a_name.feature_name.process (Current)
			a_name.alias_name.process (Current)
		end

	process_all_export (an_export: ET_ALL_EXPORT)
			-- Process `an_export'.
		do
			an_export.clients_clause.process (Current)
			an_export.all_keyword.process (Current)
		end

	process_assertion_semicolon (an_assertion: ET_ASSERTION_SEMICOLON)
			-- Process `an_assertion'.
		do
			an_assertion.assertion.process (Current)
			an_assertion.semicolon.process (Current)
		end

	process_assign_feature_name (an_assigner: ET_ASSIGN_FEATURE_NAME)
			-- Process `an_assigner'.
		do
			an_assigner.assign_keyword.process (Current)
			an_assigner.feature_name.process (Current)
		end

	process_assigner_instruction (an_instruction: ET_ASSIGNER_INSTRUCTION)
			-- Process `an_instruction'.
		do
			an_instruction.call.process (Current)
			an_instruction.assign_symbol.process (Current)
			an_instruction.source.process (Current)
		end

	process_assignment (an_instruction: ET_ASSIGNMENT)
			-- Process `an_instruction'.
		do
			an_instruction.target.process (Current)
			an_instruction.assign_symbol.process (Current)
			an_instruction.source.process (Current)
		end

	process_assignment_attempt (an_instruction: ET_ASSIGNMENT_ATTEMPT)
			-- Process `an_instruction'.
		do
			an_instruction.target.process (Current)
			an_instruction.assign_attempt_symbol.process (Current)
			an_instruction.source.process (Current)
		end

	process_attribute (a_feature: ET_ATTRIBUTE)
			-- Process `a_feature'.
		local
			a_frozen_keyword: ET_TOKEN
			a_synonym: ET_FEATURE
			a_semicolon: ET_SEMICOLON_SYMBOL
			an_assigner: ET_ASSIGNER
		do
			from
				a_synonym := a_feature
			until
				a_synonym = Void
			loop
				a_frozen_keyword := a_synonym.frozen_keyword
				if a_frozen_keyword /= Void then
					a_frozen_keyword.process (Current)
				end
				a_synonym.extended_name.process (Current)
				a_synonym := a_synonym.synonym
			end
			a_feature.declared_type.process (Current)
			an_assigner := a_feature.assigner
			if an_assigner /= Void then
				an_assigner.process (Current)
			end
			a_semicolon := a_feature.semicolon
			if a_semicolon /= Void then
				a_semicolon.process (Current)
			end
		end

	process_bang_instruction (an_instruction: ET_BANG_INSTRUCTION)
			-- Process `an_instruction'.
		local
			a_type: ET_TYPE
			a_call: ET_QUALIFIED_CALL
		do
			an_instruction.left_bang.process (Current)
			a_type := an_instruction.type
			if a_type /= Void then
				a_type.process (Current)
			end
			an_instruction.right_bang.process (Current)
			an_instruction.target.process (Current)
			a_call := an_instruction.creation_call
			if a_call /= Void then
				a_call.process (Current)
			end
		end

	process_binary_integer_constant (a_constant: ET_BINARY_INTEGER_CONSTANT)
			-- Process `a_constant'.
		local
			a_type: ET_TARGET_TYPE
			a_sign: ET_SYMBOL_OPERATOR
		do
			a_type := a_constant.cast_type
			if a_type /= Void then
				a_type.process (Current)
			end
			a_sign := a_constant.sign
			if a_sign /= Void then
				a_sign.process (Current)
			end
		end

	process_bit_constant (a_constant: ET_BIT_CONSTANT)
			-- Process `a_constant'.
		do
		end

	process_bit_feature (a_type: ET_BIT_FEATURE)
			-- Process `a_type'.
		do
			a_type.bit_keyword.process (Current)
			a_type.name.process (Current)
		end

	process_bit_n (a_type: ET_BIT_N)
			-- Process `a_type'.
		do
			a_type.bit_keyword.process (Current)
			a_type.constant.process (Current)
		end

	process_braced_class_name (a_name: ET_BRACED_CLASS_NAME)
			-- Process `a_name'.
		do
			a_name.left_brace.process (Current)
			a_name.class_name.process (Current)
			a_name.right_brace.process (Current)
		end

	process_braced_type (a_type: ET_BRACED_TYPE)
			-- Process `a_type'.
		do
			a_type.left_brace.process (Current)
			a_type.type.process (Current)
			a_type.right_brace.process (Current)
		end

	process_braced_type_list (a_list: ET_BRACED_TYPE_LIST)
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			a_list.left_brace.process (Current)
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.item (i).process (Current)
				i := i + 1
			end
			a_list.right_brace.process (Current)
		end

	process_bracket_argument_list (a_list: ET_BRACKET_ARGUMENT_LIST)
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			a_list.left_symbol.process (Current)
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.item (i).process (Current)
				i := i + 1
			end
			a_list.right_symbol.process (Current)
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

	process_bracket_symbol (a_symbol: ET_BRACKET_SYMBOL)
			-- Process `a_symbol'.
		do
			process_symbol (a_symbol)
		end

	process_break (a_break: ET_BREAK)
			-- Process `a_break'.
		do
		end

	process_c1_character_constant (a_constant: ET_C1_CHARACTER_CONSTANT)
			-- Process `a_constant'.
		local
			a_type: ET_TARGET_TYPE
		do
			a_type := a_constant.cast_type
			if a_type /= Void then
				a_type.process (Current)
			end
		end

	process_c2_character_constant (a_constant: ET_C2_CHARACTER_CONSTANT)
			-- Process `a_constant'.
		local
			a_type: ET_TARGET_TYPE
		do
			a_type := a_constant.cast_type
			if a_type /= Void then
				a_type.process (Current)
			end
		end

	process_c3_character_constant (a_constant: ET_C3_CHARACTER_CONSTANT)
			-- Process `a_constant'.
		local
			a_type: ET_TARGET_TYPE
		do
			a_type := a_constant.cast_type
			if a_type /= Void then
				a_type.process (Current)
			end
		end

	process_call_agent (an_expression: ET_CALL_AGENT)
			-- Process `an_expression'.
		local
			a_target: ET_AGENT_TARGET
			an_arguments: ET_AGENT_ARGUMENT_OPERAND_LIST
		do
			a_target := an_expression.target
			an_expression.agent_keyword.process (Current)
			a_target.process (Current)
			an_expression.qualified_name.process (Current)
			an_arguments ?= an_expression.arguments
			if an_arguments /= Void then
				an_arguments.process (Current)
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
			an_expression.qualified_name.process (Current)
			an_arguments := an_expression.arguments
			if an_arguments /= Void then
				an_arguments.process (Current)
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
			an_instruction.qualified_name.process (Current)
			an_arguments := an_instruction.arguments
			if an_arguments /= Void then
				an_arguments.process (Current)
			end
		end

	process_check_instruction (an_instruction: ET_CHECK_INSTRUCTION)
			-- Process `an_instruction'.
		local
			i, nb: INTEGER
		do
			an_instruction.check_keyword.process (Current)
			nb := an_instruction.count
			from i := 1 until i > nb loop
				an_instruction.item (i).process (Current)
				i := i + 1
			end
			an_instruction.end_keyword.process (Current)
		end

	process_choice_comma (a_choice: ET_CHOICE_COMMA)
			-- Process `a_choice'.
		do
			a_choice.choice.process (Current)
			a_choice.comma.process (Current)
		end

	process_choice_list (a_list: ET_CHOICE_LIST)
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			a_list.when_keyword.process (Current)
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.item (i).process (Current)
				i := i + 1
			end
		end

	process_choice_range (a_choice: ET_CHOICE_RANGE)
			-- Process `a_choice'.
		do
			a_choice.lower.process (Current)
			a_choice.dotdot.process (Current)
			a_choice.upper.process (Current)
		end

	process_class (a_class: ET_CLASS)
			-- Process `a_class'.
		local
			an_indexing: ET_INDEXING_LIST
			a_frozen: ET_KEYWORD
			a_class_mark: ET_CLASS_MARK
			an_external: ET_KEYWORD
			a_formal_parameters: ET_FORMAL_PARAMETER_LIST
			an_obsolete_message: ET_OBSOLETE
			a_parents: ET_PARENT_LIST
			a_creators: ET_CREATOR_LIST
			a_convert_features: ET_CONVERT_FEATURE_LIST
			an_invariants: ET_INVARIANTS
		do
			process_break (a_class.leading_break)
			an_indexing := a_class.first_indexing
			if an_indexing /= Void then
				an_indexing.process (Current)
			end
			a_frozen := a_class.frozen_keyword
			if a_frozen /= Void then
				a_frozen.process (Current)
			end
			a_class_mark := a_class.class_mark
			if a_class_mark /= Void then
				a_class_mark.process (Current)
			end
			an_external := a_class.external_keyword
			if an_external /= Void then
				an_external.process (Current)
			end
			a_class.class_keyword.process (Current)
			a_class.name.process (Current)
			a_formal_parameters := a_class.formal_parameters
			if a_formal_parameters /= Void then
				a_formal_parameters.process (Current)
			end
			an_obsolete_message := a_class.obsolete_message
			if an_obsolete_message /= Void then
				an_obsolete_message.process (Current)
			end
			a_parents := a_class.parent_clause
			if a_parents /= Void then
				a_parents.process (Current)
			end
			a_creators := a_class.creators
			if a_creators /= Void then
				a_creators.process (Current)
			end
			a_convert_features := a_class.convert_features
			if a_convert_features /= Void then
				a_convert_features.process (Current)
			end
			process_features (a_class)
			an_invariants := a_class.invariants
			if an_invariants /= Void then
				an_invariants.process (Current)
			end
			an_indexing := a_class.second_indexing
			if an_indexing /= Void then
				an_indexing.process (Current)
			end
			a_class.end_keyword.process (Current)
		end

	process_class_type (a_type: ET_CLASS_TYPE)
			-- Process `a_type'.
		local
			a_type_mark: ET_TYPE_MARK
		do
			a_type_mark := a_type.type_mark
			if a_type_mark /= Void then
				a_type_mark.process (Current)
			end
			a_type.name.process (Current)
		end

	process_client (a_client: ET_CLIENT)
			-- Process `a_client'.
		do
			a_client.name.process (Current)
		end

	process_client_comma (a_client_comma: ET_CLIENT_COMMA)
			-- Process `a_client_comma'.
		do
			a_client_comma.name.process (Current)
			a_client_comma.comma.process (Current)
		end

	process_clients (a_list: ET_CLIENTS)
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			a_list.left_brace.process (Current)
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.item (i).process (Current)
				i := i + 1
			end
			a_list.right_brace.process (Current)
		end

	process_colon_type (a_type: ET_COLON_TYPE)
			-- Process `a_type'.
		do
			a_type.colon.process (Current)
			a_type.type.process (Current)
		end

	process_compound (a_list: ET_COMPOUND)
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			a_list.keyword.process (Current)
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.item (i).process (Current)
				i := i + 1
			end
		end

	process_constant_attribute (a_feature: ET_CONSTANT_ATTRIBUTE)
			-- Process `a_feature'.
		local
			a_frozen_keyword: ET_TOKEN
			a_synonym: ET_FEATURE
			a_semicolon: ET_SEMICOLON_SYMBOL
			an_assigner: ET_ASSIGNER
		do
			from
				a_synonym := a_feature
			until
				a_synonym = Void
			loop
				a_frozen_keyword := a_synonym.frozen_keyword
				if a_frozen_keyword /= Void then
					a_frozen_keyword.process (Current)
				end
				a_synonym.extended_name.process (Current)
				a_synonym := a_synonym.synonym
			end
			a_feature.declared_type.process (Current)
			an_assigner := a_feature.assigner
			if an_assigner /= Void then
				an_assigner.process (Current)
			end
			a_feature.is_keyword.process (Current)
			a_feature.constant.process (Current)
			a_semicolon := a_feature.semicolon
			if a_semicolon /= Void then
				a_semicolon.process (Current)
			end
		end

	process_constrained_formal_parameter (a_parameter: ET_CONSTRAINED_FORMAL_PARAMETER)
			-- Process `a_parameter'.
		local
			a_creation_procedures: ET_CONSTRAINT_CREATOR
			a_type_mark: ET_KEYWORD
		do
			a_type_mark := a_parameter.type_mark
			if a_type_mark /= Void then
				a_type_mark.process (Current)
			end
			a_parameter.name.process (Current)
			a_parameter.arrow_symbol.process (Current)
			a_parameter.constraint.process (Current)
			a_creation_procedures := a_parameter.creation_procedures
			if a_creation_procedures /= Void then
				a_creation_procedures.process (Current)
			end
		end

	process_constraint_creator (a_list: ET_CONSTRAINT_CREATOR)
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			a_list.create_keyword.process (Current)
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.item (i).process (Current)
				i := i + 1
			end
			a_list.end_keyword.process (Current)
		end

	process_convert_builtin_expression (a_convert_expression: ET_CONVERT_BUILTIN_EXPRESSION)
			-- Process `a_convert_expression'.
		do
			a_convert_expression.expression.process (Current)
		end

	process_convert_feature_comma (a_convert_feature: ET_CONVERT_FEATURE_COMMA)
			-- Process `a_convert_feature'.
		do
			a_convert_feature.convert_feature.process (Current)
			a_convert_feature.comma.process (Current)
		end

	process_convert_feature_list (a_list: ET_CONVERT_FEATURE_LIST)
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			a_list.convert_keyword.process (Current)
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.item (i).process (Current)
				i := i + 1
			end
		end

	process_convert_function (a_convert_function: ET_CONVERT_FUNCTION)
			-- Process `a_convert_function'.
		do
			a_convert_function.name.process (Current)
			a_convert_function.colon.process (Current)
			a_convert_function.types.process (Current)
		end

	process_convert_from_expression (a_convert_expression: ET_CONVERT_FROM_EXPRESSION)
			-- Process `a_convert_expression'.
		do
			a_convert_expression.expression.process (Current)
		end

	process_convert_procedure (a_convert_procedure: ET_CONVERT_PROCEDURE)
			-- Process `a_convert_procedure'.
		do
			a_convert_procedure.name.process (Current)
			a_convert_procedure.left_parenthesis.process (Current)
			a_convert_procedure.types.process (Current)
			a_convert_procedure.right_parenthesis.process (Current)
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
		do
			an_expression.create_keyword.process (Current)
			an_expression.creation_type.process (Current)
			a_call := an_expression.creation_call
			if a_call /= Void then
				a_call.process (Current)
			end
		end

	process_create_instruction (an_instruction: ET_CREATE_INSTRUCTION)
			-- Process `an_instruction'.
		local
			a_type: ET_TARGET_TYPE
			a_call: ET_QUALIFIED_CALL
		do
			an_instruction.create_keyword.process (Current)
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

	process_creator (a_list: ET_CREATOR)
			-- Process `a_list'.
		local
			a_clients: ET_CLIENTS
			i, nb: INTEGER
		do
			a_list.creation_keyword.process (Current)
			a_clients := a_list.clients_clause
			if a_clients /= Void then
				a_clients.process (Current)
			end
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.item (i).process (Current)
				i := i + 1
			end
		end

	process_creator_list (a_list: ET_CREATOR_LIST)
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

	process_current (an_expression: ET_CURRENT)
			-- Process `an_expression'.
		do
			process_keyword (an_expression)
		end

	process_current_address (an_expression: ET_CURRENT_ADDRESS)
			-- Process `an_expression'.
		do
			an_expression.dollar.process (Current)
			an_expression.current_keyword.process (Current)
		end

	process_custom_attribute (an_attribute: ET_CUSTOM_ATTRIBUTE)
			-- Process `an_attribute'.
		local
			l_settings: ET_MANIFEST_TUPLE
		do
			an_attribute.creation_expression.process (Current)
			l_settings := an_attribute.settings
			if l_settings /= Void then
				l_settings.process (Current)
			end
			an_attribute.end_keyword.process (Current)
		end

	process_debug_instruction (an_instruction: ET_DEBUG_INSTRUCTION)
			-- Process `an_instruction'.
		local
			a_compound: ET_COMPOUND
			a_keys: ET_MANIFEST_STRING_LIST
			i, nb: INTEGER
		do
			a_compound := an_instruction.compound
			if a_compound /= Void then
				a_compound.keyword.process (Current)
			end
			a_keys := an_instruction.keys
			if a_keys /= Void then
				a_keys.process (Current)
			end
			if a_compound /= Void then
				nb := a_compound.count
				from i := 1 until i > nb loop
					a_compound.item (i).process (Current)
					i := i + 1
				end
			end
			an_instruction.end_keyword.process (Current)
		end

	process_deferred_function (a_feature: ET_DEFERRED_FUNCTION)
			-- Process `a_feature'.
		local
			a_frozen_keyword: ET_TOKEN
			a_synonym: ET_FEATURE
			an_arguments: ET_FORMAL_ARGUMENT_LIST
			an_indexing: ET_INDEXING_LIST
			an_obsolete_message: ET_OBSOLETE
			a_preconditions: ET_PRECONDITIONS
			a_postconditions: ET_POSTCONDITIONS
			a_semicolon: ET_SEMICOLON_SYMBOL
			a_is_keyword: ET_KEYWORD
			an_assigner: ET_ASSIGNER
		do
			from
				a_synonym := a_feature
			until
				a_synonym = Void
			loop
				a_frozen_keyword := a_synonym.frozen_keyword
				if a_frozen_keyword /= Void then
					a_frozen_keyword.process (Current)
				end
				a_synonym.extended_name.process (Current)
				a_synonym := a_synonym.synonym
			end
			an_arguments := a_feature.arguments
			if an_arguments /= Void then
				an_arguments.process (Current)
			end
			a_feature.declared_type.process (Current)
			an_assigner := a_feature.assigner
			if an_assigner /= Void then
				an_assigner.process (Current)
			end
			a_is_keyword := a_feature.is_keyword
			if a_is_keyword /= Void then
				a_is_keyword.process (Current)
			end
			an_indexing := a_feature.first_indexing
			if an_indexing /= Void then
				an_indexing.process (Current)
			end
			an_obsolete_message := a_feature.obsolete_message
			if an_obsolete_message /= Void then
				an_obsolete_message.process (Current)
			end
			a_preconditions := a_feature.preconditions
			if a_preconditions /= Void then
				a_preconditions.process (Current)
			end
			a_feature.deferred_keyword.process (Current)
			a_postconditions := a_feature.postconditions
			if a_postconditions /= Void then
				a_postconditions.process (Current)
			end
			a_feature.end_keyword.process (Current)
			a_semicolon := a_feature.semicolon
			if a_semicolon /= Void then
				a_semicolon.process (Current)
			end
		end

	process_deferred_procedure (a_feature: ET_DEFERRED_PROCEDURE)
			-- Process `a_feature'.
		local
			a_frozen_keyword: ET_TOKEN
			a_synonym: ET_FEATURE
			an_arguments: ET_FORMAL_ARGUMENT_LIST
			an_indexing: ET_INDEXING_LIST
			an_obsolete_message: ET_OBSOLETE
			a_preconditions: ET_PRECONDITIONS
			a_postconditions: ET_POSTCONDITIONS
			a_semicolon: ET_SEMICOLON_SYMBOL
			a_is_keyword: ET_KEYWORD
		do
			from
				a_synonym := a_feature
			until
				a_synonym = Void
			loop
				a_frozen_keyword := a_synonym.frozen_keyword
				if a_frozen_keyword /= Void then
					a_frozen_keyword.process (Current)
				end
				a_synonym.extended_name.process (Current)
				a_synonym := a_synonym.synonym
			end
			an_arguments := a_feature.arguments
			if an_arguments /= Void then
				an_arguments.process (Current)
			end
			a_is_keyword := a_feature.is_keyword
			if a_is_keyword /= Void then
				a_is_keyword.process (Current)
			end
			an_indexing := a_feature.first_indexing
			if an_indexing /= Void then
				an_indexing.process (Current)
			end
			an_obsolete_message := a_feature.obsolete_message
			if an_obsolete_message /= Void then
				an_obsolete_message.process (Current)
			end
			a_preconditions := a_feature.preconditions
			if a_preconditions /= Void then
				a_preconditions.process (Current)
			end
			a_feature.deferred_keyword.process (Current)
			a_postconditions := a_feature.postconditions
			if a_postconditions /= Void then
				a_postconditions.process (Current)
			end
			a_feature.end_keyword.process (Current)
			a_semicolon := a_feature.semicolon
			if a_semicolon /= Void then
				a_semicolon.process (Current)
			end
		end

	process_do_function (a_feature: ET_DO_FUNCTION)
			-- Process `a_feature'.
		local
			a_frozen_keyword: ET_TOKEN
			a_synonym: ET_FEATURE
			an_arguments: ET_FORMAL_ARGUMENT_LIST
			an_indexing: ET_INDEXING_LIST
			an_obsolete_message: ET_OBSOLETE
			a_preconditions: ET_PRECONDITIONS
			a_locals: ET_LOCAL_VARIABLE_LIST
			a_postconditions: ET_POSTCONDITIONS
			a_compound: ET_COMPOUND
			a_semicolon: ET_SEMICOLON_SYMBOL
			a_is_keyword: ET_KEYWORD
			an_assigner: ET_ASSIGNER
		do
			from
				a_synonym := a_feature
			until
				a_synonym = Void
			loop
				a_frozen_keyword := a_synonym.frozen_keyword
				if a_frozen_keyword /= Void then
					a_frozen_keyword.process (Current)
				end
				a_synonym.extended_name.process (Current)
				a_synonym := a_synonym.synonym
			end
			an_arguments := a_feature.arguments
			if an_arguments /= Void then
				an_arguments.process (Current)
			end
			a_feature.declared_type.process (Current)
			an_assigner := a_feature.assigner
			if an_assigner /= Void then
				an_assigner.process (Current)
			end
			a_is_keyword := a_feature.is_keyword
			if a_is_keyword /= Void then
				a_is_keyword.process (Current)
			end
			an_indexing := a_feature.first_indexing
			if an_indexing /= Void then
				an_indexing.process (Current)
			end
			an_obsolete_message := a_feature.obsolete_message
			if an_obsolete_message /= Void then
				an_obsolete_message.process (Current)
			end
			a_preconditions := a_feature.preconditions
			if a_preconditions /= Void then
				a_preconditions.process (Current)
			end
			a_locals := a_feature.locals
			if a_locals /= Void then
				a_locals.process (Current)
			end
			a_compound := a_feature.compound
			if a_compound /= Void then
				a_compound.process (Current)
			end
			a_postconditions := a_feature.postconditions
			if a_postconditions /= Void then
				a_postconditions.process (Current)
			end
			a_compound := a_feature.rescue_clause
			if a_compound /= Void then
				a_compound.process (Current)
			end
			a_feature.end_keyword.process (Current)
			a_semicolon := a_feature.semicolon
			if a_semicolon /= Void then
				a_semicolon.process (Current)
			end
		end

	process_do_function_inline_agent (an_expression: ET_DO_FUNCTION_INLINE_AGENT)
			-- Process `an_expression'.
		local
			a_formal_arguments: ET_FORMAL_ARGUMENT_LIST
			an_actual_arguments: ET_AGENT_ARGUMENT_OPERAND_LIST
			a_preconditions: ET_PRECONDITIONS
			a_locals: ET_LOCAL_VARIABLE_LIST
			a_postconditions: ET_POSTCONDITIONS
			a_compound: ET_COMPOUND
		do
			an_expression.agent_keyword.process (Current)
			a_formal_arguments := an_expression.formal_arguments
			if a_formal_arguments /= Void then
				a_formal_arguments.process (Current)
			end
			an_expression.declared_type.process (Current)
			a_preconditions := an_expression.preconditions
			if a_preconditions /= Void then
				a_preconditions.process (Current)
			end
			a_locals := an_expression.locals
			if a_locals /= Void then
				a_locals.process (Current)
			end
			a_compound := an_expression.compound
			if a_compound /= Void then
				a_compound.process (Current)
			end
			a_postconditions := an_expression.postconditions
			if a_postconditions /= Void then
				a_postconditions.process (Current)
			end
			a_compound := an_expression.rescue_clause
			if a_compound /= Void then
				a_compound.process (Current)
			end
			an_expression.end_keyword.process (Current)
			an_actual_arguments ?= an_expression.actual_arguments
			if an_actual_arguments /= Void then
				an_actual_arguments.process (Current)
			end
		end

	process_do_procedure (a_feature: ET_DO_PROCEDURE)
			-- Process `a_feature'.
		local
			a_frozen_keyword: ET_TOKEN
			a_synonym: ET_FEATURE
			an_arguments: ET_FORMAL_ARGUMENT_LIST
			an_indexing: ET_INDEXING_LIST
			an_obsolete_message: ET_OBSOLETE
			a_preconditions: ET_PRECONDITIONS
			a_locals: ET_LOCAL_VARIABLE_LIST
			a_postconditions: ET_POSTCONDITIONS
			a_compound: ET_COMPOUND
			a_semicolon: ET_SEMICOLON_SYMBOL
			a_is_keyword: ET_KEYWORD
		do
			from
				a_synonym := a_feature
			until
				a_synonym = Void
			loop
				a_frozen_keyword := a_synonym.frozen_keyword
				if a_frozen_keyword /= Void then
					a_frozen_keyword.process (Current)
				end
				a_synonym.extended_name.process (Current)
				a_synonym := a_synonym.synonym
			end
			an_arguments := a_feature.arguments
			if an_arguments /= Void then
				an_arguments.process (Current)
			end
			a_is_keyword := a_feature.is_keyword
			if a_is_keyword /= Void then
				a_is_keyword.process (Current)
			end
			an_indexing := a_feature.first_indexing
			if an_indexing /= Void then
				an_indexing.process (Current)
			end
			an_obsolete_message := a_feature.obsolete_message
			if an_obsolete_message /= Void then
				an_obsolete_message.process (Current)
			end
			a_preconditions := a_feature.preconditions
			if a_preconditions /= Void then
				a_preconditions.process (Current)
			end
			a_locals := a_feature.locals
			if a_locals /= Void then
				a_locals.process (Current)
			end
			a_compound := a_feature.compound
			if a_compound /= Void then
				a_compound.process (Current)
			end
			a_postconditions := a_feature.postconditions
			if a_postconditions /= Void then
				a_postconditions.process (Current)
			end
			a_compound := a_feature.rescue_clause
			if a_compound /= Void then
				a_compound.process (Current)
			end
			a_feature.end_keyword.process (Current)
			a_semicolon := a_feature.semicolon
			if a_semicolon /= Void then
				a_semicolon.process (Current)
			end
		end

	process_do_procedure_inline_agent (an_expression: ET_DO_PROCEDURE_INLINE_AGENT)
			-- Process `an_expression'.
		local
			a_formal_arguments: ET_FORMAL_ARGUMENT_LIST
			an_actual_arguments: ET_AGENT_ARGUMENT_OPERAND_LIST
			a_preconditions: ET_PRECONDITIONS
			a_locals: ET_LOCAL_VARIABLE_LIST
			a_postconditions: ET_POSTCONDITIONS
			a_compound: ET_COMPOUND
		do
			an_expression.agent_keyword.process (Current)
			a_formal_arguments := an_expression.formal_arguments
			if a_formal_arguments /= Void then
				a_formal_arguments.process (Current)
			end
			a_preconditions := an_expression.preconditions
			if a_preconditions /= Void then
				a_preconditions.process (Current)
			end
			a_locals := an_expression.locals
			if a_locals /= Void then
				a_locals.process (Current)
			end
			a_compound := an_expression.compound
			if a_compound /= Void then
				a_compound.process (Current)
			end
			a_postconditions := an_expression.postconditions
			if a_postconditions /= Void then
				a_postconditions.process (Current)
			end
			a_compound := an_expression.rescue_clause
			if a_compound /= Void then
				a_compound.process (Current)
			end
			an_expression.end_keyword.process (Current)
			an_actual_arguments ?= an_expression.actual_arguments
			if an_actual_arguments /= Void then
				an_actual_arguments.process (Current)
			end
		end

	process_dot_feature_name (a_name: ET_DOT_FEATURE_NAME)
			-- Process `a_name'.
		do
			a_name.dot.process (Current)
			a_name.feature_name.process (Current)
		end

	process_dotnet_attribute (a_feature: ET_DOTNET_ATTRIBUTE)
			-- Process `a_feature'.
		do
			process_attribute (a_feature)
		end

	process_dotnet_constant_attribute (a_feature: ET_DOTNET_CONSTANT_ATTRIBUTE)
			-- Process `a_feature'.
		do
			process_constant_attribute (a_feature)
		end

	process_dotnet_function (a_feature: ET_DOTNET_FUNCTION)
			-- Process `a_feature'.
		local
			a_frozen_keyword: ET_TOKEN
			a_synonym: ET_FEATURE
			an_arguments: ET_FORMAL_ARGUMENT_LIST
			a_semicolon: ET_SEMICOLON_SYMBOL
			a_is_keyword: ET_KEYWORD
			an_assigner: ET_ASSIGNER
		do
			from
				a_synonym := a_feature
			until
				a_synonym = Void
			loop
				a_frozen_keyword := a_synonym.frozen_keyword
				if a_frozen_keyword /= Void then
					a_frozen_keyword.process (Current)
				end
				a_synonym.extended_name.process (Current)
				a_synonym := a_synonym.synonym
			end
			an_arguments := a_feature.arguments
			if an_arguments /= Void then
				an_arguments.process (Current)
			end
			a_feature.declared_type.process (Current)
			an_assigner := a_feature.assigner
			if an_assigner /= Void then
				an_assigner.process (Current)
			end
			a_is_keyword := a_feature.is_keyword
			if a_is_keyword /= Void then
				a_is_keyword.process (Current)
			end
			a_feature.end_keyword.process (Current)
			a_semicolon := a_feature.semicolon
			if a_semicolon /= Void then
				a_semicolon.process (Current)
			end
		end

	process_dotnet_procedure (a_feature: ET_DOTNET_PROCEDURE)
			-- Process `a_feature'.
		local
			a_frozen_keyword: ET_TOKEN
			a_synonym: ET_FEATURE
			an_arguments: ET_FORMAL_ARGUMENT_LIST
			a_semicolon: ET_SEMICOLON_SYMBOL
			a_is_keyword: ET_KEYWORD
		do
			from
				a_synonym := a_feature
			until
				a_synonym = Void
			loop
				a_frozen_keyword := a_synonym.frozen_keyword
				if a_frozen_keyword /= Void then
					a_frozen_keyword.process (Current)
				end
				a_synonym.extended_name.process (Current)
				a_synonym := a_synonym.synonym
			end
			an_arguments := a_feature.arguments
			if an_arguments /= Void then
				an_arguments.process (Current)
			end
			a_is_keyword := a_feature.is_keyword
			if a_is_keyword /= Void then
				a_is_keyword.process (Current)
			end
			a_feature.end_keyword.process (Current)
			a_semicolon := a_feature.semicolon
			if a_semicolon /= Void then
				a_semicolon.process (Current)
			end
		end

	process_elseif_part (an_elseif_part: ET_ELSEIF_PART)
			-- Process `an_elseif_part'.
		local
			a_compound: ET_COMPOUND
		do
			an_elseif_part.conditional.process (Current)
			a_compound := an_elseif_part.then_compound
			if a_compound /= Void then
				a_compound.process (Current)
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
			an_expression.operator.process (Current)
			an_expression.right.process (Current)
		end

	process_export_list (a_list: ET_EXPORT_LIST)
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			a_list.export_keyword.process (Current)
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.item (i).process (Current)
				i := i + 1
			end
		end

	process_expression_address (an_expression: ET_EXPRESSION_ADDRESS)
			-- Process `an_expression'.
		do
			an_expression.dollar.process (Current)
			an_expression.expression.process (Current)
		end

	process_expression_comma (an_expression: ET_EXPRESSION_COMMA)
			-- Process `an_expression'.
		do
			an_expression.expression.process (Current)
			an_expression.comma.process (Current)
		end

	process_extended_attribute (a_feature: ET_EXTENDED_ATTRIBUTE)
			-- Process `a_feature'.
		local
			a_frozen_keyword: ET_TOKEN
			a_synonym: ET_FEATURE
			an_indexing: ET_INDEXING_LIST
			an_obsolete_message: ET_OBSOLETE
			a_preconditions: ET_PRECONDITIONS
			a_postconditions: ET_POSTCONDITIONS
			a_semicolon: ET_SEMICOLON_SYMBOL
			an_assigner: ET_ASSIGNER
		do
			from
				a_synonym := a_feature
			until
				a_synonym = Void
			loop
				a_frozen_keyword := a_synonym.frozen_keyword
				if a_frozen_keyword /= Void then
					a_frozen_keyword.process (Current)
				end
				a_synonym.extended_name.process (Current)
				a_synonym := a_synonym.synonym
			end
			a_feature.declared_type.process (Current)
			an_assigner := a_feature.assigner
			if an_assigner /= Void then
				an_assigner.process (Current)
			end
			an_indexing := a_feature.first_indexing
			if an_indexing /= Void then
				an_indexing.process (Current)
			end
			an_obsolete_message := a_feature.obsolete_message
			if an_obsolete_message /= Void then
				an_obsolete_message.process (Current)
			end
			a_preconditions := a_feature.preconditions
			if a_preconditions /= Void then
				a_preconditions.process (Current)
			end
			a_feature.attribute_keyword.process (Current)
			a_postconditions := a_feature.postconditions
			if a_postconditions /= Void then
				a_postconditions.process (Current)
			end
			a_feature.end_keyword.process (Current)
			a_semicolon := a_feature.semicolon
			if a_semicolon /= Void then
				a_semicolon.process (Current)
			end
		end

	process_extended_feature_name_comma (a_name: ET_EXTENDED_FEATURE_NAME_COMMA)
			-- Process `a_name'.
		do
			a_name.extended_feature_name.process (Current)
			a_name.comma.process (Current)
		end

	process_external_function (a_feature: ET_EXTERNAL_FUNCTION)
			-- Process `a_feature'.
		local
			a_frozen_keyword: ET_TOKEN
			a_synonym: ET_FEATURE
			an_arguments: ET_FORMAL_ARGUMENT_LIST
			an_indexing: ET_INDEXING_LIST
			an_obsolete_message: ET_OBSOLETE
			a_preconditions: ET_PRECONDITIONS
			an_alias_clause: ET_EXTERNAL_ALIAS
			a_postconditions: ET_POSTCONDITIONS
			a_semicolon: ET_SEMICOLON_SYMBOL
			a_is_keyword: ET_KEYWORD
			an_assigner: ET_ASSIGNER
		do
			from
				a_synonym := a_feature
			until
				a_synonym = Void
			loop
				a_frozen_keyword := a_synonym.frozen_keyword
				if a_frozen_keyword /= Void then
					a_frozen_keyword.process (Current)
				end
				a_synonym.extended_name.process (Current)
				a_synonym := a_synonym.synonym
			end
			an_arguments := a_feature.arguments
			if an_arguments /= Void then
				an_arguments.process (Current)
			end
			a_feature.declared_type.process (Current)
			an_assigner := a_feature.assigner
			if an_assigner /= Void then
				an_assigner.process (Current)
			end
			a_is_keyword := a_feature.is_keyword
			if a_is_keyword /= Void then
				a_is_keyword.process (Current)
			end
			an_indexing := a_feature.first_indexing
			if an_indexing /= Void then
				an_indexing.process (Current)
			end
			an_obsolete_message := a_feature.obsolete_message
			if an_obsolete_message /= Void then
				an_obsolete_message.process (Current)
			end
			a_preconditions := a_feature.preconditions
			if a_preconditions /= Void then
				a_preconditions.process (Current)
			end
			a_feature.language.process (Current)
			an_alias_clause := a_feature.alias_clause
			if an_alias_clause /= Void then
				an_alias_clause.process (Current)
			end
			a_postconditions := a_feature.postconditions
			if a_postconditions /= Void then
				a_postconditions.process (Current)
			end
			a_feature.end_keyword.process (Current)
			a_semicolon := a_feature.semicolon
			if a_semicolon /= Void then
				a_semicolon.process (Current)
			end
		end

	process_external_function_inline_agent (an_expression: ET_EXTERNAL_FUNCTION_INLINE_AGENT)
			-- Process `an_expression'.
		local
			a_formal_arguments: ET_FORMAL_ARGUMENT_LIST
			an_actual_arguments: ET_AGENT_ARGUMENT_OPERAND_LIST
			a_preconditions: ET_PRECONDITIONS
			an_alias_clause: ET_EXTERNAL_ALIAS
			a_postconditions: ET_POSTCONDITIONS
		do
			an_expression.agent_keyword.process (Current)
			a_formal_arguments := an_expression.formal_arguments
			if a_formal_arguments /= Void then
				a_formal_arguments.process (Current)
			end
			an_expression.declared_type.process (Current)
			a_preconditions := an_expression.preconditions
			if a_preconditions /= Void then
				a_preconditions.process (Current)
			end
			an_expression.language.process (Current)
			an_alias_clause := an_expression.alias_clause
			if an_alias_clause /= Void then
				an_alias_clause.process (Current)
			end
			a_postconditions := an_expression.postconditions
			if a_postconditions /= Void then
				a_postconditions.process (Current)
			end
			an_expression.end_keyword.process (Current)
			an_actual_arguments ?= an_expression.actual_arguments
			if an_actual_arguments /= Void then
				an_actual_arguments.process (Current)
			end
		end

	process_external_procedure (a_feature: ET_EXTERNAL_PROCEDURE)
			-- Process `a_feature'.
		local
			a_frozen_keyword: ET_TOKEN
			a_synonym: ET_FEATURE
			an_arguments: ET_FORMAL_ARGUMENT_LIST
			an_indexing: ET_INDEXING_LIST
			an_obsolete_message: ET_OBSOLETE
			a_preconditions: ET_PRECONDITIONS
			an_alias_clause: ET_EXTERNAL_ALIAS
			a_postconditions: ET_POSTCONDITIONS
			a_semicolon: ET_SEMICOLON_SYMBOL
			a_is_keyword: ET_KEYWORD
		do
			from
				a_synonym := a_feature
			until
				a_synonym = Void
			loop
				a_frozen_keyword := a_synonym.frozen_keyword
				if a_frozen_keyword /= Void then
					a_frozen_keyword.process (Current)
				end
				a_synonym.extended_name.process (Current)
				a_synonym := a_synonym.synonym
			end
			an_arguments := a_feature.arguments
			if an_arguments /= Void then
				an_arguments.process (Current)
			end
			a_is_keyword := a_feature.is_keyword
			if a_is_keyword /= Void then
				a_is_keyword.process (Current)
			end
			an_indexing := a_feature.first_indexing
			if an_indexing /= Void then
				an_indexing.process (Current)
			end
			an_obsolete_message := a_feature.obsolete_message
			if an_obsolete_message /= Void then
				an_obsolete_message.process (Current)
			end
			a_preconditions := a_feature.preconditions
			if a_preconditions /= Void then
				a_preconditions.process (Current)
			end
			a_feature.language.process (Current)
			an_alias_clause := a_feature.alias_clause
			if an_alias_clause /= Void then
				an_alias_clause.process (Current)
			end
			a_postconditions := a_feature.postconditions
			if a_postconditions /= Void then
				a_postconditions.process (Current)
			end
			a_feature.end_keyword.process (Current)
			a_semicolon := a_feature.semicolon
			if a_semicolon /= Void then
				a_semicolon.process (Current)
			end
		end

	process_external_procedure_inline_agent (an_expression: ET_EXTERNAL_PROCEDURE_INLINE_AGENT)
			-- Process `an_expression'.
		local
			a_formal_arguments: ET_FORMAL_ARGUMENT_LIST
			an_actual_arguments: ET_AGENT_ARGUMENT_OPERAND_LIST
			a_preconditions: ET_PRECONDITIONS
			an_alias_clause: ET_EXTERNAL_ALIAS
			a_postconditions: ET_POSTCONDITIONS
		do
			an_expression.agent_keyword.process (Current)
			a_formal_arguments := an_expression.formal_arguments
			if a_formal_arguments /= Void then
				a_formal_arguments.process (Current)
			end
			a_preconditions := an_expression.preconditions
			if a_preconditions /= Void then
				a_preconditions.process (Current)
			end
			an_expression.language.process (Current)
			an_alias_clause := an_expression.alias_clause
			if an_alias_clause /= Void then
				an_alias_clause.process (Current)
			end
			a_postconditions := an_expression.postconditions
			if a_postconditions /= Void then
				a_postconditions.process (Current)
			end
			an_expression.end_keyword.process (Current)
			an_actual_arguments ?= an_expression.actual_arguments
			if an_actual_arguments /= Void then
				an_actual_arguments.process (Current)
			end
		end

	process_false_constant (a_constant: ET_FALSE_CONSTANT)
			-- Process `a_constant'.
		do
			process_keyword (a_constant)
		end

	process_feature_address (an_expression: ET_FEATURE_ADDRESS)
			-- Process `an_expression'.
		do
			an_expression.dollar.process (Current)
			an_expression.name.process (Current)
		end

	process_feature_clause (a_feature_clause: ET_FEATURE_CLAUSE)
			-- Process `a_feature_clause'.
		local
			a_clients: ET_CLIENTS
		do
			a_feature_clause.feature_keyword.process (Current)
			a_clients := a_feature_clause.clients_clause
			if a_clients /= Void then
				a_clients.process (Current)
			end
		end

	process_feature_clause_list (a_list: ET_FEATURE_CLAUSE_LIST)
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

	process_feature_export (an_export: ET_FEATURE_EXPORT)
			-- Process `an_export'.
		local
			i, nb: INTEGER
		do
			an_export.clients_clause.process (Current)
			nb := an_export.count
			from i := 1 until i > nb loop
				an_export.item (i).process (Current)
				i := i + 1
			end
		end

	process_feature_name_comma (a_name: ET_FEATURE_NAME_COMMA)
			-- Process `a_name'.
		do
			a_name.feature_name.process (Current)
			a_name.comma.process (Current)
		end

	process_features (a_class: ET_CLASS)
			-- Process feature clauses of `a_class'.
		require
			a_class_not_void: a_class /= Void
		local
			a_feature_clauses: ET_FEATURE_CLAUSE_LIST
			a_feature_clause: ET_FEATURE_CLAUSE
			l_queries: ET_QUERY_LIST
			l_query: ET_QUERY
			l_procedures: ET_PROCEDURE_LIST
			l_procedure: ET_PROCEDURE
			i, nb: INTEGER
			j, nb_queries: INTEGER
			k, nb_procedures: INTEGER
		do
			a_feature_clauses := a_class.feature_clauses
			if a_feature_clauses /= Void then
				j := 1
				l_queries := a_class.queries
				nb_queries := l_queries.count
				if nb_queries > 0 then
					l_query := l_queries.first
				end
				k := 1
				l_procedures := a_class.procedures
				nb_procedures := l_procedures.count
				if nb_procedures > 0 then
					l_procedure := l_procedures.first
				end
				nb := a_feature_clauses.count
				from i := 1 until i > nb loop
					a_feature_clause := a_feature_clauses.item (i)
					a_feature_clause.process (Current)
					from
					until
						(l_query = Void or else l_query.feature_clause /= a_feature_clause) and
						(l_procedure = Void or else l_procedure.feature_clause /= a_feature_clause)
					loop
						if l_query /= Void and then l_query.feature_clause = a_feature_clause then
							if l_procedure /= Void and then l_procedure.feature_clause = a_feature_clause then
								if l_query.name.position < l_procedure.name.position then
									l_query.process (Current)
									from
									until
										l_query = Void or else l_query.synonym = Void
									loop
										j := j + 1
										if j <= nb_queries then
											l_query := l_queries.item (j)
										else
											l_query := Void
										end
									end
									j := j + 1
									if j <= nb_queries then
										l_query := l_queries.item (j)
									else
										l_query := Void
									end
								else
									l_procedure.process (Current)
									from
									until
										l_procedure = Void or else l_procedure.synonym = Void
									loop
										k := k + 1
										if k <= nb_procedures then
											l_procedure := l_procedures.item (k)
										else
											l_procedure := Void
										end
									end
									k := k + 1
									if k <= nb_procedures then
										l_procedure := l_procedures.item (k)
									else
										l_procedure := Void
									end
								end
							else
								l_query.process (Current)
								from
								until
									l_query = Void or else l_query.synonym = Void
								loop
									j := j + 1
									if j <= nb_queries then
										l_query := l_queries.item (j)
									else
										l_query := Void
									end
								end
								j := j + 1
								if j <= nb_queries then
									l_query := l_queries.item (j)
								else
									l_query := Void
								end
							end
						else
							l_procedure.process (Current)
							from
							until
								l_procedure = Void or else l_procedure.synonym = Void
							loop
								k := k + 1
								if k <= nb_procedures then
									l_procedure := l_procedures.item (k)
								else
									l_procedure := Void
								end
							end
							k := k + 1
							if k <= nb_procedures then
								l_procedure := l_procedures.item (k)
							else
								l_procedure := Void
							end
						end
					end
					i := i + 1
				end
			end
		end

	process_formal_argument (an_argument: ET_FORMAL_ARGUMENT)
			-- Process `an_argument'.
		do
			an_argument.name_item.process (Current)
			an_argument.declared_type.process (Current)
		end

	process_formal_argument_semicolon (an_argument: ET_FORMAL_ARGUMENT_SEMICOLON)
			-- Process `an_argument'.
		do
			an_argument.formal_argument.process (Current)
			an_argument.semicolon.process (Current)
		end

	process_formal_argument_list (a_list: ET_FORMAL_ARGUMENT_LIST)
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			a_list.left_parenthesis.process (Current)
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.item (i).process (Current)
				i := i + 1
			end
			a_list.right_parenthesis.process (Current)
		end

	process_formal_comma_argument (an_argument: ET_FORMAL_COMMA_ARGUMENT)
			-- Process `an_argument'.
		do
			an_argument.name_item.process (Current)
		end

	process_formal_parameter (a_parameter: ET_FORMAL_PARAMETER)
			-- Process `a_parameter'.
		local
			a_type_mark: ET_KEYWORD
		do
			a_type_mark := a_parameter.type_mark
			if a_type_mark /= Void then
				a_type_mark.process (Current)
			end
			a_parameter.name.process (Current)
		end

	process_formal_parameter_comma (a_parameter: ET_FORMAL_PARAMETER_COMMA)
			-- Process `a_parameter'.
		do
			a_parameter.formal_parameter.process (Current)
			a_parameter.comma.process (Current)
		end

	process_formal_parameter_list (a_list: ET_FORMAL_PARAMETER_LIST)
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			a_list.left_bracket.process (Current)
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.item (i).process (Current)
				i := i + 1
			end
			a_list.right_bracket.process (Current)
		end

	process_formal_parameter_type (a_type: ET_FORMAL_PARAMETER_TYPE)
			-- Process `a_type'.
		local
			l_type_mark: ET_TYPE_MARK
		do
			l_type_mark := a_type.type_mark
			if l_type_mark /= Void then
				l_type_mark.process (Current)
			end
			a_type.name.process (Current)
		end

	process_free_operator (an_operator: ET_FREE_OPERATOR)
			-- Process `an_operator'.
		do
			process_token (an_operator)
		end

	process_generic_class_type (a_type: ET_GENERIC_CLASS_TYPE)
			-- Process `a_type'.
		do
			process_class_type (a_type)
			a_type.actual_parameters.process (Current)
		end

	process_hexadecimal_integer_constant (a_constant: ET_HEXADECIMAL_INTEGER_CONSTANT)
			-- Process `a_constant'.
		local
			a_type: ET_TARGET_TYPE
			a_sign: ET_SYMBOL_OPERATOR
		do
			a_type := a_constant.cast_type
			if a_type /= Void then
				a_type.process (Current)
			end
			a_sign := a_constant.sign
			if a_sign /= Void then
				a_sign.process (Current)
			end
		end

	process_identifier (an_identifier: ET_IDENTIFIER)
			-- Process `an_identifier'.
		do
			process_token (an_identifier)
		end

	process_identifier_colon (an_identifier: ET_IDENTIFIER_COLON)
			-- Process `an_identifier'.
		do
			an_identifier.identifier.process (Current)
			an_identifier.colon.process (Current)
		end

	process_identifier_comma (an_identifier: ET_IDENTIFIER_COMMA)
			-- Process `an_identifier'.
		do
			an_identifier.identifier.process (Current)
			an_identifier.comma.process (Current)
		end

	process_if_instruction (an_instruction: ET_IF_INSTRUCTION)
			-- Process `an_instruction'.
		local
			an_elseif_parts: ET_ELSEIF_PART_LIST
			a_compound: ET_COMPOUND
		do
			an_instruction.conditional.process (Current)
			a_compound := an_instruction.then_compound
			if a_compound /= Void then
				a_compound.process (Current)
			end
			an_elseif_parts := an_instruction.elseif_parts
			if an_elseif_parts /= Void then
				an_elseif_parts.process (Current)
			end
			a_compound := an_instruction.else_compound
			if a_compound /= Void then
				a_compound.process (Current)
			end
			an_instruction.end_keyword.process (Current)
		end

	process_indexing (an_indexing: ET_INDEXING)
			-- Process `an_indexing'.
		do
			an_indexing.terms.process (Current)
		end

	process_indexing_list (a_list: ET_INDEXING_LIST)
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			a_list.indexing_keyword.process (Current)
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.item (i).process (Current)
				i := i + 1
			end
		end

	process_indexing_semicolon (an_indexing: ET_INDEXING_SEMICOLON)
			-- Process `an_indexing'.
		do
			an_indexing.indexing_item.process (Current)
			an_indexing.semicolon.process (Current)
		end

	process_indexing_term_comma (an_indexing_term: ET_INDEXING_TERM_COMMA)
			-- Process `an_indexing_term'.
		do
			an_indexing_term.indexing_term.process (Current)
			an_indexing_term.comma.process (Current)
		end

	process_indexing_term_list (a_list: ET_INDEXING_TERM_LIST)
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

	process_infix_cast_expression (an_expression: ET_INFIX_CAST_EXPRESSION)
			-- Process `an_expression'.
		do
			an_expression.expression.process (Current)
		end

	process_infix_and_then_operator (an_operator: ET_INFIX_AND_THEN_OPERATOR)
			-- Process `an_operator'.
		do
			an_operator.and_keyword.process (Current)
			an_operator.then_keyword.process (Current)
		end

	process_infix_expression (an_expression: ET_INFIX_EXPRESSION)
			-- Process `an_expression'.
		do
			an_expression.left.process (Current)
			an_expression.name.process (Current)
			an_expression.right.process (Current)
		end

	process_infix_free_name (a_name: ET_INFIX_FREE_NAME)
			-- Process `a_name'.
		do
			process_infix_name (a_name)
		end

	process_infix_name (a_name: ET_INFIX_NAME)
			-- Process `a_name'.
		do
			a_name.infix_keyword.process (Current)
			a_name.operator_name.process (Current)
		end

	process_infix_or_else_operator (an_operator: ET_INFIX_OR_ELSE_OPERATOR)
			-- Process `an_operator'.
		do
			an_operator.or_keyword.process (Current)
			an_operator.else_keyword.process (Current)
		end

	process_inspect_instruction (an_instruction: ET_INSPECT_INSTRUCTION)
			-- Process `an_instruction'.
		local
			a_when_parts: ET_WHEN_PART_LIST
			an_else_compound: ET_COMPOUND
		do
			an_instruction.conditional.process (Current)
			a_when_parts := an_instruction.when_parts
			if a_when_parts /= Void then
				a_when_parts.process (Current)
			end
			an_else_compound := an_instruction.else_compound
			if an_else_compound /= Void then
				an_else_compound.process (Current)
			end
			an_instruction.end_keyword.process (Current)
		end

	process_invariants (a_list: ET_INVARIANTS)
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			a_list.invariant_keyword.process (Current)
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.item (i).process (Current)
				i := i + 1
			end
		end

	process_keyword (a_keyword: ET_KEYWORD)
			-- Process `a_keyword'.
		do
			process_token (a_keyword)
		end

	process_keyword_expression (an_expression: ET_KEYWORD_EXPRESSION)
			-- Process `an_expression'.
		do
			an_expression.keyword.process (Current)
			an_expression.expression.process (Current)
		end

	process_keyword_feature_name_list (a_list: ET_KEYWORD_FEATURE_NAME_LIST)
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			a_list.keyword.process (Current)
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.item (i).process (Current)
				i := i + 1
			end
		end

	process_keyword_manifest_string (a_string: ET_KEYWORD_MANIFEST_STRING)
			-- Process `a_string'.
		do
			a_string.keyword.process (Current)
			a_string.manifest_string.process (Current)
		end

	process_keyword_operator (a_keyword: ET_KEYWORD_OPERATOR)
			-- Process `a_keyword'.
		do
			process_keyword (a_keyword)
		end

	process_labeled_actual_parameter (a_parameter: ET_LABELED_ACTUAL_PARAMETER)
			-- Process `a_parameter'.
		do
			a_parameter.label_item.process (Current)
			a_parameter.declared_type.process (Current)
		end

	process_labeled_actual_parameter_semicolon (a_parameter: ET_LABELED_ACTUAL_PARAMETER_SEMICOLON)
			-- Process `a_parameter'.
		do
			a_parameter.actual_parameter.process (Current)
			a_parameter.semicolon.process (Current)
		end

	process_labeled_comma_actual_parameter (a_parameter: ET_LABELED_COMMA_ACTUAL_PARAMETER)
			-- Process `a_parameter'.
		do
			a_parameter.label_item.process (Current)
		end

	process_like_current (a_type: ET_LIKE_CURRENT)
			-- Process `a_type'.
		local
			l_type_mark: ET_TYPE_MARK
		do
			l_type_mark := a_type.type_mark
			if l_type_mark /= Void then
				l_type_mark.process (Current)
			end
			a_type.like_keyword.process (Current)
			a_type.current_keyword.process (Current)
		end

	process_like_feature (a_type: ET_LIKE_FEATURE)
			-- Process `a_type'.
		local
			l_type_mark: ET_TYPE_MARK
		do
			l_type_mark := a_type.type_mark
			if l_type_mark /= Void then
				l_type_mark.process (Current)
			end
			a_type.like_keyword.process (Current)
			a_type.name.process (Current)
		end

	process_local_variable_semicolon (a_local: ET_LOCAL_VARIABLE_SEMICOLON)
			-- Process `an_argument'.
		do
			a_local.local_variable.process (Current)
			a_local.semicolon.process (Current)
		end

	process_local_comma_variable (a_local: ET_LOCAL_COMMA_VARIABLE)
			-- Process `a_local'.
		do
			a_local.name_item.process (Current)
		end

	process_local_variable (a_local: ET_LOCAL_VARIABLE)
			-- Process `a_local'.
		do
			a_local.name_item.process (Current)
			a_local.declared_type.process (Current)
		end

	process_local_variable_list (a_list: ET_LOCAL_VARIABLE_LIST)
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			a_list.local_keyword.process (Current)
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.item (i).process (Current)
				i := i + 1
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
				a_compound.process (Current)
			end
			an_invariant_part := an_instruction.invariant_part
			if an_invariant_part /= Void then
				an_invariant_part.process (Current)
			end
			a_variant_part := an_instruction.variant_part
			if a_variant_part /= Void and an_instruction.has_old_variant_syntax then
				a_variant_part.process (Current)
			end
			an_instruction.until_conditional.process (Current)
			a_compound := an_instruction.loop_compound
			if a_compound /= Void then
				a_compound.process (Current)
			end
			if a_variant_part /= Void and not an_instruction.has_old_variant_syntax then
				a_variant_part.process (Current)
			end
			an_instruction.end_keyword.process (Current)
		end

	process_loop_invariants (a_list: ET_LOOP_INVARIANTS)
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			a_list.invariant_keyword.process (Current)
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.item (i).process (Current)
				i := i + 1
			end
		end

	process_manifest_array (an_expression: ET_MANIFEST_ARRAY)
			-- Process `an_expression'.
		local
			i, nb: INTEGER
		do
			an_expression.left_symbol.process (Current)
			nb := an_expression.count
			from i := 1 until i > nb loop
				an_expression.item (i).process (Current)
				i := i + 1
			end
			an_expression.right_symbol.process (Current)
		end

	process_manifest_string_comma (a_string: ET_MANIFEST_STRING_COMMA)
			-- Process `a_string'.
		do
			a_string.manifest_string.process (Current)
			a_string.comma.process (Current)
		end

	process_manifest_string_list (a_list: ET_MANIFEST_STRING_LIST)
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			a_list.left_parenthesis.process (Current)
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.item (i).process (Current)
				i := i + 1
			end
			a_list.right_parenthesis.process (Current)
		end

	process_manifest_tuple (an_expression: ET_MANIFEST_TUPLE)
			-- Process `an_expression'.
		local
			i, nb: INTEGER
		do
			an_expression.left_symbol.process (Current)
			nb := an_expression.count
			from i := 1 until i > nb loop
				an_expression.item (i).process (Current)
				i := i + 1
			end
			an_expression.right_symbol.process (Current)
		end

	process_manifest_type (an_expression: ET_MANIFEST_TYPE)
			-- Process `an_expression'.
		do
			an_expression.left_brace.process (Current)
			an_expression.type.process (Current)
			an_expression.right_brace.process (Current)
		end

	process_named_object_test (an_expression: ET_NAMED_OBJECT_TEST)
			-- Process `an_expression'.
		local
			l_declared_type: ET_TARGET_TYPE
		do
			an_expression.attached_keyword.process (Current)
			l_declared_type := an_expression.declared_type
			if l_declared_type /= Void then
				l_declared_type.process (Current)
			end
			an_expression.expression.process (Current)
			an_expression.as_keyword.process (Current)
			an_expression.name.process (Current)
		end

	process_object_equality_expression (an_expression: ET_OBJECT_EQUALITY_EXPRESSION)
			-- Process `an_expression'.
		do
			an_expression.left.process (Current)
			an_expression.operator.process (Current)
			an_expression.right.process (Current)
		end

	process_object_test (an_expression: ET_OBJECT_TEST)
			-- Process `an_expression'.
		local
			l_declared_type: ET_TARGET_TYPE
		do
			an_expression.attached_keyword.process (Current)
			l_declared_type := an_expression.declared_type
			if l_declared_type /= Void then
				l_declared_type.process (Current)
			end
			an_expression.expression.process (Current)
		end

	process_octal_integer_constant (a_constant: ET_OCTAL_INTEGER_CONSTANT)
			-- Process `a_constant'.
		local
			a_type: ET_TARGET_TYPE
			a_sign: ET_SYMBOL_OPERATOR
		do
			a_type := a_constant.cast_type
			if a_type /= Void then
				a_type.process (Current)
			end
			a_sign := a_constant.sign
			if a_sign /= Void then
				a_sign.process (Current)
			end
		end

	process_old_expression (an_expression: ET_OLD_EXPRESSION)
			-- Process `an_expression'.
		do
			an_expression.old_keyword.process (Current)
			an_expression.expression.process (Current)
		end

	process_old_object_test (an_expression: ET_OLD_OBJECT_TEST)
			-- Process `an_expression'.
		do
			an_expression.left_brace.process (Current)
			an_expression.name.process (Current)
			an_expression.colon.process (Current)
			an_expression.type.process (Current)
			an_expression.right_brace.process (Current)
			an_expression.expression.process (Current)
		end

	process_once_function (a_feature: ET_ONCE_FUNCTION)
			-- Process `a_feature'.
		local
			a_frozen_keyword: ET_TOKEN
			a_synonym: ET_FEATURE
			an_arguments: ET_FORMAL_ARGUMENT_LIST
			an_indexing: ET_INDEXING_LIST
			an_obsolete_message: ET_OBSOLETE
			a_preconditions: ET_PRECONDITIONS
			a_locals: ET_LOCAL_VARIABLE_LIST
			a_postconditions: ET_POSTCONDITIONS
			a_compound: ET_COMPOUND
			a_semicolon: ET_SEMICOLON_SYMBOL
			a_is_keyword: ET_KEYWORD
			an_assigner: ET_ASSIGNER
		do
			from
				a_synonym := a_feature
			until
				a_synonym = Void
			loop
				a_frozen_keyword := a_synonym.frozen_keyword
				if a_frozen_keyword /= Void then
					a_frozen_keyword.process (Current)
				end
				a_synonym.extended_name.process (Current)
				a_synonym := a_synonym.synonym
			end
			an_arguments := a_feature.arguments
			if an_arguments /= Void then
				an_arguments.process (Current)
			end
			a_feature.declared_type.process (Current)
			an_assigner := a_feature.assigner
			if an_assigner /= Void then
				an_assigner.process (Current)
			end
			a_is_keyword := a_feature.is_keyword
			if a_is_keyword /= Void then
				a_is_keyword.process (Current)
			end
			an_indexing := a_feature.first_indexing
			if an_indexing /= Void then
				an_indexing.process (Current)
			end
			an_obsolete_message := a_feature.obsolete_message
			if an_obsolete_message /= Void then
				an_obsolete_message.process (Current)
			end
			a_preconditions := a_feature.preconditions
			if a_preconditions /= Void then
				a_preconditions.process (Current)
			end
			a_locals := a_feature.locals
			if a_locals /= Void then
				a_locals.process (Current)
			end
			a_compound := a_feature.compound
			if a_compound /= Void then
				a_compound.process (Current)
			end
			a_postconditions := a_feature.postconditions
			if a_postconditions /= Void then
				a_postconditions.process (Current)
			end
			a_compound := a_feature.rescue_clause
			if a_compound /= Void then
				a_compound.process (Current)
			end
			a_feature.end_keyword.process (Current)
			a_semicolon := a_feature.semicolon
			if a_semicolon /= Void then
				a_semicolon.process (Current)
			end
		end

	process_once_function_inline_agent (an_expression: ET_ONCE_FUNCTION_INLINE_AGENT)
			-- Process `an_expression'.
		local
			a_formal_arguments: ET_FORMAL_ARGUMENT_LIST
			an_actual_arguments: ET_AGENT_ARGUMENT_OPERAND_LIST
			a_preconditions: ET_PRECONDITIONS
			a_locals: ET_LOCAL_VARIABLE_LIST
			a_postconditions: ET_POSTCONDITIONS
			a_compound: ET_COMPOUND
		do
			an_expression.agent_keyword.process (Current)
			a_formal_arguments := an_expression.formal_arguments
			if a_formal_arguments /= Void then
				a_formal_arguments.process (Current)
			end
			an_expression.declared_type.process (Current)
			a_preconditions := an_expression.preconditions
			if a_preconditions /= Void then
				a_preconditions.process (Current)
			end
			a_locals := an_expression.locals
			if a_locals /= Void then
				a_locals.process (Current)
			end
			a_compound := an_expression.compound
			if a_compound /= Void then
				a_compound.process (Current)
			end
			a_postconditions := an_expression.postconditions
			if a_postconditions /= Void then
				a_postconditions.process (Current)
			end
			a_compound := an_expression.rescue_clause
			if a_compound /= Void then
				a_compound.process (Current)
			end
			an_expression.end_keyword.process (Current)
			an_actual_arguments ?= an_expression.actual_arguments
			if an_actual_arguments /= Void then
				an_actual_arguments.process (Current)
			end
		end

	process_once_manifest_string (an_expression: ET_ONCE_MANIFEST_STRING)
			-- Process `an_expression'.
		do
			an_expression.once_keyword.process (Current)
			an_expression.manifest_string.process (Current)
		end

	process_once_procedure (a_feature: ET_ONCE_PROCEDURE)
			-- Process `a_feature'.
		local
			a_frozen_keyword: ET_TOKEN
			a_synonym: ET_FEATURE
			an_arguments: ET_FORMAL_ARGUMENT_LIST
			an_indexing: ET_INDEXING_LIST
			an_obsolete_message: ET_OBSOLETE
			a_preconditions: ET_PRECONDITIONS
			a_locals: ET_LOCAL_VARIABLE_LIST
			a_postconditions: ET_POSTCONDITIONS
			a_compound: ET_COMPOUND
			a_semicolon: ET_SEMICOLON_SYMBOL
			a_is_keyword: ET_KEYWORD
		do
			from
				a_synonym := a_feature
			until
				a_synonym = Void
			loop
				a_frozen_keyword := a_synonym.frozen_keyword
				if a_frozen_keyword /= Void then
					a_frozen_keyword.process (Current)
				end
				a_synonym.extended_name.process (Current)
				a_synonym := a_synonym.synonym
			end
			an_arguments := a_feature.arguments
			if an_arguments /= Void then
				an_arguments.process (Current)
			end
			a_is_keyword := a_feature.is_keyword
			if a_is_keyword /= Void then
				a_is_keyword.process (Current)
			end
			an_indexing := a_feature.first_indexing
			if an_indexing /= Void then
				an_indexing.process (Current)
			end
			an_obsolete_message := a_feature.obsolete_message
			if an_obsolete_message /= Void then
				an_obsolete_message.process (Current)
			end
			a_preconditions := a_feature.preconditions
			if a_preconditions /= Void then
				a_preconditions.process (Current)
			end
			a_locals := a_feature.locals
			if a_locals /= Void then
				a_locals.process (Current)
			end
			a_compound := a_feature.compound
			if a_compound /= Void then
				a_compound.process (Current)
			end
			a_postconditions := a_feature.postconditions
			if a_postconditions /= Void then
				a_postconditions.process (Current)
			end
			a_compound := a_feature.rescue_clause
			if a_compound /= Void then
				a_compound.process (Current)
			end
			a_feature.end_keyword.process (Current)
			a_semicolon := a_feature.semicolon
			if a_semicolon /= Void then
				a_semicolon.process (Current)
			end
		end

	process_once_procedure_inline_agent (an_expression: ET_ONCE_PROCEDURE_INLINE_AGENT)
			-- Process `an_expression'.
		local
			a_formal_arguments: ET_FORMAL_ARGUMENT_LIST
			an_actual_arguments: ET_AGENT_ARGUMENT_OPERAND_LIST
			a_preconditions: ET_PRECONDITIONS
			a_locals: ET_LOCAL_VARIABLE_LIST
			a_postconditions: ET_POSTCONDITIONS
			a_compound: ET_COMPOUND
		do
			an_expression.agent_keyword.process (Current)
			a_formal_arguments := an_expression.formal_arguments
			if a_formal_arguments /= Void then
				a_formal_arguments.process (Current)
			end
			a_preconditions := an_expression.preconditions
			if a_preconditions /= Void then
				a_preconditions.process (Current)
			end
			a_locals := an_expression.locals
			if a_locals /= Void then
				a_locals.process (Current)
			end
			a_compound := an_expression.compound
			if a_compound /= Void then
				a_compound.process (Current)
			end
			a_postconditions := an_expression.postconditions
			if a_postconditions /= Void then
				a_postconditions.process (Current)
			end
			a_compound := an_expression.rescue_clause
			if a_compound /= Void then
				a_compound.process (Current)
			end
			an_expression.end_keyword.process (Current)
			an_actual_arguments ?= an_expression.actual_arguments
			if an_actual_arguments /= Void then
				an_actual_arguments.process (Current)
			end
		end

	process_parent (a_parent: ET_PARENT)
			-- Process `a_parent'.
		local
			a_renames: ET_RENAME_LIST
			an_exports: ET_EXPORT_LIST
			an_undefines: ET_KEYWORD_FEATURE_NAME_LIST
			a_redefines: ET_KEYWORD_FEATURE_NAME_LIST
			a_selects: ET_KEYWORD_FEATURE_NAME_LIST
			an_end_keyword: ET_TOKEN
		do
			a_parent.type.process (Current)
			a_renames := a_parent.renames
			if a_renames /= Void then
				a_renames.process (Current)
			end
			an_exports := a_parent.exports
			if an_exports /= Void then
				an_exports.process (Current)
			end
			an_undefines := a_parent.undefines
			if an_undefines /= Void then
				an_undefines.process (Current)
			end
			a_redefines := a_parent.redefines
			if a_redefines /= Void then
				a_redefines.process (Current)
			end
			a_selects := a_parent.selects
			if a_selects /= Void then
				a_selects.process (Current)
			end
			an_end_keyword := a_parent.end_keyword
			if an_end_keyword /= Void then
				an_end_keyword.process (Current)
			end
		end

	process_parent_semicolon (a_parent: ET_PARENT_SEMICOLON)
			-- Process `a_parent'.
		do
			a_parent.parent.process (Current)
			a_parent.semicolon.process (Current)
		end

	process_parenthesized_expression (an_expression: ET_PARENTHESIZED_EXPRESSION)
			-- Process `an_expression'.
		do
			an_expression.left_parenthesis.process (Current)
			an_expression.expression.process (Current)
			an_expression.right_parenthesis.process (Current)
		end

	process_parent_list (a_list: ET_PARENT_LIST)
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			a_list.inherit_keyword.process (Current)
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.item (i).process (Current)
				i := i + 1
			end
		end

	process_postconditions (a_list: ET_POSTCONDITIONS)
			-- Process `a_list'.
		local
			i, nb: INTEGER
			a_then_keyword: ET_TOKEN
		do
			a_list.ensure_keyword.process (Current)
			a_then_keyword := a_list.then_keyword
			if a_then_keyword /= Void then
				a_then_keyword.process (Current)
			end
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.item (i).process (Current)
				i := i + 1
			end
		end

	process_preconditions (a_list: ET_PRECONDITIONS)
			-- Process `a_list'.
		local
			i, nb: INTEGER
			an_else_keyword: ET_TOKEN
		do
			a_list.require_keyword.process (Current)
			an_else_keyword := a_list.else_keyword
			if an_else_keyword /= Void then
				an_else_keyword.process (Current)
			end
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.item (i).process (Current)
				i := i + 1
			end
		end

	process_precursor_expression (an_expression: ET_PRECURSOR_EXPRESSION)
			-- Process `an_expression'.
		local
			a_parent_name: ET_PRECURSOR_CLASS_NAME
			an_arguments: ET_ACTUAL_ARGUMENT_LIST
		do
			if not an_expression.is_parent_prefixed then
				an_expression.precursor_keyword.process (Current)
			end
			a_parent_name := an_expression.parent_name
			if a_parent_name /= Void then
				a_parent_name.process (Current)
			end
			if an_expression.is_parent_prefixed then
				an_expression.precursor_keyword.process (Current)
			end
			an_arguments := an_expression.arguments
			if an_arguments /= Void then
				an_arguments.process (Current)
			end
		end

	process_precursor_instruction (an_instruction: ET_PRECURSOR_INSTRUCTION)
			-- Process `an_instruction'.
		local
			a_parent_name: ET_PRECURSOR_CLASS_NAME
			an_arguments: ET_ACTUAL_ARGUMENT_LIST
		do
			if not an_instruction.is_parent_prefixed then
				an_instruction.precursor_keyword.process (Current)
			end
			a_parent_name := an_instruction.parent_name
			if a_parent_name /= Void then
				a_parent_name.process (Current)
			end
			if an_instruction.is_parent_prefixed then
				an_instruction.precursor_keyword.process (Current)
			end
			an_arguments := an_instruction.arguments
			if an_arguments /= Void then
				an_arguments.process (Current)
			end
		end

	process_precursor_keyword (a_keyword: ET_PRECURSOR_KEYWORD)
			-- Process `a_keyword'.
		do
			process_keyword (a_keyword)
		end

	process_prefix_expression (an_expression: ET_PREFIX_EXPRESSION)
			-- Process `an_expression'.
		do
			an_expression.name.process (Current)
			an_expression.expression.process (Current)
		end

	process_prefix_free_name (a_name: ET_PREFIX_FREE_NAME)
			-- Process `a_name'.
		do
			process_prefix_name (a_name)
		end

	process_prefix_name (a_name: ET_PREFIX_NAME)
			-- Process `a_name'.
		do
			a_name.prefix_keyword.process (Current)
			a_name.operator_name.process (Current)
		end

	process_qualified_call (a_call: ET_QUALIFIED_CALL)
			-- Process `a_call'.
		local
			an_arguments: ET_ACTUAL_ARGUMENT_LIST
		do
			a_call.qualified_name.process (Current)
			an_arguments := a_call.arguments
			if an_arguments /= Void then
				an_arguments.process (Current)
			end
		end

	process_qualified_like_braced_type (a_type: ET_QUALIFIED_LIKE_BRACED_TYPE)
			-- Process `a_type'.
		do
			a_type.like_keyword.process (Current)
			a_type.left_brace.process (Current)
			a_type.target_type.process (Current)
			a_type.right_brace.process (Current)
			a_type.qualified_name.process (Current)
		end

	process_qualified_like_type (a_type: ET_QUALIFIED_LIKE_TYPE)
			-- Process `a_type'.
		do
			a_type.target_type.process (Current)
			a_type.qualified_name.process (Current)
		end

	process_question_mark_symbol (a_symbol: ET_QUESTION_MARK_SYMBOL)
			-- Process `a_symbol'.
		do
			process_symbol (a_symbol)
		end

	process_regular_integer_constant (a_constant: ET_REGULAR_INTEGER_CONSTANT)
			-- Process `a_constant'.
		local
			a_type: ET_TARGET_TYPE
			a_sign: ET_SYMBOL_OPERATOR
		do
			a_type := a_constant.cast_type
			if a_type /= Void then
				a_type.process (Current)
			end
			a_sign := a_constant.sign
			if a_sign /= Void then
				a_sign.process (Current)
			end
		end

	process_regular_manifest_string (a_string: ET_REGULAR_MANIFEST_STRING)
			-- Process `a_string'.
		local
			a_type: ET_TARGET_TYPE
		do
			a_type := a_string.cast_type
			if a_type /= Void then
				a_type.process (Current)
			end
		end

	process_regular_real_constant (a_constant: ET_REGULAR_REAL_CONSTANT)
			-- Process `a_constant'.
		local
			a_type: ET_TARGET_TYPE
			a_sign: ET_SYMBOL_OPERATOR
		do
			a_type := a_constant.cast_type
			if a_type /= Void then
				a_type.process (Current)
			end
			a_sign := a_constant.sign
			if a_sign /= Void then
				a_sign.process (Current)
			end
		end

	process_rename (a_rename: ET_RENAME)
			-- Process `a_rename'.
		do
			a_rename.old_name.process (Current)
			a_rename.as_keyword.process (Current)
			a_rename.new_name.process (Current)
		end

	process_rename_comma (a_rename: ET_RENAME_COMMA)
			-- Process `a_rename'.
		do
			process_rename (a_rename)
			a_rename.comma.process (Current)
		end

	process_rename_list (a_list: ET_RENAME_LIST)
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			a_list.rename_keyword.process (Current)
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.item (i).process (Current)
				i := i + 1
			end
		end

	process_result (an_expression: ET_RESULT)
			-- Process `an_expression'.
		do
			process_keyword (an_expression)
		end

	process_result_address (an_expression: ET_RESULT_ADDRESS)
			-- Process `an_expression'.
		do
			an_expression.dollar.process (Current)
			an_expression.result_keyword.process (Current)
		end

	process_retry_instruction (an_instruction: ET_RETRY_INSTRUCTION)
			-- Process `an_instruction'.
		do
			process_keyword (an_instruction)
		end

	process_semicolon_symbol (a_symbol: ET_SEMICOLON_SYMBOL)
			-- Process `a_symbol'.
		do
			process_symbol (a_symbol)
		end

	process_special_manifest_string (a_string: ET_SPECIAL_MANIFEST_STRING)
			-- Process `a_string'.
		local
			a_type: ET_TARGET_TYPE
		do
			a_type := a_string.cast_type
			if a_type /= Void then
				a_type.process (Current)
			end
		end

	process_static_call_expression (an_expression: ET_STATIC_CALL_EXPRESSION)
			-- Process `an_expression'.
		local
			an_arguments: ET_ACTUAL_ARGUMENT_LIST
			a_feature_keyword: ET_KEYWORD
		do
			a_feature_keyword := an_expression.feature_keyword
			if a_feature_keyword /= Void then
				a_feature_keyword.process (Current)
			end
			an_expression.static_type.process (Current)
			an_expression.qualified_name.process (Current)
			an_arguments := an_expression.arguments
			if an_arguments /= Void then
				an_arguments.process (Current)
			end
		end

	process_static_call_instruction (an_instruction: ET_STATIC_CALL_INSTRUCTION)
			-- Process `an_instruction'.
		local
			an_arguments: ET_ACTUAL_ARGUMENT_LIST
			a_feature_keyword: ET_KEYWORD
		do
			a_feature_keyword := an_instruction.feature_keyword
			if a_feature_keyword /= Void then
				a_feature_keyword.process (Current)
			end
			an_instruction.static_type.process (Current)
			an_instruction.qualified_name.process (Current)
			an_arguments := an_instruction.arguments
			if an_arguments /= Void then
				an_arguments.process (Current)
			end
		end

	process_strip_expression (an_expression: ET_STRIP_EXPRESSION)
			-- Process `an_expression'.
		local
			i, nb: INTEGER
		do
			an_expression.strip_keyword.process (Current)
			an_expression.left_parenthesis.process (Current)
			nb := an_expression.count
			from i := 1 until i > nb loop
				an_expression.item (i).process (Current)
				i := i + 1
			end
			an_expression.right_parenthesis.process (Current)
		end

	process_symbol (a_symbol: ET_SYMBOL)
			-- Process `a_symbol'.
		do
		end

	process_symbol_operator (a_symbol: ET_SYMBOL_OPERATOR)
			-- Process `a_symbol'.
		do
			process_symbol (a_symbol)
		end

	process_tagged_assertion (an_assertion: ET_TAGGED_ASSERTION)
			-- Process `an_assertion'.
		local
			an_expression: ET_EXPRESSION
		do
			an_assertion.tag.process (Current)
			an_expression := an_assertion.expression
			if an_expression /= Void then
				an_expression.process (Current)
			end
		end

	process_tagged_indexing (an_indexing: ET_TAGGED_INDEXING)
			-- Process `an_indexing'.
		do
			an_indexing.tag.process (Current)
			process_indexing (an_indexing)
		end

	process_token (a_token: ET_TOKEN)
			-- Process `a_token'.
		require
			a_token_not_void: a_token /= Void
		do
		end

	process_true_constant (a_constant: ET_TRUE_CONSTANT)
			-- Process `a_constant'.
		do
			process_keyword (a_constant)
		end

	process_tuple_type (a_type: ET_TUPLE_TYPE)
			-- Process `a_type'.
		local
			a_parameters: ET_ACTUAL_PARAMETER_LIST
			l_type_mark: ET_TYPE_MARK
		do
			l_type_mark := a_type.type_mark
			if l_type_mark /= Void then
				l_type_mark.process (Current)
			end
			a_type.tuple_keyword.process (Current)
			a_parameters := a_type.actual_parameters
			if a_parameters /= Void then
				a_parameters.process (Current)
			end
		end

	process_type_comma (a_type: ET_TYPE_COMMA)
			-- Process `a_type'.
		do
			a_type.type.process (Current)
			a_type.comma.process (Current)
		end

	process_underscored_integer_constant (a_constant: ET_UNDERSCORED_INTEGER_CONSTANT)
			-- Process `a_constant'.
		local
			a_type: ET_TARGET_TYPE
			a_sign: ET_SYMBOL_OPERATOR
		do
			a_type := a_constant.cast_type
			if a_type /= Void then
				a_type.process (Current)
			end
			a_sign := a_constant.sign
			if a_sign /= Void then
				a_sign.process (Current)
			end
		end

	process_underscored_real_constant (a_constant: ET_UNDERSCORED_REAL_CONSTANT)
			-- Process `a_constant'.
		local
			a_type: ET_TARGET_TYPE
			a_sign: ET_SYMBOL_OPERATOR
		do
			a_type := a_constant.cast_type
			if a_type /= Void then
				a_type.process (Current)
			end
			a_sign := a_constant.sign
			if a_sign /= Void then
				a_sign.process (Current)
			end
		end

	process_unique_attribute (a_feature: ET_UNIQUE_ATTRIBUTE)
			-- Process `a_feature'.
		local
			a_frozen_keyword: ET_TOKEN
			a_synonym: ET_FEATURE
			a_semicolon: ET_SEMICOLON_SYMBOL
			an_assigner: ET_ASSIGNER
		do
			from
				a_synonym := a_feature
			until
				a_synonym = Void
			loop
				a_frozen_keyword := a_synonym.frozen_keyword
				if a_frozen_keyword /= Void then
					a_frozen_keyword.process (Current)
				end
				a_synonym.extended_name.process (Current)
				a_synonym := a_synonym.synonym
			end
			a_feature.declared_type.process (Current)
			an_assigner := a_feature.assigner
			if an_assigner /= Void then
				an_assigner.process (Current)
			end
			a_feature.is_keyword.process (Current)
			a_feature.unique_keyword.process (Current)
			a_semicolon := a_feature.semicolon
			if a_semicolon /= Void then
				a_semicolon.process (Current)
			end
		end

	process_variant (a_variant: ET_VARIANT)
			-- Process `a_variant'.
		local
			a_tag: ET_TAG
		do
			a_variant.variant_keyword.process (Current)
			a_tag := a_variant.tag
			if a_tag /= Void then
				a_tag.process (Current)
			end
			a_variant.expression.process (Current)
		end

	process_verbatim_string (a_string: ET_VERBATIM_STRING)
			-- Process `a_string'.
		local
			a_type: ET_TARGET_TYPE
		do
			a_type := a_string.cast_type
			if a_type /= Void then
				a_type.process (Current)
			end
		end

	process_void (an_expression: ET_VOID)
			-- Process `an_expression'.
		do
			process_keyword (an_expression)
		end

	process_when_part (a_when_part: ET_WHEN_PART)
			-- Process `a_when_part'.
		local
			a_compound: ET_COMPOUND
		do
			a_when_part.choices.process (Current)
			a_compound := a_when_part.then_compound
			if a_compound /= Void then
				a_compound.process (Current)
			end
		end

	process_when_part_list (a_list: ET_WHEN_PART_LIST)
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

feature {ET_CLUSTER} -- Processing

	process_cluster (a_cluster: ET_CLUSTER)
			-- Process `a_cluster'.
		do
			-- Do not iterate over classes of `a_cluster'.
		end

feature {ET_MASTER_CLASS} -- Processing

	process_master_class (a_class: ET_MASTER_CLASS)
			-- Process `a_class'.
		do
			-- Do not iterate over classes of `a_class'.
		end

end
