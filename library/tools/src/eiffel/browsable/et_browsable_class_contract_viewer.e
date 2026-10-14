note

	description:

		"Eiffel AST contract viewers which also build browsable information"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2026, Eric Bezault and others"
	license: "MIT License"

class ET_BROWSABLE_CLASS_CONTRACT_VIEWER

inherit

	ET_AST_CONTRACT_VIEWER
		undefine
			process_across_keyword_in_across_expression,
			process_argument_name,
			process_assign_symbol_in_assigner_instruction,
			process_attached_keyword_in_object_test,
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
		redefine
			make,
			reset,
			process_class,
			process_feature
		end

	ET_BROWSABLE_CLASS_PRETTY_PRINTER
		rename
			process_features as process_exported_features
		undefine
			process_attribute,
			process_class_type,
			process_constant_attribute,
			process_creator_list,
			process_deferred_function,
			process_deferred_procedure,
			process_do_function,
			process_do_procedure,
			process_dotnet_function,
			process_dotnet_procedure,
			process_exported_features,
			process_extended_attribute,
			process_external_function,
			process_external_procedure,
			process_once_function,
			process_once_procedure,
			process_tuple_type,
			process_type,
			process_unique_attribute
		redefine
			make,
			reset,
			process_class,
			process_feature
		end

create

	make,
	make_null

feature {NONE} -- Initialization

	make (a_file: like file; a_system_processor: like system_processor)
			-- Create a new browasable contract viewer.
		do
			precursor {ET_AST_CONTRACT_VIEWER} (a_file, a_system_processor)
			line := 1
			column := 1
		end

feature -- Initialization

	reset
			-- Reset for another browsable contract viewing.
		do
			precursor {ET_AST_CONTRACT_VIEWER}
			last_browsable_class := Void
			line := 1
			column := 1
		end

feature {ET_AST_NODE} -- Processing

	process_class (a_class: ET_CLASS)
			-- Process `a_class'.
		do
			if not use_as_type then
				create last_browsable_class.make
			end
			precursor {ET_AST_CONTRACT_VIEWER} (a_class)
		end

	process_feature (a_feature: ET_FEATURE)
			-- Process `a_feature'.
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
			precursor {ET_AST_CONTRACT_VIEWER} (a_feature)
			l_range.set_end_position (line, column)
			l_feature.set_range (l_range)
		end

end
