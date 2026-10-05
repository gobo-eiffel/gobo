note

	description:

	"[
		Eiffel AST pretty printers.
		Use UTF-8 encoding. Note that the byte order mark (BOM) for UTF-8 is not
		printed unless it was found in the class file when parsing the class text
		and `bom_enabled' is True, or it is explicitly printed by calling `print_bom'.
	]"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2007-2026, Eric Bezault and others"
	license: "MIT License"

class ET_AST_PRETTY_PRINTER

inherit

	ET_AST_PRINTER
		redefine
			make, file,
			process_across_expression,
			process_across_instruction,
			process_actual_argument_list,
			process_agent_argument_operand_list,
			process_agent_typed_open_argument,
			process_alias_free_name,
			process_alias_name,
			process_alias_name_list,
			process_aliased_feature_name,
			process_all_export,
			process_assign_feature_name,
			process_assigner,
			process_assigner_instruction,
			process_assignment,
			process_assignment_attempt,
			process_attachment_mark_separate_keyword,
			process_attribute,
			process_bang_instruction,
			process_base_type_constraint_list,
			process_base_type_rename_constraint,
			process_binary_integer_constant,
			process_braced_type_list,
			process_bracket_expression,
			process_break,
			process_c1_character_constant,
			process_c2_character_constant,
			process_c3_character_constant,
			process_call_agent,
			process_check_instruction,
			process_choice_list,
			process_choice_range,
			process_class,
			process_class_assertion,
			process_class_type,
			process_clients,
			process_colon_type,
			process_compound,
			process_constant_attribute,
			process_constrained_formal_parameter,
			process_constraint_creator,
			process_constraint_rename_list,
			process_convert_feature_list,
			process_convert_function,
			process_convert_procedure,
			process_create_expression,
			process_create_instruction,
			process_creation_region,
			process_creator,
			process_creator_list,
			process_current,
			process_current_address,
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
			process_elseif_expression,
			process_elseif_expression_list,
			process_elseif_part,
			process_elseif_part_list,
			process_equality_expression,
			process_explicit_convert_from_expression,
			process_explicit_convert_to_expression,
			process_export_list,
			process_extended_attribute,
			process_extended_feature_name,
			process_external_function,
			process_external_function_inline_agent,
			process_external_procedure,
			process_external_procedure_inline_agent,
			process_false_constant,
			process_feature_address,
			process_feature_clause,
			process_feature_clause_list,
			process_feature_export,
			process_features,
			process_formal_argument,
			process_formal_argument_list,
			process_formal_comma_argument,
			process_formal_parameter,
			process_formal_parameter_list,
			process_formal_parameter_type,
			process_hexadecimal_integer_constant,
			process_identifier,
			process_if_expression,
			process_if_instruction,
			process_infix_and_then_operator,
			process_infix_expression,
			process_infix_or_else_operator,
			process_inline_separate_argument,
			process_inline_separate_argument_comma,
			process_inline_separate_arguments,
			process_inline_separate_instruction,
			process_inspect_expression,
			process_inspect_instruction,
			process_invariants,
			process_keyword,
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
			process_manifest_type,
			process_named_object_test,
			process_note_list,
			process_note_term_list,
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
			process_parent_clause_list,
			process_parent_list,
			process_parenthesis_expression,
			process_parenthesis_instruction,
			process_postconditions,
			process_preconditions,
			process_precursor_expression,
			process_precursor_instruction,
			process_prefix_expression,
			process_qualified_call,
			process_qualified_call_expression,
			process_qualified_call_instruction,
			process_qualified_like_braced_type,
			process_qualified_like_type,
			process_qualified_regular_feature_call,
			process_quantifier_expression,
			process_regular_integer_constant,
			process_regular_manifest_string,
			process_regular_real_constant,
			process_repeat_instruction,
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
			process_tagged_note,
			process_token,
			process_true_constant,
			process_tuple_type,
			process_type_constraint_list,
			process_type_rename_constraint,
			process_underscored_integer_constant,
			process_underscored_real_constant,
			process_unique_attribute,
			process_unqualified_call_expression,
			process_unqualified_call_instruction,
			process_unqualified_regular_feature_call,
			process_variant,
			process_verbatim_string,
			process_void,
			process_when_expression,
			process_when_expression_list,
			process_when_compound,
			process_when_compound_list
		end

create

	make, make_null

feature {NONE} -- Initialization

	make (a_file: like file)
			-- Create a new AST pretty-printer, using `a_file' as output file.
		do
			precursor (a_file)
			create comment_finder.make
			create comment_list.make (20)
			use_uppercase_class_names := True
			use_lowercase_feature_names := True
			use_lowercase_keywords := True
			use_lowercase_local_names := True
			use_is_keyword := False
		ensure then
			use_uppercase_class_names: use_uppercase_class_names
			use_lowercase_feature_names: use_lowercase_feature_names
			use_lowercase_keywords: use_lowercase_keywords
			use_lowercase_local_names: use_lowercase_local_names
			no_use_is_keyword: not use_is_keyword
		end

feature -- Initialization

	reset
			-- Reset for another pretty-printing.
		do
			reset_indentation
			indentation_printed := False
			comment_printed := False
			comment_list.wipe_out
			comment_finder.reset_excluded_nodes
			set_comments_ignored (False)
			set_use_as_type (False)
		end

feature -- Access

	file: KI_TEXT_OUTPUT_STREAM
			-- Output file

feature -- Status report

	use_is_keyword: BOOLEAN
			-- Should the obsolete 'is' keyword be used?

	use_as_type: BOOLEAN
			-- Should classes be considered as class types and
			-- formal parameters as formal parameter types?

	use_uppercase_class_names: BOOLEAN
			-- Should class names and formal parameter names
			-- be printed in upper-case?

	use_lowercase_feature_names: BOOLEAN
			-- Should feature names be printed in lower-case?

	use_lowercase_keywords: BOOLEAN
			-- Should keywords be printed in lower-case?
			-- (And with a capital letter for 'Current', 'Result',
			-- 'Void', 'True' and 'False'.)

	use_lowercase_local_names: BOOLEAN
			-- Should formal argument names, local variable names,
			-- iteration cursor names, object-test local names,
			-- Tuple type labels, assertion tags and note tags be
			-- printed in lower-case?

feature -- Status setting

	set_use_is_keyword (b: BOOLEAN)
			-- Set `use_is_keyword' to `b'.
		do
			use_is_keyword := b
		ensure
			use_is_keyword_set: use_is_keyword = b
		end

	set_use_as_type (b: BOOLEAN)
			-- Set `use_as_type' to `b'.
		do
			use_as_type := b
		ensure
			use_as_type_set: use_as_type = b
		end

	set_use_uppercase_class_names (b: BOOLEAN)
			-- Set `use_uppercase_class_names' to `b'.
		do
			use_uppercase_class_names := b
		ensure
			use_uppercase_class_names_set: use_uppercase_class_names = b
		end

	set_use_lowercase_feature_names (b: BOOLEAN)
			-- Set `use_lowercase_feature_names' to `b'.
		do
			use_lowercase_feature_names := b
		ensure
			use_lowercase_feature_names_set: use_lowercase_feature_names = b
		end

	set_use_lowercase_keywords (b: BOOLEAN)
			-- Set `use_lowercase_keywords' to `b'.
		do
			use_lowercase_keywords := b
		ensure
			use_lowercase_keywords_set: use_lowercase_keywords = b
		end

	set_use_lowercase_local_names (b: BOOLEAN)
			-- Set `use_lowercase_local_names' to `b'.
		do
			use_lowercase_local_names := b
		ensure
			use_lowercase_local_names_set: use_lowercase_local_names = b
		end

feature -- Indentation

	indentation: INTEGER
			-- Indentation in `file'

	indent
			-- Increment indentation.
		do
			indentation := indentation + 1
		ensure
			one_more: indentation = old indentation + 1
		end

	dedent
			-- Decrement indentation.
		do
			indentation := indentation - 1
		ensure
			one_less: indentation = old indentation - 1
		end

	reset_indentation
			-- Reset indentation.
		do
			indentation := 0
		ensure
			indentation_reset: indentation = 0
		end

feature -- Comments

	comments_ignored: BOOLEAN
			-- Should comments not be printed?

	set_comments_ignored (b: BOOLEAN)
			-- Set `comments_ignored' to `b'.
		do
			comments_ignored := b
			comment_finder.set_comments_ignored (b)
		ensure
			comments_ignored_set: comments_ignored = b
		end

feature {ET_AST_NODE} -- Processing

	process_across_expression (an_expression: ET_ACROSS_EXPRESSION)
			-- Process `an_expression'.
		local
			l_iteration_conditional: ET_CONDITIONAL
			l_expression: ET_EXPRESSION
		do
			an_expression.across_keyword.process (Current)
			print_space
			an_expression.iterable_expression.process (Current)
			print_space
			an_expression.as_keyword.process (Current)
			print_space
			process_iteration_item_name (an_expression.item_name, True)
			print_space
			if attached an_expression.invariant_part as l_invariant_part then
				l_invariant_part.process (Current)
			end
			if attached an_expression.until_conditional as l_until_conditional then
				if attached {ET_KEYWORD_EXPRESSION} l_until_conditional as l_full_until_conditional then
					l_full_until_conditional.process (Current)
				else
					tokens.until_keyword.process (Current)
					print_space
					l_expression := l_until_conditional.expression
					l_expression.process (Current)
					comment_finder.add_excluded_node (l_expression)
					comment_finder.find_comments (l_until_conditional, comment_list)
					comment_finder.reset_excluded_nodes
				end
				print_space
			end
			l_iteration_conditional := an_expression.iteration_conditional
			if attached {ET_KEYWORD_EXPRESSION} l_iteration_conditional as l_full_iteration_conditional then
				l_full_iteration_conditional.process (Current)
			else
				if an_expression.is_all then
					tokens.all_keyword.process (Current)
				else
					tokens.some_keyword.process (Current)
				end
				print_space
				l_expression := l_iteration_conditional.expression
				l_expression.process (Current)
				comment_finder.add_excluded_node (l_expression)
				comment_finder.find_comments (l_iteration_conditional, comment_list)
				comment_finder.reset_excluded_nodes
			end
			print_space
			if attached an_expression.variant_part as l_variant_part then
				l_variant_part.process (Current)
				print_space
			end
			an_expression.end_keyword.process (Current)
		end

	process_across_instruction (an_instruction: ET_ACROSS_INSTRUCTION)
			-- Process `an_instruction'.
		local
			l_expression: ET_EXPRESSION
		do
			an_instruction.across_keyword.process (Current)
			print_new_line
			indent
			process_comments
			an_instruction.iterable_expression.process (Current)
			print_new_line
			process_comments
			dedent
			an_instruction.as_keyword.process (Current)
			print_new_line
			indent
			process_comments
			process_iteration_item_name (an_instruction.item_name, True)
			print_new_line
			process_comments
			dedent
			if attached an_instruction.from_compound as l_from_compound then
				l_from_compound.process (Current)
				print_new_line
				process_comments
			end
			if attached an_instruction.invariant_part as l_invariant_part then
				l_invariant_part.process (Current)
				process_comments
			end
			if attached an_instruction.until_conditional as l_conditional then
				if attached {ET_KEYWORD_EXPRESSION} l_conditional as l_full_until_conditional then
					l_full_until_conditional.keyword.process (Current)
					comment_finder.add_excluded_node (l_full_until_conditional.keyword)
				else
					tokens.until_keyword.process (Current)
				end
				print_new_line
				indent
				process_comments
				l_expression := l_conditional.expression
				l_expression.process (Current)
				comment_finder.add_excluded_node (l_expression)
				comment_finder.find_comments (l_conditional, comment_list)
				comment_finder.reset_excluded_nodes
				print_new_line
				process_comments
				dedent
			end
			if attached an_instruction.loop_compound as l_loop_compound then
				l_loop_compound.process (Current)
			else
				tokens.loop_keyword.process (Current)
			end
			print_new_line
			process_comments
			if attached an_instruction.variant_part as l_variant_part then
				l_variant_part.process (Current)
				print_new_line
				process_comments
			end
			an_instruction.end_keyword.process (Current)
		end

	process_across_keyword_in_across_expression (a_across_keyword: ET_KEYWORD; a_expression: ET_ACROSS_EXPRESSION)
			-- Process `a_across_keyword` when it appears in `a_expression`.
		require
			a_across_keyword_not_void: a_across_keyword /= Void
			a_expression_not_void: a_expression /= Void
			valid_across_keyword: a_across_keyword = a_expression.across_keyword
		do
			a_across_keyword.process (Current)
		end

	process_actual_argument_list (a_list: ET_ACTUAL_ARGUMENT_LIST)
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

	process_actual_parameter_list_in_base_type (a_list: ET_ACTUAL_PARAMETER_LIST; a_base_type: ET_BASE_TYPE)
			-- Process `a_list' when it appears in `a_base_type`.
		require
			a_list_not_void: a_list /= Void
			a_base_type_not_void: a_base_type /= Void
			valid_list: attached a_base_type.actual_parameters as l_actual_parameters and then a_list = l_actual_parameters.folded_actual_parameters
		local
			i, nb: INTEGER
			l_item: ET_ACTUAL_PARAMETER_ITEM
			l_unlabeled: BOOLEAN
			l_type: ET_TYPE
			l_comment: ET_COMMENT
		do
			a_list.left_bracket.process (Current)
			if attached a_list.first_symbol as l_first_symbol then
				comment_finder.find_comments (l_first_symbol, comment_list)
			end
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
			from i := 1 until i > nb loop
				l_item := a_list.item (i)
				if attached l_item.label as l_label then
					if l_unlabeled then
							-- This label cannot be printed here, otherwise the result would
							-- not be syntactically correct (see comment above). The name of
							-- the label is printed in a comment so that we don't lose any
							-- valuable information in the pretty-printed text.
						create l_comment.make ("-- label: " + l_label.name)
						comment_list.force_last (l_comment)
					else
						process_tuple_label_in_tuple_type (l_label, a_base_type)
						comment_finder.add_excluded_node (l_label)
					end
				end
				if l_unlabeled then
					l_type := l_item.type
					process_type (l_type)
					comment_finder.add_excluded_node (l_type)
					comment_finder.find_comments (l_item, comment_list)
					comment_finder.reset_excluded_nodes
					if i /= nb then
							-- The AST may or may not contain the comma.
							-- So we have to print it explicitly here.
						tokens.comma_symbol.process (Current)
						print_space
					end
				elseif l_item.is_last_entity or i = nb then
					tokens.colon_symbol.process (Current)
					print_space
					l_type := l_item.type
					process_type (l_type)
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
					comment_finder.find_comments (l_item, comment_list)
					comment_finder.reset_excluded_nodes
						-- The AST may or may not contain the comma.
						-- So we have to print it explicitly here.
					tokens.comma_symbol.process (Current)
					print_space
				end
				i := i + 1
			end
			a_list.right_bracket.process (Current)
		end

	process_agent_arguments (a_agent: ET_AGENT)
			-- Process arguments of `a_agent'.
		require
			a_agent_not_void: a_agent /= Void
		do
			if attached {ET_AGENT_ARGUMENT_OPERAND_LIST} a_agent.arguments as l_arguments then
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

	process_agent_argument_operand_list (a_list: ET_AGENT_ARGUMENT_OPERAND_LIST)
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

	process_agent_typed_open_argument (an_argument: ET_AGENT_TYPED_OPEN_ARGUMENT)
			-- Process `an_argument'.
		do
			an_argument.left_brace.process (Current)
			process_type (an_argument.type)
			an_argument.right_brace.process (Current)
			print_space
			an_argument.question_mark.process (Current)
		end

	process_alias_free_name (a_name: ET_ALIAS_FREE_NAME)
			-- Process `a_name'.
		do
			process_alias_name (a_name)
		end

	process_alias_name (a_name: ET_ALIAS_NAME)
			-- Process `a_name'.
		do
			a_name.alias_keyword.process (Current)
			comment_finder.add_excluded_node (a_name.alias_keyword)
			print_space
			print_alias_string (a_name)
			comment_finder.add_excluded_node (a_name.alias_string)
			if attached a_name.convert_keyword as l_convert_keyword then
				print_space
				l_convert_keyword.process (Current)
				comment_finder.add_excluded_node (l_convert_keyword)
			end
			comment_finder.find_comments (a_name, comment_list)
			comment_finder.reset_excluded_nodes
		end

	process_alias_name_list (a_list: ET_ALIAS_NAME_LIST)
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.item (i).process (Current)
				if i /= nb then
					print_space
				end
				i := i + 1
			end
		end

	process_aliased_feature_name (a_name: ET_ALIASED_FEATURE_NAME)
			-- Process `a_name'.
		do
			process_unqualified_feature_name (a_name.feature_name)
			print_space
			a_name.alias_names.process (Current)
		end

	process_all_export (an_export: ET_ALL_EXPORT)
			-- Process `an_export'.
		do
			an_export.clients_clause.process (Current)
			print_space
			an_export.all_keyword.process (Current)
		end

	process_argument_name (a_identifier: ET_IDENTIFIER; a_is_declaration: BOOLEAN)
			-- Process `a_identifier'.
		require
			a_identifier_not_void: a_identifier /= Void
			a_identifier_is_argument: a_identifier.is_argument
		do
			print_local_name (a_identifier)
		end

	process_assertions (a_list: ET_ASSERTIONS)
			-- Process `a_list'.
		require
			a_list_not_void: a_list /= Void
		local
			i, nb: INTEGER
			l_item: ET_ASSERTION_ITEM
			l_assertion: ET_ASSERTION
		do
			if attached a_list.first_semicolon as l_first_semicolon then
				comment_finder.find_comments (l_first_semicolon, comment_list)
				process_comments
			end
			nb := a_list.count
			from i := 1 until i > nb loop
				l_item := a_list.item (i)
				l_assertion := l_item.assertion
				l_assertion.process (Current)
				comment_finder.add_excluded_node (l_assertion)
				comment_finder.find_comments (l_item, comment_list)
				comment_finder.reset_excluded_nodes
				if i /= nb then
					if attached {ET_IDENTIFIER} l_assertion.last_leaf and attached {ET_SYMBOL} a_list.item (i + 1).first_leaf as l_symbol and then (l_symbol.is_left_parenthesis or l_symbol.is_left_bracket) then
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
				end
				process_comments
				print_new_line
				i := i + 1
			end
		end

	process_assign_feature_name (an_assigner: ET_ASSIGN_FEATURE_NAME)
			-- Process `an_assigner'.
		do
			an_assigner.assign_keyword.process (Current)
			print_space
			set_current_target
			process_feature_name_in_assigner (an_assigner.feature_name, an_assigner)
			set_target (Void)
		end

	process_assign_symbol_in_assigner_instruction (a_assign_symbol: ET_SYMBOL; a_instruction: ET_ASSIGNER_INSTRUCTION)
			-- Process `a_assign_symbol` when it appears in `a_instruction`.
		require
			a_assign_symbol_not_void: a_assign_symbol /= Void
			a_instruction_not_void: a_instruction /= Void
			valid_assign_symbol: a_assign_symbol = a_instruction.assign_symbol
		do
			a_instruction.assign_symbol.process (Current)
		end

	process_assigner (a_assigner: ET_ASSIGNER)
			-- Process `a_assigner`.
		do
			if attached {ET_FEATURE_NAME} a_assigner as l_feature_name then
				tokens.assign_keyword.process (Current)
				print_space
				set_current_target
				process_feature_name_in_assigner (l_feature_name, a_assigner)
				set_target (Void)
			else
				a_assigner.process (Current)
			end
		end

	process_assigner_instruction (an_instruction: ET_ASSIGNER_INSTRUCTION)
			-- Process `an_instruction'.
		local
			l_call: ET_QUALIFIED_FEATURE_CALL_EXPRESSION
		do
			l_call := an_instruction.call
			l_call.process (Current)
			print_space
			set_target_with_seeded_feature (l_call, an_instruction.name.seed)
			process_assign_symbol_in_assigner_instruction (an_instruction.assign_symbol, an_instruction)
			set_target (Void)
			print_space
			an_instruction.source.process (Current)
		end

	process_assignment (an_instruction: ET_ASSIGNMENT)
			-- Process `an_instruction'.
		do
			process_writable (an_instruction.target)
			print_space
			an_instruction.assign_symbol.process (Current)
			print_space
			an_instruction.source.process (Current)
		end

	process_assignment_attempt (an_instruction: ET_ASSIGNMENT_ATTEMPT)
			-- Process `an_instruction'.
		do
			process_writable (an_instruction.target)
			print_space
			an_instruction.assign_attempt_symbol.process (Current)
			print_space
			an_instruction.source.process (Current)
		end

	process_attached_keyword_in_object_test (a_attached_keyword: ET_KEYWORD; a_object_test: ET_OBJECT_TEST)
			-- Process `a_attached_keyword` when it appears in `a_object_test`.
		require
			a_attached_keyword_not_void: a_attached_keyword /= Void
			a_object_test_not_void: a_object_test /= Void
			valid_attached_keyword: a_attached_keyword = a_object_test.attached_keyword
		do
			a_attached_keyword.process (Current)
		end

	process_attachment_mark_separate_keyword (a_keywords: ET_ATTACHMENT_MARK_SEPARATE_KEYWORD)
			-- Process `a_keywords'.
		local
			l_attachment_mark: ET_TYPE_MARK
		do
			l_attachment_mark := a_keywords.attachment_mark
			if not l_attachment_mark.is_implicit_mark then
				process_type_mark (l_attachment_mark)
				print_space
			end
			a_keywords.separateness_keyword.process (Current)
		end

	process_attribute (a_feature: ET_ATTRIBUTE)
			-- Process `a_feature'.
		do
			process_feature_synonyms (a_feature)
			process_query_type (a_feature)
			process_query_assigner (a_feature)
			process_feature_semicolon (a_feature)
				-- Print header comment.
			indent
			process_comments
			dedent
		end

	process_bang_instruction (an_instruction: ET_BANG_INSTRUCTION)
			-- Process `an_instruction'.
		local
			l_type: detachable ET_TYPE
		do
				-- Use the keyword 'create' even if the original class text was using the old syntax with '!!'.
				-- The following code will try to print the comments at the right place if any, even when
				-- replacing '!!' with 'create'.
			tokens.create_keyword.process (Current)
			print_space
			process_break (an_instruction.left_bang.break)
			l_type := an_instruction.type
			if l_type /= Void then
				tokens.left_brace_symbol.process (Current)
				process_type (l_type)
				tokens.right_brace_symbol.process (Current)
				print_space
			end
			process_break (an_instruction.right_bang.break)
			process_writable (an_instruction.target)
			if attached an_instruction.creation_call as l_creation_call then
				if l_type /= Void then
					set_target_type_with_seeded_feature (l_type, l_creation_call.name.seed)
				else
					set_target_with_seeded_feature (an_instruction.target, l_creation_call.name.seed)
				end
				process_creation_call (l_creation_call)
				set_target_type (Void)
			end
		end

	process_base_type_constraint_list (a_list: ET_BASE_TYPE_CONSTRAINT_LIST)
			-- Process `a_list'.
		local
			i, nb: INTEGER
			l_type_constraint: ET_BASE_TYPE_CONSTRAINT
		do
			a_list.left_brace.process (Current)
			nb := a_list.count
			from i := 1 until i > nb loop
				l_type_constraint := a_list.item (i)
				l_type_constraint.process (Current)
				if i /= nb then
					tokens.comma_symbol.process (Current)
					print_space
				end
				i := i + 1
			end
			a_list.right_brace.process (Current)
		end

	process_base_type_rename_constraint (a_type_rename_constraint: ET_BASE_TYPE_RENAME_CONSTRAINT)
			-- Process `a_type_rename_constraint'.
		do
			process_type_rename_constraint (a_type_rename_constraint)
		end

	process_binary_integer_constant (a_constant: ET_BINARY_INTEGER_CONSTANT)
			-- Process `a_constant'.
		do
			process_integer_constant (a_constant)
		end

	process_braced_type_list (a_list: ET_BRACED_TYPE_LIST)
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
				process_type (l_type)
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

	process_bracket_expression (an_expression: ET_BRACKET_EXPRESSION)
			-- Process `an_expression'.
		do
			an_expression.target.process (Current)
			if attached an_expression.arguments as l_arguments then
				print_space
				l_arguments.process (Current)
			end
		end

	process_break (a_break: detachable ET_BREAK)
			-- Process `a_break'.
		do
			if not comments_ignored and a_break /= Void and then a_break.has_comment then
				comment_list.force_last (a_break)
			end
		end

	process_c1_character_constant (a_constant: ET_C1_CHARACTER_CONSTANT)
			-- Process `a_constant'.
		do
			if attached a_constant.cast_type as l_cast_type then
				process_cast_type (l_cast_type)
				print_space
			end
			process_c1_character_constant_without_cast_type (a_constant)
		end

	process_c1_character_constant_without_cast_type (a_constant: ET_C1_CHARACTER_CONSTANT)
			-- Process `a_constant' without cast type.
		require
			a_constant_not_void: a_constant /= Void
		local
			c, b: NATURAL_32
		do
			print_character ('%'')
			c := {UC_UTF8_ROUTINES}.natural_32_code_to_utf8 (a_constant.literal.natural_32_code)
			print_character (((c & 0xFF000000) |>> (3 * {PLATFORM}.natural_8_bits)).to_character_8)
			b := c & 0x00FF0000
			if b /= 0 then
				print_character ((b |>> (2 * {PLATFORM}.natural_8_bits)).to_character_8)
				b := c & 0x0000FF00
				if b /= 0 then
					print_character ((b |>> {PLATFORM}.natural_8_bits).to_character_8)
					b := c & 0x000000FF
					if b /= 0 then
						print_character (b.to_character_8)
					end
				end
			end
			print_character ('%'')
			process_break (a_constant.break)
		end

	process_c2_character_constant (a_constant: ET_C2_CHARACTER_CONSTANT)
			-- Process `a_constant'.
		do
			if attached a_constant.cast_type as l_cast_type then
				process_cast_type (l_cast_type)
				print_space
			end
			process_c2_character_constant_without_cast_type (a_constant)
		end

	process_c2_character_constant_without_cast_type (a_constant: ET_C2_CHARACTER_CONSTANT)
			-- Process `a_constant' without cast type.
		require
			a_constant_not_void: a_constant /= Void
		do
			print_character ('%'')
			print_character ('%%')
			print_character (a_constant.literal)
			print_character ('%'')
			process_break (a_constant.break)
		end

	process_c3_character_constant (a_constant: ET_C3_CHARACTER_CONSTANT)
			-- Process `a_constant'.
		do
			if attached a_constant.cast_type as l_cast_type then
				process_cast_type (l_cast_type)
				print_space
			end
			process_c3_character_constant_without_cast_type (a_constant)
		end

	process_c3_character_constant_without_cast_type (a_constant: ET_C3_CHARACTER_CONSTANT)
			-- Process `a_constant' without cast type.
		require
			a_constant_not_void: a_constant /= Void
		do
			print_character ('%'')
			print_character ('%%')
			print_character ('/')
			print_string (a_constant.literal)
			print_character ('/')
			print_character ('%'')
			process_break (a_constant.break)
		end

	process_call_agent (an_expression: ET_CALL_AGENT)
			-- Process `an_expression'.
		local
			l_qualified_feature_name: ET_QUALIFIED_FEATURE_NAME
			l_feature_name: ET_FEATURE_NAME
			l_target: ET_AGENT_TARGET
		do
			an_expression.agent_keyword.process (Current)
			print_space
			l_target := an_expression.target
			if an_expression.is_qualified_call then
				l_target.process (Current)
					-- The AST may or may not contain the dot.
					-- So we have to print them explicitly here.
				tokens.dot_symbol.process (Current)
			end
			l_qualified_feature_name := an_expression.qualified_name
			l_feature_name := l_qualified_feature_name.feature_name
			if attached {ET_AGENT_OPEN_TARGET} l_target as l_open_target then
				set_target_type_with_seeded_feature (l_open_target.type, l_feature_name.seed)
			elseif attached {ET_EXPRESSION} l_target as l_expression_target then
				set_target_with_seeded_feature (l_expression_target, l_feature_name.seed)
			else
				set_current_target
			end
			process_feature_name_in_call_agent (l_feature_name, an_expression)
			set_target (Void)
			comment_finder.add_excluded_node (l_feature_name)
			comment_finder.find_comments (l_qualified_feature_name, comment_list)
			comment_finder.reset_excluded_nodes
			process_agent_arguments (an_expression)
		end

	process_check_instruction (an_instruction: ET_CHECK_INSTRUCTION)
			-- Process `an_instruction'.
		do
			an_instruction.check_keyword.process (Current)
			print_new_line
			indent
			process_comments
			process_assertions (an_instruction)
			process_comments
			dedent
			if attached an_instruction.then_compound as l_then_compound then
				l_then_compound.process (Current)
				process_comments
				print_new_line
			end
			an_instruction.end_keyword.process (Current)
		end

	process_cast_type (a_cast_type: ET_TARGET_TYPE)
			-- Process `a_cast_type'.
		require
			a_cast_type_not_void: a_cast_type /= Void
		local
			l_type: ET_TYPE
		do
				-- The AST may or may not contain the braces.
				-- So we have to print them explicitly here.
			l_type := a_cast_type.type
			tokens.left_brace_symbol.process (Current)
			process_type (l_type.type)
			tokens.right_brace_symbol.process (Current)
			comment_finder.add_excluded_node (l_type)
			comment_finder.find_comments (a_cast_type, comment_list)
			comment_finder.reset_excluded_nodes
		end

	process_choice_list (a_list: ET_CHOICE_LIST)
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

	process_choice_range (a_choice: ET_CHOICE_RANGE)
			-- Process `a_choice'.
		do
			a_choice.lower.process (Current)
			print_space
			a_choice.dotdot.process (Current)
			print_space
			a_choice.upper.process (Current)
		end

	process_class (a_class: ET_CLASS)
			-- Process `a_class'.
		do
			if use_as_type then
				process_name_of_named_class (a_class.name, a_class)
				if attached a_class.formal_parameters as l_formal_parameters and then not l_formal_parameters.is_empty then
					print_space
					l_formal_parameters.process (Current)
				end
			else
				if bom_enabled and then a_class.has_utf8_bom then
					print_bom
				end
				process_break (a_class.leading_break)
				if not comment_list.is_empty then
					process_comments
						-- Add an extra line after the comment.
					print_new_line
				end
				if attached a_class.first_note_clause as l_note_clause then
					l_note_clause.process (Current)
					process_comments
					print_new_line
					print_new_line
				end
				if attached a_class.frozen_keyword as l_frozen_keyword then
					l_frozen_keyword.process (Current)
					print_space
				end
				if attached a_class.class_mark as l_class_mark then
					process_class_mark_in_class (l_class_mark, a_class)
					print_space
				end
				if attached a_class.external_keyword as l_external_keyword then
					process_external_keyword_in_class (l_external_keyword, a_class)
					print_space
				end
				a_class.class_keyword.process (Current)
				print_space
				process_name_of_current_class (a_class.name, a_class)
				if attached a_class.formal_parameters as l_formal_parameters then
					if l_formal_parameters.is_empty then
							-- Do not print empty brackets, but keep the comments if any.
						comment_finder.find_comments (l_formal_parameters, comment_list)
					else
						print_space
						l_formal_parameters.process (Current)
					end
				end
				process_comments
				print_new_line
				print_new_line
				process_class_obsolete_message (a_class)
				if attached a_class.parent_clauses as l_parents then
					l_parents.process (Current)
					process_comments
					print_new_line
					print_new_line
				end
				if attached a_class.creators as l_creators then
					l_creators.process (Current)
					process_comments
					print_new_line
					print_new_line
				end
				if attached a_class.convert_features as l_convert_features then
					l_convert_features.process (Current)
					process_comments
					print_new_line
					print_new_line
				end
				process_features (a_class)
				if attached a_class.invariants as l_invariants then
					l_invariants.process (Current)
					process_comments
				end
				if attached a_class.second_note_clause as l_note_clause then
					if (not attached a_class.invariants as l_invariants or else l_invariants.is_empty) and then a_class.queries.declared_count > 0 and then a_class.queries.item (a_class.queries.declared_count).is_attribute and then (a_class.procedures.declared_count = 0 or else a_class.procedures.item (a_class.procedures.declared_count).position < a_class.queries.item (a_class.queries.declared_count).position) then
							-- Print a semicolon in order to avoid syntax error.
							-- For example if we have:
							--
							--     feature
							--         attr: INTEGER
							--     note
							--         license: "..."
							--     end
							--
							-- it could also be seen as:
							--
							--     feature
							--         attr: INTEGER
							--             note
							--                  license: "..."
							--             end
							--
							-- even if this is not syntactically correct since the end
							-- of the class is missing.
						tokens.semicolon_symbol.process (Current)
					end
					l_note_clause.process (Current)
					process_comments
					print_new_line
					print_new_line
				end
				a_class.end_keyword.process (Current)
				process_comments_on_same_line
				print_new_line
			end
		end

	process_class_assertion (a_assertion: ET_CLASS_ASSERTION)
			-- Process `a_assertion'.
		do
			a_assertion.class_keyword.process (Current)
		end

	process_class_mark_in_class (a_class_mark: ET_CLASS_MARK; a_class: ET_CLASS)
			-- Process `a_class_mark` when it appears in `a_class`.
		require
			a_class_mark_not_void: a_class_mark /= Void
			a_class_not_void: a_class /= Void
			valid_class_mark: a_class_mark = a_class.class_mark
		do
			a_class_mark.process (Current)
		end

	process_class_name_in_creation_region (a_class_name: ET_CLASS_NAME; a_region: ET_CREATION_REGION)
			-- Process `a_class_name` when it appears in `a_region`.
		require
			a_class_name_not_void: a_class_name /= Void
			a_region_not_void: a_region /= Void
		do
			print_class_name (a_class_name)
		end

	process_class_obsolete_message (a_class: ET_CLASS)
			-- Process obsolete message of `a_class'.
		require
			a_class_not_void: a_class /= Void
		local
			l_obsolete_string: ET_MANIFEST_STRING
		do
			if attached a_class.obsolete_message as l_obsolete_message then
				if attached {ET_KEYWORD_MANIFEST_STRING} l_obsolete_message as l_full_obsolete_message then
					l_full_obsolete_message.keyword.process (Current)
					comment_finder.add_excluded_node (l_full_obsolete_message.keyword)
				else
					tokens.obsolete_keyword.process (Current)
				end
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
		end

	process_class_type (a_type: ET_CLASS_TYPE)
			-- Process `a_type'.
		do
			if attached a_type.type_mark as l_type_mark then
				if not l_type_mark.is_implicit_mark then
					process_type_mark (l_type_mark)
					print_space
				end
			end
			process_name_of_named_class (a_type.name, a_type.named_base_class)
			if not attached a_type.actual_parameters as l_actual_parameters or else not attached l_actual_parameters.folded_actual_parameters as l_folded_actual_parameters then
				-- Do nothing.
			elseif l_folded_actual_parameters.is_empty then
					-- Do not print empty brackets, but keep the comments if any.
				comment_finder.find_comments (l_folded_actual_parameters, comment_list)
			elseif attached {ET_ACTUAL_PARAMETER_LIST} l_folded_actual_parameters as l_folded_actual_parameter_list then
				print_space
				process_actual_parameter_list_in_base_type (l_folded_actual_parameter_list, a_type)
			else
				print_space
				l_folded_actual_parameters.process (Current)
			end
		end

	process_clients (a_list: ET_CLIENTS)
			-- Process `a_list'.
		local
			i, nb: INTEGER
			l_item: ET_CLIENT_ITEM
			l_client: ET_CLIENT
			l_client_name: ET_CLASS_NAME
		do
			a_list.left_brace.process (Current)
			nb := a_list.count
			from i := 1 until i > nb loop
				l_item := a_list.item (i)
				l_client := l_item.client
				l_client_name := l_client.name
				process_name_of_client (l_client_name, l_client.named_base_class)
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

	process_colon_type (a_type: ET_COLON_TYPE)
			-- Process `a_type'.
		do
			a_type.colon.process (Current)
			print_space
			process_type (a_type.type)
		end

	process_comments
			-- Process comments that have not been printed yet.
			-- Print comments in `comment_list' on their own line (go to
			-- next line if necessary), with an extra indentation level.
			-- Comments are followed by a new-line. Then wipe out the list.
			-- Do not print the comments if `comments_ignored' is True.
		do
			if not comments_ignored then
				print_indented_comments (comment_list)
			end
			comment_list.wipe_out
		ensure
			no_more_comments: comment_list.is_empty
		end

	process_comments_on_same_line
			-- Process comments that have not been printed yet.
			-- If `comment_list' is not empty, then print a space followed by
			-- the first comment on the current line. The remaining comments
			-- are printed on their own line, with an extra indentation level.
			-- Comments are followed by a new-line. Then wipe out the list.
			-- Do not print the comments if `comments_ignored' is True.
		do
			if not comments_ignored then
				print_comments_on_same_line (comment_list)
			end
			comment_list.wipe_out
		ensure
			no_more_comments: comment_list.is_empty
		end

	process_compound (a_list: ET_COMPOUND)
			-- Process `a_list'.
		do
			a_list.keyword.process (Current)
			indent
			process_instruction_list (a_list)
			dedent
		end

	process_constant_attribute (a_feature: ET_CONSTANT_ATTRIBUTE)
			-- Process `a_feature'.
		do
			process_feature_synonyms (a_feature)
			process_query_type (a_feature)
			process_query_assigner (a_feature)
			print_space
			if use_is_keyword then
				if attached {ET_KEYWORD} a_feature.is_keyword as l_is_keyword then
					l_is_keyword.process (Current)
				else
					tokens.is_keyword.process (Current)
					process_break (a_feature.is_keyword.break)
				end
			else
				tokens.equal_symbol.process (Current)
				process_break (a_feature.is_keyword.break)
			end
			print_space
			a_feature.constant.process (Current)
			process_feature_semicolon (a_feature)
				-- Print header comment.
			indent
			process_comments
			dedent
		end

	process_constrained_formal_parameter (a_parameter: ET_CONSTRAINED_FORMAL_PARAMETER)
			-- Process `a_parameter'.
		local
			i, nb: INTEGER
			l_item: ET_FEATURE_NAME_ITEM
			l_feature_name: ET_FEATURE_NAME
		do
			if use_as_type then
				process_formal_parameter_type (a_parameter)
			else
				if attached a_parameter.type_mark as l_type_mark then
					process_type_mark (l_type_mark)
					print_space
				end
				process_name_of_formal_parameter (a_parameter)
				print_space
				a_parameter.arrow_symbol.process (Current)
				print_space
				a_parameter.constraint.process (Current)
				if attached a_parameter.creation_procedures as l_creation_procedures then
					print_space
					l_creation_procedures.create_keyword.process (Current)
					print_space
					nb := l_creation_procedures.count
					from i := 1 until i > nb loop
						l_item := l_creation_procedures.item (i)
						l_feature_name := l_item.feature_name
						set_target_type_with_seeded_feature (a_parameter, l_feature_name.seed)
						process_feature_name_in_constraint_creator (l_feature_name, l_creation_procedures)
						set_target_type (Void)
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
					l_creation_procedures.end_keyword.process (Current)
				end
			end
		end

	process_constraint_creator (a_list: ET_CONSTRAINT_CREATOR)
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
				process_feature_name_in_constraint_creator (l_feature_name, a_list)
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

	process_constraint_rename (a_rename: ET_RENAME)
			-- Process `a_rename'.
		require
			a_rename_not_void: a_rename /= Void
		do
			process_unqualified_feature_name (a_rename.old_name)
			print_space
			a_rename.as_keyword.process (Current)
			print_space
			a_rename.new_name.process (Current)
		end

	process_constraint_rename_list (a_list: ET_CONSTRAINT_RENAME_LIST)
			-- Process `a_list'.
		local
			i, nb: INTEGER
			l_item: ET_RENAME_ITEM
			l_rename: ET_RENAME
		do
			a_list.rename_keyword.process (Current)
			print_space
			nb := a_list.count
			from i := 1 until i > nb loop
				l_item := a_list.item (i)
				l_rename := l_item.rename_pair
				process_constraint_rename (l_rename)
				if i /= nb then
						-- The AST may or may not contain the comma.
						-- So we have to print it explicitly here.
					tokens.comma_symbol.process (Current)
				end
				comment_finder.add_excluded_node (l_rename.old_name)
				comment_finder.add_excluded_node (l_rename.as_keyword)
				comment_finder.add_excluded_node (l_rename.new_name)
				comment_finder.find_comments (l_item, comment_list)
				comment_finder.reset_excluded_nodes
				print_space
				i := i + 1
			end
			a_list.end_keyword.process (Current)
		end

	process_convert_feature_list (a_list: ET_CONVERT_FEATURE_LIST)
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

	process_convert_function (a_convert_function: ET_CONVERT_FUNCTION)
			-- Process `a_convert_function'.
		do
			set_current_target
			process_unqualified_feature_name (a_convert_function.name)
			set_target (Void)
			a_convert_function.colon.process (Current)
			print_space
			a_convert_function.types.process (Current)
		end

	process_convert_procedure (a_convert_procedure: ET_CONVERT_PROCEDURE)
			-- Process `a_convert_procedure'.
		do
			set_current_target
			process_unqualified_feature_name (a_convert_procedure.name)
			set_target (Void)
			print_space
			a_convert_procedure.left_parenthesis.process (Current)
			a_convert_procedure.types.process (Current)
			a_convert_procedure.right_parenthesis.process (Current)
		end

	process_create_expression (an_expression: ET_CREATE_EXPRESSION)
			-- Process `an_expression'.
		local
			l_creation_type: ET_TARGET_TYPE
			l_type: ET_TYPE
		do
			an_expression.create_keyword.process (Current)
			print_space
			if attached an_expression.creation_region as l_creation_region then
				process_creation_region (l_creation_region)
				print_space
			end
			l_creation_type := an_expression.creation_type
			l_type := l_creation_type.type
			tokens.left_brace_symbol.process (Current)
			process_type (l_type)
			tokens.right_brace_symbol.process (Current)
			comment_finder.add_excluded_node (l_type)
			comment_finder.find_comments (l_creation_type, comment_list)
			comment_finder.reset_excluded_nodes
			if attached an_expression.creation_call as l_creation_call then
				set_target_type_with_seeded_feature (l_type, l_creation_call.name.seed)
				process_creation_call (l_creation_call)
				set_target_type (Void)
			end
		end

	process_create_instruction (an_instruction: ET_CREATE_INSTRUCTION)
			-- Process `an_instruction'.
		local
			l_type: detachable ET_TYPE
		do
			an_instruction.create_keyword.process (Current)
			print_space
			if attached an_instruction.creation_region as l_creation_region then
				process_creation_region (l_creation_region)
				print_space
			end
			if attached an_instruction.creation_type as l_creation_type then
				l_type := l_creation_type.type
				tokens.left_brace_symbol.process (Current)
				process_type (l_type)
				tokens.right_brace_symbol.process (Current)
				comment_finder.add_excluded_node (l_type)
				comment_finder.find_comments (l_creation_type, comment_list)
				comment_finder.reset_excluded_nodes
				print_space
			end
			process_writable (an_instruction.target)
			if attached an_instruction.creation_call as l_creation_call then
				if l_type /= Void then
					set_target_type_with_seeded_feature (l_type, l_creation_call.name.seed)
				else
					set_target_with_seeded_feature (an_instruction.target, l_creation_call.name.seed)
				end
				process_creation_call (l_creation_call)
				set_target_type (Void)
			end
		end

	process_creation_call (a_call: ET_CREATION_CALL)
			-- Process `a_call'.
		require
			a_call_not_void: a_call /= Void
		local
			l_qualified_feature_name: ET_QUALIFIED_FEATURE_NAME
			l_feature_name: ET_FEATURE_NAME
		do
				-- The AST may or may not contain the dot.
				-- So we have to print them explicitly here.
			tokens.dot_symbol.process (Current)
			l_feature_name := a_call.name
			process_feature_name_in_creation_call (l_feature_name, a_call)
			if attached {ET_QUALIFIED_CALL} a_call as l_qualified_call then
				l_qualified_feature_name := l_qualified_call.qualified_name
				comment_finder.add_excluded_node (l_feature_name)
				comment_finder.find_comments (l_qualified_feature_name, comment_list)
				comment_finder.reset_excluded_nodes
			end
			if attached a_call.arguments as l_arguments then
				if l_arguments.is_empty then
						-- Do not print empty parentheses, but keep the comments if any.
					comment_finder.find_comments (l_arguments, comment_list)
				else
					print_space
					l_arguments.process (Current)
				end
			end
		end

	process_creation_region (a_region: ET_CREATION_REGION)
			-- Process `a_region'.
		local
			l_class_name: ET_CLASS_NAME
		do
			tokens.less_than_symbol.process (Current)
			l_class_name := a_region.class_name
			process_class_name_in_creation_region (l_class_name, a_region)
			tokens.greater_than_symbol.process (Current)
			comment_finder.add_excluded_node (l_class_name)
			comment_finder.find_comments (a_region, comment_list)
			comment_finder.reset_excluded_nodes
		end

	process_creator (a_list: ET_CREATOR)
			-- Process `a_list'.
		local
			i, nb: INTEGER
			l_item: ET_FEATURE_NAME_ITEM
			l_feature_name: ET_FEATURE_NAME
		do
			a_list.create_keyword.process (Current)
			if attached a_list.clients_clause as l_clients then
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
				set_current_target
				process_feature_name_in_creator (l_feature_name, a_list)
				set_target (Void)
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

	process_creator_list (a_list: ET_CREATOR_LIST)
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

	process_current (a_current: ET_CURRENT)
			-- Process `a_current'.
		do
			print_current (a_current)
		end

	process_current_address (an_expression: ET_CURRENT_ADDRESS)
			-- Process `an_expression`.
		do
			an_expression.dollar.process (Current)
			process_current_in_current_address (an_expression.current_keyword, an_expression)
		end

	process_current_in_current_address (a_current: ET_CURRENT; a_expression: ET_CURRENT_ADDRESS)
			-- Process `a_current' when it appears in `a_expression`.
		require
			a_current_not_void: a_current /= Void
			a_expression_not_void: a_expression /= Void
			valid_current: a_current = a_expression.current_keyword
		do
			process_current (a_current)
		end

	process_current_in_like_current (a_current: ET_CURRENT; a_type: ET_LIKE_CURRENT)
			-- Process `a_current' when it appears in `a_type`.
		require
			a_current_not_void: a_current /= Void
			a_type_not_void: a_type /= Void
			valid_current: a_current = a_type.current_keyword
		do
			process_current (a_current)
		end

	process_custom_attribute (an_attribute: ET_CUSTOM_ATTRIBUTE)
			-- Process `an_attribute'.
		do
			an_attribute.creation_expression.process (Current)
			print_space
			if attached an_attribute.settings as l_settings then
				l_settings.process (Current)
				print_space
			end
			an_attribute.end_keyword.process (Current)
		end

	process_debug_instruction (an_instruction: ET_DEBUG_INSTRUCTION)
			-- Process `an_instruction'.
		local
			l_compound: detachable ET_COMPOUND
		do
			l_compound := an_instruction.compound
			if l_compound /= Void then
				l_compound.keyword.process (Current)
			else
				tokens.debug_keyword.process (Current)
			end
			if attached an_instruction.keys as l_keys then
				if l_keys.is_empty then
						-- Do not print empty parentheses, but keep the comments if any.
					comment_finder.find_comments (l_keys, comment_list)
				else
					print_space
					l_keys.process (Current)
				end
			end
			if l_compound /= Void then
				indent
				process_instruction_list (l_compound)
				dedent
			else
				process_comments
			end
			print_new_line
			an_instruction.end_keyword.process (Current)
		end

	process_deferred_function (a_feature: ET_DEFERRED_FUNCTION)
			-- Process `a_feature'.
		do
			process_feature_synonyms (a_feature)
			process_feature_arguments (a_feature)
			process_query_type (a_feature)
			process_query_assigner (a_feature)
			process_routine_is_keyword (a_feature)
			indent
			process_comments
			print_new_line
			process_feature_note (a_feature)
			process_feature_obsolete_message (a_feature)
			process_feature_preconditions (a_feature)
			a_feature.deferred_keyword.process (Current)
			process_comments
			print_new_line
			process_feature_postconditions (a_feature)
			a_feature.end_keyword.process (Current)
			process_feature_semicolon (a_feature)
			dedent
		end

	process_deferred_procedure (a_feature: ET_DEFERRED_PROCEDURE)
			-- Process `a_feature'.
		do
			process_feature_synonyms (a_feature)
			process_feature_arguments (a_feature)
			process_routine_is_keyword (a_feature)
			indent
			process_comments
			print_new_line
			process_feature_note (a_feature)
			process_feature_obsolete_message (a_feature)
			process_feature_preconditions (a_feature)
			a_feature.deferred_keyword.process (Current)
			process_comments
			print_new_line
			process_feature_postconditions (a_feature)
			a_feature.end_keyword.process (Current)
			process_feature_semicolon (a_feature)
			dedent
		end

	process_do_function (a_feature: ET_DO_FUNCTION)
			-- Process `a_feature'.
		do
			process_feature_synonyms (a_feature)
			process_feature_arguments (a_feature)
			process_query_type (a_feature)
			process_query_assigner (a_feature)
			process_routine_is_keyword (a_feature)
			indent
			process_comments
			print_new_line
			process_feature_note (a_feature)
			process_feature_obsolete_message (a_feature)
			process_feature_preconditions (a_feature)
			process_internal_feature_locals (a_feature)
			process_do_routine_compound (a_feature)
			process_feature_postconditions (a_feature)
			process_internal_feature_rescue_clause (a_feature)
			a_feature.end_keyword.process (Current)
			process_feature_semicolon (a_feature)
			dedent
		end

	process_do_function_inline_agent (an_expression: ET_DO_FUNCTION_INLINE_AGENT)
			-- Process `an_expression'.
		do
			process_do_function_inline_agent_declaration (an_expression)
			process_agent_arguments (an_expression)
		end

	process_do_function_inline_agent_declaration (an_expression: ET_DO_FUNCTION_INLINE_AGENT)
			-- Process declaration of inline agent `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		do
			an_expression.agent_keyword.process (Current)
			print_space
			process_feature_arguments (an_expression)
			process_query_type (an_expression)
			process_comments
			print_new_line
			process_feature_preconditions (an_expression)
			process_internal_feature_locals (an_expression)
			process_do_routine_compound (an_expression)
			process_feature_postconditions (an_expression)
			process_internal_feature_rescue_clause (an_expression)
			an_expression.end_keyword.process (Current)
		end

	process_do_procedure (a_feature: ET_DO_PROCEDURE)
			-- Process `a_feature'.
		do
			process_feature_synonyms (a_feature)
			process_feature_arguments (a_feature)
			process_routine_is_keyword (a_feature)
			indent
			process_comments
			print_new_line
			process_feature_note (a_feature)
			process_feature_obsolete_message (a_feature)
			process_feature_preconditions (a_feature)
			process_internal_feature_locals (a_feature)
			process_do_routine_compound (a_feature)
			process_feature_postconditions (a_feature)
			process_internal_feature_rescue_clause (a_feature)
			a_feature.end_keyword.process (Current)
			process_feature_semicolon (a_feature)
			dedent
		end

	process_do_procedure_inline_agent (an_expression: ET_DO_PROCEDURE_INLINE_AGENT)
			-- Process `an_expression'.
		do
			process_do_procedure_inline_agent_declaration (an_expression)
			process_agent_arguments (an_expression)
		end

	process_do_procedure_inline_agent_declaration (an_expression: ET_DO_PROCEDURE_INLINE_AGENT)
			-- Process declaration of inline agent `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		do
			an_expression.agent_keyword.process (Current)
			print_space
			process_feature_arguments (an_expression)
			process_comments
			print_new_line
			process_feature_preconditions (an_expression)
			process_internal_feature_locals (an_expression)
			process_do_routine_compound (an_expression)
			process_feature_postconditions (an_expression)
			process_internal_feature_rescue_clause (an_expression)
			an_expression.end_keyword.process (Current)
		end

	process_do_routine_compound (a_routine: ET_INTERNAL_FEATURE_CLOSURE)
			-- Process compound of 'do' routine `a_routine`.
		require
			a_routine_not_void: a_routine /= Void
		do
			if attached a_routine.compound as l_compound then
				l_compound.process (Current)
			else
				tokens.do_keyword.process (Current)
			end
			process_comments
			print_new_line
		end

	process_dotnet_function (a_feature: ET_DOTNET_FUNCTION)
			-- Process `a_feature'.
		do
			process_feature_synonyms (a_feature)
			process_feature_arguments (a_feature)
			process_query_type (a_feature)
			process_query_assigner (a_feature)
			process_routine_is_keyword (a_feature)
			indent
			process_comments
			print_new_line
			tokens.do_keyword.process (Current)
			process_comments
			print_new_line
			a_feature.end_keyword.process (Current)
			process_feature_semicolon (a_feature)
			dedent
		end

	process_dotnet_procedure (a_feature: ET_DOTNET_PROCEDURE)
			-- Process `a_feature'.
		do
			process_feature_synonyms (a_feature)
			process_feature_arguments (a_feature)
			process_routine_is_keyword (a_feature)
			indent
			process_comments
			print_new_line
			tokens.do_keyword.process (Current)
			process_comments
			print_new_line
			a_feature.end_keyword.process (Current)
			process_feature_semicolon (a_feature)
			dedent
		end

	process_elseif_expression (an_elseif_part: ET_ELSEIF_EXPRESSION)
			-- Process `an_elseif_part'.
		local
			l_conditional: ET_CONDITIONAL
			l_expression: ET_EXPRESSION
		do
			l_conditional := an_elseif_part.conditional
			if attached {ET_KEYWORD_EXPRESSION} l_conditional as l_full_conditional then
				l_full_conditional.process (Current)
			else
				tokens.elseif_keyword.process (Current)
				print_space
				l_expression := l_conditional.expression
				l_expression.process (Current)
				comment_finder.add_excluded_node (l_expression)
				comment_finder.find_comments (l_conditional, comment_list)
				comment_finder.reset_excluded_nodes
			end
			print_space
			an_elseif_part.then_keyword.process (Current)
			print_space
			an_elseif_part.then_expression.process (Current)
		end

	process_elseif_expression_list (a_list: ET_ELSEIF_EXPRESSION_LIST)
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			nb := a_list.count
			from i := 1 until i > nb loop
				if i /= 1 then
					print_space
				end
				a_list.item (i).process (Current)
				process_comments
				i := i + 1
			end
		end

	process_elseif_part (an_elseif_part: ET_ELSEIF_PART)
			-- Process `an_elseif_part'.
		local
			l_conditional: ET_CONDITIONAL
			l_expression: ET_EXPRESSION
		do
			l_conditional := an_elseif_part.conditional
			if attached {ET_KEYWORD_EXPRESSION} l_conditional as l_full_conditional then
				l_full_conditional.process (Current)
			else
				tokens.elseif_keyword.process (Current)
				print_space
				l_expression := l_conditional.expression
				l_expression.process (Current)
				comment_finder.add_excluded_node (l_expression)
				comment_finder.find_comments (l_conditional, comment_list)
				comment_finder.reset_excluded_nodes
			end
			print_space
			if attached an_elseif_part.then_compound as l_then_compound then
				l_then_compound.process (Current)
			else
				tokens.then_keyword.process (Current)
			end
		end

	process_elseif_part_list (a_list: ET_ELSEIF_PART_LIST)
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

	process_equality_expression (an_expression: ET_EQUALITY_EXPRESSION)
			-- Process `an_expression'.
		do
			an_expression.left.process (Current)
			print_space
			an_expression.operator.process (Current)
			print_space
			an_expression.right.process (Current)
		end

	process_explicit_convert_from_expression (a_convert_expression: ET_EXPLICIT_CONVERT_FROM_EXPRESSION)
			-- Process `a_convert_expression'.
		local
			l_old_comments_ignored: BOOLEAN
			l_old_use_as_type: BOOLEAN
		do
			tokens.create_keyword.process (Current)
			print_space
			tokens.left_brace_symbol.process (Current)
			l_old_comments_ignored := comments_ignored
			set_comments_ignored (True)
			l_old_use_as_type := use_as_type
			set_use_as_type (True)
			process_type (a_convert_expression.type)
			set_comments_ignored (l_old_comments_ignored)
			set_use_as_type (l_old_use_as_type)
			tokens.right_brace_symbol.process (Current)
			tokens.dot_symbol.process (Current)
			set_target_type (a_convert_expression.type)
			process_feature_name_in_creation_call (a_convert_expression.name, a_convert_expression)
			set_target_type (Void)
			print_space
			tokens.left_parenthesis_symbol.process (Current)
			a_convert_expression.expression.process (Current)
			tokens.right_parenthesis_symbol.process (Current)
		end

	process_explicit_convert_to_expression (a_convert_expression: ET_EXPLICIT_CONVERT_TO_EXPRESSION)
			-- Process `a_convert_expression'.
		local
			l_need_parentheses: BOOLEAN
			l_expression: ET_EXPRESSION
		do
			l_expression := a_convert_expression.expression
			if
				not attached {ET_PARENTHESIZED_EXPRESSION} l_expression and
				not attached {ET_IDENTIFIER} l_expression and
				not attached {ET_UNQUALIFIED_CALL_EXPRESSION} l_expression and
				not attached {ET_QUALIFIED_CALL_EXPRESSION} l_expression and
				not attached {ET_BRACKET_EXPRESSION} l_expression
			then
				l_need_parentheses := True
			end
			if l_need_parentheses then
				tokens.left_parenthesis_symbol.process (Current)
			end
			l_expression.process (Current)
			if l_need_parentheses then
				tokens.right_parenthesis_symbol.process (Current)
			end
			tokens.dot_symbol.process (Current)
			set_target (l_expression)
			process_feature_name_in_qualified_call (a_convert_expression.name, a_convert_expression)
			set_target (Void)
		end

	process_export_list (a_list: ET_EXPORT_LIST)
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

	process_export_list_same_line (a_list: ET_EXPORT_LIST)
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

	process_extended_attribute (a_feature: ET_EXTENDED_ATTRIBUTE)
			-- Process `a_feature'.
		do
			process_feature_synonyms (a_feature)
			process_query_type (a_feature)
			process_query_assigner (a_feature)
			indent
			process_comments
			print_new_line
			process_feature_note (a_feature)
			process_feature_obsolete_message (a_feature)
			process_feature_preconditions (a_feature)
			process_internal_feature_locals (a_feature)
			if attached a_feature.compound as l_compound then
				l_compound.process (Current)
			else
				tokens.attribute_keyword.process (Current)
			end
			process_comments
			print_new_line
			process_feature_postconditions (a_feature)
			process_internal_feature_rescue_clause (a_feature)
			a_feature.end_keyword.process (Current)
			process_feature_semicolon (a_feature)
			dedent
		end

	process_extended_feature_name (a_extended_feature_name: ET_EXTENDED_FEATURE_NAME)
			-- Process `a_extended_feature_name'.
		local
			l_feature_name: ET_FEATURE_NAME
		do
			l_feature_name := a_extended_feature_name.feature_name
			l_feature_name.process (Current)
			comment_finder.add_excluded_node (l_feature_name)
			if attached a_extended_feature_name.alias_names as l_alias_names and then not l_alias_names.is_empty then
				print_space
				l_alias_names.process (Current)
				comment_finder.add_excluded_node (l_alias_names)
			end
			comment_finder.find_comments (a_extended_feature_name, comment_list)
			comment_finder.reset_excluded_nodes
		end

	process_external_function (a_feature: ET_EXTERNAL_FUNCTION)
			-- Process `a_feature'.
		do
			process_feature_synonyms (a_feature)
			process_feature_arguments (a_feature)
			process_query_type (a_feature)
			process_query_assigner (a_feature)
			process_routine_is_keyword (a_feature)
			indent
			process_comments
			print_new_line
			process_feature_note (a_feature)
			process_feature_obsolete_message (a_feature)
			process_feature_preconditions (a_feature)
			process_external_routine_body (a_feature)
			process_feature_postconditions (a_feature)
			a_feature.end_keyword.process (Current)
			process_feature_semicolon (a_feature)
			dedent
		end

	process_external_function_inline_agent (an_expression: ET_EXTERNAL_FUNCTION_INLINE_AGENT)
			-- Process `an_expression'.
		do
			process_external_function_inline_agent_declaration (an_expression)
			process_agent_arguments (an_expression)
		end

	process_external_function_inline_agent_declaration (an_expression: ET_EXTERNAL_FUNCTION_INLINE_AGENT)
			-- Process declaration of inline agent `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		do
			an_expression.agent_keyword.process (Current)
			print_space
			process_feature_arguments (an_expression)
			process_query_type (an_expression)
			process_comments
			print_new_line
			process_feature_preconditions (an_expression)
			process_external_routine_body (an_expression)
			process_feature_postconditions (an_expression)
			an_expression.end_keyword.process (Current)
		end

	process_external_keyword_in_class (a_external_keyword: ET_KEYWORD; a_class: ET_CLASS)
			-- Process `a_external_keyword` when it appears in `a_class`.
		require
			a_external_keyword_not_void: a_external_keyword /= Void
			a_class_not_void: a_class /= Void
			valid_external_keyword: a_external_keyword = a_class.external_keyword
		do
			a_external_keyword.process (Current)
		end

	process_external_procedure (a_feature: ET_EXTERNAL_PROCEDURE)
			-- Process `a_feature'.
		do
			process_feature_synonyms (a_feature)
			process_feature_arguments (a_feature)
			process_routine_is_keyword (a_feature)
			indent
			process_comments
			print_new_line
			process_feature_note (a_feature)
			process_feature_obsolete_message (a_feature)
			process_feature_preconditions (a_feature)
			process_external_routine_body (a_feature)
			process_feature_postconditions (a_feature)
			a_feature.end_keyword.process (Current)
			process_feature_semicolon (a_feature)
			dedent
		end

	process_external_procedure_inline_agent (an_expression: ET_EXTERNAL_PROCEDURE_INLINE_AGENT)
			-- Process `an_expression'.
		do
			process_external_procedure_inline_agent_declaration (an_expression)
			process_agent_arguments (an_expression)
		end

	process_external_procedure_inline_agent_declaration (an_expression: ET_EXTERNAL_PROCEDURE_INLINE_AGENT)
			-- Process declaration of inline agent `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		do
			an_expression.agent_keyword.process (Current)
			print_space
			process_feature_arguments (an_expression)
			process_comments
			print_new_line
			process_feature_preconditions (an_expression)
			process_external_routine_body (an_expression)
			process_feature_postconditions (an_expression)
			an_expression.end_keyword.process (Current)
		end

	process_external_routine_body (a_feature: ET_EXTERNAL_ROUTINE_CLOSURE)
			-- Process body of external routine `a_feature`.
		require
			a_feature_not_void: a_feature /= Void
		local
			l_external_language: ET_EXTERNAL_LANGUAGE
			l_manifest_string: ET_MANIFEST_STRING
		do
			l_external_language := a_feature.language
			if attached {ET_KEYWORD_MANIFEST_STRING} l_external_language as l_full_external_language then
				l_full_external_language.keyword.process (Current)
				comment_finder.add_excluded_node (l_full_external_language.keyword)
			else
				tokens.external_keyword.process (Current)
			end
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
			if attached a_feature.alias_clause as l_external_alias then
				if attached {ET_KEYWORD_MANIFEST_STRING} l_external_alias as l_full_external_alias then
					l_full_external_alias.keyword.process (Current)
					comment_finder.add_excluded_node (l_full_external_alias.keyword)
				else
					tokens.alias_keyword.process (Current)
				end
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
		end

	process_false_constant (a_constant: ET_FALSE_CONSTANT)
			-- Process `a_constant'.
		do
			print_false_constant (a_constant)
		end

	process_feature_address (an_expression: ET_FEATURE_ADDRESS)
			-- Process `an_expression'.
		do
			an_expression.dollar.process (Current)
			set_current_target
			process_feature_name_in_feature_address (an_expression.name, an_expression)
			set_target (Void)
		end

	process_feature_arguments (a_feature: ET_CLOSURE)
			-- Process arguments of `a_feature`.
		require
			a_feature_not_void: a_feature /= Void
		do
			if attached a_feature.arguments as l_arguments then
				if l_arguments.is_empty then
						-- Do not print empty parentheses, but keep the comments if any.
					comment_finder.find_comments (l_arguments, comment_list)
				else
					print_space
					l_arguments.process (Current)
				end
			end
		end

	process_feature_clause (a_feature_clause: ET_FEATURE_CLAUSE)
			-- Process `a_feature_clause'.
		do
			a_feature_clause.feature_keyword.process (Current)
			if attached a_feature_clause.clients_clause as l_clients then
				print_space
				l_clients.process (Current)
			end
			process_comments_on_same_line
		end

	process_feature_clause_list (a_list: ET_FEATURE_CLAUSE_LIST)
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

	process_feature_export (an_export: ET_FEATURE_EXPORT)
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
				set_current_target
				from i := 1 until i > nb loop
					process_comments
					print_new_line
					l_item := an_export.item (i)
					l_feature_name := l_item.feature_name
					process_feature_name_in_feature_export (l_feature_name, an_export)
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
				set_target (Void)
				dedent
			else
				comment_finder.find_comments (an_export, comment_list)
			end
		end

	process_feature_name (a_feature_name: ET_FEATURE_NAME)
			-- Process `a_feature_name'.
		require
			a_feature_name_not_void: a_feature_name /= Void
		do
			a_feature_name.process (Current)
		end

	process_feature_name_in_assigner (a_feature_name: ET_FEATURE_NAME; a_assigner: ET_ASSIGNER)
			-- Process `a_feature_name' when it appears in `a_assigner`.
		require
			a_feature_name_not_void: a_feature_name /= Void
			a_assigner_not_void: a_assigner /= Void
			valid_feature_name: a_feature_name = a_assigner.feature_name
		do
			process_feature_name (a_feature_name)
		end

	process_feature_name_in_call_agent (a_feature_name: ET_FEATURE_NAME; a_agent: ET_CALL_AGENT)
			-- Process `a_feature_name' when it appears in `a_agent`.
		require
			a_feature_name_not_void: a_feature_name /= Void
			a_agent_not_void: a_agent /= Void
			valid_feature_name: a_feature_name = a_agent.name
		do
			process_feature_name (a_feature_name)
		end

	process_feature_name_in_constraint_creator (a_feature_name: ET_FEATURE_NAME; a_creator: ET_CONSTRAINT_CREATOR)
			-- Process `a_feature_name' when it appears in `a_creator`.
		require
			a_feature_name_not_void: a_feature_name /= Void
			a_creator_not_void: a_creator /= Void
			valid_feature_name: a_creator.has_feature_name (a_feature_name)
		do
			process_feature_name (a_feature_name)
		end

	process_feature_name_in_creation_call (a_feature_name: ET_FEATURE_NAME; a_call: ET_CREATION_CALL)
			-- Process `a_feature_name' when it appears in `a_call`.
		require
			a_feature_name_not_void: a_feature_name /= Void
			a_call_not_void: a_call /= Void
			valid_feature_name: a_feature_name = a_call.name
		do
			process_feature_name (a_feature_name)
		end

	process_feature_name_in_creator (a_feature_name: ET_FEATURE_NAME; a_creator: ET_CREATOR)
			-- Process `a_feature_name' when it appears in `a_creator`.
		require
			a_feature_name_not_void: a_feature_name /= Void
			a_creator_not_void: a_creator /= Void
			valid_feature_name: a_creator.has_feature_name (a_feature_name)
		do
			process_feature_name (a_feature_name)
		end

	process_feature_name_in_feature_address (a_feature_name: ET_FEATURE_NAME; a_feature_address: ET_FEATURE_ADDRESS)
			-- Process `a_feature_name' when it appears in `a_feature_address`.
		require
			a_feature_name_not_void: a_feature_name /= Void
			a_feature_address_not_void: a_feature_address /= Void
			valid_feature_name: a_feature_name = a_feature_address.name
		do
			process_feature_name (a_feature_name)
		end

	process_feature_name_in_feature_export (a_feature_name: ET_FEATURE_NAME; a_export: ET_FEATURE_EXPORT)
			-- Process `a_feature_name' when it appears in `a_export`.
		require
			a_feature_name_not_void: a_feature_name /= Void
			a_export_not_void: a_export /= Void
			valid_feature_name: a_export.has_feature_name (a_feature_name)
		do
			process_feature_name (a_feature_name)
		end

	process_feature_name_in_like_feature (a_feature_name: ET_FEATURE_NAME; a_type: ET_LIKE_FEATURE)
			-- Process `a_feature_name' when it appears in `a_type`.
		require
			a_feature_name_not_void: a_feature_name /= Void
			a_type_not_void: a_type /= Void
			valid_feature_name: a_feature_name = a_type.name
		do
			process_feature_name (a_feature_name)
		end

	process_feature_name_in_old_rename (a_feature_name: ET_FEATURE_NAME; a_rename: ET_RENAME)
			-- Process `a_feature_name' when it appears in `a_rename`.
		require
			a_feature_name_not_void: a_feature_name /= Void
			a_rename_not_void: a_rename /= Void
			valid_feature_name: a_feature_name = a_rename.old_name
		do
			process_feature_name (a_feature_name)
		end

	process_feature_name_in_parent_clause (a_feature_name: ET_FEATURE_NAME)
			-- Process `a_feature_name' when it appears in undefine/redefine/select
			-- of a parent clause.
		require
			a_feature_name_not_void: a_feature_name /= Void
		do
			process_feature_name (a_feature_name)
		end

	process_feature_name_in_qualified_call (a_feature_name: ET_FEATURE_NAME; a_call: ET_QUALIFIED_FEATURE_CALL)
			-- Process `a_feature_name' when it appears in `a_call`.
		require
			a_feature_name_not_void: a_feature_name /= Void
			a_call_not_void: a_call /= Void
			valid_feature_name: a_feature_name = a_call.name
		do
			process_feature_name (a_feature_name)
		end

	process_feature_name_in_qualified_like_identifier (a_feature_name: ET_FEATURE_NAME; a_type: ET_QUALIFIED_LIKE_IDENTIFIER)
			-- Process `a_feature_name' when it appears in `a_type`.
		require
			a_feature_name_not_void: a_feature_name /= Void
			a_type_not_void: a_type /= Void
			valid_feature_name: a_feature_name = a_type.name
		do
			process_feature_name (a_feature_name)
		end

	process_feature_name_in_static_call (a_feature_name: ET_FEATURE_NAME; a_call: ET_STATIC_FEATURE_CALL)
			-- Process `a_feature_name' when it appears in `a_call`.
		require
			a_feature_name_not_void: a_feature_name /= Void
			a_call_not_void: a_call /= Void
			valid_feature_name: a_feature_name = a_call.name
		do
			process_feature_name (a_feature_name)
		end

	process_feature_name_in_unqualified_call (a_feature_name: ET_FEATURE_NAME; a_call: ET_UNQUALIFIED_FEATURE_CALL)
			-- Process `a_feature_name' when it appears in `a_call`.
		require
			a_feature_name_not_void: a_feature_name /= Void
			a_call_not_void: a_call /= Void
			valid_feature_name: a_feature_name = a_call.name
		do
			process_feature_name (a_feature_name)
		end

	process_feature_name_in_writable (a_feature_name: ET_FEATURE_NAME)
			-- Process `a_feature_name' when it appears in a writable.
		require
			a_feature_name_not_void: a_feature_name /= Void
		do
			process_feature_name (a_feature_name)
		end

	process_feature_note (a_feature: ET_FEATURE)
			-- Process note of `a_feature`.
		require
			a_feature_not_void: a_feature /= Void
		do
			if attached a_feature.first_note as l_note then
				process_note_clause (l_note, False)
				process_comments
				print_new_line
			end
		end

	process_feature_obsolete_message (a_feature: ET_FEATURE)
			-- Process obsolete message of `a_feature`.
		require
			a_feature_not_void: a_feature /= Void
		local
			l_obsolete_string: ET_MANIFEST_STRING
		do
			if attached a_feature.obsolete_message as l_obsolete_message then
				if attached {ET_KEYWORD_MANIFEST_STRING} l_obsolete_message as l_full_obsolete_message then
					l_full_obsolete_message.keyword.process (Current)
					comment_finder.add_excluded_node (l_full_obsolete_message.keyword)
				else
					tokens.obsolete_keyword.process (Current)
				end
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
		end

	process_feature_postconditions (a_feature: ET_CLOSURE)
			-- Process postconditions of `a_feature`.
		require
			a_feature_not_void: a_feature /= Void
		do
			if attached a_feature.postconditions as l_postconditions then
				l_postconditions.process (Current)
				process_comments
			end
		end

	process_feature_preconditions (a_feature: ET_CLOSURE)
			-- Process preconditions of `a_feature`.
		require
			a_feature_not_void: a_feature /= Void
		do
			if attached a_feature.preconditions as l_preconditions then
				l_preconditions.process (Current)
				process_comments
			end
		end

	process_feature_semicolon (a_feature: ET_FEATURE)
			-- Process semicolon of `a_feature`.
		require
			a_feature_not_void: a_feature /= Void
		do
			if attached a_feature.semicolon as l_semicolon then
					-- Do not print the semicolon, but keep track of its comments if any.
				comment_finder.find_comments (l_semicolon, comment_list)
			end
		end

	process_feature_synonyms (a_feature: ET_FEATURE)
			-- Process names of synonyms of `a_feature`.
		require
			a_feature_not_void: a_feature /= Void
		local
			l_synonym: ET_FEATURE
		do
			from
				l_synonym := a_feature
			until
				l_synonym = Void
			loop
				if attached l_synonym.frozen_keyword as l_frozen_keyword then
					l_frozen_keyword.process (Current)
					print_space
				end
				process_extended_feature_name_of_feature (l_synonym)
				l_synonym := l_synonym.synonym
				if l_synonym /= Void then
						-- The AST may or may not contain the comma.
						-- So we have to print it explicitly here.
					tokens.comma_symbol.process (Current)
					print_space
				end
			end
		end

	process_features (a_class: ET_CLASS)
			-- Process feature clauses of `a_class'.
		local
			a_feature_clause: ET_FEATURE_CLAUSE
			l_queries: ET_QUERY_LIST
			l_query: detachable ET_QUERY
			l_procedures: ET_PROCEDURE_LIST
			l_procedure: detachable ET_PROCEDURE
			i, nb: INTEGER
			j, nb_queries: INTEGER
			k, nb_procedures: INTEGER
		do
			if attached a_class.feature_clauses as a_feature_clauses then
				j := 1
				l_queries := a_class.queries
				nb_queries := l_queries.declared_count
				k := 1
				l_procedures := a_class.procedures
				nb_procedures := l_procedures.declared_count
				nb := a_feature_clauses.count
				from i := 1 until i > nb loop
					a_feature_clause := a_feature_clauses.item (i)
					a_feature_clause.process (Current)
					process_comments
					print_new_line
					print_new_line
					from
						if j <= nb_queries then
							l_query := l_queries.item (j)
							if l_query.feature_clause /= a_feature_clause then
								l_query := Void
							end
						end
						if k <= nb_procedures then
							l_procedure := l_procedures.item (k)
							if l_procedure.feature_clause /= a_feature_clause then
								l_procedure := Void
							end
						end
					until
						l_query = Void and l_procedure = Void
					loop
						indent
						if l_query /= Void and then (l_procedure = Void or else (l_query.name.position < l_procedure.name.position)) then
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
								if l_query.feature_clause /= a_feature_clause then
									l_query := Void
								end
							else
								l_query := Void
							end
						elseif l_procedure /= Void then
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
								if l_procedure.feature_clause /= a_feature_clause then
									l_procedure := Void
								end
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

	process_formal_argument (an_argument: ET_FORMAL_ARGUMENT)
			-- Process `an_argument'.
		local
			l_name_item: ET_ARGUMENT_NAME
			l_name: ET_IDENTIFIER
			l_declared_type: ET_DECLARED_TYPE
			l_type: ET_TYPE
		do
			l_name_item := an_argument.name_item
			l_name := l_name_item.identifier
			process_argument_name (l_name, True)
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
			process_type (l_type)
		end

	process_formal_argument_list (a_list: ET_FORMAL_ARGUMENT_LIST)
			-- Process `a_list'.
		local
			i, nb: INTEGER
			l_item: ET_FORMAL_ARGUMENT_ITEM
			l_formal_argument: ET_FORMAL_ARGUMENT
			l_name: ET_IDENTIFIER
			l_type: ET_TYPE
		do
			a_list.left_parenthesis.process (Current)
			if attached a_list.first_semicolon as l_first_semicolon then
				comment_finder.find_comments (l_first_semicolon, comment_list)
			end
			nb := a_list.count
			from i := 1 until i > nb loop
				l_item := a_list.item (i)
				l_formal_argument := l_item.formal_argument
				l_name := l_formal_argument.name
				process_argument_name (l_name, True)
				if l_item.is_last_entity or i = nb then
					tokens.colon_symbol.process (Current)
					print_space
					l_type := l_formal_argument.type
					process_type (l_type)
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

	process_formal_comma_argument (an_argument: ET_FORMAL_COMMA_ARGUMENT)
			-- Process `an_argument'.
		local
			l_name_item: ET_ARGUMENT_NAME
			l_name: ET_IDENTIFIER
		do
			l_name_item := an_argument.name_item
			l_name := l_name_item.identifier
			process_argument_name (l_name, True)
			comment_finder.add_excluded_node (l_name)
			comment_finder.find_comments (l_name_item, comment_list)
			comment_finder.reset_excluded_nodes
				-- The AST may or may not contain the comma.
				-- So we have to print it explicitly here.
			tokens.comma_symbol.process (Current)
		end

	process_formal_parameter (a_parameter: ET_FORMAL_PARAMETER)
			-- Process `a_parameter'.
		do
			if use_as_type then
				process_formal_parameter_type (a_parameter)
			else
				if attached a_parameter.type_mark as l_type_mark then
					process_type_mark (l_type_mark)
					print_space
				end
				process_name_of_formal_parameter (a_parameter)
			end
		end

	process_formal_parameter_list (a_list: ET_FORMAL_PARAMETER_LIST)
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

	process_formal_parameter_type (a_type: ET_FORMAL_PARAMETER_TYPE)
			-- Process `a_type'.
		do
			if attached a_type.type_mark as l_type_mark then
				if not l_type_mark.is_implicit_mark then
					process_type_mark (l_type_mark)
					print_space
				end
			end
			process_name_of_formal_parameter_type (a_type)
		end

	process_hexadecimal_integer_constant (a_constant: ET_HEXADECIMAL_INTEGER_CONSTANT)
			-- Process `a_constant'.
		do
			process_integer_constant (a_constant)
		end

	process_identifier (a_identifier: ET_IDENTIFIER)
			-- Process `a_identifier'.
		do
			if a_identifier.is_local then
				process_local_name (a_identifier, False)
			elseif a_identifier.is_argument then
				process_argument_name (a_identifier, False)
			elseif a_identifier.is_object_test_local then
				process_object_test_local_name (a_identifier, False)
			elseif a_identifier.is_iteration_item then
				process_iteration_item_name (a_identifier, False)
			elseif a_identifier.is_inline_separate_argument then
				process_inline_separate_argument_name (a_identifier, False)
			elseif a_identifier.is_tuple_label then
				process_tuple_label (a_identifier)
			elseif a_identifier.is_feature_name then
				print_feature_name (a_identifier)
			else
				precursor (a_identifier)
			end
		end

	process_if_expression (a_expression: ET_IF_EXPRESSION)
			-- Process `a_expression'.
		local
			l_conditional: ET_CONDITIONAL
			l_expression: ET_EXPRESSION
		do
			l_conditional := a_expression.conditional
			if attached {ET_KEYWORD_EXPRESSION} l_conditional as l_full_conditional then
				l_full_conditional.process (Current)
			else
				tokens.if_keyword.process (Current)
				print_space
				l_expression := a_expression.conditional_expression
				l_expression.process (Current)
				comment_finder.add_excluded_node (l_expression)
				comment_finder.find_comments (l_conditional, comment_list)
				comment_finder.reset_excluded_nodes
			end
			print_space
			a_expression.then_keyword.process (Current)
			print_space
			a_expression.then_expression.process (Current)
			if attached a_expression.elseif_parts as l_elseif_parts then
				process_comments
				print_space
				l_elseif_parts.process (Current)
			end
			process_comments
			print_space
			a_expression.else_keyword.process (Current)
			print_space
			a_expression.else_expression.process (Current)
			process_comments
			print_space
			a_expression.end_keyword.process (Current)
		end

	process_if_instruction (an_instruction: ET_IF_INSTRUCTION)
			-- Process `an_instruction'.
		local
			l_conditional: ET_CONDITIONAL
			l_expression: ET_EXPRESSION
		do
			l_conditional := an_instruction.conditional
			if attached {ET_KEYWORD_EXPRESSION} l_conditional as l_full_conditional then
				l_full_conditional.process (Current)
			else
				tokens.if_keyword.process (Current)
				print_space
				l_expression := l_conditional.expression
				l_expression.process (Current)
				comment_finder.add_excluded_node (l_expression)
				comment_finder.find_comments (l_conditional, comment_list)
				comment_finder.reset_excluded_nodes
			end
			print_space
			if attached an_instruction.then_compound as l_then_compound then
				l_then_compound.process (Current)
			else
				tokens.then_keyword.process (Current)
			end
			if attached an_instruction.elseif_parts as l_elseif_parts then
				process_comments
				print_new_line
				l_elseif_parts.process (Current)
			end
			if attached an_instruction.else_compound as l_else_compound then
				process_comments
				print_new_line
				l_else_compound.process (Current)
			end
			process_comments
			print_new_line
			an_instruction.end_keyword.process (Current)
		end

	process_infix_and_then_operator (an_operator: ET_INFIX_AND_THEN_OPERATOR)
			-- Process `an_operator'.
		do
			an_operator.and_keyword.process (Current)
			print_space
			an_operator.then_keyword.process (Current)
		end

	process_infix_expression (an_expression: ET_INFIX_EXPRESSION)
			-- Process `an_expression'.
		local
			l_target: ET_EXPRESSION
			l_operator: ET_OPERATOR
		do
			l_target := an_expression.left
			l_target.process (Current)
			print_space
			l_operator := an_expression.name
			set_target_with_seeded_feature (l_target, l_operator.seed)
			process_operator (l_operator)
			set_target (Void)
			print_space
			an_expression.right.process (Current)
		end

	process_infix_or_else_operator (an_operator: ET_INFIX_OR_ELSE_OPERATOR)
			-- Process `an_operator'.
		do
			an_operator.or_keyword.process (Current)
			print_space
			an_operator.else_keyword.process (Current)
		end

	process_inline_separate_argument (a_argument: ET_INLINE_SEPARATE_ARGUMENT)
			-- Process `a_argument'.
		do
			a_argument.expression.process (Current)
			print_space
			a_argument.as_keyword.process (Current)
			print_space
			process_inline_separate_argument_name (a_argument.name, True)
		end

	process_inline_separate_argument_comma (a_argument_comma: ET_INLINE_SEPARATE_ARGUMENT_COMMA)
			-- Process `a_argument_comma'.
		do
			process_inline_separate_argument (a_argument_comma.argument)
			a_argument_comma.comma.process (Current)
		end

	process_inline_separate_argument_name (a_identifier: ET_IDENTIFIER; a_is_declaration: BOOLEAN)
			-- Process `a_identifier'.
		require
			a_identifier_not_void: a_identifier /= Void
			a_identifier_is_inline_separate_argument: a_identifier.is_inline_separate_argument
		do
			print_local_name (a_identifier)
		end

	process_inline_separate_arguments (a_arguments: ET_INLINE_SEPARATE_ARGUMENTS)
			-- Process `a_arguments'.
		local
			i, nb: INTEGER
			l_item: ET_INLINE_SEPARATE_ARGUMENT_ITEM
			l_argument: ET_INLINE_SEPARATE_ARGUMENT
		do
			a_arguments.separate_keyword.process (Current)
			nb := a_arguments.count
			inspect nb
			when 0 then
				print_space
			when 1 then
				print_space
				l_item := a_arguments.item (1)
				l_argument := l_item.argument
				process_inline_separate_argument (l_argument)
				comment_finder.add_excluded_node (l_argument.expression)
				comment_finder.add_excluded_node (l_argument.as_keyword)
				comment_finder.add_excluded_node (l_argument.name)
				comment_finder.find_comments (l_item, comment_list)
				comment_finder.reset_excluded_nodes
				print_space
			else
				indent
				from i := 1 until i > nb loop
					process_comments
					print_new_line
					l_item := a_arguments.item (i)
					l_argument := l_item.argument
					process_inline_separate_argument (l_argument)
					comment_finder.add_excluded_node (l_argument.expression)
					comment_finder.add_excluded_node (l_argument.as_keyword)
					comment_finder.add_excluded_node (l_argument.name)
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
				process_comments
				print_new_line
			end
		end

	process_inline_separate_instruction (a_instruction: ET_INLINE_SEPARATE_INSTRUCTION)
			-- Process `a_instruction'.
		do
			process_inline_separate_arguments (a_instruction.arguments)
			if attached a_instruction.compound as l_compound then
				process_compound (l_compound)
			else
				tokens.do_keyword.process (Current)
			end
			process_comments
			print_new_line
			a_instruction.end_keyword.process (Current)
		end

	process_inspect_expression (a_expression: ET_INSPECT_EXPRESSION)
			-- Process `a_expression'.
		local
			l_conditional: ET_CONDITIONAL
			l_expression: ET_EXPRESSION
		do
			l_conditional := a_expression.conditional
			if attached {ET_KEYWORD_EXPRESSION} l_conditional as l_full_conditional then
				l_full_conditional.process (Current)
			else
				tokens.inspect_keyword.process (Current)
				print_space
				l_expression := l_conditional.expression
				l_expression.process (Current)
				comment_finder.add_excluded_node (l_expression)
				comment_finder.find_comments (l_conditional, comment_list)
				comment_finder.reset_excluded_nodes
			end
			process_comments
			print_space
			if attached a_expression.when_parts as l_when_parts then
				l_when_parts.process (Current)
				process_comments
			end
			if attached a_expression.else_part as l_else_part then
				print_space
				if attached {ET_KEYWORD_EXPRESSION} l_else_part as l_full_conditional then
					l_full_conditional.process (Current)
				else
					tokens.else_keyword.process (Current)
					print_space
					l_expression := l_else_part.expression
					l_expression.process (Current)
					comment_finder.add_excluded_node (l_expression)
					comment_finder.find_comments (l_else_part, comment_list)
					comment_finder.reset_excluded_nodes
					process_comments
				end
			end
			print_space
			a_expression.end_keyword.process (Current)
		end

	process_inspect_instruction (an_instruction: ET_INSPECT_INSTRUCTION)
			-- Process `an_instruction'.
		local
			l_conditional: ET_CONDITIONAL
			l_expression: ET_EXPRESSION
		do
			l_conditional := an_instruction.conditional
			if attached {ET_KEYWORD_EXPRESSION} l_conditional as l_full_conditional then
				l_full_conditional.process (Current)
			else
				tokens.inspect_keyword.process (Current)
				print_space
				l_expression := l_conditional.expression
				l_expression.process (Current)
				comment_finder.add_excluded_node (l_expression)
				comment_finder.find_comments (l_conditional, comment_list)
				comment_finder.reset_excluded_nodes
			end
			process_comments
			print_new_line
			if attached an_instruction.when_parts as l_when_parts then
				l_when_parts.process (Current)
				process_comments
				if not l_when_parts.is_empty then
					print_new_line
				end
			end
			if attached an_instruction.else_compound as l_else_compound then
				l_else_compound.process (Current)
				process_comments
				print_new_line
			end
			an_instruction.end_keyword.process (Current)
		end

	process_instruction_list (a_list: ET_COMPOUND)
			-- Process `a_list'.
		require
			a_list_not_void: a_list /= Void
		local
			i, nb: INTEGER
			l_instruction: ET_INSTRUCTION
			l_has_leading_semicolon: BOOLEAN
			l_last_leaf: ET_AST_LEAF
		do
			nb := a_list.count
				-- Start to skip all leading null instructions.
			from
				i := 1
			until
				i > nb or else not a_list.item (i).is_semicolon
			loop
				l_has_leading_semicolon := True
				comment_finder.find_comments (a_list.item (i), comment_list)
				i := i + 1
			end
			if l_has_leading_semicolon and i <= nb then
				if attached {ET_SYMBOL} a_list.item (i).first_leaf as l_symbol and then (l_symbol.is_left_parenthesis or l_symbol.is_left_bracket or l_symbol.is_left_brace) then
						-- Print a semicolon in order to avoid syntax error with ISE Eiffel.
						-- For example if we have:
						--
						--  once
						--     ("OBJECT").f
						--
						-- it could also be seen by ISE Eiffel as:
						--
						--  once ("OBJECT")
						--     .f
						--
						-- even if this is not syntactically correct.
					tokens.semicolon_symbol.process (Current)
				end
			end
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
					l_last_leaf := l_instruction.last_leaf
					if (attached {ET_IDENTIFIER} l_last_leaf or attached {ET_PRECURSOR_KEYWORD} l_last_leaf) and attached {ET_SYMBOL} a_list.item (i).first_leaf as l_symbol and then (l_symbol.is_left_parenthesis or l_symbol.is_left_bracket) then
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
		end

	process_integer_constant (a_constant: ET_INTEGER_CONSTANT)
			-- Process `a_constant'.
		require
			a_constant_not_void: a_constant /= Void
		do
			if attached a_constant.cast_type as l_cast_type then
				process_cast_type (l_cast_type)
				print_space
			end
			process_integer_constant_without_cast_type (a_constant)
		end

	process_integer_constant_without_cast_type (a_constant: ET_INTEGER_CONSTANT)
			-- Process `a_constant' without cast type.
		require
			a_constant_not_void: a_constant /= Void
		do
			if attached a_constant.sign as l_sign then
				l_sign.process (Current)
			end
			print_string (a_constant.literal)
			process_break (a_constant.break)
		end

	process_internal_feature_locals (a_feature: ET_INTERNAL_FEATURE_CLOSURE)
			-- Process local variable declaration of `a_feature`.
		require
			a_feature_not_void: a_feature /= Void
		do
			if attached a_feature.locals as l_locals then
				l_locals.process (Current)
				process_comments
			end
		end

	process_internal_feature_rescue_clause (a_feature: ET_INTERNAL_FEATURE_CLOSURE)
			-- Process rescue clause of `a_feature`.
		require
			a_feature_not_void: a_feature /= Void
		do
			if attached a_feature.rescue_clause as l_rescue_clause then
				l_rescue_clause.process (Current)
				process_comments
				print_new_line
			end
		end

	process_invariants (a_list: ET_INVARIANTS)
			-- Process `a_list'.
		local
			l_has_comment_assertion: BOOLEAN
		do
			l_has_comment_assertion := attached a_list.break as l_break and then l_break.has_comment
			if a_list.is_empty and not l_has_comment_assertion then
					-- Do not print empty invariants, but keep the comments if any.
					-- Note that a comment is considered as an assertion here,
					-- and the invariant is not considered empty in that case.
				comment_finder.find_comments (a_list, comment_list)
			else
				a_list.invariant_keyword.process (Current)
				print_new_line
				print_new_line
				indent
				process_comments
				process_assertions (a_list)
				if a_list.is_empty then
					print_new_line
				end
				print_new_line
				process_comments
				dedent
			end
		end

	process_iteration_item_name (a_identifier: ET_IDENTIFIER; a_is_declaration: BOOLEAN)
			-- Process `a_identifier'.
		require
			a_identifier_not_void: a_identifier /= Void
			a_identifier_is_iteration_item: a_identifier.is_iteration_item
		do
			print_local_name (a_identifier)
		end

	process_keyword (a_keyword: ET_KEYWORD)
			-- Process `a_keyword`.
		do
			print_keyword (a_keyword)
		end

	process_keyword_expression (an_expression: ET_KEYWORD_EXPRESSION)
			-- Process `an_expression'.
		do
			process_keyword_in_keyword_expression (an_expression.keyword, an_expression)
			print_space
			an_expression.expression.process (Current)
		end

	process_keyword_feature_name_list (a_list: ET_KEYWORD_FEATURE_NAME_LIST)
			-- Process `a_list'.
		local
			i, nb: INTEGER
			l_item: ET_FEATURE_NAME_ITEM
			l_feature_name: ET_FEATURE_NAME
		do
			a_list.keyword.process (Current)
			indent
			set_current_target
			nb := a_list.count
			from i := 1 until i > nb loop
				process_comments
				print_new_line
				l_item := a_list.item (i)
				l_feature_name := l_item.feature_name
				process_feature_name_in_parent_clause (l_feature_name)
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
			set_target (Void)
			dedent
		end

	process_keyword_in_keyword_expression (a_keyword: ET_KEYWORD; a_expression: ET_KEYWORD_EXPRESSION)
			-- Process `a_keyword` when it appears in `a_expression'.
		require
			a_keyword_not_void: a_keyword /= Void
			a_expression_not_void: a_expression /= Void
			valid_keyword: a_keyword = a_expression.keyword
		do
			a_keyword.process (Current)
		end

	process_keyword_manifest_string (a_string: ET_KEYWORD_MANIFEST_STRING)
			-- Process `a_string'.
		do
			a_string.keyword.process (Current)
			print_space
			a_string.manifest_string.process (Current)
		end

	process_labeled_actual_parameter (a_parameter: ET_LABELED_ACTUAL_PARAMETER)
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
			process_type (l_type)
		end

	process_labeled_comma_actual_parameter (a_parameter: ET_LABELED_COMMA_ACTUAL_PARAMETER)
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

	process_like_current (a_type: ET_LIKE_CURRENT)
			-- Process `a_type'.
		do
			if attached a_type.type_mark as l_type_mark then
				if not l_type_mark.is_implicit_mark then
					process_type_mark (l_type_mark)
					print_space
				end
			end
			a_type.like_keyword.process (Current)
			print_space
			process_current_in_like_current (a_type.current_keyword, a_type)
		end

	process_like_feature (a_type: ET_LIKE_FEATURE)
			-- Process `a_type'.
		do
			if attached a_type.type_mark as l_type_mark then
				if not l_type_mark.is_implicit_mark then
					process_type_mark (l_type_mark)
					print_space
				end
			end
			a_type.like_keyword.process (Current)
			print_space
			set_current_target
			process_feature_name_in_like_feature (a_type.name, a_type)
			set_target (Void)
		end

	process_local_comma_variable (a_local: ET_LOCAL_COMMA_VARIABLE)
			-- Process `a_local'.
		local
			l_name_item: ET_LOCAL_NAME
			l_name: ET_IDENTIFIER
		do
			l_name_item := a_local.name_item
			l_name := l_name_item.identifier
			process_local_name (l_name, True)
			comment_finder.add_excluded_node (l_name)
			comment_finder.find_comments (l_name_item, comment_list)
			comment_finder.reset_excluded_nodes
				-- The AST may or may not contain the comma.
				-- So we have to print it explicitly here.
			tokens.comma_symbol.process (Current)
		end

	process_local_name (a_identifier: ET_IDENTIFIER; a_is_declaration: BOOLEAN)
			-- Process `a_identifier'.
		require
			a_identifier_not_void: a_identifier /= Void
			a_identifier_is_local: a_identifier.is_local
		do
			print_local_name (a_identifier)
		end

	process_local_variable (a_local: ET_LOCAL_VARIABLE)
			-- Process `a_local'.
		local
			l_name_item: ET_LOCAL_NAME
			l_name: ET_IDENTIFIER
			l_declared_type: ET_DECLARED_TYPE
			l_type: ET_TYPE
		do
			l_name_item := a_local.name_item
			l_name := l_name_item.identifier
			process_local_name (l_name, True)
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
			process_type (l_type)
		end

	process_local_variable_list (a_list: ET_LOCAL_VARIABLE_LIST)
			-- Process `a_list'.
		local
			i, nb: INTEGER
			l_item: ET_LOCAL_VARIABLE_ITEM
			l_local_variable: ET_LOCAL_VARIABLE
			l_name: ET_IDENTIFIER
			l_type: ET_TYPE
			l_has_comment_assertion: BOOLEAN
		do
			l_has_comment_assertion := attached a_list.break as l_break and then l_break.has_comment
			if a_list.is_empty and a_list.first_semicolon = Void and not l_has_comment_assertion then
					-- Do not print empty local variable clause, but keep the comments if any.
					--
					-- Note that a comment could be a commented out local variable,
					-- so the local variable clause is not considered empty in that case.
				comment_finder.find_comments (a_list, comment_list)
			else
				a_list.local_keyword.process (Current)
				print_new_line
				indent
				if attached a_list.first_semicolon as l_first_semicolon then
					comment_finder.find_comments (l_first_semicolon, comment_list)
				end
				process_comments
				nb := a_list.count
				from i := 1 until i > nb loop
					l_item := a_list.item (i)
					l_local_variable := l_item.local_variable
					l_name := l_local_variable.name
					process_local_name (l_name, True)
					if l_item.is_last_entity or i = nb then
						tokens.colon_symbol.process (Current)
						print_space
						l_type := l_local_variable.type
						process_type (l_type)
						comment_finder.add_excluded_node (l_name)
						comment_finder.add_excluded_node (l_type)
						comment_finder.find_comments (l_item, comment_list)
						comment_finder.reset_excluded_nodes
						print_new_line
						process_comments
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
		end

	process_loop_instruction (an_instruction: ET_LOOP_INSTRUCTION)
			-- Process `an_instruction'.
		local
			l_conditional: ET_CONDITIONAL
			l_expression: ET_EXPRESSION
		do
			if attached an_instruction.from_compound as l_from_compound then
				l_from_compound.process (Current)
			else
				tokens.from_keyword.process (Current)
			end
			print_new_line
			process_comments
			if attached an_instruction.invariant_part as l_invariant_part then
				l_invariant_part.process (Current)
				process_comments
			end
			if an_instruction.has_old_variant_syntax and then attached an_instruction.variant_part as l_variant_part then
				l_variant_part.process (Current)
				print_new_line
				process_comments
			end
			l_conditional := an_instruction.until_conditional
			if attached {ET_KEYWORD_EXPRESSION} l_conditional as l_full_conditional then
				l_full_conditional.keyword.process (Current)
				comment_finder.add_excluded_node (l_full_conditional.keyword)
			else
				tokens.until_keyword.process (Current)
			end
			print_new_line
			indent
			process_comments
			l_expression := l_conditional.expression
			l_expression.process (Current)
			comment_finder.add_excluded_node (l_expression)
			comment_finder.find_comments (l_conditional, comment_list)
			comment_finder.reset_excluded_nodes
			print_new_line
			process_comments
			dedent
			if attached an_instruction.loop_compound as l_loop_compound then
				l_loop_compound.process (Current)
			else
				tokens.loop_keyword.process (Current)
			end
			print_new_line
			process_comments
			if not an_instruction.has_old_variant_syntax and then attached an_instruction.variant_part as l_variant_part then
				l_variant_part.process (Current)
				print_new_line
				process_comments
			end
			an_instruction.end_keyword.process (Current)
		end

	process_loop_invariants (a_list: ET_LOOP_INVARIANTS)
			-- Process `a_list'.
		local
			l_has_comment_assertion: BOOLEAN
		do
			l_has_comment_assertion := attached a_list.break as l_break and then l_break.has_comment
			if a_list.is_empty and not l_has_comment_assertion then
					-- Do not print empty invariants, but keep the comments if any.
					-- Note that a comment is considered as an assertion here,
					-- and the invariant is not considered empty in that case.
				comment_finder.find_comments (a_list, comment_list)
			else
				a_list.invariant_keyword.process (Current)
				print_new_line
				indent
				process_comments
				process_assertions (a_list)
				process_comments
				dedent
			end
		end

	process_manifest_array (an_expression: ET_MANIFEST_ARRAY)
			-- Process `an_expression'.
		local
			i, nb: INTEGER
			l_item: ET_EXPRESSION_ITEM
			l_expression: ET_EXPRESSION
		do
			if attached an_expression.cast_type as l_cast_type then
				process_cast_type (l_cast_type)
				print_space
			end
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

	process_manifest_string_list (a_list: ET_MANIFEST_STRING_LIST)
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

	process_manifest_tuple (an_expression: ET_MANIFEST_TUPLE)
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

	process_manifest_type (an_expression: ET_MANIFEST_TYPE)
			-- Process `an_expression'.
		do
			an_expression.left_brace.process (Current)
			process_type (an_expression.type)
			an_expression.right_brace.process (Current)
		end

	process_name_of_client (a_client_name: ET_CLASS_NAME; a_named_class: ET_NAMED_CLASS)
			-- Process `a_client_name' which is the name of `a_named_class'.
		require
			a_client_name_not_void: a_client_name /= Void
			a_named_class_not_void: a_named_class /= Void
		do
			process_name_of_named_class (a_client_name, a_named_class)
		end

	process_name_of_current_class (a_class_name: ET_CLASS_NAME; a_class: ET_CLASS)
			-- Process `a_class_name' which is the name of current class `a_class'.
		require
			a_class_name_not_void: a_class_name /= Void
			a_class_not_void: a_class /= Void
		do
			process_name_of_named_class (a_class_name, a_class)
		end

	process_name_of_formal_parameter (a_parameter: ET_FORMAL_PARAMETER)
			-- Process name of formal parameter `a_parameter'.
		require
			a_parameter_not_void: a_parameter /= Void
		do
			process_name_of_formal_parameter_type (a_parameter)
		end

	process_name_of_formal_parameter_type (a_parameter: ET_FORMAL_PARAMETER_TYPE)
			-- Process name of formal parameter `a_parameter'.
		require
			a_parameter_not_void: a_parameter /= Void
		do
			print_formal_parameter_name (a_parameter.name)
		end

	process_name_of_named_class (a_class_name: ET_CLASS_NAME; a_named_class: ET_NAMED_CLASS)
			-- Process `a_class_name' which is the name of `a_named_class'.
		require
			a_class_name_not_void: a_class_name /= Void
			a_named_class_not_void: a_named_class /= Void
		do
			print_class_name (a_class_name)
		end

	process_name_of_precursor_parent_class (a_class_name: ET_CLASS_NAME; a_class: ET_CLASS)
			-- Process `a_class_name' which is the name of precursor parent class `a_class'.
		require
			a_class_name_not_void: a_class_name /= Void
			a_class_not_void: a_class /= Void
		do
			process_name_of_named_class (a_class_name, a_class)
		end

	process_named_object_test (an_expression: ET_NAMED_OBJECT_TEST)
			-- Process `an_expression'.
		local
			l_type: ET_TYPE
		do
			process_attached_keyword_in_object_test (an_expression.attached_keyword, an_expression)
			print_space
			if attached an_expression.declared_type as l_declared_type then
				l_type := l_declared_type.type
				tokens.left_brace_symbol.process (Current)
				process_type (l_type)
				tokens.right_brace_symbol.process (Current)
				comment_finder.add_excluded_node (l_type)
				comment_finder.find_comments (l_declared_type, comment_list)
				comment_finder.reset_excluded_nodes
				print_space
			end
			an_expression.expression.process (Current)
			print_space
			an_expression.as_keyword.process (Current)
			print_space
			process_object_test_local_name (an_expression.name, True)
		end

	process_new_name_of_rename (a_rename: ET_RENAME)
			-- Process new name of `a_rename'.
		require
			a_rename_not_void: a_rename /= Void
		do
			a_rename.new_name.process (Current)
		end

	process_note_list (a_list: ET_NOTE_LIST)
			-- Process `a_list'.
		do
			process_note_clause (a_list, True)
		end

	process_note_clause (a_list: ET_NOTE_LIST; a_new_line: BOOLEAN)
			-- Process `a_list'.
			-- `a_new_line' indicates that an empty new-line should
			-- appear between the 'note' keyword and the first item.
		local
			i, nb: INTEGER
			l_item: ET_NOTE_ITEM
			l_note: ET_NOTE
		do
			if a_list.is_empty then
					-- Do not print empty note clause, but keep the comments if any.
				comment_finder.find_comments (a_list, comment_list)
			else
				a_list.note_keyword.process (Current)
				if attached a_list.first_semicolon as l_first_semicolon then
					comment_finder.find_comments (l_first_semicolon, comment_list)
				end
				indent
				process_comments
				if a_new_line then
					print_new_line
				end
				nb := a_list.count
				from i := 1 until i > nb loop
					process_comments
					print_new_line
					l_item := a_list.item (i)
					l_note := l_item.note_clause
					if attached {ET_TAGGED_NOTE} l_note as l_tagged_note and then l_tagged_note.tag.identifier.lower_name.same_string ("description") then
						process_tagged_note_indented (l_tagged_note)
						print_new_line
					else
						l_note.process (Current)
					end
					comment_finder.add_excluded_node (l_note)
					comment_finder.find_comments (l_item, comment_list)
					comment_finder.reset_excluded_nodes
					i := i + 1
				end
				dedent
			end
		end

	process_note_tag (a_tag: ET_TAG)
			-- Process `a_tag' when appearing in a note clause.
		require
			a_tag_not_void: a_tag /= Void
		do
			process_tag (a_tag)
		end

	process_note_term_list (a_list: ET_NOTE_TERM_LIST)
			-- Process `a_list'.
		local
			i, nb: INTEGER
			l_item: ET_NOTE_TERM_ITEM
			l_note_term: ET_NOTE_TERM
		do
			nb := a_list.count
			from i := 1 until i > nb loop
				l_item := a_list.item (i)
				l_note_term := l_item.note_term
				l_note_term.process (Current)
				comment_finder.add_excluded_node (l_note_term)
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

	process_object_equality_expression (an_expression: ET_OBJECT_EQUALITY_EXPRESSION)
			-- Process `an_expression'.
		do
			an_expression.left.process (Current)
			print_space
			an_expression.operator.process (Current)
			print_space
			an_expression.right.process (Current)
		end

	process_object_test (an_expression: ET_OBJECT_TEST)
			-- Process `an_expression'.
		local
			l_type: ET_TYPE
		do
			process_attached_keyword_in_object_test (an_expression.attached_keyword, an_expression)
			print_space
			if attached an_expression.declared_type as l_declared_type then
				l_type := l_declared_type.type
				tokens.left_brace_symbol.process (Current)
				process_type (l_type)
				tokens.right_brace_symbol.process (Current)
				comment_finder.add_excluded_node (l_type)
				comment_finder.find_comments (l_declared_type, comment_list)
				comment_finder.reset_excluded_nodes
				print_space
			end
			an_expression.expression.process (Current)
		end

	process_object_test_local_name (a_identifier: ET_IDENTIFIER; a_is_declaration: BOOLEAN)
			-- Process `a_identifier'.
		require
			a_identifier_not_void: a_identifier /= Void
			a_identifier_is_object_test_local: a_identifier.is_object_test_local
		do
			print_local_name (a_identifier)
		end

	process_octal_integer_constant (a_constant: ET_OCTAL_INTEGER_CONSTANT)
			-- Process `a_constant'.
		do
			process_integer_constant (a_constant)
		end

	process_old_expression (an_expression: ET_OLD_EXPRESSION)
			-- Process `an_expression'.
		do
			an_expression.old_keyword.process (Current)
			print_space
			an_expression.expression.process (Current)
		end

	process_old_keyword_in_old_expression (a_old_keyword: ET_KEYWORD; a_expression: ET_OLD_EXPRESSION)
			-- Process `a_acrosa_old_keywords_keyword` when it appears in `a_expression`.
		require
			a_across_keyword_not_void: a_old_keyword /= Void
			a_expression_not_void: a_expression /= Void
			valid_across_keyword: a_old_keyword = a_expression.old_keyword
		do
			a_old_keyword.process (Current)
		end
		
	process_old_object_test (an_expression: ET_OLD_OBJECT_TEST)
			-- Process `an_expression'.
		do
			an_expression.left_brace.process (Current)
			process_object_test_local_name (an_expression.name, True)
			an_expression.colon.process (Current)
			print_space
			process_type (an_expression.type)
			an_expression.right_brace.process (Current)
			print_space
			an_expression.expression.process (Current)
		end

	process_once_function (a_feature: ET_ONCE_FUNCTION)
			-- Process `a_feature'.
		do
			process_feature_synonyms (a_feature)
			process_feature_arguments (a_feature)
			process_query_type (a_feature)
			process_query_assigner (a_feature)
			process_routine_is_keyword (a_feature)
			indent
			process_comments
			print_new_line
			process_feature_note (a_feature)
			process_feature_obsolete_message (a_feature)
			process_feature_preconditions (a_feature)
			process_internal_feature_locals (a_feature)
			process_once_routine_compound (a_feature)
			process_feature_postconditions (a_feature)
			process_internal_feature_rescue_clause (a_feature)
			a_feature.end_keyword.process (Current)
			process_feature_semicolon (a_feature)
			dedent
		end

	process_once_function_inline_agent (an_expression: ET_ONCE_FUNCTION_INLINE_AGENT)
			-- Process `an_expression'.
		do
			process_once_function_inline_agent_declaration (an_expression)
			process_agent_arguments (an_expression)
		end

	process_once_function_inline_agent_declaration (an_expression: ET_ONCE_FUNCTION_INLINE_AGENT)
			-- Process declaration of inline agent `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		do
			an_expression.agent_keyword.process (Current)
			print_space
			process_feature_arguments (an_expression)
			process_query_type (an_expression)
			process_comments
			print_new_line
			process_feature_preconditions (an_expression)
			process_internal_feature_locals (an_expression)
			process_once_routine_compound (an_expression)
			process_feature_postconditions (an_expression)
			process_internal_feature_rescue_clause (an_expression)
			an_expression.end_keyword.process (Current)
		end

	process_once_keyword_in_once_manifest_string (a_once_keyword: ET_KEYWORD; a_expression: ET_ONCE_MANIFEST_STRING)
			-- Process `a_once_keyword` when it appears in `a_expression`.
		require
			a_once_keyword_not_void: a_once_keyword /= Void
			a_expression_not_void: a_expression /= Void
			valid_once_keyword: a_once_keyword = a_expression.once_keyword
		do
			a_once_keyword.process (Current)
		end

	process_once_manifest_string (an_expression: ET_ONCE_MANIFEST_STRING)
			-- Process `an_expression'.
		do
			process_once_keyword_in_once_manifest_string (an_expression.once_keyword, an_expression)
			print_space
			an_expression.manifest_string.process (Current)
		end

	process_once_procedure (a_feature: ET_ONCE_PROCEDURE)
			-- Process `a_feature'.
		do
			process_feature_synonyms (a_feature)
			process_feature_arguments (a_feature)
			process_routine_is_keyword (a_feature)
			indent
			process_comments
			print_new_line
			process_feature_note (a_feature)
			process_feature_obsolete_message (a_feature)
			process_feature_preconditions (a_feature)
			process_internal_feature_locals (a_feature)
			process_once_routine_compound (a_feature)
			process_feature_postconditions (a_feature)
			process_internal_feature_rescue_clause (a_feature)
			a_feature.end_keyword.process (Current)
			process_feature_semicolon (a_feature)
			dedent
		end

	process_once_procedure_inline_agent (an_expression: ET_ONCE_PROCEDURE_INLINE_AGENT)
			-- Process `an_expression'.
		do
			process_once_procedure_inline_agent_declaration (an_expression)
			process_agent_arguments (an_expression)
		end

	process_once_procedure_inline_agent_declaration (an_expression: ET_ONCE_PROCEDURE_INLINE_AGENT)
			-- Process declaration of inline agent `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		do
			an_expression.agent_keyword.process (Current)
			print_space
			process_feature_arguments (an_expression)
			process_comments
			print_new_line
			process_feature_preconditions (an_expression)
			process_internal_feature_locals (an_expression)
			process_once_routine_compound (an_expression)
			process_feature_postconditions (an_expression)
			process_internal_feature_rescue_clause (an_expression)
			an_expression.end_keyword.process (Current)
		end

	process_once_routine_compound (a_routine: ET_ONCE_ROUTINE_CLOSURE)
			-- Process compound of 'once' routine `a_routine`.
		require
			a_routine_not_void: a_routine /= Void
		local
			l_compound: ET_COMPOUND
		do
			l_compound := a_routine.compound
			if l_compound /= Void then
				l_compound.keyword.process (Current)
			else
				tokens.once_keyword.process (Current)
			end
			if attached a_routine.keys as l_keys then
				if l_keys.is_empty then
						-- Do not print empty parentheses, but keep the comments if any.
					comment_finder.find_comments (l_keys, comment_list)
				else
					print_space
					l_keys.process (Current)
				end
			end
			if l_compound /= Void then
				indent
				process_instruction_list (l_compound)
				dedent
			else
				process_comments
			end
			print_new_line
		end

	process_operator (a_operator: ET_OPERATOR)
			-- Process `a_operator`.
		require
			a_operator_not_void: a_operator /= Void
		do
			a_operator.process (Current)
		end

	process_parent (a_parent: ET_PARENT)
			-- Process `a_parent'.
		local
			a_renames: detachable ET_RENAME_LIST
			an_exports: detachable ET_EXPORT_LIST
			an_undefines: detachable ET_KEYWORD_FEATURE_NAME_LIST
			a_redefines: detachable ET_KEYWORD_FEATURE_NAME_LIST
			a_selects: detachable ET_KEYWORD_FEATURE_NAME_LIST
			an_end_keyword: detachable ET_TOKEN
		do
			process_parent_type (a_parent.type)
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
				elseif an_exports.has_non_null_export then
					print_new_line
					process_comments
					an_exports.process (Current)
					if an_end_keyword /= Void then
						print_new_line
						process_comments
						an_end_keyword.process (Current)
					end
				else
					comment_finder.find_comments (an_exports, comment_list)
						-- Do not print the 'end' keyword if any.
					if an_end_keyword /= Void then
						comment_finder.find_comments (an_end_keyword, comment_list)
					end
					process_comments
				end
			else
				if a_renames /= Void then
					print_new_line
					process_comments
					process_rename_list_in_parent (a_renames, a_parent)
				end
				if an_exports /= Void then
					if an_exports.has_non_null_export then
						print_new_line
						process_comments
						an_exports.process (Current)
					else
						comment_finder.find_comments (an_exports, comment_list)
					end
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

	process_parent_clause_list (a_list: ET_PARENT_CLAUSE_LIST)
			-- Process `a_list'.
		local
			i, nb: INTEGER
			l_parent_list: ET_PARENT_LIST
		do
			nb := a_list.count
			from i := 1 until i > nb loop
				l_parent_list := a_list.item (i)
				l_parent_list.process (Current)
				if i /= nb then
					process_comments
					print_new_line
					print_new_line
				end
				i := i + 1
			end
		end

	process_parent_list (a_list: ET_PARENT_LIST)
			-- Process `a_list'.
		local
			i, nb: INTEGER
			l_item: ET_PARENT_ITEM
			l_parent: ET_PARENT
		do
			a_list.inherit_keyword.process (Current)
			if attached a_list.clients_clause as l_clients then
				print_space
				l_clients.process (Current)
			end
			if attached a_list.first_semicolon as l_first_semicolon then
				comment_finder.find_comments (l_first_semicolon, comment_list)
			end
			process_comments_on_same_line
			print_new_line
			print_new_line
			indent
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

	process_parent_type (a_type: ET_TYPE)
			-- Process `a_type'.
		require
			a_type_not_void: a_type /= Void
		do
			a_type.process (Current)
		end

	process_parenthesis_expression (an_expression: ET_PARENTHESIS_EXPRESSION)
			-- Process `an_expression'.
		do
			an_expression.target.process (Current)
			if attached an_expression.arguments as l_arguments then
				print_space
				l_arguments.process (Current)
			end
		end

	process_parenthesis_instruction (an_instruction: ET_PARENTHESIS_INSTRUCTION)
			-- Process `an_expression'.
		do
			an_instruction.target.process (Current)
			if attached an_instruction.arguments as l_arguments then
				print_space
				l_arguments.process (Current)
			end
		end

	process_postconditions (a_list: ET_POSTCONDITIONS)
			-- Process `a_list'.
		local
			l_has_comment_assertion: BOOLEAN
		do
			l_has_comment_assertion := attached a_list.break as l_break and then l_break.has_comment
			if a_list.is_empty and not l_has_comment_assertion then
					-- Do not print empty postconditions, but keep the comments if any.
					-- Note that a comment is considered as an assertion here,
					-- and the postcondition is not considered empty in that case.
				comment_finder.find_comments (a_list, comment_list)
			else
				a_list.ensure_keyword.process (Current)
				if attached a_list.then_keyword as l_then_keyword then
					print_space
					l_then_keyword.process (Current)
				end
				print_new_line
				indent
				process_comments
				process_assertions (a_list)
				process_comments
				dedent
			end
		end

	process_preconditions (a_list: ET_PRECONDITIONS)
			-- Process `a_list'.
		local
			l_has_comment_assertion: BOOLEAN
		do
			l_has_comment_assertion := attached a_list.break as l_break and then l_break.has_comment
			if a_list.is_empty and not l_has_comment_assertion then
					-- Do not print empty preconditions, but keep the comments if any.
					-- Note that a comment is considered as an assertion here,
					-- and the precondition is not considered empty in that case.
				comment_finder.find_comments (a_list, comment_list)
			else
				a_list.require_keyword.process (Current)
				if attached a_list.else_keyword as l_else_keyword then
					print_space
					l_else_keyword.process (Current)
				end
				print_new_line
				indent
				process_comments
				process_assertions (a_list)
				process_comments
				dedent
			end
		end

	process_precursor_expression (an_expression: ET_PRECURSOR_EXPRESSION)
			-- Process `an_expression'.
		local
			l_class_name: ET_CLASS_NAME
		do
			set_target_type (an_expression.parent_type)
			process_precursor_keyword (an_expression.precursor_keyword)
			set_target_type (Void)
			if attached an_expression.parent_name as l_parent_name then
				print_space
				tokens.left_brace_symbol.process (Current)
				l_class_name := l_parent_name.class_name
				if attached an_expression.parent_type as l_parent_type then
					process_name_of_precursor_parent_class (l_class_name, l_parent_type.base_class)
				else
					l_class_name.process (Current)
				end
				comment_finder.add_excluded_node (l_class_name)
				comment_finder.find_comments (l_parent_name, comment_list)
				comment_finder.reset_excluded_nodes
				tokens.right_brace_symbol.process (Current)
			end
			if attached an_expression.arguments as l_arguments then
				if l_arguments.is_empty then
						-- Do not print empty parentheses, but keep the comments if any.
					comment_finder.find_comments (l_arguments, comment_list)
				else
					print_space
					l_arguments.process (Current)
				end
			end
		end

	process_precursor_instruction (an_instruction: ET_PRECURSOR_INSTRUCTION)
			-- Process `an_instruction'.
		local
			l_class_name: ET_CLASS_NAME
		do
			set_target_type (an_instruction.parent_type)
			process_precursor_keyword (an_instruction.precursor_keyword)
			set_target_type (Void)
			if attached an_instruction.parent_name as l_parent_name then
				print_space
				tokens.left_brace_symbol.process (Current)
				l_class_name := l_parent_name.class_name
				if attached an_instruction.parent_type as l_parent_type then
					process_name_of_precursor_parent_class (l_class_name, l_parent_type.base_class)
				else
					l_class_name.process (Current)
				end
				comment_finder.add_excluded_node (l_class_name)
				comment_finder.find_comments (l_parent_name, comment_list)
				comment_finder.reset_excluded_nodes
				tokens.right_brace_symbol.process (Current)
			end
			if attached an_instruction.arguments as l_arguments then
				if l_arguments.is_empty then
						-- Do not print empty parentheses, but keep the comments if any.
					comment_finder.find_comments (l_arguments, comment_list)
				else
					print_space
					l_arguments.process (Current)
				end
			end
		end

	process_prefix_expression (an_expression: ET_PREFIX_EXPRESSION)
			-- Process `an_expression'.
		local
			l_operator: ET_OPERATOR
			l_expression: ET_EXPRESSION
		do
			l_operator := an_expression.name
			l_expression := an_expression.expression
			set_target_with_seeded_feature (l_expression, l_operator.seed)
			process_operator (l_operator)
			set_target (Void)
			print_space
			l_expression.process (Current)
		end

	process_qualified_call (a_call: ET_QUALIFIED_CALL)
			-- Process `a_call'.
		local
			l_qualified_feature_name: ET_QUALIFIED_FEATURE_NAME
			l_feature_name: ET_FEATURE_NAME
		do
				-- The AST may or may not contain the dot.
				-- So we have to print them explicitly here.
			tokens.dot_symbol.process (Current)
			l_qualified_feature_name := a_call.qualified_name
			l_feature_name := l_qualified_feature_name.feature_name
			process_feature_name (l_feature_name)
			comment_finder.add_excluded_node (l_feature_name)
			comment_finder.find_comments (l_qualified_feature_name, comment_list)
			comment_finder.reset_excluded_nodes
			if attached a_call.arguments as l_arguments then
				if l_arguments.is_empty then
						-- Do not print empty parentheses, but keep the comments if any.
					comment_finder.find_comments (l_arguments, comment_list)
				else
					print_space
					l_arguments.process (Current)
				end
			end
		end

	process_qualified_call_expression (an_expression: ET_QUALIFIED_CALL_EXPRESSION)
			-- Process `an_expression'.
		do
			process_qualified_regular_feature_call (an_expression)
		end

	process_qualified_call_instruction (an_instruction: ET_QUALIFIED_CALL_INSTRUCTION)
			-- Process `an_instruction'.
		do
			process_qualified_regular_feature_call (an_instruction)
		end

	process_qualified_like_braced_type (a_type: ET_QUALIFIED_LIKE_BRACED_TYPE)
			-- Process `a_type'.
		local
			l_qualified_feature_name: ET_QUALIFIED_FEATURE_NAME
			l_feature_name: ET_FEATURE_NAME
		do
			if attached a_type.type_mark as l_type_mark then
				if not l_type_mark.is_implicit_mark then
					process_type_mark (l_type_mark)
					print_space
				end
			end
			a_type.like_keyword.process (Current)
			print_space
			a_type.left_brace.process (Current)
			process_type (a_type.target_type)
			a_type.right_brace.process (Current)
				-- The AST may or may not contain the dot.
				-- So we have to print them explicitly here.
			tokens.dot_symbol.process (Current)
			l_qualified_feature_name := a_type.qualified_name
			l_feature_name := l_qualified_feature_name.feature_name
			set_target_type_with_seeded_feature (a_type.target_type, l_feature_name.seed)
			process_feature_name_in_qualified_like_identifier (l_feature_name, a_type)
			set_target_type (Void)
			comment_finder.add_excluded_node (l_feature_name)
			comment_finder.find_comments (l_qualified_feature_name, comment_list)
			comment_finder.reset_excluded_nodes
		end

	process_qualified_like_type (a_type: ET_QUALIFIED_LIKE_TYPE)
			-- Process `a_type'.
		local
			l_qualified_feature_name: ET_QUALIFIED_FEATURE_NAME
			l_feature_name: ET_FEATURE_NAME
		do
			if attached a_type.type_mark as l_type_mark then
				if not l_type_mark.is_implicit_mark then
					process_type_mark (l_type_mark)
					print_space
				end
			end
			process_type (a_type.target_type)
				-- The AST may or may not contain the dot.
				-- So we have to print them explicitly here.
			tokens.dot_symbol.process (Current)
			l_qualified_feature_name := a_type.qualified_name
			l_feature_name := l_qualified_feature_name.feature_name
			set_target_type_with_seeded_feature (a_type.target_type, l_feature_name.seed)
			process_feature_name_in_qualified_like_identifier (l_feature_name, a_type)
			set_target_type (Void)
			comment_finder.add_excluded_node (l_feature_name)
			comment_finder.find_comments (l_qualified_feature_name, comment_list)
			comment_finder.reset_excluded_nodes
		end

	process_qualified_regular_feature_call (a_call: ET_QUALIFIED_REGULAR_FEATURE_CALL)
			-- Process `a_call'.
		local
			l_qualified_feature_name: ET_QUALIFIED_FEATURE_NAME
			l_feature_name: ET_FEATURE_NAME
		do
			a_call.target.process (Current)
				-- The AST may or may not contain the dot.
				-- So we have to print them explicitly here.
			tokens.dot_symbol.process (Current)
			l_qualified_feature_name := a_call.qualified_name
			l_feature_name := l_qualified_feature_name.feature_name
			set_target_with_seeded_feature (a_call.target, l_feature_name.seed)
			process_feature_name_in_qualified_call (l_feature_name, a_call)
			set_target (Void)
			comment_finder.add_excluded_node (l_feature_name)
			comment_finder.find_comments (l_qualified_feature_name, comment_list)
			comment_finder.reset_excluded_nodes
			if attached a_call.arguments as l_arguments then
				if l_arguments.is_empty then
						-- Do not print empty parentheses, but keep the comments if any.
					comment_finder.find_comments (l_arguments, comment_list)
				else
					print_space
					l_arguments.process (Current)
				end
			end
		end

	process_quantifier_expression (a_expression: ET_QUANTIFIER_EXPRESSION)
			-- Process `a_expression'.
		do
			a_expression.quantifier_symbol.process (Current)
			process_iteration_item_name (a_expression.item_name, True)
			a_expression.colon_symbol.process (Current)
			print_space
			a_expression.iterable_expression.process (Current)
			print_space
			a_expression.bar_symbol.process (Current)
			print_space
			a_expression.iteration_expression.process (Current)
		end

	process_query_assigner (a_query: ET_QUERY)
			-- Process assigner of `a_query`.
		require
			a_query_not_void: a_query /= Void
		do
			if attached a_query.assigner as l_assigner then
				print_space
				process_assigner (l_assigner)
			end
		end

	process_query_type (a_query: ET_QUERY_CLOSURE)
			-- Process type of `a_query`.
		require
			a_query_not_void: a_query /= Void
		local
			l_declared_type: ET_DECLARED_TYPE
			l_type: ET_TYPE
		do
				-- The AST may or may not contain the colon.
				-- So we have to print it explicitly here.
			l_declared_type := a_query.declared_type
			l_type := l_declared_type.type
			tokens.colon_symbol.process (Current)
			comment_finder.add_excluded_node (l_type)
			comment_finder.find_comments (l_declared_type, comment_list)
			comment_finder.reset_excluded_nodes
			print_space
			process_type (l_type)
		end

	process_real_constant (a_constant: ET_REAL_CONSTANT)
			-- Process `a_constant'.
		do
			if attached a_constant.cast_type as l_cast_type then
				process_cast_type (l_cast_type)
				print_space
			end
			process_real_constant_without_cast_type (a_constant)
		end

	process_real_constant_without_cast_type (a_constant: ET_REAL_CONSTANT)
			-- Process `a_constant' without cast type.
		do
			if attached a_constant.sign as l_sign then
				l_sign.process (Current)
			end
			if use_lowercase_keywords then
				print_uppercase_string (a_constant.literal)
			else
				print_string (a_constant.literal)
			end
			process_break (a_constant.break)
		end

	process_regular_integer_constant (a_constant: ET_REGULAR_INTEGER_CONSTANT)
			-- Process `a_constant'.
		do
			process_integer_constant (a_constant)
		end

	process_regular_manifest_string (a_string: ET_REGULAR_MANIFEST_STRING)
			-- Process `a_string'.
		do
			if attached a_string.cast_type as l_cast_type then
				process_cast_type (l_cast_type)
				print_space
			end
			process_regular_manifest_string_without_cast_type (a_string)
		end

	process_regular_manifest_string_without_cast_type (a_string: ET_REGULAR_MANIFEST_STRING)
			-- Process `a_string' without cast type.
		require
			a_string_not_void: a_string /= Void
		do
			print_character ('%"')
			print_string (a_string.literal)
			print_character ('%"')
			process_break (a_string.break)
		end

	process_regular_real_constant (a_constant: ET_REGULAR_REAL_CONSTANT)
			-- Process `a_constant'.
		do
			process_real_constant (a_constant)
		end

	process_rename_in_parent (a_rename: ET_RENAME; a_parent: ET_PARENT)
			-- Process `a_rename' when it appears in `a_parent`.
		require
			a_rename_not_void: a_rename /= Void
			a_parent_not_void: a_parent /= Void
		do
			set_target_type (a_parent.type)
			process_feature_name_in_old_rename (a_rename.old_name, a_rename)
			set_target_type (Void)
			print_space
			a_rename.as_keyword.process (Current)
			print_space
			set_current_target
			process_new_name_of_rename (a_rename)
			set_target (Void)
		end

	process_rename_list_in_parent (a_list: ET_RENAME_LIST; a_parent: ET_PARENT)
			-- Process `a_list' when it appears in `a_parent`.
		require
			a_list_not_void: a_list /= Void
			a_parent_not_void: a_parent /= Void
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
				process_rename_in_parent (l_rename, a_parent)
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

	process_repeat_instruction (a_instruction: ET_REPEAT_INSTRUCTION)
			-- Process `a_instruction'.
		do
			a_instruction.open_repeat_symbol.process (Current)
			print_space
			process_iteration_item_name (a_instruction.item_name, True)
			a_instruction.colon_symbol.process (Current)
			print_space
			a_instruction.iterable_expression.process (Current)
			print_space
			a_instruction.bar_symbol.process (Current)
			if not attached a_instruction.loop_compound as l_loop_compound or else l_loop_compound.is_empty then
				print_space
			elseif l_loop_compound.count = 1 then
				print_space
				l_loop_compound.first.process (Current)
				print_space
			else
				print_new_line
				process_comments
				indent
				process_instruction_list (l_loop_compound)
				dedent
				print_new_line
				process_comments
			end
			a_instruction.close_repeat_symbol.process (Current)
		end

	process_result (an_expression: ET_RESULT)
			-- Process `an_expression'.
		do
			print_result (an_expression)
		end

	process_result_address (an_expression: ET_RESULT_ADDRESS)
			-- Process `an_expression`.
		do
			an_expression.dollar.process (Current);
			an_expression.result_keyword.process (Current)
		end

	process_result_in_result_address (a_result: ET_RESULT; a_expression: ET_RESULT_ADDRESS)
			-- Process `a_result' when it appears in `a_expression`.
		require
			a_result_not_void: a_result /= Void
			a_expression_not_void: a_expression /= Void
			valid_result: a_result = a_expression.result_keyword
		do
			process_result (a_result)
		end

	process_retry_instruction (an_instruction: ET_RETRY_INSTRUCTION)
			-- Process `an_instruction'.
		do
			process_keyword (an_instruction)
		end

	process_routine_is_keyword (a_routine: ET_ROUTINE)
			-- Process 'is' keyword of `a_routine`.
		require
			a_routine_not_void: a_routine /= Void
		do
			if use_is_keyword then
				print_space
				if attached a_routine.is_keyword as l_is_keyword then
					l_is_keyword.process (Current)
				else
					tokens.is_keyword.process (Current)
				end
			elseif attached a_routine.is_keyword as l_is_keyword then
				process_break (l_is_keyword.break)
			end
		end

	process_semicolon_symbol (a_symbol: ET_SEMICOLON_SYMBOL)
			-- Process `a_symbol'.
		do
			process_symbol (tokens.semicolon_symbol)
			comment_finder.find_comments (a_symbol, comment_list)
		end

	process_special_manifest_string (a_string: ET_SPECIAL_MANIFEST_STRING)
			-- Process `a_string'.
		do
			if attached a_string.cast_type as l_cast_type then
				process_cast_type (l_cast_type)
				print_space
			end
			process_special_manifest_string_without_cast_type (a_string)
		end

	process_special_manifest_string_without_cast_type (a_string: ET_SPECIAL_MANIFEST_STRING)
			-- Process `a_string' without cast type.
		require
			a_string_not_void: a_string /= Void
		do
			print_character ('%"')
			print_string (a_string.literal)
			print_character ('%"')
			process_break (a_string.break)
		end

	process_static_feature_call (a_call: ET_STATIC_FEATURE_CALL)
			-- Process `a_call'.
		require
			a_call_not_void: a_call /= Void
		local
			l_static_type: ET_TARGET_TYPE
			l_type: ET_TYPE
			l_qualified_feature_name: ET_QUALIFIED_FEATURE_NAME
			l_feature_name: ET_FEATURE_NAME
		do
			if attached a_call.feature_keyword as l_feature_keyword then
				comment_finder.find_comments (l_feature_keyword, comment_list)
			end
			l_static_type := a_call.static_type
			l_type := l_static_type.type
			tokens.left_brace_symbol.process (Current)
			process_type (l_type)
			tokens.right_brace_symbol.process (Current)
			comment_finder.add_excluded_node (l_type)
			comment_finder.find_comments (l_static_type, comment_list)
			comment_finder.reset_excluded_nodes
				-- The AST may or may not contain the dot.
				-- So we have to print them explicitly here.
			tokens.dot_symbol.process (Current)
			l_qualified_feature_name := a_call.qualified_name
			l_feature_name := l_qualified_feature_name.feature_name
			set_target_type_with_seeded_feature (l_type, a_call.name.seed)
			process_feature_name_in_static_call (l_feature_name, a_call)
			set_target_type (Void)
			comment_finder.add_excluded_node (l_feature_name)
			comment_finder.find_comments (l_qualified_feature_name, comment_list)
			comment_finder.reset_excluded_nodes
			if attached a_call.arguments as l_arguments then
				if l_arguments.is_empty then
						-- Do not print empty parentheses, but keep the comments if any.
					comment_finder.find_comments (l_arguments, comment_list)
				else
					print_space
					l_arguments.process (Current)
				end
			end
		end

	process_static_call_expression (an_expression: ET_STATIC_CALL_EXPRESSION)
			-- Process `an_expression'.
		do
			process_static_feature_call (an_expression)
		end

	process_static_call_instruction (an_instruction: ET_STATIC_CALL_INSTRUCTION)
			-- Process `an_instruction'.
		do
			process_static_feature_call (an_instruction)
		end

	process_strip_expression (an_expression: ET_STRIP_EXPRESSION)
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

	process_symbol (a_symbol: ET_SYMBOL)
			-- Process `a_symbol'.
		do
			print_string (a_symbol.text)
			process_break (a_symbol.break)
		end

	process_tag (a_tag: ET_TAG)
			-- Process `a_tag'.
		require
			a_tag_not_void: a_tag /= Void
		local
			l_identifier: ET_IDENTIFIER
		do
			l_identifier := a_tag.identifier
			print_local_name (l_identifier)
				-- The AST may or may not contain the colon.
				-- So we have to print it explicitly here.
			tokens.colon_symbol.process (Current)
			comment_finder.add_excluded_node (l_identifier)
			comment_finder.find_comments (a_tag, comment_list)
			comment_finder.reset_excluded_nodes
		end

	process_tagged_assertion (an_assertion: ET_TAGGED_ASSERTION)
			-- Process `an_assertion'.
		do
			process_tag (an_assertion.tag)
			if attached an_assertion.untagged_assertion as l_untagged_assertion then
				print_space
				l_untagged_assertion.process (Current)
			end
		end

	process_tagged_note (a_note: ET_TAGGED_NOTE)
			-- Process `a_note'.
		do
			process_note_tag (a_note.tag)
			print_space
			process_note (a_note)
		end

	process_tagged_note_indented (a_note: ET_TAGGED_NOTE)
			-- Process `a_note'.
			-- Print the tag, then the note terms indented two lines below.
		require
			a_note_not_void: a_note /= Void
		local
			l_terms: ET_NOTE_TERM_LIST
		do
			process_note_tag (a_note.tag)
			l_terms := a_note.terms
			if l_terms.count = 1 and then attached {ET_VERBATIM_STRING} l_terms.first.note_term as l_verbatim_string then
				print_new_line
				process_note (a_note)
					-- We make as if a comment was printed so that
					-- a subsequent call to `print_new_line' in
					-- `process_note_list' will not print anything.
				comment_printed := True
			else
				print_new_line
				print_new_line
				indent
				process_note (a_note)
				dedent
			end
		end

	process_token (a_token: ET_TOKEN)
			-- Process `a_token'.
		do
			print_string (a_token.text)
			process_break (a_token.break)
		end

	process_true_constant (a_constant: ET_TRUE_CONSTANT)
			-- Process `a_constant'.
		do
			print_true_constant (a_constant)
		end

	process_tuple_label (a_label: ET_IDENTIFIER)
			-- Process `a_label`.
		require
			a_label_not_void: a_label /= Void
			a_label_is_tuple_label: a_label.is_tuple_label
		do
			print_local_name (a_label)
		end

	process_tuple_label_in_tuple_type (a_label: ET_IDENTIFIER; a_tuple_type: ET_BASE_TYPE)
			-- Process `a_label` when it appears in `a_tuple_type`.
		require
			a_label_not_void: a_label /= Void
			a_label_is_tuple_label: a_label.is_tuple_label
			a_tuple_type_not_void: a_tuple_type /= Void
		do
			process_tuple_label (a_label)
		end

	process_tuple_type (a_type: ET_TUPLE_TYPE)
			-- Process `a_type'.
		do
			if attached a_type.type_mark as l_type_mark then
				if not l_type_mark.is_implicit_mark then
					process_type_mark (l_type_mark)
					print_space
				end
			end
			process_name_of_named_class (tokens.tuple_keyword, a_type.named_base_class)
			comment_finder.find_comments (a_type.tuple_keyword, comment_list)
			if not attached a_type.actual_parameters as l_actual_parameters or else not attached l_actual_parameters.folded_actual_parameters as l_folded_actual_parameters then
				-- Do nothing.
			elseif l_folded_actual_parameters.is_empty then
					-- Do not print empty brackets, but keep the comments if any.
				comment_finder.find_comments (l_folded_actual_parameters, comment_list)
			elseif attached {ET_ACTUAL_PARAMETER_LIST} l_folded_actual_parameters as l_folded_actual_parameter_list then
				print_space
				process_actual_parameter_list_in_base_type (l_folded_actual_parameter_list, a_type)
			else
				print_space
				l_folded_actual_parameters.process (Current)
			end
		end

	process_type (a_type: ET_TYPE)
			-- Process `a_type'.
		require
			a_type_not_void: a_type /= Void
		do
			a_type.process (Current)
		end

	process_type_constraint_list (a_list: ET_TYPE_CONSTRAINT_LIST)
			-- Process `a_list'.
		local
			i, nb: INTEGER
			l_item: ET_TYPE_CONSTRAINT_ITEM
			l_type_constraint: ET_TYPE_CONSTRAINT
		do
			a_list.left_brace.process (Current)
			nb := a_list.count
			from i := 1 until i > nb loop
				l_item := a_list.item (i)
				l_type_constraint := l_item.type_constraint
				l_type_constraint.process (Current)
				comment_finder.add_excluded_node (l_type_constraint)
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

	process_type_mark (a_type_mark: ET_TYPE_MARK)
			-- Process `a_type_mark'.
		require
			a_type_mark_not_void: a_type_mark /= Void
		do
			a_type_mark.process (Current)
		end

	process_type_rename_constraint (a_type_rename_constraint: ET_TYPE_RENAME_CONSTRAINT)
			-- Process `a_type_rename_constraint'.
		local
			i, nb: INTEGER
			l_renames: ET_CONSTRAINT_RENAME_LIST
			l_item: ET_RENAME_ITEM
			l_rename: ET_RENAME
		do
			process_type (a_type_rename_constraint.type)
			print_space
			l_renames := a_type_rename_constraint.renames
			l_renames.rename_keyword.process (Current)
			print_space
			nb := l_renames.count
			from i := 1 until i > nb loop
				l_item := l_renames.item (i)
				l_rename := l_item.rename_pair
				set_target_type_with_seeded_feature (a_type_rename_constraint.type, l_rename.old_name.seed)
				process_feature_name_in_old_rename (l_rename.old_name, l_rename)
				set_target_type (Void)
				print_space
				l_rename.as_keyword.process (Current)
				print_space
				l_rename.new_name.process (Current)
				if i /= nb then
						-- The AST may or may not contain the comma.
						-- So we have to print it explicitly here.
					tokens.comma_symbol.process (Current)
				end
				comment_finder.add_excluded_node (l_rename.old_name)
				comment_finder.add_excluded_node (l_rename.as_keyword)
				comment_finder.add_excluded_node (l_rename.new_name)
				comment_finder.find_comments (l_item, comment_list)
				comment_finder.reset_excluded_nodes
				print_space
				i := i + 1
			end
			l_renames.end_keyword.process (Current)
		end

	process_underscored_integer_constant (a_constant: ET_UNDERSCORED_INTEGER_CONSTANT)
			-- Process `a_constant'.
		do
			process_integer_constant (a_constant)
		end

	process_underscored_real_constant (a_constant: ET_UNDERSCORED_REAL_CONSTANT)
			-- Process `a_constant'.
		do
			process_real_constant (a_constant)
		end

	process_unique_attribute (a_feature: ET_UNIQUE_ATTRIBUTE)
			-- Process `a_feature'.
		do
			process_feature_synonyms (a_feature)
			process_query_type (a_feature)
			process_query_assigner (a_feature)
			print_space
			if use_is_keyword then
				if attached {ET_KEYWORD} a_feature.is_keyword as l_is_keyword then
					l_is_keyword.process (Current)
				else
					tokens.is_keyword.process (Current)
					process_break (a_feature.is_keyword.break)
				end
			else
				tokens.equal_symbol.process (Current)
				process_break (a_feature.is_keyword.break)
			end
			print_space
			a_feature.unique_keyword.process (Current)
			process_feature_semicolon (a_feature)
				-- Print header comment.
			indent
			process_comments
			dedent
		end

	process_unqualified_call_expression (an_expression: ET_UNQUALIFIED_CALL_EXPRESSION)
			-- Process `an_expression'.
		do
			process_unqualified_regular_feature_call (an_expression)
		end

	process_unqualified_call_instruction (an_instruction: ET_UNQUALIFIED_CALL_INSTRUCTION)
			-- Process `an_instruction'.
		do
			process_unqualified_regular_feature_call (an_instruction)
		end

	process_unqualified_feature_name (a_feature_name: ET_FEATURE_NAME)
			-- Process `a_feature_name'.
		require
			a_feature_name_not_void: a_feature_name /= Void
		do
			process_feature_name (a_feature_name)
		end

	process_unqualified_regular_feature_call (a_call: ET_UNQUALIFIED_REGULAR_FEATURE_CALL)
			-- Process `a_call'.
		do
			set_current_target
			process_feature_name_in_unqualified_call (a_call.name, a_call)
			set_target (Void)
			if attached a_call.arguments as l_arguments then
				if l_arguments.is_empty then
						-- Do not print empty parentheses, but keep the comments if any.
					comment_finder.find_comments (l_arguments, comment_list)
				else
					print_space
					l_arguments.process (Current)
				end
			end
		end

	process_variant (a_variant: ET_VARIANT)
			-- Process `a_variant'.
		do
			a_variant.variant_keyword.process (Current)
			indent
			print_new_line
			process_comments
			if attached a_variant.tag as l_tag then
				process_tag (l_tag)
				print_space
			end
			a_variant.expression.process (Current)
			process_comments
			dedent
		end

	process_verbatim_string (a_string: ET_VERBATIM_STRING)
			-- Process `a_string'.
		do
			if attached a_string.cast_type as l_cast_type then
				process_cast_type (l_cast_type)
				print_space
			end
			process_verbatim_string_without_cast_type (a_string)
		end

	process_verbatim_string_without_cast_type (a_string: ET_VERBATIM_STRING)
			-- Process `a_string' without cast type.
		require
			a_string_not_void: a_string /= Void
		do
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

	process_void (an_expression: ET_VOID)
			-- Process `an_expression'.
		do
			print_void (an_expression)
		end

	process_when_expression (a_when_part: ET_WHEN_EXPRESSION)
			-- Process `a_when_part'.
		do
			a_when_part.choices.process (Current)
			print_space
			a_when_part.then_keyword.process (Current)
			print_space
			a_when_part.then_expression.process (Current)
		end

	process_when_expression_list (a_list: ET_WHEN_EXPRESSION_LIST)
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			nb := a_list.count
			from i := 1 until i > nb loop
				if i /= 1 then
					print_space
				end
				a_list.item (i).process (Current)
				process_comments
				i := i + 1
			end
		end

	process_when_compound (a_when_part: ET_WHEN_COMPOUND)
			-- Process `a_when_part'.
		do
			a_when_part.choices.process (Current)
			print_space
			if attached a_when_part.then_compound as l_then_compound then
				l_then_compound.process (Current)
			else
				tokens.then_keyword.process (Current)
			end
		end

	process_when_compound_list (a_list: ET_WHEN_COMPOUND_LIST)
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

	process_writable (a_writable: ET_WRITABLE)
			-- Process `a_writable'.
		require
			a_writable_not_void: a_writable /= Void
		do
			if attached {ET_IDENTIFIER} a_writable as l_identifier and then l_identifier.is_feature_name then
				set_current_target
				process_feature_name_in_writable (l_identifier)
				set_target (Void)
			else
				a_writable.process (Current)
			end
		end

feature {NONE} -- Printing

	print_character (c: CHARACTER)
			-- Print character `c'.
			-- Print indentation first if not done yet.
		do
			if not indentation_printed then
				print_indentation
			end
			put_character (c)
			comment_printed := False
		end

	print_space
			-- Print space character, unless a comment had just been printed.
		do
			if not comment_printed then
				print_character (' ')
			end
			comment_printed := False
		end

	print_string (s: STRING)
			-- Print string `s'.
			-- Print indentation first if not done yet.
		require
			s_not_void: s /= Void
		do
			if not indentation_printed then
				print_indentation
			end
			put_string (s)
			comment_printed := False
		end

	print_lowercase_string (s: STRING)
			-- Print lower-case version of string `s'.
			-- Print indentation first if not done yet.
		require
			s_not_void: s /= Void
		local
			i, nb: INTEGER
			c: CHARACTER
		do
			if not indentation_printed then
				print_indentation
			end
			nb := s.count
			from i := 1 until i > nb loop
				c := s.item (i)
				if c >= 'A' and c <= 'Z' then
					c := c.as_lower
				end
				put_character (c)
				i := i + 1
			end
			comment_printed := False
		end

	print_uppercase_string (s: STRING)
			-- Print upper-case version of string `s'.
			-- Print indentation first if not done yet.
		require
			s_not_void: s /= Void
		local
			i, nb: INTEGER
			c: CHARACTER
		do
			if not indentation_printed then
				print_indentation
			end
			nb := s.count
			from i := 1 until i > nb loop
				c := s.item (i)
				if c >= 'a' and c <= 'z' then
					c := c.as_upper
				end
				put_character (c)
				i := i + 1
			end
			comment_printed := False
		end

	print_new_line
			-- Print new-line character unless a comment had just been printed.
		do
			if not comment_printed then
				put_new_line
				indentation_printed := False
			end
			comment_printed := False
		end

	put_character (c: CHARACTER)
			-- Print character `c'.
		do
			file.put_character (c)
		end

	put_string (s: STRING)
			-- Print string `s'.
		require
			s_not_void: s /= Void
		do
			file.put_string (s)
		end

	put_new_line
			-- Print new-line character.
		do
			file.put_new_line
		end

	print_alias_string (a_alias_name: ET_ALIAS_NAME)
			-- Print alias string of `a_alias_name`.
		require
			a_alias_name_not_void: a_alias_name /= Void
		do
			print_character ('%"')
			if use_lowercase_feature_names then
				print_lowercase_string (a_alias_name.operator_name)
			else
				print_string (a_alias_name.operator_name)
			end
			print_character ('%"')
			process_break (a_alias_name.alias_string.break)
		end

	print_class_name (a_class_name: ET_CLASS_NAME)
			-- Print `a_class_name'.
		require
			a_class_name_not_void: a_class_name /= Void
		do
			if use_uppercase_class_names then
				print_string (a_class_name.upper_name)
			else
				print_string (a_class_name.name)
			end
			process_break (a_class_name.break)
		end

	print_current (a_current: ET_CURRENT)
			-- Print `a_current'.
		require
			a_current_not_void: a_current /= Void
		do
			if use_lowercase_keywords then
				print_string (tokens.current_keyword.text)
			else
				print_string (a_current.text)
			end
			process_break (a_current.break)
		end

	print_false_constant (a_constant: ET_FALSE_CONSTANT)
			-- Print `a_constant'.
		require
			a_constant_not_void: a_constant /= Void
		do
			if use_lowercase_keywords then
				print_string (tokens.false_keyword.text)
			else
				print_string (a_constant.text)
			end
			process_break (a_constant.break)
		end

	print_feature_name (a_feature_name: ET_IDENTIFIER)
			-- Print `a_feature_name`.
		require
			a_feature_name_not_void: a_feature_name /= Void
		do
			if use_lowercase_feature_names then
				print_lowercase_string (a_feature_name.name)
			else
				print_string (a_feature_name.name)
			end
			process_break (a_feature_name.break)
		end

	print_formal_parameter_name (a_name: ET_IDENTIFIER)
			-- Print formal parameter name `a_name'.
		require
			a_name_not_void: a_name /= Void
		do
			if use_uppercase_class_names then
				print_uppercase_string (a_name.name)
			else
				print_string (a_name.name)
			end
			process_break (a_name.break)
		end

	print_keyword (a_keyword: ET_KEYWORD)
			-- Print `a_keyword`.
		require
			a_keyword_not_void: a_keyword /= Void
		do
			if use_lowercase_keywords then
				print_lowercase_string (a_keyword.text)
			else
				print_string (a_keyword.text)
			end
			process_break (a_keyword.break)
		end

	print_local_name (a_name: ET_IDENTIFIER)
			-- Print `a_name'.
		require
			a_name_not_void: a_name /= Void
		do
			if use_lowercase_local_names then
				print_lowercase_string (a_name.name)
			else
				print_string (a_name.name)
			end
			process_break (a_name.break)
		end

	print_result (an_expression: ET_RESULT)
			-- Print `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		do
			if use_lowercase_keywords then
				print_string (tokens.result_keyword.text)
			else
				print_string (an_expression.text)
			end
			process_break (an_expression.break)
		end

	print_true_constant (a_constant: ET_TRUE_CONSTANT)
			-- Print `a_constant'.
		require
			a_constant_not_void: a_constant /= Void
		do
			if use_lowercase_keywords then
				print_string (tokens.true_keyword.text)
			else
				print_string (a_constant.text)
			end
			process_break (a_constant.break)
		end

	print_void (an_expression: ET_VOID)
			-- Print `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		do
			if use_lowercase_keywords then
				print_string (tokens.void_keyword.text)
			else
				print_string (an_expression.text)
			end
			process_break (an_expression.break)
		end

feature {NONE} -- Indentation

	print_indentation
			-- Print indentation to `file'.
		local
			i, nb: INTEGER
		do
			nb := indentation
			from i := 1 until i > nb loop
				put_character ('%T')
				i := i + 1
			end
			indentation_printed := True
			comment_printed := False
		end

	indentation_printed: BOOLEAN
			-- Has indentation already been printed on the current line?

feature {NONE} -- Comments

	print_comment_text (a_comment: STRING)
			-- Print comment held in `a_comment', followed by a new-line.
		require
			a_comment_not_void: a_comment /= Void
			a_comment_has_comment: a_comment.has ('-')
		local
			i, nb: INTEGER
			c: CHARACTER
			l_in_comment: BOOLEAN
		do
			comment_printed := False
			nb := a_comment.count
			from i := 1 until i > nb loop
				c := a_comment.item (i)
				inspect c
				when ' ', '%T', '%R' then
					if l_in_comment then
						print_character (c)
					end
				when '%N' then
					if l_in_comment then
						print_new_line
						l_in_comment := False
					end
				when '-' then
					if not l_in_comment then
						if i = 1 or else a_comment.item (i - 1) /= '%N' then
								-- This comment does not appear at the beginning of a line.
						elseif i + 2 > nb or else a_comment.item (i + 2) /= '%T' then
								-- The two dashes are not followed by a tab.
						else
								-- This looks like code that has been commented out
								-- (either manually or using EiffelStudio).
								-- Do not indent this comment.
							indentation_printed := True
						end
					end
					print_character (c)
					l_in_comment := True
				else
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

	print_comment (a_break: ET_BREAK)
			-- Print comment held in `a_break', followed by a new-line.
		require
			a_break_not_void: a_break /= Void
			a_break_has_comment: a_break.has_comment
		do
			print_comment_text (a_break.text)
		end

	print_indented_comment (a_break: ET_BREAK)
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
				print_comment_text (empty_comment)
			end
			print_comment (a_break)
			dedent
		end

	print_indented_comments (a_comments: DS_ARRAYED_LIST [ET_BREAK])
			-- Print each comment in `a_comments' on their own line (go to
			-- next line if necessary), with an extra indentation level.
			-- Comments are followed by a new-line.
		require
			a_comments_not_void: a_comments /= Void
			no_void_comment: not a_comments.has_void
			all_comments: a_comments.for_all (agent {ET_BREAK}.has_comment)
		do
			a_comments.do_all (agent print_indented_comment)
		end

	print_comments_on_same_line (a_comments: DS_ARRAYED_LIST [ET_BREAK])
			-- If `a_comments' is not empty, then print a space followed by
			-- the first comment on the current line. The remaining comments
			-- are printed on their own line, with an extra indentation level.
			-- Comments are followed by a new-line.
		require
			a_comments_not_void: a_comments /= Void
			no_void_comment: not a_comments.has_void
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

feature {NONE} -- Call targets

	set_target (a_target: detachable ET_EXPRESSION)
			-- Set target to be used when processing a feature name.
		do
		end

	set_current_target
			-- Set 'Current' as target to be used when processing a feature name.
		do
		end

	set_target_type (a_type: detachable ET_TYPE)
			-- Set target type to be used when processing a feature name.
		do
		end

	set_target_with_seeded_feature (a_target: detachable ET_EXPRESSION; a_seed: INTEGER)
			-- Set target to be used when processing a feature name.
			-- In case the type of `a_target` is a formal parameter, choose
			-- one of its constraints adapted base classes containing a
			-- feature with seed `a_seed' (or any of the constraints if
			-- none contains such feature).
		do
		end

	set_target_type_with_seeded_feature (a_type: detachable ET_TYPE; a_seed: INTEGER)
			-- Set target type to be used when processing a feature name.
			-- In case of a formal parameter, choose one of its constraints
			-- adapted base classes containing a feature with seed `a_seed'
			-- (or any of the constraints if none contains such feature).
		do
		end

feature {NONE} -- Constants

	empty_comment: STRING = "--"
			-- Empty comment

invariant

	file_not_void: file /= Void
	file_is_open_write: file.is_open_write
	comment_finder_not_void: comment_finder /= Void
	comment_list_not_void: comment_list /= Void
	no_void_comment: not comment_list.has_void
	all_comments: comment_list.for_all (agent {ET_BREAK}.has_comment)

end
