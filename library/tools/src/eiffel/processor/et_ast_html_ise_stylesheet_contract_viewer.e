note

	description:

	"[
		Eiffel AST flat contract viewers to HTML with ISE stylesheet.
	]"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2026, Eric Bezault and others"
	license: "MIT License"

class ET_AST_HTML_ISE_STYLESHEET_CONTRACT_VIEWER

inherit

	ET_AST_CONTRACT_VIEWER
		undefine
			process_c1_character_constant_without_cast_type,
			process_c2_character_constant_without_cast_type,
			process_c3_character_constant_without_cast_type,
			process_extended_feature_name_of_feature,
			process_feature_name,
			process_formal_parameter_type,
			process_integer_constant_without_cast_type,
			process_keyword,
			process_name_of_formal_parameter,
			process_name_of_named_class,
			process_new_name_of_rename,
			process_note_tag,
			process_precursor_keyword,
			process_real_constant_without_cast_type,
			process_regular_manifest_string_without_cast_type,
			process_special_manifest_string_without_cast_type,
			process_symbol,
			process_tag,
			process_verbatim_string_without_cast_type,
			process_writable,
			print_character,
			print_string,
			print_comment_text
		redefine
			make,
			process_identifier
		end

	ET_AST_HTML_ISE_STYLESHEET_PRINTER
		undefine
			reset,
			process_alias_name,
			process_assign_feature_name,
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
			process_extended_attribute,
			process_extended_feature_name,
			process_external_function,
			process_external_procedure,
			process_manifest_type,
			process_once_function,
			process_once_procedure,
			process_features,
			process_tuple_type,
			process_type,
			process_unique_attribute
		redefine
			make,
			feature_href,
			process_identifier
		end

create

	make, make_null

feature {NONE} -- Initialization

	make (a_file: like file; a_system_processor: like system_processor)
			-- Create a new flat contract viewer to HTML with ISE stylesheet.
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

feature {ET_AST_NODE} -- Processing

	process_identifier (a_identifier: ET_IDENTIFIER)
			-- Process `a_identifer`.
		local
			l_seed: INTEGER
		do
			l_seed := a_identifier.seed
			if a_identifier.is_argument and then attached {ET_FEATURE} current_closure as l_current_feature and then attached l_current_feature.arguments as l_arguments and then (l_seed >= 1 and l_seed <= l_arguments.count) then
				precursor {ET_AST_HTML_ISE_STYLESHEET_PRINTER} (l_arguments.formal_argument (l_seed).name)
			else
				precursor {ET_AST_HTML_ISE_STYLESHEET_PRINTER} (a_identifier)
			end
		end

end
