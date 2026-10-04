note

	description:

		"Eiffel pretty printers which also build browsable information"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2026, Eric Bezault and others"
	license: "MIT License"

class ET_BROWSABLE_CLASS_PRETTY_PRINTER

inherit

	ET_AST_TYPED_PRETTY_PRINTER
		redefine
			make,
			reset,
			process_across_keyword_in_across_expression,
			process_argument_name,
			process_assign_symbol_in_assigner_instruction,
			process_attached_keyword_in_object_test,
			process_class,
			process_class_mark_in_class,
			process_class_name_in_creation_region,
			process_current,
			process_current_in_current_address,
			process_current_in_like_current,
			process_extended_feature_name_of_feature,
			process_external_keyword_in_class,
			process_false_constant,
			process_feature_name_in_assigner,
			process_feature_name_in_call_agent,
			process_feature_name_in_constraint_creator,
			process_feature_name_in_creation_call,
			process_feature_name_in_creator,
			process_feature_name_in_feature_address,
			process_feature_name_in_feature_export,
			process_feature_name_in_like_feature,
			process_feature_name_in_old_rename,
			process_feature_name_in_parent_clause,
			process_feature_name_in_qualified_call,
			process_feature_name_in_qualified_like_identifier,
			process_feature_name_in_static_call,
			process_feature_name_in_unqualified_call,
			process_feature_name_in_writable,
			process_inline_separate_argument_name,
			process_iteration_item_name,
			process_keyword,
			process_keyword_in_keyword_expression,
			process_local_name,
			process_name_of_client,
			process_name_of_current_class,
			process_name_of_formal_parameter,
			process_name_of_formal_parameter_type,
			process_name_of_named_class,
			process_name_of_precursor_parent_class,
			process_new_name_of_rename,
			process_object_test_local_name,
			process_old_keyword_in_old_expression,
			process_once_keyword_in_once_manifest_string,
			process_operator,
			process_precursor_keyword,
			process_query_type,
			process_result,
			process_result_in_result_address,
			process_true_constant,
			process_tuple_label_in_tuple_type,
			process_unqualified_feature_name,
			process_void,
			put_character,
			put_string,
			put_new_line,
			set_target,
			set_current_target,
			set_target_type,
			set_target_with_seeded_feature,
			set_target_type_with_seeded_feature
		end

create

	make,
	make_null

feature {NONE} -- Initialization

	make (a_file: like file; a_system_processor: like system_processor)
			-- Create a new browsable pretty printer, using `a_file' as output file.
		do
			precursor (a_file, a_system_processor)
			line := 1
			column := 1
		end

feature -- Initialization

	reset
			-- Reset for another browsable pretty-printing.
		do
			precursor
			last_browsable_class := Void
			line := 1
			column := 1
		end

feature -- Access

	last_browsable_class: detachable ET_BROWSABLE_CLASS
			-- Last browsable class built

feature {ET_AST_NODE} -- Processing

	process_across_keyword_in_across_expression (a_across_keyword: ET_KEYWORD; a_expression: ET_ACROSS_EXPRESSION)
			-- Process `a_across_keyword` when it appears in `a_expression`.
		local
			l_range: ET_RANGE
			l_browsable_name: ET_BROWSABLE_NAME
		do
			if attached last_browsable_class as l_last_browsable_class then
				print_indentation_if_needed
				create l_range.make_start_position (line, column)
				precursor (a_across_keyword, a_expression)
				l_range.set_end_position (line, column)
				create {ET_BROWSABLE_KEYWORD} l_browsable_name.make (a_across_keyword, current_closure, current_class)
				l_browsable_name.set_only_query_expected (True)
				l_last_browsable_class.browsable_names.force_last (l_browsable_name, l_range)
			else
				precursor (a_across_keyword, a_expression)
			end
		end

	process_argument_name (a_identifier: ET_IDENTIFIER; a_is_declaration: BOOLEAN)
			-- Process `a_identifier'.
		local
			l_range: ET_RANGE
			l_browsable_name: ET_BROWSABLE_NAME
		do
			if attached last_browsable_class as l_last_browsable_class then
				print_indentation_if_needed
				create l_range.make_start_position (line, column)
				precursor (a_identifier, a_is_declaration)
				l_range.set_end_position (line, column)
				create {ET_BROWSABLE_ARGUMENT_NAME} l_browsable_name.make (a_identifier, current_closure, current_class)
				l_last_browsable_class.browsable_names.force_last (l_browsable_name, l_range)
				if a_is_declaration then
					l_browsable_name.set_completion_disabled (True)
					l_last_browsable_class.declaration_ranges.force_last (l_range, a_identifier)
				end
			else
				precursor (a_identifier, a_is_declaration)
			end
		end

	process_assign_symbol_in_assigner_instruction (a_assign_symbol: ET_SYMBOL; a_instruction: ET_ASSIGNER_INSTRUCTION)
			-- Process `a_assign_symbol` when it appears in `a_instruction`.
		local
			l_call_name: ET_IDENTIFIER
			l_position: ET_POSITION
			l_range: ET_RANGE
			l_browsable_name: ET_BROWSABLE_NAME
		do
			if attached last_browsable_class as l_last_browsable_class and attached target_type as l_target_type then
				print_indentation_if_needed
				create l_range.make_start_position (line, column)
				a_assign_symbol.process (Current)
				l_range.set_end_position (line, column)
				create l_call_name.make (a_assign_symbol.text)
				l_call_name.set_seed (a_instruction.name.seed)
				l_call_name.set_feature_name (True)
				l_position := a_assign_symbol.first_position
				l_call_name.set_position (l_position.line, l_position.column)
				create {ET_BROWSABLE_QUALIFIED_CALL_NAME} l_browsable_name.make (l_call_name, l_target_type, current_class)
				l_last_browsable_class.browsable_names.force_last (l_browsable_name, l_range)
			else
				a_assign_symbol.process (Current)
			end
		end

	process_attached_keyword_in_object_test (a_attached_keyword: ET_KEYWORD; a_object_test: ET_OBJECT_TEST)
			-- Process `a_attached_keyword` when it appears in `a_object_test`.
		local
			l_range: ET_RANGE
			l_browsable_name: ET_BROWSABLE_NAME
		do
			if attached last_browsable_class as l_last_browsable_class then
				print_indentation_if_needed
				create l_range.make_start_position (line, column)
				precursor (a_attached_keyword, a_object_test)
				l_range.set_end_position (line, column)
				create {ET_BROWSABLE_KEYWORD} l_browsable_name.make (a_attached_keyword, current_closure, current_class)
				l_browsable_name.set_only_query_expected (True)
				l_last_browsable_class.browsable_names.force_last (l_browsable_name, l_range)
			else
				precursor (a_attached_keyword, a_object_test)
			end
		end
		
	process_class (a_class: ET_CLASS)
			-- Process `a_class'.
		do
			if not use_as_type then
				create last_browsable_class.make
			end
			precursor (a_class)
		end

	process_class_mark_in_class (a_class_mark: ET_CLASS_MARK; a_class: ET_CLASS)
			-- Process `a_class_mark` when it appears in `a_class`.
		local
			l_range: ET_RANGE
			l_browsable_name: ET_BROWSABLE_NAME
		do
			if attached last_browsable_class as l_last_browsable_class and attached {ET_KEYWORD} a_class.class_mark as l_class_mark then
				print_indentation_if_needed
				create l_range.make_start_position (line, column)
				precursor (l_class_mark, a_class)
				l_range.set_end_position (line, column)
				create {ET_BROWSABLE_KEYWORD} l_browsable_name.make (l_class_mark, current_closure, current_class)
				l_browsable_name.set_completion_disabled (True)
				l_last_browsable_class.browsable_names.force_last (l_browsable_name, l_range)
			else
				precursor (a_class_mark, a_class)
			end
		end

	process_class_name_in_creation_region (a_class_name: ET_CLASS_NAME; a_region: ET_CREATION_REGION)
			-- Process `a_class_name` when it appears in `a_region`.
		local
			l_actual_class: ET_CLASS
			l_range: ET_RANGE
			l_browsable_name: ET_BROWSABLE_NAME
		do
			l_actual_class := current_class.universe.master_class (a_class_name).actual_class
			if attached last_browsable_class as l_last_browsable_class and not l_actual_class.is_unknown then
				print_indentation_if_needed
				create l_range.make_start_position (line, column)
				precursor (a_class_name, a_region)
				l_range.set_end_position (line, column)
				create {ET_BROWSABLE_CLASS_NAME} l_browsable_name.make (a_class_name, l_actual_class, current_class)
				l_browsable_name.set_only_class_name_expected (True)
				l_last_browsable_class.browsable_names.force_last (l_browsable_name, l_range)
			else
				precursor (a_class_name, a_region)
			end
		end

	process_current (a_current: ET_CURRENT)
			-- Process `a_current'.
		local
			l_range: ET_RANGE
			l_browsable_name: ET_BROWSABLE_NAME
		do
			if attached last_browsable_class as l_last_browsable_class then
				print_indentation_if_needed
				create l_range.make_start_position (line, column)
				precursor (a_current)
				l_range.set_end_position (line, column)
				create {ET_BROWSABLE_CURRENT_KEYWORD} l_browsable_name.make (a_current, current_closure, current_class)
				l_browsable_name.set_only_query_expected (True)
				l_last_browsable_class.browsable_names.force_last (l_browsable_name, l_range)
			else
				precursor (a_current)
			end
		end

	process_current_in_current_address (a_current: ET_CURRENT; a_expression: ET_CURRENT_ADDRESS)
			-- Process `a_current' when it appears in `a_expression`.
		local
			l_range: ET_RANGE
			l_browsable_name: ET_BROWSABLE_NAME
		do
			if attached last_browsable_class as l_last_browsable_class then
				print_indentation_if_needed
				create l_range.make_start_position (line, column)
				print_current (a_current)
				l_range.set_end_position (line, column)
				create {ET_BROWSABLE_CURRENT_KEYWORD} l_browsable_name.make (a_current, current_closure, current_class)
				l_browsable_name.set_only_feature_name_expected (True)
				l_last_browsable_class.browsable_names.force_last (l_browsable_name, l_range)
			else
				print_current (a_current)
			end
		end

	process_current_in_like_current (a_current: ET_CURRENT; a_type: ET_LIKE_CURRENT)
			-- Process `a_current' when it appears in `a_type`.
		local
			l_range: ET_RANGE
			l_browsable_name: ET_BROWSABLE_NAME
		do
			if attached last_browsable_class as l_last_browsable_class then
				print_indentation_if_needed
				create l_range.make_start_position (line, column)
				print_current (a_current)
				l_range.set_end_position (line, column)
				create {ET_BROWSABLE_CURRENT_KEYWORD} l_browsable_name.make (a_current, current_closure, current_class)
				l_browsable_name.set_only_feature_name_expected (True)
				l_browsable_name.set_only_query_expected (True)
				l_last_browsable_class.browsable_names.force_last (l_browsable_name, l_range)
			else
				print_current (a_current)
			end
		end

	process_extended_feature_name_of_feature (a_feature: ET_FEATURE)
			-- Process extended feature name of `a_feature'.
		local
			l_extended_feature_name: ET_EXTENDED_FEATURE_NAME
			l_feature_name: ET_FEATURE_NAME
			l_range: ET_RANGE
			l_browsable_name: ET_BROWSABLE_NAME
			l_alias_name: ET_ALIAS_NAME
			i, nb: INTEGER
		do
			if attached last_browsable_class as l_last_browsable_class then
				l_extended_feature_name := a_feature.extended_name
				l_feature_name := l_extended_feature_name.feature_name
				print_indentation_if_needed
				create l_range.make_start_position (line, column)
				l_feature_name.process (Current)
				l_range.set_end_position (line, column)
				create {ET_BROWSABLE_UNQUALIFIED_CALL_NAME} l_browsable_name.make (l_feature_name, a_feature, current_class)
				l_browsable_name.set_completion_disabled (True)
				l_last_browsable_class.browsable_names.force_last (l_browsable_name, l_range)
				if attached l_last_browsable_class.features.value (l_feature_name) as l_feature then
					l_feature.set_feature_name_range (l_range)
				end
				comment_finder.add_excluded_node (l_feature_name)
				if attached l_extended_feature_name.alias_names as l_alias_names and then not l_alias_names.is_empty then
					print_space
					nb := l_alias_names.count
					from i := 1 until i > nb loop
						l_alias_name := l_alias_names.item (i)
						l_alias_name.alias_keyword.process (Current)
						comment_finder.add_excluded_node (l_alias_name.alias_keyword)
						print_space
						print_indentation_if_needed
						create l_range.make_start_position  (line, column)
						print_alias_string (l_alias_name)
						l_range.set_end_position (line, column)
						comment_finder.add_excluded_node (l_alias_name.alias_string)
						create {ET_BROWSABLE_UNQUALIFIED_ALIAS_NAME} l_browsable_name.make (l_alias_name.alias_string, a_feature, current_class)
						l_browsable_name.set_completion_disabled (True)
						l_last_browsable_class.browsable_names.force_last (l_browsable_name, l_range)
						if attached l_alias_name.convert_keyword as l_convert_keyword then
							print_space
							l_convert_keyword.process (Current)
							comment_finder.add_excluded_node (l_convert_keyword)
						end
						if i /= nb then
							print_space
						end
						i := i + 1
					end
				end
				comment_finder.find_comments (l_extended_feature_name, comment_list)
				comment_finder.reset_excluded_nodes
			else
				precursor (a_feature)
			end
		end

	process_external_keyword_in_class (a_external_keyword: ET_KEYWORD; a_class: ET_CLASS)
			-- Process `a_external_keyword` when it appears in `a_class`.
		local
			l_range: ET_RANGE
			l_browsable_name: ET_BROWSABLE_NAME
		do
			if attached last_browsable_class as l_last_browsable_class then
				print_indentation_if_needed
				create l_range.make_start_position (line, column)
				precursor (a_external_keyword, a_class)
				l_range.set_end_position (line, column)
				create {ET_BROWSABLE_KEYWORD} l_browsable_name.make (a_external_keyword, current_closure, current_class)
				l_browsable_name.set_completion_disabled (True)
				l_last_browsable_class.browsable_names.force_last (l_browsable_name, l_range)
			else
				precursor (a_external_keyword, a_class)
			end
		end

	process_false_constant (a_constant: ET_FALSE_CONSTANT)
			-- Process `a_constant'.
		local
			l_range: ET_RANGE
			l_browsable_name: ET_BROWSABLE_NAME
		do
			if attached last_browsable_class as l_last_browsable_class then
				print_indentation_if_needed
				create l_range.make_start_position (line, column)
				precursor (a_constant)
				l_range.set_end_position (line, column)
				create {ET_BROWSABLE_BOOLEAN_KEYWORD} l_browsable_name.make (a_constant, current_closure, current_class)
				l_browsable_name.set_only_query_expected (True)
				l_last_browsable_class.browsable_names.force_last (l_browsable_name, l_range)
			else
				precursor (a_constant)
			end
		end

	process_feature (a_feature: ET_FEATURE)
			-- Process `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		local
			l_range: ET_RANGE
			l_feature: ET_BROWSABLE_FEATURE
		do
			create l_feature.make (a_feature)
			if attached last_browsable_class as l_last_browsable_class then
				l_last_browsable_class.features.force_last (l_feature, a_feature.name)
			end
			print_indentation_if_needed
			create l_range.make_start_position (line, column)
			a_feature.process (Current)
			l_range.set_end_position (line, column)
			l_feature.set_range (l_range)
		end

	process_feature_name_in_assigner (a_feature_name: ET_FEATURE_NAME; a_assigner: ET_ASSIGNER)
			-- Process `a_feature_name' when it appears in `a_assigner`.
		local
			l_range: ET_RANGE
			l_browsable_name: ET_BROWSABLE_NAME
		do
			if attached last_browsable_class as l_last_browsable_class then
				print_indentation_if_needed
				create l_range.make_start_position (line, column)
				precursor (a_feature_name, a_assigner)
				l_range.set_end_position (line, column)
				create {ET_BROWSABLE_UNQUALIFIED_CALL_NAME} l_browsable_name.make (a_feature_name, current_closure, current_class)
				l_browsable_name.set_only_procedure_expected (True)
				l_browsable_name.set_only_feature_name_expected (True)
				l_last_browsable_class.browsable_names.force_last (l_browsable_name, l_range)
			else
				precursor (a_feature_name, a_assigner)
			end
		end

	process_feature_name_in_call_agent (a_feature_name: ET_FEATURE_NAME; a_agent: ET_CALL_AGENT)
			-- Process `a_feature_name' when it appears in `a_agent`.
		local
			l_range: ET_RANGE
			l_browsable_name: ET_BROWSABLE_NAME
		do
			if attached last_browsable_class as l_last_browsable_class and attached target_type as l_target_type then
				print_indentation_if_needed
				create l_range.make_start_position (line, column)
				precursor (a_feature_name, a_agent)
				l_range.set_end_position (line, column)
				create {ET_BROWSABLE_QUALIFIED_CALL_NAME} l_browsable_name.make (a_feature_name, l_target_type, current_class)
				l_last_browsable_class.browsable_names.force_last (l_browsable_name, l_range)
			else
				precursor (a_feature_name, a_agent)
			end
		end

	process_feature_name_in_constraint_creator (a_feature_name: ET_FEATURE_NAME; a_creator: ET_CONSTRAINT_CREATOR)
			-- Process `a_feature_name' when it appears in `a_call`.
		local
			l_range: ET_RANGE
			l_browsable_name: ET_BROWSABLE_NAME
		do
			if attached last_browsable_class as l_last_browsable_class and attached target_type as l_target_type then
				print_indentation_if_needed
				create l_range.make_start_position (line, column)
				precursor (a_feature_name, a_creator)
				l_range.set_end_position (line, column)
				create {ET_BROWSABLE_QUALIFIED_CALL_NAME} l_browsable_name.make (a_feature_name, l_target_type, current_class)
				l_browsable_name.set_only_procedure_expected (True)
				l_browsable_name.set_only_feature_name_expected (True)
				l_browsable_name.set_non_exported_feature_allowed (True)
				l_last_browsable_class.browsable_names.force_last (l_browsable_name, l_range)
			else
				precursor (a_feature_name, a_creator)
			end
		end

	process_feature_name_in_creation_call (a_feature_name: ET_FEATURE_NAME; a_call: ET_CREATION_CALL)
			-- Process `a_feature_name' when it appears in `a_call`.
		local
			l_range: ET_RANGE
			l_browsable_name: ET_BROWSABLE_NAME
		do
			if attached last_browsable_class as l_last_browsable_class and attached target_type as l_target_type then
				print_indentation_if_needed
				create l_range.make_start_position (line, column)
				precursor (a_feature_name, a_call)
				l_range.set_end_position (line, column)
				create {ET_BROWSABLE_QUALIFIED_CALL_NAME} l_browsable_name.make (a_feature_name, l_target_type, current_class)
				l_browsable_name.set_only_creation_procedure_expected (True)
				l_last_browsable_class.browsable_names.force_last (l_browsable_name, l_range)
			else
				precursor (a_feature_name, a_call)
			end
		end

	process_feature_name_in_creator (a_feature_name: ET_FEATURE_NAME; a_creator: ET_CREATOR)
			-- Process `a_feature_name' when it appears in `a_creator`.
		local
			l_range: ET_RANGE
			l_browsable_name: ET_BROWSABLE_NAME
		do
			if attached last_browsable_class as l_last_browsable_class then
				print_indentation_if_needed
				create l_range.make_start_position (line, column)
				precursor (a_feature_name, a_creator)
				l_range.set_end_position (line, column)
				create {ET_BROWSABLE_UNQUALIFIED_CALL_NAME} l_browsable_name.make (a_feature_name, Void, current_class)
				l_browsable_name.set_only_feature_name_expected (True)
				l_browsable_name.set_only_creation_procedure_expected (True)
				l_last_browsable_class.browsable_names.force_last (l_browsable_name, l_range)
			else
				precursor (a_feature_name, a_creator)
			end
		end

	process_feature_name_in_feature_address (a_feature_name: ET_FEATURE_NAME; a_feature_address: ET_FEATURE_ADDRESS)
			-- Process `a_feature_name' when it appears in `a_feature_address`.
		local
			l_range: ET_RANGE
			l_browsable_name: ET_BROWSABLE_NAME
		do
			if attached last_browsable_class as l_last_browsable_class then
				print_indentation_if_needed
				create l_range.make_start_position (line, column)
				precursor (a_feature_name, a_feature_address)
				l_range.set_end_position (line, column)
				create {ET_BROWSABLE_UNQUALIFIED_CALL_NAME} l_browsable_name.make (a_feature_name, current_closure, current_class)
				l_browsable_name.set_only_feature_name_expected (True)
				l_last_browsable_class.browsable_names.force_last (l_browsable_name, l_range)
			else
				precursor (a_feature_name, a_feature_address)
			end
		end

	process_feature_name_in_feature_export (a_feature_name: ET_FEATURE_NAME; a_export: ET_FEATURE_EXPORT)
			-- Process `a_feature_name' when it appears in `a_export`.
		local
			l_range: ET_RANGE
			l_browsable_name: ET_BROWSABLE_NAME
		do
			if attached last_browsable_class as l_last_browsable_class then
				print_indentation_if_needed
				create l_range.make_start_position (line, column)
				precursor (a_feature_name, a_export)
				l_range.set_end_position (line, column)
				create {ET_BROWSABLE_UNQUALIFIED_CALL_NAME} l_browsable_name.make (a_feature_name, Void, current_class)
				l_browsable_name.set_only_feature_name_expected (True)
				l_last_browsable_class.browsable_names.force_last (l_browsable_name, l_range)
			else
				precursor (a_feature_name, a_export)
			end
		end

	process_feature_name_in_like_feature (a_feature_name: ET_FEATURE_NAME; a_type: ET_LIKE_FEATURE)
			-- Process `a_feature_name' when it appears in `a_type`.
		local
			l_range: ET_RANGE
			l_browsable_name: ET_BROWSABLE_NAME
		do
			if attached last_browsable_class as l_last_browsable_class then
				print_indentation_if_needed
				create l_range.make_start_position (line, column)
				precursor (a_feature_name, a_type)
				l_range.set_end_position (line, column)
				create {ET_BROWSABLE_UNQUALIFIED_CALL_NAME} l_browsable_name.make (a_feature_name, current_closure, current_class)
				l_browsable_name.set_only_feature_name_expected (True)
				l_browsable_name.set_only_query_expected (True)
				l_last_browsable_class.browsable_names.force_last (l_browsable_name, l_range)
			else
				precursor (a_feature_name, a_type)
			end
		end

	process_feature_name_in_old_rename (a_feature_name: ET_FEATURE_NAME; a_rename: ET_RENAME)
			-- Process `a_feature_name' when it appears in `a_rename`.
		local
			l_range: ET_RANGE
			l_browsable_name: ET_BROWSABLE_NAME
		do
			if attached last_browsable_class as l_last_browsable_class and attached target_type as l_target_type then
				print_indentation_if_needed
				create l_range.make_start_position (line, column)
				precursor (a_feature_name, a_rename)
				l_range.set_end_position (line, column)
				create {ET_BROWSABLE_QUALIFIED_CALL_NAME} l_browsable_name.make (a_feature_name, l_target_type, current_class)
				l_browsable_name.set_only_feature_name_expected (True)
				l_browsable_name.set_non_exported_feature_allowed (True)
				l_last_browsable_class.browsable_names.force_last (l_browsable_name, l_range)
			else
				precursor (a_feature_name, a_rename)
			end
		end

	process_feature_name_in_parent_clause (a_feature_name: ET_FEATURE_NAME)
			-- Process `a_feature_name' when it appears in undefine/redefine/select
			-- of a parent clause.
		local
			l_range: ET_RANGE
			l_browsable_name: ET_BROWSABLE_NAME
		do
			if attached last_browsable_class as l_last_browsable_class then
				print_indentation_if_needed
				create l_range.make_start_position (line, column)
				precursor (a_feature_name)
				l_range.set_end_position (line, column)
				create {ET_BROWSABLE_UNQUALIFIED_CALL_NAME} l_browsable_name.make (a_feature_name, Void, current_class)
				l_browsable_name.set_only_feature_name_expected (True)
				l_last_browsable_class.browsable_names.force_last (l_browsable_name, l_range)
			else
				precursor (a_feature_name)
			end
		end

	process_feature_name_in_qualified_call (a_feature_name: ET_FEATURE_NAME; a_call: ET_QUALIFIED_FEATURE_CALL)
			-- Process `a_feature_name' when it appears in `a_call`.
		local
			l_range: ET_RANGE
			l_browsable_name: ET_BROWSABLE_NAME
		do
			if attached last_browsable_class as l_last_browsable_class and attached target_type as l_target_type then
				print_indentation_if_needed
				create l_range.make_start_position (line, column)
				precursor (a_feature_name, a_call)
				l_range.set_end_position (line, column)
				if attached {ET_IDENTIFIER} a_feature_name as l_label and then l_label.is_tuple_label then
					create {ET_BROWSABLE_TUPLE_LABEL_NAME} l_browsable_name.make (l_label, l_target_type, current_class)
				else
					create {ET_BROWSABLE_QUALIFIED_CALL_NAME} l_browsable_name.make (a_feature_name, l_target_type, current_class)
				end
				l_browsable_name.set_only_query_expected (attached {ET_EXPRESSION} a_call)
				l_last_browsable_class.browsable_names.force_last (l_browsable_name, l_range)
			else
				precursor (a_feature_name, a_call)
			end
		end

	process_feature_name_in_qualified_like_identifier (a_feature_name: ET_FEATURE_NAME; a_type: ET_QUALIFIED_LIKE_IDENTIFIER)
			-- Process `a_feature_name' when it appears in `a_type`.
		local
			l_range: ET_RANGE
			l_browsable_name: ET_BROWSABLE_NAME
		do
			if attached last_browsable_class as l_last_browsable_class and attached target_type as l_target_type then
				print_indentation_if_needed
				create l_range.make_start_position (line, column)
				precursor (a_feature_name, a_type)
				l_range.set_end_position (line, column)
				create {ET_BROWSABLE_QUALIFIED_CALL_NAME} l_browsable_name.make (a_feature_name, l_target_type, current_class)
				l_browsable_name.set_only_feature_name_expected (True)
				l_browsable_name.set_only_query_expected (True)
				l_last_browsable_class.browsable_names.force_last (l_browsable_name, l_range)
			else
				precursor (a_feature_name, a_type)
			end
		end

	process_feature_name_in_static_call (a_feature_name: ET_FEATURE_NAME; a_call: ET_STATIC_FEATURE_CALL)
			-- Process `a_feature_name' when it appears in `a_call`.
		local
			l_range: ET_RANGE
			l_browsable_name: ET_BROWSABLE_NAME
		do
			if attached last_browsable_class as l_last_browsable_class and attached target_type as l_target_type then
				print_indentation_if_needed
				create l_range.make_start_position (line, column)
				precursor (a_feature_name, a_call)
				l_range.set_end_position (line, column)
				create {ET_BROWSABLE_QUALIFIED_CALL_NAME} l_browsable_name.make (a_feature_name, l_target_type, current_class)
				l_browsable_name.set_only_static_call_expected (True)
					-- Do not call `set_only_query_expected` when `a_call` is an expression
					-- because it could be a once-class creation call.
				l_last_browsable_class.browsable_names.force_last (l_browsable_name, l_range)
			else
				precursor (a_feature_name, a_call)
			end
		end

	process_feature_name_in_unqualified_call (a_feature_name: ET_FEATURE_NAME; a_call: ET_UNQUALIFIED_FEATURE_CALL)
			-- Process `a_feature_name' when it appears in `a_call`.
		local
			l_range: ET_RANGE
			l_browsable_name: ET_BROWSABLE_NAME
		do
			if attached last_browsable_class as l_last_browsable_class then
				print_indentation_if_needed
				create l_range.make_start_position (line, column)
				precursor (a_feature_name, a_call)
				l_range.set_end_position (line, column)
				create {ET_BROWSABLE_UNQUALIFIED_CALL_NAME} l_browsable_name.make (a_call.name, current_closure, current_class)
				l_browsable_name.set_only_query_expected (attached {ET_EXPRESSION} a_call)
				l_last_browsable_class.browsable_names.force_last (l_browsable_name, l_range)
			else
				precursor (a_feature_name, a_call)
			end
		end

	process_feature_name_in_writable (a_feature_name: ET_FEATURE_NAME)
			-- Process `a_feature_name' when it appears in a writable.
		local
			l_range: ET_RANGE
			l_browsable_name: ET_BROWSABLE_NAME
		do
			if attached last_browsable_class as l_last_browsable_class then
				print_indentation_if_needed
				create l_range.make_start_position (line, column)
				precursor (a_feature_name)
				l_range.set_end_position (line, column)
				create {ET_BROWSABLE_UNQUALIFIED_CALL_NAME} l_browsable_name.make (a_feature_name, current_closure, current_class)
					-- Note: only writable!
				l_browsable_name.set_only_query_expected (True)
				l_last_browsable_class.browsable_names.force_last (l_browsable_name, l_range)
			else
				precursor (a_feature_name)
			end
		end

	process_inline_separate_argument_name (a_identifier: ET_IDENTIFIER; a_is_declaration: BOOLEAN)
			-- Process `a_identifier'.
		local
			l_range: ET_RANGE
			l_browsable_name: ET_BROWSABLE_NAME
		do
			if attached last_browsable_class as l_last_browsable_class then
				print_indentation_if_needed
				create l_range.make_start_position (line, column)
				precursor (a_identifier, a_is_declaration)
				l_range.set_end_position (line, column)
				internal_type_context.reset (current_class)
				expression_type_finder.find_expression_type_in_closure (a_identifier, current_closure_impl, current_closure, current_class, internal_type_context, current_universe.detachable_separate_any_type)
				create {ET_BROWSABLE_INLINE_SEPARATE_ARGUMENT_NAME} l_browsable_name.make (a_identifier, internal_type_context.named_type, current_closure_impl, current_class)
				l_last_browsable_class.browsable_names.force_last (l_browsable_name, l_range)
				if a_is_declaration then
					l_browsable_name.set_completion_disabled (True)
					l_last_browsable_class.declaration_ranges.force_last (l_range, a_identifier)
				end
			else
				precursor (a_identifier, a_is_declaration)
			end
		end

	process_iteration_item_name (a_identifier: ET_IDENTIFIER; a_is_declaration: BOOLEAN)
			-- Process `a_identifier'.
		local
			l_range: ET_RANGE
			l_browsable_name: ET_BROWSABLE_NAME
		do
			if attached last_browsable_class as l_last_browsable_class then
				print_indentation_if_needed
				create l_range.make_start_position (line, column)
				precursor (a_identifier, a_is_declaration)
				l_range.set_end_position (line, column)
				internal_type_context.reset (current_class)
				expression_type_finder.find_expression_type_in_closure (a_identifier, current_closure_impl, current_closure, current_class, internal_type_context, current_universe.detachable_separate_any_type)
				create {ET_BROWSABLE_ITERATION_ITEM_NAME} l_browsable_name.make (a_identifier, internal_type_context.named_type, current_closure_impl, current_class)
				l_last_browsable_class.browsable_names.force_last (l_browsable_name, l_range)
				if a_is_declaration then
					l_browsable_name.set_completion_disabled (True)
					l_last_browsable_class.declaration_ranges.force_last (l_range, a_identifier)
				end
			else
				precursor (a_identifier, a_is_declaration)
			end
		end

	process_keyword (a_keyword: ET_KEYWORD)
			-- Process `a_keyword'.
		local
			l_range: ET_RANGE
			l_browsable_name: ET_BROWSABLE_NAME
		do
			if attached last_browsable_class as l_last_browsable_class then
				print_indentation_if_needed
				create l_range.make_start_position (line, column)
				precursor (a_keyword)
				l_range.set_end_position (line, column)
				create {ET_BROWSABLE_KEYWORD} l_browsable_name.make (a_keyword, current_closure, current_class)
				l_last_browsable_class.browsable_names.force_last (l_browsable_name, l_range)
			else
				precursor (a_keyword)
			end
		end

	process_keyword_in_keyword_expression (a_keyword: ET_KEYWORD; a_expression: ET_KEYWORD_EXPRESSION)
			-- Process `a_keyword` when it appears in `a_expression'.
		local
			l_range: ET_RANGE
			l_browsable_name: ET_BROWSABLE_NAME
		do
			if attached last_browsable_class as l_last_browsable_class then
				print_indentation_if_needed
				create l_range.make_start_position (line, column)
				precursor (a_keyword, a_expression)
				l_range.set_end_position (line, column)
				create {ET_BROWSABLE_KEYWORD} l_browsable_name.make (a_keyword, current_closure, current_class)
				l_browsable_name.set_only_query_expected (True)
				l_last_browsable_class.browsable_names.force_last (l_browsable_name, l_range)
			else
				precursor (a_keyword, a_expression)
			end
		end

	process_local_name (a_identifier: ET_IDENTIFIER; a_is_declaration: BOOLEAN)
			-- Process `a_identifier'.
		local
			l_range: ET_RANGE
			l_browsable_name: ET_BROWSABLE_NAME
		do
			if attached last_browsable_class as l_last_browsable_class then
				print_indentation_if_needed
				create l_range.make_start_position (line, column)
				precursor (a_identifier, a_is_declaration)
				l_range.set_end_position (line, column)
				create {ET_BROWSABLE_LOCAL_NAME} l_browsable_name.make (a_identifier, current_closure_impl, current_class)
				l_last_browsable_class.browsable_names.force_last (l_browsable_name, l_range)
				if a_is_declaration then
					l_browsable_name.set_completion_disabled (True)
					l_last_browsable_class.declaration_ranges.force_last (l_range, a_identifier)
				end
			else
				precursor (a_identifier, a_is_declaration)
			end
		end

	process_name_of_client (a_client_name: ET_CLASS_NAME; a_named_class: ET_NAMED_CLASS)
			-- Process `a_client_name' which is the name of `a_named_class'.
		local
			l_actual_class: ET_CLASS
			l_range: ET_RANGE
			l_browsable_name: ET_BROWSABLE_NAME
		do
			l_actual_class := a_named_class.actual_class
			if attached last_browsable_class as l_last_browsable_class and not l_actual_class.is_unknown then
				print_indentation_if_needed
				create l_range.make_start_position (line, column)
				print_class_name (a_client_name)
				l_range.set_end_position (line, column)
				create {ET_BROWSABLE_CLASS_NAME} l_browsable_name.make (a_client_name, l_actual_class, current_class)
				l_browsable_name.set_only_class_name_expected (True)
				l_last_browsable_class.browsable_names.force_last (l_browsable_name, l_range)
			else
				print_class_name (a_client_name)
			end
		end

	process_name_of_current_class (a_class_name: ET_CLASS_NAME; a_class: ET_CLASS)
			-- Process `a_class_name' which is the name of current class `a_class'.
		local
			l_range: ET_RANGE
			l_browsable_name: ET_BROWSABLE_NAME
		do
			if attached last_browsable_class as l_last_browsable_class and not a_class.is_unknown then
				print_indentation_if_needed
				create l_range.make_start_position (line, column)
				print_class_name (a_class_name)
				l_range.set_end_position (line, column)
				create {ET_BROWSABLE_CLASS_NAME} l_browsable_name.make (a_class_name, a_class, current_class)
				l_browsable_name.set_completion_disabled (True)
				l_last_browsable_class.browsable_names.force_last (l_browsable_name, l_range)
				l_last_browsable_class.set_class_name_range (l_range)
			else
				print_class_name (a_class_name)
			end
		end

	process_name_of_formal_parameter (a_parameter: ET_FORMAL_PARAMETER)
			-- Process name of formal parameter `a_parameter'.
		local
			l_index: INTEGER
			l_range: ET_RANGE
			l_browsable_name: ET_BROWSABLE_NAME
		do
			l_index := a_parameter.index
			if
				attached last_browsable_class as l_last_browsable_class and
				attached current_class.formal_parameters as l_formal_parameters and then
				(l_index >= 1 and l_index <= l_formal_parameters.count)
			then
				print_indentation_if_needed
				create l_range.make_start_position (line, column)
				print_formal_parameter_name (a_parameter.name)
				l_range.set_end_position (line, column)
				create {ET_BROWSABLE_FORMAL_PARAMETER_NAME} l_browsable_name.make (a_parameter.name, l_formal_parameters.formal_parameter (l_index), current_class)
				l_browsable_name.set_completion_disabled (True)
				l_last_browsable_class.browsable_names.force_last (l_browsable_name, l_range)
				l_last_browsable_class.declaration_ranges.force_last (l_range, a_parameter.name)
			else
				print_formal_parameter_name (a_parameter.name)
			end
		end

	process_name_of_formal_parameter_type (a_parameter: ET_FORMAL_PARAMETER_TYPE)
			-- Process name of formal parameter `a_parameter'.
		local
			l_index: INTEGER
			l_range: ET_RANGE
			l_browsable_name: ET_BROWSABLE_NAME
		do
			l_index := a_parameter.index
			if
				attached last_browsable_class as l_last_browsable_class and
				attached current_class.formal_parameters as l_formal_parameters and then
				(l_index >= 1 and l_index <= l_formal_parameters.count)
			then
				print_indentation_if_needed
				create l_range.make_start_position (line, column)
				precursor (a_parameter)
				l_range.set_end_position (line, column)
				create {ET_BROWSABLE_FORMAL_PARAMETER_NAME} l_browsable_name.make (a_parameter.name, l_formal_parameters.formal_parameter (l_index), current_class)
				l_last_browsable_class.browsable_names.force_last (l_browsable_name, l_range)
			else
				precursor (a_parameter)
			end
		end

	process_name_of_named_class (a_class_name: ET_CLASS_NAME; a_named_class: ET_NAMED_CLASS)
			-- Process `a_class_name' which is the name of `a_named_class'.
		local
			l_actual_class: ET_CLASS
			l_range: ET_RANGE
			l_browsable_name: ET_BROWSABLE_NAME
		do
			l_actual_class := a_named_class.actual_class
			if attached last_browsable_class as l_last_browsable_class and not l_actual_class.is_unknown then
				print_indentation_if_needed
				create l_range.make_start_position (line, column)
				precursor (a_class_name, a_named_class)
				l_range.set_end_position (line, column)
				create {ET_BROWSABLE_CLASS_NAME} l_browsable_name.make (a_class_name, l_actual_class, current_class)
				l_last_browsable_class.browsable_names.force_last (l_browsable_name, l_range)
			else
				precursor (a_class_name, a_named_class)
			end
		end

	process_name_of_precursor_parent_class (a_class_name: ET_CLASS_NAME; a_class: ET_CLASS)
			-- Process `a_class_name' which is the name of precursor parent class `a_class'.
		local
			l_range: ET_RANGE
			l_browsable_name: ET_BROWSABLE_NAME
		do
			if attached last_browsable_class as l_last_browsable_class and not a_class.is_unknown then
				print_indentation_if_needed
				create l_range.make_start_position (line, column)
				print_class_name (a_class_name)
				l_range.set_end_position (line, column)
				create {ET_BROWSABLE_CLASS_NAME} l_browsable_name.make (a_class_name, a_class, current_class)
				l_browsable_name.set_only_class_name_expected (True)
				l_last_browsable_class.browsable_names.force_last (l_browsable_name, l_range)
			else
				print_class_name (a_class_name)
			end
		end

	process_new_name_of_rename (a_rename: ET_RENAME)
			-- Process new name of `a_rename'.
		local
			l_extended_feature_name: ET_EXTENDED_FEATURE_NAME
			l_feature_name: ET_FEATURE_NAME
			l_range: ET_RANGE
			l_browsable_name: ET_BROWSABLE_NAME
			l_alias_name: ET_ALIAS_NAME
			i, nb: INTEGER
		do
			if attached last_browsable_class as l_last_browsable_class then
				l_extended_feature_name := a_rename.new_name
				l_feature_name := l_extended_feature_name.feature_name
				print_indentation_if_needed
				create l_range.make_start_position (line, column)
				l_feature_name.process (Current)
				l_range.set_end_position (line, column)
				create {ET_BROWSABLE_UNQUALIFIED_CALL_NAME} l_browsable_name.make (l_feature_name, Void, current_class)
				l_browsable_name.set_completion_disabled (True)
				l_last_browsable_class.browsable_names.force_last (l_browsable_name, l_range)
				comment_finder.add_excluded_node (l_feature_name)
				if attached l_extended_feature_name.alias_names as l_alias_names and then not l_alias_names.is_empty then
					print_space
					nb := l_alias_names.count
					from i := 1 until i > nb loop
						l_alias_name := l_alias_names.item (i)
						l_alias_name.alias_keyword.process (Current)
						comment_finder.add_excluded_node (l_alias_name.alias_keyword)
						print_space
						print_indentation_if_needed
						create l_range.make_start_position  (line, column)
						print_alias_string (l_alias_name)
						l_range.set_end_position (line, column)
						comment_finder.add_excluded_node (l_alias_name.alias_keyword)
						create {ET_BROWSABLE_UNQUALIFIED_ALIAS_NAME} l_browsable_name.make (l_alias_name.alias_string, Void, current_class)
						l_browsable_name.set_completion_disabled (True)
						l_last_browsable_class.browsable_names.force_last (l_browsable_name, l_range)
						if attached l_alias_name.convert_keyword as l_convert_keyword then
							print_space
							l_convert_keyword.process (Current)
							comment_finder.add_excluded_node (l_convert_keyword)
						end
						if i /= nb then
							print_space
						end
						i := i + 1
					end
				end
				comment_finder.find_comments (l_extended_feature_name, comment_list)
				comment_finder.reset_excluded_nodes
			else
				precursor (a_rename)
			end
		end

	process_object_test_local_name (a_identifier: ET_IDENTIFIER; a_is_declaration: BOOLEAN)
			-- Process `a_identifier'.
		local
			l_range: ET_RANGE
			l_browsable_name: ET_BROWSABLE_NAME
		do
			if attached last_browsable_class as l_last_browsable_class then
				print_indentation_if_needed
				create l_range.make_start_position (line, column)
				precursor (a_identifier, a_is_declaration)
				l_range.set_end_position (line, column)
				internal_type_context.reset (current_class)
				expression_type_finder.find_expression_type_in_closure (a_identifier, current_closure_impl, current_closure, current_class, internal_type_context, current_universe.detachable_separate_any_type)
				create {ET_BROWSABLE_OBJECT_TEST_LOCAL_NAME} l_browsable_name.make (a_identifier, internal_type_context.named_type, current_closure_impl, current_class)
				l_last_browsable_class.browsable_names.force_last (l_browsable_name, l_range)
				if a_is_declaration then
					l_browsable_name.set_completion_disabled (True)
					l_last_browsable_class.declaration_ranges.force_last (l_range, a_identifier)
				end
			else
				precursor (a_identifier, a_is_declaration)
			end
		end

	process_old_keyword_in_old_expression (a_old_keyword: ET_KEYWORD; a_expression: ET_OLD_EXPRESSION)
			-- Process `a_acrosa_old_keywords_keyword` when it appears in `a_expression`.
		local
			l_range: ET_RANGE
			l_browsable_name: ET_BROWSABLE_NAME
		do
			if attached last_browsable_class as l_last_browsable_class then
				print_indentation_if_needed
				create l_range.make_start_position (line, column)
				precursor (a_old_keyword, a_expression)
				l_range.set_end_position (line, column)
				create {ET_BROWSABLE_KEYWORD} l_browsable_name.make (a_old_keyword, current_closure, current_class)
				l_browsable_name.set_only_query_expected (True)
				l_last_browsable_class.browsable_names.force_last (l_browsable_name, l_range)
			else
				precursor (a_old_keyword, a_expression)
			end
		end

	process_once_keyword_in_once_manifest_string (a_once_keyword: ET_KEYWORD; a_expression: ET_ONCE_MANIFEST_STRING)
			-- Process `a_once_keyword` when it appears in `a_expression`.
		local
			l_range: ET_RANGE
			l_browsable_name: ET_BROWSABLE_NAME
		do
			if attached last_browsable_class as l_last_browsable_class then
				print_indentation_if_needed
				create l_range.make_start_position (line, column)
				precursor (a_once_keyword, a_expression)
				l_range.set_end_position (line, column)
				create {ET_BROWSABLE_KEYWORD} l_browsable_name.make (a_once_keyword, current_closure, current_class)
				l_browsable_name.set_only_query_expected (True)
				l_last_browsable_class.browsable_names.force_last (l_browsable_name, l_range)
			else
				precursor (a_once_keyword, a_expression)
			end
		end

	process_operator (a_operator: ET_OPERATOR)
			-- Process `a_operator`.
		local
			l_range: ET_RANGE
			l_browsable_name: ET_BROWSABLE_NAME
		do
			if attached last_browsable_class as l_last_browsable_class and attached target_type as l_target_type then
				print_indentation_if_needed
				create l_range.make_start_position (line, column)
				precursor (a_operator)
				l_range.set_end_position (line, column)
				create {ET_BROWSABLE_QUALIFIED_CALL_NAME} l_browsable_name.make (a_operator, l_target_type, current_class)
				l_last_browsable_class.browsable_names.force_last (l_browsable_name, l_range)
			else
				precursor (a_operator)
			end
		end

	process_precursor_keyword (a_keyword: ET_PRECURSOR_KEYWORD)
			-- Process `a_keyword'.
		local
			l_range: ET_RANGE
			l_browsable_name: ET_BROWSABLE_NAME
		do
			if attached last_browsable_class as l_last_browsable_class and attached target_type as l_target_type then
				print_indentation_if_needed
				create l_range.make_start_position (line, column)
				precursor (a_keyword)
				l_range.set_end_position (line, column)
				create {ET_BROWSABLE_PRECURSOR_NAME} l_browsable_name.make (a_keyword, l_target_type, current_closure, current_class)
				l_last_browsable_class.browsable_names.force_last (l_browsable_name, l_range)
			else
				precursor (a_keyword)
			end
		end

	process_query_type (a_query: ET_QUERY_CLOSURE)
			-- Process type of `a_query`.
		local
			l_declared_type: ET_DECLARED_TYPE
			l_type: ET_TYPE
			l_range: ET_RANGE
		do
			if attached last_browsable_class as l_last_browsable_class then
					-- The AST may or may not contain the colon.
					-- So we have to print it explicitly here.
				l_declared_type := a_query.declared_type
				l_type := l_declared_type.type
				tokens.colon_symbol.process (Current)
				comment_finder.add_excluded_node (l_type)
				comment_finder.find_comments (l_declared_type, comment_list)
				comment_finder.reset_excluded_nodes
				print_space
				print_indentation_if_needed
				create l_range.make_start_position (line, column)
				process_type (l_type)
				l_range.set_end_position (line, column)
				l_last_browsable_class.query_type_ranges.force_last (l_range, current_closure)
			else
				precursor (a_query)
			end
		end

	process_result (an_expression: ET_RESULT)
			-- Process `an_expression'.
		local
			l_range: ET_RANGE
			l_browsable_name: ET_BROWSABLE_NAME
		do
			if attached last_browsable_class as l_last_browsable_class then
				print_indentation_if_needed
				create l_range.make_start_position (line, column)
				precursor (an_expression)
				l_range.set_end_position (line, column)
				create {ET_BROWSABLE_RESULT} l_browsable_name.make (an_expression, current_closure, current_class)
				l_browsable_name.set_only_query_expected (True)
				l_last_browsable_class.browsable_names.force_last (l_browsable_name, l_range)
			else
				precursor (an_expression)
			end
		end

	process_result_in_result_address (a_result: ET_RESULT; a_expression: ET_RESULT_ADDRESS)
			-- Process `a_result' when it appears in `a_expression`.
		local
			l_range: ET_RANGE
			l_browsable_name: ET_BROWSABLE_NAME
		do
			if attached last_browsable_class as l_last_browsable_class then
				print_indentation_if_needed
				create l_range.make_start_position (line, column)
				print_result (a_result)
				l_range.set_end_position (line, column)
				create {ET_BROWSABLE_RESULT} l_browsable_name.make (a_result, current_closure, current_class)
				l_browsable_name.set_only_feature_name_expected (True)
				l_last_browsable_class.browsable_names.force_last (l_browsable_name, l_range)
			else
				print_result (a_result)
			end
		end

	process_true_constant (a_constant: ET_TRUE_CONSTANT)
			-- Process `a_constant'.
		local
			l_range: ET_RANGE
			l_browsable_name: ET_BROWSABLE_NAME
		do
			if attached last_browsable_class as l_last_browsable_class then
				print_indentation_if_needed
				create l_range.make_start_position (line, column)
				precursor (a_constant)
				l_range.set_end_position (line, column)
				create {ET_BROWSABLE_BOOLEAN_KEYWORD} l_browsable_name.make (a_constant, current_closure, current_class)
				l_browsable_name.set_only_query_expected (True)
				l_last_browsable_class.browsable_names.force_last (l_browsable_name, l_range)
			else
				precursor (a_constant)
			end
		end

	process_tuple_label_in_tuple_type (a_label: ET_IDENTIFIER; a_tuple_type: ET_BASE_TYPE)
			-- Process `a_label` when it appears in `a_tuple_type`.
		local
			l_range: ET_RANGE
			l_browsable_name: ET_BROWSABLE_NAME
		do
			if attached last_browsable_class as l_last_browsable_class then
				print_indentation_if_needed
				create l_range.make_start_position (line, column)
				precursor (a_label, a_tuple_type)
				l_range.set_end_position (line, column)
				create {ET_BROWSABLE_TUPLE_LABEL_NAME} l_browsable_name.make (a_label, a_tuple_type, current_class)
				l_browsable_name.set_completion_disabled (True)
				l_last_browsable_class.browsable_names.force_last (l_browsable_name, l_range)
				l_last_browsable_class.declaration_ranges.force_last (l_range, a_label)
			else
				precursor (a_label, a_tuple_type)
			end
		end

	process_unqualified_feature_name (a_feature_name: ET_FEATURE_NAME)
			-- Process `a_feature_name'.
		local
			l_range: ET_RANGE
			l_browsable_name: ET_BROWSABLE_NAME
		do
			if attached last_browsable_class as l_last_browsable_class then
				print_indentation_if_needed
				create l_range.make_start_position (line, column)
				precursor (a_feature_name)
				l_range.set_end_position (line, column)
				create {ET_BROWSABLE_UNQUALIFIED_CALL_NAME} l_browsable_name.make (a_feature_name, current_closure, current_class)
				l_last_browsable_class.browsable_names.force_last (l_browsable_name, l_range)
			else
				precursor (a_feature_name)
			end
		end

	process_void (an_expression: ET_VOID)
			-- Process `an_expression'.
		local
			l_range: ET_RANGE
			l_browsable_name: ET_BROWSABLE_NAME
		do
			if attached last_browsable_class as l_last_browsable_class then
				print_indentation_if_needed
				create l_range.make_start_position (line, column)
				precursor (an_expression)
				l_range.set_end_position (line, column)
				create {ET_BROWSABLE_VOID_KEYWORD} l_browsable_name.make (an_expression, current_closure, current_class)
				l_browsable_name.set_only_query_expected (True)
				l_last_browsable_class.browsable_names.force_last (l_browsable_name, l_range)
			else
				precursor (an_expression)
			end
		end

feature {NONE} -- Printing

	put_character (c: CHARACTER)
			-- Print character `c'.
		do
			precursor (c)
			if c = '%N' then
				line := line + 1
				column := 1
			else
				column := column + 1
			end
		end

	put_string (s: STRING)
			-- Print string `s'.
		local
			nb: INTEGER
			l_nb_new_lines: INTEGER
		do
			precursor (s)
			nb := s.count
			l_nb_new_lines := s.occurrences ('%N')
			if l_nb_new_lines > 0 then
				line := line + l_nb_new_lines
				column := nb - s.last_index_of ('%N', nb) + 1
			else
				column := column + nb
			end
		end

	put_new_line
			-- Print new-line character.
		do
			precursor
			column := 1
			line := line + 1
		end

feature {NONE} -- Indentation

	print_indentation_if_needed
			-- Print indentation if not done yet.
		do
			if not indentation_printed then
				print_indentation
			end
		end

feature {NONE} -- Call targets

	target_type: detachable ET_BASE_TYPE
			-- Base type of target when processing a feature name

	set_target (a_target: detachable ET_EXPRESSION)
			-- Set target to be used when processing a feature name.
		local
			l_context: ET_NESTED_TYPE_CONTEXT
			l_target_type: ET_BASE_TYPE
		do
			if a_target = Void then
				target_class := Void
			else
				l_context := internal_type_context
				current_type.copy_to_type_context (l_context)
				expression_type_finder.find_expression_type_in_closure (a_target, current_closure_impl, current_closure, current_class_impl, l_context, current_universe.any_type)
				l_target_type := l_context.base_type
				target_class := l_target_type.base_class
				target_type := l_target_type
			end
		end

	set_current_target
			-- Set 'Current' as target to be used when processing a feature name.
		do
			target_class := current_class
			target_type := current_class
		end

	set_target_type (a_type: detachable ET_TYPE)
			-- Set target type to be used when processing a feature name.
		local
			l_target_type: ET_BASE_TYPE
		do
			if a_type = Void then
				target_class := Void
				target_type := Void
			else
				l_target_type := a_type.base_type (current_type)
				target_class := l_target_type.base_class
				target_type := l_target_type
			end
		end

	set_target_with_seeded_feature (a_target: detachable ET_EXPRESSION; a_seed: INTEGER)
			-- Set target to be used when processing a feature name.
			-- In case the type of `a_target` is a formal parameter, choose
			-- one of its constraints adapted base classes containing a
			-- feature with seed `a_seed' (or any of the constraints if
			-- none contains such feature).
		local
			l_context: ET_NESTED_TYPE_CONTEXT
			l_target_type: ET_BASE_TYPE
		do
			if a_target = Void then
				target_class := Void
			else
				l_context := internal_type_context
				current_type.copy_to_type_context (l_context)
				expression_type_finder.find_expression_type_in_closure (a_target, current_closure_impl, current_closure, current_class_impl, l_context, current_universe.any_type)
				l_target_type := l_context.adapted_base_type_with_seeded_feature (a_seed).base_type
				target_class := l_target_type.base_class
				target_type := l_target_type
			end
		end

	set_target_type_with_seeded_feature (a_type: detachable ET_TYPE; a_seed: INTEGER)
			-- Set target type to be used when processing a feature name.
			-- In case of a formal parameter, choose one of its constraints
			-- adapted base classes containing a feature with seed `a_seed'
			-- (or any of the constraints if none contains such feature).
		local
			l_context: ET_NESTED_TYPE_CONTEXT
			l_target_type: ET_BASE_TYPE
		do
			if a_type = Void then
				target_class := Void
			else
				l_context := internal_type_context
				current_type.copy_to_type_context (l_context)
				l_context.put_last (a_type)
				l_target_type := l_context.adapted_base_type_with_seeded_feature (a_seed).base_type
				target_class := l_target_type.base_class
				target_type := l_target_type
			end
		end

feature {NONE} -- Implementation

	line: INTEGER
			-- Line number of the last character printed so far

	column: INTEGER
			-- Column number of the last character printed so far

invariant

	line_not_negative: line >= 0
	column_not_negative: column >= 0

end
