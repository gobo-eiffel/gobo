indexing

	description:

		"Eiffel AST pretty printers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_AST_PRETTY_PRINTER

inherit

	ET_AST_PRINTER
		redefine
			make, file,
			process_actual_argument_list,
			process_actual_parameter_comma,
			process_actual_parameter_list,
			process_agent_argument_operand_comma,
			process_agent_argument_operand_list,
			process_agent_open_target,
			process_agent_typed_open_argument,
			process_alias_free_name,
			process_alias_name,
			process_aliased_feature_name,
			process_all_export,
			process_assertion_semicolon,
			process_assign_feature_name,
			process_assigner_instruction,
			process_assignment,
			process_assignment_attempt,
			process_attribute,
			process_bang_instruction,
			process_bit_feature,
			process_bit_n,
			process_braced_class_name,
			process_braced_type,
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
			process_choice_comma,
			process_choice_list,
			process_choice_range,
			process_class,
			process_class_name_comma,
			process_class_type,
			process_clients,
			process_colon_type,
			process_compound,
			process_constant_attribute,
			process_constrained_formal_parameter,
			process_constraint_creator,
			process_convert_expression,
			process_convert_feature_comma,
			process_convert_feature_list,
			process_convert_function,
			process_convert_procedure,
			process_convert_to_expression,
			process_create_expression,
			process_create_instruction,
			process_creator,
			process_creator_list,
			process_current_address,
			process_custom_attribute,
			process_debug_instruction,
			process_deferred_function,
			process_deferred_procedure,
			process_do_function,
			process_do_function_inline_agent,
			process_do_procedure,
			process_do_procedure_inline_agent,
			process_dot_feature_name,
			process_dotnet_function,
			process_dotnet_procedure,
			process_expression_comma,
			process_hexadecimal_integer_constant,
			process_regular_integer_constant,
			process_underscored_integer_constant,
			process_regular_real_constant,
			process_underscored_real_constant,
			process_regular_manifest_string,
			process_special_manifest_string,
			process_verbatim_string,
			process_symbol,
			process_token
		end

	ET_SHARED_TOKEN_CONSTANTS
		export {NONE} all end

create

	make, make_null

feature {NONE} -- Initialization

	make (a_file: like file; a_universe: like universe) is
			-- Create a new AST pretty-printer, using `a_file' as output file.
		do
			precursor (a_file, a_universe)
			create comment_finder.make (a_universe)
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
			-- Comments at the end of node which have not been printed are kept in `comment_list'.
		local
			i, nb: INTEGER
			l_item: ET_EXPRESSION_ITEM
			l_expression: ET_EXPRESSION
		do
			a_list.left_symbol.process (Current)
			process_comments
			nb := a_list.count
			from i := 1 until i > nb loop
				l_item := a_list.item (i)
				l_expression := l_item.expression
				l_expression.process (Current)
				if i /= nb then
						-- The AST may or may not contain the comma.
						-- So we have to print it explicitly here.
					process_comments
					tokens.comma_symbol.process (Current)
					comment_finder.add_excluded_node (l_expression)
					comment_finder.find_comments (l_item, comment_list)
					comment_finder.reset_excluded_nodes
					process_comments
					print_space
				else
					comment_finder.add_excluded_node (l_expression)
					comment_finder.find_comments (l_item, comment_list)
					comment_finder.reset_excluded_nodes
					process_comments
				end
				i := i + 1
			end
			a_list.right_symbol.process (Current)
		end

	process_actual_parameter_comma (a_parameter: ET_ACTUAL_PARAMETER_COMMA) is
			-- Process `a_parameter'.
			-- Comments at the end of node which have not been printed are kept in `comment_list'.
		do
			a_parameter.actual_parameter.process (Current)
			process_comments
			a_parameter.comma.process (Current)
		end

	process_actual_parameter_list (a_list: ET_ACTUAL_PARAMETER_LIST) is
			-- Process `a_list'.
			-- Comments at the end of node which have not been printed are kept in `comment_list'.
		local
			i, nb: INTEGER
			l_item: ET_ACTUAL_PARAMETER_ITEM
			l_unlabeled: BOOLEAN
			l_type: ET_TYPE
			l_label: ET_IDENTIFIER
			l_comment: ET_BREAK
		do
			a_list.left_bracket.process (Current)
			process_comments
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
						process_comments
					end
					l_type := l_item.type
					l_type.process (Current)
					if i /= nb then
							-- The AST may or may not contain the comma.
							-- So we have to print it explicitly here.
						process_comments
						tokens.comma_symbol.process (Current)
						comment_finder.add_excluded_node (l_type)
						comment_finder.find_comments (l_item, comment_list)
						comment_finder.reset_excluded_nodes
						process_comments
						print_space
					else
						comment_finder.add_excluded_node (l_type)
						comment_finder.find_comments (l_item, comment_list)
						comment_finder.reset_excluded_nodes
						process_comments
					end
					i := i + 1
				end
			else
					-- Labeled Tuple actual parameters.
				from i := 1 until i > nb loop
					l_item := a_list.item (i)
					l_label := l_item.label
					l_label.process (Current)
					process_comments
					if l_item.is_last_entity or i = nb then
						tokens.colon_symbol.process (Current)
						print_space
						l_type := l_item.type
						l_type.process (Current)
						if i /= nb then
								-- The AST may or may not contain the semicolon.
								-- So we have to print it explicitly here.
							process_comments
							tokens.semicolon_symbol.process (Current)
							comment_finder.add_excluded_node (l_label)
							comment_finder.add_excluded_node (l_type)
							comment_finder.find_comments (l_item, comment_list)
							comment_finder.reset_excluded_nodes
							process_comments
							print_space
						else
							comment_finder.add_excluded_node (l_label)
							comment_finder.add_excluded_node (l_type)
							comment_finder.find_comments (l_item, comment_list)
							comment_finder.reset_excluded_nodes
							process_comments
						end
					else
							-- The AST may or may not contain the comma.
							-- So we have to print it explicitly here.
						tokens.comma_symbol.process (Current)
						comment_finder.add_excluded_node (l_label)
						comment_finder.find_comments (l_item, comment_list)
						comment_finder.reset_excluded_nodes
						process_comments
						print_space
					end
					i := i + 1
				end
			end
			a_list.right_bracket.process (Current)
		end

	process_agent_argument_operand_comma (an_argument: ET_AGENT_ARGUMENT_OPERAND_COMMA) is
			-- Process `an_argument'.
			-- Comments at the end of node which have not been printed are kept in `comment_list'.
		do
			an_argument.agent_actual_argument.process (Current)
			process_comments
			an_argument.comma.process (Current)
		end

	process_agent_argument_operand_list (a_list: ET_AGENT_ARGUMENT_OPERAND_LIST) is
			-- Process `a_list'.
			-- Comments at the end of node which have not been printed are kept in `comment_list'.
		local
			i, nb: INTEGER
			l_item: ET_AGENT_ARGUMENT_OPERAND_ITEM
			l_argument: ET_AGENT_ARGUMENT_OPERAND
		do
			a_list.left_parenthesis.process (Current)
			process_comments
			nb := a_list.count
			from i := 1 until i > nb loop
				l_item := a_list.item (i)
				l_argument := l_item.agent_actual_argument
				l_argument.process (Current)
				if i /= nb then
						-- The AST may or may not contain the comma.
						-- So we have to print it explicitly here.
					process_comments
					tokens.comma_symbol.process (Current)
					comment_finder.add_excluded_node (l_argument)
					comment_finder.find_comments (l_item, comment_list)
					comment_finder.reset_excluded_nodes
					process_comments
					print_space
				else
					comment_finder.add_excluded_node (l_argument)
					comment_finder.find_comments (l_item, comment_list)
					comment_finder.reset_excluded_nodes
					process_comments
				end
				i := i + 1
			end
			a_list.right_parenthesis.process (Current)
		end

	process_agent_open_target (a_target: ET_AGENT_OPEN_TARGET) is
			-- Process `a_target'.
			-- Comments at the end of node which have not been printed are kept in `comment_list'.
		do
			a_target.left_brace.process (Current)
			process_comments
			a_target.type.process (Current)
			process_comments
			a_target.right_brace.process (Current)
		end

	process_agent_typed_open_argument (an_argument: ET_AGENT_TYPED_OPEN_ARGUMENT) is
			-- Process `an_argument'.
			-- Comments at the end of node which have not been printed are kept in `comment_list'.
		do
			an_argument.left_brace.process (Current)
			process_comments
			an_argument.type.process (Current)
			process_comments
			an_argument.right_brace.process (Current)
			process_comments
			print_space
			an_argument.question_mark.process (Current)
		end

	process_alias_free_name (a_name: ET_ALIAS_FREE_NAME) is
			-- Process `a_name'.
			-- Comments at the end of node which have not been printed are kept in `comment_list'.
		do
			a_name.alias_keyword.process (Current)
			process_comments
			print_space
			a_name.alias_string.process (Current)
		end

	process_alias_name (a_name: ET_ALIAS_NAME) is
			-- Process `a_name'.
			-- Comments at the end of node which have not been printed are kept in `comment_list'.
		do
			a_name.alias_keyword.process (Current)
			process_comments
			print_space
			a_name.alias_string.process (Current)
		end

	process_aliased_feature_name (a_name: ET_ALIASED_FEATURE_NAME) is
			-- Process `a_name'.
			-- Comments at the end of node which have not been printed are kept in `comment_list'.
		do
			a_name.feature_name.process (Current)
			process_comments
			print_space
			a_name.alias_name.process (Current)
		end

	process_all_export (an_export: ET_ALL_EXPORT) is
			-- Process `an_export'.
		do
			an_export.clients_clause.process (Current)
			process_comments
			print_space
			an_export.all_keyword.process (Current)
		end

	process_assertion_semicolon (an_assertion: ET_ASSERTION_SEMICOLON) is
			-- Process `an_assertion'.
			-- Comments at the end of node which have not been printed are kept in `comment_list'.
		do
			an_assertion.assertion.process (Current)
			process_comments
			an_assertion.semicolon.process (Current)
		end

	process_assign_feature_name (an_assigner: ET_ASSIGN_FEATURE_NAME) is
			-- Process `an_assigner'.
			-- Comments at the end of node which have not been printed are kept in `comment_list'.
		do
			an_assigner.assign_keyword.process (Current)
			process_comments
			print_space
			an_assigner.feature_name.process (Current)
		end

	process_assigner_instruction (an_instruction: ET_ASSIGNER_INSTRUCTION) is
			-- Process `an_instruction'.
			-- Comments at the end of node which have not been printed are kept in `comment_list'.
		do
			an_instruction.call.process (Current)
			process_comments
			print_space
			an_instruction.assign_symbol.process (Current)
			process_comments
			print_space
			an_instruction.source.process (Current)
		end

	process_assignment (an_instruction: ET_ASSIGNMENT) is
			-- Process `an_instruction'.
			-- Comments at the end of node which have not been printed are kept in `comment_list'.
		do
			an_instruction.target.process (Current)
			process_comments
			print_space
			an_instruction.assign_symbol.process (Current)
			process_comments
			print_space
			an_instruction.source.process (Current)
		end

	process_assignment_attempt (an_instruction: ET_ASSIGNMENT_ATTEMPT) is
			-- Process `an_instruction'.
			-- Comments at the end of node which have not been printed are kept in `comment_list'.
		do
			an_instruction.target.process (Current)
			process_comments
			print_space
			an_instruction.assign_attempt_symbol.process (Current)
			process_comments
			print_space
			an_instruction.source.process (Current)
		end

	process_attribute (a_feature: ET_ATTRIBUTE) is
			-- Process `a_feature'.
			-- Comments at the end of node which have not been printed are kept in `comment_list'.
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
					process_comments
					print_space
				end
				l_extended_feature_name := l_synonym.extended_name
				l_feature_name := l_extended_feature_name.feature_name
				l_alias_name := l_extended_feature_name.alias_name
				l_synonym := l_synonym.synonym
				l_feature_name.process (Current)
				if l_alias_name /= Void then
					process_comments
					print_space
					l_alias_name.process (Current)
					if l_synonym /= Void then
							-- The AST may or may not contain the comma.
							-- So we have to print it explicitly here.
						process_comments
						tokens.comma_symbol.process (Current)
						comment_finder.add_excluded_node (l_feature_name)
						comment_finder.add_excluded_node (l_alias_name)
						comment_finder.find_comments (l_extended_feature_name, comment_list)
						comment_finder.reset_excluded_nodes
						process_comments
						print_space
					else
						comment_finder.add_excluded_node (l_feature_name)
						comment_finder.add_excluded_node (l_alias_name)
						comment_finder.find_comments (l_extended_feature_name, comment_list)
						comment_finder.reset_excluded_nodes
						process_comments
					end
				else
					if l_synonym /= Void then
							-- The AST may or may not contain the comma.
							-- So we have to print it explicitly here.
						process_comments
						print_space
						tokens.comma_symbol.process (Current)
						comment_finder.add_excluded_node (l_feature_name)
						comment_finder.find_comments (l_extended_feature_name, comment_list)
						comment_finder.reset_excluded_nodes
						process_comments
						print_space
					else
						comment_finder.add_excluded_node (l_feature_name)
						comment_finder.find_comments (l_extended_feature_name, comment_list)
						comment_finder.reset_excluded_nodes
						process_comments
					end
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
			process_comments
			print_space
			l_type.process (Current)
			l_assigner := a_feature.assigner
			if l_assigner /= Void then
				process_comments
				print_space
				l_assigner.process (Current)
			end
			l_semicolon := a_feature.semicolon
			if l_semicolon /= Void then
					-- Do not print the semicolon, but keep track of its comments if any.
				process_break (l_semicolon.break)
			end
		end

	process_bang_instruction (an_instruction: ET_BANG_INSTRUCTION) is
			-- Process `an_instruction'.
			-- Comments at the end of node which have not been printed are kept in `comment_list'.
		local
			l_type: ET_TYPE
			l_call: ET_QUALIFIED_CALL
		do
				-- Use the keyword 'create' even if the original class text was using the old syntax with '!!'.
				-- The following code will try to print the comments at the right place if any, even when
				-- replacing '!!' with 'create'.
			tokens.create_keyword.process (Current)
			l_type := an_instruction.type
			if l_type /= Void then
				print_space
				tokens.left_brace_symbol.process (Current)
				process_break (an_instruction.left_bang.break)
				process_comments
				l_type.process (Current)
				process_comments
				tokens.right_brace_symbol.process (Current)
				process_break (an_instruction.right_bang.break)
				process_comments
			else
				process_break (an_instruction.left_bang.break)
				process_break (an_instruction.right_bang.break)
				process_comments
			end
			print_space
			an_instruction.target.process (Current)
			l_call := an_instruction.creation_call
			if l_call /= Void then
				process_comments
				l_call.process (Current)
			end
		end

	process_bit_feature (a_type: ET_BIT_FEATURE) is
			-- Process `a_type'.
			-- Comments at the end of node which have not been printed are kept in `comment_list'.
		do
			a_type.bit_keyword.process (Current)
			process_comments
			print_space
			a_type.name.process (Current)
		end

	process_bit_n (a_type: ET_BIT_N) is
			-- Process `a_type'.
			-- Comments at the end of node which have not been printed are kept in `comment_list'.
		do
			a_type.bit_keyword.process (Current)
			process_comments
			print_space
			a_type.constant.process (Current)
		end

	process_braced_class_name (a_name: ET_BRACED_CLASS_NAME) is
			-- Process `a_name'.
			-- Comments at the end of node which have not been printed are kept in `comment_list'.
		do
			a_name.left_brace.process (Current)
			process_comments
			a_name.class_name.process (Current)
			process_comments
			a_name.right_brace.process (Current)
		end

	process_braced_type (a_type: ET_BRACED_TYPE) is
			-- Process `a_type'.
			-- Comments at the end of node which have not been printed are kept in `comment_list'.
		do
			a_type.left_brace.process (Current)
			process_comments
			a_type.type.process (Current)
			process_comments
			a_type.right_brace.process (Current)
		end

	process_braced_type_list (a_list: ET_BRACED_TYPE_LIST) is
			-- Process `a_list'.
			-- Comments at the end of node which have not been printed are kept in `comment_list'.
		local
			i, nb: INTEGER
			l_item: ET_TYPE_ITEM
			l_type: ET_TYPE
		do
			a_list.left_brace.process (Current)
			process_comments
			nb := a_list.count
			from i := 1 until i > nb loop
				l_item := a_list.item (i)
				l_type := l_item.type
				l_type.process (Current)
				if i /= nb then
						-- The AST may or may not contain the comma.
						-- So we have to print it explicitly here.
					process_comments
					tokens.comma_symbol.process (Current)
					comment_finder.add_excluded_node (l_type)
					comment_finder.find_comments (l_item, comment_list)
					comment_finder.reset_excluded_nodes
					process_comments
					print_space
				else
					comment_finder.add_excluded_node (l_type)
					comment_finder.find_comments (l_item, comment_list)
					comment_finder.reset_excluded_nodes
					process_comments
				end
				i := i + 1
			end
			a_list.right_brace.process (Current)
		end

	process_bracket_argument_list (a_list: ET_BRACKET_ARGUMENT_LIST) is
			-- Process `a_list'.
			-- Comments at the end of node which have not been printed are kept in `comment_list'.
		local
			i, nb: INTEGER
			l_item: ET_EXPRESSION_ITEM
			l_expression: ET_EXPRESSION
		do
			a_list.left_symbol.process (Current)
			process_comments
			nb := a_list.count
			from i := 1 until i > nb loop
				l_item := a_list.item (i)
				l_expression := l_item.expression
				l_expression.process (Current)
				if i /= nb then
						-- The AST may or may not contain the comma.
						-- So we have to print it explicitly here.
					process_comments
					tokens.comma_symbol.process (Current)
					comment_finder.add_excluded_node (l_expression)
					comment_finder.find_comments (l_item, comment_list)
					comment_finder.reset_excluded_nodes
					process_comments
					print_space
				else
					comment_finder.add_excluded_node (l_expression)
					comment_finder.find_comments (l_item, comment_list)
					comment_finder.reset_excluded_nodes
					process_comments
				end
				i := i + 1
			end
			a_list.right_symbol.process (Current)
		end

	process_bracket_expression (an_expression: ET_BRACKET_EXPRESSION) is
			-- Process `an_expression'.
			-- Comments at the end of node which have not been printed are kept in `comment_list'.
		local
			l_arguments: ET_BRACKET_ARGUMENT_LIST
		do
			an_expression.target.process (Current)
			l_arguments := an_expression.arguments
			if l_arguments /= Void then
				process_comments
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
			-- Comments at the end of node which have not been printed are kept in `comment_list'.
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
				process_comments
				tokens.right_brace_symbol.process (Current)
				comment_finder.add_excluded_node (l_type)
				comment_finder.find_comments (l_cast_type, comment_list)
				comment_finder.reset_excluded_nodes
				process_comments
				print_space
			end
			print_character ('%'')
			print_character (a_constant.value)
			print_character ('%'')
			process_break (a_constant.break)
		end

	process_c2_character_constant (a_constant: ET_C2_CHARACTER_CONSTANT) is
			-- Process `a_constant'.
			-- Comments at the end of node which have not been printed are kept in `comment_list'.
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
				process_comments
				tokens.right_brace_symbol.process (Current)
				comment_finder.add_excluded_node (l_type)
				comment_finder.find_comments (l_cast_type, comment_list)
				comment_finder.reset_excluded_nodes
				process_comments
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
			-- Comments at the end of node which have not been printed are kept in `comment_list'.
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
				process_comments
				tokens.right_brace_symbol.process (Current)
				comment_finder.add_excluded_node (l_type)
				comment_finder.find_comments (l_cast_type, comment_list)
				comment_finder.reset_excluded_nodes
				process_comments
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
			-- Comments at the end of node which have not been printed are kept in `comment_list'.
		local
			l_arguments: ET_AGENT_ARGUMENT_OPERAND_LIST
			l_qualified_feature_name: ET_QUALIFIED_FEATURE_NAME
			l_feature_name: ET_FEATURE_NAME
		do
				-- Use the keyword 'agent' even if the original class text was using the old syntax with '~'.
				-- The following code will try to print the comments at the right place if any, even when
				-- replacing '~' with 'agent'.
			l_qualified_feature_name := an_expression.qualified_name
			l_feature_name := l_qualified_feature_name.feature_name
			tokens.agent_keyword.process (Current)
			if an_expression.is_qualified_call then
				if an_expression.use_tilde then
					print_space
					an_expression.target.process (Current)
					process_comments
						-- The AST may or may not contain the dot.
						-- So we have to print them explicitly here.
					tokens.dot_symbol.process (Current)
					process_break (an_expression.agent_keyword.break)
				else
					process_break (an_expression.agent_keyword.break)
					process_comments
					print_space
					an_expression.target.process (Current)
					process_comments
						-- The AST may or may not contain the dot.
						-- So we have to print them explicitly here.
					tokens.dot_symbol.process (Current)
				end
				comment_finder.add_excluded_node (l_feature_name)
				comment_finder.find_comments (l_qualified_feature_name, comment_list)
				comment_finder.reset_excluded_nodes
				process_comments
			else
					-- No need to print the target for unqualified calls.
				process_break (an_expression.agent_keyword.break)
				comment_finder.add_excluded_node (l_feature_name)
				comment_finder.find_comments (l_qualified_feature_name, comment_list)
				comment_finder.reset_excluded_nodes
				process_comments
				print_space
			end
			l_feature_name.process (Current)
			l_arguments ?= an_expression.arguments
			if l_arguments /= Void then
					-- Do not print implicit argument operands (they were not in the original class text anyway).
				if l_arguments.is_empty then
						-- Do not print empty parentheses, but keep the comments if any.
					comment_finder.find_comments (l_arguments, comment_list)
				else
					process_comments
					print_space
					l_arguments.process (Current)
				end
			end
		end

	process_call_expression (an_expression: ET_CALL_EXPRESSION) is
			-- Process `an_expression'.
			-- Comments at the end of node which have not been printed are kept in `comment_list'.
		local
			l_target: ET_EXPRESSION
			l_arguments: ET_ACTUAL_ARGUMENT_LIST
			l_qualified_feature_name: ET_QUALIFIED_FEATURE_NAME
			l_feature_name: ET_FEATURE_NAME
		do
			l_target := an_expression.target
			l_qualified_feature_name := an_expression.qualified_name
			l_feature_name := l_qualified_feature_name.feature_name
			if l_target /= Void then
				l_target.process (Current)
				process_comments
					-- The AST may or may not contain the dot.
					-- So we have to print them explicitly here.
				tokens.dot_symbol.process (Current)
				comment_finder.add_excluded_node (l_feature_name)
				comment_finder.find_comments (l_qualified_feature_name, comment_list)
				comment_finder.reset_excluded_nodes
				process_comments
				l_feature_name.process (Current)
			else
				l_feature_name.process (Current)
				comment_finder.add_excluded_node (l_feature_name)
				comment_finder.find_comments (l_qualified_feature_name, comment_list)
				comment_finder.reset_excluded_nodes
			end
			l_arguments := an_expression.arguments
			if l_arguments /= Void then
				if l_arguments.is_empty then
						-- Do not print empty parentheses, but keep the comments if any.
					comment_finder.find_comments (l_arguments, comment_list)
				else
					process_comments
					print_space
					l_arguments.process (Current)
				end
			end
		end

	process_call_instruction (an_instruction: ET_CALL_INSTRUCTION) is
			-- Process `an_instruction'.
			-- Comments at the end of node which have not been printed are kept in `comment_list'.
		local
			l_target: ET_EXPRESSION
			l_arguments: ET_ACTUAL_ARGUMENT_LIST
			l_qualified_feature_name: ET_QUALIFIED_FEATURE_NAME
			l_feature_name: ET_FEATURE_NAME
		do
			l_target := an_instruction.target
			l_qualified_feature_name := an_instruction.qualified_name
			l_feature_name := l_qualified_feature_name.feature_name
			if l_target /= Void then
				l_target.process (Current)
				process_comments
					-- The AST may or may not contain the dot.
					-- So we have to print them explicitly here.
				tokens.dot_symbol.process (Current)
				comment_finder.add_excluded_node (l_feature_name)
				comment_finder.find_comments (l_qualified_feature_name, comment_list)
				comment_finder.reset_excluded_nodes
				process_comments
				l_feature_name.process (Current)
			else
				l_feature_name.process (Current)
				comment_finder.add_excluded_node (l_feature_name)
				comment_finder.find_comments (l_qualified_feature_name, comment_list)
				comment_finder.reset_excluded_nodes
			end
			l_arguments := an_instruction.arguments
			if l_arguments /= Void then
				if l_arguments.is_empty then
						-- Do not print empty parentheses, but keep the comments if any.
					comment_finder.find_comments (l_arguments, comment_list)
				else
					process_comments
					print_space
					l_arguments.process (Current)
				end
			end
		end

	process_check_instruction (an_instruction: ET_CHECK_INSTRUCTION) is
			-- Process `an_instruction'.
			-- Comments at the end of node which have not been printed are kept in `comment_list'.
		local
			i, nb: INTEGER
			l_item: ET_ASSERTION_ITEM
			l_assertion: ET_ASSERTION
			l_identifier: ET_IDENTIFIER
			l_symbol: ET_SYMBOL
		do
			an_instruction.check_keyword.process (Current)
			nb := an_instruction.count
			if nb = 0 then
					-- There is no assertion to be printed.
					-- Print any comments with only one extra indentation level.
				process_comments
				print_new_line
			else
				indent
				process_comments
				print_new_line
				from i := 1 until i > nb loop
					l_item := an_instruction.item (i)
					l_assertion := l_item.assertion
						-- Make sure that if this assertion needs to be broken into
						-- several lines (e.g. because of an comment in the middle of
						-- the assertion), then the subsequent lines have an extra
						-- indentation level.
					print_indentation
					indent
					l_assertion.process (Current)
					dedent
					if i /= nb then
						l_identifier ?= l_assertion.last_leaf
						l_symbol ?= an_instruction.item (i + 1).first_leaf
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
							process_comments
							tokens.semicolon_symbol.process (Current)
							comment_finder.add_excluded_node (l_assertion)
							comment_finder.find_comments (l_item, comment_list)
							comment_finder.reset_excluded_nodes
							process_comments
						else
							comment_finder.add_excluded_node (l_assertion)
							comment_finder.find_comments (l_item, comment_list)
							comment_finder.reset_excluded_nodes
							process_comments
						end
					else
						comment_finder.add_excluded_node (l_assertion)
						comment_finder.find_comments (l_item, comment_list)
						comment_finder.reset_excluded_nodes
						process_comments
					end
					print_new_line
					i := i + 1
				end
				dedent
			end
			an_instruction.end_keyword.process (Current)
		end

	process_choice_comma (a_choice: ET_CHOICE_COMMA) is
			-- Process `a_choice'.
			-- Comments at the end of node which have not been printed are kept in `comment_list'.
		do
			a_choice.choice.process (Current)
			process_comments
			a_choice.comma.process (Current)
		end

	process_choice_list (a_list: ET_CHOICE_LIST) is
			-- Process `a_list'.
			-- Comments at the end of node which have not been printed are kept in `comment_list'.
		local
			i, nb: INTEGER
			l_item: ET_CHOICE_ITEM
			l_choice: ET_CHOICE
		do
			a_list.when_keyword.process (Current)
			if not a_list.is_empty then
				process_comments
				print_space
				nb := a_list.count
				from i := 1 until i > nb loop
					l_item := a_list.item (i)
					l_choice := l_item.choice
					l_choice.process (Current)
					if i /= nb then
							-- The AST may or may not contain the comma.
							-- So we have to print it explicitly here.
						process_comments
						tokens.comma_symbol.process (Current)
						comment_finder.add_excluded_node (l_choice)
						comment_finder.find_comments (l_item, comment_list)
						comment_finder.reset_excluded_nodes
						process_comments
						print_space
					else
						comment_finder.add_excluded_node (l_choice)
						comment_finder.find_comments (l_item, comment_list)
						comment_finder.reset_excluded_nodes
						process_comments
					end
					i := i + 1
				end
			end
		end

	process_choice_range (a_choice: ET_CHOICE_RANGE) is
			-- Process `a_choice'.
			-- Comments at the end of node which have not been printed are kept in `comment_list'.
		do
			a_choice.lower.process (Current)
			process_comments
			a_choice.dotdot.process (Current)
			process_comments
			a_choice.upper.process (Current)
		end

	process_class (a_class: ET_CLASS) is
			-- Process `a_class'.
			-- Comments at the end of node which have not been printed are kept in `comment_list'.
		local
			an_indexing: ET_INDEXING_LIST
			a_frozen: ET_KEYWORD
			a_class_mark: ET_KEYWORD
			an_external: ET_KEYWORD
			a_formal_parameters: ET_FORMAL_PARAMETER_LIST
			an_obsolete_message: ET_OBSOLETE
			a_parents: ET_PARENT_LIST
			a_creators: ET_CREATOR_LIST
			a_convert_features: ET_CONVERT_FEATURE_LIST
			an_invariants: ET_INVARIANTS
		do
			process_break (a_class.leading_break)
			process_comments
			an_indexing := a_class.first_indexing
			if an_indexing /= Void then
				an_indexing.process (Current)
				process_comments
				print_new_line
				print_new_line
			end
				-- Make sure that if the class header needs to be broken into
				-- several lines (e.g. because of an comment in the middle of
				-- the class header), then the subsequent lines have an extra
				-- indentation level.
			print_indentation
			indent
			a_frozen := a_class.frozen_keyword
			if a_frozen /= Void then
				a_frozen.process (Current)
				process_comments
				print_space
			end
			a_class_mark := a_class.class_mark
			if a_class_mark /= Void then
				a_class_mark.process (Current)
				process_comments
				print_space
			end
			an_external := a_class.external_keyword
			if an_external /= Void then
				an_external.process (Current)
				process_comments
				print_space
			end
			a_class.class_keyword.process (Current)
			process_comments
			print_space
			a_class.name.process (Current)
			a_formal_parameters := a_class.formal_parameters
			if a_formal_parameters /= Void then
				if a_formal_parameters.is_empty then
						-- Do not print empty brackets, but keep the comments if any.
					comment_finder.find_comments (a_formal_parameters, comment_list)
				else
					process_comments
					print_space
					a_formal_parameters.process (Current)
				end
			end
			dedent
				-- End of class header.
			process_comments
			print_new_line
			print_new_line
			an_obsolete_message := a_class.obsolete_message
			if an_obsolete_message /= Void then
				an_obsolete_message.process (Current)
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
-- TODO: print the comment on the same line as the end keyword.
			process_comments
		end

	process_class_name_comma (a_name: ET_CLASS_NAME_COMMA) is
			-- Process `a_name'.
			-- Comments at the end of node which have not been printed are kept in `comment_list'.
		do
			a_name.class_name.process (Current)
			process_comments
			a_name.comma.process (Current)
		end

	process_class_type (a_type: ET_CLASS_TYPE) is
			-- Process `a_type'.
			-- Comments at the end of node which have not been printed are kept in `comment_list'.
		local
			a_type_mark: ET_KEYWORD
		do
			a_type_mark := a_type.type_mark
			if a_type_mark /= Void then
				a_type_mark.process (Current)
				process_comments
				print_space
			end
			a_type.name.process (Current)
		end

	process_clients (a_list: ET_CLIENTS) is
			-- Process `a_list'.
			-- Comments at the end of node which have not been printed are kept in `comment_list'.
		local
			i, nb: INTEGER
			l_item: ET_CLASS_NAME_ITEM
			l_client: ET_CLASS_NAME
		do
			a_list.left_brace.process (Current)
			process_comments
			nb := a_list.count
			from i := 1 until i > nb loop
				l_item := a_list.item (i)
				l_client := l_item.class_name
				l_client.process (Current)
				if i /= nb then
						-- The AST may or may not contain the comma.
						-- So we have to print it explicitly here.
					process_comments
					tokens.comma_symbol.process (Current)
					comment_finder.add_excluded_node (l_client)
					comment_finder.find_comments (l_item, comment_list)
					comment_finder.reset_excluded_nodes
					process_comments
					print_space
				else
					comment_finder.add_excluded_node (l_client)
					comment_finder.find_comments (l_item, comment_list)
					comment_finder.reset_excluded_nodes
					process_comments
				end
				i := i + 1
			end
			a_list.right_brace.process (Current)
		end

	process_colon_type (a_type: ET_COLON_TYPE) is
			-- Process `a_type'.
			-- Comments at the end of node which have not been printed are kept in `comment_list'.
		do
			a_type.colon.process (Current)
			process_comments
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

	process_compound (a_list: ET_COMPOUND) is
			-- Process `a_list'.
			-- Comments at the end of node which have not been printed are kept in `comment_list'.
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
						-- Make sure that if this instruction needs to be broken into
						-- several lines (e.g. because of an comment in the middle of
						-- the instruction), then the subsequent lines have an extra
						-- indentation level.
					print_indentation
					indent
					l_instruction.process (Current)
					dedent
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
			-- Comments at the end of node which have not been printed are kept in `comment_list'.
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
					process_comments
					print_space
				end
				l_extended_feature_name := l_synonym.extended_name
				l_feature_name := l_extended_feature_name.feature_name
				l_alias_name := l_extended_feature_name.alias_name
				l_synonym := l_synonym.synonym
				l_feature_name.process (Current)
				if l_alias_name /= Void then
					process_comments
					print_space
					l_alias_name.process (Current)
					if l_synonym /= Void then
							-- The AST may or may not contain the comma.
							-- So we have to print it explicitly here.
						process_comments
						tokens.comma_symbol.process (Current)
						comment_finder.add_excluded_node (l_feature_name)
						comment_finder.add_excluded_node (l_alias_name)
						comment_finder.find_comments (l_extended_feature_name, comment_list)
						comment_finder.reset_excluded_nodes
						process_comments
						print_space
					else
						comment_finder.add_excluded_node (l_feature_name)
						comment_finder.add_excluded_node (l_alias_name)
						comment_finder.find_comments (l_extended_feature_name, comment_list)
						comment_finder.reset_excluded_nodes
						process_comments
					end
				else
					if l_synonym /= Void then
							-- The AST may or may not contain the comma.
							-- So we have to print it explicitly here.
						process_comments
						print_space
						tokens.comma_symbol.process (Current)
						comment_finder.add_excluded_node (l_feature_name)
						comment_finder.find_comments (l_extended_feature_name, comment_list)
						comment_finder.reset_excluded_nodes
						process_comments
						print_space
					else
						comment_finder.add_excluded_node (l_feature_name)
						comment_finder.find_comments (l_extended_feature_name, comment_list)
						comment_finder.reset_excluded_nodes
						process_comments
					end
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
			process_comments
			print_space
			l_type.process (Current)
			process_comments
			print_space
			l_assigner := a_feature.assigner
			if l_assigner /= Void then
				l_assigner.process (Current)
				process_comments
				print_space
			end
			a_feature.is_keyword.process (Current)
			process_comments
			print_space
			a_feature.constant.process (Current)
			l_semicolon := a_feature.semicolon
			if l_semicolon /= Void then
					-- Do not print the semicolon, but keep track of its comments if any.
				process_break (l_semicolon.break)
			end
		end

	process_constrained_formal_parameter (a_parameter: ET_CONSTRAINED_FORMAL_PARAMETER) is
			-- Process `a_parameter'.
			-- Comments at the end of node which have not been printed are kept in `comment_list'.
		local
			a_creation_procedures: ET_CONSTRAINT_CREATOR
			a_type_mark: ET_KEYWORD
		do
			a_type_mark := a_parameter.type_mark
			if a_type_mark /= Void then
				a_type_mark.process (Current)
				process_comments
				print_space
			end
			a_parameter.name.process (Current)
			process_comments
			print_space
			a_parameter.arrow_symbol.process (Current)
			process_comments
			print_space
			a_parameter.constraint.process (Current)
			a_creation_procedures := a_parameter.creation_procedures
			if a_creation_procedures /= Void then
				process_comments
				print_space
				a_creation_procedures.process (Current)
			end
		end

	process_constraint_creator (a_list: ET_CONSTRAINT_CREATOR) is
			-- Process `a_list'.
			-- Comments at the end of node which have not been printed are kept in `comment_list'.
		local
			i, nb: INTEGER
			l_item: ET_FEATURE_NAME_ITEM
			l_feature_name: ET_FEATURE_NAME
		do
			a_list.create_keyword.process (Current)
			process_comments
			print_space
			nb := a_list.count
			from i := 1 until i > nb loop
				l_item := a_list.item (i)
				l_feature_name := l_item.feature_name
				l_feature_name.process (Current)
				if i /= nb then
						-- The AST may or may not contain the comma.
						-- So we have to print it explicitly here.
					process_comments
					tokens.comma_symbol.process (Current)
				end
				comment_finder.add_excluded_node (l_feature_name)
				comment_finder.find_comments (l_item, comment_list)
				comment_finder.reset_excluded_nodes
				process_comments
				print_space
				i := i + 1
			end
			a_list.end_keyword.process (Current)
		end

	process_convert_expression (a_convert_expression: ET_CONVERT_EXPRESSION) is
			-- Process `a_convert_expression'.
			-- Comments at the end of node which have not been printed are kept in `comment_list'.
		do
			a_convert_expression.expression.process (Current)
		end

	process_convert_feature_comma (a_convert_feature: ET_CONVERT_FEATURE_COMMA) is
			-- Process `a_convert_feature'.
			-- Comments at the end of node which have not been printed are kept in `comment_list'.
		do
			a_convert_feature.convert_feature.process (Current)
			process_comments
			a_convert_feature.comma.process (Current)
		end

	process_convert_feature_list (a_list: ET_CONVERT_FEATURE_LIST) is
			-- Process `a_list'.
			-- Comments at the end of node which have not been printed are kept in `comment_list'.
		local
			i, nb: INTEGER
			l_item: ET_CONVERT_FEATURE_ITEM
			l_convert_feature: ET_CONVERT_FEATURE
		do
			a_list.convert_keyword.process (Current)
			nb := a_list.count
			if nb /= 0 then
				print_new_line
			end
			indent
			from i := 1 until i > nb loop
				l_item := a_list.item (i)
				l_convert_feature := l_item.convert_feature
				process_comments
				print_new_line
					-- Make sure that if this convert-feature needs to be broken into
					-- several lines (e.g. because of an comment in the middle of
					-- the convert-feature), then the subsequent lines have an extra
					-- indentation level.
				print_indentation
				indent
				l_convert_feature.process (Current)
				dedent
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
			-- Comments at the end of node which have not been printed are kept in `comment_list'.
		do
			a_convert_function.name.process (Current)
			process_comments
			a_convert_function.colon.process (Current)
			process_comments
			print_space
			a_convert_function.types.process (Current)
		end

	process_convert_procedure (a_convert_procedure: ET_CONVERT_PROCEDURE) is
			-- Process `a_convert_procedure'.
			-- Comments at the end of node which have not been printed are kept in `comment_list'.
		do
			a_convert_procedure.name.process (Current)
			process_comments
			print_space
			a_convert_procedure.left_parenthesis.process (Current)
			process_comments
			a_convert_procedure.types.process (Current)
			process_comments
			a_convert_procedure.right_parenthesis.process (Current)
		end

	process_convert_to_expression (a_convert_expression: ET_CONVERT_TO_EXPRESSION) is
			-- Process `a_convert_expression'.
			-- Comments at the end of node which have not been printed are kept in `comment_list'.
		do
			a_convert_expression.expression.process (Current)
		end

	process_create_expression (an_expression: ET_CREATE_EXPRESSION) is
			-- Process `an_expression'.
			-- Comments at the end of node which have not been printed are kept in `comment_list'.
		local
			l_creation_type: ET_TARGET_TYPE
			l_type: ET_TYPE
			l_call: ET_QUALIFIED_CALL
		do
			an_expression.create_keyword.process (Current)
			process_comments
			print_space
			l_creation_type := an_expression.creation_type
			l_type := l_creation_type.type
			tokens.left_brace_symbol.process (Current)
			l_type.process (Current)
			process_comments
			tokens.right_brace_symbol.process (Current)
			comment_finder.add_excluded_node (l_type)
			comment_finder.find_comments (l_creation_type, comment_list)
			comment_finder.reset_excluded_nodes
			l_call := an_expression.creation_call
			if l_call /= Void then
				process_comments
				l_call.process (Current)
			end
		end

	process_create_instruction (an_instruction: ET_CREATE_INSTRUCTION) is
			-- Process `an_instruction'.
			-- Comments at the end of node which have not been printed are kept in `comment_list'.
		local
			l_creation_type: ET_TARGET_TYPE
			l_type: ET_TYPE
			l_call: ET_QUALIFIED_CALL
		do
			an_instruction.create_keyword.process (Current)
			process_comments
			print_space
			l_creation_type := an_instruction.creation_type
			if l_creation_type /= Void then
				l_type := l_creation_type.type
				tokens.left_brace_symbol.process (Current)
				l_type.process (Current)
				process_comments
				tokens.right_brace_symbol.process (Current)
				comment_finder.add_excluded_node (l_type)
				comment_finder.find_comments (l_creation_type, comment_list)
				comment_finder.reset_excluded_nodes
				process_comments
				print_space
			end
			an_instruction.target.process (Current)
			l_call := an_instruction.creation_call
			if l_call /= Void then
				process_comments
				l_call.process (Current)
			end
		end

	process_creator (a_list: ET_CREATOR) is
			-- Process `a_list'.
			-- Comments at the end of node which have not been printed are kept in `comment_list'.
		local
			l_clients: ET_CLIENTS
			i, nb: INTEGER
			l_item: ET_FEATURE_NAME_ITEM
			l_feature_name: ET_FEATURE_NAME
		do
			a_list.creation_keyword.process (Current)
			l_clients := a_list.clients_clause
			if l_clients /= Void then
				process_comments
				print_space
				l_clients.process (Current)
			end
			nb := a_list.count
			if nb /= 0 then
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
			-- Comments at the end of node which have not been printed are kept in `comment_list'.
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

	process_current_address (an_expression: ET_CURRENT_ADDRESS) is
			-- Process `an_expression'.
			-- Comments at the end of node which have not been printed are kept in `comment_list'.
		do
			an_expression.dollar.process (Current)
			process_comments
			an_expression.current_keyword.process (Current)
		end

	process_custom_attribute (an_attribute: ET_CUSTOM_ATTRIBUTE) is
			-- Process `an_attribute'.
			-- Comments at the end of node which have not been printed are kept in `comment_list'.
		local
			l_settings: ET_MANIFEST_TUPLE
		do
			an_attribute.creation_expression.process (Current)
			process_comments
			print_space
			l_settings := an_attribute.settings
			if l_settings /= Void then
				l_settings.process (Current)
				process_comments
				print_space
			end
			an_attribute.end_keyword.process (Current)
		end

	process_debug_instruction (an_instruction: ET_DEBUG_INSTRUCTION) is
			-- Process `an_instruction'.
			-- Comments at the end of node which have not been printed are kept in `comment_list'.
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
					process_comments
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
							-- Make sure that if this instruction needs to be broken into
							-- several lines (e.g. because of an comment in the middle of
							-- the instruction), then the subsequent lines have an extra
							-- indentation level.
						print_indentation
						indent
						l_instruction.process (Current)
						dedent
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
			-- Comments at the end of node which have not been printed are kept in `comment_list'.
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
			a_frozen_keyword := a_feature.frozen_keyword
			if a_frozen_keyword /= Void then
				a_frozen_keyword.process (Current)
			end
			a_feature.extended_name.process (Current)
			from
				a_synonym := a_feature.synonym
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

	process_deferred_procedure (a_feature: ET_DEFERRED_PROCEDURE) is
			-- Process `a_feature'.
			-- Comments at the end of node which have not been printed are kept in `comment_list'.
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
			a_frozen_keyword := a_feature.frozen_keyword
			if a_frozen_keyword /= Void then
				a_frozen_keyword.process (Current)
			end
			a_feature.extended_name.process (Current)
			from
				a_synonym := a_feature.synonym
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

	process_do_function (a_feature: ET_DO_FUNCTION) is
			-- Process `a_feature'.
			-- Comments at the end of node which have not been printed are kept in `comment_list'.
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
			a_frozen_keyword := a_feature.frozen_keyword
			if a_frozen_keyword /= Void then
				a_frozen_keyword.process (Current)
			end
			a_feature.extended_name.process (Current)
			from
				a_synonym := a_feature.synonym
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

	process_do_function_inline_agent (an_expression: ET_DO_FUNCTION_INLINE_AGENT) is
			-- Process `an_expression'.
			-- Comments at the end of node which have not been printed are kept in `comment_list'.
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

	process_do_procedure (a_feature: ET_DO_PROCEDURE) is
			-- Process `a_feature'.
			-- Comments at the end of node which have not been printed are kept in `comment_list'.
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
			a_frozen_keyword := a_feature.frozen_keyword
			if a_frozen_keyword /= Void then
				a_frozen_keyword.process (Current)
			end
			a_feature.extended_name.process (Current)
			from
				a_synonym := a_feature.synonym
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

	process_do_procedure_inline_agent (an_expression: ET_DO_PROCEDURE_INLINE_AGENT) is
			-- Process `an_expression'.
			-- Comments at the end of node which have not been printed are kept in `comment_list'.
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

	process_dot_feature_name (a_name: ET_DOT_FEATURE_NAME) is
			-- Process `a_name'.
			-- Comments at the end of node which have not been printed are kept in `comment_list'.
		do
			a_name.dot.process (Current)
			a_name.feature_name.process (Current)
		end

	process_dotnet_function (a_feature: ET_DOTNET_FUNCTION) is
			-- Process `a_feature'.
			-- Comments at the end of node which have not been printed are kept in `comment_list'.
		local
			a_frozen_keyword: ET_TOKEN
			a_synonym: ET_FEATURE
			an_arguments: ET_FORMAL_ARGUMENT_LIST
			a_semicolon: ET_SEMICOLON_SYMBOL
			a_is_keyword: ET_KEYWORD
			an_assigner: ET_ASSIGNER
		do
			a_frozen_keyword := a_feature.frozen_keyword
			if a_frozen_keyword /= Void then
				a_frozen_keyword.process (Current)
			end
			a_feature.extended_name.process (Current)
			from
				a_synonym := a_feature.synonym
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

	process_dotnet_procedure (a_feature: ET_DOTNET_PROCEDURE) is
			-- Process `a_feature'.
			-- Comments at the end of node which have not been printed are kept in `comment_list'.
		local
			a_frozen_keyword: ET_TOKEN
			a_synonym: ET_FEATURE
			an_arguments: ET_FORMAL_ARGUMENT_LIST
			a_semicolon: ET_SEMICOLON_SYMBOL
			a_is_keyword: ET_KEYWORD
		do
			a_frozen_keyword := a_feature.frozen_keyword
			if a_frozen_keyword /= Void then
				a_frozen_keyword.process (Current)
			end
			a_feature.extended_name.process (Current)
			from
				a_synonym := a_feature.synonym
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

	process_expression_comma (an_expression: ET_EXPRESSION_COMMA) is
			-- Process `an_expression'.
			-- Do not print comment that may appear after the last token.
			-- This is done when printing the enclosing component.
		do
			an_expression.expression.process (Current)
			process_comments
			an_expression.comma.process (Current)
		end

	process_hexadecimal_integer_constant (a_constant: ET_HEXADECIMAL_INTEGER_CONSTANT) is
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

	process_regular_integer_constant (a_constant: ET_REGULAR_INTEGER_CONSTANT) is
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

	process_regular_manifest_string (a_string: ET_REGULAR_MANIFEST_STRING) is
			-- Process `a_string'.
		do
			file.put_character ('%"')
			file.put_string (a_string.literal)
			file.put_character ('%"')
			process_break (a_string.break)
		end

	process_regular_real_constant (a_constant: ET_REGULAR_REAL_CONSTANT) is
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

	process_special_manifest_string (a_string: ET_SPECIAL_MANIFEST_STRING) is
			-- Process `a_string'.
		do
			file.put_character ('%"')
			file.put_string (a_string.literal)
			file.put_character ('%"')
			process_break (a_string.break)
		end

	process_symbol (a_symbol: ET_SYMBOL) is
			-- Process `a_symbol'.
		do
			file.put_string (a_symbol.text)
			process_break (a_symbol.break)
		end

	process_token (a_token: ET_TOKEN) is
			-- Process `a_token'.
		do
			file.put_string (a_token.text)
			process_break (a_token.break)
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

	process_verbatim_string (a_string: ET_VERBATIM_STRING) is
			-- Process `a_string'.
		do
			file.put_character ('%"')
			file.put_string (a_string.marker)
			if a_string.is_left_aligned then
				file.put_character ('[')
			else
				file.put_character ('{')
			end
			file.put_string (a_string.open_white_characters)
			file.put_string (a_string.literal)
			file.put_string (a_string.close_white_characters)
			if a_string.is_left_aligned then
				file.put_character (']')
			else
				file.put_character ('}')
			end
			file.put_string (a_string.marker)
			file.put_character ('%"')
			process_break (a_string.break)
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
		do
			comment_printed := False
			if not indentation_printed then
				print_indentation
			end
-- TODO
			file.put_string ("--")
			print_new_line
			comment_printed := True
		end

	print_indented_comment (a_break: ET_BREAK) is
			-- If `a_break' contains a comment, then print it on its own line
			-- (go to next line if necessary), with an extra indentation level.
			-- Comments are followed by a new-line.
		do
			if comment_printable (a_break) then
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
		end

	print_indented_comments (a_breaks: DS_ARRAYED_LIST [ET_BREAK]) is
			-- If `a_breaks' contains comments, then print them on their own line
			-- (go to next line if necessary), with an extra indentation level.
			-- Comments are followed by a new-line.
		require
			a_breaks_not_void: a_breaks /= Void
		local
			i, nb: INTEGER
		do
			nb := a_breaks.count
			from i := 1 until i > nb loop
				print_indented_comment (a_breaks.item (i))
				i := i + 1
			end
		end

	comment_printed: BOOLEAN
			-- Has a comment just been printed?

	comment_printable (a_break: ET_BREAK): BOOLEAN is
			-- Is `a_break' a comment that will be printed?
		do
			Result := a_break /= Void and then a_break.has_comment
		ensure
			break_not_void: Result implies a_break /= Void
			break_has_comment: Result implies a_break.has_comment
		end

	comment_list: DS_ARRAYED_LIST [ET_BREAK]
			-- List of comments that have not been printed yet

	comment_finder: ET_COMMENT_FINDER
			-- Comment finder

invariant

	file_not_void: file /= Void
	file_is_open_write: file.is_open_write
	comment_finder_not_void: comment_finder /= Void
	comment_list_not_void: comment_list /= Void

end
