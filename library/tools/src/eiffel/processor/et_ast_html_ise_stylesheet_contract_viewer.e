note

	description:

		"Eiffel AST contract viewers to HTML with ISE stylesheet."

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2026, Eric Bezault and others"
	license: "MIT License"

class ET_AST_HTML_ISE_STYLESHEET_CONTRACT_VIEWER

inherit

	ET_AST_CONTRACT_VIEWER
		undefine
			process_argument_name,
			process_c1_character_constant_without_cast_type,
			process_c2_character_constant_without_cast_type,
			process_c3_character_constant_without_cast_type,
			process_class_name_in_creation_region,
			process_current,
			process_current_in_current_address,
			process_current_in_like_current,
			process_extended_feature_name_of_feature,
			process_false_constant,
			process_feature_name,
			process_formal_parameter_type,
			process_inline_separate_argument_name,
			process_integer_constant_without_cast_type,
			process_iteration_item_name,
			process_keyword,
			process_local_name,
			process_name_of_client,
			process_name_of_current_class,
			process_name_of_formal_parameter,
			process_name_of_formal_parameter_type,
			process_name_of_named_class,
			process_name_of_precursor_parent_class,
			process_new_name_of_rename,
			process_note_tag,
			process_object_test_local_name,
			process_precursor_keyword,
			process_real_constant_without_cast_type,
			process_regular_manifest_string_without_cast_type,
			process_result,
			process_result_in_result_address,
			process_special_manifest_string_without_cast_type,
			process_symbol,
			process_tag,
			process_true_constant,
			process_tuple_label,
			process_verbatim_string_without_cast_type,
			process_void,
			print_string,
			print_comment_text,
			put_character
		redefine
			make
		end

	ET_AST_HTML_ISE_STYLESHEET_PRINTER
		rename
			process_features as process_exported_features
		undefine
			reset,
			process_attribute,
			process_class,
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
			feature_href
		end

create

	make,
	make_null

feature {NONE} -- Initialization

	make (a_file: like file; a_system_processor: like system_processor)
			-- Create a new contract viewer to HTML with ISE stylesheet.
		do
			create quoted_feature_name_buffer.make (20)
			create quoted_class_name_buffer.make (20)
			create internal_feature_name.make ("dummy")
			precursor {ET_AST_CONTRACT_VIEWER} (a_file, a_system_processor)
		end

feature -- Mapping

	feature_href (a_feature: ET_FEATURE; a_class: ET_CLASS; a_mapping: attached like feature_mapping): detachable STRING
			-- Href of `a_feature` from `a_class`, using `a_mapping`
		do
			if flat_enabled then
				if attached a_mapping.value (a_class) as l_features then
					Result := l_features.value (a_feature)
				end
			else
				Result := precursor (a_feature, a_class, a_mapping)
			end
		end

end
