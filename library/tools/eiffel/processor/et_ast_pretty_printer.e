indexing

	description:

		"Eiffel AST pretty printers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2007-2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_AST_PRETTY_PRINTER

inherit

	ET_AST_PRINTER
		redefine
			make, file,
			process_actual_argument_list,
			process_actual_parameter_list,
			process_agent_argument_operand_list,
			process_agent_typed_open_argument,
			process_alias_free_name,
			process_alias_name,
			process_aliased_feature_name,
			process_all_export,
			process_assign_feature_name,
			process_assigner_instruction,
			process_assignment,
			process_assignment_attempt,
			process_attribute,
			process_bang_instruction,
			process_bit_feature,
			process_bit_n,
			process_braced_type_list,
			process_bracket_argument_list,
			process_bracket_expression,
			process_break,
			process_c1_character_constant,
			process_c2_character_constant,
			process_c3_character_constant,
			process_call_agent,
			process_call_expression,
			process_call_instruction,
			process_check_instruction,
			process_choice_list,
			process_class,
			process_class_type,
			process_clients,
			process_colon_type,
			process_compound,
			process_constant_attribute,
			process_constrained_formal_parameter,
			process_constraint_creator,
			process_convert_feature_list,
			process_convert_function,
			process_convert_procedure,
			process_create_expression,
			process_create_instruction,
			process_creator,
			process_creator_list,
			process_custom_attribute,
			process_debug_instruction,
			process_deferred_function,
			process_deferred_procedure,
			process_do_function,
			process_do_function_inline_agent,
			process_do_procedure,
			process_do_procedure_inline_agent,
			process_dotnet_function,
			process_dotnet_procedure,
			process_elseif_part,
			process_elseif_part_list,
			process_equality_expression,
			process_export_list,
			process_external_function,
			process_external_function_inline_agent,
			process_external_procedure,
			process_external_procedure_inline_agent,
			process_feature_clause,
			process_feature_clause_list,
			process_feature_export,
			process_features,
			process_formal_argument,
			process_formal_argument_list,
			process_formal_comma_argument,
			process_formal_parameter,
			process_formal_parameter_list,
			process_generic_class_type,
			process_hexadecimal_integer_constant,
			process_if_instruction,
			process_indexing_list,
			process_indexing_term_list,
			process_infix_and_then_operator,
			process_infix_expression,
			process_infix_name,
			process_infix_or_else_operator,
			process_inspect_instruction,
			process_invariants,
			process_keyword_expression,
			process_keyword_feature_name_list,
			process_keyword_manifest_string,
			process_labeled_actual_parameter,
			process_labeled_comma_actual_parameter,
			process_like_current,
			process_like_feature,
			process_local_comma_variable,
			process_local_variable,
			process_local_variable_list,
			process_loop_instruction,
			process_loop_invariants,
			process_manifest_array,
			process_manifest_string_list,
			process_manifest_tuple,
			process_object_equality_expression,
			process_object_test,
			process_old_expression,
			process_once_function,
			process_once_function_inline_agent,
			process_once_manifest_string,
			process_once_procedure,
			process_once_procedure_inline_agent,
			process_parent,
			process_parent_list,
			process_postconditions,
			process_preconditions,
			process_precursor_expression,
			process_precursor_instruction,
			process_prefix_expression,
			process_prefix_name,
			process_qualified_call,
			process_qualified_like_braced_type,
			process_qualified_like_type,
			process_regular_integer_constant,
			process_regular_manifest_string,
			process_regular_real_constant,
			process_rename,
			process_rename_list,
			process_result,
			process_result_address,
			process_retry_instruction,
			process_semicolon_symbol,
			process_special_manifest_string,
			process_static_call_expression,
			process_static_call_instruction,
			process_strip_expression,
			process_symbol,
			process_tagged_assertion,
			process_tagged_indexing,
			process_token,
			process_true_constant,
			process_tuple_type,
			process_underscored_integer_constant,
			process_underscored_real_constant,
			process_unique_attribute,
			process_variant,
			process_verbatim_string,
			process_void,
			process_when_part,
			process_when_part_list
		end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

	KL_IMPORTED_ANY_ROUTINES
		export {NONE} all end

	ET_SHARED_TOKEN_CONSTANTS
		export {NONE} all end

create

	make, make_null

feature {NONE} -- Initialization

	make (a_file: like file) is
			-- Create a new AST pretty-printer, using `a_file' as output file.
		do
			precursor (a_file)
			create comment_finder.make
			create comment_list.make (20)
		end

feature -- Initialization

	reset is
			-- Reset for another pretty-printing.
		do
			reset_indentation
			indentation_printed := False
			comment_printed := False
			comment_list.wipe_out
			comment_finder.reset_excluded_nodes
		end

feature -- Access

	file: KI_TEXT_OUTPUT_STREAM
			-- Output file

feature -- Indentation

	indentation: INTEGER
			-- Indentation in `file'

	indent is
			-- Increment indentation.
		do
			indentation := indentation + 1
		ensure
			one_more: indentation = old indentation + 1
		end

	dedent is
			-- Decrement indentation.
		do
			indentation := indentation - 1
		ensure
			one_less: indentation = old indentation - 1
		end

	reset_indentation is
			-- Reset indentation.
		do
			indentation := 0
		ensure
			indentation_reset: indentation = 0
		end

feature {ET_AST_NODE} -- Processing

	process_actual_argument_list (a_list: ET_ACTUAL_ARGUMENT_LIST) is
			-- Process `a_list'.
		local
			i, nb: INTEGER
			l_item: ET_EXPRESSION_ITEM
			l_expression: ET_EXPRESSION
		do
			a_list.left_symbol.process (Current)
			nb := a_list.count
			from i := 1 until i > nb loop
				l_item := a_list.item (i)
				l_expression := l_item.expression
				l_expression.process (Current)
				comment_finder.add_excluded_node (l_expression)
				comment_finder.find_comments (l_item, comment_list)
				comment_finder.reset_excluded_nodes
				if i /= nb then
						-- The AST may or may not contain the comma.
						-- So we have to print it explicitly here.
					tokens.comma_symbol.process (Current)
					print_space
				end
				i := i + 1
			end
			a_list.right_symbol.process (Current)
		end

	process_actual_parameter_list (a_list: ET_ACTUAL_PARAMETER_LIST) is
			-- Process `a_list'.
		local
			i, nb: INTEGER
			l_item: ET_ACTUAL_PARAMETER_ITEM
			l_unlabeled: BOOLEAN
			l_type: ET_TYPE
			l_label: ET_IDENTIFIER
			l_comment: ET_COMMENT
		do
			a_list.left_bracket.process (Current)
			nb := a_list.count
				-- The actual parameter list is considered as unlabeled (i.e. not being part
				-- of a Labeled Tuple type declaration) as soon as one of the parameters is
				-- unlabeled. In that case no labels will be printed, so that the pretty-printed
				-- text is syntactically correct. Indeed the compiler can deal with a mix of
				-- labeled and unlabeled actual parameters but the Eiffel standard enforces that
				-- they are all labeled or all unlabeled within the same actual parameter list.
			from i := 1 until i > nb loop
				if a_list.item (i).label = Void then
					l_unlabeled := True
					i := nb + 1
				end
				i := i + 1
			end
			if l_unlabeled then
				from i := 1 until i > nb loop
					l_item := a_list.item (i)
					l_label := l_item.label
					if l_label /= Void then
							-- This label cannot be printed here, otherwise the result would
							-- not be syntactically correct (see comment above). The name of
							-- the label is printed in a comment so that we don't lose any
							-- valuable information in the pretty-printed text.
						create l_comment.make ("-- label: " + l_label.name)
						comment_list.force_last (l_comment)
					end
					l_type := l_item.type
					l_type.process (Current)
					comment_finder.add_excluded_node (l_type)
					comment_finder.find_comments (l_item, comment_list)
					comment_finder.reset_excluded_nodes
					if i /= nb then
							-- The AST may or may not contain the comma.
							-- So we have to print it explicitly here.
						tokens.comma_symbol.process (Current)
						print_space
					end
					i := i + 1
				end
			else
					-- Labeled Tuple actual parameters.
				from i := 1 until i > nb loop
					l_item := a_list.item (i)
					l_label := l_item.label
					l_label.process (Current)
					if l_item.is_last_entity or i = nb then
						tokens.colon_symbol.process (Current)
						print_space
						l_type := l_item.type
						l_type.process (Current)
						comment_finder.add_excluded_node (l_label)
						comment_finder.add_excluded_node (l_type)
						comment_finder.find_comments (l_item, comment_list)
						comment_finder.reset_excluded_nodes
						if i /= nb then
								-- The AST may or may not contain the semicolon.
								-- So we have to print it explicitly here.
							tokens.semicolon_symbol.process (Current)
							print_space
						end
					else
						comment_finder.add_excluded_node (l_label)
						comment_finder.find_comments (l_item, comment_list)
						comment_finder.reset_excluded_nodes
							-- The AST may or may not contain the comma.
							-- So we have to print it explicitly here.
						tokens.comma_symbol.process (Current)
						print_space
					end
					i := i + 1
				end
			end
			a_list.right_bracket.process (Current)
		end

	process_agent_argument_operand_list (a_list: ET_AGENT_ARGUMENT_OPERAND_LIST) is
			-- Process `a_list'.
		local
			i, nb: INTEGER
			l_item: ET_AGENT_ARGUMENT_OPERAND_ITEM
			l_argument: ET_AGENT_ARGUMENT_OPERAND
		do
			a_list.left_parenthesis.process (Current)
			nb := a_list.count
			from i := 1 until i > nb loop
				l_item := a_list.item (i)
				l_argument := l_item.agent_actual_argument
				l_argument.process (Current)
				comment_finder.add_excluded_node (l_argument)
				comment_finder.find_comments (l_item, comment_list)
				comment_finder.reset_excluded_nodes
				if i /= nb then
						-- The AST may or may not contain the comma.
						-- So we have to print it explicitly here.
					tokens.comma_symbol.process (Current)
					print_space
				end
				i := i + 1
			end
			a_list.right_parenthesis.process (Current)
		end

	process_agent_typed_open_argument (an_argument: ET_AGENT_TYPED_OPEN_ARGUMENT) is
			-- Process `an_argument'.
		do
			an_argument.left_brace.process (Current)
			an_argument.type.process (Current)
			an_argument.right_brace.process (Current)
			print_space
			an_argument.question_mark.process (Current)
		end

	process_alias_free_name (a_name: ET_ALIAS_FREE_NAME) is
			-- Process `a_name'.
		do
			a_name.alias_keyword.process (Current)
			print_space
			a_name.alias_string.process (Current)
		end

	process_alias_name (a_name: ET_ALIAS_NAME) is
			-- Process `a_name'.
		do
			a_name.alias_keyword.process (Current)
			print_space
			a_name.alias_string.process (Current)
		end

	process_aliased_feature_name (a_name: ET_ALIASED_FEATURE_NAME) is
			-- Process `a_name'.
		do
			a_name.feature_name.process (Current)
			print_space
			a_name.alias_name.process (Current)
		end

	process_all_export (an_export: ET_ALL_EXPORT) is
			-- Process `an_export'.
		do
			an_export.clients_clause.process (Current)
			print_space
			an_export.all_keyword.process (Current)
		end

	process_assertions (a_list: ET_ASSERTIONS) is
			-- Process `a_list'.
		require
			a_list_not_void: a_list /= Void
		local
			i, nb: INTEGER
			l_item: ET_ASSERTION_ITEM
			l_assertion: ET_ASSERTION
			l_identifier: ET_IDENTIFIER
			l_symbol: ET_SYMBOL
		do
			if a_list.is_empty then
					-- Do not print empty assertions, but keep the comments if any.
				comment_finder.find_comments (a_list, comment_list)
			else
				nb := a_list.count
				from i := 1 until i > nb loop
					l_item := a_list.item (i)
					l_assertion := l_item.assertion
					l_assertion.process (Current)
					comment_finder.add_excluded_node (l_assertion)
					comment_finder.find_comments (l_item, comment_list)
					comment_finder.reset_excluded_nodes
					if i /= nb then
						l_identifier ?= l_assertion.last_leaf
						l_symbol ?= a_list.item (i + 1).first_leaf
						if l_identifier /= Void and l_symbol /= Void and then (l_symbol.is_left_parenthesis or l_symbol.is_left_bracket) then
								-- Print a semicolon in order to avoid syntax ambiguity.
								-- For example if we have:
								--
								--  check
								--     f.g
								--     (a + b).h
								--  end
								--
								-- it could also be seen as:
								--
								--  check
								--     f.g (a + b).h
								--  end
								--
							tokens.semicolon_symbol.process (Current)
						end
						print_new_line
						process_comments
					end
					i := i + 1
				end
			end
		end

	process_assign_feature_name (an_assigner: ET_ASSIGN_FEATURE_NAME) is
			-- Process `an_assigner'.
		do
			an_assigner.assign_keyword.process (Current)
			print_space
			an_assigner.feature_name.process (Current)
		end

	process_assigner_instruction (an_instruction: ET_ASSIGNER_INSTRUCTION) is
			-- Process `an_instruction'.
		do
			an_instruction.call.process (Current)
			print_space
			an_instruction.assign_symbol.process (Current)
			print_space
			an_instruction.source.process (Current)
		end

	process_assignment (an_instruction: ET_ASSIGNMENT) is
			-- Process `an_instruction'.
		do
			an_instruction.target.process (Current)
			print_space
			an_instruction.assign_symbol.process (Current)
			print_space
			an_instruction.source.process (Current)
		end

	process_assignment_attempt (an_instruction: ET_ASSIGNMENT_ATTEMPT) is
			-- Process `an_instruction'.
		do
			an_instruction.target.process (Current)
			print_space
			an_instruction.assign_attempt_symbol.process (Current)
			print_space
			an_instruction.source.process (Current)
		end

	process_attribute (a_feature: ET_ATTRIBUTE) is
			-- Process `a_feature'.
		local
			l_frozen_keyword: ET_TOKEN
			l_synonym: ET_FEATURE
			l_semicolon: ET_SEMICOLON_SYMBOL
			l_assigner: ET_ASSIGNER
			l_extended_feature_name: ET_EXTENDED_FEATURE_NAME
			l_feature_name: ET_FEATURE_NAME
			l_alias_name: ET_ALIAS_NAME
			l_declared_type: ET_DECLARED_TYPE
			l_type: ET_TYPE
		do
			from
				l_synonym := a_feature
			until
				l_synonym = Void
			loop
				l_frozen_keyword := l_synonym.frozen_keyword
				if l_frozen_keyword /= Void then
					l_frozen_keyword.process (Current)
					print_space
				end
				l_extended_feature_name := l_synonym.extended_name
				l_feature_name := l_extended_feature_name.feature_name
				l_alias_name := l_extended_feature_name.alias_name
				l_feature_name.process (Current)
				if l_alias_name /= Void and not ANY_.same_objects (l_alias_name, l_feature_name) then
						-- For infix and prefix features, do not repeat the name twice.
					print_space
					l_alias_name.process (Current)
					comment_finder.add_excluded_node (l_alias_name)
				end
				comment_finder.add_excluded_node (l_feature_name)
				comment_finder.find_comments (l_extended_feature_name, comment_list)
				comment_finder.reset_excluded_nodes
				l_synonym := l_synonym.synonym
				if l_synonym /= Void then
						-- The AST may or may not contain the comma.
						-- So we have to print it explicitly here.
					tokens.comma_symbol.process (Current)
					print_space
				end
			end
				-- The AST may or may not contain the colon.
				-- So we have to print it explicitly here.
			l_declared_type := a_feature.declared_type
			l_type := l_declared_type.type
			tokens.colon_symbol.process (Current)
			comment_finder.add_excluded_node (l_type)
			comment_finder.find_comments (l_declared_type, comment_list)
			comment_finder.reset_excluded_nodes
			print_space
			l_type.process (Current)
			l_assigner := a_feature.assigner
			if l_assigner /= Void then
				print_space
				l_assigner.process (Current)
			end
			l_semicolon := a_feature.semicolon
			if l_semicolon /= Void then
					-- Do not print the semicolon, but keep track of its comments if any.
				process_break (l_semicolon.break)
			end
				-- Print header comment.
			indent
			process_comments
			dedent
		end

	process_bang_instruction (an_instruction: ET_BANG_INSTRUCTION) is
			-- Process `an_instruction'.
		local
			l_type: ET_TYPE
			l_call: ET_QUALIFIED_CALL
		do
				-- Use the keyword 'create' even if the original class text was using the old syntax with '!!'.
				-- The following code will try to print the comments at the right place if any, even when
				-- replacing '!!' with 'create'.
			tokens.create_keyword.process (Current)
			print_space
			l_type := an_instruction.type
			process_break (an_instruction.left_bang.break)
			if l_type /= Void then
				tokens.left_brace_symbol.process (Current)
				l_type.process (Current)
				tokens.right_brace_symbol.process (Current)
				print_space
			end
			process_break (an_instruction.right_bang.break)
			an_instruction.target.process (Current)
			l_call := an_instruction.creation_call
			if l_call /= Void then
				l_call.process (Current)
			end
		end

	process_bit_feature (a_type: ET_BIT_FEATURE) is
			-- Process `a_type'.
		do
			a_type.bit_keyword.process (Current)
			print_space
			a_type.name.process (Current)
		end

	process_bit_n (a_type: ET_BIT_N) is
			-- Process `a_type'.
		do
			a_type.bit_keyword.process (Current)
			print_space
			a_type.constant.process (Current)
		end

	process_braced_type_list (a_list: ET_BRACED_TYPE_LIST) is
			-- Process `a_list'.
		local
			i, nb: INTEGER
			l_item: ET_TYPE_ITEM
			l_type: ET_TYPE
		do
			a_list.left_brace.process (Current)
			nb := a_list.count
			from i := 1 until i > nb loop
				l_item := a_list.item (i)
				l_type := l_item.type
				l_type.process (Current)
				comment_finder.add_excluded_node (l_type)
				comment_finder.find_comments (l_item, comment_list)
				comment_finder.reset_excluded_nodes
				if i /= nb then
						-- The AST may or may not contain the comma.
						-- So we have to print it explicitly here.
					tokens.comma_symbol.process (Current)
					print_space
				end
				i := i + 1
			end
			a_list.right_brace.process (Current)
		end

	process_bracket_argument_list (a_list: ET_BRACKET_ARGUMENT_LIST) is
			-- Process `a_list'.
		local
			i, nb: INTEGER
			l_item: ET_EXPRESSION_ITEM
			l_expression: ET_EXPRESSION
		do
			a_list.left_symbol.process (Current)
			nb := a_list.count
			from i := 1 until i > nb loop
				l_item := a_list.item (i)
				l_expression := l_item.expression
				l_expression.process (Current)
				comment_finder.add_excluded_node (l_expression)
				comment_finder.find_comments (l_item, comment_list)
				comment_finder.reset_excluded_nodes
				if i /= nb then
						-- The AST may or may not contain the comma.
						-- So we have to print it explicitly here.
					tokens.comma_symbol.process (Current)
					print_space
				end
				i := i + 1
			end
			a_list.right_symbol.process (Current)
		end

	process_bracket_expression (an_expression: ET_BRACKET_EXPRESSION) is
			-- Process `an_expression'.
		local
			l_arguments: ET_BRACKET_ARGUMENT_LIST
		do
			an_expression.target.process (Current)
			l_arguments := an_expression.arguments
			if l_arguments /= Void then
				print_space
				l_arguments.process (Current)
			end
		end

	process_break (a_break: ET_BREAK) is
			-- Process `a_break'.
		do
			if a_break /= Void and then a_break.has_comment then
				comment_list.force_last (a_break)
			end
		end

	process_c1_character_constant (a_constant: ET_C1_CHARACTER_CONSTANT) is
			-- Process `a_constant'.
		local
			l_cast_type: ET_TARGET_TYPE
			l_type: ET_TYPE
		do
			l_cast_type := a_constant.cast_type
			if l_cast_type /= Void then
					-- The AST may or may not contain the braces.
					-- So we have to print them explicitly here.
				l_type := l_cast_type.type
				tokens.left_brace_symbol.process (Current)
				l_type.type.process (Current)
				tokens.right_brace_symbol.process (Current)
				comment_finder.add_excluded_node (l_type)
				comment_finder.find_comments (l_cast_type, comment_list)
				comment_finder.reset_excluded_nodes
				print_space
			end
			print_character ('%'')
			print_character (a_constant.value)
			print_character ('%'')
			process_break (a_constant.break)
		end

	process_c2_character_constant (a_constant: ET_C2_CHARACTER_CONSTANT) is
			-- Process `a_constant'.
		local
			l_cast_type: ET_TARGET_TYPE
			l_type: ET_TYPE
		do
			l_cast_type := a_constant.cast_type
			if l_cast_type /= Void then
					-- The AST may or may not contain the braces.
					-- So we have to print them explicitly here.
				l_type := l_cast_type.type
				tokens.left_brace_symbol.process (Current)
				l_type.type.process (Current)
				tokens.right_brace_symbol.process (Current)
				comment_finder.add_excluded_node (l_type)
				comment_finder.find_comments (l_cast_type, comment_list)
				comment_finder.reset_excluded_nodes
				print_space
			end
			print_character ('%'')
			print_character ('%%')
			print_character (a_constant.literal)
			print_character ('%'')
			process_break (a_constant.break)
		end

	process_c3_character_constant (a_constant: ET_C3_CHARACTER_CONSTANT) is
			-- Process `a_constant'.
		local
			l_cast_type: ET_TARGET_TYPE
			l_type: ET_TYPE
		do
			l_cast_type := a_constant.cast_type
			if l_cast_type /= Void then
					-- The AST may or may not contain the braces.
					-- So we have to print them explicitly here.
				l_type := l_cast_type.type
				tokens.left_brace_symbol.process (Current)
				l_type.type.process (Current)
				tokens.right_brace_symbol.process (Current)
				comment_finder.add_excluded_node (l_type)
				comment_finder.find_comments (l_cast_type, comment_list)
				comment_finder.reset_excluded_nodes
				print_space
			end
			print_character ('%'')
			print_character ('%%')
			print_character ('/')
			print_string (a_constant.literal)
			print_character ('/')
			print_character ('%'')
			process_break (a_constant.break)
		end

	process_call_agent (an_expression: ET_CALL_AGENT) is
			-- Process `an_expression'.
		local
			l_arguments: ET_AGENT_ARGUMENT_OPERAND_LIST
			l_qualified_feature_name: ET_QUALIFIED_FEATURE_NAME
			l_feature_name: ET_FEATURE_NAME
		do
				-- Use the keyword 'agent' even if the original class text was using the old syntax with '~'.
			tokens.agent_keyword.process (Current)
			process_break (an_expression.agent_keyword.break)
			print_space
			if an_expression.is_qualified_call then
				an_expression.target.process (Current)
					-- The AST may or may not contain the dot.
					-- So we have to print them explicitly here.
				tokens.dot_symbol.process (Current)
			end
			l_qualified_feature_name := an_expression.qualified_name
			l_feature_name := l_qualified_feature_name.feature_name
			l_feature_name.process (Current)
			comment_finder.add_excluded_node (l_feature_name)
			comment_finder.find_comments (l_qualified_feature_name, comment_list)
			comment_finder.reset_excluded_nodes
			l_arguments ?= an_expression.arguments
			if l_arguments /= Void then
					-- Do not print implicit argument operands (they were not in the original class text anyway).
				if l_arguments.is_empty then
						-- Do not print empty parentheses, but keep the comments if any.
					comment_finder.find_comments (l_arguments, comment_list)
				else
					print_space
					l_arguments.process (Current)
				end
			end
		end

	process_call_expression (an_expression: ET_CALL_EXPRESSION) is
			-- Process `an_expression'.
		local
			l_target: ET_EXPRESSION
			l_arguments: ET_ACTUAL_ARGUMENT_LIST
			l_qualified_feature_name: ET_QUALIFIED_FEATURE_NAME
			l_feature_name: ET_FEATURE_NAME
		do
			l_target := an_expression.target
			if l_target /= Void then
				l_target.process (Current)
					-- The AST may or may not contain the dot.
					-- So we have to print them explicitly here.
				tokens.dot_symbol.process (Current)
			end
			l_qualified_feature_name := an_expression.qualified_name
			l_feature_name := l_qualified_feature_name.feature_name
			l_feature_name.process (Current)
			comment_finder.add_excluded_node (l_feature_name)
			comment_finder.find_comments (l_qualified_feature_name, comment_list)
			comment_finder.reset_excluded_nodes
			l_arguments := an_expression.arguments
			if l_arguments /= Void then
				if l_arguments.is_empty then
						-- Do not print empty parentheses, but keep the comments if any.
					comment_finder.find_comments (l_arguments, comment_list)
				else
					print_space
					l_arguments.process (Current)
				end
			end
		end

	process_call_instruction (an_instruction: ET_CALL_INSTRUCTION) is
			-- Process `an_instruction'.
		local
			l_target: ET_EXPRESSION
			l_arguments: ET_ACTUAL_ARGUMENT_LIST
			l_qualified_feature_name: ET_QUALIFIED_FEATURE_NAME
			l_feature_name: ET_FEATURE_NAME
		do
			l_target := an_instruction.target
			if l_target /= Void then
				l_target.process (Current)
					-- The AST may or may not contain the dot.
					-- So we have to print them explicitly here.
				tokens.dot_symbol.process (Current)
			end
			l_qualified_feature_name := an_instruction.qualified_name
			l_feature_name := l_qualified_feature_name.feature_name
			l_feature_name.process (Current)
			comment_finder.add_excluded_node (l_feature_name)
			comment_finder.find_comments (l_qualified_feature_name, comment_list)
			comment_finder.reset_excluded_nodes
			l_arguments := an_instruction.arguments
			if l_arguments /= Void then
				if l_arguments.is_empty then
						-- Do not print empty parentheses, but keep the comments if any.
					comment_finder.find_comments (l_arguments, comment_list)
				else
					print_space
					l_arguments.process (Current)
				end
			end
		end

	process_check_instruction (an_instruction: ET_CHECK_INSTRUCTION) is
			-- Process `an_instruction'.
		do
			an_instruction.check_keyword.process (Current)
			print_new_line
			if an_instruction.is_empty then
					-- There is no assertion to be printed.
					-- Print any comments with only one extra indentation level.
				process_comments
			else
				indent
				process_comments
				process_assertions (an_instruction)
				print_new_line
				process_comments
				dedent
			end
			an_instruction.end_keyword.process (Current)
		end

	process_choice_list (a_list: ET_CHOICE_LIST) is
			-- Process `a_list'.
		local
			i, nb: INTEGER
			l_item: ET_CHOICE_ITEM
			l_choice: ET_CHOICE
		do
			a_list.when_keyword.process (Current)
			if not a_list.is_empty then
				print_space
				nb := a_list.count
				from i := 1 until i > nb loop
					l_item := a_list.item (i)
					l_choice := l_item.choice
					l_choice.process (Current)
					comment_finder.add_excluded_node (l_choice)
					comment_finder.find_comments (l_item, comment_list)
					comment_finder.reset_excluded_nodes
					if i /= nb then
							-- The AST may or may not contain the comma.
							-- So we have to print it explicitly here.
						tokens.comma_symbol.process (Current)
						print_space
					end
					i := i + 1
				end
			end
		end

	process_class (a_class: ET_CLASS) is
			-- Process `a_class'.
		local
			an_indexing: ET_INDEXING_LIST
			a_frozen: ET_KEYWORD
			a_class_mark: ET_CLASS_MARK
			an_external: ET_KEYWORD
			a_formal_parameters: ET_FORMAL_PARAMETER_LIST
			l_obsolete_message: ET_OBSOLETE
			l_obsolete_string: ET_MANIFEST_STRING
			a_parents: ET_PARENT_LIST
			a_creators: ET_CREATOR_LIST
			a_convert_features: ET_CONVERT_FEATURE_LIST
			an_invariants: ET_INVARIANTS
		do
			process_break (a_class.leading_break)
			if not comment_list.is_empty then
				process_comments
					-- Add an extra line after the comment.
				print_new_line
			end
			an_indexing := a_class.first_indexing
			if an_indexing /= Void then
				an_indexing.process (Current)
				process_comments
				print_new_line
				print_new_line
			end
			a_frozen := a_class.frozen_keyword
			if a_frozen /= Void then
				a_frozen.process (Current)
				print_space
			end
			a_class_mark := a_class.class_mark
			if a_class_mark /= Void then
				a_class_mark.process (Current)
				print_space
			end
			an_external := a_class.external_keyword
			if an_external /= Void then
				an_external.process (Current)
				print_space
			end
			a_class.class_keyword.process (Current)
			print_space
			a_class.name.process (Current)
			a_formal_parameters := a_class.formal_parameters
			if a_formal_parameters /= Void then
				if a_formal_parameters.is_empty then
						-- Do not print empty brackets, but keep the comments if any.
					comment_finder.find_comments (a_formal_parameters, comment_list)
				else
					print_space
					a_formal_parameters.process (Current)
				end
			end
			process_comments
			print_new_line
			print_new_line
			l_obsolete_message := a_class.obsolete_message
			if l_obsolete_message /= Void then
				tokens.obsolete_keyword.process (Current)
				l_obsolete_string := l_obsolete_message.manifest_string
				comment_finder.add_excluded_node (l_obsolete_string)
				comment_finder.find_comments (l_obsolete_message, comment_list)
				comment_finder.reset_excluded_nodes
				indent
				process_comments
				print_new_line
				print_new_line
				l_obsolete_string.process (Current)
				dedent
				process_comments
				print_new_line
				print_new_line
			end
			a_parents := a_class.parents
			if a_parents /= Void then
				a_parents.process (Current)
				process_comments
				print_new_line
				print_new_line
			end
			a_creators := a_class.creators
			if a_creators /= Void then
				a_creators.process (Current)
				process_comments
				print_new_line
				print_new_line
			end
			a_convert_features := a_class.convert_features
			if a_convert_features /= Void then
				a_convert_features.process (Current)
				process_comments
				print_new_line
				print_new_line
			end
			process_features (a_class)
			an_invariants := a_class.invariants
			if an_invariants /= Void then
				an_invariants.process (Current)
				process_comments
				print_new_line
				print_new_line
			end
			an_indexing := a_class.second_indexing
			if an_indexing /= Void then
				an_indexing.process (Current)
				process_comments
				print_new_line
				print_new_line
			end
			a_class.end_keyword.process (Current)
			process_comments_on_same_line
			print_new_line
		end

	process_class_type (a_type: ET_CLASS_TYPE) is
			-- Process `a_type'.
		local
			a_type_mark: ET_TYPE_MARK
		do
			a_type_mark := a_type.type_mark
			if a_type_mark /= Void then
				a_type_mark.process (Current)
				if a_type_mark.is_keyword then
					print_space
				end
			end
			a_type.name.process (Current)
		end

	process_clients (a_list: ET_CLIENTS) is
			-- Process `a_list'.
		local
			i, nb: INTEGER
			l_item: ET_CLIENT_ITEM
			l_client_name: ET_CLASS_NAME
		do
			a_list.left_brace.process (Current)
			nb := a_list.count
			from i := 1 until i > nb loop
				l_item := a_list.item (i)
				l_client_name := l_item.name
				l_client_name.process (Current)
				comment_finder.add_excluded_node (l_client_name)
				comment_finder.find_comments (l_item, comment_list)
				comment_finder.reset_excluded_nodes
				if i /= nb then
						-- The AST may or may not contain the comma.
						-- So we have to print it explicitly here.
					tokens.comma_symbol.process (Current)
					print_space
				end
				i := i + 1
			end
			a_list.right_brace.process (Current)
		end

	process_colon_type (a_type: ET_COLON_TYPE) is
			-- Process `a_type'.
		do
			a_type.colon.process (Current)
			print_space
			a_type.type.process (Current)
		end

	process_comments is
			-- Process comments that have not been printed yet.
			-- Print comments in `comment_list' on their own line (go to
			-- next line if necessary), with an extra indentation level.
			-- Comments are followed by a new-line. Then wipe out the list.
		do
			print_indented_comments (comment_list)
			comment_list.wipe_out
		ensure
			no_more_comments: comment_list.is_empty
		end

	process_comments_on_same_line is
			-- Process comments that have not been printed yet.
			-- If `comment_list' is not empty, then print a space followed by
			-- the first comment on the current line. The remaining comments
			-- are printed on their own line, with an extra indentation level.
			-- Comments are followed by a new-line. Then wipe out the list.
		do
			print_comments_on_same_line (comment_list)
			comment_list.wipe_out
		ensure
			no_more_comments: comment_list.is_empty
		end

	process_compound (a_list: ET_COMPOUND) is
			-- Process `a_list'.
		local
			i, nb: INTEGER
			l_instruction: ET_INSTRUCTION
			l_identifier: ET_IDENTIFIER
			l_symbol: ET_SYMBOL
		do
			a_list.keyword.process (Current)
			nb := a_list.count
				-- Start to skip all leading null instructions.
			from
				i := 1
			until
				i > nb or else not a_list.item (i).is_semicolon
			loop
				comment_finder.find_comments (a_list.item (i), comment_list)
				i := i + 1
			end
			if i > nb then
					-- There is no instruction to be printed.
					-- Print any comments with only one extra indentation level.
				process_comments
			else
				indent
				process_comments
				from until i > nb loop
					l_instruction := a_list.item (i)
					print_new_line
					l_instruction.process (Current)
						-- Skip null instructions.
					from
						i := i + 1
					until
						i > nb or else not a_list.item (i).is_semicolon
					loop
						comment_finder.find_comments (a_list.item (i), comment_list)
						i := i + 1
					end
					if i <= nb then
						l_identifier ?= l_instruction.last_leaf
						l_symbol ?= a_list.item (i).first_leaf
						if l_identifier /= Void and l_symbol /= Void and then (l_symbol.is_left_parenthesis or l_symbol.is_left_bracket) then
								-- Print a semicolon in order to avoid syntax ambiguity.
								-- For example if we have:
								--
								--  do
								--     f.g
								--     (a + b).h
								--
								-- it could also be seen as:
								--
								--  do
								--     f.g (a + b).h
								--
							tokens.semicolon_symbol.process (Current)
						end
					end
					process_comments
				end
				dedent
			end
		end

	process_constant_attribute (a_feature: ET_CONSTANT_ATTRIBUTE) is
			-- Process `a_feature'.
		local
			l_frozen_keyword: ET_TOKEN
			l_synonym: ET_FEATURE
			l_semicolon: ET_SEMICOLON_SYMBOL
			l_assigner: ET_ASSIGNER
			l_extended_feature_name: ET_EXTENDED_FEATURE_NAME
			l_feature_name: ET_FEATURE_NAME
			l_alias_name: ET_ALIAS_NAME
			l_declared_type: ET_DECLARED_TYPE
			l_type: ET_TYPE
		do
			from
				l_synonym := a_feature
			until
				l_synonym = Void
			loop
				l_frozen_keyword := l_synonym.frozen_keyword
				if l_frozen_keyword /= Void then
					l_frozen_keyword.process (Current)
					print_space
				end
				l_extended_feature_name := l_synonym.extended_name
				l_feature_name := l_extended_feature_name.feature_name
				l_alias_name := l_extended_feature_name.alias_name
				l_feature_name.process (Current)
				if l_alias_name /= Void and not ANY_.same_objects (l_alias_name, l_feature_name) then
						-- For infix and prefix features, do not repeat the name twice.
					print_space
					l_alias_name.process (Current)
					comment_finder.add_excluded_node (l_alias_name)
				end
				comment_finder.add_excluded_node (l_feature_name)
				comment_finder.find_comments (l_extended_feature_name, comment_list)
				comment_finder.reset_excluded_nodes
				l_synonym := l_synonym.synonym
				if l_synonym /= Void then
						-- The AST may or may not contain the comma.
						-- So we have to print it explicitly here.
					tokens.comma_symbol.process (Current)
					print_space
				end
			end
				-- The AST may or may not contain the colon.
				-- So we have to print it explicitly here.
			l_declared_type := a_feature.declared_type
			l_type := l_declared_type.type
			tokens.colon_symbol.process (Current)
			comment_finder.add_excluded_node (l_type)
			comment_finder.find_comments (l_declared_type, comment_list)
			comment_finder.reset_excluded_nodes
			print_space
			l_type.process (Current)
			print_space
			l_assigner := a_feature.assigner
			if l_assigner /= Void then
				l_assigner.process (Current)
				print_space
			end
			tokens.is_keyword.process (Current)
			process_break (a_feature.is_keyword.break)
			print_space
			a_feature.constant.process (Current)
			l_semicolon := a_feature.semicolon
			if l_semicolon /= Void then
					-- Do not print the semicolon, but keep track of its comments if any.
				process_break (l_semicolon.break)
			end
				-- Print header comment.
			indent
			process_comments
			dedent
		end

	process_constrained_formal_parameter (a_parameter: ET_CONSTRAINED_FORMAL_PARAMETER) is
			-- Process `a_parameter'.
		local
			a_creation_procedures: ET_CONSTRAINT_CREATOR
			a_type_mark: ET_KEYWORD
		do
			a_type_mark := a_parameter.type_mark
			if a_type_mark /= Void then
				a_type_mark.process (Current)
				print_space
			end
			a_parameter.name.process (Current)
			print_space
			a_parameter.arrow_symbol.process (Current)
			print_space
			a_parameter.constraint.process (Current)
			a_creation_procedures := a_parameter.creation_procedures
			if a_creation_procedures /= Void then
				print_space
				a_creation_procedures.process (Current)
			end
		end

	process_constraint_creator (a_list: ET_CONSTRAINT_CREATOR) is
			-- Process `a_list'.
		local
			i, nb: INTEGER
			l_item: ET_FEATURE_NAME_ITEM
			l_feature_name: ET_FEATURE_NAME
		do
			a_list.create_keyword.process (Current)
			print_space
			nb := a_list.count
			from i := 1 until i > nb loop
				l_item := a_list.item (i)
				l_feature_name := l_item.feature_name
				l_feature_name.process (Current)
				if i /= nb then
						-- The AST may or may not contain the comma.
						-- So we have to print it explicitly here.
					tokens.comma_symbol.process (Current)
				end
				comment_finder.add_excluded_node (l_feature_name)
				comment_finder.find_comments (l_item, comment_list)
				comment_finder.reset_excluded_nodes
				print_space
				i := i + 1
			end
			a_list.end_keyword.process (Current)
		end

	process_convert_feature_list (a_list: ET_CONVERT_FEATURE_LIST) is
			-- Process `a_list'.
		local
			i, nb: INTEGER
			l_item: ET_CONVERT_FEATURE_ITEM
			l_convert_feature: ET_CONVERT_FEATURE
		do
			a_list.convert_keyword.process (Current)
			nb := a_list.count
			if nb /= 0 then
				process_comments
				print_new_line
			end
			indent
			from i := 1 until i > nb loop
				l_item := a_list.item (i)
				l_convert_feature := l_item.convert_feature
				process_comments
				print_new_line
				l_convert_feature.process (Current)
				if i /= nb then
						-- The AST may or may not contain the comma.
						-- So we have to print it explicitly here.
					tokens.comma_symbol.process (Current)
				end
				comment_finder.add_excluded_node (l_convert_feature)
				comment_finder.find_comments (l_item, comment_list)
				comment_finder.reset_excluded_nodes
				i := i + 1
			end
			dedent
		end

	process_convert_function (a_convert_function: ET_CONVERT_FUNCTION) is
			-- Process `a_convert_function'.
		do
			a_convert_function.name.process (Current)
			a_convert_function.colon.process (Current)
			print_space
			a_convert_function.types.process (Current)
		end

	process_convert_procedure (a_convert_procedure: ET_CONVERT_PROCEDURE) is
			-- Process `a_convert_procedure'.
		do
			a_convert_procedure.name.process (Current)
			print_space
			a_convert_procedure.left_parenthesis.process (Current)
			a_convert_procedure.types.process (Current)
			a_convert_procedure.right_parenthesis.process (Current)
		end

	process_create_expression (an_expression: ET_CREATE_EXPRESSION) is
			-- Process `an_expression'.
		local
			l_creation_type: ET_TARGET_TYPE
			l_type: ET_TYPE
			l_call: ET_QUALIFIED_CALL
		do
			an_expression.create_keyword.process (Current)
			print_space
			l_creation_type := an_expression.creation_type
			l_type := l_creation_type.type
			tokens.left_brace_symbol.process (Current)
			l_type.process (Current)
			tokens.right_brace_symbol.process (Current)
			comment_finder.add_excluded_node (l_type)
			comment_finder.find_comments (l_creation_type, comment_list)
			comment_finder.reset_excluded_nodes
			l_call := an_expression.creation_call
			if l_call /= Void then
				l_call.process (Current)
			end
		end

	process_create_instruction (an_instruction: ET_CREATE_INSTRUCTION) is
			-- Process `an_instruction'.
		local
			l_creation_type: ET_TARGET_TYPE
			l_type: ET_TYPE
			l_call: ET_QUALIFIED_CALL
		do
			an_instruction.create_keyword.process (Current)
			print_space
			l_creation_type := an_instruction.creation_type
			if l_creation_type /= Void then
				l_type := l_creation_type.type
				tokens.left_brace_symbol.process (Current)
				l_type.process (Current)
				tokens.right_brace_symbol.process (Current)
				comment_finder.add_excluded_node (l_type)
				comment_finder.find_comments (l_creation_type, comment_list)
				comment_finder.reset_excluded_nodes
				print_space
			end
			an_instruction.target.process (Current)
			l_call := an_instruction.creation_call
			if l_call /= Void then
				l_call.process (Current)
			end
		end

	process_creator (a_list: ET_CREATOR) is
			-- Process `a_list'.
		local
			l_clients: ET_CLIENTS
			i, nb: INTEGER
			l_item: ET_FEATURE_NAME_ITEM
			l_feature_name: ET_FEATURE_NAME
		do
			a_list.creation_keyword.process (Current)
			l_clients := a_list.clients_clause
			if l_clients /= Void then
				print_space
				l_clients.process (Current)
			end
			nb := a_list.count
			if nb /= 0 then
				process_comments
				print_new_line
			end
			indent
			from i := 1 until i > nb loop
				process_comments
				print_new_line
				l_item := a_list.item (i)
				l_feature_name := l_item.feature_name
				l_feature_name.process (Current)
				if i /= nb then
						-- The AST may or may not contain the comma.
						-- So we have to print it explicitly here.
					tokens.comma_symbol.process (Current)
				end
				comment_finder.add_excluded_node (l_feature_name)
				comment_finder.find_comments (l_item, comment_list)
				comment_finder.reset_excluded_nodes
				i := i + 1
			end
			dedent
		end

	process_creator_list (a_list: ET_CREATOR_LIST) is
			-- Process `a_list'.
		local
			i, nb: INTEGER
			l_creator: ET_CREATOR
		do
			nb := a_list.count
			from i := 1 until i > nb loop
				l_creator := a_list.item (i)
				l_creator.process (Current)
				if i /= nb then
					process_comments
					print_new_line
					print_new_line
				end
				i := i + 1
			end
		end

	process_custom_attribute (an_attribute: ET_CUSTOM_ATTRIBUTE) is
			-- Process `an_attribute'.
		local
			l_settings: ET_MANIFEST_TUPLE
		do
			an_attribute.creation_expression.process (Current)
			print_space
			l_settings := an_attribute.settings
			if l_settings /= Void then
				l_settings.process (Current)
				print_space
			end
			an_attribute.end_keyword.process (Current)
		end

	process_debug_instruction (an_instruction: ET_DEBUG_INSTRUCTION) is
			-- Process `an_instruction'.
		local
			l_compound: ET_COMPOUND
			l_keys: ET_MANIFEST_STRING_LIST
			l_instruction: ET_INSTRUCTION
			l_identifier: ET_IDENTIFIER
			l_symbol: ET_SYMBOL
			i, nb: INTEGER
		do
			tokens.debug_keyword.process (Current)
			l_compound := an_instruction.compound
			if l_compound /= Void then
				process_break (l_compound.keyword.break)
			end
			l_keys := an_instruction.keys
			if l_keys /= Void then
				if l_keys.is_empty then
						-- Do not print empty parentheses, but keep the comments if any.
					comment_finder.find_comments (l_keys, comment_list)
				else
					print_space
					l_keys.process (Current)
				end
			end
			if l_compound /= Void then
				nb := l_compound.count
					-- Start to skip all leading null instructions.
				from
					i := 1
				until
					i > nb or else not l_compound.item (i).is_semicolon
				loop
					comment_finder.find_comments (l_compound.item (i), comment_list)
					i := i + 1
				end
				if i > nb then
						-- There is no instruction to be printed.
						-- Print any comments with only one extra indentation level.
					process_comments
				else
					indent
					process_comments
					from until i > nb loop
						l_instruction := l_compound.item (i)
						print_new_line
						l_instruction.process (Current)
							-- Skip null instructions.
						from
							i := i + 1
						until
							i > nb or else not l_compound.item (i).is_semicolon
						loop
							comment_finder.find_comments (l_compound.item (i), comment_list)
							i := i + 1
						end
						if i <= nb then
							l_identifier ?= l_instruction.last_leaf
							l_symbol ?= l_compound.item (i).first_leaf
							if l_identifier /= Void and l_symbol /= Void and then (l_symbol.is_left_parenthesis or l_symbol.is_left_bracket) then
									-- Print a semicolon in order to avoid syntax ambiguity.
									-- For example if we have:
									--
									--  debug
									--     f.g
									--     (a + b).h
									--
									-- it could also be seen as:
									--
									--  debug
									--     f.g (a + b).h
									--
								tokens.semicolon_symbol.process (Current)
							end
						end
						process_comments
					end
					dedent
				end
			else
				process_comments
			end
			print_new_line
			an_instruction.end_keyword.process (Current)
		end

	process_deferred_function (a_feature: ET_DEFERRED_FUNCTION) is
			-- Process `a_feature'.
		local
			l_frozen_keyword: ET_TOKEN
			l_extended_feature_name: ET_EXTENDED_FEATURE_NAME
			l_feature_name: ET_FEATURE_NAME
			l_alias_name: ET_ALIAS_NAME
			l_declared_type: ET_DECLARED_TYPE
			l_type: ET_TYPE
			l_synonym: ET_FEATURE
			l_arguments: ET_FORMAL_ARGUMENT_LIST
			l_indexing: ET_INDEXING_LIST
			l_obsolete_message: ET_OBSOLETE
			l_preconditions: ET_PRECONDITIONS
			l_postconditions: ET_POSTCONDITIONS
			l_semicolon: ET_SEMICOLON_SYMBOL
			l_is_keyword: ET_KEYWORD
			l_assigner: ET_ASSIGNER
			l_obsolete_string: ET_MANIFEST_STRING
		do
			from
				l_synonym := a_feature
			until
				l_synonym = Void
			loop
				l_frozen_keyword := l_synonym.frozen_keyword
				if l_frozen_keyword /= Void then
					l_frozen_keyword.process (Current)
					print_space
				end
				l_extended_feature_name := l_synonym.extended_name
				l_feature_name := l_extended_feature_name.feature_name
				l_alias_name := l_extended_feature_name.alias_name
				l_feature_name.process (Current)
				if l_alias_name /= Void and not ANY_.same_objects (l_alias_name, l_feature_name) then
						-- For infix and prefix features, do not repeat the name twice.
					print_space
					l_alias_name.process (Current)
					comment_finder.add_excluded_node (l_alias_name)
				end
				comment_finder.add_excluded_node (l_feature_name)
				comment_finder.find_comments (l_extended_feature_name, comment_list)
				comment_finder.reset_excluded_nodes
				l_synonym := l_synonym.synonym
				if l_synonym /= Void then
						-- The AST may or may not contain the comma.
						-- So we have to print it explicitly here.
					tokens.comma_symbol.process (Current)
					print_space
				end
			end
			l_arguments := a_feature.arguments
			if l_arguments /= Void then
				if l_arguments.is_empty then
						-- Do not print empty parentheses, but keep the comments if any.
					comment_finder.find_comments (l_arguments, comment_list)
				else
					print_space
					l_arguments.process (Current)
				end
			end
				-- The AST may or may not contain the colon.
				-- So we have to print it explicitly here.
			l_declared_type := a_feature.declared_type
			l_type := l_declared_type.type
			tokens.colon_symbol.process (Current)
			comment_finder.add_excluded_node (l_type)
			comment_finder.find_comments (l_declared_type, comment_list)
			comment_finder.reset_excluded_nodes
			print_space
			l_type.process (Current)
			l_assigner := a_feature.assigner
			if l_assigner /= Void then
				print_space
				l_assigner.process (Current)
			end
			print_space
			tokens.is_keyword.process (Current)
			l_is_keyword := a_feature.is_keyword
			if l_is_keyword /= Void then
				process_break (l_is_keyword.break)
			end
			indent
			process_comments
			print_new_line
			l_indexing := a_feature.first_indexing
			if l_indexing /= Void then
				l_indexing.process (Current)
				process_comments
				print_new_line
			end
			l_obsolete_message := a_feature.obsolete_message
			if l_obsolete_message /= Void then
				tokens.obsolete_keyword.process (Current)
				l_obsolete_string := l_obsolete_message.manifest_string
				comment_finder.add_excluded_node (l_obsolete_string)
				comment_finder.find_comments (l_obsolete_message, comment_list)
				comment_finder.reset_excluded_nodes
				indent
				process_comments
				print_new_line
				l_obsolete_string.process (Current)
				process_comments
				print_new_line
				dedent
			end
			l_preconditions := a_feature.preconditions
			if l_preconditions /= Void then
				l_preconditions.process (Current)
				process_comments
				print_new_line
			end
			a_feature.deferred_keyword.process (Current)
			process_comments
			print_new_line
			l_postconditions := a_feature.postconditions
			if l_postconditions /= Void then
				l_postconditions.process (Current)
				process_comments
				print_new_line
			end
			a_feature.end_keyword.process (Current)
			l_semicolon := a_feature.semicolon
			if l_semicolon /= Void then
					-- Do not print the semicolon, but keep track of its comments if any.
				process_break (l_semicolon.break)
			end
			dedent
		end

	process_deferred_procedure (a_feature: ET_DEFERRED_PROCEDURE) is
			-- Process `a_feature'.
		local
			l_frozen_keyword: ET_TOKEN
			l_extended_feature_name: ET_EXTENDED_FEATURE_NAME
			l_feature_name: ET_FEATURE_NAME
			l_alias_name: ET_ALIAS_NAME
			l_synonym: ET_FEATURE
			l_arguments: ET_FORMAL_ARGUMENT_LIST
			l_indexing: ET_INDEXING_LIST
			l_obsolete_message: ET_OBSOLETE
			l_preconditions: ET_PRECONDITIONS
			l_postconditions: ET_POSTCONDITIONS
			l_semicolon: ET_SEMICOLON_SYMBOL
			l_is_keyword: ET_KEYWORD
			l_obsolete_string: ET_MANIFEST_STRING
		do
			from
				l_synonym := a_feature
			until
				l_synonym = Void
			loop
				l_frozen_keyword := l_synonym.frozen_keyword
				if l_frozen_keyword /= Void then
					l_frozen_keyword.process (Current)
					print_space
				end
				l_extended_feature_name := l_synonym.extended_name
				l_feature_name := l_extended_feature_name.feature_name
				l_alias_name := l_extended_feature_name.alias_name
				l_feature_name.process (Current)
				if l_alias_name /= Void and not ANY_.same_objects (l_alias_name, l_feature_name) then
						-- For infix and prefix features, do not repeat the name twice.
					print_space
					l_alias_name.process (Current)
					comment_finder.add_excluded_node (l_alias_name)
				end
				comment_finder.add_excluded_node (l_feature_name)
				comment_finder.find_comments (l_extended_feature_name, comment_list)
				comment_finder.reset_excluded_nodes
				l_synonym := l_synonym.synonym
				if l_synonym /= Void then
						-- The AST may or may not contain the comma.
						-- So we have to print it explicitly here.
					tokens.comma_symbol.process (Current)
					print_space
				end
			end
			l_arguments := a_feature.arguments
			if l_arguments /= Void then
				if l_arguments.is_empty then
						-- Do not print empty parentheses, but keep the comments if any.
					comment_finder.find_comments (l_arguments, comment_list)
				else
					print_space
					l_arguments.process (Current)
				end
			end
			print_space
			tokens.is_keyword.process (Current)
			l_is_keyword := a_feature.is_keyword
			if l_is_keyword /= Void then
				process_break (l_is_keyword.break)
			end
			indent
			process_comments
			print_new_line
			l_indexing := a_feature.first_indexing
			if l_indexing /= Void then
				l_indexing.process (Current)
				process_comments
				print_new_line
			end
			l_obsolete_message := a_feature.obsolete_message
			if l_obsolete_message /= Void then
				tokens.obsolete_keyword.process (Current)
				l_obsolete_string := l_obsolete_message.manifest_string
				comment_finder.add_excluded_node (l_obsolete_string)
				comment_finder.find_comments (l_obsolete_message, comment_list)
				comment_finder.reset_excluded_nodes
				indent
				process_comments
				print_new_line
				l_obsolete_string.process (Current)
				process_comments
				print_new_line
				dedent
			end
			l_preconditions := a_feature.preconditions
			if l_preconditions /= Void then
				l_preconditions.process (Current)
				process_comments
				print_new_line
			end
			a_feature.deferred_keyword.process (Current)
			process_comments
			print_new_line
			l_postconditions := a_feature.postconditions
			if l_postconditions /= Void then
				l_postconditions.process (Current)
				process_comments
				print_new_line
			end
			a_feature.end_keyword.process (Current)
			l_semicolon := a_feature.semicolon
			if l_semicolon /= Void then
					-- Do not print the semicolon, but keep track of its comments if any.
				process_break (l_semicolon.break)
			end
			dedent
		end

	process_do_function (a_feature: ET_DO_FUNCTION) is
			-- Process `a_feature'.
		local
			l_frozen_keyword: ET_TOKEN
			l_extended_feature_name: ET_EXTENDED_FEATURE_NAME
			l_feature_name: ET_FEATURE_NAME
			l_alias_name: ET_ALIAS_NAME
			l_declared_type: ET_DECLARED_TYPE
			l_type: ET_TYPE
			l_synonym: ET_FEATURE
			l_arguments: ET_FORMAL_ARGUMENT_LIST
			l_indexing: ET_INDEXING_LIST
			l_obsolete_message: ET_OBSOLETE
			l_preconditions: ET_PRECONDITIONS
			l_postconditions: ET_POSTCONDITIONS
			l_semicolon: ET_SEMICOLON_SYMBOL
			l_is_keyword: ET_KEYWORD
			l_assigner: ET_ASSIGNER
			l_obsolete_string: ET_MANIFEST_STRING
			l_locals: ET_LOCAL_VARIABLE_LIST
			l_compound: ET_COMPOUND
		do
			from
				l_synonym := a_feature
			until
				l_synonym = Void
			loop
				l_frozen_keyword := l_synonym.frozen_keyword
				if l_frozen_keyword /= Void then
					l_frozen_keyword.process (Current)
					print_space
				end
				l_extended_feature_name := l_synonym.extended_name
				l_feature_name := l_extended_feature_name.feature_name
				l_alias_name := l_extended_feature_name.alias_name
				l_feature_name.process (Current)
				if l_alias_name /= Void and not ANY_.same_objects (l_alias_name, l_feature_name) then
						-- For infix and prefix features, do not repeat the name twice.
					print_space
					l_alias_name.process (Current)
					comment_finder.add_excluded_node (l_alias_name)
				end
				comment_finder.add_excluded_node (l_feature_name)
				comment_finder.find_comments (l_extended_feature_name, comment_list)
				comment_finder.reset_excluded_nodes
				l_synonym := l_synonym.synonym
				if l_synonym /= Void then
						-- The AST may or may not contain the comma.
						-- So we have to print it explicitly here.
					tokens.comma_symbol.process (Current)
					print_space
				end
			end
			l_arguments := a_feature.arguments
			if l_arguments /= Void then
				if l_arguments.is_empty then
						-- Do not print empty parentheses, but keep the comments if any.
					comment_finder.find_comments (l_arguments, comment_list)
				else
					print_space
					l_arguments.process (Current)
				end
			end
				-- The AST may or may not contain the colon.
				-- So we have to print it explicitly here.
			l_declared_type := a_feature.declared_type
			l_type := l_declared_type.type
			tokens.colon_symbol.process (Current)
			comment_finder.add_excluded_node (l_type)
			comment_finder.find_comments (l_declared_type, comment_list)
			comment_finder.reset_excluded_nodes
			print_space
			l_type.process (Current)
			l_assigner := a_feature.assigner
			if l_assigner /= Void then
				print_space
				l_assigner.process (Current)
			end
			print_space
			tokens.is_keyword.process (Current)
			l_is_keyword := a_feature.is_keyword
			if l_is_keyword /= Void then
				process_break (l_is_keyword.break)
			end
			indent
			process_comments
			print_new_line
			l_indexing := a_feature.first_indexing
			if l_indexing /= Void then
				l_indexing.process (Current)
				process_comments
				print_new_line
			end
			l_obsolete_message := a_feature.obsolete_message
			if l_obsolete_message /= Void then
				tokens.obsolete_keyword.process (Current)
				l_obsolete_string := l_obsolete_message.manifest_string
				comment_finder.add_excluded_node (l_obsolete_string)
				comment_finder.find_comments (l_obsolete_message, comment_list)
				comment_finder.reset_excluded_nodes
				indent
				process_comments
				print_new_line
				l_obsolete_string.process (Current)
				process_comments
				print_new_line
				dedent
			end
			l_preconditions := a_feature.preconditions
			if l_preconditions /= Void then
				l_preconditions.process (Current)
				process_comments
				print_new_line
			end
			l_locals := a_feature.locals
			if l_locals /= Void then
				l_locals.process (Current)
				process_comments
				print_new_line
			end
			l_compound := a_feature.compound
			if l_compound /= Void then
				l_compound.process (Current)
			else
				tokens.do_keyword.process (Current)
			end
			process_comments
			print_new_line
			l_postconditions := a_feature.postconditions
			if l_postconditions /= Void then
				l_postconditions.process (Current)
				process_comments
				print_new_line
			end
			l_compound := a_feature.rescue_clause
			if l_compound /= Void then
				l_compound.process (Current)
				process_comments
				print_new_line
			end
			a_feature.end_keyword.process (Current)
			l_semicolon := a_feature.semicolon
			if l_semicolon /= Void then
					-- Do not print the semicolon, but keep track of its comments if any.
				process_break (l_semicolon.break)
			end
			dedent
		end

	process_do_function_inline_agent (an_expression: ET_DO_FUNCTION_INLINE_AGENT) is
			-- Process `an_expression'.
		local
			l_formal_arguments: ET_FORMAL_ARGUMENT_LIST
			l_actual_arguments: ET_AGENT_ARGUMENT_OPERAND_LIST
			l_preconditions: ET_PRECONDITIONS
			l_locals: ET_LOCAL_VARIABLE_LIST
			l_postconditions: ET_POSTCONDITIONS
			l_compound: ET_COMPOUND
			l_declared_type: ET_DECLARED_TYPE
			l_type: ET_TYPE
		do
			an_expression.agent_keyword.process (Current)
			print_space
			l_formal_arguments := an_expression.formal_arguments
			if l_formal_arguments /= Void then
				if l_formal_arguments.is_empty then
						-- Do not print empty parentheses, but keep the comments if any.
					comment_finder.find_comments (l_formal_arguments, comment_list)
				else
					l_formal_arguments.process (Current)
				end
			end
				-- The AST may or may not contain the colon.
				-- So we have to print it explicitly here.
			l_declared_type := an_expression.declared_type
			l_type := l_declared_type.type
			tokens.colon_symbol.process (Current)
			comment_finder.add_excluded_node (l_type)
			comment_finder.find_comments (l_declared_type, comment_list)
			comment_finder.reset_excluded_nodes
			print_space
			l_type.process (Current)
			process_comments
			print_new_line
			l_preconditions := an_expression.preconditions
			if l_preconditions /= Void then
				l_preconditions.process (Current)
				process_comments
				print_new_line
			end
			l_locals := an_expression.locals
			if l_locals /= Void then
				l_locals.process (Current)
				process_comments
				print_new_line
			end
			l_compound := an_expression.compound
			if l_compound /= Void then
				l_compound.process (Current)
			else
				tokens.do_keyword.process (Current)
			end
			process_comments
			print_new_line
			l_postconditions := an_expression.postconditions
			if l_postconditions /= Void then
				l_postconditions.process (Current)
				process_comments
				print_new_line
			end
			l_compound := an_expression.rescue_clause
			if l_compound /= Void then
				l_compound.process (Current)
				process_comments
				print_new_line
			end
			an_expression.end_keyword.process (Current)
			l_actual_arguments ?= an_expression.actual_arguments
			if l_actual_arguments /= Void then
					-- Do not print implicit argument operands (they were not in the original class text anyway).
				if l_actual_arguments.is_empty then
						-- Do not print empty parentheses, but keep the comments if any.
					comment_finder.find_comments (l_actual_arguments, comment_list)
				else
					print_space
					l_actual_arguments.process (Current)
				end
			end
		end

	process_do_procedure (a_feature: ET_DO_PROCEDURE) is
			-- Process `a_feature'.
		local
			l_frozen_keyword: ET_TOKEN
			l_extended_feature_name: ET_EXTENDED_FEATURE_NAME
			l_feature_name: ET_FEATURE_NAME
			l_alias_name: ET_ALIAS_NAME
			l_synonym: ET_FEATURE
			l_arguments: ET_FORMAL_ARGUMENT_LIST
			l_indexing: ET_INDEXING_LIST
			l_obsolete_message: ET_OBSOLETE
			l_preconditions: ET_PRECONDITIONS
			l_postconditions: ET_POSTCONDITIONS
			l_semicolon: ET_SEMICOLON_SYMBOL
			l_is_keyword: ET_KEYWORD
			l_obsolete_string: ET_MANIFEST_STRING
			l_locals: ET_LOCAL_VARIABLE_LIST
			l_compound: ET_COMPOUND
		do
			from
				l_synonym := a_feature
			until
				l_synonym = Void
			loop
				l_frozen_keyword := l_synonym.frozen_keyword
				if l_frozen_keyword /= Void then
					l_frozen_keyword.process (Current)
					print_space
				end
				l_extended_feature_name := l_synonym.extended_name
				l_feature_name := l_extended_feature_name.feature_name
				l_alias_name := l_extended_feature_name.alias_name
				l_feature_name.process (Current)
				if l_alias_name /= Void and not ANY_.same_objects (l_alias_name, l_feature_name) then
						-- For infix and prefix features, do not repeat the name twice.
					print_space
					l_alias_name.process (Current)
					comment_finder.add_excluded_node (l_alias_name)
				end
				comment_finder.add_excluded_node (l_feature_name)
				comment_finder.find_comments (l_extended_feature_name, comment_list)
				comment_finder.reset_excluded_nodes
				l_synonym := l_synonym.synonym
				if l_synonym /= Void then
						-- The AST may or may not contain the comma.
						-- So we have to print it explicitly here.
					tokens.comma_symbol.process (Current)
					print_space
				end
			end
			l_arguments := a_feature.arguments
			if l_arguments /= Void then
				if l_arguments.is_empty then
						-- Do not print empty parentheses, but keep the comments if any.
					comment_finder.find_comments (l_arguments, comment_list)
				else
					print_space
					l_arguments.process (Current)
				end
			end
			print_space
			tokens.is_keyword.process (Current)
			l_is_keyword := a_feature.is_keyword
			if l_is_keyword /= Void then
				process_break (l_is_keyword.break)
			end
			indent
			process_comments
			print_new_line
			l_indexing := a_feature.first_indexing
			if l_indexing /= Void then
				l_indexing.process (Current)
				process_comments
				print_new_line
			end
			l_obsolete_message := a_feature.obsolete_message
			if l_obsolete_message /= Void then
				tokens.obsolete_keyword.process (Current)
				l_obsolete_string := l_obsolete_message.manifest_string
				comment_finder.add_excluded_node (l_obsolete_string)
				comment_finder.find_comments (l_obsolete_message, comment_list)
				comment_finder.reset_excluded_nodes
				indent
				process_comments
				print_new_line
				l_obsolete_string.process (Current)
				process_comments
				print_new_line
				dedent
			end
			l_preconditions := a_feature.preconditions
			if l_preconditions /= Void then
				l_preconditions.process (Current)
				process_comments
				print_new_line
			end
			l_locals := a_feature.locals
			if l_locals /= Void then
				l_locals.process (Current)
				process_comments
				print_new_line
			end
			l_compound := a_feature.compound
			if l_compound /= Void then
				l_compound.process (Current)
			else
				tokens.do_keyword.process (Current)
			end
			process_comments
			print_new_line
			l_postconditions := a_feature.postconditions
			if l_postconditions /= Void then
				l_postconditions.process (Current)
				process_comments
				print_new_line
			end
			l_compound := a_feature.rescue_clause
			if l_compound /= Void then
				l_compound.process (Current)
				process_comments
				print_new_line
			end
			a_feature.end_keyword.process (Current)
			l_semicolon := a_feature.semicolon
			if l_semicolon /= Void then
					-- Do not print the semicolon, but keep track of its comments if any.
				process_break (l_semicolon.break)
			end
			dedent
		end

	process_do_procedure_inline_agent (an_expression: ET_DO_PROCEDURE_INLINE_AGENT) is
			-- Process `an_expression'.
		local
			l_formal_arguments: ET_FORMAL_ARGUMENT_LIST
			l_actual_arguments: ET_AGENT_ARGUMENT_OPERAND_LIST
			l_preconditions: ET_PRECONDITIONS
			l_locals: ET_LOCAL_VARIABLE_LIST
			l_postconditions: ET_POSTCONDITIONS
			l_compound: ET_COMPOUND
		do
			an_expression.agent_keyword.process (Current)
			l_formal_arguments := an_expression.formal_arguments
			if l_formal_arguments /= Void then
				if l_formal_arguments.is_empty then
						-- Do not print empty parentheses, but keep the comments if any.
					comment_finder.find_comments (l_formal_arguments, comment_list)
				else
					print_space
					l_formal_arguments.process (Current)
				end
			end
			process_comments
			print_new_line
			l_preconditions := an_expression.preconditions
			if l_preconditions /= Void then
				l_preconditions.process (Current)
				process_comments
				print_new_line
			end
			l_locals := an_expression.locals
			if l_locals /= Void then
				l_locals.process (Current)
				process_comments
				print_new_line
			end
			l_compound := an_expression.compound
			if l_compound /= Void then
				l_compound.process (Current)
			else
				tokens.do_keyword.process (Current)
			end
			process_comments
			print_new_line
			l_postconditions := an_expression.postconditions
			if l_postconditions /= Void then
				l_postconditions.process (Current)
				process_comments
				print_new_line
			end
			l_compound := an_expression.rescue_clause
			if l_compound /= Void then
				l_compound.process (Current)
				process_comments
				print_new_line
			end
			an_expression.end_keyword.process (Current)
			l_actual_arguments ?= an_expression.actual_arguments
			if l_actual_arguments /= Void then
					-- Do not print implicit argument operands (they were not in the original class text anyway).
				if l_actual_arguments.is_empty then
						-- Do not print empty parentheses, but keep the comments if any.
					comment_finder.find_comments (l_actual_arguments, comment_list)
				else
					print_space
					l_actual_arguments.process (Current)
				end
			end
		end

	process_dotnet_function (a_feature: ET_DOTNET_FUNCTION) is
			-- Process `a_feature'.
		local
			l_frozen_keyword: ET_TOKEN
			l_extended_feature_name: ET_EXTENDED_FEATURE_NAME
			l_feature_name: ET_FEATURE_NAME
			l_alias_name: ET_ALIAS_NAME
			l_declared_type: ET_DECLARED_TYPE
			l_type: ET_TYPE
			l_synonym: ET_FEATURE
			l_arguments: ET_FORMAL_ARGUMENT_LIST
			l_semicolon: ET_SEMICOLON_SYMBOL
			l_is_keyword: ET_KEYWORD
			l_assigner: ET_ASSIGNER
		do
			from
				l_synonym := a_feature
			until
				l_synonym = Void
			loop
				l_frozen_keyword := l_synonym.frozen_keyword
				if l_frozen_keyword /= Void then
					l_frozen_keyword.process (Current)
					print_space
				end
				l_extended_feature_name := l_synonym.extended_name
				l_feature_name := l_extended_feature_name.feature_name
				l_alias_name := l_extended_feature_name.alias_name
				l_feature_name.process (Current)
				if l_alias_name /= Void and not ANY_.same_objects (l_alias_name, l_feature_name) then
						-- For infix and prefix features, do not repeat the name twice.
					print_space
					l_alias_name.process (Current)
					comment_finder.add_excluded_node (l_alias_name)
				end
				comment_finder.add_excluded_node (l_feature_name)
				comment_finder.find_comments (l_extended_feature_name, comment_list)
				comment_finder.reset_excluded_nodes
				l_synonym := l_synonym.synonym
				if l_synonym /= Void then
						-- The AST may or may not contain the comma.
						-- So we have to print it explicitly here.
					tokens.comma_symbol.process (Current)
					print_space
				end
			end
			l_arguments := a_feature.arguments
			if l_arguments /= Void then
				if l_arguments.is_empty then
						-- Do not print empty parentheses, but keep the comments if any.
					comment_finder.find_comments (l_arguments, comment_list)
				else
					print_space
					l_arguments.process (Current)
				end
			end
				-- The AST may or may not contain the colon.
				-- So we have to print it explicitly here.
			l_declared_type := a_feature.declared_type
			l_type := l_declared_type.type
			tokens.colon_symbol.process (Current)
			comment_finder.add_excluded_node (l_type)
			comment_finder.find_comments (l_declared_type, comment_list)
			comment_finder.reset_excluded_nodes
			print_space
			l_type.process (Current)
			l_assigner := a_feature.assigner
			if l_assigner /= Void then
				print_space
				l_assigner.process (Current)
			end
			print_space
			tokens.is_keyword.process (Current)
			l_is_keyword := a_feature.is_keyword
			if l_is_keyword /= Void then
				process_break (l_is_keyword.break)
			end
			indent
			process_comments
			print_new_line
			tokens.do_keyword.process (Current)
			process_comments
			print_new_line
			a_feature.end_keyword.process (Current)
			l_semicolon := a_feature.semicolon
			if l_semicolon /= Void then
					-- Do not print the semicolon, but keep track of its comments if any.
				process_break (l_semicolon.break)
			end
			dedent
		end

	process_dotnet_procedure (a_feature: ET_DOTNET_PROCEDURE) is
			-- Process `a_feature'.
		local
			l_frozen_keyword: ET_TOKEN
			l_extended_feature_name: ET_EXTENDED_FEATURE_NAME
			l_feature_name: ET_FEATURE_NAME
			l_alias_name: ET_ALIAS_NAME
			l_synonym: ET_FEATURE
			l_arguments: ET_FORMAL_ARGUMENT_LIST
			l_semicolon: ET_SEMICOLON_SYMBOL
			l_is_keyword: ET_KEYWORD
		do
			from
				l_synonym := a_feature
			until
				l_synonym = Void
			loop
				l_frozen_keyword := l_synonym.frozen_keyword
				if l_frozen_keyword /= Void then
					l_frozen_keyword.process (Current)
					print_space
				end
				l_extended_feature_name := l_synonym.extended_name
				l_feature_name := l_extended_feature_name.feature_name
				l_alias_name := l_extended_feature_name.alias_name
				l_feature_name.process (Current)
				if l_alias_name /= Void and not ANY_.same_objects (l_alias_name, l_feature_name) then
						-- For infix and prefix features, do not repeat the name twice.
					print_space
					l_alias_name.process (Current)
					comment_finder.add_excluded_node (l_alias_name)
				end
				comment_finder.add_excluded_node (l_feature_name)
				comment_finder.find_comments (l_extended_feature_name, comment_list)
				comment_finder.reset_excluded_nodes
				l_synonym := l_synonym.synonym
				if l_synonym /= Void then
						-- The AST may or may not contain the comma.
						-- So we have to print it explicitly here.
					tokens.comma_symbol.process (Current)
					print_space
				end
			end
			l_arguments := a_feature.arguments
			if l_arguments /= Void then
				if l_arguments.is_empty then
						-- Do not print empty parentheses, but keep the comments if any.
					comment_finder.find_comments (l_arguments, comment_list)
				else
					print_space
					l_arguments.process (Current)
				end
			end
			print_space
			tokens.is_keyword.process (Current)
			l_is_keyword := a_feature.is_keyword
			if l_is_keyword /= Void then
				process_break (l_is_keyword.break)
			end
			indent
			process_comments
			print_new_line
			tokens.do_keyword.process (Current)
			process_comments
			print_new_line
			a_feature.end_keyword.process (Current)
			l_semicolon := a_feature.semicolon
			if l_semicolon /= Void then
					-- Do not print the semicolon, but keep track of its comments if any.
				process_break (l_semicolon.break)
			end
			dedent
		end

	process_elseif_part (an_elseif_part: ET_ELSEIF_PART) is
			-- Process `an_elseif_part'.
		local
			l_compound: ET_COMPOUND
			l_conditional: ET_CONDITIONAL
			l_expression: ET_EXPRESSION
		do
			tokens.elseif_keyword.process (Current)
			print_space
			l_conditional := an_elseif_part.conditional
			l_expression := l_conditional.expression
			l_expression.process (Current)
			comment_finder.add_excluded_node (l_expression)
			comment_finder.find_comments (l_conditional, comment_list)
			comment_finder.reset_excluded_nodes
			print_space
			l_compound := an_elseif_part.then_compound
			if l_compound /= Void then
				l_compound.process (Current)
			else
				tokens.then_keyword.process (Current)
			end
		end

	process_elseif_part_list (a_list: ET_ELSEIF_PART_LIST) is
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			nb := a_list.count
			from i := 1 until i > nb loop
				if i /= 1 then
					print_new_line
				end
				a_list.item (i).process (Current)
				process_comments
				i := i + 1
			end
		end

	process_equality_expression (an_expression: ET_EQUALITY_EXPRESSION) is
			-- Process `an_expression'.
		do
			an_expression.left.process (Current)
			print_space
			an_expression.operator.process (Current)
			print_space
			an_expression.right.process (Current)
		end

	process_export_list (a_list: ET_EXPORT_LIST) is
			-- Process `a_list'.
		local
			i, nb: INTEGER
			l_export: ET_EXPORT
		do
			if a_list.has_non_null_export then
				a_list.export_keyword.process (Current)
				indent
				nb := a_list.count
				from i := 1 until i > nb loop
					l_export := a_list.item (i)
					if l_export.is_semicolon then
							-- Skip null export.
						comment_finder.find_comments (l_export, comment_list)
					else
						process_comments
						print_new_line
						l_export.process (Current)
					end
					i := i + 1
				end
				process_comments
				dedent
			else
				comment_finder.find_comments (a_list, comment_list)
			end
		end

	process_export_list_same_line (a_list: ET_EXPORT_LIST) is
			-- Process `a_list'.
			-- Print every thing on the same line.
		require
			a_list_not_void: a_list /= Void
		local
			i, nb: INTEGER
			l_export: ET_EXPORT
		do
			if a_list.has_non_null_export then
				a_list.export_keyword.process (Current)
				indent
				nb := a_list.count
				from i := 1 until i > nb loop
					l_export := a_list.item (i)
					if l_export.is_semicolon then
							-- Skip null export.
						comment_finder.find_comments (l_export, comment_list)
					else
						print_space
						l_export.process (Current)
					end
					i := i + 1
				end
				process_comments
				dedent
			else
				comment_finder.find_comments (a_list, comment_list)
			end
		end

	process_external_function (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Process `a_feature'.
		local
			l_frozen_keyword: ET_TOKEN
			l_extended_feature_name: ET_EXTENDED_FEATURE_NAME
			l_feature_name: ET_FEATURE_NAME
			l_alias_name: ET_ALIAS_NAME
			l_declared_type: ET_DECLARED_TYPE
			l_type: ET_TYPE
			l_synonym: ET_FEATURE
			l_arguments: ET_FORMAL_ARGUMENT_LIST
			l_indexing: ET_INDEXING_LIST
			l_obsolete_message: ET_OBSOLETE
			l_preconditions: ET_PRECONDITIONS
			l_postconditions: ET_POSTCONDITIONS
			l_semicolon: ET_SEMICOLON_SYMBOL
			l_is_keyword: ET_KEYWORD
			l_assigner: ET_ASSIGNER
			l_obsolete_string: ET_MANIFEST_STRING
			l_external_language: ET_EXTERNAL_LANGUAGE
			l_external_alias: ET_EXTERNAL_ALIAS
			l_manifest_string: ET_MANIFEST_STRING
		do
			from
				l_synonym := a_feature
			until
				l_synonym = Void
			loop
				l_frozen_keyword := l_synonym.frozen_keyword
				if l_frozen_keyword /= Void then
					l_frozen_keyword.process (Current)
					print_space
				end
				l_extended_feature_name := l_synonym.extended_name
				l_feature_name := l_extended_feature_name.feature_name
				l_alias_name := l_extended_feature_name.alias_name
				l_feature_name.process (Current)
				if l_alias_name /= Void and not ANY_.same_objects (l_alias_name, l_feature_name) then
						-- For infix and prefix features, do not repeat the name twice.
					print_space
					l_alias_name.process (Current)
					comment_finder.add_excluded_node (l_alias_name)
				end
				comment_finder.add_excluded_node (l_feature_name)
				comment_finder.find_comments (l_extended_feature_name, comment_list)
				comment_finder.reset_excluded_nodes
				l_synonym := l_synonym.synonym
				if l_synonym /= Void then
						-- The AST may or may not contain the comma.
						-- So we have to print it explicitly here.
					tokens.comma_symbol.process (Current)
					print_space
				end
			end
			l_arguments := a_feature.arguments
			if l_arguments /= Void then
				if l_arguments.is_empty then
						-- Do not print empty parentheses, but keep the comments if any.
					comment_finder.find_comments (l_arguments, comment_list)
				else
					print_space
					l_arguments.process (Current)
				end
			end
				-- The AST may or may not contain the colon.
				-- So we have to print it explicitly here.
			l_declared_type := a_feature.declared_type
			l_type := l_declared_type.type
			tokens.colon_symbol.process (Current)
			comment_finder.add_excluded_node (l_type)
			comment_finder.find_comments (l_declared_type, comment_list)
			comment_finder.reset_excluded_nodes
			print_space
			l_type.process (Current)
			l_assigner := a_feature.assigner
			if l_assigner /= Void then
				print_space
				l_assigner.process (Current)
			end
			print_space
			tokens.is_keyword.process (Current)
			l_is_keyword := a_feature.is_keyword
			if l_is_keyword /= Void then
				process_break (l_is_keyword.break)
			end
			indent
			process_comments
			print_new_line
			l_indexing := a_feature.first_indexing
			if l_indexing /= Void then
				l_indexing.process (Current)
				process_comments
				print_new_line
			end
			l_obsolete_message := a_feature.obsolete_message
			if l_obsolete_message /= Void then
				tokens.obsolete_keyword.process (Current)
				l_obsolete_string := l_obsolete_message.manifest_string
				comment_finder.add_excluded_node (l_obsolete_string)
				comment_finder.find_comments (l_obsolete_message, comment_list)
				comment_finder.reset_excluded_nodes
				indent
				process_comments
				print_new_line
				l_obsolete_string.process (Current)
				dedent
				process_comments
				print_new_line
			end
			l_preconditions := a_feature.preconditions
			if l_preconditions /= Void then
				l_preconditions.process (Current)
				process_comments
				print_new_line
			end
			tokens.external_keyword.process (Current)
			l_external_language := a_feature.language
			l_manifest_string := l_external_language.manifest_string
			comment_finder.add_excluded_node (l_manifest_string)
			comment_finder.find_comments (l_external_language, comment_list)
			comment_finder.reset_excluded_nodes
			indent
			process_comments
			print_new_line
			l_manifest_string.process (Current)
			process_comments
			print_new_line
			dedent
			l_external_alias := a_feature.alias_clause
			if l_external_alias /= Void then
				tokens.alias_keyword.process (Current)
				l_manifest_string := l_external_alias.manifest_string
				comment_finder.add_excluded_node (l_manifest_string)
				comment_finder.find_comments (l_external_alias, comment_list)
				comment_finder.reset_excluded_nodes
				indent
				process_comments
				print_new_line
				l_manifest_string.process (Current)
				process_comments
				print_new_line
				dedent
			end
			l_postconditions := a_feature.postconditions
			if l_postconditions /= Void then
				l_postconditions.process (Current)
				process_comments
				print_new_line
			end
			a_feature.end_keyword.process (Current)
			l_semicolon := a_feature.semicolon
			if l_semicolon /= Void then
					-- Do not print the semicolon, but keep track of its comments if any.
				process_break (l_semicolon.break)
			end
			dedent
		end

	process_external_function_inline_agent (an_expression: ET_EXTERNAL_FUNCTION_INLINE_AGENT) is
			-- Process `an_expression'.
		local
			l_formal_arguments: ET_FORMAL_ARGUMENT_LIST
			l_actual_arguments: ET_AGENT_ARGUMENT_OPERAND_LIST
			l_preconditions: ET_PRECONDITIONS
			l_postconditions: ET_POSTCONDITIONS
			l_declared_type: ET_DECLARED_TYPE
			l_type: ET_TYPE
			l_external_language: ET_EXTERNAL_LANGUAGE
			l_external_alias: ET_EXTERNAL_ALIAS
			l_manifest_string: ET_MANIFEST_STRING
		do
			an_expression.agent_keyword.process (Current)
			print_space
			l_formal_arguments := an_expression.formal_arguments
			if l_formal_arguments /= Void then
				if l_formal_arguments.is_empty then
						-- Do not print empty parentheses, but keep the comments if any.
					comment_finder.find_comments (l_formal_arguments, comment_list)
				else
					l_formal_arguments.process (Current)
				end
			end
				-- The AST may or may not contain the colon.
				-- So we have to print it explicitly here.
			l_declared_type := an_expression.declared_type
			l_type := l_declared_type.type
			tokens.colon_symbol.process (Current)
			comment_finder.add_excluded_node (l_type)
			comment_finder.find_comments (l_declared_type, comment_list)
			comment_finder.reset_excluded_nodes
			print_space
			l_type.process (Current)
			process_comments
			print_new_line
			l_preconditions := an_expression.preconditions
			if l_preconditions /= Void then
				l_preconditions.process (Current)
				process_comments
				print_new_line
			end
			tokens.external_keyword.process (Current)
			l_external_language := an_expression.language
			l_manifest_string := l_external_language.manifest_string
			comment_finder.add_excluded_node (l_manifest_string)
			comment_finder.find_comments (l_external_language, comment_list)
			comment_finder.reset_excluded_nodes
			indent
			process_comments
			print_new_line
			l_manifest_string.process (Current)
			process_comments
			print_new_line
			dedent
			l_external_alias := an_expression.alias_clause
			if l_external_alias /= Void then
				tokens.alias_keyword.process (Current)
				l_manifest_string := l_external_alias.manifest_string
				comment_finder.add_excluded_node (l_manifest_string)
				comment_finder.find_comments (l_external_alias, comment_list)
				comment_finder.reset_excluded_nodes
				indent
				process_comments
				print_new_line
				l_manifest_string.process (Current)
				process_comments
				print_new_line
				dedent
			end
			process_comments
			print_new_line
			l_postconditions := an_expression.postconditions
			if l_postconditions /= Void then
				l_postconditions.process (Current)
				process_comments
				print_new_line
			end
			an_expression.end_keyword.process (Current)
			l_actual_arguments ?= an_expression.actual_arguments
			if l_actual_arguments /= Void then
					-- Do not print implicit argument operands (they were not in the original class text anyway).
				if l_actual_arguments.is_empty then
						-- Do not print empty parentheses, but keep the comments if any.
					comment_finder.find_comments (l_actual_arguments, comment_list)
				else
					print_space
					l_actual_arguments.process (Current)
				end
			end
		end

	process_external_procedure (a_feature: ET_EXTERNAL_PROCEDURE) is
			-- Process `a_feature'.
		local
			l_frozen_keyword: ET_TOKEN
			l_extended_feature_name: ET_EXTENDED_FEATURE_NAME
			l_feature_name: ET_FEATURE_NAME
			l_alias_name: ET_ALIAS_NAME
			l_synonym: ET_FEATURE
			l_arguments: ET_FORMAL_ARGUMENT_LIST
			l_indexing: ET_INDEXING_LIST
			l_obsolete_message: ET_OBSOLETE
			l_preconditions: ET_PRECONDITIONS
			l_postconditions: ET_POSTCONDITIONS
			l_semicolon: ET_SEMICOLON_SYMBOL
			l_is_keyword: ET_KEYWORD
			l_obsolete_string: ET_MANIFEST_STRING
			l_external_language: ET_EXTERNAL_LANGUAGE
			l_external_alias: ET_EXTERNAL_ALIAS
			l_manifest_string: ET_MANIFEST_STRING
		do
			from
				l_synonym := a_feature
			until
				l_synonym = Void
			loop
				l_frozen_keyword := l_synonym.frozen_keyword
				if l_frozen_keyword /= Void then
					l_frozen_keyword.process (Current)
					print_space
				end
				l_extended_feature_name := l_synonym.extended_name
				l_feature_name := l_extended_feature_name.feature_name
				l_alias_name := l_extended_feature_name.alias_name
				l_feature_name.process (Current)
				if l_alias_name /= Void and not ANY_.same_objects (l_alias_name, l_feature_name) then
						-- For infix and prefix features, do not repeat the name twice.
					print_space
					l_alias_name.process (Current)
					comment_finder.add_excluded_node (l_alias_name)
				end
				comment_finder.add_excluded_node (l_feature_name)
				comment_finder.find_comments (l_extended_feature_name, comment_list)
				comment_finder.reset_excluded_nodes
				l_synonym := l_synonym.synonym
				if l_synonym /= Void then
						-- The AST may or may not contain the comma.
						-- So we have to print it explicitly here.
					tokens.comma_symbol.process (Current)
					print_space
				end
			end
			l_arguments := a_feature.arguments
			if l_arguments /= Void then
				if l_arguments.is_empty then
						-- Do not print empty parentheses, but keep the comments if any.
					comment_finder.find_comments (l_arguments, comment_list)
				else
					print_space
					l_arguments.process (Current)
				end
			end
			print_space
			tokens.is_keyword.process (Current)
			l_is_keyword := a_feature.is_keyword
			if l_is_keyword /= Void then
				process_break (l_is_keyword.break)
			end
			indent
			process_comments
			print_new_line
			l_indexing := a_feature.first_indexing
			if l_indexing /= Void then
				l_indexing.process (Current)
				process_comments
				print_new_line
			end
			l_obsolete_message := a_feature.obsolete_message
			if l_obsolete_message /= Void then
				tokens.obsolete_keyword.process (Current)
				l_obsolete_string := l_obsolete_message.manifest_string
				comment_finder.add_excluded_node (l_obsolete_string)
				comment_finder.find_comments (l_obsolete_message, comment_list)
				comment_finder.reset_excluded_nodes
				indent
				process_comments
				print_new_line
				l_obsolete_string.process (Current)
				dedent
				process_comments
				print_new_line
			end
			l_preconditions := a_feature.preconditions
			if l_preconditions /= Void then
				l_preconditions.process (Current)
				process_comments
				print_new_line
			end
			tokens.external_keyword.process (Current)
			l_external_language := a_feature.language
			l_manifest_string := l_external_language.manifest_string
			comment_finder.add_excluded_node (l_manifest_string)
			comment_finder.find_comments (l_external_language, comment_list)
			comment_finder.reset_excluded_nodes
			indent
			process_comments
			print_new_line
			l_manifest_string.process (Current)
			process_comments
			print_new_line
			dedent
			l_external_alias := a_feature.alias_clause
			if l_external_alias /= Void then
				tokens.alias_keyword.process (Current)
				l_manifest_string := l_external_alias.manifest_string
				comment_finder.add_excluded_node (l_manifest_string)
				comment_finder.find_comments (l_external_alias, comment_list)
				comment_finder.reset_excluded_nodes
				indent
				process_comments
				print_new_line
				l_manifest_string.process (Current)
				process_comments
				print_new_line
				dedent
			end
			l_postconditions := a_feature.postconditions
			if l_postconditions /= Void then
				l_postconditions.process (Current)
				process_comments
				print_new_line
			end
			a_feature.end_keyword.process (Current)
			l_semicolon := a_feature.semicolon
			if l_semicolon /= Void then
					-- Do not print the semicolon, but keep track of its comments if any.
				process_break (l_semicolon.break)
			end
			dedent
		end

	process_external_procedure_inline_agent (an_expression: ET_EXTERNAL_PROCEDURE_INLINE_AGENT) is
			-- Process `an_expression'.
		local
			l_formal_arguments: ET_FORMAL_ARGUMENT_LIST
			l_actual_arguments: ET_AGENT_ARGUMENT_OPERAND_LIST
			l_preconditions: ET_PRECONDITIONS
			l_postconditions: ET_POSTCONDITIONS
			l_external_language: ET_EXTERNAL_LANGUAGE
			l_external_alias: ET_EXTERNAL_ALIAS
			l_manifest_string: ET_MANIFEST_STRING
		do
			an_expression.agent_keyword.process (Current)
			print_space
			l_formal_arguments := an_expression.formal_arguments
			if l_formal_arguments /= Void then
				if l_formal_arguments.is_empty then
						-- Do not print empty parentheses, but keep the comments if any.
					comment_finder.find_comments (l_formal_arguments, comment_list)
				else
					l_formal_arguments.process (Current)
				end
			end
			process_comments
			print_new_line
			l_preconditions := an_expression.preconditions
			if l_preconditions /= Void then
				l_preconditions.process (Current)
				process_comments
				print_new_line
			end
			tokens.external_keyword.process (Current)
			l_external_language := an_expression.language
			l_manifest_string := l_external_language.manifest_string
			comment_finder.add_excluded_node (l_manifest_string)
			comment_finder.find_comments (l_external_language, comment_list)
			comment_finder.reset_excluded_nodes
			indent
			process_comments
			print_new_line
			l_manifest_string.process (Current)
			process_comments
			print_new_line
			dedent
			l_external_alias := an_expression.alias_clause
			if l_external_alias /= Void then
				tokens.alias_keyword.process (Current)
				l_manifest_string := l_external_alias.manifest_string
				comment_finder.add_excluded_node (l_manifest_string)
				comment_finder.find_comments (l_external_alias, comment_list)
				comment_finder.reset_excluded_nodes
				indent
				process_comments
				print_new_line
				l_manifest_string.process (Current)
				process_comments
				print_new_line
				dedent
			end
			process_comments
			print_new_line
			l_postconditions := an_expression.postconditions
			if l_postconditions /= Void then
				l_postconditions.process (Current)
				process_comments
				print_new_line
			end
			an_expression.end_keyword.process (Current)
			l_actual_arguments ?= an_expression.actual_arguments
			if l_actual_arguments /= Void then
					-- Do not print implicit argument operands (they were not in the original class text anyway).
				if l_actual_arguments.is_empty then
						-- Do not print empty parentheses, but keep the comments if any.
					comment_finder.find_comments (l_actual_arguments, comment_list)
				else
					print_space
					l_actual_arguments.process (Current)
				end
			end
		end

	process_feature_clause (a_feature_clause: ET_FEATURE_CLAUSE) is
			-- Process `a_feature_clause'.
		local
			l_clients: ET_CLIENTS
		do
			a_feature_clause.feature_keyword.process (Current)
			l_clients := a_feature_clause.clients_clause
			if l_clients /= Void then
				print_space
				l_clients.process (Current)
			end
			process_comments_on_same_line
		end

	process_feature_clause_list (a_list: ET_FEATURE_CLAUSE_LIST) is
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.item (i).process (Current)
				process_comments
				print_new_line
				print_new_line
				i := i + 1
			end
		end

	process_feature_export (an_export: ET_FEATURE_EXPORT) is
			-- Process `an_export'.
		local
			i, nb: INTEGER
			l_item: ET_FEATURE_NAME_ITEM
			l_feature_name: ET_FEATURE_NAME
		do
			if not an_export.is_empty then
				an_export.clients_clause.process (Current)
				nb := an_export.count
				indent
				from i := 1 until i > nb loop
					process_comments
					print_new_line
					l_item := an_export.item (i)
					l_feature_name := l_item.feature_name
					l_feature_name.process (Current)
					if i /= nb then
							-- The AST may or may not contain the comma.
							-- So we have to print it explicitly here.
						tokens.comma_symbol.process (Current)
					end
					comment_finder.add_excluded_node (l_feature_name)
					comment_finder.find_comments (l_item, comment_list)
					comment_finder.reset_excluded_nodes
					i := i + 1
				end
				dedent
			else
				comment_finder.find_comments (an_export, comment_list)
			end
		end

	process_features (a_class: ET_CLASS) is
			-- Process feature clauses of `a_class'.
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
				nb_queries := l_queries.declared_count
				if nb_queries > 0 then
					l_query := l_queries.first
				end
				k := 1
				l_procedures := a_class.procedures
				nb_procedures := l_procedures.declared_count
				if nb_procedures > 0 then
					l_procedure := l_procedures.first
				end
				nb := a_feature_clauses.count
				from i := 1 until i > nb loop
					a_feature_clause := a_feature_clauses.item (i)
					a_feature_clause.process (Current)
					process_comments
					print_new_line
					print_new_line
					from
					until
						(l_query = Void or else l_query.feature_clause /= a_feature_clause) and
						(l_procedure = Void or else l_procedure.feature_clause /= a_feature_clause)
					loop
						indent
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
						dedent
						print_new_line
						print_new_line
					end
					i := i + 1
				end
			end
		end

	process_formal_argument (an_argument: ET_FORMAL_ARGUMENT) is
			-- Process `an_argument'.
		local
			l_name_item: ET_ARGUMENT_NAME
			l_name: ET_IDENTIFIER
			l_declared_type: ET_DECLARED_TYPE
			l_type: ET_TYPE
		do
			l_name_item := an_argument.name_item
			l_name := l_name_item.identifier
			l_name.process (Current)
			comment_finder.add_excluded_node (l_name)
			comment_finder.find_comments (l_name_item, comment_list)
			comment_finder.reset_excluded_nodes
				-- The AST may or may not contain the colon.
				-- So we have to print it explicitly here.
			l_declared_type := an_argument.declared_type
			l_type := l_declared_type.type
			tokens.colon_symbol.process (Current)
			comment_finder.add_excluded_node (l_type)
			comment_finder.find_comments (l_declared_type, comment_list)
			comment_finder.reset_excluded_nodes
			print_space
			l_type.process (Current)
		end

	process_formal_argument_list (a_list: ET_FORMAL_ARGUMENT_LIST) is
			-- Process `a_list'.
		local
			i, nb: INTEGER
			l_item: ET_FORMAL_ARGUMENT_ITEM
			l_name: ET_IDENTIFIER
			l_type: ET_TYPE
		do
			a_list.left_parenthesis.process (Current)
			nb := a_list.count
			from i := 1 until i > nb loop
				l_item := a_list.item (i)
				l_name := l_item.name
				l_name.process (Current)
				if l_item.is_last_entity or i = nb then
					tokens.colon_symbol.process (Current)
					print_space
					l_type := l_item.type
					l_type.process (Current)
					comment_finder.add_excluded_node (l_name)
					comment_finder.add_excluded_node (l_type)
					comment_finder.find_comments (l_item, comment_list)
					comment_finder.reset_excluded_nodes
					if i /= nb then
							-- The AST may or may not contain the semicolon.
							-- So we have to print it explicitly here.
						tokens.semicolon_symbol.process (Current)
						print_space
					end
				else
					comment_finder.add_excluded_node (l_name)
					comment_finder.find_comments (l_item, comment_list)
					comment_finder.reset_excluded_nodes
						-- The AST may or may not contain the comma.
						-- So we have to print it explicitly here.
					tokens.comma_symbol.process (Current)
					print_space
				end
				i := i + 1
			end
			a_list.right_parenthesis.process (Current)
		end

	process_formal_comma_argument (an_argument: ET_FORMAL_COMMA_ARGUMENT) is
			-- Process `an_argument'.
		local
			l_name_item: ET_ARGUMENT_NAME
			l_name: ET_IDENTIFIER
		do
			l_name_item := an_argument.name_item
			l_name := l_name_item.identifier
			l_name.process (Current)
			comment_finder.add_excluded_node (l_name)
			comment_finder.find_comments (l_name_item, comment_list)
			comment_finder.reset_excluded_nodes
				-- The AST may or may not contain the comma.
				-- So we have to print it explicitly here.
			tokens.comma_symbol.process (Current)
		end

	process_formal_parameter (a_parameter: ET_FORMAL_PARAMETER) is
			-- Process `a_parameter'.
		local
			a_type_mark: ET_KEYWORD
		do
			a_type_mark := a_parameter.type_mark
			if a_type_mark /= Void then
				a_type_mark.process (Current)
				print_space
			end
			a_parameter.name.process (Current)
		end

	process_formal_parameter_list (a_list: ET_FORMAL_PARAMETER_LIST) is
			-- Process `a_list'.
		local
			i, nb: INTEGER
			l_item: ET_FORMAL_PARAMETER_ITEM
			l_formal_parameter: ET_FORMAL_PARAMETER
		do
			a_list.left_bracket.process (Current)
			nb := a_list.count
			from i := 1 until i > nb loop
				l_item := a_list.item (i)
				l_formal_parameter := l_item.formal_parameter
				l_formal_parameter.process (Current)
				comment_finder.add_excluded_node (l_formal_parameter)
				comment_finder.find_comments (l_item, comment_list)
				comment_finder.reset_excluded_nodes
				if i /= nb then
						-- The AST may or may not contain the comma.
						-- So we have to print it explicitly here.
					tokens.comma_symbol.process (Current)
					print_space
				end
				i := i + 1
			end
			a_list.right_bracket.process (Current)
		end

	process_generic_class_type (a_type: ET_GENERIC_CLASS_TYPE) is
			-- Process `a_type'.
		local
			l_actual_parameters: ET_ACTUAL_PARAMETER_LIST
		do
			process_class_type (a_type)
			l_actual_parameters := a_type.actual_parameters
			if l_actual_parameters.is_empty then
					-- Do not print empty brackets, but keep the comments if any.
				comment_finder.find_comments (l_actual_parameters, comment_list)
			else
				print_space
				l_actual_parameters.process (Current)
			end
		end

	process_hexadecimal_integer_constant (a_constant: ET_HEXADECIMAL_INTEGER_CONSTANT) is
			-- Process `a_constant'.
		local
			l_cast_type: ET_TARGET_TYPE
			l_sign: ET_SYMBOL
			l_type: ET_TYPE
		do
			l_cast_type := a_constant.cast_type
			if l_cast_type /= Void then
					-- The AST may or may not contain the braces.
					-- So we have to print them explicitly here.
				l_type := l_cast_type.type
				tokens.left_brace_symbol.process (Current)
				l_type.type.process (Current)
				tokens.right_brace_symbol.process (Current)
				comment_finder.add_excluded_node (l_type)
				comment_finder.find_comments (l_cast_type, comment_list)
				comment_finder.reset_excluded_nodes
				print_space
			end
			l_sign := a_constant.sign
			if l_sign /= Void then
				l_sign.process (Current)
			end
			print_string (a_constant.literal)
			process_break (a_constant.break)
		end

	process_if_instruction (an_instruction: ET_IF_INSTRUCTION) is
			-- Process `an_instruction'.
		local
			l_compound: ET_COMPOUND
			l_conditional: ET_CONDITIONAL
			l_expression: ET_EXPRESSION
			l_elseif_parts: ET_ELSEIF_PART_LIST
		do
			tokens.if_keyword.process (Current)
			print_space
			l_conditional := an_instruction.conditional
			l_expression := l_conditional.expression
			l_expression.process (Current)
			comment_finder.add_excluded_node (l_expression)
			comment_finder.find_comments (l_conditional, comment_list)
			comment_finder.reset_excluded_nodes
			print_space
			l_compound := an_instruction.then_compound
			if l_compound /= Void then
				l_compound.process (Current)
			else
				tokens.then_keyword.process (Current)
			end
			l_elseif_parts := an_instruction.elseif_parts
			if l_elseif_parts /= Void then
				process_comments
				print_new_line
				l_elseif_parts.process (Current)
			end
			l_compound := an_instruction.else_compound
			if l_compound /= Void then
				process_comments
				print_new_line
				l_compound.process (Current)
			end
			process_comments
			print_new_line
			an_instruction.end_keyword.process (Current)
		end

	process_indexing_list (a_list: ET_INDEXING_LIST) is
			-- Process `a_list'.
		local
			i, nb: INTEGER
			l_item: ET_INDEXING_ITEM
			l_indexing: ET_INDEXING
			l_tagged_indexing: ET_TAGGED_INDEXING
		do
			if a_list.is_empty then
					-- Do not print empty indexing, but keep the comments if any.
				comment_finder.find_comments (a_list, comment_list)
			else
				a_list.indexing_keyword.process (Current)
				indent
				process_comments
				print_new_line
				nb := a_list.count
				from i := 1 until i > nb loop
					process_comments
					print_new_line
					l_item := a_list.item (i)
					l_indexing := l_item.indexing_clause
					l_tagged_indexing ?= l_indexing
					if l_tagged_indexing /= Void and then STRING_.same_string (l_tagged_indexing.tag.identifier.lower_name, "description") then
						process_tagged_indexing_indented (l_tagged_indexing)
						print_new_line
					else
						l_indexing.process (Current)
					end
					comment_finder.add_excluded_node (l_indexing)
					comment_finder.find_comments (l_item, comment_list)
					comment_finder.reset_excluded_nodes
					i := i + 1
				end
				dedent
			end
		end

	process_indexing_term_list (a_list: ET_INDEXING_TERM_LIST) is
			-- Process `a_list'.
		local
			i, nb: INTEGER
			l_item: ET_INDEXING_TERM_ITEM
			l_indexing_term: ET_INDEXING_TERM
		do
			nb := a_list.count
			from i := 1 until i > nb loop
				l_item := a_list.item (i)
				l_indexing_term := l_item.indexing_term
				l_indexing_term.process (Current)
				comment_finder.add_excluded_node (l_indexing_term)
				comment_finder.find_comments (l_item, comment_list)
				comment_finder.reset_excluded_nodes
				if i /= nb then
						-- The AST may or may not contain the comma.
						-- So we have to print it explicitly here.
					tokens.comma_symbol.process (Current)
					print_space
				end
				i := i + 1
			end
		end

	process_infix_and_then_operator (an_operator: ET_INFIX_AND_THEN_OPERATOR) is
			-- Process `an_operator'.
		do
			an_operator.and_keyword.process (Current)
			print_space
			an_operator.then_keyword.process (Current)
		end

	process_infix_expression (an_expression: ET_INFIX_EXPRESSION) is
			-- Process `an_expression'.
		do
			an_expression.left.process (Current)
			print_space
			an_expression.name.process (Current)
			print_space
			an_expression.right.process (Current)
		end

	process_infix_name (a_name: ET_INFIX_NAME) is
			-- Process `a_name'.
		do
			a_name.infix_keyword.process (Current)
			print_space
			a_name.operator_name.process (Current)
		end

	process_infix_or_else_operator (an_operator: ET_INFIX_OR_ELSE_OPERATOR) is
			-- Process `an_operator'.
		do
			an_operator.or_keyword.process (Current)
			print_space
			an_operator.else_keyword.process (Current)
		end

	process_inspect_instruction (an_instruction: ET_INSPECT_INSTRUCTION) is
			-- Process `an_instruction'.
		local
			l_conditional: ET_CONDITIONAL
			l_expression: ET_EXPRESSION
			l_when_parts: ET_WHEN_PART_LIST
			l_else_compound: ET_COMPOUND
		do
			tokens.inspect_keyword.process (Current)
			print_space
			l_conditional := an_instruction.conditional
			l_expression := l_conditional.expression
			l_expression.process (Current)
			comment_finder.add_excluded_node (l_expression)
			comment_finder.find_comments (l_conditional, comment_list)
			comment_finder.reset_excluded_nodes
			process_comments
			print_new_line
			l_when_parts := an_instruction.when_parts
			if l_when_parts /= Void then
				l_when_parts.process (Current)
				process_comments
				if not l_when_parts.is_empty then
					print_new_line
				end
			end
			l_else_compound := an_instruction.else_compound
			if l_else_compound /= Void then
				l_else_compound.process (Current)
				process_comments
				print_new_line
			end
			process_comments
			an_instruction.end_keyword.process (Current)
		end

	process_invariants (a_list: ET_INVARIANTS) is
			-- Process `a_list'.
		local
			l_break: ET_BREAK
			l_has_comment_assertion: BOOLEAN
		do
			l_break := a_list.break
			l_has_comment_assertion := l_break /= Void and then l_break.has_comment
			if a_list.is_empty and not l_has_comment_assertion then
					-- Do not print empty invariants, but keep the comments if any.
					-- Note that a comment is considered as an assertion here,
					-- and the invariant is not considered empty in that case.
				comment_finder.find_comments (a_list, comment_list)
			else
				a_list.invariant_keyword.process (Current)
				print_new_line
				print_new_line
				if a_list.is_empty then
						-- Print any comments with only one extra indentation level.
					process_comments
				else
					indent
					process_comments
					process_assertions (a_list)
					process_comments
					dedent
				end
			end
		end

	process_keyword_expression (an_expression: ET_KEYWORD_EXPRESSION) is
			-- Process `an_expression'.
		do
			an_expression.keyword.process (Current)
			print_space
			an_expression.expression.process (Current)
		end

	process_keyword_feature_name_list (a_list: ET_KEYWORD_FEATURE_NAME_LIST) is
			-- Process `a_list'.
		local
			i, nb: INTEGER
			l_item: ET_FEATURE_NAME_ITEM
			l_feature_name: ET_FEATURE_NAME
		do
			a_list.keyword.process (Current)
			indent
			nb := a_list.count
			from i := 1 until i > nb loop
				process_comments
				print_new_line
				l_item := a_list.item (i)
				l_feature_name := l_item.feature_name
				l_feature_name.process (Current)
				comment_finder.add_excluded_node (l_feature_name)
				comment_finder.find_comments (l_item, comment_list)
				comment_finder.reset_excluded_nodes
				if i /= nb then
						-- The AST may or may not contain the comma.
						-- So we have to print it explicitly here.
					tokens.comma_symbol.process (Current)
				end
				i := i + 1
			end
			dedent
		end

	process_keyword_manifest_string (a_string: ET_KEYWORD_MANIFEST_STRING) is
			-- Process `a_string'.
		do
			a_string.keyword.process (Current)
			print_space
			a_string.manifest_string.process (Current)
		end

	process_labeled_actual_parameter (a_parameter: ET_LABELED_ACTUAL_PARAMETER) is
			-- Process `a_parameter'.
		local
			l_name_item: ET_LABEL
			l_name: ET_IDENTIFIER
			l_declared_type: ET_DECLARED_TYPE
			l_type: ET_TYPE
		do
			l_name_item := a_parameter.label_item
			l_name := l_name_item.identifier
			l_name.process (Current)
			comment_finder.add_excluded_node (l_name)
			comment_finder.find_comments (l_name_item, comment_list)
			comment_finder.reset_excluded_nodes
				-- The AST may or may not contain the colon.
				-- So we have to print it explicitly here.
			l_declared_type := a_parameter.declared_type
			l_type := l_declared_type.type
			tokens.colon_symbol.process (Current)
			comment_finder.add_excluded_node (l_type)
			comment_finder.find_comments (l_declared_type, comment_list)
			comment_finder.reset_excluded_nodes
			print_space
			l_type.process (Current)
		end

	process_labeled_comma_actual_parameter (a_parameter: ET_LABELED_COMMA_ACTUAL_PARAMETER) is
			-- Process `a_parameter'.
		local
			l_name_item: ET_LABEL
			l_name: ET_IDENTIFIER
		do
			l_name_item := a_parameter.label_item
			l_name := l_name_item.identifier
			l_name.process (Current)
			comment_finder.add_excluded_node (l_name)
			comment_finder.find_comments (l_name_item, comment_list)
			comment_finder.reset_excluded_nodes
				-- The AST may or may not contain the comma.
				-- So we have to print it explicitly here.
			tokens.comma_symbol.process (Current)
		end

	process_like_current (a_type: ET_LIKE_CURRENT) is
			-- Process `a_type'.
		local
			l_type_mark: ET_TYPE_MARK
		do
			l_type_mark := a_type.type_mark
			if l_type_mark /= Void then
				l_type_mark.process (Current)
				if l_type_mark.is_keyword then
					print_space
				end
			end
			a_type.like_keyword.process (Current)
			print_space
			a_type.current_keyword.process (Current)
		end

	process_like_feature (a_type: ET_LIKE_FEATURE) is
			-- Process `a_type'.
		local
			l_type_mark: ET_TYPE_MARK
		do
			l_type_mark := a_type.type_mark
			if l_type_mark /= Void then
				l_type_mark.process (Current)
				if l_type_mark.is_keyword then
					print_space
				end
			end
			a_type.like_keyword.process (Current)
			print_space
			a_type.name.process (Current)
		end

	process_local_comma_variable (a_local: ET_LOCAL_COMMA_VARIABLE) is
			-- Process `a_local'.
		local
			l_name_item: ET_LOCAL_NAME
			l_name: ET_IDENTIFIER
		do
			l_name_item := a_local.name_item
			l_name := l_name_item.identifier
			l_name.process (Current)
			comment_finder.add_excluded_node (l_name)
			comment_finder.find_comments (l_name_item, comment_list)
			comment_finder.reset_excluded_nodes
				-- The AST may or may not contain the comma.
				-- So we have to print it explicitly here.
			tokens.comma_symbol.process (Current)
		end

	process_local_variable (a_local: ET_LOCAL_VARIABLE) is
			-- Process `a_local'.
		local
			l_name_item: ET_LOCAL_NAME
			l_name: ET_IDENTIFIER
			l_declared_type: ET_DECLARED_TYPE
			l_type: ET_TYPE
		do
			l_name_item := a_local.name_item
			l_name := l_name_item.identifier
			l_name.process (Current)
			comment_finder.add_excluded_node (l_name)
			comment_finder.find_comments (l_name_item, comment_list)
			comment_finder.reset_excluded_nodes
				-- The AST may or may not contain the colon.
				-- So we have to print it explicitly here.
			l_declared_type := a_local.declared_type
			l_type := l_declared_type.type
			tokens.colon_symbol.process (Current)
			comment_finder.add_excluded_node (l_type)
			comment_finder.find_comments (l_declared_type, comment_list)
			comment_finder.reset_excluded_nodes
			print_space
			l_type.process (Current)
		end

	process_local_variable_list (a_list: ET_LOCAL_VARIABLE_LIST) is
			-- Process `a_list'.
		local
			i, nb: INTEGER
			l_item: ET_LOCAL_VARIABLE_ITEM
			l_name: ET_IDENTIFIER
			l_type: ET_TYPE
		do
			a_list.local_keyword.process (Current)
			print_new_line
			indent
			process_comments
			nb := a_list.count
			from i := 1 until i > nb loop
				l_item := a_list.item (i)
				l_name := l_item.name
				l_name.process (Current)
				if l_item.is_last_entity or i = nb then
					tokens.colon_symbol.process (Current)
					print_space
					l_type := l_item.type
					l_type.process (Current)
					comment_finder.add_excluded_node (l_name)
					comment_finder.add_excluded_node (l_type)
					comment_finder.find_comments (l_item, comment_list)
					comment_finder.reset_excluded_nodes
					if i /= nb then
						print_new_line
						process_comments
					end
				else
					comment_finder.add_excluded_node (l_name)
					comment_finder.find_comments (l_item, comment_list)
					comment_finder.reset_excluded_nodes
						-- The AST may or may not contain the comma.
						-- So we have to print it explicitly here.
					tokens.comma_symbol.process (Current)
					print_space
				end
				i := i + 1
			end
			process_comments
			dedent
		end

	process_loop_instruction (an_instruction: ET_LOOP_INSTRUCTION) is
			-- Process `an_instruction'.
		local
			an_invariant_part: ET_LOOP_INVARIANTS
			a_variant_part: ET_VARIANT
			a_compound: ET_COMPOUND
			l_conditional: ET_CONDITIONAL
			l_expression: ET_EXPRESSION
		do
			a_compound := an_instruction.from_compound
			if a_compound /= Void then
				a_compound.process (Current)
			else
				tokens.from_keyword.process (Current)
			end
			print_new_line
			process_comments
			an_invariant_part := an_instruction.invariant_part
			if an_invariant_part /= Void then
				an_invariant_part.process (Current)
				print_new_line
				process_comments
			end
			a_variant_part := an_instruction.variant_part
			if a_variant_part /= Void and an_instruction.has_old_variant_syntax then
				a_variant_part.process (Current)
				print_new_line
				process_comments
			end
			tokens.until_keyword.process (Current)
			print_new_line
			indent
			process_comments
			l_conditional := an_instruction.until_conditional
			l_expression := l_conditional.expression
			l_expression.process (Current)
			comment_finder.add_excluded_node (l_expression)
			comment_finder.find_comments (l_conditional, comment_list)
			comment_finder.reset_excluded_nodes
			print_new_line
			process_comments
			dedent
			a_compound := an_instruction.loop_compound
			if a_compound /= Void then
				a_compound.process (Current)
			else
				tokens.loop_keyword.process (Current)
			end
			print_new_line
			process_comments
			if a_variant_part /= Void and not an_instruction.has_old_variant_syntax then
				a_variant_part.process (Current)
				print_new_line
				process_comments
			end
			an_instruction.end_keyword.process (Current)
		end

	process_loop_invariants (a_list: ET_LOOP_INVARIANTS) is
			-- Process `a_list'.
		local
			l_break: ET_BREAK
			l_has_comment_assertion: BOOLEAN
		do
			l_break := a_list.break
			l_has_comment_assertion := l_break /= Void and then l_break.has_comment
			if a_list.is_empty and not l_has_comment_assertion then
					-- Do not print empty invariants, but keep the comments if any.
					-- Note that a comment is considered as an assertion here,
					-- and the invariant is not considered empty in that case.
				comment_finder.find_comments (a_list, comment_list)
			else
				a_list.invariant_keyword.process (Current)
				print_new_line
				if a_list.is_empty then
						-- Print any comments with only one extra indentation level.
					process_comments
				else
					indent
					process_comments
					process_assertions (a_list)
					process_comments
					dedent
				end
			end
		end

	process_manifest_array (an_expression: ET_MANIFEST_ARRAY) is
			-- Process `an_expression'.
		local
			i, nb: INTEGER
			l_item: ET_EXPRESSION_ITEM
			l_expression: ET_EXPRESSION
		do
			an_expression.left_symbol.process (Current)
			nb := an_expression.count
			from i := 1 until i > nb loop
				l_item := an_expression.item (i)
				l_expression := l_item.expression
				l_expression.process (Current)
				comment_finder.add_excluded_node (l_expression)
				comment_finder.find_comments (l_item, comment_list)
				comment_finder.reset_excluded_nodes
				if i /= nb then
						-- The AST may or may not contain the comma.
						-- So we have to print it explicitly here.
					tokens.comma_symbol.process (Current)
					print_space
				end
				i := i + 1
			end
			an_expression.right_symbol.process (Current)
		end

	process_manifest_string_list (a_list: ET_MANIFEST_STRING_LIST) is
			-- Process `a_list'.
		local
			i, nb: INTEGER
			l_item: ET_MANIFEST_STRING_ITEM
			l_manifest_string: ET_MANIFEST_STRING
		do
			a_list.left_parenthesis.process (Current)
			nb := a_list.count
			from i := 1 until i > nb loop
				l_item := a_list.item (i)
				l_manifest_string := l_item.manifest_string
				l_manifest_string.process (Current)
				comment_finder.add_excluded_node (l_manifest_string)
				comment_finder.find_comments (l_item, comment_list)
				comment_finder.reset_excluded_nodes
				if i /= nb then
						-- The AST may or may not contain the comma.
						-- So we have to print it explicitly here.
					tokens.comma_symbol.process (Current)
					print_space
				end
				i := i + 1
			end
			a_list.right_parenthesis.process (Current)
		end

	process_manifest_tuple (an_expression: ET_MANIFEST_TUPLE) is
			-- Process `an_expression'.
		local
			i, nb: INTEGER
			l_item: ET_EXPRESSION_ITEM
			l_expression: ET_EXPRESSION
		do
			an_expression.left_symbol.process (Current)
			nb := an_expression.count
			from i := 1 until i > nb loop
				l_item := an_expression.item (i)
				l_expression := l_item.expression
				l_expression.process (Current)
				comment_finder.add_excluded_node (l_expression)
				comment_finder.find_comments (l_item, comment_list)
				comment_finder.reset_excluded_nodes
				if i /= nb then
						-- The AST may or may not contain the comma.
						-- So we have to print it explicitly here.
					tokens.comma_symbol.process (Current)
					print_space
				end
				i := i + 1
			end
			an_expression.right_symbol.process (Current)
		end

	process_object_equality_expression (an_expression: ET_OBJECT_EQUALITY_EXPRESSION) is
			-- Process `an_expression'.
		do
			an_expression.left.process (Current)
			print_space
			an_expression.operator.process (Current)
			print_space
			an_expression.right.process (Current)
		end

	process_object_test (an_expression: ET_OBJECT_TEST) is
			-- Process `an_expression'.
		do
			an_expression.left_brace.process (Current)
			an_expression.name.process (Current)
			an_expression.colon.process (Current)
			print_space
			an_expression.type.process (Current)
			an_expression.right_brace.process (Current)
			print_space
			an_expression.expression.process (Current)
		end

	process_old_expression (an_expression: ET_OLD_EXPRESSION) is
			-- Process `an_expression'.
		do
			an_expression.old_keyword.process (Current)
			print_space
			an_expression.expression.process (Current)
		end

	process_once_function (a_feature: ET_ONCE_FUNCTION) is
			-- Process `a_feature'.
		local
			l_frozen_keyword: ET_TOKEN
			l_extended_feature_name: ET_EXTENDED_FEATURE_NAME
			l_feature_name: ET_FEATURE_NAME
			l_alias_name: ET_ALIAS_NAME
			l_declared_type: ET_DECLARED_TYPE
			l_type: ET_TYPE
			l_synonym: ET_FEATURE
			l_arguments: ET_FORMAL_ARGUMENT_LIST
			l_indexing: ET_INDEXING_LIST
			l_obsolete_message: ET_OBSOLETE
			l_preconditions: ET_PRECONDITIONS
			l_postconditions: ET_POSTCONDITIONS
			l_semicolon: ET_SEMICOLON_SYMBOL
			l_is_keyword: ET_KEYWORD
			l_assigner: ET_ASSIGNER
			l_obsolete_string: ET_MANIFEST_STRING
			l_locals: ET_LOCAL_VARIABLE_LIST
			l_compound: ET_COMPOUND
		do
			from
				l_synonym := a_feature
			until
				l_synonym = Void
			loop
				l_frozen_keyword := l_synonym.frozen_keyword
				if l_frozen_keyword /= Void then
					l_frozen_keyword.process (Current)
					print_space
				end
				l_extended_feature_name := l_synonym.extended_name
				l_feature_name := l_extended_feature_name.feature_name
				l_alias_name := l_extended_feature_name.alias_name
				l_feature_name.process (Current)
				if l_alias_name /= Void and not ANY_.same_objects (l_alias_name, l_feature_name) then
						-- For infix and prefix features, do not repeat the name twice.
					print_space
					l_alias_name.process (Current)
					comment_finder.add_excluded_node (l_alias_name)
				end
				comment_finder.add_excluded_node (l_feature_name)
				comment_finder.find_comments (l_extended_feature_name, comment_list)
				comment_finder.reset_excluded_nodes
				l_synonym := l_synonym.synonym
				if l_synonym /= Void then
						-- The AST may or may not contain the comma.
						-- So we have to print it explicitly here.
					tokens.comma_symbol.process (Current)
					print_space
				end
			end
			l_arguments := a_feature.arguments
			if l_arguments /= Void then
				if l_arguments.is_empty then
						-- Do not print empty parentheses, but keep the comments if any.
					comment_finder.find_comments (l_arguments, comment_list)
				else
					print_space
					l_arguments.process (Current)
				end
			end
				-- The AST may or may not contain the colon.
				-- So we have to print it explicitly here.
			l_declared_type := a_feature.declared_type
			l_type := l_declared_type.type
			tokens.colon_symbol.process (Current)
			comment_finder.add_excluded_node (l_type)
			comment_finder.find_comments (l_declared_type, comment_list)
			comment_finder.reset_excluded_nodes
			print_space
			l_type.process (Current)
			l_assigner := a_feature.assigner
			if l_assigner /= Void then
				print_space
				l_assigner.process (Current)
			end
			print_space
			tokens.is_keyword.process (Current)
			l_is_keyword := a_feature.is_keyword
			if l_is_keyword /= Void then
				process_break (l_is_keyword.break)
			end
			indent
			process_comments
			print_new_line
			l_indexing := a_feature.first_indexing
			if l_indexing /= Void then
				l_indexing.process (Current)
				process_comments
				print_new_line
			end
			l_obsolete_message := a_feature.obsolete_message
			if l_obsolete_message /= Void then
				tokens.obsolete_keyword.process (Current)
				l_obsolete_string := l_obsolete_message.manifest_string
				comment_finder.add_excluded_node (l_obsolete_string)
				comment_finder.find_comments (l_obsolete_message, comment_list)
				comment_finder.reset_excluded_nodes
				indent
				process_comments
				print_new_line
				l_obsolete_string.process (Current)
				process_comments
				print_new_line
				dedent
			end
			l_preconditions := a_feature.preconditions
			if l_preconditions /= Void then
				l_preconditions.process (Current)
				process_comments
				print_new_line
			end
			l_locals := a_feature.locals
			if l_locals /= Void then
				l_locals.process (Current)
				process_comments
				print_new_line
			end
			l_compound := a_feature.compound
			if l_compound /= Void then
				l_compound.process (Current)
			else
				tokens.once_keyword.process (Current)
			end
			process_comments
			print_new_line
			l_postconditions := a_feature.postconditions
			if l_postconditions /= Void then
				l_postconditions.process (Current)
				process_comments
				print_new_line
			end
			l_compound := a_feature.rescue_clause
			if l_compound /= Void then
				l_compound.process (Current)
				process_comments
				print_new_line
			end
			a_feature.end_keyword.process (Current)
			l_semicolon := a_feature.semicolon
			if l_semicolon /= Void then
					-- Do not print the semicolon, but keep track of its comments if any.
				process_break (l_semicolon.break)
			end
			dedent
		end

	process_once_function_inline_agent (an_expression: ET_ONCE_FUNCTION_INLINE_AGENT) is
			-- Process `an_expression'.
		local
			l_formal_arguments: ET_FORMAL_ARGUMENT_LIST
			l_actual_arguments: ET_AGENT_ARGUMENT_OPERAND_LIST
			l_preconditions: ET_PRECONDITIONS
			l_locals: ET_LOCAL_VARIABLE_LIST
			l_postconditions: ET_POSTCONDITIONS
			l_compound: ET_COMPOUND
			l_declared_type: ET_DECLARED_TYPE
			l_type: ET_TYPE
		do
			an_expression.agent_keyword.process (Current)
			print_space
			l_formal_arguments := an_expression.formal_arguments
			if l_formal_arguments /= Void then
				if l_formal_arguments.is_empty then
						-- Do not print empty parentheses, but keep the comments if any.
					comment_finder.find_comments (l_formal_arguments, comment_list)
				else
					l_formal_arguments.process (Current)
				end
			end
				-- The AST may or may not contain the colon.
				-- So we have to print it explicitly here.
			l_declared_type := an_expression.declared_type
			l_type := l_declared_type.type
			tokens.colon_symbol.process (Current)
			comment_finder.add_excluded_node (l_type)
			comment_finder.find_comments (l_declared_type, comment_list)
			comment_finder.reset_excluded_nodes
			print_space
			l_type.process (Current)
			process_comments
			print_new_line
			l_preconditions := an_expression.preconditions
			if l_preconditions /= Void then
				l_preconditions.process (Current)
				process_comments
				print_new_line
			end
			l_locals := an_expression.locals
			if l_locals /= Void then
				l_locals.process (Current)
				process_comments
				print_new_line
			end
			l_compound := an_expression.compound
			if l_compound /= Void then
				l_compound.process (Current)
			else
				tokens.once_keyword.process (Current)
			end
			process_comments
			print_new_line
			l_postconditions := an_expression.postconditions
			if l_postconditions /= Void then
				l_postconditions.process (Current)
				process_comments
				print_new_line
			end
			l_compound := an_expression.rescue_clause
			if l_compound /= Void then
				l_compound.process (Current)
				process_comments
				print_new_line
			end
			an_expression.end_keyword.process (Current)
			l_actual_arguments ?= an_expression.actual_arguments
			if l_actual_arguments /= Void then
					-- Do not print implicit argument operands (they were not in the original class text anyway).
				if l_actual_arguments.is_empty then
						-- Do not print empty parentheses, but keep the comments if any.
					comment_finder.find_comments (l_actual_arguments, comment_list)
				else
					print_space
					l_actual_arguments.process (Current)
				end
			end
		end

	process_once_manifest_string (an_expression: ET_ONCE_MANIFEST_STRING) is
			-- Process `an_expression'.
		do
			an_expression.once_keyword.process (Current)
			print_space
			an_expression.manifest_string.process (Current)
		end

	process_once_procedure (a_feature: ET_ONCE_PROCEDURE) is
			-- Process `a_feature'.
		local
			l_frozen_keyword: ET_TOKEN
			l_extended_feature_name: ET_EXTENDED_FEATURE_NAME
			l_feature_name: ET_FEATURE_NAME
			l_alias_name: ET_ALIAS_NAME
			l_synonym: ET_FEATURE
			l_arguments: ET_FORMAL_ARGUMENT_LIST
			l_indexing: ET_INDEXING_LIST
			l_obsolete_message: ET_OBSOLETE
			l_preconditions: ET_PRECONDITIONS
			l_postconditions: ET_POSTCONDITIONS
			l_semicolon: ET_SEMICOLON_SYMBOL
			l_is_keyword: ET_KEYWORD
			l_obsolete_string: ET_MANIFEST_STRING
			l_locals: ET_LOCAL_VARIABLE_LIST
			l_compound: ET_COMPOUND
		do
			from
				l_synonym := a_feature
			until
				l_synonym = Void
			loop
				l_frozen_keyword := l_synonym.frozen_keyword
				if l_frozen_keyword /= Void then
					l_frozen_keyword.process (Current)
					print_space
				end
				l_extended_feature_name := l_synonym.extended_name
				l_feature_name := l_extended_feature_name.feature_name
				l_alias_name := l_extended_feature_name.alias_name
				l_feature_name.process (Current)
				if l_alias_name /= Void and not ANY_.same_objects (l_alias_name, l_feature_name) then
						-- For infix and prefix features, do not repeat the name twice.
					print_space
					l_alias_name.process (Current)
					comment_finder.add_excluded_node (l_alias_name)
				end
				comment_finder.add_excluded_node (l_feature_name)
				comment_finder.find_comments (l_extended_feature_name, comment_list)
				comment_finder.reset_excluded_nodes
				l_synonym := l_synonym.synonym
				if l_synonym /= Void then
						-- The AST may or may not contain the comma.
						-- So we have to print it explicitly here.
					tokens.comma_symbol.process (Current)
					print_space
				end
			end
			l_arguments := a_feature.arguments
			if l_arguments /= Void then
				if l_arguments.is_empty then
						-- Do not print empty parentheses, but keep the comments if any.
					comment_finder.find_comments (l_arguments, comment_list)
				else
					print_space
					l_arguments.process (Current)
				end
			end
			print_space
			tokens.is_keyword.process (Current)
			l_is_keyword := a_feature.is_keyword
			if l_is_keyword /= Void then
				process_break (l_is_keyword.break)
			end
			indent
			process_comments
			print_new_line
			l_indexing := a_feature.first_indexing
			if l_indexing /= Void then
				l_indexing.process (Current)
				process_comments
				print_new_line
			end
			l_obsolete_message := a_feature.obsolete_message
			if l_obsolete_message /= Void then
				tokens.obsolete_keyword.process (Current)
				l_obsolete_string := l_obsolete_message.manifest_string
				comment_finder.add_excluded_node (l_obsolete_string)
				comment_finder.find_comments (l_obsolete_message, comment_list)
				comment_finder.reset_excluded_nodes
				indent
				process_comments
				print_new_line
				l_obsolete_string.process (Current)
				process_comments
				print_new_line
				dedent
			end
			l_preconditions := a_feature.preconditions
			if l_preconditions /= Void then
				l_preconditions.process (Current)
				process_comments
				print_new_line
			end
			l_locals := a_feature.locals
			if l_locals /= Void then
				l_locals.process (Current)
				process_comments
				print_new_line
			end
			l_compound := a_feature.compound
			if l_compound /= Void then
				l_compound.process (Current)
			else
				tokens.once_keyword.process (Current)
			end
			process_comments
			print_new_line
			l_postconditions := a_feature.postconditions
			if l_postconditions /= Void then
				l_postconditions.process (Current)
				process_comments
				print_new_line
			end
			l_compound := a_feature.rescue_clause
			if l_compound /= Void then
				l_compound.process (Current)
				process_comments
				print_new_line
			end
			a_feature.end_keyword.process (Current)
			l_semicolon := a_feature.semicolon
			if l_semicolon /= Void then
					-- Do not print the semicolon, but keep track of its comments if any.
				process_break (l_semicolon.break)
			end
			dedent
		end

	process_once_procedure_inline_agent (an_expression: ET_ONCE_PROCEDURE_INLINE_AGENT) is
			-- Process `an_expression'.
		local
			l_formal_arguments: ET_FORMAL_ARGUMENT_LIST
			l_actual_arguments: ET_AGENT_ARGUMENT_OPERAND_LIST
			l_preconditions: ET_PRECONDITIONS
			l_locals: ET_LOCAL_VARIABLE_LIST
			l_postconditions: ET_POSTCONDITIONS
			l_compound: ET_COMPOUND
		do
			an_expression.agent_keyword.process (Current)
			l_formal_arguments := an_expression.formal_arguments
			if l_formal_arguments /= Void then
				if l_formal_arguments.is_empty then
						-- Do not print empty parentheses, but keep the comments if any.
					comment_finder.find_comments (l_formal_arguments, comment_list)
				else
					print_space
					l_formal_arguments.process (Current)
				end
			end
			process_comments
			print_new_line
			l_preconditions := an_expression.preconditions
			if l_preconditions /= Void then
				l_preconditions.process (Current)
				process_comments
				print_new_line
			end
			l_locals := an_expression.locals
			if l_locals /= Void then
				l_locals.process (Current)
				process_comments
				print_new_line
			end
			l_compound := an_expression.compound
			if l_compound /= Void then
				l_compound.process (Current)
			else
				tokens.once_keyword.process (Current)
			end
			process_comments
			print_new_line
			l_postconditions := an_expression.postconditions
			if l_postconditions /= Void then
				l_postconditions.process (Current)
				process_comments
				print_new_line
			end
			l_compound := an_expression.rescue_clause
			if l_compound /= Void then
				l_compound.process (Current)
				process_comments
				print_new_line
			end
			an_expression.end_keyword.process (Current)
			l_actual_arguments ?= an_expression.actual_arguments
			if l_actual_arguments /= Void then
					-- Do not print implicit argument operands (they were not in the original class text anyway).
				if l_actual_arguments.is_empty then
						-- Do not print empty parentheses, but keep the comments if any.
					comment_finder.find_comments (l_actual_arguments, comment_list)
				else
					print_space
					l_actual_arguments.process (Current)
				end
			end
		end

	process_parent (a_parent: ET_PARENT) is
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
			indent
			a_renames := a_parent.renames
			an_exports := a_parent.exports
			an_undefines := a_parent.undefines
			a_redefines := a_parent.redefines
			a_selects := a_parent.selects
			an_end_keyword := a_parent.end_keyword
			if a_renames = Void and an_undefines = Void and a_redefines = Void and a_selects = Void then
				if an_exports = Void then
						-- Do not print the 'end' keyword if any.
					if an_end_keyword /= Void then
						comment_finder.find_comments (an_end_keyword, comment_list)
					end
					process_comments
				elseif an_exports.is_none_all then
						-- Print everything on the same line.
					print_new_line
					process_comments
					process_export_list_same_line (an_exports)
					if an_end_keyword /= Void then
						print_space
						an_end_keyword.process (Current)
					end
				else
					print_new_line
					process_comments
					an_exports.process (Current)
					if an_end_keyword /= Void then
						print_new_line
						process_comments
						an_end_keyword.process (Current)
					end
				end
			else
				if a_renames /= Void then
					print_new_line
					process_comments
					a_renames.process (Current)
				end
				if an_exports /= Void then
					print_new_line
					process_comments
					an_exports.process (Current)
				end
				if an_undefines /= Void then
					print_new_line
					process_comments
					an_undefines.process (Current)
				end
				if a_redefines /= Void then
					print_new_line
					process_comments
					a_redefines.process (Current)
				end
				if a_selects /= Void then
					print_new_line
					process_comments
					a_selects.process (Current)
				end
				if an_end_keyword /= Void then
					print_new_line
					process_comments
					an_end_keyword.process (Current)
				end
			end
			dedent
		end

	process_parent_list (a_list: ET_PARENT_LIST) is
			-- Process `a_list'.
		local
			i, nb: INTEGER
			l_item: ET_PARENT_ITEM
			l_parent: ET_PARENT
		do
			a_list.inherit_keyword.process (Current)
			print_new_line
			print_new_line
			indent
			process_comments
			nb := a_list.count
			from i := 1 until i > nb loop
				l_item := a_list.item (i)
				l_parent := l_item.parent
				l_parent.process (Current)
				comment_finder.add_excluded_node (l_parent)
				comment_finder.find_comments (l_item, comment_list)
				comment_finder.reset_excluded_nodes
				if i /= nb then
					process_comments
					print_new_line
					print_new_line
				end
				i := i + 1
			end
			process_comments
			dedent
		end

	process_postconditions (a_list: ET_POSTCONDITIONS) is
			-- Process `a_list'.
		local
			a_then_keyword: ET_TOKEN
			l_break: ET_BREAK
			l_has_comment_assertion: BOOLEAN
		do
			l_break := a_list.break
			l_has_comment_assertion := l_break /= Void and then l_break.has_comment
			if a_list.is_empty and not l_has_comment_assertion then
					-- Do not print empty postconditions, but keep the comments if any.
					-- Note that a comment is considered as an assertion here,
					-- and the postcondition is not considered empty in that case.
				comment_finder.find_comments (a_list, comment_list)
			else
				a_list.ensure_keyword.process (Current)
				a_then_keyword := a_list.then_keyword
				if a_then_keyword /= Void then
					print_space
					a_then_keyword.process (Current)
				end
				print_new_line
				if a_list.is_empty then
						-- Print any comments with only one extra indentation level.
					process_comments
				else
					indent
					process_comments
					process_assertions (a_list)
					process_comments
					dedent
				end
			end
		end

	process_preconditions (a_list: ET_PRECONDITIONS) is
			-- Process `a_list'.
		local
			an_else_keyword: ET_TOKEN
			l_break: ET_BREAK
			l_has_comment_assertion: BOOLEAN
		do
			l_break := a_list.break
			l_has_comment_assertion := l_break /= Void and then l_break.has_comment
			if a_list.is_empty and not l_has_comment_assertion then
					-- Do not print empty preconditions, but keep the comments if any.
					-- Note that a comment is considered as an assertion here,
					-- and the precondition is not considered empty in that case.
				comment_finder.find_comments (a_list, comment_list)
			else
				a_list.require_keyword.process (Current)
				an_else_keyword := a_list.else_keyword
				if an_else_keyword /= Void then
					print_space
					an_else_keyword.process (Current)
				end
				print_new_line
				if a_list.is_empty then
						-- Print any comments with only one extra indentation level.
					process_comments
				else
					indent
					process_comments
					process_assertions (a_list)
					process_comments
					dedent
				end
			end
		end

	process_precursor_expression (an_expression: ET_PRECURSOR_EXPRESSION) is
			-- Process `an_expression'.
		local
			l_parent_name: ET_PRECURSOR_CLASS_NAME
			l_class_name: ET_CLASS_NAME
			l_arguments: ET_ACTUAL_ARGUMENT_LIST
		do
			an_expression.precursor_keyword.process (Current)
			l_parent_name := an_expression.parent_name
			if l_parent_name /= Void then
				print_space
				tokens.left_brace_symbol.process (Current)
				l_class_name := l_parent_name.class_name
				l_class_name.process (Current)
				comment_finder.add_excluded_node (l_class_name)
				comment_finder.find_comments (l_parent_name, comment_list)
				comment_finder.reset_excluded_nodes
				tokens.right_brace_symbol.process (Current)
			end
			l_arguments := an_expression.arguments
			if l_arguments /= Void then
				if l_arguments.is_empty then
						-- Do not print empty parentheses, but keep the comments if any.
					comment_finder.find_comments (l_arguments, comment_list)
				else
					print_space
					l_arguments.process (Current)
				end
			end
		end

	process_precursor_instruction (an_instruction: ET_PRECURSOR_INSTRUCTION) is
			-- Process `an_instruction'.
		local
			l_parent_name: ET_PRECURSOR_CLASS_NAME
			l_class_name: ET_CLASS_NAME
			l_arguments: ET_ACTUAL_ARGUMENT_LIST
		do
			an_instruction.precursor_keyword.process (Current)
			l_parent_name := an_instruction.parent_name
			if l_parent_name /= Void then
				print_space
				tokens.left_brace_symbol.process (Current)
				l_class_name := l_parent_name.class_name
				l_class_name.process (Current)
				comment_finder.add_excluded_node (l_class_name)
				comment_finder.find_comments (l_parent_name, comment_list)
				comment_finder.reset_excluded_nodes
				tokens.right_brace_symbol.process (Current)
			end
			l_arguments := an_instruction.arguments
			if l_arguments /= Void then
				if l_arguments.is_empty then
						-- Do not print empty parentheses, but keep the comments if any.
					comment_finder.find_comments (l_arguments, comment_list)
				else
					print_space
					l_arguments.process (Current)
				end
			end
		end

	process_prefix_expression (an_expression: ET_PREFIX_EXPRESSION) is
			-- Process `an_expression'.
		local
			l_operator: ET_OPERATOR
			l_expression: ET_EXPRESSION
		do
			l_operator := an_expression.name
			l_expression := an_expression.expression
			l_operator.process (Current)
			if l_operator.is_prefix_minus or l_operator.is_prefix_plus then
				if l_expression.is_prefix_expression then
					print_space
				end
			else
				print_space
			end
			an_expression.expression.process (Current)
		end

	process_prefix_name (a_name: ET_PREFIX_NAME) is
			-- Process `a_name'.
		do
			a_name.prefix_keyword.process (Current)
			print_space
			a_name.operator_name.process (Current)
		end

	process_qualified_call (a_call: ET_QUALIFIED_CALL) is
			-- Process `a_call'.
		local
			l_arguments: ET_ACTUAL_ARGUMENT_LIST
			l_qualified_feature_name: ET_QUALIFIED_FEATURE_NAME
			l_feature_name: ET_FEATURE_NAME
		do
				-- The AST may or may not contain the dot.
				-- So we have to print them explicitly here.
			tokens.dot_symbol.process (Current)
			l_qualified_feature_name := a_call.qualified_name
			l_feature_name := l_qualified_feature_name.feature_name
			l_feature_name.process (Current)
			comment_finder.add_excluded_node (l_feature_name)
			comment_finder.find_comments (l_qualified_feature_name, comment_list)
			comment_finder.reset_excluded_nodes
			l_arguments := a_call.arguments
			if l_arguments /= Void then
				if l_arguments.is_empty then
						-- Do not print empty parentheses, but keep the comments if any.
					comment_finder.find_comments (l_arguments, comment_list)
				else
					print_space
					l_arguments.process (Current)
				end
			end
		end

	process_qualified_like_braced_type (a_type: ET_QUALIFIED_LIKE_BRACED_TYPE) is
			-- Process `a_type'.
		local
			l_braced_type: ET_TARGET_TYPE
			l_target_type: ET_TYPE
			l_qualified_feature_name: ET_QUALIFIED_FEATURE_NAME
			l_feature_name: ET_FEATURE_NAME
		do
			a_type.like_keyword.process (Current)
			print_space
			l_braced_type := a_type.braced_type
			l_target_type := l_braced_type.type
			tokens.left_brace_symbol.process (Current)
			l_target_type.process (Current)
			tokens.right_brace_symbol.process (Current)
			comment_finder.add_excluded_node (l_target_type)
			comment_finder.find_comments (l_braced_type, comment_list)
			comment_finder.reset_excluded_nodes
				-- The AST may or may not contain the dot.
				-- So we have to print them explicitly here.
			tokens.dot_symbol.process (Current)
			l_qualified_feature_name := a_type.qualified_name
			l_feature_name := l_qualified_feature_name.feature_name
			l_feature_name.process (Current)
			comment_finder.add_excluded_node (l_feature_name)
			comment_finder.find_comments (l_qualified_feature_name, comment_list)
			comment_finder.reset_excluded_nodes
		end

	process_qualified_like_type (a_type: ET_QUALIFIED_LIKE_TYPE) is
			-- Process `a_type'.
		local
			l_qualified_feature_name: ET_QUALIFIED_FEATURE_NAME
			l_feature_name: ET_FEATURE_NAME
		do
			a_type.target_type.process (Current)
				-- The AST may or may not contain the dot.
				-- So we have to print them explicitly here.
			tokens.dot_symbol.process (Current)
			l_qualified_feature_name := a_type.qualified_name
			l_feature_name := l_qualified_feature_name.feature_name
			l_feature_name.process (Current)
			comment_finder.add_excluded_node (l_feature_name)
			comment_finder.find_comments (l_qualified_feature_name, comment_list)
			comment_finder.reset_excluded_nodes
		end

	process_regular_integer_constant (a_constant: ET_REGULAR_INTEGER_CONSTANT) is
			-- Process `a_constant'.
		local
			l_cast_type: ET_TARGET_TYPE
			l_sign: ET_SYMBOL
			l_type: ET_TYPE
		do
			l_cast_type := a_constant.cast_type
			if l_cast_type /= Void then
					-- The AST may or may not contain the braces.
					-- So we have to print them explicitly here.
				l_type := l_cast_type.type
				tokens.left_brace_symbol.process (Current)
				l_type.type.process (Current)
				tokens.right_brace_symbol.process (Current)
				comment_finder.add_excluded_node (l_type)
				comment_finder.find_comments (l_cast_type, comment_list)
				comment_finder.reset_excluded_nodes
				print_space
			end
			l_sign := a_constant.sign
			if l_sign /= Void then
				l_sign.process (Current)
			end
			print_string (a_constant.literal)
			process_break (a_constant.break)
		end

	process_regular_manifest_string (a_string: ET_REGULAR_MANIFEST_STRING) is
			-- Process `a_string'.
		local
			l_cast_type: ET_TARGET_TYPE
			l_type: ET_TYPE
		do
			l_cast_type := a_string.cast_type
			if l_cast_type /= Void then
					-- The AST may or may not contain the braces.
					-- So we have to print them explicitly here.
				l_type := l_cast_type.type
				tokens.left_brace_symbol.process (Current)
				l_type.type.process (Current)
				tokens.right_brace_symbol.process (Current)
				comment_finder.add_excluded_node (l_type)
				comment_finder.find_comments (l_cast_type, comment_list)
				comment_finder.reset_excluded_nodes
				print_space
			end
			print_character ('%"')
			print_string (a_string.literal)
			print_character ('%"')
			process_break (a_string.break)
		end

	process_regular_real_constant (a_constant: ET_REGULAR_REAL_CONSTANT) is
			-- Process `a_constant'.
		local
			l_cast_type: ET_TARGET_TYPE
			l_sign: ET_SYMBOL
			l_type: ET_TYPE
		do
			l_cast_type := a_constant.cast_type
			if l_cast_type /= Void then
					-- The AST may or may not contain the braces.
					-- So we have to print them explicitly here.
				l_type := l_cast_type.type
				tokens.left_brace_symbol.process (Current)
				l_type.type.process (Current)
				tokens.right_brace_symbol.process (Current)
				comment_finder.add_excluded_node (l_type)
				comment_finder.find_comments (l_cast_type, comment_list)
				comment_finder.reset_excluded_nodes
				print_space
			end
			l_sign := a_constant.sign
			if l_sign /= Void then
				l_sign.process (Current)
			end
			print_string (a_constant.literal)
			process_break (a_constant.break)
		end

	process_rename (a_rename: ET_RENAME) is
			-- Process `a_rename'.
		do
			a_rename.old_name.process (Current)
			print_space
			a_rename.as_keyword.process (Current)
			print_space
			a_rename.new_name.process (Current)
		end

	process_rename_list (a_list: ET_RENAME_LIST) is
			-- Process `a_list'.
		local
			i, nb: INTEGER
			l_item: ET_RENAME_ITEM
			l_rename: ET_RENAME
		do
			a_list.rename_keyword.process (Current)
			indent
			nb := a_list.count
			from i := 1 until i > nb loop
				process_comments
				print_new_line
				l_item := a_list.item (i)
				l_rename := l_item.rename_pair
				process_rename (l_rename)
				comment_finder.add_excluded_node (l_rename.old_name)
				comment_finder.add_excluded_node (l_rename.as_keyword)
				comment_finder.add_excluded_node (l_rename.new_name)
				comment_finder.find_comments (l_item, comment_list)
				comment_finder.reset_excluded_nodes
				if i /= nb then
						-- The AST may or may not contain the comma.
						-- So we have to print it explicitly here.
					tokens.comma_symbol.process (Current)
				end
				i := i + 1
			end
			dedent
		end

	process_result (an_expression: ET_RESULT) is
			-- Process `an_expression'.
		do
			process_keyword (tokens.result_keyword)
			comment_finder.find_comments (an_expression, comment_list)
		end

	process_result_address (an_expression: ET_RESULT_ADDRESS) is
			-- Process `an_expression'.
		do
			tokens.dollar_symbol.process (Current)
			tokens.result_keyword.process (Current)
			comment_finder.find_comments (an_expression, comment_list)
		end

	process_retry_instruction (an_instruction: ET_RETRY_INSTRUCTION) is
			-- Process `an_instruction'.
		do
			process_keyword (tokens.retry_keyword)
			comment_finder.find_comments (an_instruction, comment_list)
		end

	process_semicolon_symbol (a_symbol: ET_SEMICOLON_SYMBOL) is
			-- Process `a_symbol'.
		do
			process_symbol (tokens.semicolon_symbol)
			comment_finder.find_comments (a_symbol, comment_list)
		end

	process_special_manifest_string (a_string: ET_SPECIAL_MANIFEST_STRING) is
			-- Process `a_string'.
		local
			l_cast_type: ET_TARGET_TYPE
			l_type: ET_TYPE
		do
			l_cast_type := a_string.cast_type
			if l_cast_type /= Void then
					-- The AST may or may not contain the braces.
					-- So we have to print them explicitly here.
				l_type := l_cast_type.type
				tokens.left_brace_symbol.process (Current)
				l_type.type.process (Current)
				tokens.right_brace_symbol.process (Current)
				comment_finder.add_excluded_node (l_type)
				comment_finder.find_comments (l_cast_type, comment_list)
				comment_finder.reset_excluded_nodes
				print_space
			end
			print_character ('%"')
			print_string (a_string.literal)
			print_character ('%"')
			process_break (a_string.break)
		end

	process_static_call_expression (an_expression: ET_STATIC_CALL_EXPRESSION) is
			-- Process `an_expression'.
		local
			l_static_type: ET_TARGET_TYPE
			l_type: ET_TYPE
			l_feature_keyword: ET_KEYWORD
		do
			l_feature_keyword := an_expression.feature_keyword
			if l_feature_keyword /= Void then
				comment_finder.find_comments (l_feature_keyword, comment_list)
			end
			l_static_type := an_expression.static_type
			l_type := l_static_type.type
			tokens.left_brace_symbol.process (Current)
			l_type.process (Current)
			tokens.right_brace_symbol.process (Current)
			comment_finder.add_excluded_node (l_type)
			comment_finder.find_comments (l_static_type, comment_list)
			comment_finder.reset_excluded_nodes
			process_qualified_call (an_expression)
		end

	process_static_call_instruction (an_instruction: ET_STATIC_CALL_INSTRUCTION) is
			-- Process `an_instruction'.
		local
			l_static_type: ET_TARGET_TYPE
			l_type: ET_TYPE
			l_feature_keyword: ET_KEYWORD
		do
			l_feature_keyword := an_instruction.feature_keyword
			if l_feature_keyword /= Void then
				comment_finder.find_comments (l_feature_keyword, comment_list)
			end
			l_static_type := an_instruction.static_type
			l_type := l_static_type.type
			tokens.left_brace_symbol.process (Current)
			l_type.process (Current)
			tokens.right_brace_symbol.process (Current)
			comment_finder.add_excluded_node (l_type)
			comment_finder.find_comments (l_static_type, comment_list)
			comment_finder.reset_excluded_nodes
			process_qualified_call (an_instruction)
		end

	process_strip_expression (an_expression: ET_STRIP_EXPRESSION) is
			-- Process `an_expression'.
		local
			i, nb: INTEGER
			l_item: ET_FEATURE_NAME_ITEM
			l_feature_name: ET_FEATURE_NAME
		do
			an_expression.strip_keyword.process (Current)
			print_space
			an_expression.left_parenthesis.process (Current)
			nb := an_expression.count
			from i := 1 until i > nb loop
				l_item := an_expression.item (i)
				l_feature_name := l_item.feature_name
				l_feature_name.process (Current)
				comment_finder.add_excluded_node (l_feature_name)
				comment_finder.find_comments (l_item, comment_list)
				comment_finder.reset_excluded_nodes
				if i /= nb then
						-- The AST may or may not contain the comma.
						-- So we have to print it explicitly here.
					tokens.comma_symbol.process (Current)
					print_space
				end
				i := i + 1
			end
			an_expression.right_parenthesis.process (Current)
		end

	process_symbol (a_symbol: ET_SYMBOL) is
			-- Process `a_symbol'.
		do
			print_string (a_symbol.text)
			process_break (a_symbol.break)
		end

	process_tagged_assertion (an_assertion: ET_TAGGED_ASSERTION) is
			-- Process `an_assertion'.
		local
			l_tag: ET_TAG
			l_identifier: ET_IDENTIFIER
			l_expression: ET_EXPRESSION
		do
			l_tag := an_assertion.tag
			l_identifier := l_tag.identifier
			l_identifier.process (Current)
			comment_finder.add_excluded_node (l_identifier)
			comment_finder.find_comments (l_tag, comment_list)
			comment_finder.reset_excluded_nodes
				-- The AST may or may not contain the colon.
				-- So we have to print it explicitly here.
			tokens.colon_symbol.process (Current)
			l_expression := an_assertion.expression
			if l_expression /= Void then
				print_space
				l_expression.process (Current)
			end
		end

	process_tagged_indexing (an_indexing: ET_TAGGED_INDEXING) is
			-- Process `an_indexing'.
		local
			l_tag: ET_TAG
			l_identifier: ET_IDENTIFIER
		do
			l_tag := an_indexing.tag
			l_identifier := l_tag.identifier
			l_identifier.process (Current)
			comment_finder.add_excluded_node (l_identifier)
			comment_finder.find_comments (l_tag, comment_list)
			comment_finder.reset_excluded_nodes
				-- The AST may or may not contain the colon.
				-- So we have to print it explicitly here.
			tokens.colon_symbol.process (Current)
			print_space
			process_indexing (an_indexing)
		end

	process_tagged_indexing_indented (an_indexing: ET_TAGGED_INDEXING) is
			-- Process `an_indexing'.
			-- Print the tag, then the indexing terms indented two lines below.
		require
			an_indexing_not_void: an_indexing /= Void
		local
			l_tag: ET_TAG
			l_identifier: ET_IDENTIFIER
			l_terms: ET_INDEXING_TERM_LIST
			l_verbatim_string: ET_VERBATIM_STRING
		do
			l_tag := an_indexing.tag
			l_identifier := l_tag.identifier
			l_identifier.process (Current)
			comment_finder.add_excluded_node (l_identifier)
			comment_finder.find_comments (l_tag, comment_list)
			comment_finder.reset_excluded_nodes
				-- The AST may or may not contain the colon.
				-- So we have to print it explicitly here.
			tokens.colon_symbol.process (Current)
			l_terms := an_indexing.terms
			if l_terms.count = 1 then
				l_verbatim_string ?= l_terms.first.indexing_term
			end
			if l_verbatim_string /= Void then
				print_new_line
				process_indexing (an_indexing)
					-- We make as if a comment was printed so that
					-- a subsequent call to `print_new_line' in
					-- `process_indexing_list' will not print anything.
				comment_printed := True
			else
				print_new_line
				print_new_line
				indent
				process_indexing (an_indexing)
				dedent
			end
		end

	process_token (a_token: ET_TOKEN) is
			-- Process `a_token'.
		do
			print_string (a_token.text)
			process_break (a_token.break)
		end

	process_true_constant (a_constant: ET_TRUE_CONSTANT) is
			-- Process `a_constant'.
		do
			process_keyword (tokens.true_keyword)
			comment_finder.find_comments (a_constant, comment_list)
		end

	process_tuple_type (a_type: ET_TUPLE_TYPE) is
			-- Process `a_type'.
		local
			l_actual_parameters: ET_ACTUAL_PARAMETER_LIST
			l_type_mark: ET_TYPE_MARK
		do
			l_type_mark := a_type.type_mark
			if l_type_mark /= Void then
				l_type_mark.process (Current)
				if l_type_mark.is_keyword then
					print_space
				end
			end
			process_token (tokens.tuple_keyword)
			comment_finder.find_comments (a_type.tuple_keyword, comment_list)
			l_actual_parameters := a_type.actual_parameters
			if l_actual_parameters = Void then
				-- Do nothing/
			elseif l_actual_parameters.is_empty then
					-- Do not print empty brackets, but keep the comments if any.
				comment_finder.find_comments (l_actual_parameters, comment_list)
			else
				print_space
				l_actual_parameters.process (Current)
			end
		end

	process_underscored_integer_constant (a_constant: ET_UNDERSCORED_INTEGER_CONSTANT) is
			-- Process `a_constant'.
		local
			a_sign: ET_SYMBOL
			a_type: ET_TARGET_TYPE
		do
			a_type := a_constant.cast_type
			if a_type /= Void then
				a_type.process (Current)
			end
			a_sign := a_constant.sign
			if a_sign /= Void then
				a_sign.process (Current)
			end
			file.put_string (a_constant.literal)
			process_break (a_constant.break)
		end

	process_underscored_real_constant (a_constant: ET_UNDERSCORED_REAL_CONSTANT) is
			-- Process `a_constant'.
		local
			a_sign: ET_SYMBOL
			a_type: ET_TARGET_TYPE
		do
			a_type := a_constant.cast_type
			if a_type /= Void then
				a_type.process (Current)
			end
			a_sign := a_constant.sign
			if a_sign /= Void then
				a_sign.process (Current)
			end
			file.put_string (a_constant.literal)
			process_break (a_constant.break)
		end

	process_unique_attribute (a_feature: ET_UNIQUE_ATTRIBUTE) is
			-- Process `a_feature'.
		local
			l_frozen_keyword: ET_TOKEN
			l_synonym: ET_FEATURE
			l_semicolon: ET_SEMICOLON_SYMBOL
			l_assigner: ET_ASSIGNER
			l_extended_feature_name: ET_EXTENDED_FEATURE_NAME
			l_feature_name: ET_FEATURE_NAME
			l_alias_name: ET_ALIAS_NAME
			l_declared_type: ET_DECLARED_TYPE
			l_type: ET_TYPE
		do
			from
				l_synonym := a_feature
			until
				l_synonym = Void
			loop
				l_frozen_keyword := l_synonym.frozen_keyword
				if l_frozen_keyword /= Void then
					l_frozen_keyword.process (Current)
					print_space
				end
				l_extended_feature_name := l_synonym.extended_name
				l_feature_name := l_extended_feature_name.feature_name
				l_alias_name := l_extended_feature_name.alias_name
				l_feature_name.process (Current)
				if l_alias_name /= Void and not ANY_.same_objects (l_alias_name, l_feature_name) then
						-- For infix and prefix features, do not repeat the name twice.
					print_space
					l_alias_name.process (Current)
					comment_finder.add_excluded_node (l_alias_name)
				end
				comment_finder.add_excluded_node (l_feature_name)
				comment_finder.find_comments (l_extended_feature_name, comment_list)
				comment_finder.reset_excluded_nodes
				l_synonym := l_synonym.synonym
				if l_synonym /= Void then
						-- The AST may or may not contain the comma.
						-- So we have to print it explicitly here.
					tokens.comma_symbol.process (Current)
					print_space
				end
			end
				-- The AST may or may not contain the colon.
				-- So we have to print it explicitly here.
			l_declared_type := a_feature.declared_type
			l_type := l_declared_type.type
			tokens.colon_symbol.process (Current)
			comment_finder.add_excluded_node (l_type)
			comment_finder.find_comments (l_declared_type, comment_list)
			comment_finder.reset_excluded_nodes
			print_space
			l_type.process (Current)
			print_space
			l_assigner := a_feature.assigner
			if l_assigner /= Void then
				l_assigner.process (Current)
				print_space
			end
			tokens.is_keyword.process (Current)
			process_break (a_feature.is_keyword.break)
			print_space
			tokens.unique_keyword.process (Current)
			process_break (a_feature.unique_keyword.break)
			l_semicolon := a_feature.semicolon
			if l_semicolon /= Void then
					-- Do not print the semicolon, but keep track of its comments if any.
				process_break (l_semicolon.break)
			end
				-- Print header comment.
			indent
			process_comments
			dedent
		end

	process_variant (a_variant: ET_VARIANT) is
			-- Process `a_variant'.
		local
			l_tag: ET_TAG
			l_identifier: ET_IDENTIFIER
			l_expression: ET_EXPRESSION
		do
			a_variant.variant_keyword.process (Current)
			indent
			print_new_line
			process_comments
			l_tag := a_variant.tag
			l_expression := a_variant.expression
			if l_tag /= Void then
				l_identifier := l_tag.identifier
				l_identifier.process (Current)
				comment_finder.add_excluded_node (l_identifier)
				comment_finder.find_comments (l_tag, comment_list)
				comment_finder.reset_excluded_nodes
					-- The AST may or may not contain the colon.
					-- So we have to print it explicitly here.
				tokens.colon_symbol.process (Current)
				if l_expression /= Void then
					print_space
				end
			end
			if l_expression /= Void then
				l_expression.process (Current)
			end
			process_comments
			dedent
		end

	process_verbatim_string (a_string: ET_VERBATIM_STRING) is
			-- Process `a_string'.
		local
			l_cast_type: ET_TARGET_TYPE
			l_type: ET_TYPE
		do
			l_cast_type := a_string.cast_type
			if l_cast_type /= Void then
					-- The AST may or may not contain the braces.
					-- So we have to print them explicitly here.
				l_type := l_cast_type.type
				tokens.left_brace_symbol.process (Current)
				l_type.type.process (Current)
				tokens.right_brace_symbol.process (Current)
				comment_finder.add_excluded_node (l_type)
				comment_finder.find_comments (l_cast_type, comment_list)
				comment_finder.reset_excluded_nodes
				print_space
			end
			print_character ('%"')
			print_string (a_string.marker)
			if a_string.is_left_aligned then
				print_character ('[')
			else
				print_character ('{')
			end
			print_string (a_string.open_white_characters)
			print_string (a_string.literal)
			print_string (a_string.close_white_characters)
			if a_string.is_left_aligned then
				print_character (']')
			else
				print_character ('}')
			end
			print_string (a_string.marker)
			print_character ('%"')
			process_break (a_string.break)
		end

	process_void (an_expression: ET_VOID) is
			-- Process `an_expression'.
		do
			process_keyword (tokens.void_keyword)
			comment_finder.find_comments (an_expression, comment_list)
		end

	process_when_part (a_when_part: ET_WHEN_PART) is
			-- Process `a_when_part'.
		local
			a_compound: ET_COMPOUND
		do
			a_when_part.choices.process (Current)
			print_space
			a_compound := a_when_part.then_compound
			if a_compound /= Void then
				a_compound.process (Current)
			else
				tokens.then_keyword.process (Current)
			end
		end

	process_when_part_list (a_list: ET_WHEN_PART_LIST) is
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.item (i).process (Current)
				if i /= nb then
					print_new_line
					process_comments
				end
				i := i + 1
			end
		end

feature {NONE} -- Printing

	print_character (c: CHARACTER) is
			-- Print character `c'.
			-- Print indentation first if not done yet.
		do
			if not indentation_printed then
				print_indentation
			end
			file.put_character (c)
			comment_printed := False
		end

	print_space is
			-- Print space character, unless a comment had just been printed.
		do
			if not comment_printed then
				print_character (' ')
			end
			comment_printed := False
		end

	print_string (s: STRING) is
			-- Print string `s'.
			-- Print indentation first if not done yet.
		require
			s_not_void: s /= Void
		do
			if not indentation_printed then
				print_indentation
			end
			file.put_string (s)
			comment_printed := False
		end

	print_new_line is
			-- Print new-line character unless a comment had just been printed.
		do
			if not comment_printed then
				file.put_new_line
				indentation_printed := False
			end
			comment_printed := False
		end

feature {NONE} -- Indentation

	print_indentation is
			-- Print indentation to `file'.
		local
			i, nb: INTEGER
		do
			nb := indentation
			from i := 1 until i > nb loop
				file.put_character ('%T')
				i := i + 1
			end
			indentation_printed := True
			comment_printed := False
		end

	indentation_printed: BOOLEAN
			-- Has indentation already been printed on the current line?

feature {NONE} -- Comments

	print_comment (a_break: ET_BREAK) is
			-- Print comment held in `a_break', followed by a new-line.
		require
			a_break_not_void: a_break /= Void
			a_break_has_comment: a_break.has_comment
		local
			l_comment: STRING
			i, nb: INTEGER
			c: CHARACTER
			l_in_comment: BOOLEAN
			l_in_comment_marker: BOOLEAN
			l_dash_number: INTEGER
			l_old_indentation: INTEGER
		do
			comment_printed := False
			l_comment := a_break.text
			nb := l_comment.count
			from i := 1 until i > nb loop
				c := l_comment.item (i)
				inspect c
				when ' ', '%T', '%R' then
					if l_in_comment_marker then
						l_in_comment_marker := False
						print_string ("--")
					end
					if l_in_comment then
						print_character (c)
					end
				when '%N' then
					if l_in_comment_marker then
						l_in_comment_marker := False
						print_string ("--")
					end
					if l_in_comment then
						print_new_line
						l_in_comment := False
					end
				when '-' then
					if l_in_comment_marker then
						l_dash_number := l_dash_number + 1
						if l_dash_number = 3 then
							l_in_comment_marker := False
								-- Print comment unindented when there are 3 dashes.
							l_old_indentation := indentation
							indentation := 0
							print_string ("---")
							indentation := l_old_indentation
						end
					elseif not l_in_comment then
						l_in_comment := True
						l_in_comment_marker := True
						l_dash_number := 1
					else
						l_in_comment := True
						print_character (c)
					end
				else
					if l_in_comment_marker then
						l_in_comment_marker := False
						print_string ("--")
					end
					l_in_comment := True
					print_character (c)
				end
				i := i + 1
			end
			if l_in_comment then
					-- There was no new-line at the end of the comment
					-- (probably because it appeared at the end of the file).
					-- But in the header comment we promised to write one.
				print_new_line
			end
			comment_printed := True
		end

	print_indented_comment (a_break: ET_BREAK) is
			-- Print comment held in `a_break' on its own line (go to next
			-- line if necessary), with an extra indentation level.
			-- Comments are followed by a new-line.
		require
			a_break_not_void: a_break /= Void
			a_break_has_comment: a_break.has_comment
		do
			if indentation_printed then
					-- We already printed something on this line.
					-- Move to the next line.
				print_new_line
			end
			indent
			if comment_printed then
				print_indentation
				file.put_string ("--")
				file.put_new_line
			end
			print_comment (a_break)
			dedent
		end

	print_indented_comments (a_comments: DS_ARRAYED_LIST [ET_BREAK]) is
			-- Print each comment in `a_comments' on their own line (go to
			-- next line if necessary), with an extra indentation level.
			-- Comments are followed by a new-line.
		require
			a_comments_not_void: a_comments /= Void
			no_void_comment: not a_comments.has (Void)
			all_comments: a_comments.for_all (agent {ET_BREAK}.has_comment)
		do
			a_comments.do_all (agent print_indented_comment)
		end

	print_comments_on_same_line (a_comments: DS_ARRAYED_LIST [ET_BREAK]) is
			-- If `a_comments' is not empty, then print a space followed by
			-- the first comment on the current line. The remaining comments
			-- are printed on their own line, with an extra indentation level.
			-- Comments are followed by a new-line.
		require
			a_comments_not_void: a_comments /= Void
			no_void_comment: not a_comments.has (Void)
			all_comments: a_comments.for_all (agent {ET_BREAK}.has_comment)
		local
			i, nb: INTEGER
		do
			nb := a_comments.count
			if nb > 0 then
				if indentation_printed then
						-- We are not at the beginning of the line.
					print_space
				end
				indent
				print_comment (a_comments.first)
				dedent
				from i := 2 until i > nb loop
					print_indented_comment (a_comments.item (i))
					i := i + 1
				end
			end
		end

	comment_printed: BOOLEAN
			-- Has a comment just been printed?

	comment_list: DS_ARRAYED_LIST [ET_BREAK]
			-- List of comments that have not been printed yet

	comment_finder: ET_COMMENT_FINDER
			-- Comment finder

invariant

	file_not_void: file /= Void
	file_is_open_write: file.is_open_write
	comment_finder_not_void: comment_finder /= Void
	comment_list_not_void: comment_list /= Void
	no_void_comment: not comment_list.has (Void)
	all_comments: comment_list.for_all (agent {ET_BREAK}.has_comment)

end
