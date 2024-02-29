note

	description:

		"XSLT node factory"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004-2018, Colin Adams and others"
	license: "MIT License"

class XM_XSLT_NODE_FACTORY

inherit

	XM_XPATH_NODE_FACTORY
		redefine
			new_element_node
		end

	XM_XPATH_SHARED_NAME_POOL

	XM_XPATH_STANDARD_NAMESPACES

	XM_XPATH_ERROR_TYPES

	XM_XSLT_VALIDATION

	XM_XSLT_STYLE_CONSTANTS
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (an_error_listener: XM_XSLT_ERROR_LISTENER; a_configuration: like configuration)
			-- Establish invariant.
		require
			error_listener_not_void: an_error_listener /= Void
			configuration_not_void: a_configuration /= Void
		do
			error_listener := an_error_listener
			configuration := a_configuration
		ensure
			error_listener_set: error_listener = an_error_listener
			configuration_set: configuration = a_configuration
		end

feature -- Access

	error_listener: XM_XSLT_ERROR_LISTENER
			-- Error listener

feature -- Status report

	is_element_available (a_uri: detachable STRING; a_local_name: STRING): BOOLEAN
			-- Is named element available?
		require
			local_name_not_void: a_local_name /= Void
		local
			a_fingerprint: INTEGER
		do
			if a_uri /= Void then
				if STRING_.same_string (a_uri, Xslt_uri) then
					a_fingerprint := shared_name_pool.fingerprint (a_uri, a_local_name)
					if a_fingerprint /= -1 then
						Result := is_xslt_instruction (a_fingerprint)
					end
				elseif STRING_.same_string (a_uri, Gexslt_eiffel_type_uri) then
					a_fingerprint := shared_name_pool.fingerprint (a_uri, a_local_name)
					inspect
						a_fingerprint
					when Gexslt_memo_function_type_code then
						Result := True
					else
						-- not available
					end
				else
					-- No others are currently available
				end
			end
		end

	is_xslt_instruction (a_fingerprint: INTEGER): BOOLEAN
			-- Does `a_fingerprint' represent an XSLT instruction?
		do
			inspect
				a_fingerprint
			when Xslt_apply_templates_type_code, Xslt_apply_imports_type_code,
				Xslt_next_match_type_code, Xslt_for_each_type_code, Xslt_if_type_code,
				Xslt_choose_type_code, Xslt_variable_type_code, Xslt_call_template_type_code,
				Xslt_element_type_code, Xslt_attribute_type_code, Xslt_text_type_code,
				Xslt_value_of_type_code, Xslt_document_type_code, Xslt_processing_instruction_type_code,
				Xslt_namespace_type_code, Xslt_comment_type_code, Xslt_copy_type_code,
				Xslt_copy_of_type_code, Xslt_sequence_type_code, Xslt_number_type_code,
				Xslt_perform_sort_type_code, Xslt_for_each_group_type_code,
				Xslt_analyze_string_type_code, Xslt_message_type_code, Xslt_fallback_type_code,
				Xslt_result_document_type_code
			 then
				Result := True
			else
				Result := False
			end
		end

feature -- Creation

	new_element_node (a_document: XM_XPATH_TREE_DOCUMENT; a_parent: detachable XM_XPATH_TREE_COMPOSITE_NODE; an_attribute_collection: detachable XM_XPATH_ATTRIBUTE_COLLECTION; a_namespace_list: detachable DS_ARRAYED_LIST [INTEGER];
							a_name_code: INTEGER; a_sequence_number: INTEGER): detachable XM_XPATH_TREE_ELEMENT
			-- New element node.
		local
			a_uri_code, a_child_index: INTEGER
			a_local_name: STRING
			a_style_element: detachable XM_XSLT_STYLE_ELEMENT
			is_top_level_element: BOOLEAN
			an_error: XM_XPATH_ERROR_VALUE
		do
			is_top_level_element := attached {XM_XSLT_STYLESHEET} a_parent
			a_style_element := new_xslt_element (a_document, a_parent, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number)
			if a_style_element /= Void then
				Result := a_style_element
			else
				-- not recognized as an XSLT element
				a_local_name := shared_name_pool.local_name_from_name_code (a_name_code)
				a_uri_code := shared_name_pool.uri_code_from_name_code (a_name_code)
				if a_uri_code = Xslt_uri_code then
					create {XM_XSLT_ABSENT_EXTENSION_ELEMENT} a_style_element.make_style_element (error_listener, a_document, Void, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, configuration)
					a_style_element.flag_as_instruction
					create an_error.make_from_string (STRING_.concat ("Unknown XSLT element: ", a_local_name), Xpath_errors_uri, "XTSE0010", Static_error)
					a_style_element.set_validation_error (an_error, Report_unless_forwards_comptible) -- TODO - only under certain circumstances
					Result := a_style_element
					if a_parent /= Void then a_parent.add_child (Result) end
					a_style_element.process_extension_element_attribute (Extension_element_prefixes_attribute)
					a_style_element.process_excluded_namespaces_attribute (Exclude_result_prefixes_attribute)
					a_style_element.process_version_attribute (Version_attribute, Report_unless_forwards_comptible)
					a_style_element.process_default_xpath_namespace_attribute (Xpath_default_namespace_attribute)
					a_style_element.process_default_collation_attribute (Default_collation_attribute)
				else
					if a_uri_code = Gexslt_uri_code then
						Result := new_gexslt_user_defined_element (a_document, a_parent, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number)
					elseif  is_top_level_element and then a_uri_code /= Default_uri_code then
						-- Unrecognized User-defined Data Elements
						create {XM_XSLT_DATA_ELEMENT} Result.make (a_document, Void, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number)
						if a_parent /= Void then a_parent.add_child (Result) end
					end
					if Result = Void then
						a_style_element := possible_literal_result_element (a_document, a_parent, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number)
						if a_parent /= Void then
							a_child_index := a_style_element.child_index
						end
						if a_style_element.is_extension_instruction_namespace (a_uri_code) then
							-- not a Literal Result Element, but an absent Extension Instruction
							create {XM_XSLT_ABSENT_EXTENSION_ELEMENT} a_style_element.make_style_element (error_listener, a_document, Void, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, configuration)
							a_style_element.flag_as_instruction
							if a_parent /= Void then
								a_parent.replace_child (a_style_element, a_child_index)
							end
							create an_error.make_from_string (STRING_.concat ("Unknown extension element: ", shared_name_pool.display_name_from_name_code (a_name_code)),
								Xpath_errors_uri, "XTDE1450", Static_error)
							a_style_element.set_validation_error (an_error, Report_if_instantiated)
						end
						Result := a_style_element
					end
				end
			end
		end

feature {NONE} -- Implementation

	configuration: XM_XSLT_CONFIGURATION
			-- System configuration

	new_xslt_element (a_document: XM_XPATH_TREE_DOCUMENT; a_parent: detachable XM_XPATH_TREE_COMPOSITE_NODE; an_attribute_collection: detachable XM_XPATH_ATTRIBUTE_COLLECTION; a_namespace_list: detachable DS_ARRAYED_LIST [INTEGER];
							a_name_code: INTEGER; a_sequence_number: INTEGER): detachable XM_XSLT_STYLE_ELEMENT
			-- New XSLT element.
		require
			document_not_void: a_document /= Void
			strictly_positive_sequence_number: a_sequence_number > 0
		local
			a_fingerprint: INTEGER
		do
			a_fingerprint := shared_name_pool.fingerprint_from_name_code (a_name_code)

			inspect
				a_fingerprint
			when Xslt_apply_templates_type_code then
				create {XM_XSLT_APPLY_TEMPLATES} Result.make_style_element (error_listener, a_document, Void, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, configuration)
				Result.flag_as_instruction
			when Xslt_apply_imports_type_code then
				create {XM_XSLT_APPLY_IMPORTS} Result.make_style_element (error_listener, a_document, Void, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, configuration)
				Result.flag_as_instruction
			when Xslt_attribute_type_code then
				create {XM_XSLT_ATTRIBUTE} Result.make_style_element (error_listener, a_document, Void, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, configuration)
				Result.flag_as_instruction
			when Xslt_attribute_set_type_code then
				create {XM_XSLT_ATTRIBUTE_SET} Result.make_style_element (error_listener, a_document, Void, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, configuration)
			when Xslt_analyze_string_type_code then
				create {XM_XSLT_ANALYZE_STRING} Result.make_style_element (error_listener, a_document, Void, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, configuration)
				Result.flag_as_instruction
			when Xslt_call_template_type_code then
				create {XM_XSLT_CALL_TEMPLATE} Result.make_style_element (error_listener, a_document, Void, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, configuration)
				Result.flag_as_instruction
			when Xslt_character_map_type_code then
				create {XM_XSLT_CHARACTER_MAP} Result.make_style_element (error_listener, a_document, Void, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, configuration)
			when Xslt_choose_type_code then
				create {XM_XSLT_CHOOSE} Result.make_style_element (error_listener, a_document, Void, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, configuration)
				Result.flag_as_instruction
			when Xslt_comment_type_code then
				create {XM_XSLT_COMMENT} Result.make_style_element (error_listener, a_document, Void, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, configuration)
				Result.flag_as_instruction
			when Xslt_copy_type_code then
				create {XM_XSLT_COPY} Result.make_style_element (error_listener, a_document, Void, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, configuration)
			when Xslt_copy_of_type_code then
				create {XM_XSLT_COPY_OF} Result.make_style_element (error_listener, a_document, Void, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, configuration)
				Result.flag_as_instruction
			when Xslt_decimal_format_type_code then
				create {XM_XSLT_DECIMAL_FORMAT} Result.make_style_element (error_listener, a_document, Void, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, configuration)
			when Xslt_document_type_code then
				create {XM_XSLT_DOCUMENT} Result.make_style_element (error_listener, a_document, Void, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, configuration)
				Result.flag_as_instruction
			when Xslt_element_type_code then
				create {XM_XSLT_ELEMENT} Result.make_style_element (error_listener, a_document, Void, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, configuration)
			when Xslt_for_each_type_code then
				create {XM_XSLT_FOR_EACH} Result.make_style_element (error_listener, a_document, Void, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, configuration)
				Result.flag_as_instruction
			when Xslt_fallback_type_code then
				create {XM_XSLT_FALLBACK} Result.make_style_element (error_listener, a_document, Void, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, configuration)
				Result.flag_as_instruction
			when Xslt_for_each_group_type_code then
				create {XM_XSLT_FOR_EACH_GROUP} Result.make_style_element (error_listener, a_document, Void, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, configuration)
				Result.flag_as_instruction
			when Xslt_function_type_code then
				create {XM_XSLT_FUNCTION} Result.make_style_element (error_listener, a_document, Void, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, configuration)
			when Xslt_if_type_code then
				create {XM_XSLT_IF} Result.make_style_element (error_listener, a_document, Void, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, configuration)
				Result.flag_as_instruction
			when Xslt_import_schema_type_code then
				create {XM_XSLT_IMPORT_SCHEMA} Result.make_style_element (error_listener, a_document, Void, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, configuration)
			when Xslt_import_type_code then
				create {XM_XSLT_IMPORT} Result.make_style_element (error_listener, a_document, Void, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, configuration)
			when Xslt_include_type_code then
				create {XM_XSLT_INCLUDE} Result.make_style_element (error_listener, a_document, Void, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, configuration)
			when Xslt_key_type_code then
				create {XM_XSLT_KEY} Result.make_style_element (error_listener, a_document, Void, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, configuration)
			when Xslt_matching_substring_type_code then
				create {XM_XSLT_MATCHING_SUBSTRING} Result.make_style_element (error_listener, a_document, Void, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, configuration)
			when Xslt_message_type_code then
				create {XM_XSLT_MESSAGE} Result.make_style_element (error_listener, a_document, Void, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, configuration)
				Result.flag_as_instruction
			when Xslt_namespace_alias_type_code then
				create {XM_XSLT_NAMESPACE_ALIAS} Result.make_style_element (error_listener, a_document, Void, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, configuration)
			when Xslt_namespace_type_code then
				create {XM_XSLT_NAMESPACE} Result.make_style_element (error_listener, a_document, Void, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, configuration)
			when Xslt_next_match_type_code then
				create {XM_XSLT_NEXT_MATCH} Result.make_style_element (error_listener, a_document, Void, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, configuration)
				Result.flag_as_instruction
			when Xslt_non_matching_substring_type_code then
				create {XM_XSLT_NON_MATCHING_SUBSTRING} Result.make_style_element (error_listener, a_document, Void, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, configuration)
			when Xslt_number_type_code then
				create {XM_XSLT_NUMBER} Result.make_style_element (error_listener, a_document, Void, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, configuration)
				Result.flag_as_instruction
			when Xslt_otherwise_type_code then
				create {XM_XSLT_OTHERWISE} Result.make_style_element (error_listener, a_document, Void, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, configuration)
			when Xslt_output_type_code then
				create {XM_XSLT_OUTPUT} Result.make_style_element (error_listener, a_document, Void, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, configuration)
			when Xslt_output_character_type_code then
				create {XM_XSLT_OUTPUT_CHARACTER} Result.make_style_element (error_listener, a_document, Void, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, configuration)
			when Xslt_param_type_code then
				create {XM_XSLT_PARAM} Result.make_style_element (error_listener, a_document, Void, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, configuration)
			when Xslt_perform_sort_type_code then
				create {XM_XSLT_PERFORM_SORT} Result.make_style_element (error_listener, a_document, Void, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, configuration)
				Result.flag_as_instruction
			when Xslt_preserve_space_type_code, Xslt_strip_space_type_code then
				create {XM_XSLT_PRESERVE_SPACE} Result.make_style_element (error_listener, a_document, Void, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, configuration)
			when Xslt_processing_instruction_type_code then
				create {XM_XSLT_PROCESSING_INSTRUCTION} Result.make_style_element (error_listener, a_document, Void, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, configuration)
				Result.flag_as_instruction
			when Xslt_result_document_type_code then
				create {XM_XSLT_RESULT_DOCUMENT} Result.make_style_element (error_listener, a_document, Void, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, configuration)
			when Xslt_sequence_type_code then
				create {XM_XSLT_SEQUENCE} Result.make_style_element (error_listener, a_document, Void, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, configuration)
				Result.flag_as_instruction
			when Xslt_sort_type_code then
				create {XM_XSLT_SORT} Result.make_style_element (error_listener, a_document, Void, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, configuration)
			when Xslt_transform_type_code, Xslt_stylesheet_type_code then
				create {XM_XSLT_STYLESHEET} Result.make_style_element (error_listener, a_document, Void, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, configuration)
			when Xslt_template_type_code then
				create {XM_XSLT_TEMPLATE} Result.make_style_element (error_listener, a_document, Void, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, configuration)
			when Xslt_text_type_code then
				create {XM_XSLT_TEXT} Result.make_style_element (error_listener, a_document, Void, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, configuration)
				Result.flag_as_instruction
			when Xslt_value_of_type_code then
				create {XM_XSLT_VALUE_OF} Result.make_style_element (error_listener, a_document, Void, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, configuration)
				Result.flag_as_instruction
			when Xslt_variable_type_code then
				create {XM_XSLT_VARIABLE} Result.make_style_element (error_listener, a_document, Void, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, configuration)
			when Xslt_when_type_code then
				create {XM_XSLT_WHEN} Result.make_style_element (error_listener, a_document, Void, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, configuration)
			when Xslt_with_param_type_code then
				create {XM_XSLT_WITH_PARAM} Result.make_style_element (error_listener, a_document, Void, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, configuration)
			else
			end
			if Result /= Void then
				if a_parent /= Void then a_parent.add_child (Result) end
				Result.process_extension_element_attribute (Extension_element_prefixes_attribute)
				Result.process_excluded_namespaces_attribute (Exclude_result_prefixes_attribute)
				Result.process_version_attribute (Version_attribute, Report_always)
				Result.process_default_xpath_namespace_attribute (Xpath_default_namespace_attribute)
				Result.process_default_collation_attribute (Default_collation_attribute)
				Result.check_default_collation_name
			end
		end

	possible_literal_result_element (a_document: XM_XPATH_TREE_DOCUMENT; a_parent: detachable XM_XPATH_TREE_COMPOSITE_NODE; an_attribute_collection: detachable XM_XPATH_ATTRIBUTE_COLLECTION; a_namespace_list: detachable DS_ARRAYED_LIST [INTEGER];
							a_name_code: INTEGER; a_sequence_number: INTEGER): XM_XSLT_STYLE_ELEMENT
			-- New literal result element, or extension element.
			-- TODO - add a locator
		require
			document_not_void: a_document /= Void
			strictly_positive_sequence_number: a_sequence_number > 0
		do

			-- TODO, may be an extension element (or fallback)

			create {XM_XSLT_LITERAL_RESULT_ELEMENT} Result.make_style_element (error_listener, a_document, Void, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, configuration)
			Result.flag_as_instruction
			if a_parent /= Void then a_parent.add_child (Result) end
			Result.process_extension_element_attribute (Xslt_extension_element_prefixes_attribute)
			Result.process_excluded_namespaces_attribute (Xslt_exclude_result_prefixes_attribute)
			Result.process_version_attribute (Xslt_version_attribute, Report_unless_forwards_comptible)
			Result.process_default_xpath_namespace_attribute (Xslt_xpath_default_namespace_attribute)
			Result.process_default_collation_attribute (Xslt_default_collation_attribute)
		end

	new_gexslt_user_defined_element (a_document: XM_XPATH_TREE_DOCUMENT; a_parent: detachable XM_XPATH_TREE_COMPOSITE_NODE; an_attribute_collection: detachable XM_XPATH_ATTRIBUTE_COLLECTION; a_namespace_list: detachable DS_ARRAYED_LIST [INTEGER];
							a_name_code: INTEGER; a_sequence_number: INTEGER): detachable XM_XSLT_STYLE_ELEMENT
			-- New gexslt instruction or User-defined Element (or child of latter).
		require
			document_not_void: a_document /= Void
			strictly_positive_sequence_number: a_sequence_number > 0
		local
			a_fingerprint: INTEGER
		do
			a_fingerprint := shared_name_pool.fingerprint_from_name_code (a_name_code)

			inspect
				a_fingerprint
			when Gexslt_collation_type_code then
				create {XM_XSLT_GEXSLT_COLLATION} Result.make_style_element (error_listener, a_document, Void, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, configuration)
			when Gexslt_isolation_level_type_code then
				create {XM_XSLT_GEXSLT_ISOLATION_LEVEL} Result.make_style_element (error_listener, a_document, Void, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, configuration)
			when Gexslt_memo_function_type_code then
				create {XM_XSLT_MEMO_FUNCTION} Result.make_style_element (error_listener, a_document, Void, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, configuration)
			else
			end
			if Result /= Void then
				if a_parent /= Void then a_parent.add_child (Result) end
				Result.process_extension_element_attribute (Xslt_extension_element_prefixes_attribute)
				Result.process_excluded_namespaces_attribute (Xslt_exclude_result_prefixes_attribute)
				Result.process_version_attribute (Xslt_version_attribute, Report_unless_forwards_comptible)
				Result.process_default_xpath_namespace_attribute (Xslt_xpath_default_namespace_attribute)
				Result.process_default_collation_attribute (Xslt_default_collation_attribute)
			end
		end

invariant

	error_listener_not_void: error_listener /= Void
	configuration_not_void: configuration /= Void

end

